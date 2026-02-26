#!/bin/bash
# ╔══════════════════════════════════════════════╗
# ║   Republic AI Testnet — Node Setup Script   ║
# ║   Binary | Full Node + Validator Ready      ║
# ║   Chain: raitestnet_77701-1                 ║
# ╚══════════════════════════════════════════════╝
set -e

# ── MÀU ───────────────────────────────────────────────────
R='\033[0;31m' G='\033[0;32m' Y='\033[1;33m' C='\033[0;36m' B='\033[0;34m' N='\033[0m'

log()  { echo -e "${C}[•]${N} $1"; }
ok()   { echo -e "${G}[✓]${N} $1"; }
warn() { echo -e "${Y}[!]${N} $1"; }
die()  { echo -e "${R}[✗]${N} $1"; exit 1; }

# ── BANNER ────────────────────────────────────────────────
clear
echo -e "${B}"
cat << 'EOF'
  ██████╗ ███████╗██████╗ ██╗   ██╗██████╗ ██╗     ██╗ ██████╗
  ██╔══██╗██╔════╝██╔══██╗██║   ██║██╔══██╗██║     ██║██╔════╝
  ██████╔╝█████╗  ██████╔╝██║   ██║██████╔╝██║     ██║██║
  ██╔══██╗██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗██║     ██║██║
  ██║  ██║███████╗██║     ╚██████╔╝██████╔╝███████╗██║╚██████╗
  ╚═╝  ╚═╝╚══════╝╚═╝      ╚═════╝ ╚═════╝ ╚══════╝╚═╝ ╚═════╝
          AI Testnet Node Setup — raitestnet_77701-1
EOF
echo -e "${N}"

# ── CẤU HÌNH ──────────────────────────────────────────────
CHAIN_ID="raitestnet_77701-1"
REPUBLIC_HOME="$HOME/.republicd"
GENESIS_URL="https://raw.githubusercontent.com/RepublicAI/networks/main/testnet/genesis.json"
SNAP_RPC="https://statesync.republicai.io"
PEERS="e281dc6e4ebf5e32fb7e6c4a111c06f02a1d4d62@3.92.139.74:26656,cfb2cb90a241f7e1c076a43954f0ee6d42794d04@54.173.6.183:26656,dc254b98cebd6383ed8cf2e766557e3d240100a9@54.227.57.160:26656"
GAS_PRICES="250000000arai"

# ── MONIKER ───────────────────────────────────────────────
if [ -n "$1" ]; then
    MONIKER="$1"
else
    echo -e "${Y}Nhập tên node (moniker):${N} \c"
    read -r MONIKER
    [ -z "$MONIKER" ] && die "Moniker không được để trống!"
fi
echo ""

# ── BƯỚC 1: DEPENDENCIES ──────────────────────────────────
log "Cài dependencies..."
sudo apt-get update -qq
sudo apt-get install -y -qq curl jq wget unzip 2>/dev/null
ok "Dependencies OK"

# ── BƯỚC 2: LẤY VERSION MỚI NHẤT & TẢI BINARY ────────────
log "Lấy version mới nhất từ GitHub..."
VERSION=$(curl -s https://api.github.com/repos/RepublicAI/networks/releases/latest | jq -r .tag_name)
[ -z "$VERSION" ] || [ "$VERSION" = "null" ] && die "Không lấy được version!"
ok "Version: $VERSION"

log "Tải republicd ${VERSION}..."
BINARY_URL=$(curl -s https://api.github.com/repos/RepublicAI/networks/releases/latest \
  | jq -r '.assets[] | select(.name == "republicd-linux-amd64") | .browser_download_url')
[ -z "$BINARY_URL" ] && die "Không tìm thấy binary URL!"

curl -fL "$BINARY_URL" -o /tmp/republicd || die "Tải binary thất bại!"
chmod +x /tmp/republicd
sudo mv /tmp/republicd /usr/local/bin/republicd
ok "Binary: $(republicd version 2>/dev/null || echo $VERSION)"

# ── BƯỚC 3: KHỞI TẠO NODE ─────────────────────────────────
log "Init node (moniker: $MONIKER)..."
republicd init "$MONIKER" --chain-id "$CHAIN_ID" --home "$REPUBLIC_HOME" 2>/dev/null
ok "Init xong"

# ── BƯỚC 4: TẢI GENESIS ───────────────────────────────────
log "Tải genesis.json..."
curl -fsSL "$GENESIS_URL" -o "$REPUBLIC_HOME/config/genesis.json" || die "Tải genesis thất bại!"
ok "Genesis OK"

# ── BƯỚC 5: STATE SYNC ────────────────────────────────────
log "Cấu hình State Sync..."
LATEST_HEIGHT=$(curl -s "$SNAP_RPC/block" | jq -r .result.block.header.height 2>/dev/null)
if [ -z "$LATEST_HEIGHT" ] || [ "$LATEST_HEIGHT" = "null" ]; then
    warn "Không lấy được block height, bỏ State Sync — sẽ sync từ block đầu"
else
    BLOCK_HEIGHT=$((LATEST_HEIGHT - 1000))
    TRUST_HASH=$(curl -s "$SNAP_RPC/block?height=$BLOCK_HEIGHT" | jq -r .result.block_id.hash)
    if [ -z "$TRUST_HASH" ] || [ "$TRUST_HASH" = "null" ]; then
        warn "Không lấy được trust hash, bỏ State Sync"
    else
        sed -i.bak -E \
            "s|^(enable[[:space:]]+=[[:space:]]+).*$|\1true|;
             s|^(rpc_servers[[:space:]]+=[[:space:]]+).*$|\1\"$SNAP_RPC,$SNAP_RPC\"|;
             s|^(trust_height[[:space:]]+=[[:space:]]+).*$|\1$BLOCK_HEIGHT|;
             s|^(trust_hash[[:space:]]+=[[:space:]]+).*$|\1\"$TRUST_HASH\"|" \
            "$REPUBLIC_HOME/config/config.toml"
        ok "State Sync: height=$BLOCK_HEIGHT"
    fi
fi

# ── BƯỚC 6: PEERS ─────────────────────────────────────────
log "Set persistent peers..."
sed -i.bak -e "s|^persistent_peers *=.*|persistent_peers = \"$PEERS\"|" \
    "$REPUBLIC_HOME/config/config.toml"
ok "Peers OK"

# ── BƯỚC 7: TỐI ƯU CONFIG ────────────────────────────────
log "Tối ưu cấu hình..."

# Gas price đúng denom: arai
sed -i 's|minimum-gas-prices = ""|minimum-gas-prices = "'"$GAS_PRICES"'"|' \
    "$REPUBLIC_HOME/config/app.toml" 2>/dev/null || true

# Pruning custom (tiết kiệm disk)
sed -i 's|pruning = "default"|pruning = "custom"|' "$REPUBLIC_HOME/config/app.toml" 2>/dev/null || true
sed -i 's|pruning-keep-recent = "0"|pruning-keep-recent = "100"|' "$REPUBLIC_HOME/config/app.toml" 2>/dev/null || true
sed -i 's|pruning-interval = "0"|pruning-interval = "10"|' "$REPUBLIC_HOME/config/app.toml" 2>/dev/null || true

ok "Config tối ưu xong"

# ── BƯỚC 8: SYSTEMD SERVICE ───────────────────────────────
log "Tạo systemd service..."
sudo tee /etc/systemd/system/republicd.service > /dev/null << EOF
[Unit]
Description=Republic AI Node
After=network-online.target
Wants=network-online.target

[Service]
User=$USER
ExecStart=/usr/local/bin/republicd start --home $REPUBLIC_HOME --chain-id $CHAIN_ID
Restart=on-failure
RestartSec=5s
LimitNOFILE=65535
StandardOutput=journal
StandardError=journal
SyslogIdentifier=republicd

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable republicd
ok "Service đã tạo & enable"

# ── BƯỚC 9: KHỞI ĐỘNG ─────────────────────────────────────
log "Khởi động node..."
sudo systemctl start republicd
sleep 4

# ── KẾT QUẢ ───────────────────────────────────────────────
echo ""
if systemctl is-active --quiet republicd; then
    echo -e "${G}╔═══════════════════════════════════════╗${N}"
    echo -e "${G}║        NODE ĐANG CHẠY THÀNH CÔNG     ║${N}"
    echo -e "${G}╚═══════════════════════════════════════╝${N}"
    echo ""
    CATCH=$(republicd status 2>/dev/null | jq -r '.sync_info.catching_up' 2>/dev/null || echo "đang khởi động...")
    HEIGHT=$(republicd status 2>/dev/null | jq -r '.sync_info.latest_block_height' 2>/dev/null || echo "...")
    echo -e "  Version     : ${G}$VERSION${N}"
    echo -e "  Moniker     : ${G}$MONIKER${N}"
    echo -e "  Chain ID    : ${G}$CHAIN_ID${N}"
    echo -e "  Catching up : ${Y}$CATCH${N}"
    echo -e "  Block height: ${Y}$HEIGHT${N}"
    echo ""
    echo -e "${B}── LỆNH THƯỜNG DÙNG ──────────────────────────────${N}"
    echo -e "  ${C}Xem logs:${N}       journalctl -fu republicd -o cat"
    echo -e "  ${C}Sync status:${N}    republicd status | jq '.sync_info'"
    echo -e "  ${C}Dừng node:${N}      sudo systemctl stop republicd"
    echo -e "  ${C}Restart:${N}        sudo systemctl restart republicd"
    echo ""
    echo -e "${B}── SAU KHI SYNC XONG (catching_up = false) ──────${N}"
    echo ""
    echo -e "  ${Y}1. Tạo ví:${N}"
    echo -e "     republicd keys add <tên-key>"
    echo -e "     ${R}⚠ Lưu mnemonic 24 từ cẩn thận!${N}"
    echo ""
    echo -e "  ${Y}2. Xem địa chỉ ví:${N}"
    echo -e "     republicd keys show <tên-key> -a"
    echo ""
    echo -e "  ${Y}3. Nhận token faucet → liên hệ team Republic AI Discord${N}"
    echo ""
    echo -e "  ${Y}4. Tạo validator:${N}"
    cat << 'VALIDATOR'
     republicd tx staking create-validator \
       --amount=1000000000000000000000arai \
       --pubkey=$(republicd comet show-validator) \
       --moniker="<tên-node>" \
       --chain-id=raitestnet_77701-1 \
       --commission-rate="0.10" \
       --commission-max-rate="0.20" \
       --commission-max-change-rate="0.01" \
       --min-self-delegation="1" \
       --gas=auto \
       --gas-adjustment=1.5 \
       --gas-prices="250000000arai" \
       --from=<tên-key> -y
VALIDATOR
    echo ""
    echo -e "  ${Y}5. Kiểm tra validator:${N}"
    echo -e "     https://explorer.republicai.io/validators"
    echo ""
    echo -e "  ${Y}6. Unjail (nếu bị jail):${N}"
    echo -e "     republicd tx slashing unjail --from <tên-key> \\"
    echo -e "       --chain-id raitestnet_77701-1 --gas auto \\"
    echo -e "       --gas-adjustment 1.5 --gas-prices 250000000arai"
    echo -e "${B}──────────────────────────────────────────────────${N}"
else
    echo -e "${R}Node không start được!${N}"
    echo -e "Kiểm tra lỗi: ${Y}journalctl -fu republicd -o cat${N}"
    exit 1
fi
