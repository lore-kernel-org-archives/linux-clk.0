Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2F377007;
	Wed, 12 Aug 2026 07:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520396; cv=fail; b=KWsKOCpnzl7/rCkdVxYeoCQWtC54IaJKqkrYAAVCsPSvNLS1jHX/l3qJWsA9pNi4yiLPVhRU8wBdVPRx3FHOTsN1xUOuhhptTWMX0wes1IzxjCCbIoM1CdLKj2YQDYXoThj0WdWfdYoNU2aL1rIXKsKKPqbmFafyyjYZtjg4DdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520396; c=relaxed/simple;
	bh=QmxqWaG3zpdryxcChevA/CKdTNcKfT3wei4t+VpDWu0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pGlvOZNvMfCQzJjKY2CQ9zQZN0cmysgdejqhF0f1tbevwBZZTEq1eFbwz95MiXp1yGEsR91K8RDMVTaQ1n/Jhy1LY6dSUOQwfT7mSftcGvb53pCIG9kU2nbJXIDVcBob4RRtThg8EncsOrv6uhf5WBpNDxrP1OlzlrzOIanduBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DnzdTveC; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DnzdTveC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWt6LICC4LhXPIWvLY59h5bFh7TtaLiVNXuvM7sqYHROwIfljgdNXpb9/034o5qrpv5BrRSDhoFjpQm3uI5TlDHdMjOwAsGkPW/LAx7dMOaEwUc67/QdBW62ISjtzZuPU2bvWUDZX48X9jlk1fwWdgQZOONJTC37VpJ4pJdO1IVLsA9VYXWhCoXYGNqPY6FB2UjRy8SkvcdZNsw41SzZd6EmjeB7Y/IErjdQ3HtkDOM/FrBgMq6EAaj59YK8MFMG2f/0EF7hm7zxV2ORxVT050ipdopsDaYeRReqNZnCefYoXnKmuevAN6KOxx5MXCmprV5NMwdAZtGqjwPlPWgOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+Vz0QdOoUS+7qJhd/7eJdTvGttYHFenJrtg3V8hUS4=;
 b=PBXL9fewGKxIK3IzJOd1m3uPLb79z/QRtu81U2rvEX3C45BBng5BDnzg786UdBodGzhY/mGIUNCtfWY9W4d1JA6mH3M6VgehoFYkpyx+w9ecKgD5FjM36g/ciGrU1MTuOY8gjRL1k7OmX2CkvLEzAt0xSWUooIlA98MUUo8hZnzG7qjoUO6oSznXiJRWiQ9ctXj9vsMulC0RvHlBHXo+ET1oliFICIdw86JGJa+NIgnmyxHJYoL1bAq7HGFgbs8aYbcP99yYvpoSBjE4oZw0h4PAAvPA9cIkpWTFA32fOYenBl5ubEi9zbiWiDSOTBi3RtX7fBfZbkO19rdOU9ulTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+Vz0QdOoUS+7qJhd/7eJdTvGttYHFenJrtg3V8hUS4=;
 b=DnzdTveC8tYUcREXFIcwS4KAJcmoFGmRNHcMxdpiCY3J01u8DB/6nx9tRXd3MdTuCgDaIEnAHfRtwNVqgU00j2TyNmgWLZqjemZcGotKlP56xDkCxkePOz7H996jvgI2lIzM44eKuJdiB7URaaNZuSULQYPScdBUYxy5YqZdmsc+JmgpY5vzN0Ye4CFUqciLkCmxdIaCRhaR51+x4qh31EPhdt+KsZrsF1U4wLZyiqpyYP9SpW3gmcmSuLWUqH97C76JhUJEV8He+YpBSYfixOvweL1MGBVmsdPKtO5nQU177z0Rk6cPEYbITDal30H/1v3xZQi+38+MXGwPznrjSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:39:44 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:39:44 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 0/6] Add USB3.1 support for Agilex5
Date: Wed, 12 Aug 2026 15:32:53 +0800
Message-ID: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 747e3ef7-1860-4b46-b6a5-08def844e042
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|18002099003|55112099003|11063799006|6133799003|56012099006|3023799007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	8bgcLuCT8kkh8aX9ABYYkPI6SP4A51qifSC6DaEmspc/7W1QYiT+KjmCxJ3Q41B6W1dKmFbTphCFLoVJY7oaEKBAVsy9yrco1YLf9/K9q9IFDW5ST/Wh4a5Zb37c50Zdzsy1UmRjcJM9iap/Zl36xZeq9K7ozIDr/bNZELmEav+LMGBS0W7v2YXhf1p+Lt+UBFbNLCIiLAsYJgDvnIxUNLPXUtfyIW5RyuF06UzTvmAcHiemHPGPre0Z+fng9xGTs82Xgemmo33WI8F32FuoI+VU90GeBZtZcf+sX2aIFTIyzA6KPju3p9wvKPY++XqsyilCF/8UljmvxLuhdeWyQyyk9VMlTMY/AbrjY3Onkn5tDDOT5YhUim5jbjyGoc5EFdk+yHg2WKJWMoBOa2vLRedccWL5+Ig8T6J/Cm8mIWHRV4vucVgyRlmHzPZsaEoIQ70YMsaNV6W/yZgZHi0Wvh2KggVnxtKxcRxo0LX3AuYFlgIGLYhJCZceNL/KMWNwRpDlQhlhzfDOXhaf4MPj3EgzM/92NfUTP2AvbCLjb7/4ky4x2uAk6j3VR7nPSLluCHPhk0weYPLDRBlw+ixWzgDSilR0bgZX8nCRpe35cYq/GsGsg4N7c40IPRwIou8fzJZDXylR6urKVL0SH2+/p4QTXUg5yiasHRCOnvSHPpQ9k7r0C/t0l2HXOCHS55PfPdma9+sHT3MlavZt+H/R7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(55112099003)(11063799006)(6133799003)(56012099006)(3023799007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/rCxdZPMXTR1KN6pdx1eTxxAYtwpwhuqaOrECoBjO62ZDh3/nbrE6+2Br8TG?=
 =?us-ascii?Q?ao9VyS+olpbQJn3Lc3jspYiypCn5JtnuDB82zfsPjvRr3IEXJ6lIUtRS5xGq?=
 =?us-ascii?Q?DlJ/cdA1N5drqrH/Qo+ckP5+6DQRj9PIKpTI9qtSruMcaWGgONNh/W46Wd8l?=
 =?us-ascii?Q?kV7XDfy1retngDhVF7NcaEarowGwQHKBEfQXQmlVvmc/3QfAcRT+5jNP4KNp?=
 =?us-ascii?Q?IzR8phcCR27OzJKtGpPG7iwVMMVEP4IOIKUp331E1aF4Ur7sSeiKTkKP31yv?=
 =?us-ascii?Q?pu+28zl/PbywTyfsNKez7vw9E5mTDsGrocJLRXNuTWa5AXb991Gedhgc5UgZ?=
 =?us-ascii?Q?Q14TP19O3B5ML2MD0TkYl+FjHliZeX5dTIPRqMBouXY4jeRmV9nMQdyFQh/X?=
 =?us-ascii?Q?7LGB7fPCjg941HBV+57Pj78ObbmIlGHokvtFeOeXi5ldTMUzGwsa/yZ+WWCd?=
 =?us-ascii?Q?Wrod21ipAnQelcqgwShxnexTg6DEYaQbBuTtlrRf9IAGmWyGj1rWd6Z9VMLU?=
 =?us-ascii?Q?iz5nU4apOXZervDJP6pDtYvhTtYI0BW8QZeK4YbQqlkTBHuh9e4K5fFB0UMf?=
 =?us-ascii?Q?26uq3sN7IB7udXBqstJEOB6VBXKB64pR1AZ8am5CH/8a7EMsnhjps7pyeah+?=
 =?us-ascii?Q?3T2BXZpwSAVAYy3tSqQ1f0WR51WqaqrYdCp2wvNlxGoFPBspK29rdK5Z17Rc?=
 =?us-ascii?Q?4bhyyEXSwraLiHXvEfTo/nRd73tpQIe0AryusxpxdH1tzXzfTU4gpDpD1bUs?=
 =?us-ascii?Q?FzyYiPYsrivGkCrqJRw6V7jLr3u5yREauAIQwfqNYEF3aFUYX2kVsevnN1r/?=
 =?us-ascii?Q?4g0vkxdB6zF+WFS/5G516Ked6bUNAn+XvyzbD1ZF9u1cDjMGDpq0iDiym3+K?=
 =?us-ascii?Q?88yIuGtFQvlYC1/h/Zn44VZ0+CJ/mv/opU9jfHHmKDL7AP3qBPJTSJ+5yX9C?=
 =?us-ascii?Q?tszQMH3XiRtUZYy24E81M87ATQv0qzrdwKMXhZ2AwtxTdc1/QUjKLQ+0j5sb?=
 =?us-ascii?Q?AjGbzTh1lV36oiT9Su1MxZ2PB/08GHzVf0V8guXK0H2sHceM8IwvqMpRaY5Q?=
 =?us-ascii?Q?bfrqyO286VLj2YysxGHv8tyltQdSTeMxQhwiHGa/oMB8V0aoFHshIk/BoFqV?=
 =?us-ascii?Q?5xcpAo8Q6GpxAen+Ppse0lmSUwjhBlFuRCj9eukWmgDK8zfVeucKpivq7mIG?=
 =?us-ascii?Q?2m2OfSPlzBL/vEaMd/kf+IkwT0eJE4OhVMFY2pz3FfhRzuu/k2RcgXIkjXYD?=
 =?us-ascii?Q?R1G4RH/9xOlWVHNDhA7u326C86urW3EEGA0uMi+Ks9Di2AwB5NMfm9afDtD8?=
 =?us-ascii?Q?3IC6aHOzd7xajV42WGTn9ZXE12fnvottOExvnsvtdHb1bWf3ZZOpiWY+cT9L?=
 =?us-ascii?Q?LfsaAlj42Vekvp7t/oaNVr38rRkqd8cgGH80Fe/9o0aW31lvO3OaeZZtb215?=
 =?us-ascii?Q?0JvBvw1rKe/QmJ6EIrSghXsKtfkPKFqAC71nPAvgA+zZLfTSuYXVum/Iu5mS?=
 =?us-ascii?Q?PBOpKjRWs5IyxBYPoArDyGajYyzqMGW4fj0uYrZ6RaF41F5W/dfqUMMPlmDc?=
 =?us-ascii?Q?WgRvn0wjRfaG70omaaaBN2+qkIXCm9oP2WzNy2LLQQVzJu0++8wauAgoSU8K?=
 =?us-ascii?Q?hv+pouazVsbr8pmI2Zg6/wY02GU5NjR3nWhKi5xSX1ocJJ/hq4FyncQW5mne?=
 =?us-ascii?Q?NQ6rGg2sT4uAtpNSMJ1TKrXI741IqMjlg5cFfMAekK1AD/SXeNMvV0HlOUVs?=
 =?us-ascii?Q?OcrGnIXWS0ZV3QE9pLoNwTdndhrWwZ0=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 747e3ef7-1860-4b46-b6a5-08def844e042
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:39:44.1481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DBC1taiitaBZu2XroKf8oz/YJtsFR3SaSOGrUNfU/T0Icel4t5vzvZsm904UyElKEktoPuHccWow3tVWLer1knZytP0tgobm/BPr9Gd3zJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

Agilex5 integrates a Synopsys DesignWare USB3 controller via a
SoC-specific wrapper that requires dedicated clock, reset, PHY, and
optional SMMU integration. The USB DMA path on the interconnect is
limited to a 40-bit address width.

This series adds the missing USB3.1 reference clock ID and registers
it in the Agilex5 clock driver so the DWC3 "ref" and "suspend" inputs
can be requested by name.

It also adds a device tree binding for the Agilex5 DWC3 controller and
introduces the corresponding USB3.1 node in the Agilex5 SoC and SoCDK
device trees. The controller is placed under a simple-bus with a 40-bit
dma-ranges window so the DMA/IOMMU stack respects the interconnect address
width when SMMU is enabled. As the SoCDK only exposes the USB3.1 interface,
the unused USB0 node is removed.

Finally, the Agilex5 compatible string is added to the dwc3 generic
platform driver so the controller can probe through that glue driver.

---
changelog:
v2->v3:
* Add the missing USB3.1 reference clock ID and register usb31_ref_clk
  as a fixed-factor clock in the Agilex5 clock driver.
* Drop dma_addressable_bits core/glue changes; describe the 40-bit DMA
  limit in DT with dma-ranges instead.
* Wrap the USB3.1 node in a simple-bus with a 40-bit dma-ranges window.
* Keep Agilex5 support in dwc3-generic-plat as a compatible match only
  (no platform-specific DMA mask override).

v2 patch link:
https://lore.kernel.org/all/cover.1765249127.git.adrianhoyin.ng@altera.com/

v1->v2:
* Update new binding name to match compatible.
* Update binding to use single node instead of parent child node structure.
* Update binding according to comments from maintainer.
* Split USB3 and USB2 changes in dts into separate commits.
* Update to use flattened model and use dwc3-generic-plat driver instead of
  dwc3-of-simple driver.
* Add dma_addressable_bits as a dwc3 property which is set by the glue driver
  which is used to configure the dma mask in the core driver.

v1 patch link:
https://lore.kernel.org/all/cover.1762839776.git.adrianhoyin.ng@altera.com/
---

Adrian Ng Ho Yin (6):
  dt-bindings: clock: agilex5: Add USB3.1 reference clock ID
  clk: socfpga: agilex5: add usb3.1 reference clock
  dt-bindings: usb: add Altera Agilex5 DWC3 controller
  arm64: dts: intel: agilex5: add USB3.1 controller node
  arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
  usb: dwc3: add Altera Agilex5 support to generic platform driver

 .../bindings/usb/altr,agilex5-dwc3.yaml       | 102 ++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  27 +++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |   4 +-
 drivers/clk/socfpga/clk-agilex5.c             |  15 +++
 drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
 .../dt-bindings/clock/intel,agilex5-clkmgr.h  |   3 +-
 6 files changed, 149 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

-- 
2.49.GIT

