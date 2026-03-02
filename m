Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013061.outbound.protection.outlook.com [52.101.83.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D895199FBA;
	Mon,  2 Mar 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463593; cv=fail; b=HcVxIW+IqRbmPAeO5ieDsuv4y6CMp+sFnStKjtvdVPOwXNuULmpWVsCdOwpSQ0dm5emdRnSxTuxCEhfMAD/Ph1cxI6SzPf23C6psqC9NenEOELs7NyTTnXoD4y7QSjo5qThfpwMP4BToUG498PGoif8zHehDq4n5mNjUwLbA82k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463593; c=relaxed/simple;
	bh=5s39JUSJO04eUDhCTNT3g/8P6pMaNsdvfIeRYQDpoyM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JpOHHnampz9Zd+QQyUOKNmSjOk+x5fnOLSzQghhsIE3e/xjTAhQlYJZTEKtSZi10b97/vP5SC/soC9WwI3/uw+DL1v/Kw51KWauDn7LcSSbUmSaO2Z3wQnLyz3VSWCZ8qs1p8d0TKqYCTaho6Nh9b7pMi82DyD48Vpxpp6GWhes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NtfrF14c; arc=fail smtp.client-ip=52.101.83.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NtfrF14c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xoru7ZKX0AEEUxXAFey5TD20EgIT9n8rjVNaZteFI0IpHllQQQGc5ZimVhSj2kHGDyw349qzAg0aF851tqOY3NJ35hKjLOzzhXZQe2sqYyNRRIawn9kBfCc28LDYmeaPSSkx/bTLPqKOOdhtz2ucp97183GlImqK8I/1BXcN5RNGRgCIv7Jee72elyJapXwjTo6OI7lFG0zdKn9X+ExLx3hpev7/CbfyMHnyOhRmSR2UdNE92bsmnFL9/gp20FJkgya/MckqK3XBFodQUGbFBzNDtHOXJr0/CwqkVk0dS8YCmSAyMFne6LAcVJzxqE0/E4Q9rm7A2w/8GfV7nlUW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyYSDgVgelfRtGJZDAPXhcZ8WCDQJEXtVeHkCWjCWSA=;
 b=fKrU6DSSMQ65QPqXEGPngu++onWLPw3lsIoekIZaDsv+kGZJIcEzG2zI5iSfY++fwgNBVdkUL7NL7KI3ibkRWuRKWvLWZ/QHZijFzT2Q0bdKwwDo6N9CNW7vtj5bKRSHtHBMQvpjgBKhPWTvAtIGMD7qzmVkahJ18luYqhoVl0s0VhzSNr7emah5tHD48r1/cGx/bWELUjmCQFX3ILW0RvJK/rk4c+GfoTVX85GvlU/QZKjesesOM9GsgQ3Ru3UBX/uLbqGFwEmHpjrnO0V72L8PmtbZA/xlbB2l6BnD8J3XoNqM206ZGyz6astBGGR7ilXTDzmTB4soZQSOAs81Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyYSDgVgelfRtGJZDAPXhcZ8WCDQJEXtVeHkCWjCWSA=;
 b=NtfrF14cUVSiW4gfLq5dn84t7E6fX/vbmVCS9Ml/boEj90ozboDkYeMxpaoJrTKq6QtNsVv3QU73mpuRD2PjK9lNCdN+BDQqKEDAOFIL91eMYLyt4g0QJTY4dx30zCL5jEZeILx1UEZqup7lwgHu4onR4RLpwpJyUYMf9zBixlFslzT1bI/2fuFeJh7d9w9VD0Jv0/tYi+hLf/hkYxm+M68XdiZ76KgNk4jXe5aG9uRdISDgORXAUg5hhpUqxflRimPsCDvDnPfvY5M0pVb9wDNzhxNaoDgIkPi3lJjAVbpdbwpnKCAiL0Dj7kcZ4YSl5BBBKTHq1vCWZRc4xa79jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:59:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 14:59:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v8 0/6] clk: Support spread spectrum and use it in clk-scmi
Date: Mon, 02 Mar 2026 23:01:14 +0800
Message-Id: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADqmpWkC/3XMTQ6CMBCG4auQWTumPyCFlfcwLLQdpFEpaU2DI
 b27I3s3k7yTfM8GiaKnBH21QaTskw8zhzlUYKfrfCf0jhuUUI1UWqJ9PjAli7lFibVQztVjRyf
 VAU+WSKNfd+4ycE8+vUP87Hpuf98/EB+B2ggyt8awp8/zuhxteMFQSvkCo2OTiaYAAAA=
X-Change-ID: 20251231-clk-ssc-v7-1-402dd4f9e629
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: efc162f3-1aa6-4f62-2343-08de786c58fe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	+ggvm20to6ZycVIiJ2m0X8H1hs9Sv1nhwwkfwAEIZYj0Jz35A1NM/8mjCH10K3qSMbwETrGqoKdNAk9i3fOCcY4OyXyi0Xwi1TamRMrl5j4dv80rzh/sWlLFJ+tGvG4CJgdO0SWeiq75W4FAE/7DX59oFrAMROFE3gBy2V6UdhPdxTEhDPUzs6gdMtnhfsrJhM1N1PJ7UPcp7X37sqWF/FcYOEGfnU7zMWfiuS3ywNTbpq1FTBt+3UC/Xd9QNYM5h6tg0ehY8unInpV59zZJ03MeRnm+0gCrqmK7ZH/VRMczyRnN9JFGGDDO+toGF3SvUvOJvUTm0ub81fEwHt4e2RGA77AuCDdWhd7KTIEPqF1/goeUAQXsxtP+kgBupUP8Fxt9JOCB8M286PvX+73o0dUQ+ZS4oam2ztNyaLTW4zMdAl6yF47oF91KLk3sIAVJNsR+ounANN2GGSx5dqNku2DQJ/PXIB0/jFC/y8INl4NG+A2ZCPcxYEMjTNiqTKJrNRgvvtR0KUfRkQ/kl/UlBXJm0e6A+Mu0T2lDHpRY5LJh6w1CWqjVpXaeE/IEfG7HuvmP+zWW04hdShP/MRdEZSHqAmbfE8i3+1+t6TBgRAo4pHaFnJDKnSHJ+sJaiikxvt/HG8gNREAAabysfXH7FMqO6mIpZc5V3905GktPzZV3pf7MAcUDh2MmppxJcJyLraGIZ/OHqmr7Ihtxw/7bW7wGo0rCMqESHAd1EwTZpZfz8u6Urm8j53vrxrbpCX7hUs5Ew4rPgWswn958g6MQigp7LTRSvqXIPc7HH2Ky10M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2w2NjluRXRIWlJpdC81UThXYkFZWnpSZGdsRXJBb2F4RXlydzVkUGpIa012?=
 =?utf-8?B?ZXNTb3h1cHZ2Y2R1SkY0c1ZwNTR6dWpQMEJxTEt4cDdMZU4wbXF3U015TkZw?=
 =?utf-8?B?dUxneGFldnZ4bXU5ZjA2T2hBUzBzZGQxN0xoUlJOU3RTWWk0NWxsQ21UeTB0?=
 =?utf-8?B?NkRBWlBvWE5XT3JtTUo3c0RpbU1PUnl1ZVVRQi81SzdMN2p3RDJMNVp6N3Jz?=
 =?utf-8?B?K0lwQ0NWZ0pNaEZEMzRoZzdZVmFtWnkwSmppSkozcjNNZFpWUW85TFZpV3B5?=
 =?utf-8?B?MGxWVy8vZnZwMHc5NnJicmJlY1RNLzZZWVE0akVVUFNnZkw3aEtWVGYySWpM?=
 =?utf-8?B?c1ptQ05PeHNxM1ZNcGp5ekN3a2ZYeENmcTVxM3I3bkdoTk9MUUQ5YWdaVUdi?=
 =?utf-8?B?N3FNQ2xrMm9reUVtWTd3YnpUck9SSFFXOHk4QmoydzBNSnNHSlphYjBaUTNo?=
 =?utf-8?B?RmkxUUQxeFhTZDFlUHpnNFJ3eUhjTXAvcTVISEg5ZG1ZSGdycS9NVy92QUdr?=
 =?utf-8?B?WEhScjNUQ210VmlhUS8yL0hQQkdrcVQ0a3FxMk5pMjhuNlBKV0VuL0VIN0I2?=
 =?utf-8?B?TnR4Qm1XbUxERCsxanZwS0wzeVpLZ3ZCTVMrVVVjamF0WnFCV0lsNTN4V3pU?=
 =?utf-8?B?REtmdXNCZ2VVUXg2TklEcjV5SlB2ZXY2aUxyKzRBdDMxMmRQMTlQQW5RRGhl?=
 =?utf-8?B?NEo0cTlReXVXWnBIRytWTVRQWjlPeG1PTEdQeGFZRWFIV1FJbGlSdjBPdlc1?=
 =?utf-8?B?aW95UDdDc2xTWFhPbTZXaFR5L0ZOeDVJYjluamp2ODNSZWRZdWdyRHFqd2p4?=
 =?utf-8?B?UHMvWURHa09yOEIxSTFPSU5IelV6K2hHZFg3TkJFWDhqOU9jOHRuNDVRaHJv?=
 =?utf-8?B?T3BpeDRkOHNkZVVKNXNvNitGOStPYWNzWmcwV1owV0Z2dFBnVnJ1eU53WnM5?=
 =?utf-8?B?ZUtpUDgyR0x6dVBRTVNTa0Z1cXlyREI3VHF0a0R1cm92T1g4eG1SNzh1TTRy?=
 =?utf-8?B?V2hkcmFPWjcrWGpNZFJ1N3VPNTltc2YxT2QrZ2RKeEV6VWpoYkVqa0pPclB5?=
 =?utf-8?B?RFZSU1EweUpPYnpraFpYWjVHbHdUMDB3d2h1UWFTZWJlZGxWNzBIbDAwSVZ2?=
 =?utf-8?B?b1ZQMmZadUVXVFVrUXFENWwyb1NCWG1tbFNIeGpOZ1owVHZSaXE4UGg3TFU2?=
 =?utf-8?B?QVRnblhyWGoyWktXbGZINGtaOVg4eDlubzZGRDBUWUJLV09oOXhOMloraTRI?=
 =?utf-8?B?bXZkNU41cGl2cHpBR3NUR0F0dnUzVWR4V0ZZdTJQakhJRWY0ZnZaUVpJeFJU?=
 =?utf-8?B?SzJ6QjY2YlRqOHZDaFVReHdIT3R4K3U3SmZNS0d1WVZjQmJlTWNYNU1yOERR?=
 =?utf-8?B?MzNaanBkM2hWbTY3V0ZGRi8zR0s2cTZ6MzlxY1hVWENkenRJaUx0OVgwRHg4?=
 =?utf-8?B?dXRCcUJPTVJMVjM1UHhqejZPN3hYR2NKZXAzRGxtQlNBbXliQlFkcWZDeVpv?=
 =?utf-8?B?VXpoalVnQUhsaUsxM1h3WlFIaFdnQW9ra3kvWTZDTkV1cExrbld4a21yZ3E1?=
 =?utf-8?B?d0xudW5JOWV3OW9KV0d2M2s5VENzUGlCMG84MmNWMnJ6Y1BCcnlzNTJaS1Ji?=
 =?utf-8?B?L2Z0Mm14VjN0V0NBVSs4OTJMWXRYeC9RbDJuVVA0enlOYlRDcm9obTZGdVds?=
 =?utf-8?B?Y0huS2tqK0VEV3ZOL3ZNWExMYTZjeTJTb2JkQ21JMktVTERqV2NIUXMvZDRU?=
 =?utf-8?B?UFlMb3pWbFg5bXRVNjNoTEh4R2ZYUGF5dEIzWkhQdzB5Q0RMc2RJK2F0bFM1?=
 =?utf-8?B?TTFlSmZ6SkY3K2hqWHVVUUt0WldicVltc2hMYW1Vc0N6WFNOcjcxRzIrVFM0?=
 =?utf-8?B?aVI5MGw0MGVBSU54QndacHVxRkpHcG8vd2p2eDhDbVduSkRtOTBlbTBhZUdG?=
 =?utf-8?B?dmNvajRiZXRTYkh5ZmZROXd6QXZ5bnBYTm1DYi9KL3dhOENWL09QejNtdTZq?=
 =?utf-8?B?RGVleTVvL2RwL2FFb2RsRGJNT1BHTzZpbyswamoyUnZBbjQ3TUJhSmdvUEY3?=
 =?utf-8?B?bUdYbVZRUXEySDRNUzMwRnBteERoc3FmbHJNc1RONFNBNWg4eExaZUpqbTFl?=
 =?utf-8?B?alBrZ3J0c1EvVS9oVmtVMEdIbEloQlRpUzNmY1g1V0xrMTNwUU9YLzAxQXY3?=
 =?utf-8?B?VDRXSjhlblg1Mk5oZjJLSmpka2tuOW1wV0phV3JNM3hUeG9rSndyVHdwZVVt?=
 =?utf-8?B?UEZPSDV4cEQ0MlJiOXY0cU1UK3IyL1B1VHBwTlZxRTZXa0lIdFRFRTRjTVYz?=
 =?utf-8?B?QTRZcXluZnowd3BGaE5QaWwrZTVDbTdRTmpUYTF2dnBxRnc4cDBrUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc162f3-1aa6-4f62-2343-08de786c58fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:59:48.0440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpxEES65sLpQK1BM02f5XbXHV0GVmu+VjiPrFSy/T/YRyhia8nS/WQuKgkbxPmiaiYnwFm33f8+piDuwNMgebQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255

Since the assigned-clock-sscs property [1] has been accepted into the device
tree schema, we can now support it in the Linux clock driver. Therefore,
I've picked up the previously submitted work [2] titled "clk: Support
spread spectrum and use it in clk-pll144x and clk-scmi."
As more than six months have passed since [2] was posted, I’m treating this
patchset as a new submission rather than a v3.

- Introduce clk_set_spread_spectrum to set the parameters for enabling
  spread spectrum of a clock.
- Parse 'assigned-clock-sscs' and configure it by default before using the
  clock. This property is parsed before parsing clock rate.
- Enable this feature for clk-scmi on i.MX95.

Because SCMI spec will not include spread spectrum as a standard
extension, we still need to use NXP i.MX OEM extension.

[1] https://github.com/devicetree-org/dt-schema/pull/154
[2] https://lore.kernel.org/all/20250205-clk-ssc-v2-0-fa73083caa92@nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v8:
- Add R-b from Cristian for patch 5 and patch 6
- Add comment for scmi_clk_oem_info in patch 6
- Rebased to next-20260227
- Link to v7: https://lore.kernel.org/r/20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com

Changes in v7:
- Add R-b from Sebin
- Drop __free usage per comment from Krzysztof in patch 3
- Link to v6: https://lore.kernel.org/linux-clk/20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com/

Changes in v6:
- Add kunit build warning
- Update OEM string comparation per Sebin
- Link to v5: https://lore.kernel.org/linux-clk/20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com/

Changes in v5:
- Per Stephen, export clk_hw_set_spread_spectrum, use enum for method,
  add const for set_spread_spectrum and rename clk_ss/conf to ss_conf.
- Per Sebin, Cristian, Sudeep, I added clk-scmi-oem.c to support vendor
  extensions.
- Link to v4: https://lore.kernel.org/arm-scmi/aNQPWO6pfA_3mmxf@redhat.com/T/#me81231bf286e2a8e4e00a68707ed1e525a2b4a3d

Changes in v4:
- Add R-b for patch 1 from Brian
- Drop unecessary change in patch 4 Per Brian
- Link to v3: https://lore.kernel.org/r/20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com

Changes in v3:
- New patch 1 for dt-bindings per comment from Brian
  https://lore.kernel.org/all/aLeEFzXkPog_dt2B@x1/
  This might not be good to add a new dt-binding file in v3. But this is
  quite a simple file that just has four macros to encode modulation
  method. So hope this is fine for DT maintainers.
- Add Brain's R-b for patch 2
- New patch 3 to add Kunit test per Brain. Since Brain helped
  draft part of the code, I added Co-developed-by tag from Brain.
- Link to v2: https://lore.kernel.org/r/20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com

Changes in v2:
- Simplify the code in patch 2 per Dan Carpenter and Brian Masney
- Rebased to next-20250829
- Link to v1: https://lore.kernel.org/r/20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com

---
Peng Fan (6):
      dt-bindings: clock: Add spread spectrum definition
      clk: Introduce clk_hw_set_spread_spectrum
      clk: conf: Support assigned-clock-sscs
      clk: Add KUnit tests for assigned-clock-sscs
      clk: scmi: Introduce common header for SCMI clock interface
      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver

 drivers/clk/Makefile                               |   8 +-
 drivers/clk/clk-conf.c                             |  75 +++++++++++++
 drivers/clk/clk-scmi-oem.c                         | 108 ++++++++++++++++++
 drivers/clk/clk-scmi.c                             |  44 +++-----
 drivers/clk/clk-scmi.h                             |  51 +++++++++
 drivers/clk/clk.c                                  |  27 +++++
 drivers/clk/clk_test.c                             | 121 ++++++++++++++++++++-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 ++
 drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
 ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
 .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +++
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++++
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +++
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++++
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +++
 include/dt-bindings/clock/clock.h                  |  14 +++
 include/linux/clk-provider.h                       |  31 ++++++
 24 files changed, 591 insertions(+), 32 deletions(-)
---
base-commit: e56845b74692e92699ca14a9f77bb77fe5c564dc
change-id: 20251231-clk-ssc-v7-1-402dd4f9e629

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

