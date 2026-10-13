Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2126.outbound.protection.partner.outlook.cn [139.219.146.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022064E7802;
	Tue, 13 Oct 2026 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896509; cv=fail; b=H9MPtJny7tQdjAtGEvwIr5u73k6INi4fjQw7Oysx3K0rLATlQl1UJ7LFbBdt7bCksoA0hDQqhrhdz0jgsRTCEU1Ow07lYs00U7PrbfscHCVVGalxcmxMlWKhPtkruFNP/wkS2/yie1+Sx+/eF3vfvbpe7f6wBnCVRjQd/vsZgDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896509; c=relaxed/simple;
	bh=C6k3sJ8jb0lFA0XjIMeSm74qfWQB+xpQABSfq9l7SJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cza/V9WLSHcEA9oqdwnRQzc7HB+hAfjHBxwlec95NYk6ekkYY8Z2z/gNouEaZuyAUyTLUMQMKI/hthRWJutUGFJScEZIXm9ZKQh2UZpLx6Z57F45DgJV+gAY35KW4s9I7bR3jzDC0IBDohkumJDaLMaERrs8q5dJgCMxuOywZO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) by ZQ0PR01MB1237.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 13:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvU8xJ3xQt92I+ialhJhWNmK0Cx6Ua0a214iJ9uethlkehO+FC9b+QHHk1Q+vnCrP+EbJSapfFr8WcVOi+VUOvE2wBjSbvOdv0UHKtrGkS66CsC9srKgrrwPA8pOw4jav4YHvGCrzq1QKul6KsNHheWsY6Y/e21ZqI4d1sNZcnz4tgzbbJnZllgRh6l0DDcvxyCwFEyZEzuWQ9pJvqkOBOxhGKx+ZvM1RWqs/rtsY7Qq2rKnQRhS+T0EdigjydrF8HORJG7t7p8VYh1AwHJ9og3GjBSB0p8xj12kmycoWpSXso3TISuqd1F6BuFkABKs5bixYgC0kxh3OLM0r3zATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFQBehvpGkg6Ibwftzvq/hAGZuFGKCLctIg4/y1brHg=;
 b=SHVa+ShiNFEYUwQ7SPC7188MXihtb/zasjulHkxV7zvWKSgHnscxDgw2akpG1MRk+t7B4OCoU4xEuQgmln9GybfbnWWMHFQrn96WMMmWDZPt4LQEELGIoJYxrEfXz2i/kSRdWIIfdFhRHdiKyHaQNQ7XhZUWUoqENvT5vD9l2uafe/eryha68lbZM4gtqGU4nAOcNrgi4SXn9EiRl8dE0zkwgCIlVBT2hUMHwV3uyhO4BgAx67RdEfuv6oWoJ0vbBKjvVMqCvThq7GUSuHJ/dFHT/NFkwyGzbIVw0PQ+8PLsSau/lG1IhsZUQYUrU+CCTqv4xwI/ifAXQyvDFf1szg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:20 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:20 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 1/6] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
Date: Tue, 13 Oct 2026 03:27:02 -0700
Message-Id: <20261013102707.9207-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_|ZQ0PR01MB1237:EE_
X-MS-Office365-Filtering-Correlation-Id: 304e2b07-7a6f-420b-809e-08df2914902b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 3d0kQIF/1LQhr0y8aSwH6btzOptRBUa3HQu583P92OX6NHQ93Y2ViAUZJsql3QY+TQLCZ/YsA+XQ7o2NLYi+cKhWLYqxkci1cCG6pLk+/4F+Ug6fPVM/wNH9vjOsgWmMzuTaxsS+8/68HU/AXaBFbooQN3oqbSt3A79cNrWEGLyMuQAS9npmuXjMrEkJy3tR0yLidx1kisBIEXGQpls2uvoSe8W6tBv6HjfOPQAsobeU0UzdJ0ATCeJ8kf0DF4GpLtlJ2evhzAnGi0wmgeE4MbjuR+SVKk0RpD8lUp0IhWqZPVC4Nxot+PgNGz0X2ov02VhEvOCLXyqrezJ0BISMi9aidYAPj8b29vuRQ2FxWvM9lX9455z6vzZSEIjdKKyV1yHrtDG3Rwh7GY+ShYPLYy9TKZi09YfgHVQYGkrMml1iZ8lTXNMrzFmCga+gducvJKKUTjcWVHzv8tMgACRyxqTMYfNSORmP1rFUSIdewh4/ocztduYBAi/PYBpO49BxWU8WM9p7G+U5F+BPtxsfvzQAtebtHOUUFZtl04+Mgj+KKfMc822Gxa+ncPtYOdA1
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?UOrodhmr4rqCT10KrCRlOAYHHIY2PcAF35c7SxJf8UpCg8WeZ/FafRzFHoMY?=
 =?us-ascii?Q?ve/t00gj4RCQy4Y1NE8LRr/DEvIzAzxYOnFZQNNZLLNqe932uaCJc+mBH37q?=
 =?us-ascii?Q?5Gyz63F2BGK8nXZeL7PFtmXK7d8rPZbePIAjm6jsdCrzZ0CBlhrHCWklIQY9?=
 =?us-ascii?Q?yxqN0n1vzPE50p7cQU/DrZvsnqprZ2S2UxxKnm+/JLYTNT0JFEPH4ldo+x/F?=
 =?us-ascii?Q?XXn2T+yFNiBJwTDAUzePiH3aM+XzPJff9m3CZaOnefLdyjoi6Awd88RRGrKZ?=
 =?us-ascii?Q?KxlIoRnE+ZqHZuLid+sUaSbJKVflRWLSmGKwBJA4JieOFDOcowm+dhGqZ9/J?=
 =?us-ascii?Q?JtvKK8vgUrjT+8ZRojjNAcNZio7O1zET2M04mbWP5oP1e+yVEWbS3GCM0vcq?=
 =?us-ascii?Q?3oAroPKdyO4oLagoBJvg9eKPgD7dJ74/eBi0mm2TKQLySZGgkXCHwKC6lziY?=
 =?us-ascii?Q?CizScCIwzLb+cA3XsjEbs5CNS9QnXt8GPnnXf5b5pFxDJ3NiNtle7oxlbUj1?=
 =?us-ascii?Q?Hiq1w3IQr9jhE9yFNdON9fu7pflIznf9Ih4rPR9B0YaPdPbYjhx7irvy5Zuk?=
 =?us-ascii?Q?l2ap8whioFdpD2jFCiwcCJ2S2xXIE1wqYdQbc0jhYmByT3JiC2n8YjJqvymT?=
 =?us-ascii?Q?NlrhtySj+PEZEvvD7rCM2+aA8Eoph6GGhSb56Mq5g1iwFP9G/CMb2f9OtwsO?=
 =?us-ascii?Q?fG/eF5Bb9M6nGw/2lCmc5Ul+qOBU/Tt4Cen+GtS39fl23qPge+hmh3zstkWW?=
 =?us-ascii?Q?uW469604J5O7LSt6ggA98FF33k4RxpJywPv6eAKoZFM61wtMEgt22mdc/3WA?=
 =?us-ascii?Q?eq6vMsu1SBbHzLEADV9PT7U0q7UjpaDz4Lde8LTjaRk0GYyM8rVh9lXTy3tq?=
 =?us-ascii?Q?JG8AzgbBo0XqSWl1rXlaaSiVOwhVgoPL62mdhRIrVtNLkWAT8fsch3mFYyMh?=
 =?us-ascii?Q?J4XBM2sPG4V0P9vzFQkE4dbPNw5bIBws8RHVHruLfjYalc4RU7gfdw6i0fw3?=
 =?us-ascii?Q?f0hJ87pfpQh2/pxzf3uoqdpf19OO64It2Yyat39d9HnxNXpjOOuCIdElhS4y?=
 =?us-ascii?Q?LgK8g4qkHOtEbAdPq1OsSRv66UWB2LyeeIS7RSaSo3LOuNQISNtjJu074sg3?=
 =?us-ascii?Q?M83QvdwC4D2tQ2HMowV5l/f7OjrsxAJnx6zmMkvOe9Akbho4PdqbGFnKNhG8?=
 =?us-ascii?Q?4gAnoeG5i4p36aBna0/WjZ/BXO6JiO+Z+0jxQZD+dL6GJFLARYEITciNOEyQ?=
 =?us-ascii?Q?yNmDlqMZgF/Htl2zOyfIYjGbah+30HFK1RTjtnT7Ft8SrOpU/fFQefxNW+/+?=
 =?us-ascii?Q?3XyTgy3yRI/UNL480U1ziMhzlfTi887s61sJpKmuxjKwEOJ2/1qq/gXB745+?=
 =?us-ascii?Q?KuKeReFRUg3COYfL8Q18biKoQMDiaBuAyJ8PfcGtjjNXtBhwCpcEWdWjY/3c?=
 =?us-ascii?Q?qpZT7wBfB8JtTXPJGF8Og965DrwnvZrOHqvUelY2bm5xb/WZXpZUqGO0bGY2?=
 =?us-ascii?Q?p5ihcNY1yMWy91LG5RndUOazaXvzIlkYmrOhOyIrq9t9WGv12ecXRQcaU7Wq?=
 =?us-ascii?Q?q9/GOGj9RlgFskf/WPqvfzdOU4JydufICDF/exXZp8yvqg2H7e0LnJ+nExDS?=
 =?us-ascii?Q?K1BjKl4MsK1Wsmk5ObpulN5zR0cnu2+O2J13pUtq4QJWC0LLU+Jua8Jk4rVA?=
 =?us-ascii?Q?Dyhwk+KYr6Vqh0v2fmy5PZpDk/AyqmDn7C1MvDiE9oWjQA/IwEeelL0whW4g?=
 =?us-ascii?Q?ZKrHQUxuTj3YKjNXR6Ybe9uslN3MyUsoohRpPTSXDQcI2V49OjmA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 304e2b07-7a6f-420b-809e-08df2914902b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:20.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/zUxC+aTyFFfBqyxwJ9dUqMnysSHkHY2xWyRvTvBnsszVaYqmnZtvFi6va5nKwU2gKkyygtIdj5U6s0BLFdvvgNiYtnPdRAOik7fFJeobP0xCDRzsiMrDy42KO4GJvZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234
X-OriginatorOrg: starfivetech.com

auxiliary_device_init() returns an error before device_initialize() is
called, so the release callback never runs on this path and the rdev
allocated in jh7110_reset_controller_register() is leaked.

Free rdev when auxiliary_device_init() fails.

Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 847c0a39e5ab..1d460a03f936 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 	adev->id = adev_id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(rdev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
-- 
2.25.1

