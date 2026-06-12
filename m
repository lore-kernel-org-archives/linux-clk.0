Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF696380FC9;
	Fri, 12 Jun 2026 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253799; cv=fail; b=rd2ykpeo7q0AIK89bx7fNouhO0V+DIemZzW8BYxjPnuHapr/rCevYHKcszLJRrwb1Yudk9UwTfDkpTPzkpqi1CyKo+L9dw4ARxsaI23Q3juG6QVkpaRZwaA6DnoUTjY/lnCVyQD3GWBNqi/kQ1AUQapEKcuMYOb36s8Ccwn8JmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253799; c=relaxed/simple;
	bh=yP9utN08lyH8GOSwM5CPlYCqpP/T5yXFHHfs2Fusnek=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=GrViYp2Brc/6aCz6RtPWoeuShrHi6fVr+/t27fE0Y0ZOoIMA24qU49iE08ZzGUu3fFBPyWKltZxw/6fn7dxb4TDZZyazXtoBVT8amEmDrSRKFi1NN0gVw2Zi3gno3yJ0wDsexX4ckeV5XhKkSiPfm6Y40cPOC8T8+NFEhlj6aQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wnX2PW2H; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wnX2PW2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/gU1JNZHvJYE5wlJ2rBGeoWHVDAaPdlWpLI7Umj+jaw4cZLKf0bHrelzYGQhQfbcxRAUJ2qQ/afzjFXwxd0xK+EvOdrpizl5DURRrxFc0vZOD7dHQUjsdvJYCaQYZnWx2M6ZCtEnouCJvRJIx3TOJeO/t2q3ICit25ib7MeAw8EKtXn+8Kr7x7lpXEt+hH4s1jK/SsLAcr49+t2YvNudoD8dGwRd+5Vm8lsbk0E2XfFsT6bPZp48T+iMn6Nd1bE1vOWdqzjwv4gl8y7w+5a+olf2Ezk5WgvrxzJ4PAncwYgQ8vHEbSajPxtDcXFKUj0FgehrnfPIVkZxUuhNE8m9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrkWl50jmdgn95qPguqIxMvp94UqVrAH2Q/77R47tKg=;
 b=ZtqR3+K+hAEWAjucx2mKyizRWdDV0TkaJOoB9kTYMIj+nUgGLb6Y2oI1gNEtvK9YY909bqGXwRPeUNmbLs+pzsR3IQrfPRtNLShfhNWe21DOzS9dh73+XProZHP4PrWBW1DCqCKuQCtMZttWJFZiikWwhlyYkgqGeC/Vv6hPAtSXydInpSqF/lbYAvNOWOISP8ruuDRVlxSSRKnKVxk8bRCJzdpkcKgCHYOWjsBmysBTLuIwX2I6WKqhsQ5YjtmjV7CGuhxssi9m/8AsEmX9JzZsq/IY0fys9iqKeib/PN4Cf5QtsuBdd2M1IFKf+3zOquV4s/cOMydawlISi97U0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrkWl50jmdgn95qPguqIxMvp94UqVrAH2Q/77R47tKg=;
 b=wnX2PW2HttpCt0lx3BVhu+NkSspzItdtoZ+vdAyY+6wfOOC6C/uMifRcXq3eeWqbWYJ8pvQyrLE2cT46aktO7g9cJKWS+aTP7HUMbseThlKOQsYfnPwAFABF9jh+qQwIG3Kd/P34itzEoHvfIbEDDpWHoOrBhiwx2RsPhLpMIQsRAjOmwKbUCMXERw53VNCXWwfGbUNcF1a5F07ApYyw0BUVVyrjJkBRolZZQT214mLrFK3UNGyOF2rVQ8OcDYFCivAqXGoRLzFmAlVnqQM5OHBL/vv9GxAGoR/eYTeFZbExuPId4NkglsMdK31s+2+dwkwc4vVlOJAB6ScgGq28QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v10 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Date: Fri, 12 Jun 2026 16:46:22 +0800
Message-Id: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF7HK2oC/yWMyw5AMBBFf0VmrUnHoxG/IhbUlEGQlkYi/l2xP
 DfnngscWSYHZXSBJc+O1yUAyjgCPTRLT4K7MEAiEyUVotDzJDxKUWRKmy6lXKGBYG+WDJ9fqqp
 /dkc7kt7fO9z3A33543JsAAAA
X-Change-ID: 20260611-clk-v10-846cfd3e561f
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: 409f2a45-2c72-4e73-39c4-08dec85ea3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	IMdLMwl9ufxxO+UTrOh8fpnW9PwAeKznPDkONeAS8IJGw86QoZeROs+jOiWcHDEVtB4g+9tPTxjVsXyvql4Kc3TIhAUDkODDQyki4w5SLgDWd0VFU73OyfnbtxMZgnF15YkqK+0w+VaDpyQh+fJT+8ZVEcmmDZX5rSJb4PjX5MxOEhZVGFxPKxosl5lFlPvJP10wqOUKMa0LMmYz+UccnL4YWp6NnPDU+3b6YARAY9JEyKKaedjpfRzQjXLYtjg6vUG6s+0MJGrf/a0AgiNhMfvOFkvjWK9jQV6FmnuBOzjHBoROW3y3IdEYvCq+MHK1XG8pIA+YHHWTDp17fmjYWKxrIUJ5BWYuT1bHjgBCf0/1z0ybZkbW9d1ayMleEPaX7XHzQtMzPGRpXU9zxkcZZYg2uF/0hdHueQA8L5tbDv3c4P8hrmF8Y6CaUksaqvTemTTTCpK9zUmJHv5KqBeOwe+P/xPe21rfml53YZL+9GDl/eS9VpetAZGEMFo8YZYkvDnRtPpgJqJY4W8rxy1ziCFFILweglfMG8igYcu0RejQLmYvORHgrzKITvRFLcNOkomS3HjRyYdGitSTwC+k0WgfhgwnpnRyPCGIY718jyHIccriWA3DJPQPxILwYkmHVAONjUuaP197IOtd92x0W6JJR51hNgj8pJJccuSGgORjDUL9/PsB7OmR0fkV7bj6FokmSh4Ei7QuiLiqNGMQXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHpYRDA3SmNHR1VVM3JFdDB0QW55WnI2bVlteEVwMks5QXFLWFFIcXRuNW9m?=
 =?utf-8?B?SXVmaGNzQkFRb2E3b25NMWtRd1k5b1psZHNrcE9HQmM4SGNLUklaOS94WnBp?=
 =?utf-8?B?QTgvRFhrSW9MTkNOYm5oMy9RUTBFWnVBRXVDRDRQWmpoYUlqVnZkQ3RsTWVt?=
 =?utf-8?B?OVE4L2JYeWw5cmFnWVdsZjB1MlFJY1BTU0ZzUll6aUhoVWtPc2Y5bENHUDEx?=
 =?utf-8?B?WHBFUXpXRDR1ZzNHRng1bUJ1OXh2L09JcGJSL2xySFFOcXJlRFo3T05iSDZY?=
 =?utf-8?B?a0ZGbVByYmlhMS9TdW1xQWt6SWNIRzVlK21jNFo0bG5rOFV0OG5uTEtjOWtj?=
 =?utf-8?B?YUR4Yk5HUFdLbHNVb0pvcjlJSytySm5BSFlvQTZoVGZyaUVsSFNTbGxGQlYw?=
 =?utf-8?B?NEYzbTdBWm4rMnNOOVFpbVQ3eTFLeW9zUWZTblRXK013RGhyYVVqbFVpODlh?=
 =?utf-8?B?RG13VEs3dHNvZXIrWDNhOG5PQWs5dHBSLzZBTUZoYXkxREMrUmptbS9zaVcr?=
 =?utf-8?B?a050QTNtRWRHUGZKMnNFVkh1cTI1MEFvQVVUeHVsSkRoRXREL3QzQW1SOHN0?=
 =?utf-8?B?RmVHZENMMjRvSjhKUHpPTjBUSVc4eFBLVHZXaW44UWo1cEJWWDgwWHgvWGM1?=
 =?utf-8?B?YndwdGtVN0F0dzBFWGx3YTVWYjk0cTFMellLUytIWUFGb0FWRXFmd1VqeWdw?=
 =?utf-8?B?M2JGSSt4U083bDZjbE9UcXF3Uml4QXM3bGNmeEhPbnFXeDdjM25WZEVmaUdi?=
 =?utf-8?B?SmloMkEvZGtjNXVWdzZZZm5senFSL0FvTXoybGRRYnBpNzIrZDFEZlNNT3Qx?=
 =?utf-8?B?M1k1MzNQdkxhbURGcU1YcW9QbGpES3BweTA0Mll2cVJNaE1oR3RvZkliUkVq?=
 =?utf-8?B?dVZsN21HU0trQ2ZyZTV6Y2EvTWZhbkd6d09DM0xSa0gwRWRscEkvYmM5cHht?=
 =?utf-8?B?eFNWRWVaRXpBdTY4aGwyNytJSjFBVWR5ZTFIWjdGQzFrTEZhZU90SlRKZzlK?=
 =?utf-8?B?M3hIK0VNU1U3MGZQQTNwTElxelZSUVBwSnU0UFJOOENCb0hkcE9DeW9RS01W?=
 =?utf-8?B?L09YOFd0LzJYV2ZGWEpQUW94aHN5NW9nWjJYQkZqVEhZV1Irc0NKb0diNVYv?=
 =?utf-8?B?MDB0TnJnYVMzMzlJVmFPVlR6S0hVMWRXSTlNaTR0V1U0TDNDNGZ5eFJrSkcx?=
 =?utf-8?B?TkRvZlN3Y2FueWQ2NEZmQ2lZcnRmSXZJYUc0Q01QOS9kM3p1RXpyOGd1cHFP?=
 =?utf-8?B?bzBJYXRNRVVPSGEzVFRxU3o3OElGalVnMUdJZDFDLzdIbnBGQytmT25ydjc0?=
 =?utf-8?B?eE5acWU5QloySFFIVmJWajBCYzhmQUovaHQvT2p0N2RoVzdaSVFrWDNGY3Bi?=
 =?utf-8?B?ZVZHdGhBdVVYRUlOM0YzR3JyOTdNSlAvSUVkZ1cvRHAyUU8vTDloWStjNTBz?=
 =?utf-8?B?RUNuZTBWdDh3NUpxSWdMamVqQVJheEdXREVsMGYzUjdTY1pSK3E3U1c0ajVk?=
 =?utf-8?B?Nk5Mc0dnYjVvVEJLUThBeDV0VHNSNERWSStSbjIxaldVdFJYLzkybUdBOXkr?=
 =?utf-8?B?bHdEOTY4ek1rd2xLK2tQUFZtM2hyY25SckhJUlV4c0dXMU5yR09yV05UdVUr?=
 =?utf-8?B?L1U4Q2o0OVJUendXeWZzNDFYTzZ5U012VmlQZnJSeXRoVjBjTE9idWlxaUxp?=
 =?utf-8?B?dFRSUUhIaHI2bGNCMFU0NnZvN0Q3YjJOZlZnMG9iZEhBY3FWU25EZ1hvUjhn?=
 =?utf-8?B?dzRqMWsxSi9udkhhS01JS0s0blFIWSt3QTdZNGppUFpOOStHVzJnWkNWalkr?=
 =?utf-8?B?R09PLzlHWThLTDBWWFZLbmRZMG1NNW5JRUhKZWU5QkllOUprZStRWlo5UzJI?=
 =?utf-8?B?RjhYb1l5Rjl4MVk1QzIwWVlpa29BSDlyK1ZGRXhOa2lHTUNpK2Nta1o4eTVC?=
 =?utf-8?B?dXFKRHRQRXJjcjl6MW9IMmtYdzlPa01aTmJTTm81bnZuWEVXMXIwVjVkWjlh?=
 =?utf-8?B?QVhwdnJ6bVQ3aENubG5iT29Cem16ZWdLR1l5T2h1dWdkMzl1YnhWQm9oMzly?=
 =?utf-8?B?Z29RVmI0Z1VhNU5KZEpFbCt5LzVIajNtVTNGNHdXcFNQMFE5T2xpKzdyakpQ?=
 =?utf-8?B?OFoyUVFBWEJFb3JaNjdGRlYrbm9qOFpxVERtMWZGVExoYXJRMmhyM2owQ0Jm?=
 =?utf-8?B?TzM5VmorY3k0WWhJTnFhK3dKdm9QeTNHSFdNbmxzcmszNkNnMXlBWUZ2L1lV?=
 =?utf-8?B?Q0Q4OE9HL1RpMUk0M25mNUt2R0l0cVlsaDlNY3VjZ2F4c25WUnRDVWtRNWov?=
 =?utf-8?B?Q3VuWk9qWHd1dWJpT1lrSEdub2o0REZWZ1JmanI4anFqUWxNSmRISWNvSTls?=
 =?utf-8?Q?YBtgq0/hJ+at3M1gesk39pC6YQnju0f6jUuGg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409f2a45-2c72-4e73-39c4-08dec85ea3d1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:13.7776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys/XhMt+ck8wPzGWfB4oE7A/bnEnKVam7ljx9PCoNQkrNcJ0nBsAT/60lpfqqPpfQBf7aKYn++Hr1RwOdWn254PJVKipa1em80Ezhasl+S0SOzZkqJos/Mue4tfOr78Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

Sorry for the long delay from v9 -> v10.

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
Changes in v10:
- For patch 4: per Stephen's comments, write a new testsuite, not modifying rate
  tests. Updated commit log, and dropped the R-b tag.
- Rebased to next-20260609
- Link to v9: https://lore.kernel.org/linux-clk/177743031609.5403.8748588339056479001@localhost.localdomain/

Changes in v9:
- Rebased to next-20260311
- Fix kunit test by setting return value to 0 when there is no
  assigned-clocks in patch 3
- Link to v8: https://lore.kernel.org/r/20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com

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

 drivers/clk/Makefile                               |  12 +-
 drivers/clk/clk-conf.c                             |  76 ++++++++
 drivers/clk/clk-scmi-oem.c                         | 108 +++++++++++
 drivers/clk/clk-scmi.c                             |  44 ++---
 drivers/clk/clk-scmi.h                             |  51 ++++++
 drivers/clk/clk.c                                  |  27 +++
 drivers/clk/clk_test.c                             | 203 ++++++++++++++++++++-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_multiple.dtso  |  20 ++
 .../kunit_clk_assigned_sscs_multiple_consumer.dtso |  24 +++
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 ++
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++
 drivers/clk/kunit_clk_assigned_sscs_one.dtso       |  16 ++
 .../clk/kunit_clk_assigned_sscs_one_consumer.dtso  |  20 ++
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 ++
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 ++
 include/dt-bindings/clock/clock.h                  |  14 ++
 include/linux/clk-provider.h                       |  31 ++++
 24 files changed, 740 insertions(+), 32 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260611-clk-v10-846cfd3e561f

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

