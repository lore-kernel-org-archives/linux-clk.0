Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1414EBACC;
	Tue, 29 Sep 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674786; cv=fail; b=fFepbuemiRRX1WUbKJZOxG0jAIyLRl0IP1mspQl+Ffe98IZ0o5MgvNDSntuGdV7dsV7VFQUBeWOc1Pd+govhMldzJc7XfpE2XHo6r8T6vP7X87RjK5ElniXUE6jurp6tWu1QbfgxSWh2JFijZskLKEsqvIpHH6Rbi81l0jf+GYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674786; c=relaxed/simple;
	bh=6F9v33Kj2lzsNY2JXELPTbrxHcpOGI79LCPpEicLF+k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QDRv/clD0mpHiVKQmmz6RF3M6BTTFU7W5wE5HEsuj6v/g80Z+S2WOHV4gmLwKcjlZJ5o+9Pis2Lr6sOJhKfKx7YaTbk31mKEU1/yXmboiAxwmp5u37JbHcwPbhWhA1f/MD5fRMaL2xgzzggo+esa6noPlInjVKOKDArn5LHeUBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Ea/LvTv1; arc=fail smtp.client-ip=40.93.194.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Ea/LvTv1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbNqzwGuNl8g+c8kRiko5BPjpNRKC5QawTQn1aZ3W0KyDe2Th/WItkKU2ZFarR7own/orU3wODUNSNQ9dIA0YM9uu4bnyRKwVdoed5v30OCOnVAyq52jQ5IrNP50sCAj/GTh1vKqITGSj3O50GM6SgB3zRDeFTq9leDATonuh9r1gnCxH0azYrYRvQL99xdhSwMLNgTVCqpq79qqDRE1D3iZ9D/VPGSgQoMJ+eEK36R5eJfYdHnQ+yzDUpx12v2iShgSAMLHgnwDPWbUlwOxcXezLm6jzztLfJCL9yf6ZK3A6V8EXIeFrHNxWePs0UF0z+GWjZJ3aI5rsbgPV4Fhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwcHWaAF78Ul5ou/BwWqrAd2ESAuAw//1sGo+8WtPps=;
 b=HfjdgcgfOcL7uVEYYH/OKlE/5V2Vj4bBqgmYhaC3IseFSd8+A5/y6T3kaS9Oletr+C2kPzmKQKr6SlnWmMOdpcIGVALk8plpaw6k6xAM1fc2qdFfvjT0MaKN0CqsGzmEsDSAdq9KpF0hoXf6UY7YLgzjbk8RtzVgjv0usXtCGiSzPN0wn4lZIYwLsKDJ9X0bSU+t8N0g9T/L8v1S4QUuCQ2nsX1ijV7al/AXuEgjfweKCT/FUSbPtJcuIRlnV+tZ1itivRbsmUQ6AQ2C//LJenkdMVn+O9vOFxRcJJO1It/u3IBXvC4DzD2K8HdHJ32LDc3MriOHWKaJcFJ19447Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwcHWaAF78Ul5ou/BwWqrAd2ESAuAw//1sGo+8WtPps=;
 b=Ea/LvTv1QzFZhKB70NRMNfP9bdj3bQOFyj8xYQCSqNBUexxOIqTnUvxAvdQLn5D71bl9a7B1ZdRcId4Gnonx4WBwEXn2UpkRT3kEq+QxRdEzOnn/q7slR4D8Q0+G69MeukgzI7DsVDaWyUNbwPVGc8xUF/GVQ1yoKtnIkoJw4Qx/LM3o4dAR4v73TvyPVAFZ+9DYTYdZ4gKhfcWIdYlkUZ8Fm2FaWyErnb9CCPrkEeSORd7Jj5w0BJIgwLGXqiF8/29K3sabH9EaubCuCKRvUcOBaGOXVhQ4GIxn7xZyW1p4IuMcvmQmbHIWVSyg7eaoymyf5RZTMmhQTOuzfVKJ8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA5PR03MB989108.namprd03.prod.outlook.com (2603:10b6:806:4d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 09:39:40 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 09:39:40 +0000
From: evon.chiam@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] clk: socfpga: add Agilex72 clock manager support
Date: Tue, 29 Sep 2026 17:38:11 +0800
Message-ID: <cover.1790661931.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA5PR03MB989108:EE_
X-MS-Office365-Filtering-Correlation-Id: 216b2a3c-61d4-4fff-7ada-08df1e0d8ff1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|11063799006|6133799003|55112099003|18002099003|260925022911599003|56012099006|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	Y47KCDU5ozjnOhzXng27RbY01UI8m4fnd1vfg2A4mF+zVfIH219xGGVsXQu0qzPR58FEmyDkrBq9HWSB6znoep3TJZQCv/4OFSWqlHh4mP9qYC4wQVTPCqgtbW/6kVUHYR627m5TPYB9xkQvuCiJF7vqBafCXYXk5D4zFAy7ewDbSSgrjZjyp+7AVKSjoTUre7A8WVibFGvEAHdSM+aHMG1j1JDj95so3djVeg6Fj/VmiiqzgYeKF8vO/Ra7RtkIXNEr5N45Fw/g0QZnwXFf3ny+iZnWH7/0v45p5/P8KqElBaGeyg85ZJR9n3wTvp421TTrHBipQTD7b1w4zzGBXWZYvdQ+vwvCSS24LFmLwv6MRsvnw9I5LUc1EKwlXxRUT00iISkSuf1P+2O+qgWnBtGm3XJoF30Aqd/2sDMAB2A8n5MArybreGuyIRc+9xyAOFxO1sUd/fiXKodvKDXZucqGzdg4EQPujQOFSC0SEWr2MNF/zqCM8UTVa5mYfTiaD/dBvDETbaOg8LQkxnQ3mKnqsIf8XtcjA7HO9L+ak33UFid91grz98SWT8NJuT/SBfANy9TggqpUUo0snHlCGFpYM+BM4/Ykp8YVBcuKwsIgbdXY4kv3JXgT4spBVjB4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(11063799006)(6133799003)(55112099003)(18002099003)(260925022911599003)(56012099006)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OFTtQ4WyhOPlGyJjOIMW1pxHKFf5uCMrK3/sWYOK/9XI9snEtoL5EzBNOOHw?=
 =?us-ascii?Q?L2eMe0Lc3RoSxFGeZk623PYlz30VZImlZez1FEYbovKq96TR1kWgDn8XDy1s?=
 =?us-ascii?Q?gwNsbPTDjPGuOjBQKSB4FrZPTgxeMvzQ7pifZFPkeM9iwgeifVT5JiiRe/1+?=
 =?us-ascii?Q?5lulYz0SlEWhTYVJsbRiC7JB8zVROfZT6fie5RA2C4DtwvDP284j+s1vEXZj?=
 =?us-ascii?Q?iZv1HAtHhkERCdgUdjcA6aYus8kWa9r4BRSaZzEBh/HdLAs8qarw4FlUKTMj?=
 =?us-ascii?Q?7mOS16BIWzuvV+TbN0FTh9RqpqGyBFoRt9WOlnLfV/Omu0cDlbHGV6Ji7SjJ?=
 =?us-ascii?Q?GLHR89SMqX2JCBkgYgg4k53prZnJJFoacycVX3jB50PXuabMDTwp9UUU/ePD?=
 =?us-ascii?Q?71FcAAjYjCRgTwwQ318OSiO2c+7sCLHEyvnjC3Y9hynWUpnsSaF0cFkUsnrI?=
 =?us-ascii?Q?oW7ZatuN/Uw9mUG7X0nbWWKkTSmkG8uxODQCzFFZkVe+UlFsI4hruUv+blKD?=
 =?us-ascii?Q?yNZ1OScUrtnHR/mMq3UXji33asDpubfEMI3EBnlTjXCKQ/DEZirseZOQrpUj?=
 =?us-ascii?Q?ZYgiD1zYtsGhd23n5E7ocnwEcbuMIeD+0vs4thjCYkZer53SzPwG+yURlVoY?=
 =?us-ascii?Q?FNY6+dm7ve4NGtBsFwxpS0eF17cTsh6MNz78B8hQ/avPuKMsrcw6/4tvF7vB?=
 =?us-ascii?Q?sR/SQXUq8caSyBYO/DSF0c7sajG+gdffOhYeyKaKQS4216NEJlAJdImr+Z2S?=
 =?us-ascii?Q?7LdpEIJxsY0abmmXdAcdcJQsGumbDo2n0kMwRTbEEO7YiX96la8l98jlN+BA?=
 =?us-ascii?Q?8J4fGUQtQxNCsG1TdmsLIWrsyFS3DLmdDPnEpT0+EOeJXzYMXDeeJqHw5qcl?=
 =?us-ascii?Q?3ZXsnO8BOTyG4J1tmOLEUA2n2WRXhGaqZ8Hb1BY71W0Oo5yRnEb2MMcPKbPg?=
 =?us-ascii?Q?KQ5KxoF97+laClaNYQRJk8tt/jAHpq85uw/fCuoYLBKKk/ZvzW50+9KMLjl1?=
 =?us-ascii?Q?sWQvqLakiU2Q8v+KJ1k1qPQmNXaq3NpQyJ1cskMwNkDghl4J3Q4DyrroQNBJ?=
 =?us-ascii?Q?lJ+6Z/AQQ5Hi8hhaWRRRisxbRdRlwfHiT3cete9le2anHbQYgDxqC4i4yUTY?=
 =?us-ascii?Q?XIGAbmZ0dMeldihr7akNNAI538ZpvowTjE9g8ukNSsEhvPRZRSy39V5x1GX3?=
 =?us-ascii?Q?DTVBJRB4csIgot7DQ5a7k1Am38sg+Jbya3rzz9G5uOQM4ry1q0AOB+bP6vl8?=
 =?us-ascii?Q?GQboJccF8FvrTii9i3Xx2p65HrJHq5qfCPmtyuJNv5w/v0WehFDEvQEnRRX4?=
 =?us-ascii?Q?Ic1PpCbgEUIRwYeKhgnRb8s5fdWB9fbJld6+qbaj97jTQHklPnl3fm0jt3YT?=
 =?us-ascii?Q?v38y+ZvHzMujEANn+3Tswf3NlnkAG4ycLNOHysg5mECFwuVSmFyscneB1x0B?=
 =?us-ascii?Q?zKy8KyNS41hAF/42mvkwHbrEUX7YGAxY4rhvuXZD96RewbHlkI0ZMRUrL/sX?=
 =?us-ascii?Q?MxzZ+7Htd+prdmhoQHR0O1hWninkpI0Up1cI5paVAGsZgLkSbfuTVzmh9CYq?=
 =?us-ascii?Q?R/W9X/KxancPqeNJtmLn5rrmtPq10sxsDdXsL+ge8k8qSii6romr31Bk50en?=
 =?us-ascii?Q?IP/TOpber24SjmtnQbkSiL1+reygsqjNqBzgnTru7QRp+N9A/re8KRmqtvY0?=
 =?us-ascii?Q?+LuVwLfKETXCm47AeazSSU9skgic1SBeuLQJa78lgbHOhl0yq6FWyzOk6mF9?=
 =?us-ascii?Q?XrdJ6Nvfdg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216b2a3c-61d4-4fff-7ada-08df1e0d8ff1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:39:40.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSlbpcE1de537q9ZtewywDy3trM1Z/il/pxb++Ki88cKk986uR35ZOUbyBIvyageLMCEv0yAjXlLR9eQ0JcC3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989108

From: "Chiam, Evon" <evon.chiam@altera.com>

This series adds clock manager support for the Altera SoCFPGA Agilex72
platform: the devicetree binding and clock ID header, the clock manager
driver, and the devicetree changes that instantiate it on the Agilex72
SoC and the SoCDK board.

The Agilex72 clock manager exposes multiple register regions (clkmgr and
three GPPLLs) and provides the peripheral clocks used by the SoC. The
driver registers the PLL, peripheral, and gate clock tree, while the DT
describes the external input references and the clock manager node.

Changes in v2:
- Dropped "dt-bindings: arm: altera: fix Agilex72 compatible vendor
  prefix" and "arm64: dts: altera: move Agilex72 DT and use altr
  prefix". The Agilex72 SoC and board compatible strings keep the
  "intel," prefix and the devicetree stays in dts/intel. Moving the
  SoCFPGA devicetrees is handled by a separate series:
  https://lore.kernel.org/r/cover.1789123511.git.evon.chiam@altera.com
- Reworked the clock manager driver following review; see the per-patch
  changelogs.
- Link to v1: https://lore.kernel.org/r/cover.1786006669.git.evon.chiam@altera.com

Chiam, Evon (3):
  dt-bindings: clock: altr,agilex72-clkmgr: add Agilex72 clock manager
  clk: socfpga: agilex72: add clock manager driver for Agilex72
  arm64: dts: socfpga: agilex72: add clock manager support

 .../bindings/clock/altr,agilex72-clkmgr.yaml  |   76 +
 .../boot/dts/intel/socfpga_agilex72.dtsi      |   44 +-
 .../boot/dts/intel/socfpga_agilex72_socdk.dts |   12 +
 drivers/clk/socfpga/Kconfig                   |    3 +-
 drivers/clk/socfpga/Makefile                  |    2 +-
 drivers/clk/socfpga/clk-agilex72.c            | 1299 +++++++++++++++++
 .../dt-bindings/clock/altr,agilex72-clkmgr.h  |  115 ++
 7 files changed, 1545 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/altr,agilex72-clkmgr.yaml
 create mode 100644 drivers/clk/socfpga/clk-agilex72.c
 create mode 100644 include/dt-bindings/clock/altr,agilex72-clkmgr.h

-- 
2.43.7

