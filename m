Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29883AB27D;
	Thu, 12 Mar 2026 06:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298664; cv=fail; b=r4c8Ifw1fTt2HvormotQZCq+Spysb4ocAxzuPY11ujzV9bTpbeDjbGjpby1KSAISRunAgPUuVttjaV/F+ozNyTTNPamexOy03mADs06Oyl1TDj0CoCQXm5ZRqEFdOeEbYYkHak59c+bPf47m+qIr9hpX1BMB7kr7n5x1695Y9cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298664; c=relaxed/simple;
	bh=3GdO4Uw0KcxJMmUaNJ3OU1rxgsTRX48strrNm8g6HWQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Wn+QzyI+EbkE/a1Oy2UdSPr7F4zfd84xPOcfA0QhbJvsXiuWWF4ZVx7FF1C4i3CtZDzqtyQ7DtOyVYdHdU2NEeeEJ/pR1bV29guH6JcovhBPKmMgwmx0lHIxlcWES76PND0tzKaQBJWVIqa/ABUc63EySLDu8odBkqsr5awRfZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oXAsEe1w; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oXAsEe1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHW2BwKmrr85J9O2Z3PMustOCHPw34/FswhmOtDxcPDeOTJ17RLhXVU9lBKZGDLqT/RDlfStG+Sy3veSDVQLu5DqJ0mCp517HrapXa7PLOR86h4+b7fCh49la3Z/X3sXhyi2TeBhf1rBPucbX2pQtbNyYUGIB68Ja0gHj+GpzSNwboCMPG1BTzS7WZfr1sYaJJda+HPGG6r+x7+H0aCsxkcL3y59H1Ni78665ahOQCBi1EFBCYyf3Eb+fPk9fAx9f3nL8luG0XmAZIL4TL4hHFHhUJUKJKHR1eonsreePBNoUNUO+wGYDAqfG/PSjgkPKsuLwanphBkgzMveLEQyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qc2w9iinmz1yFeF0TX/d38ehvC+WZDgD82UmJToiBv0=;
 b=cXsBFIsjI3iXYOUqPk5JgsD7hPCwPiFnkWIWJwjb3HK6ai/pz/W0morA/j8kQDVZRSvk0uExNUqOuCJ6G6JjT/GGVu/YMpPlBH0/3O0cVBMRpwNNAq0511GkpwqeKst6ss5Axm5cPwGDRE7mGDqsRuNrm24h1DR9md7g3IHHnFb0fwtE3OPeMk9nPsYbL/fXnUhsYw1v7rpNPA6qVs4WMZ9qARzqGzqGWeOoQZq6QTDY7JtS3/Ts2UsEWnGimv6TMONdNunyv3do2pGQamO7f0sZig5ZbfDm790tHXI/mNPhCq0FgVDeyP3drNkmAFe0yAfHHnxe5zKtWHbXYLBj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qc2w9iinmz1yFeF0TX/d38ehvC+WZDgD82UmJToiBv0=;
 b=oXAsEe1wm+eBflAGjDJA9dV0bfSnDGp84LQT/YIVQ1ANEpP6I7HF6ieYgRPT/TPZf0fdhrx7KbhMn8iSwox9rPahDabvA/hh6jrDYZNf/BWVkuty+hIF9KpT1lssYzl8LQpDs2EK4ZplUxygckZ2oWS/kkBx/WXpAXRSKsNYNg1qHH6Ny4G8kFPi0VfCy/2pNADaF9K+xodxHrR9AQAVRGaItShqof1KiMeMsL8M/WWxPqf8xNBVblHa8C5L7JjG1AkzPEcqxMDNpMwkQW28TbnDu7t2Z+aHlKlCHUkHumZoIn/vB2J1Y4u0lxh4HtSzIdC1jks4izyhSSYYD23BSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:58:20 +0800
Subject: [PATCH v9 4/6] clk: Add KUnit tests for assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-clk-ssc-v7-1-v9-4-0a9d2e188d9e@nxp.com>
References: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
In-Reply-To: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
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
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ad1852-af69-497e-ab15-08de8004a4d7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xRyBZdQQk+Q6sljdvgR9jbdgXMYzLmh0jByQUC91SZuZn6TPukA3eareTlWYrchRm2+aoGzwXE5kEtHmQUBRhK5V9dsLN7EI7NtJlTKnBL5JJglSZcLogRKl3gX96OnPWuweJyB9G4eKrtZuVzLf5NBLDJFgudHt3H9z5pc3L0LkqdAESRraA7WSl2GXp/VFN2lj0Kr0TNNJyFXucgGt3KAb6iNK1IeXPaHe0JyWlj8SByqIsMBPcEc5MA7Rs2qgT49JGQ00Jvh32iIb3RAsxTrPh5WoGZjzir+VC3KVHTm8YtpCr+l5fB5OCIEkfXhGubwYOHVlU/kKEb0Ouh3UiloTIeMbplr1S3zsjm1ljXq/6pgZPNLWgUkaVLwJtmvlNpZQPkqFgzSI8gIHEFRCVq0c+eQCVIqFPutbSNT23VkkcZ1ViEzgrDa4Ecj7Y64gMiERrDEX1EOOZaQIdRH37P2zKKWTjeYBdkpraX2B/69jTnFtrDye1ioueSMR+sW2D4U3EjFx7R71DGOZHACjJLDZ47RNoScmcYWXCNGTdfDQ3suylb2U/YOLn7C687xpvUwjF9m0ek9u7ug2IUi/s5gtAXJ1EQhge7MdOHlh0bjFlU7ALyYshrqO4pTi1h4JDaiOENeaH1ibAV5cZ9v72VB2ANAQYx26SQH/dVLxLP7h9y69gRdR2DTCrL4WCqcdJeExcU5fxfyXeT/oujtHuOEfbv2NOf6j4vFIslXzk8zYp5Vb+QdaAAkJaCk+soSQgh4yw2T4leIUSCYLh20Rr8Os6EZoCSQKY8eTxjZjuoU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WURla0dpM0ZQM0tMRXhqUVdFdWlZZXg5MVNYWlNvSnFvejJ0cHB2RkZBeHVY?=
 =?utf-8?B?ZlZGQ0ZLeHFxaGRmVFg4TzFOTTVYOS9NMWo0ZzB2YVhiNDVqNXlGejkxdUZP?=
 =?utf-8?B?TGREdEJZVk1yYWNFN1ZETldoeVB0aCsyWmhXZDlNSDlFVkpJUVdVYThsWlZo?=
 =?utf-8?B?Wm1tOW9xbWExemljQlluWGxRc1NEdkJJbkNUTW55THhJV2RlS1VWQ1lEYUsw?=
 =?utf-8?B?QTFMdlkycnRkaXBpcjZNTERueFRWdUFPWDE1TjZyVG9nem5ObDlyaUVEWDlX?=
 =?utf-8?B?SFIzUzZoUDVjT3ZtaExYdGNuWmNoTWE0TkFnMHlrclNxWTd6d0JSNlFrRVgw?=
 =?utf-8?B?TTlqUWh3YTd3SGVRbEhvYmtpWWltd2UydGNONVBKVi9tV3JveTd3eS9ZY3dl?=
 =?utf-8?B?Q04velg3akxWWjBsRXI0bWNFeUVPYXptaWpkSVBYTjlWNDMrWGU5eFJzUWhs?=
 =?utf-8?B?OHNLTk1IOXM4ZnROOW1HaXQxMlNlK1Z4UUE0ejl3dXNzdStyZTFUTms4SW5J?=
 =?utf-8?B?b2lIeVY5WWgzcjZsYzhWbjJSU201NXIzTlJ2MjRQTkphaEt5cmVXS3JRUEFP?=
 =?utf-8?B?TG96b3RncDNQdklhSS9nbnlObWdiK3o4ZmNWcWVpNDNXZnJJeDlGODUycDMw?=
 =?utf-8?B?dWR1djJFbSszckV2dFpZQm9rbjFzSjBSQWE3amN1Q2M4a2ZTb2tVSlh3MlJ1?=
 =?utf-8?B?bXlhWW1qb1NuT1pvaWM2bzZGSGd1UFVPTDVRYW1tYlNZUzJJRlBLUTRKYWFw?=
 =?utf-8?B?SjhYYXZ0MjJFWkFhZXJWVXpIaGE1Z1J6TWRZVWV4MUorNWI4dUFZZVJYcGFa?=
 =?utf-8?B?aUdhTG9LS255QUUrZFJsVTY3NkMrUlJocm1XcmxteFNFS2IyaTlGemk1WStL?=
 =?utf-8?B?SDlrTUdkd243MmptQ1pudXhycnAvS0MxZkJDZGhiZFJRcUFXSnh5Vis5cWVi?=
 =?utf-8?B?eXBNTWFOMUZtVTF1cWV3WG9TZTBHK2VBa3daWEowRnZEVkRlS3o4RkNNMXp4?=
 =?utf-8?B?NjY5ejJBZ2hkQW85c3ZOcTdkbUx2alNNOGFUazIzUXoydTFYUzdQTWxCdFdH?=
 =?utf-8?B?MTRIUTNQSUZ3T1FLUzIrK0lsQ0JEUFY0WlRrbk56cTcybmVyUTl6cjdLYTRw?=
 =?utf-8?B?KzdpMjdOQ2MybTdRbjh5eGxuV3Q4czlpRE9Gb1loOUNqcFJXNnhLNnQvbXZT?=
 =?utf-8?B?TWM5d0R0L2FWTFdrdS9COXdTSXJJMGU3N2ZYU3NIVm5FdWY0YUgzMEY4V0pr?=
 =?utf-8?B?OFdYR0xHNGkzY3h3UGpvWTZ0RWlIR0lHM09xMHM0MERibmdCYnVGZmpkaDk1?=
 =?utf-8?B?NDNSeVE5V1RMTHp5cmxYb0xhK1U4bFVyMS91cUJxcUVnOHN3RHEvRFpWNTJP?=
 =?utf-8?B?Q1lkWWdKUVBJTkg1STdCOGdTK1BXRTdUUkg5QXlQUjlxUjM1U3dSWjIyWDI2?=
 =?utf-8?B?bGJrcUkyOW1Delkxa0JFT2tuc1JldlViVkxGUW9lc2JUZFRLcndsMDB2UmxS?=
 =?utf-8?B?eHlzK0c2WFVwUjBWbXl0akVBRlhGa1kwUi95M3M1VHdNWmhqekZlT0dIYnRh?=
 =?utf-8?B?K25hVFdRY2NuN1ZxZGJKZ0FqSXkySUM1ZU4vUVdOdFFaQmdzck5UT1Q4Um9o?=
 =?utf-8?B?V0tuOFU0S29jSU9zMFFrd1pQWnBaRTZMbXlJbnovNnZ4WUxiRVE5Z1hOZi9B?=
 =?utf-8?B?WFUwME1WWUNkWUVMWitpK2xrNzdqWjM5ZXZEamZiMHd2QmdpQThMTWFWS2Rv?=
 =?utf-8?B?M3lacHBtZW5VYjg1cDdldGZENlFiaVlsNDhlVXlZOG5xMkpJU203dTNQRlk2?=
 =?utf-8?B?R3BBV0MrTWI2QjdVU2U1enBMcEUxTnlqbDRIZk54c3NYNE52anRCNEtqaURM?=
 =?utf-8?B?NCtjcWU2YXdUTTQwRUxRWkNkZzY5YjRoNy9ONmhreVdLakpBT21Bek5JVUo5?=
 =?utf-8?B?c0dnSDk4clRDMlhtVk0zZjBnODQ2MTdUcytsMVg1cFZDWUt0SzAxdld0Z0F4?=
 =?utf-8?B?WmF4cnRZenREc0tRWWJXd2JoUVBOU0xkSlJXT1k3b21jZ0M4VnY4dnJ3WWdU?=
 =?utf-8?B?RVB5YzNlaE5sblUwZFg2eFE2YnVPT1lIcUIrVnpwQnhBZDdmVU5sc1RxUExk?=
 =?utf-8?B?ekYzTG41K21oOFVZSnVMT3JHN29aT3loSllvcEFNcVgwaUF1R25sbSt2cEE2?=
 =?utf-8?B?R29DWUZGK2FWUWVtNmdaZmgzcmN1Z05tNjhhSzZBc3gvSnFic2VjNXJyWk5F?=
 =?utf-8?B?cWpJcW9tY2V2L0RPaTlvckFYQTc4UWc2eFlSVk1nL3ZEZlRyaUdFZnowTURk?=
 =?utf-8?B?ODc5bWg1Y2lUWGY1L094T1QvUkQxNUh6MGcyZkNTdkh6blUxTnhpdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ad1852-af69-497e-ab15-08de8004a4d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:36.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxBC9BvZUEjP38WWo0r08u27LpMQ9MyuygQl4dpBJD/+3CSShBEBmKYNmK8Z4DWMSVfWXRCFjL+X1p/E06aKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

From: Peng Fan <peng.fan@nxp.com>

Spread spectrum configuration is part of clock frequency settings,
and its behavior can be validated similarly to assigned clock rates.

Extend the existing KUnit tests for assigned-clock-rates to cover
assigned-clock-sscs by reusing the test framework. Add new test
device trees:
  - kunit_clk_assigned_sscs_null.dtso
  - kunit_clk_assigned_sscs_null_consumer.dtso
  - kunit_clk_assigned_sscs_without.dtso
  - kunit_clk_assigned_sscs_without_consumer.dtso
  - kunit_clk_assigned_sscs_zero.dtso
  - kunit_clk_assigned_sscs_zero_consumer.dtso

These tests cover various invalid configurations of assigned-clock-sscs,
ensuring robustness and consistent error handling, similar to the coverage
provided for assigned-clock-rates.

Co-developed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile                               |   6 +
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
 17 files changed, 268 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f52cf3ac64fcce7e20f3fd91f837c5096375521a..d569d0ea3153efe593efbbd51e022b2415234d3a 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,12 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_without_consumer.dtbo.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
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
index a268d7b5d4cb28ec1f029f828c31107f8e130556..97113b61c2841701a44603ca9935638374000a2e 100644
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
@@ -3203,6 +3223,9 @@ static void clk_assigned_rates_assigns_one(struct kunit *test)
 	struct clk_assigned_rates_context *ctx = test->priv;
 
 	KUNIT_EXPECT_EQ(test, ctx->clk0.rate, ASSIGNED_RATES_0_RATE);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
 }
 
 static void clk_assigned_rates_assigns_multiple(struct kunit *test)
@@ -3210,7 +3233,13 @@ static void clk_assigned_rates_assigns_multiple(struct kunit *test)
 	struct clk_assigned_rates_context *ctx = test->priv;
 
 	KUNIT_EXPECT_EQ(test, ctx->clk0.rate, ASSIGNED_RATES_0_RATE);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
 	KUNIT_EXPECT_EQ(test, ctx->clk1.rate, ASSIGNED_RATES_1_RATE);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.modfreq_hz, ASSIGNED_SSCS_1_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.spread_bp, ASSIGNED_SSCS_1_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.method, ASSIGNED_SSCS_1_METHOD);
 }
 
 static void clk_assigned_rates_skips(struct kunit *test)
@@ -3222,6 +3251,19 @@ static void clk_assigned_rates_skips(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->clk0.rate, test_param->rate0);
 }
 
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
 OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_one);
 OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_one_consumer);
 OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_u64_one);
@@ -3384,6 +3426,77 @@ KUNIT_ARRAY_PARAM_DESC(clk_assigned_rates_skips,
 		       clk_assigned_rates_skips_test_params,
 		       desc)
 
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null_consumer);
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
+		 * Test that an assigned-clock-rates property without an assigned-clocks
+		 * property fails when the property is in the consumer.
+		 */
+		.desc = "consumer missing assigned-clocks",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+	{
+		/*
+		 * Test that an assigned-clock-rates property of zero doesn't
+		 * set a rate when the property is in the provider.
+		 */
+		.desc = "provider assigned-clock-sscs of zero",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clock-rates property of zero doesn't
+		 * set a rate when the property is in the consumer.
+		 */
+		.desc = "consumer assigned-clock-sscs of zero",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+	{
+		/*
+		 * Test that an assigned-clocks property with a null phandle
+		 * doesn't set a rate when the property is in the provider.
+		 */
+		.desc = "provider assigned-clocks null phandle",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clocks property with a null phandle
+		 * doesn't set a rate when the property is in the consumer.
+		 */
+		.desc = "provider assigned-clocks null phandle",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_assigned_sscs_skips,
+		       clk_assigned_sscs_skips_test_params,
+		       desc)
+
 static struct kunit_case clk_assigned_rates_test_cases[] = {
 	KUNIT_CASE_PARAM(clk_assigned_rates_assigns_one,
 			 clk_assigned_rates_assigns_one_gen_params),
@@ -3391,6 +3504,8 @@ static struct kunit_case clk_assigned_rates_test_cases[] = {
 			 clk_assigned_rates_assigns_multiple_gen_params),
 	KUNIT_CASE_PARAM(clk_assigned_rates_skips,
 			 clk_assigned_rates_skips_gen_params),
+	KUNIT_CASE_PARAM(clk_assigned_sscs_skips,
+			 clk_assigned_sscs_skips_gen_params),
 	{}
 };
 
diff --git a/drivers/clk/kunit_clk_assigned_rates.h b/drivers/clk/kunit_clk_assigned_rates.h
index df2d84dcaa93511694b6da842debdc3cfd3a6c19..d7ae5ec2d25bed79b8438e8ce580872131ce4286 100644
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
diff --git a/drivers/clk/kunit_clk_assigned_rates_multiple.dtso b/drivers/clk/kunit_clk_assigned_rates_multiple.dtso
index e600736e70f5041ddeb1bfb0d6074746a064e08a..6c54d65444d5d779c9fa4bb2a79c4742dd88f6d0 100644
--- a/drivers/clk/kunit_clk_assigned_rates_multiple.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_multiple.dtso
@@ -12,5 +12,11 @@ clk: kunit-clock {
 				  <&clk 1>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>,
 				       <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso
index 260aba458daf2bc57fde46b5442453e7de10faac..b1fee396c4b1e51341a411168569d8351bb23b12 100644
--- a/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso
@@ -16,5 +16,11 @@ kunit-clock-consumer {
 				  <&clk 1>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>,
 				       <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_one.dtso b/drivers/clk/kunit_clk_assigned_rates_one.dtso
index dd95ec9b1cf977883f71564a94602ae518937132..da6e91b9e6bda0ef2c8f601a08aef1f10fda4baa 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one.dtso
@@ -10,5 +10,8 @@ clk: kunit-clock {
 		#clock-cells = <0>;
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
index a41dca806318b031187c1b8739fcf71eb088a480..4b6e06048f863d014aed8222652d6d9d38e9238b 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
@@ -14,5 +14,8 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
index 389b4e2eb7f74f1770ff5f5c4be5b45dd344dc9c..3a717dab2d00b7fdaff580e30ed2cc520683ef95 100644
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
index 3e117fd59b7da19cd8a603af77eff29175ce6900..cbee7cbad068f3336f0c8997a5b3e9af4db565c9 100644
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
index 87041264e8f544dafddf2e905efc89dc1f917c54..9b04d6927f0830a5621af1cbea503a427b46bee0 100644
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
index 3259c003aec0be3269ab60a4a3a95df69f8de1f8..4784d40520f4193e4f08c8981386f0772a063452 100644
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
diff --git a/drivers/clk/kunit_clk_assigned_sscs_null.dtso b/drivers/clk/kunit_clk_assigned_sscs_null.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..43b2068c845dea53ea1328bb63a2f58a4b8ef339
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
index 0000000000000000000000000000000000000000..bda008f5aaa35e53af97863e4f2e6d8a168cc053
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
diff --git a/drivers/clk/kunit_clk_assigned_sscs_without.dtso b/drivers/clk/kunit_clk_assigned_sscs_without.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..08660846b55c12122bfb211c01c377a3a45223c9
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
index 0000000000000000000000000000000000000000..e1c089c6f0c0223f16f7ac9a396e7ac7b821c967
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
index 0000000000000000000000000000000000000000..f39f4e754e532c9c1b1fdf034700e5af1f3f0779
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
index 0000000000000000000000000000000000000000..d6bd7dfada7e2f455cb23e483b9bd6ce24839e3a
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
2.37.1

