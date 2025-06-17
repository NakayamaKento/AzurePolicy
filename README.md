# AzurePolicy
自作したAzure Policyカスタムポリシーを格納しているリポジトリです。

## ディレクトリ構造

```
CustomPolicy/
├── *.json                           # 個別のポリシーファイル（主にサブネット関連）
├── StorageAccountImmutability/       # ストレージアカウント不変性ポリシー
├── VnetCustomDNS/                   # VNet カスタムDNSポリシー
├── privateEndpoint_DnsZoneGroup/    # プライベートエンドポイントDNSゾーングループポリシー
└── vnetFlowLog/                     # VNetフローログポリシー（ARM/Bicepテンプレート含む）
    ├── ARMtemplate/
    ├── Bicep/
    ├── README.md                    # 詳細な使用方法
    └── *.json
```

## ポリシーカテゴリと制御内容

### ネットワーク関連
- **サブネット制御**: プライベートサブネットの強制、デフォルトサブネットの拒否
- **VNet制御**: カスタムDNSサーバーの設定、フローログの自動作成
- **プライベートエンドポイント**: DNSゾーングループの自動構成

### ストレージ関連
- **ストレージアカウント**: 不変性設定の自動適用

## ポリシー一覧

| ファイル/ディレクトリ | 効果 | 制御内容 |
|:---|:---|:---|
| `AppendPrivateSubnet.json` | Append | サブネットにプライベート設定を追加 |
| `AuditNotPrivateSubnet.json` | Audit | 非プライベートサブネットの監査 |
| `DenyNotPrivateSubnet_*.json` | Deny | 非プライベートサブネットの拒否 |
| `DenydefaultSubnet.json` | Deny | デフォルトサブネットの拒否 |
| `ModifyPrivateSubnet.json` | Modify | プライベートサブネットの変更 |
| `StorageAccountImmutability/` | Append | ストレージアカウント不変性の設定 |
| `VnetCustomDNS/` | Modify/Append | VNetのカスタムDNSサーバー設定 |
| `privateEndpoint_DnsZoneGroup/` | DeployIfNotExists | プライベートエンドポイントのDNSゾーングループ構成 |
| `vnetFlowLog/` | DeployIfNotExists | VNetフローログの自動作成 |

## 使用方法

1. 必要なポリシーファイル（.json）をAzure Portalまたは Az CLI/PowerShell でインポート
2. ポリシーのパラメーターを環境に合わせて設定
3. 管理グループ、サブスクリプション、またはリソースグループレベルで割り当て

詳細な設定方法については、各ディレクトリ内のREADME.mdファイルを参照してください。