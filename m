Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665213644D1;
	Fri,  3 Apr 2026 05:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195413; cv=fail; b=tUyqhFP/zLEfbwshZHa2g16IE35yJ87S4tMHl4dzdebI9NzpqmJcqTzOMa6lewBzBWfDs4hdttm5hXrSLCLKBLNyllJikoBu/1LiGXoMd7UA1KtfAPFR1XhLn/AQetosbRWxp+2jRr5UeSw3CCCXPmBEVU6Qb8Wu1ve/CpI/9mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195413; c=relaxed/simple;
	bh=EqDs30HpOmxegHLcjB0nc4gEzCrF9yMhnsG5hVBisLA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UIVFp8AiNp1PMmA3SgJ3xrlwUMPQoqJIwXK0I6Gtlq1d5VD7+JDkrm1C/ml7CUA4KRKNsryGnNSu8V04ZlsopihQ4t5bIEMM75t83pbPmsiS/n78F7F0hyE75327rFIL3lwnUBwhPfwpPOT2MKtnXtaDrm/DphsHANrgL2q44/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCXYD8omqz86twRuOD56XAtOIzMbhFe+DuXSaRbpj8ztHsN5HbuWWq8XpM/YAzn2BkqBPy0BdddiJTh4nOg7M6nHdde8NfUdDUTBmzKdtQyMXVzqF/4cHGKL8qSA110yww+VGGkdt3S8ZuywXKKzJeTDiG/GE9pXOTrlegBy4+tDINiHqWk+fasUa/PYqLcF8tob7TcT/AIxddTwPq9++KM3hXUYzl4WU8WYvgJtlh9f8RFspYYK098QPaBIzTcgmpYZ2Q3Y9J1GTRQNuhqisai/xNdPXL/7HxNQG8ug8Yy1byngkffXkKEXnFcYaoASIXC517K0GjxKPcGdtj+OUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcqDw6LI8XHk/NDG1xDRoExVRLra+zmFvW7D9SaCiIU=;
 b=i71B0HpQml/2KU7QF+6lmTnYwoMfRBqQeVkdHxrj3mW/atzmagAawzt9uScYAhkWBXMMYCcFJuhcdgtNvuyf5hx+En5PJn5UQnW6MP8GG5nQs6IT1kjnmiaNj46XWKQ+VKEsY1ciecSbo5QqQK4HGJ0Mnu5seKp3HrT4b5VdWhEXHb2wnaMSv4emlEAdQ3u76QpRO9RVApH9v1gH39dsjCCaH4E+HzHzK6DPIkGmLNkh/ZNr92p8MeyEJm8RgvVJC/yXeb8TL502GAlcxy606dsfglOiGPZ0hYOGIJj2oRhZFKRDpTbXAwY/KDEnG2hywZGiw/ZlJqTVoM0X8hs/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:04 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 04/13] dt-bindings: clock: Add peripheral-0 domain PLL clock
Date: Thu,  2 Apr 2026 22:49:36 -0700
Message-Id: <20260403054945.467700-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: c2279557-5432-41c8-7d6e-08de9144da50
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m9N7oqLVYgd8UrKKiHt9Yh8MuGjmu4wDtZLb4DKHHhr1piYTU6eFYdBB/5UJ3zE8NLoEP0dsmpETliu5w2aVnko+b2fHQBbdx8vOKznJb0duN4F+kAf1OnwUh/DPO45KgCdXAAoNL5fIQbXYhkqpEegElz7F2ST+DQ2AmKh8LCKJ2Q2aOJZzfxI3PdVIKoUIy4gLhV7yLQJoRgCB7ZIVOhDG0xkXGSWsoxV4YTV22WnOmDGhfvWZH2oDX1oYUPUDFif5QkUGgGbgsuOZovkBTqRwRqBc6pNZsAXxp3tslXGX1NMT2JtrH07N9TmbMFsP6pLgvnaQMziyCvVXcMMC5XerfabE9WcuFo2opSAPkgquyyyXn05+hYgtgZm77ICt7J8Yo1mJf1DFaaRgZNYNvVYQzNviu814d27px2RlTC6pwZKJa9zFgSs97TCWUspn2Ejclx5RFDhdwGwTYTgXtFI1EOPdqoUSiwGPp4kPt6esI4KTp26LH7+xfpi4hNIDC/M+23/SPGSlqXOJlWmz/V5ofg0GxJmYghARb3SWZRlOF9tOMTZuPtltYup4OBiJFz/LDJsVQnpAZGc/yK9dPLDUY0KlNbqhMpbt/N0lwpw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mk62qCJ96lI6BgwylFqPge6zK+ItJJp/+hZusRjxJmcaadMBq27BnAGymQi1?=
 =?us-ascii?Q?O3s2mLk1pJH0HCoOwv53Fe4hl6umEwQQn1l9Bt8QxpPC67a4wOhjh2Xy+qcC?=
 =?us-ascii?Q?6s/PkYpqsZMUIPkUzip6cZFZaZbNMxG1EbqzEptUtgj6DSG+E2YBv1LD+t6N?=
 =?us-ascii?Q?kCl9Ee9GL35pYC8/SR9zkfjqp4WTxiveOj6saos6dc+uMJrnLXLJhwAYqU1p?=
 =?us-ascii?Q?5nLKcz4pVu5M/FMwVXXndxHGVgtsDBkcbE1STLaFhyNtPGX7nYRJepD7d3Z2?=
 =?us-ascii?Q?op32Uj1SIL2BapPGh0EMnjSb+Dgff++TCyK551SqUWzdk17LQ63kg1mDoLdF?=
 =?us-ascii?Q?fMeqipbfJwTtz70YD34LgIGjOB0JZCnD+qZ5XPsNmKmAROc6iFVDCtbC7v7w?=
 =?us-ascii?Q?OdnVTrsxr/vqUSp2NU17k6GsQ0RLL2vQvdWZUe3wxW6MIkODOHS9w+GMK3ba?=
 =?us-ascii?Q?lqng10I0VgNbsKMu1dnpFEYjKcXTBkcxJHFRh6QyqisdsdAW64I32Wmf8CYA?=
 =?us-ascii?Q?GfaUHUsTl90MlOQ+Mjgwg3JcMSBddEzjL45zlEuyGn+x2EjBY2oNw4064PuN?=
 =?us-ascii?Q?HpdSdE7jKBWz5mxR7atTB3wfgnmhDJMAd/9CRLQ8RzHkyB4CB+43S6XzQxrC?=
 =?us-ascii?Q?GqdTaMgQvTTnwOBDS6+Etai9q6jREIRgd4Xlo19Yo2M/WOIeHJiRcmynU+oV?=
 =?us-ascii?Q?x7TqtoMbnosG4/CHEtsYgA6JNMXh8V5zRBWEv7zs+raA9eKZeFxuPBX/baKD?=
 =?us-ascii?Q?kkyIw/JGd/WjR/lqDBgqm8EdCajzQYx+awIE7t1kX0YsEdxpeC+jAk7H6pIf?=
 =?us-ascii?Q?UTMtNzNFmCSOaU3w6+E8ZhusZyEhQDzDMo9riao96Ily1oGGYMUnBxfbrBqU?=
 =?us-ascii?Q?/ZUrs6+9KyeQmFVzhDFbWHbiy9yPxdhfyQZiJPb4VRM2A4o9BqdMrzroeENE?=
 =?us-ascii?Q?KOw/57UxugR1ZX2pSZmgkWg52Kbm6pgEDQVW0ahA6OI2jqlvWspbTFeFDKyk?=
 =?us-ascii?Q?WnOC6ekZ0DCo9laWE1FsFTNpSAkcsVivg5WvF8hDkhTkmhLHwNrArEuZwucw?=
 =?us-ascii?Q?mIPf7uEfId6xmrhnb1BBtWO+fyhdlMstZ+HUwdDuSHYC1yKbl/6C4Xbyr6tW?=
 =?us-ascii?Q?HrJzvUMKWhmneqfQ+utXcP3A2qcS8Az73KOmdP1DVzshbOyU6Q8a5y7aJcBx?=
 =?us-ascii?Q?Lo1i4uGH/lmvv019+k72FnsHY1xFEWOziY7mPOeh8YIhdgCjzgMfo+NYXThJ?=
 =?us-ascii?Q?XIn+aobNeycO9Hk7soLpE4E6OrAOApbxpDIlM1Pqhb8bXWng4alCMkXEkdlo?=
 =?us-ascii?Q?6nVXY+z7ix4Uypg5MsxpVeIolRGhTeLDOiReF9AgI0t8Brg7cmfaVrMhC8tl?=
 =?us-ascii?Q?2NFcaWU/v/Z8jtFENudvScLhBwr7y3hDJE+mgwpUehaeYSKUlAGWod00yItP?=
 =?us-ascii?Q?s3a83E0nzHM5aXAnFFAKwj7LEXjt1fGxq/3yAIi6xBq3LoB5st8RnnnXmhYx?=
 =?us-ascii?Q?Nkkazku/9JKdJEA9k2bwpdQc9ahwEjshIF3GpOVQvw+cL8lk6Y4ENt/e+yWb?=
 =?us-ascii?Q?HikSw47JfE2mEDPzbCBlpSAFVnTqO4lV/GVqtNhVOW8cGWI9o+JYw8b6CYSE?=
 =?us-ascii?Q?t3K8R/pjfDW7bh4Zh60u+8FqTad0KKFUuFSUc5K2tkowicK9Z0vRFu3SafJF?=
 =?us-ascii?Q?M424W2sylvhzh0htDBwQHX2Eyhuxe/bhiRjHPX1Cb6Qb+7t0idERvA7pNaSp?=
 =?us-ascii?Q?C5aVwKk1jR0Vjf10yo6z/fIgWzPqCkMi62Abz8MOFSoBpiRDg7qY?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2279557-5432-41c8-7d6e-08de9144da50
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:04.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6FXWS36p58Jcvtl6239+uH30hOL82elUTVSZzbGJJ7vy1+fbl2H5EGbiV3qmcg+FyVKckl6zjIM0IJNujulLkeH1XOm2T+XMUVOq7X9KuPiThIL4DO7tEc0P73swSaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add peripheral-0 domain PLL clock for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../devicetree/bindings/clock/starfive,jhb100-pll.yaml         | 1 +
 include/dt-bindings/clock/starfive,jhb100-crg.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml b/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
index f7ab90c05281..920fde5e1b0a 100644
--- a/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - starfive,jhb100-sys0-pll
+      - starfive,jhb100-per0-pll
 
   clocks:
     maxItems: 1
diff --git a/include/dt-bindings/clock/starfive,jhb100-crg.h b/include/dt-bindings/clock/starfive,jhb100-crg.h
index 719a6eb9b1a4..55e91ede977e 100644
--- a/include/dt-bindings/clock/starfive,jhb100-crg.h
+++ b/include/dt-bindings/clock/starfive,jhb100-crg.h
@@ -14,6 +14,9 @@
 #define JHB100_SYS0PLL_PLL4_OUT				2
 #define JHB100_SYS0PLL_PLL5_OUT				3
 
+/* PER0PLL clocks */
+#define JHB100_PER0PLL_PLL6_OUT				0
+
 /* SYS0CRG clocks */
 #define JHB100_SYS0CLK_BMCPCIERP_600			17
 #define JHB100_SYS0CLK_BMCPCIERP_100			18
-- 
2.25.1

