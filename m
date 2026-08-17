Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC53E63AA;
	Mon, 17 Aug 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964153; cv=fail; b=qPS4Ze/ScJkevDmjLotMiffHydT2JEdS/PV+zezCTjztwdDzm+oNtKyWClr9x/6Me5bG3H4VNLbrLrWKxyUD3gXOx511Uv/AMWBcpUuRVWPokBBt1jfbX38G9uxQb6/ZSOfyeFGMvCAcDkXLMQniuB1h2i5tZ9Z0z5ekz87zWnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964153; c=relaxed/simple;
	bh=MDUQeh0+wfIeAezCJi7GCGik+E90YxLogpnRBabUWfI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=N9JR/sI46+aVl+DDqqote8Pa6vzROhVz6uwiqylILkNuRSaoGl/hzlC/Z+TFK9XknE5EzrQg0uxOx07WiweSrqndTj12iAOAkIVvigou/IPbJaT7uz7q793gzMV4WbccRn5mtRDkNV8wy3bJo56rT965yXEypls4CfVeJSmARKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j+3G7Xd4; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j+3G7Xd4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXTfvqS4q6EbH4j8mRpgMGSe+b9PTRi2X8WyCnx/jwVv1kuGloDT8YqslMDDy7jdglR3BZdJyf2a10QXXDA/Rfzhmhmv7Ubr8J8jl1IDVdrsEw1PZ5Y8gd3QOujwvIRSTNzty2zXl8uR7ZQgG9ZK8Jc3Wgy6rJZLqAO0U8V9OOMzkhHepJjZm+Kgg5R1NJJBuca01t0N1F/DZDmIqaauiS4ruqXE24hhO+vwvYmLDe/rqnA8jMqrXYy0eNJ+UKT4yULnjHEHctqNbBLBdPQzDHIFEwG2vsat7hjEWV1hDmmHQS4Ca0FiNzgp7tgQeYlucTdstqxH+YtxgEkXhixT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/eaws+/ZFc3XbSb1qaAqDr6NzT+Mb74c6aaokulpTg=;
 b=omcsyw8iam8htaFmmNk4FaIVenNTr1M/ErJoXptH4oUbf+Om4t6IzrMtYGpaspJgqgkq+7sbnt87CieeaBcQnbRpSlSaYs7gk24bfxEToF6sizkDzewm7Sn4xhp4MeUvKsDTt+Atu5cFkZ4/7OGJRbacUSXu80mhWRlHsYumCow1Ft6Un0bo9bq2huZbirftxoF2g19Wi5gQtZSzlpmeXl7DTSBDbMe5IskAon8q8Thbc1PAsevZFEE+AFbVL31Hp/peCpErTfRbwVvEK1bfIeTqQFUXDOJWDscLEXfre9CB85L/nxamM+m0W+fF59gXtm7dyxKL/sbJZOUmKCuhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/eaws+/ZFc3XbSb1qaAqDr6NzT+Mb74c6aaokulpTg=;
 b=j+3G7Xd4NX3tlrUNmDU52BLE6V8jGkgzxrEaANaKqW0vuZU5B7Hr5X0yUnlfjTxjgKjjk9M0mVwO4rzJ2zbcE+5QMZunQ8O1Y4PO/65gCJNPDQ9GoPbaRbmEGtPkPqwaIs7IdAOenjxwx+qWa5hvKA+tBvK1ZgOO/ny/OYa/CnnMxNMbhbV7P6r1dMlGEzJ8h+DxSxM9S8E+WxhuX8tXKu67kUTHpGSYw27R5Hzy5zvwD+Dze6cKFUOGy5pz1vikGj9xRm45H15OQ6sobSFQHbPnEB3L8By7ORGn0TwTqXhztHTj+aB95ZwTjhao/fRCzKirDc3KCjoRLRe9cOVZxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:55:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:55:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v11 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Date: Mon, 17 Aug 2026 18:59:31 +0800
Message-Id: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJTpgmoC/yWMSw5AQBAFryK9Nokeid9VxGI+jUaQGUQi7m6wr
 Jd6dYEnx+Shii5wdLDnZQ6AGEdgejV3JNiGAWQis6TAXJhpFAei0EqiRmNblZYQ7NVRy+eXqpu
 f/a4HMtt7h/t+AANTIyZsAAAA
X-Change-ID: 20260817-clk-v11-ba21b1cdfa39
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
X-ClientProxiedBy: SI3PR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:4:297::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: 78aeb62d-b79e-4c53-b513-08defc4e1547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ISQjytCy49/LxdpLqBzOm56/6oTbb20eqhBegb+CTOSE9BzeBM6eMXPhKqOan75MJfr826QXGhngc+NA2H/09qMRqLt5aLTCgZBHxQ9K2ZLbhF34priHoFUvG7ejabeH5ooTa1LF51yDckL/c8GnKyaGXLlgN1kxl77vpGP4PmBOmF1x5+jWBnUzZB4KgPMmb4AsXnAaFlJko6q7iCCl53uHYrUDxhIr1IrbPjZPiObx7Jqc5Cf2R3NONOWr6buSe9WeM9FfvhwP5t+eXHirn0E1wvNMqboy4cTwcorTFqldPF0jqvLJSFmD+sdUUVl6CALMri5jPUKz2MwUHyD/9hAvkCy+/ZV60sVpiZmo6q5alkuOx9fJsx0wH2hedgfNjnLqvnz2CRt6vwn8F2kP8ADVxnkQe8pGtzkz/RDodGHfNETdb6Rkovmhz6HKwc+NAxsm/8LMihUv9bEMtR00woGHvw440QNJlbvHE7k7CXYK6pQ4Qgm48VfM3Wz/LBq5PNcrGSQx3i+Lrbdk6ypWfuGau1LybJFnQ5w/lDEu6iba3oJb3YT0q+9W++64TnXegCg/JI36Xv2PlCVDRI4sHYx/dEDgKzZA0EiAVVheUvHo/TwPuWPz/p94nWdF2v4GnU7O7ddLSv3xeHFoxWOPAE04eE4i0tl+SMrIzbd3yQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUdiTFpwT25zajhHWWlaRmd2MGJDUDRUSmlITjV6R1hac0FCR2g4YU90V05X?=
 =?utf-8?B?aTlSVHQyRGxiUm1IRnJMM3NiSitCSmtwenp4U0grdGdUV0x6d1hSb1h0cktk?=
 =?utf-8?B?NC9nWC9FSStjV2tBRE9yM1ZYdVQ1cGhKWjlXSW56bkJzNlRRR252T1JidUlT?=
 =?utf-8?B?UjI2RExLRHRVSGZTaERzcmd1RERCeURTNFA4bWkvaTZqamc3U05TUFhpS29K?=
 =?utf-8?B?ZEd2eUx3bC90ZlNraThOcS9XMVFoakdGY2xMVWR2dkJXZW9LOEJhalcrejhP?=
 =?utf-8?B?MHIyZ2plcXlPYjRuVFBHNTZjVnQ3dnhkdzF2aHZkOFRoSStlS1NOdml0SEtQ?=
 =?utf-8?B?dGJjTy9oWVBHNTVTNVNoNm5rMmpZQWRqNUVkSWRKV0Exd3ZOSjgzaGRPcFZz?=
 =?utf-8?B?RFJDd0ZzNDdOWTRYZCs4ZUZBQlZPS1BwK1gzUzlGcHUxbDdnaUs3d3ZhOHhN?=
 =?utf-8?B?TFo4S2tRc3JZMW1pYUxmbTVVUjdQSFZPUnlzNHp1ZFJMTG9xbXArcjdBbjVF?=
 =?utf-8?B?VVVZQzNyZFJxNHdIMG14eU9aajlxWFFTb3VheHNQL24rdTh0K3JFa1ppYTln?=
 =?utf-8?B?NFlxYllCVEtQelpPckYwMlhTNnlaY0U0VjdmaDg3UkF2Ly9NYkMzS3hoTS9E?=
 =?utf-8?B?OHAybGczMkF6cXExTWF0aUY2TDJIdFI2MnBGcXBxNlAxUkJQSFlnbFJJdmhX?=
 =?utf-8?B?LzhjWXEzNHRlTDdoSXVYVGpFN2xZMXBTekRSYU16UnM2dlE0cGhYR2tDbVdt?=
 =?utf-8?B?aFBOOGZHMDRZbTg2cVZ5YURaQUNMblpHK09CeUVtWWJuVmlva2YwdXJrcFc5?=
 =?utf-8?B?N1lTYklMZE9vMzJwUmtxWVBJV3I3YTZudVdvaVZKOGVhZVdGaUR2SXREcVgy?=
 =?utf-8?B?dVhxTyt5czRwMkdrTGFKL2hyMGJ6TStNdnFhYWwvRnN0bWx2amc2Q2QzeGor?=
 =?utf-8?B?TXhnYjFDcjVaRGVKYUhJclAxdzM4dTJ0UndHL3orL2xsYTZueHdRREZDZnBV?=
 =?utf-8?B?YkNkbHVLUnlhMkRRYUNLSytnaFRnd3VGRGhWNTZoK0Z1dkpuOFdBQ1g5TDE1?=
 =?utf-8?B?UEdiYVJ5WWNLemplNHI2cVdlZU1lNGgzWDhkNi9rU010OGlzZzh1c2U5MXRI?=
 =?utf-8?B?TEpqUWw2bUUwVXZ2b2RCVWRmYWhrZHZ0R2NxOVI2a1NjNG9CbFJwTnFJbTJ2?=
 =?utf-8?B?OGhxK1pEREx0bFdxNHlJa0J0RHEzRitYcTBLaUNmc1Z1MGh4SU9yMTB5TWNE?=
 =?utf-8?B?Q1RuVXFlUzB0eitTamYwakpuM0lEdGlhak1zYVhGUUZSRE9zTElIaFBnK25W?=
 =?utf-8?B?clBzR3ArbzVxem0yUENCUHlEd0QzNXV1TTVPTitUcFh1Q290bkdPbDNhNmxx?=
 =?utf-8?B?QWxNU0xKdUJCOS9NTlo1KzVFYWVnTVhzZHFJbHorQzhLL1c1bFlKN1MwdUdy?=
 =?utf-8?B?ZXhCejBZT2lhekJOQUNocDlQaHN0eFFQWDdvMXd5Wlo1SWlwS2xYTTFsRVJC?=
 =?utf-8?B?aDVzVlBLNU9YY0xpUHJtVDRrVHJpYnhsMW44SEg1cTVkNjB4RG5PMktueUZq?=
 =?utf-8?B?Mjh4MCszbDdGMWJjY2xSSVY2OEdSeHFHTUJuUXFoQ2dFZHBxRzJTU1Z1TXVs?=
 =?utf-8?B?aktQZXgzeUk3NGFVU1k5UVp5dTNHbC9lenZTWGdteXhNSkNrN3MwOVltQ1FF?=
 =?utf-8?B?d2NHR1pPM1puS0lKZnlmVUhXZWtJeFVtMU1jYlRKSTlTa2JCNDVGdUhNbFA1?=
 =?utf-8?B?dzVkN0p1djRMd3Y1b0d1Rk9kVTYzOEhoNldERVlrc2Zsek1lRk54dHBEcEVo?=
 =?utf-8?B?MUppdGRBSlJVNjlvV09La0tObjZTc2U4RENWWkUwU1RhMThtSWFlN0lqbDQ3?=
 =?utf-8?B?WlBwalN2UnlrSUcydUJxMnIxY211ekNzaFVuWjI0eUtHbDVVOXpkclpDMU5o?=
 =?utf-8?B?d0FKL3hKeENEdWd5VHovYUZoYm14Tjl1Ri9OdHFMZjJ1cjFBVVlyZ2RRRFk3?=
 =?utf-8?B?ZG5wckNuRmtNRlFUM3JGRDJHd0ZUZmlBcFJlV2FrdlVsRkJ2dzkxSmdCaWFu?=
 =?utf-8?B?SXRjWTJVL1NtdFFoVElRTkdRY2JicDRXRnBXZFlVdnRjUjVlU0pkckVVMGpn?=
 =?utf-8?B?K0pPU3JTV0VXYlM2TE1qRGZVVHpEYmdleFQrZjlDS2VyVmIwRy8yMEk3WVlJ?=
 =?utf-8?B?TkVUczdVY1dLNnQ3czFxU3dGTkh6VHF4TUdyNGZwdCtxVTBJaDRKL3FnSnJt?=
 =?utf-8?B?aXJ4U1lUc0ZyM1pkcWtaVmFwZGsxMVQrUDhPN0wyK0dGaG10Z2RsQlN2RkRn?=
 =?utf-8?B?ZFpUeTg1L1RBeHJZVmhCMVZGQUFjVDlIS3o1Tmx6SFVxWUErazRwVDhSaERr?=
 =?utf-8?Q?GfIGhg6S22S32yrFaCYT4LX4AS3md3jR3cD1C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78aeb62d-b79e-4c53-b513-08defc4e1547
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:55:42.9707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYF7bh/rIkwO7cBo4pZmMiO8gBxKFrL4QV1Z2bITYHSeosX9HABHruq7pNNV/+u6Iyhfd1AlzM6LHSFYlrKm1yZFJbi7/TJLlZy+5hAcZC43if69AFlHXoasSS1Ph931
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072

Changes in v11:
- Address "driver fails to link when compiled as a module" reported by sashiko-bot

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

Changes in v11:
- Address "driver fails to link when compiled as a module" reported by sashiko-bot

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

 drivers/clk/Makefile                               |  13 +-
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
 24 files changed, 741 insertions(+), 32 deletions(-)
---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-clk-v11-ba21b1cdfa39

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

