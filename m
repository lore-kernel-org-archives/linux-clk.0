Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304833FD12A;
	Mon, 17 Aug 2026 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964187; cv=fail; b=GbTJgJac5mJKHmC+EV3cDnP6D2hvmHwrH9LPUcB3hqLMbPO8BMRBvCUVMo0mFZimkZfhPV+t2cHG1iV2pQ2e9uEyjYj5Wx/U8qC3qM5relGFrJ3VlIfI4V3IGRzvUwfrWqtUDBZbiLjixGpwpkWwABV/V+ZvAklWt1H19mFWkv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964187; c=relaxed/simple;
	bh=FolSliqcOMZplaheNMJAM0OqHVmYKgIrlrI3pirmAGg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hanE5FlqFjL5gxgWa55HvrZDzPiZoR6NUQ6TcNjK6okQqMK9zCutkkpc27UlZ6FnUdEjIyUqAeWWKV61F6gX2M2Hgicw0m2bUeKoiSXYcXjJNE7ndZ80q5nby5SVileVF/0mSsKrBkE3krUwTTb3r/522ONNXfj+yXGJSDLI01o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bvrYqhcy; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bvrYqhcy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/Xp1kpIFIdrEnlhY831IyaUbqFQqvLaRdyYEpYgF/36NKHwArTgA1Vfeu3lnnyCGRoKbqaSE26rLcIp8BpvCtvO0oVxH1sfsAdWpdugtZ7mrDotq1oqx18aATWxV55XgnrDYaNX6jHrK/5DEsMQue9Ffp4Zil3JI+GcU/cXYMuRCa27e2xLBTJCO8uhjHbSIAPMOQ3JBLu5Vi5FMrY1tgE8jAa17IUV4knWCBmgtZh+Wzdkt+hLPkGkO44wOPYaBo5pAk+3aScSwSxY4h4oTgPrDLlrQTun+aNBVmK/spWkrpMo/yZXw6HgWyEaNN9IAUG/YSZatPFI3VVCBh+hZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyiLYMwcXtd1FqPQTW4zPAlZXWSJwppqXoPqH3OQ+7U=;
 b=OJjxYeOGI6ncpVTy2rYrnEX3GmPrJzCPgdy6FwBv9Zzf5dUul7MLFOK9XkixTk0WSEKOERDZncmD/s9YV1VJv9fJFQ+V7gthaaVF1uAZDhiyIWVnMrIxD06iMfJe8u1PR39T3XMjFaXKSj2/MjpdAyjX/UE3UvrHKn/8s3iphUjogmQGBpd5CN3INnvBvlaCJqNdG8iKcVPcvNl35rgnW3O27Yo7pURU7qqyDKRbQc1zkSD6e2i7NRWvWrIJtgK0juuvXc9PE0b/XD/RH+a/cWS6+E75ekHqjtVLWFyiSE2zAfMoLuUhUelIDVCLEfpcauElK/ISNHXZkQ0kAMsAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyiLYMwcXtd1FqPQTW4zPAlZXWSJwppqXoPqH3OQ+7U=;
 b=bvrYqhcyghpYJe5sKfS+h6lFyNVMqlkOfzcis3bhpZmCc9DQlwyLxULDF9dQjZ7ONziCDbzKLT9t20zkaZMmz06keiidJGXVGVThi85SHrEVjNzgSAcHRySsqjBLHfbANkOhHaVUAK6ltqpfHQAJbc3W5TbF9U3dFX5cL8+1M7xTdNMJF0rjeoAO1DJAAfWAH8A+tkasHZt5GgvvhE8Cl7Dr0HhwmfAMm2rJyj447uAHQfeWVQJdeXHuWMY4njoQiM7cpFvzxeXIjB9ZhJsp5d5i+oyRiGGES80c0S4UfT+dvoBLC1WCQD24aBztVfchKKJHUYkkxgAoVOVlsb2+Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:56:04 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:56:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 18:59:35 +0800
Subject: [PATCH v11 4/6] clk: Add KUnit tests for assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-clk-v11-v11-4-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
In-Reply-To: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b31108a-c64f-4b17-d9df-08defc4e220a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aangbOwtg48lzpRmYk9QX/EDfnO2q0tAOkwFC05oS6gwd4imnUpPj6DPQOr9eq2lICwGFVFITagFzg8ovhJ5UwKZ4TEUr2G3sSJ6ADmLXFIdxqsswZFoUjX6yiJ5QckaufcxDgra6v6J9muiCbWNDy52+9cS0sE/fN4nZ+SUzLwLEJhyje0WlyHuMvJ5SbyysZTBgfIxJWf0Zc5sNcHL4vs5xGDrGu6XDYSFWh9njyiucYlWFiqxb5HNz1IOEg9XP56KeJI/gWqzWL7NavBOSOndlQPX1lwBpJmGev71HUlZ0UiSl/xBeZ4Od2hgtE7ayKomypfcfhh/WczzxILiE17KHPVSpJyKHi3zJ82eZ7fvD468zqKwvAEwkR9Q3uwwcn3Cxnhd2chsZT1cNKNgiiMjI3NehiPpHVJTrouwClJ2KVyYUMYxrsmuy4kDpKZ6nhje+XWl2uJVXNfbAvh4sG8ucjhMfrA0104qmB4tVErB6nIh9tlEHMT9dFmjal8gU3jtPFDZUFLhzKi3rKXGp5RXswHOlX2wMgOCsad4x5SSA7Ovl0TTt9UU4KoIPj+WI5TGmmK8gXFDbhPr9csSOQI1DhM9YSYhPH0ayFkm1phWStI7Pd2uaXBuDFvs8GAza8HgS+ax9435qIS0A/wLguwoqG8XVSS6jcllD6dl+L4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y21XWUhNOFIrRTlDVVB0UXpJMElkdlE2RlVnT1RwTXFzYUNPazhZVkNlOUwy?=
 =?utf-8?B?ZG41c3dPZE9tMU1sNSs3NitKQnJKc24zaGJmcDFGQ1dqeVE1T1lUZVRnaENB?=
 =?utf-8?B?VVp4UkU1SzZWSHV1dlFFMVAyQ2pwQmhkOEJxS0pTKzVpaXZMOVZ4ZkozOUwv?=
 =?utf-8?B?aks4QXZaeDNPR0cxeVp4MWRwbWdjaVN1MVJ2Si9lSTd5TVpjZE9iYm85MDZW?=
 =?utf-8?B?YmNOWmZWODQ3ck5ac0pqMDVTVmcyQ3RXbmNJN3M5OEdlQk9pQ2doZlJwL2Fq?=
 =?utf-8?B?UjlBSHA0bm03T285WGtVNmNTeEgxcSszOVZuTkkrRHhJRlozVXJ4elhnRGFr?=
 =?utf-8?B?d3RLWWcyUzBvL2sraWJjZHloUHVwbEtTdE5SclZpUG8rZ2xRN0hRdjhTZFhp?=
 =?utf-8?B?UG9ESjlpNTEvdTdieU04ZFRGejFVODNHcUlZZFo2L1d4OXlsaGFlUm1kb3Yv?=
 =?utf-8?B?czZ2WUxvdXhBbFBLcE4vRDUzSlR3bWlMQ0dxRzNxQUpObXFxUXBDZVpTY1Zi?=
 =?utf-8?B?dlZJU3lsT1RXTGNKSU5waFlTNjZFdnNnQUdEeENybGhZQTFHTnBKK0JjQWpa?=
 =?utf-8?B?QnVCNDRRNjdsa2hxWGJkOFhDV2IxUkFrOXA5MmNidGJxOEhtVWRXTlFRSHJu?=
 =?utf-8?B?c2hFSXVyRmo3V0NpRElmRVQ4UlR5SUdIUElsdFZmVEo2eE9OdmNIaFBEN1J3?=
 =?utf-8?B?YWZQQU12NUhoeUdYeVZUN2JobmxwYnQ4T21Cd1Q3S2JBODVuSjhOMWNoaVpD?=
 =?utf-8?B?aXlvVjIvZWcrWFdhVmJWNlRoTlRranlvQmd5Sm04Z2RraTJiR20rSCthN3JK?=
 =?utf-8?B?SW9KeTl0c0VuWFlBYU1xVXJPa2c3OE9NdmNva2syb2g1eGhKcUtqU3ZYWnpz?=
 =?utf-8?B?aXUxVjc2d0lpWHpVOWpBTW5XNEhzQVFDZ3MrbWp0Mkp1MEd3dzJsQmtWRDV5?=
 =?utf-8?B?WGZXOEtQa0ZVZFdER3FleUZXdXY3eDFJSHdFL2FUTWw2NE01REJXN091Wmhj?=
 =?utf-8?B?NFNtRTVEM0srSzU4eG5zS3AvZ1FYRnZMalpEK0hsakNQcEtDQW1tc0xOS2ZW?=
 =?utf-8?B?WmJBOEdyZWZTaCtPcURRVlJLTHAwclh1SmpUVTZkZVJpcC9ocEUrTDkrSjd1?=
 =?utf-8?B?T0RCT2t4N0t6VFg3cFo1OTllMHZweVRyZ2dQYld3TFBYbDRWaWl1c3dGT2du?=
 =?utf-8?B?dXpWQmFQeWNodmZiUzJNTHQyWlBpaERwNm1VYkVjQWFsajA0Q1o2TWVibEN2?=
 =?utf-8?B?eFpoaHRNdmtRY0VVdlgrZTRta0hVa2c4a1FaWEVCOEhLdHVaSVBrMXk2bnIx?=
 =?utf-8?B?VUIybllLcEVwNGR1UVBRc2tscDc5TkZHbE5PVURJenQ4WW1aNWpaZ2lFQTJV?=
 =?utf-8?B?bnJLditDWUVaUGI2ajVUdkxXTkU0b0h4Y05kYXY0RnZ5V2FxcEIzSmJLamJm?=
 =?utf-8?B?MzdFQ2NpbUJhU0NaYWk3bUV1R0JMQ1l3Qm4yblAvRHZyRHFLMXRDaG5Oblky?=
 =?utf-8?B?cVRhcU1mdzJ2TVVxUnZ4RWJIczlKMVhYazlEVUFXVzdGYkpnQ1lyR0M4QTNW?=
 =?utf-8?B?QVBLN0tHY1p5cWFhWUN1TzZpcHlGQXNTRWdiQmdiV0IrZDAzcUpYSEdvQ1Qv?=
 =?utf-8?B?U2RkZGxtbTNORStDTnJuWnhtVzl0V2RLbmpjeVN2cS9nUDh4SCs3cFJqOHIr?=
 =?utf-8?B?eUM2WDFMTUVUek42UmZvRE1ETGlSenJtWG43blJvRWNzUlVsRzFiN0x3RXhy?=
 =?utf-8?B?eGtmNEZzNEw2M0E2WHVnS2tMb2wwb1BjVlN6R3ZTQUVtTXM2WW8xSFc0NWZo?=
 =?utf-8?B?MmEvZlByY3BYNE5sZmsyVDVWdnZqZWdDa3hYVWR4QlJ3YmprcHpPaHFCcmlj?=
 =?utf-8?B?eDYva2pLNC8vZ1dhTkwraHlLZUR5NzAxMWN2aEV0c3VoRkhuVmwxT1QydmdI?=
 =?utf-8?B?MmF0ckZzaE01NFJPU2g1aXZTMkhPNTFmRzdxN2ZLdWtkMzRqdUJHbXdENklJ?=
 =?utf-8?B?ZFAvM3FBU0JlMzdVWUhvQUVXdW9IL1drM0ZVek5wbjFiT3FMb2poQURhWWo4?=
 =?utf-8?B?R2tJSDlUVUNZOTRNM21TSWZJMk9VYXl1VUpVSWhBdlRQV1FMaHRDb3lrenE1?=
 =?utf-8?B?aEFBTUlLZ2xld1NURU9oTW5ydnArYmpQSFI4K1lONkRkSFFUeDNpSEsyVlNo?=
 =?utf-8?B?amsrdE4xS010MVN0SkhMQ3hKTFZvMkhEdi8xWnVZaXgrY3UrZGFYcnB5Vm4r?=
 =?utf-8?B?akxwOWVja2N5NWZicWVEeExLVE5iOUNVMXJaWEljaCtFWExIQ29pS21xUTI1?=
 =?utf-8?B?VGtjbWQrVjhaNG1zcVgxRGxDWUM3V1htc0VxR2hhOFovVmRhbEREeUk2cDZW?=
 =?utf-8?Q?tbuyeIdTP/2AT0JS4N1pbqmsAvUhHL4JhSKZL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b31108a-c64f-4b17-d9df-08defc4e220a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:56:04.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eP2dJV8f/SY6qoX8df8M666joyeF3svRn77PMglpaev6VFM5tfMRh3G1aB2L7+CPYIjrjtayzSwoUy6FeSGXt8/kk4/gt9ykhOM4L3D7Z1UDMudIi8T5UvTzLlfvhnk9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072

From: Peng Fan <peng.fan@nxp.com>

Add KUnit test coverage for the assigned-clock-sscs DT property that
configures spread spectrum on clocks before they are used.

Extend the existing test infrastructure to support spread spectrum:
- Add struct clk_spread_spectrum field to clk_dummy_context and a
  clk_dummy_set_spread_spectrum callback
- Wire set_spread_spectrum into all dummy clock ops
- Extend clk_assigned_rates_register_clk and test parameter struct
  to propagate initial SSCS values

Add a new separate test suite clk_assigned_sscs with three categories:

  1. clk_assigned_sscs_assigns_one — verifies that a single
     assigned-clock-sscs entry correctly configures spread spectrum
     on one clock, testing both provider and consumer paths

  2. clk_assigned_sscs_assigns_multiple — verifies that multiple
     assigned-clock-sscs entries configure spread spectrum on two
     clocks, testing both provider and consumer paths

  3. clk_assigned_sscs_skips — verifies that malformed DT properties
     are correctly skipped without error: missing assigned-clocks,
     zero-valued SSCS, and null phandles, tested for both provider
     and consumer scenarios

New DT overlays are added for all test scenarios:
  - kunit_clk_assigned_sscs_one{,consumer} — single valid entry
  - kunit_clk_assigned_sscs_multiple{,consumer} — two valid entries
  - kunit_clk_assigned_sscs_without{,consumer} — missing assigned-clocks
  - kunit_clk_assigned_sscs_zero{,consumer} — all-zero SSCS values
  - kunit_clk_assigned_sscs_null{,consumer} — null phandle

Co-developed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile                               |  10 +
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
 17 files changed, 416 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 6899e32e14aa6..3a73b81c2ec08 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,16 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_without_consumer.dtbo.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_one.dtbo.o \
+				   kunit_clk_assigned_sscs_one_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_multiple.dtbo.o \
+				   kunit_clk_assigned_sscs_multiple_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_null.dtbo.o \
+				   kunit_clk_assigned_sscs_null_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_without.dtbo.o \
+				   kunit_clk_assigned_sscs_without_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_zero.dtbo.o \
+				   kunit_clk_assigned_sscs_zero_consumer.dtbo.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b1961daac5e22..824adc95e0b2f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -28,6 +28,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	struct clk_spread_spectrum sscs;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -83,6 +84,17 @@ static int clk_dummy_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
+					 const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	ctx->sscs = *ss_conf;
+
+	return 0;
+}
+
 static int clk_dummy_single_set_parent(struct clk_hw *hw, u8 index)
 {
 	if (index >= clk_hw_get_num_parents(hw))
@@ -100,18 +112,21 @@ static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_maximize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_minimize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_minimize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
@@ -3097,6 +3112,7 @@ struct clk_assigned_rates_context {
  * @overlay_end: Pointer to end of DT overlay to apply for test
  * @rate0: Initial rate of first clk
  * @rate1: Initial rate of second clk
+ * @sscs: Initial spread spectrum settings
  * @consumer_test: true if a consumer is being tested
  */
 struct clk_assigned_rates_test_param {
@@ -3105,6 +3121,7 @@ struct clk_assigned_rates_test_param {
 	u8 *overlay_end;
 	unsigned long rate0;
 	unsigned long rate1;
+	struct clk_spread_spectrum sscs;
 	bool consumer_test;
 };
 
@@ -3116,7 +3133,7 @@ static void
 clk_assigned_rates_register_clk(struct kunit *test,
 				struct clk_dummy_context *ctx,
 				struct device_node *np, const char *name,
-				unsigned long rate)
+				unsigned long rate, const struct clk_spread_spectrum *sscs)
 {
 	struct clk_init_data init = { };
 
@@ -3124,6 +3141,7 @@ clk_assigned_rates_register_clk(struct kunit *test,
 	init.ops = &clk_dummy_rate_ops;
 	ctx->hw.init = &init;
 	ctx->rate = rate;
+	ctx->sscs = *sscs;
 
 	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, &ctx->hw));
 	KUNIT_ASSERT_EQ(test, ctx->rate, rate);
@@ -3167,14 +3185,16 @@ static int clk_assigned_rates_test_init(struct kunit *test)
 	KUNIT_ASSERT_LT(test, clk_cells, 2);
 
 	clk_assigned_rates_register_clk(test, &ctx->clk0, np,
-					"test_assigned_rate0", test_param->rate0);
+					"test_assigned_rate0", test_param->rate0,
+					&test_param->sscs);
 	if (clk_cells == 0) {
 		KUNIT_ASSERT_EQ(test, 0,
 				of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get,
 							     &ctx->clk0.hw));
 	} else if (clk_cells == 1) {
 		clk_assigned_rates_register_clk(test, &ctx->clk1, np,
-						"test_assigned_rate1", test_param->rate1);
+						"test_assigned_rate1", test_param->rate1,
+						&test_param->sscs);
 
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
 			data = kunit_kzalloc(test, struct_size(data, hws, 2), GFP_KERNEL));
@@ -3403,6 +3423,182 @@ static struct kunit_suite clk_assigned_rates_suite = {
 	.init = clk_assigned_rates_test_init,
 };
 
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_one);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_one_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_multiple);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_multiple_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null_consumer);
+
+static void clk_assigned_sscs_assigns_one(struct kunit *test)
+{
+	struct clk_assigned_rates_context *ctx = test->priv;
+
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
+}
+
+/* Test cases that assign sscs for one clk */
+static const struct clk_assigned_rates_test_param clk_assigned_sscs_assigns_one_test_params[] = {
+	{
+		/*
+		 * Test that a single cell assigned-clock-sscs property
+		 * assigns the sscs when the property is in the provider.
+		 */
+		.desc = "provider assigns",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_one),
+	},
+	{
+		/*
+		 * Test that a single cell assigned-clock-sscs property
+		 * assigns the sscs when the property is in the consumer.
+		 */
+		.desc = "consumer assigns",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_one_consumer),
+		.consumer_test = true,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_assigned_sscs_assigns_one,
+		       clk_assigned_sscs_assigns_one_test_params, desc)
+
+static void clk_assigned_sscs_assigns_multiple(struct kunit *test)
+{
+	struct clk_assigned_rates_context *ctx = test->priv;
+
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.modfreq_hz, ASSIGNED_SSCS_1_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.spread_bp, ASSIGNED_SSCS_1_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.method, ASSIGNED_SSCS_1_METHOD);
+}
+
+/* Test cases that assign sscs for multiple clks */
+static const
+struct clk_assigned_rates_test_param clk_assigned_sscs_assigns_multiple_test_params[] = {
+	{
+		/*
+		 * Test that a multiple cell assigned-clock-sscs property
+		 * assigns the sscs when the property is in the provider.
+		 */
+		.desc = "provider assigns",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_multiple),
+	},
+	{
+		/*
+		 * Test that a multiple cell assigned-clock-sscs property
+		 * assigns the sscs when the property is in the consumer.
+		 */
+		.desc = "consumer assigns",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_multiple_consumer),
+		.consumer_test = true,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_assigned_sscs_assigns_multiple,
+		       clk_assigned_sscs_assigns_multiple_test_params,
+		       desc)
+
+static void clk_assigned_sscs_skips(struct kunit *test)
+{
+	struct clk_assigned_rates_context *ctx = test->priv;
+	const struct clk_assigned_rates_test_param *test_param = test->param_value;
+
+	KUNIT_EXPECT_NE(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_NE(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_NE(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, test_param->sscs.modfreq_hz);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, test_param->sscs.spread_bp);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, test_param->sscs.method);
+}
+
+/* Test cases that skip changing the sscs due to malformed DT */
+static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_params[] = {
+	{
+		/*
+		 * Test that an assigned-clock-sscs property without an assigned-clocks
+		 * property fails when the property is in the provider.
+		 */
+		.desc = "provider missing assigned-clocks",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clock-sscs property without an assigned-clocks
+		 * property fails when the property is in the consumer.
+		 */
+		.desc = "consumer missing assigned-clocks",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+	{
+		/*
+		 * Test that an assigned-clock-sscs property of zero doesn't
+		 * set sscs when the property is in the provider.
+		 */
+		.desc = "provider assigned-clock-sscs of zero",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clock-sscs property of zero doesn't
+		 * set sscs when the property is in the consumer.
+		 */
+		.desc = "consumer assigned-clock-sscs of zero",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+	{
+		/*
+		 * Test that an assigned-clocks property with a null phandle
+		 * doesn't set sscs when the property is in the provider.
+		 */
+		.desc = "provider assigned-clocks null phandle",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clocks property with a null phandle
+		 * doesn't set sscs when the property is in the consumer.
+		 */
+		.desc = "consumer assigned-clocks null phandle",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_assigned_sscs_skips,
+		       clk_assigned_sscs_skips_test_params,
+		       desc)
+
+static struct kunit_case clk_assigned_sscs_test_cases[] = {
+	KUNIT_CASE_PARAM(clk_assigned_sscs_assigns_one,
+			 clk_assigned_sscs_assigns_one_gen_params),
+	KUNIT_CASE_PARAM(clk_assigned_sscs_assigns_multiple,
+			 clk_assigned_sscs_assigns_multiple_gen_params),
+	KUNIT_CASE_PARAM(clk_assigned_sscs_skips,
+			 clk_assigned_sscs_skips_gen_params),
+	{}
+};
+
+/*
+ * Test suite for assigned-clock-sscs DT property.
+ */
+static struct kunit_suite clk_assigned_sscs_suite = {
+	.name = "clk_assigned_sscs",
+	.test_cases = clk_assigned_sscs_test_cases,
+	.init = clk_assigned_rates_test_init,
+};
+
 static const struct clk_init_data clk_hw_get_dev_of_node_init_data = {
 	.name = "clk_hw_get_dev_of_node",
 	.ops = &empty_clk_ops,
@@ -3544,6 +3740,7 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
 
 kunit_test_suites(
 	&clk_assigned_rates_suite,
+	&clk_assigned_sscs_suite,
 	&clk_hw_get_dev_of_node_test_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
diff --git a/drivers/clk/kunit_clk_assigned_rates.h b/drivers/clk/kunit_clk_assigned_rates.h
index df2d84dcaa935..d7ae5ec2d25be 100644
--- a/drivers/clk/kunit_clk_assigned_rates.h
+++ b/drivers/clk/kunit_clk_assigned_rates.h
@@ -1,8 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#include <dt-bindings/clock/clock.h>
+
 #ifndef _KUNIT_CLK_ASSIGNED_RATES_H
 #define _KUNIT_CLK_ASSIGNED_RATES_H
 
 #define ASSIGNED_RATES_0_RATE		1600000
 #define ASSIGNED_RATES_1_RATE		9700000
 
+#define ASSIGNED_SSCS_0_MODFREQ		10000
+#define ASSIGNED_SSCS_0_SPREAD		30000
+#define ASSIGNED_SSCS_0_METHOD		CLK_SSC_CENTER_SPREAD
+#define ASSIGNED_SSCS_1_MODFREQ		20000
+#define ASSIGNED_SSCS_1_SPREAD		40000
+#define ASSIGNED_SSCS_1_METHOD		CLK_SSC_UP_SPREAD
+
 #endif
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
index 389b4e2eb7f74..3a717dab2d00b 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
@@ -12,5 +12,11 @@ clk: kunit-clock {
 				  <&clk 1>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>,
 					   /bits/ 64 <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso
index 3e117fd59b7da..cbee7cbad068f 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso
@@ -16,5 +16,11 @@ kunit-clock-consumer {
 				  <&clk 1>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>,
 					   /bits/ 64 <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
index 87041264e8f54..9b04d6927f083 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
@@ -10,5 +10,8 @@ clk: kunit-clock {
 		#clock-cells = <0>;
 		assigned-clocks = <&clk>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso
index 3259c003aec0b..4784d40520f41 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso
@@ -14,5 +14,8 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_sscs_multiple.dtso b/drivers/clk/kunit_clk_assigned_sscs_multiple.dtso
new file mode 100644
index 0000000000000..e3472f95987c3
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_multiple.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <1>;
+		assigned-clocks = <&clk 0>,
+				  <&clk 1>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_multiple_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_multiple_consumer.dtso
new file mode 100644
index 0000000000000..6e8971bd272ab
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_multiple_consumer.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <1>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clocks = <&clk 0>,
+				  <&clk 1>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_null.dtso b/drivers/clk/kunit_clk_assigned_sscs_null.dtso
new file mode 100644
index 0000000000000..43b2068c845de
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_null.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clocks = <0>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso
new file mode 100644
index 0000000000000..bda008f5aaa35
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clocks = <0>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_one.dtso b/drivers/clk/kunit_clk_assigned_sscs_one.dtso
new file mode 100644
index 0000000000000..91f585b5d8c9b
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_one.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clocks = <&clk>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_one_consumer.dtso
new file mode 100644
index 0000000000000..0bc8a03c20412
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_one_consumer.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clocks = <&clk>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_without.dtso b/drivers/clk/kunit_clk_assigned_sscs_without.dtso
new file mode 100644
index 0000000000000..08660846b55c1
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_without.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso
new file mode 100644
index 0000000000000..e1c089c6f0c02
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_zero.dtso b/drivers/clk/kunit_clk_assigned_sscs_zero.dtso
new file mode 100644
index 0000000000000..f39f4e754e532
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_zero.dtso
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clocks = <&clk>;
+		assigned-clock-sscs = <0 0 0>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso
new file mode 100644
index 0000000000000..d6bd7dfada7e2
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clocks = <&clk>;
+		assigned-clock-sscs = <0 0 0>;
+	};
+};

-- 
2.34.1

