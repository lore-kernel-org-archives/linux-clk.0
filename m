Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2122.outbound.protection.partner.outlook.cn [139.219.17.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D36392820;
	Tue, 12 May 2026 08:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575845; cv=fail; b=MIxh3uKTxFiV0LnstOu6R3oFNsbFa+jg6e9YD4YeqELI6rw0mtAczgp4mgB9kOIIt1HCwU9ofl+Knl4s28w0gxMxfrPBordXgmJLMNSA9HZjVOkXmC0QByJG2YOP8jMIdoBx9TIqVPafqKcWtIg42sLEsunsEPjbXtisnXfdXQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575845; c=relaxed/simple;
	bh=kLll00WTUUYlnCL/7KYQEi8b/K0O7yqugbmDYzQgbpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CI8lDlQuKIq4GldhEiuRasgSAvJRpgZZLpe+I1c88Nn9uwGR60QQrd9qgUSWdGEvIqEzICG5FGDmY/SfpgWOYw/0im6sE5vFJZKe4hozAJn4uXRkxUQAjCd1njLGqnSodlpEW60XEsZyUck86im9C7Rciz731b70z2EKyLHEXKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGPhvO4pt0cm6mUMqey5ovFozBOz4OHqCBQ7wyZ3dyymlAoNwwQfckwf4kaQMo4H+yaujmYFx2pvqr64xN2AkOVbd6WfQUoF3WgkuWX1DmOwfq/nDFundoX0LVDXgZ/IWhRj2lmzMy4PjMNUrri0NU5zJYiB4XkT534qmkXq3gl8UvtuCnVTN/daU5ca+TItIlggd1/2n/dbxQOvRA6ecHM1iUNvOZfOGBcD3taDWh+qULjVzwQ4PIFw5jSkB529NuN9PINUXqY/jQSoIX8eM1JwhVI08QArcfMGegSW8n5aUSWprnsbWkZRdWM0amQjzanOV0sQQ0/bJYSIWRMbTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI7G2/AXyCd/4PD9xTZInym6WNxvPNp7ToX4dTPtRsY=;
 b=MkjCECSMSgNB++S8UZ7lCiushxUFeAY3n4r4iSPAt4dRvs7pVRfLYMQEjv2tD5pexIl/rTeZ6Dw7eJIR7+bdD7LDqZ7mIQ3PMIKfAsHozKmvyhKVZyJRANDtoEv8noNkgYC5C2zw5Q1AEsIpuKpfT1FwLKZoVJxfJH2yCeJWCl25C8g6nImAuvq3EfutQLNqu3S9h6G/Py5+I3Y1M+Fe2r7sGjuTT8SRlZ68tq80LjTkwhEzlCOVIm6x6hOYfoifbDJoiAI71v2seUpo75+/roGh2GLAXkZ6VeRzUHlp8GAG2kfeICxmUGggCs8TY1PSG3pR6vo9B90TQ0EM8Ykuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 09/12] reset: starfive: Introduce assert_polarity
Date: Tue, 12 May 2026 01:35:18 -0700
Message-Id: <20260512083521.3448-10-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: a85c21c2-c460-496c-2550-08deb0017687
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|22082099003|18002099003|38350700014|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	ac4ePouFRYeIPbvWMG3VEqO3QaeAA7vPFNDxMnPIyb3b9OdT1MRyrBsOttTkMBoKa2QNJ23M+osDQOZbKzHFcd8tpdOZNhV+/DukLAUfP3Ez0fCMy+d0nQgMDd3/eevVPPN8EbSr61hJMpIrY7INtAFmK9IhTlGTocArYOsjvH8BwTAzbE1l9CXEqxMKqx4XNFaaY586Y74+G5VJP29CuEOmDNu2iF58qVbBdyCmAKIzlpW/v1UvwLevicApu005PESB5NjJ2/vM1kw2BH6R0n3885hJXOK9d/BK3QURyaZNJB/XgpEfjOV1u8fHLwO4xYI/fWVS9qxrKxS4MhvRvVvYUtmPh1QLLvT58jTJpWkqoiTqyFUh+nAZqhR8hSrHfqGQ6UaHiaQUyraQ8gQblyu7d81e00bTqdofgzgcb1uGNO7Lch0hIQ0YQ7sRC+RcrVUB24KXFWLn491MULsRItmcfjcu47vkY0PJd0Qg+txp1Dw6JXxYsIvpDG0G5ZhCEgeFjfTP8pEpkVW+K6xHUwTJHF2f65DajnpByaoMLeW9525hmktQH9uqCcYUYbhDtP2pJvw+vuR1d4ipKnwlBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RPbBOKSxsw2y+ljcCmln6UTv5WhYJa9gelCIxWGezkHgY1d4IDiLV0Ql4nV+?=
 =?us-ascii?Q?+CRN0P+1rrNQ8lbtUgowbdJ0VIHLpEBufAsXKfI4eL1CuhSFSs6WWAhRX0Tl?=
 =?us-ascii?Q?v37cOUlCqq9g/BPT1FL9eZ+gtpa47UoGQiVt2rllcFQuyewDFXUBmSDWZqIk?=
 =?us-ascii?Q?d8SY24hcxwzUQx+LtHzLMEyPn0JsrEnZiLzQL87mY+Q3S2EQaWVsQuGKwK2Z?=
 =?us-ascii?Q?S0fMXV7PBCsH/0cbNMinqE56oHrQzJ7tSIjb/s+1vDk/FfNPAyAuEiboIIt6?=
 =?us-ascii?Q?HWcKh7hIiODec1lhXmLRQPsdhJNeC69iU/BVlxYzGCWyIBlMyB3e+nkYkWDC?=
 =?us-ascii?Q?RXNu5W0o2NDn7JfEEEFhZFz1nmTD7LrkGPyPiVnSv3WJusUrw5KJrMIObuuw?=
 =?us-ascii?Q?C24jXu8b4KFAUjrQvqkW7tfd9GaHwrWg/7qzurp5tvTDaFGte6GvhVqruxa0?=
 =?us-ascii?Q?pjJ3GH3nIMHY4sgYj1ykvcnBe294fhNTzSgFrjtQB6r0z8ApBh8Qs3XcFmh0?=
 =?us-ascii?Q?tr1R84B8wx1e2EufI8wK74cIq865JCN5oYkq6aU3vXrSXVkMu9eWiXI0HwCW?=
 =?us-ascii?Q?bYpocxXS82jfLFE+Hs0i1Rjlz7as0mABKMKvE8EE3P5txMJ4XPXjULsSbA/r?=
 =?us-ascii?Q?fItH59i4g6yU1PtSQXV0VeEM/0KXG1cO6N+2MXXpxyLB0CXAWAiKVqqtzO5c?=
 =?us-ascii?Q?sRhhqQCY8Euc9eE0QZi7Zmucf+UfAqNXOVPpdcAFCO812g6jXfAr/tSZo7hJ?=
 =?us-ascii?Q?4855CWlgCHGdS54E/8/27KOstfATR35Me+1vL5BcFbSGI9f5GkEutJWq1+JE?=
 =?us-ascii?Q?ulNaAJtAL1h/218PW/v4poBt8YQMWULPtgEbXqaeX5K25CpiHqM+DK2Joodi?=
 =?us-ascii?Q?h5IIxxYtB6XuxrtMN22W/YQo5WWcp6o/WC+knfKFPWB3OTNw2QY3sAbex4ja?=
 =?us-ascii?Q?BfbXSL5s8rFYopdxxl9RcZLXfGiHXOj8gE15bHgHuo2K+3rvxtkgMiPmKsAg?=
 =?us-ascii?Q?vSEzAhT0KOj+Qt6Ty11Apgsj3aiR7vJ8OOfGAFgTqg8ByCy0HhQJ3/yNszdn?=
 =?us-ascii?Q?rqPkPrzX6U2btNNFYMycLf9W9jNjjHqY5q1sAiViu3N3HHYsDrJ525Tw5WbN?=
 =?us-ascii?Q?CL7uOhfX9Wc1t26SUbEn3q1+tdezZuICXYk9IWcY41z2qzY/ASpXPBozgYeV?=
 =?us-ascii?Q?DW3zXDtDlfUN1YYoJzNGCQDln0C0NuBMLyPTdkO63TH5U/qDJXwzkHxzrx2g?=
 =?us-ascii?Q?a3uvq8ZA5aiCJy0RsozrsJpaIro5OmVW+73tJZXegeES931PNDHyOAqdvjP2?=
 =?us-ascii?Q?5VDzTcoK9vXtjQSIMuBOTAji8lsn8/3ZEcmoF2ZuwGkvCzTobZ1Xy9LLQ0zg?=
 =?us-ascii?Q?Jb3pRilawrTMDbRa/SDUGkvqP+tsg8QQDsFHAQtAyPiQntBJ9GQ2YvNp0IjP?=
 =?us-ascii?Q?5nBg6A0iwfB0qvc41kAVxL948yMNHxgvPVW0Sxtr4BGa5EfJCu5qW+JsxadQ?=
 =?us-ascii?Q?y9bqow6SsqmaH5T+Ts+nnWTBq26DZdKPgn+HwqM2YcEuUwTn+qrbptoQWtpz?=
 =?us-ascii?Q?8TAgqIIUSpTTPwBPaAB4tD/a5l6/fORWTe2msuTtdXCgpgKZCs2ErshXk/TL?=
 =?us-ascii?Q?naq09fJIJTwS5spo20gDjbjmmTy04oZ20PFA3oizv9UT6g4C2LmS0M2DGCDZ?=
 =?us-ascii?Q?QTNlNo2czmS4wig9+C4vNc+4fC2X7KzTxf++Meu6vnDY88x3FXSkIcWLm+z/?=
 =?us-ascii?Q?8buM+1hd7NTbqRvZNh3T/h8pmvqHUyedeR6X5l5bzuxxml/4au8R?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85c21c2-c460-496c-2550-08deb0017687
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:46.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0tcUd2pMfeX5BfXI3HFKjtA+mhf2g6R4vAthkynaS7Kfr5SXPeJyeeZOokzzifSBuwLyZxP5P0K2fDLH4WrXpiye/WPL3UVMAYs1qFv1TLSai0+eQNCY2wyhzEWHcn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

The JHB100 SoC supports inverted operations for reset
assertion/deassertion, introducing the an assert_polarity field to
distinguish between different operation logics.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-common.c | 18 +++++++++++++++---
 drivers/reset/starfive/reset-starfive-common.h |  6 ++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
index 8ea142ecbd15..c7289c2b2a28 100644
--- a/drivers/reset/starfive/reset-starfive-common.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -68,7 +68,7 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 	reg_status = data->status + offset * sizeof(u32);
 	done = data->asserted ? data->asserted[offset] & mask : 0;
 
-	if (!assert)
+	if (data->info && data->info->assert_polarity == assert)
 		done ^= mask;
 
 	spin_lock_irqsave(&data->lock, flags);
@@ -90,13 +90,25 @@ static int starfive_reset_update(struct reset_controller_dev *rcdev,
 static int starfive_reset_assert(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
-	return starfive_reset_update(rcdev, id, true);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
+	bool assert = true;
+
+	if (data->info && data->info->assert_polarity)
+		assert = false;
+
+	return starfive_reset_update(rcdev, id, assert);
 }
 
 static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
 				   unsigned long id)
 {
-	return starfive_reset_update(rcdev, id, false);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
+	bool deassert = false;
+
+	if (data->info && data->info->assert_polarity)
+		deassert = true;
+
+	return starfive_reset_update(rcdev, id, deassert);
 }
 
 static int starfive_reset_reset(struct reset_controller_dev *rcdev,
diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
index ee457d9b90a3..d4017b8069fc 100644
--- a/drivers/reset/starfive/reset-starfive-common.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -15,6 +15,12 @@ struct starfive_reset_info {
 	unsigned int nr_resets;
 	unsigned int assert_offset;
 	unsigned int status_offset;
+
+	/* If assert_polarity is false, setting the bit to 1 asserts
+	 * the signal while clearing it to 0 deasserts it, and vice
+	 * versa.
+	 */
+	bool assert_polarity;
 	bool discontigous;
 	struct starfive_reset_map *map;
 };
-- 
2.25.1

