Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B80437F8C3;
	Fri, 12 Jun 2026 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253825; cv=fail; b=WYqRAErSGITgSWmYMU5LmrT/JD+PTYlESSvsqd/FG7zHFneAmxW2a776mvmED//XkPUyiOSULCIgr8H1JfpbYJVEBXwDdboAdB3qHNXHnUBc8tpdkovLfMTPwg9rgAV7nl8b0X42K47Rmc7FjUwOyvM21GfJeuxoocCrG1sNNmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253825; c=relaxed/simple;
	bh=vh10/+ZfzemYTuspYL1pQPpQb7G6DKK0QHUj5cLkSRE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UrQGfeD6rhL1impzK6tttThZ/TGWLBJUIp0RyZqa8CqaNsKu6ZUmhzBCVNg+W/E64TyVP6/zucqgamdqc1B5fhKawTyIwoATCxdMcZnORHv6MSYPv7DK/P5WtszehC0iHKRS1sOzilvYu7p0ceOSEIYBlwV8h8GIrLkh9bCZDwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=odFcJ6wY; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="odFcJ6wY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv4/5JuoI8O6E9t3sK4kClsThqHeFqwfwbE/YNCVWY7k+QSHJo7/rFqhwhEjbnjAdQl7GSJMW0W5aHCA8+STaJMpRT0ur2Jq9yWU/Hu784K7DzYJxgknWVSGLiJS6V/rzl8//Niixhg45L0q15nzfT0a081A6nZtPGAWppG0BjwbXorKmxdrdLQYpvQ+/clyHz/n16TJlbQmxOlqb3c7ktMp9uHLK+xr3Gi5q/Pg+HqVQknKdkyQ1Ij1CWHZeRz6FTwZWKCNVNwDqn+gy89W9VmtgYlo9ObAvDbmn1zPGfwG2WtgqvL6i+Okhfao22EW7J1ThHYvaKBXKZhu1Xu7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WsLPAal6SwCHdbZGNd0yGXa01g8279vptOZbmmn/NQc=;
 b=LMfRNexQOW0unakCDqF4YAYr4sNMzeE7+MHJsRRS0QW/B1i5RxF4vjFPo5jnm5oVZbTlSX5R17CorCYH8nAQO8ptRYcIcIWbZWJMDfjrXJNQjcDE6O3hhEAiTs6ybKHRc1wjwkN9oSea0y5wuTnzWzdcn+iQlQ1L670m39PZUhR154Kfr6VpuiiAW3Jh3XczHZ4dq4a3BME8PE+nHle4W418+Aza15ig3Fk4Jg4IrKs+qV9MDuml/XuLn6YmkugH+g884g1Aey9O+QIPiBVXmNVzVP2CikSvCG3y6PvMG6G/3ZloLcX5s78mzSQujZx/+nyzqLzS6lRY9NmtH/TOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WsLPAal6SwCHdbZGNd0yGXa01g8279vptOZbmmn/NQc=;
 b=odFcJ6wYh/zovQioMJl8Z30izIJzaooSxe6DfeabtJgGZ00QfJdNxGDY/cZ98nqr56JeklxM/nuF75KbsxR9CyGbEgYLPmrNAo5lo93Cqb2gpMUD1IDKNGnIKkAk0Coa/0qlidAKsONmCUtYZHioowjdxs1gc/ZG9vtslrXTD6T2Xc/s7ZUBFSPzY5KZys3pflqDZc1C3tC99TRKUfXvtWvQTkbk7H1BvC1woSvX+wcAo3bq+xE6duFhbMm28yL/U3VFFgJmvJVx40sAo9+wt1BDWldPw2AV7qT5ESsUUFAwr545lW8f/R3bdlr5N5N8KCyh+YeuHRIAeOtF13wKMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jun 2026 16:46:26 +0800
Subject: [PATCH v10 4/6] clk: Add KUnit tests for assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-clk-v10-v10-4-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
In-Reply-To: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f38935f-6d3f-4353-aba0-08dec85eb2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	enKlXwBgKjT92lGU46EZuCROm8w+JFcHWRNYTmLn/QrVe/e37TBQdjO9coINk54fNMRby82iNEftoHh4D7GBtfxgY0M3+CFqjgethPNiDN48r7Ee9cXqw56/wmojfCX/5FFWHo5xL6l5GFHbUzNgi/xqUeh8vcXHjVWawG228CEiZetYb0WTbG/MK8aadz/nbNEcj4DOKsEgStKPi5hi/cqm3UkQg9C1ncidyGJhkJ2Rku9jyKc9sm/yvaqzaxjG1PWTdpm++10UtObBxHnHXwZQCqhhBaIZQoueY56pquXtdtx5NypEPH0K93sj1SezCJ175u41Pzo+ULL5KG9GvU7kVnKdTYL+kbggZaNmtWUgU7PJzEF4JVm91MTWmZOySMFaNz9VqUai0IT4REtYdnL7ZPBdasNyj3i110/t+flt6nBf93/OpInqdXX/T6OcOeN/5LYfDps8Jg40rrq+8Uzz/oc7xYTVg3wSr9UgxvFMLqPvcqBkEN37pVEM2UuYIqWJVNTbHTLI3lssNA6bN1zewq5bkEPsE4COnXvzIogtyU/PYz30Wq1AjttkgebTgegRf6jT33T+j1hjHPdGd1YxNwlOQ/zlmh1K2hP7Ye4JK/EjU77kj9CW1eBxEiX2eau/h7VaAGBhBao7U3ISbvizMAcLSy0BS9RViEXfYsY0VIfaDPEo2e5vc7rJvDys
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1gxYVpWZHV1ZzY5d0ZENnRFdnNNN1FWbGhpa09BdlprWHAxUm5jdG9YWndP?=
 =?utf-8?B?SXJHUC9Icjc0YzZsRFl1MjkyVzhoNlRrd0F2bS9iR0thY0JmUXZYK3VwdFdP?=
 =?utf-8?B?disxRGdrTnNOQ0tDSjhaeVorNWNTYnBDeUcxUmF0QzFJaFRGZUhsTWhCS3Yy?=
 =?utf-8?B?RHQ0SXRCN0NHbFl5VEQwYTRPTWdOMHJnaWxlUjRtaGRqQnhQTkRzK0YvdTF5?=
 =?utf-8?B?VVhTSzdWQVRWMkFaQTV6VmJEVnJNYk1YVzRpZEx3K041Wk8ybXN1RzQ4TG9V?=
 =?utf-8?B?TzVLRWZ4VTdQdThWNWhlalFadXA1M3VnTHhJRHQ4NS8rVXRJZHZKSTlpcS8y?=
 =?utf-8?B?RGFtcUtXVzRLaHFKbWtuZ0RtbmRpdWlTclN5VEh4MytoUHkzNlNwOU9iWHFF?=
 =?utf-8?B?OEI0VXQ2ZHRjbFdnRlhjeTZiYUdOdk9wUFFROWdvS3dlYTlod1MvTjJrQVIz?=
 =?utf-8?B?RytlWTZwUWJBdVNCTDVMb3pzRXJpR2FXNm5DQUNTRzZjbVhmOVRwMHNwMm5o?=
 =?utf-8?B?c3c2YldkTFpDRlpBZWw3QmtSU1lyZ3VUN1dxdFpmQnBkbnRabkgxbW9lWlNC?=
 =?utf-8?B?Z3lES0FsSHl3MHFDeGJCWUp5ZXAxMHkvUjRZcmZ5L3IyQnE4M0hMU01JY0t2?=
 =?utf-8?B?dzB6Ri9hZ010YUYxaGZQQnhBdUc4ZmxudVU1Z0dKemhMTGFuZnFwR0NyOVhN?=
 =?utf-8?B?b2h2NWUxU3lHUU4va2Rpa0o5NFJ4b3czWE9LWDFtWFlpdzV2YzFTczVkcDJi?=
 =?utf-8?B?ek9COWNSR0QvaU9kbWtIaVYwSHhFUWxmb2k0b2M2dEp6VWRoeUIrZ2R4aXpG?=
 =?utf-8?B?Q05MaUlITU5IbHF1Y3dVTG9NQ0VjellsQ2NVanV2UGlDY25jUjEvb3lNaDho?=
 =?utf-8?B?QTJqOEtWdEFYekZ1SXo2cVhqbFlMS3hHb0VlbWc2eEJGZ0c5QXZBTEVlOUVa?=
 =?utf-8?B?U29CR0VKU3ppejFISmVlMlNIS1hUSGZGU0tESVhyODgzU0wwRnlmbllZQTM1?=
 =?utf-8?B?YmN5Q3lweUVMNjJ5YkJzV1BZTStxVjAvbllGaUVPbFY0SmNyMkZJanAyNmVk?=
 =?utf-8?B?OVVnL0FCM0Z3alBTZ3FFTVN0aU4wWUtpWDdLazlOTU92MHRDcnJ6UmFnanVB?=
 =?utf-8?B?MEVTdE9HR1M1ZGgxOW5HcjdmbmVXRmFQOFdKOHc1aENPTzRDU0NFVCtPSmI1?=
 =?utf-8?B?d1RwL2I1N2EwZWhERjJsNGhXS0I3cks4M2kvbFE5aXR0M2JBWDRTbmZXYi9q?=
 =?utf-8?B?WVVOaWdQeUtXRWJJVVZrMWdXWjRhYW5UamsvOUtOV3FoSlFNYnc0UFR3UDNV?=
 =?utf-8?B?SXJ5Qmh3NTJKNnN6bUtNU0lKd2FEcXF2WWxZempCL3lGUjNZZ3c4OW4xVDJh?=
 =?utf-8?B?RTgxMVF5MXdQWnc2aXYwdGVodklmNVd3SWdjbHdWUTZVZnlOZUwveTNqNGVx?=
 =?utf-8?B?UFJ2UTArUUVtZS80YUJJbjA5SDI5N1U2ZVJGb0VKakFoWmVwOE5Qa01iMVpQ?=
 =?utf-8?B?R1VjYlJRZ3dZWVlQQWx6MjF0c3JLcVlxaUpIL1VlbnJMRWVhWFhReDZGOHhF?=
 =?utf-8?B?OXFCelFxZlIvNEJqTi9kaHJMZVpPMjFucTR1bnNlWGZneHRaRGIySkdYSVEx?=
 =?utf-8?B?SHoxdHdIZVZnZzRMU2F0WGlVcjJ3c3hBUWhtdzlQZEtiV0NOdVE1WmJPUVdz?=
 =?utf-8?B?cnlJb0pXejF1VlM3MFMwbXdKQmtHZWtkRm5tY2FhenhOTWVPRW92ZTJTc2Rn?=
 =?utf-8?B?V204QTJDQWtiR3d6SkYvRDJjWVJaTGZDUEV6SXlTQ2NpdTZmWXJUV3diei85?=
 =?utf-8?B?S09zNThBRmp3bnJKQnhETGlUemJ2WE9STXJOR1gzVGxyU3ZTUkh6YzAxRFBh?=
 =?utf-8?B?Z1JaeWpIak9xenpLa0FDU2diOHVnSGp1ekxNbGpGSUJLMGxYckpTcEgrZnIv?=
 =?utf-8?B?VUlZaXMrNDl5bWdSZWdLNXlZTzA4QnVSa2x4MjNZZEQ3emRPeUpncjE3enl4?=
 =?utf-8?B?ZHVGUWNVZHpPazRnYkJSb0Y5ZENDUklrYjNybVByWVhoRjlaVzRKOUlQSnYx?=
 =?utf-8?B?RGRsT05iTFljMGFXNFJWS2FTajB4MnRWWFVlbmcvZ205cGRwSE9rTG5idUl0?=
 =?utf-8?B?VnRiSVh6dk1MNkZvTjJNSjVlQmcwc0VWN2VJTUpIaFN4VmY5V2lJaFBJSFhX?=
 =?utf-8?B?eGRkSGFZQ014SGFzWlAzKzUxaVpCZlV5Y0MrOTBGaGVZdlhtejVBN1BDZ3Vi?=
 =?utf-8?B?OGp5YXJISk5MMUtQVTJJRTd0R2d4WisxdERPNEkxQXpFMzNTeXZHNWQ0dytL?=
 =?utf-8?B?S3NxeDhvQnlJaUZYSnJ4NHpOdXhwOE5WSDlFaHEwcWlmYk5zRU1XQlJmVG5X?=
 =?utf-8?Q?LjHc8wTAlqWEy9MD6bANHqhyW8OZE861RuV3h?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f38935f-6d3f-4353-aba0-08dec85eb2c0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:38.7084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGt9hgabDPgr3M0GwhljydMQomJJlrJM2CMoDxXQ4eosn5lo4dLkY/FujoiMjlOZWOwKbg3MWnEuYttAnjURJzX6xfC+xYUtGO0aijqhdgYYB1vS5mYn6k9PaA5v19QL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

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
index cc108a75a9008..6a726331b6c9e 100644
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

