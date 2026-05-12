Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED34A1385;
	Tue, 12 May 2026 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574960; cv=fail; b=NO+IfF68bEjFmrP+NW5SCSjj+TyU1RQmhxc9HlpypaXJS65aA+oIi+oxe+56yfgPT/IYMxjg+vVyTQSzao6eKMlA6fNo50rWatcMIfFyhCtzAq9FPTYb3gtI77LK4W8mkE0c1O95haNprZjQw8inCQaTf4QtE/7LxRRXssKtlo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574960; c=relaxed/simple;
	bh=hiErJR9700Bsto66H40k5aqNKYLCE1Rz/PcdJcJlCSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BykGDxbKLn7x4FKkkVZwVphXVQBz8CsanUb7Hx0cS01tablqY/H+1sil2LV1Y9eYGV2Nvhl/nwDq5Tl9ZHZY2oO+wgKEqOoEYQxo72eWDPsuiK4h1PrTEuX631Q9R92m4VEsG5PeFEk6pMJiQcVZI55Hv2Ce9bKBbjwistUbojQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfUQ4psGLU2/ZezlTvrGWZmjIYhVGHDatoSdoKWYTHIsYACSugfpsQpuYe5YrX9Ey9NkeCFzSzMpiI/e5OVr04I2XeQctGOsfw0V1IFFKpGFpKZVoQvHsi9pIpO+LKFKNaNvuDPO0X7r77XtygycZz4JlxjkaeHbEr2Yrhu3ORh0QgFNw5FMwjL43KU/KUmej9lV2lH7pF9ZtVmLCLHUS8KK8Y28g6Ac6ejQcZCrMMpyMe0g+3NnYQvFMe/m4JsWe+dn3rX42G5f4rsHMyLzy2ro09bJFi39jM5meOtKPo5C3NrJwyRfLjD6c1ysms5aePRb42zqPtzrROnmR/Npqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1LMA7weTkKbNRUDy23hycZlV1z7f2nYu87iFjtIr1A=;
 b=MoQz4K8FL/ZRLqohuEIpNyrODmOdtLiSDBoZMyGkvu1FgDHt21KGKCq7lgFqIlAcp7MNPMBEGX5TjS6J4uIDsBtyPl1F8sZpasyoZr9KMkqN84+dFIYE+UGREWRGKY1aCWlk0KlyBi7hFyglVYcf5WgZ2P2JT7ewOi1nACIxi3Ez8D1gynC+J+T4Vb6kTAGfptTWsRo+BqV0dU3k2Aup1ha5bv8Gr0MD5K9rnqCVIouefWUg9rJ5UGRp72HZTUcokiUjS7Zm4UgPyZeEusAH9e07EEJs259vIxYe5KmzLPdT/TvNOfu307CDIWHqlNnjAfCMbLkIrS9PwUTjJFqTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:44 +0000
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
Subject: [PATCH v2 08/12] dt-bindings: reset: Add StarFive JHB100 reset generator
Date: Tue, 12 May 2026 01:35:17 -0700
Message-Id: <20260512083521.3448-9-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: d633502e-f628-4488-94d3-08deb0017565
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L/W8F7ROdPT4fmmqQiLTB7sm6ZPnJeV7+D4ShNW4SR2IxeFlFBCzmAwGiltvEDKx6vjA5vEsOb/cac/HhH60pBbdB4lZefSN72+PToCnX36M9YhwE1fJa3IG9e2/K3DEG5RcIld1CGzhVPxexdcCmM3qo5jkEM2LGN+oc6CuO3LudEDl6b6glEfO+BjxTlfTBIkkDKB7J9e+i2VPc2E7g0LnGs+AxnHNkuszvcR7O4opCL2dnzVxM4RQnDXc0OtTS2BpjNodtr2bnksITp463B5HULLBx9gyRj+DXGPFgxMpi8J0p7WIsJ9EGcDcEZktIZ02Ykm81L98CaslXBGb3gc3b1ix10Ol3aMoHAsCVsrovfYlxU8nyOyjq2cc93eWgQFh7rm3I8inxixPIUSm5eOJthK3heSNjGrEIdmDg1vPLu4C3jS4D2kobwM2G8ve84N2V2WmODiIYxwO2wxZn++fsD26jAc0H4z7IWCQuWIW1lSfXDEwY+RoE7MAjV7feJNaNVlQm1JchiXsAV0Y7awhSMPuFd16+Bm12L5KXhCpqVKPI1vBtOTRq7r4+zTsF6Ld9V0CXBRKOVGrGV7Plg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ORkDznmJaVCdWRNobk7Opk8Qizmc6CocSFdtekpFUmi84No66fkKz+D2BiV?=
 =?us-ascii?Q?v/NXSN2xV3oNvkPqL05hH58no2Sv34UGyiAcPVIfg2uycCb35N6l8pfZ+gFn?=
 =?us-ascii?Q?piG7vdWS57doWDs0CmgE5+2jMQE/yHCKlsuVqTlNaYwdMjQWpp0EEsPPtWS2?=
 =?us-ascii?Q?dXrw02GTGmzw4q2uqjctSUOZLZJm8W2t76I9UNJhoR55LsWGP41N8xncPR0v?=
 =?us-ascii?Q?uckM/b/NqQAy9CD32SdiZAKg553TMA7NGVhtrZM1yLFxRjYGuxXqO48Zkk85?=
 =?us-ascii?Q?jPXtIOtAXKnFRXmfjwebfH5NSc2Zljv2f39UB2lkVqFGZo4xBh6zBBm9t58a?=
 =?us-ascii?Q?oJRSs00mTNh/hy16SagcyMRf6iB3tckyufJNillGgiseIHZvomgK8qJ2DIpi?=
 =?us-ascii?Q?PkpMo0ujoSYcl/DvR4zOHG/c1px7AQCOjxAjCaj82tSGBu3Bav52aOUqQmQ3?=
 =?us-ascii?Q?1325WrDKk/ZI+h8qlPLgv876a68t/Ff8AehXWYrT9pfHj+nlSvfS44DdJb+t?=
 =?us-ascii?Q?rN5kyc7fGt9gGN1DKoEfH3P+WoIPDQvXrSbZ3xocXPzf/rJ2w9fKv1BbpIVI?=
 =?us-ascii?Q?7To8bpQuzCZ2sTcoN3VXOG21swDKOwbVzWKQDroQyf/acfrNp08V6LiRkh3y?=
 =?us-ascii?Q?MSuznp7fGfSsEJ7h9LFP7o/vcs0kDYcC308GG3zWu+IcnN+Y5iYtLGVVNfiG?=
 =?us-ascii?Q?8gOrxANCjmICGWUJZQg68yCtsHItlYQSN/ly+Yd0UCMiZqPbJstsQOP8BYGn?=
 =?us-ascii?Q?6wFyxyZFXBg33QnsnDUnZuuqudomiKpPq3Co7l4a7ltagrjackQ8HBctSfZl?=
 =?us-ascii?Q?s5l+Bg/Fo+NzzX3jn/swdjGPyGv+6FRXCsLaSHLyQCaJGL9LhWGqouQEB7O0?=
 =?us-ascii?Q?Hjhs25eO4EI8IVSEES4gnprK8LcmO5h6O95GmjP4AY2B9kTsVxRe3mFBNfrT?=
 =?us-ascii?Q?WpbZ0YDAhB9BRqDlAMbV80GgyyoKa1PGjRJY53h1xiOdyNObjukSaJzJfos/?=
 =?us-ascii?Q?Lhp7rhKviq7cYDfToj0I72X/3lWn8wUAm0QjyIbeBE/P61OUL8nJjPRw0y1c?=
 =?us-ascii?Q?1TqhVEtNzbf7rRIVi9fLYHV6WSezU2Fggo9Xmp1ceZswTPmJ7p/HolcPmN/0?=
 =?us-ascii?Q?/dgOYf8F8dHJR3Vq1Dm8dCaTFRgyR4sJ0P/WG9qDUFrLraLYS+LEO0uA/UD5?=
 =?us-ascii?Q?YIuYl6KQrtOonTLhg6HMJ0f/15ui2BBqCf1bzqUJG6qc4giJLf2K9CguPbVd?=
 =?us-ascii?Q?DCUf7diVhIXX1pRNQBnPnUYkzIiyF+EAJehqF84Ze5kgOXZ29PKHwjfrjs6m?=
 =?us-ascii?Q?bgxrjTCbMNpu2uWioG3Vgv6JdtE4LgcR4vLpit/TWTvr0et/UGtJkqEjB+dC?=
 =?us-ascii?Q?7LnZA865R9T3wZmz4XPoBXago+HugPc8Pr9YS5O2g9RpT8NR84+qUGBg8/KZ?=
 =?us-ascii?Q?19f7bo6OilMV6ucT1UGihaooHB5x3/INfpW8tpRq6OYQLAyJ7L2rZnVpiDx4?=
 =?us-ascii?Q?aY4zLnr62ZPS1ZhLeaMZIsSXwNe92MS+Xv5sQdvwUNecboZ5rUYAlu7QfTJV?=
 =?us-ascii?Q?f0Z6fhSejKovNMmIBUGS8WBgP4CGvqa/2o8GfWekWLsbUi7D4FQzBSXHdStr?=
 =?us-ascii?Q?aNBcitv3ZfVcsIcyE+4PwkyyN8CVUO0Tk9CAdahDw6+jkqU7qUwUPVw6/Ba9?=
 =?us-ascii?Q?9XPe82pgdthDut+S4qbG3l/JQCtEbBkWfHGMf71UQwjyukZpxZ4YP+sJHJ6y?=
 =?us-ascii?Q?Lv5hQ6+aab55FHqx1c71eUcwbJ7jUUEgAuOkJYjejQmaQ4YnmDd2?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d633502e-f628-4488-94d3-08deb0017565
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:44.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTk78+bhwZj8wlakrKmu49FPTKt/ifoMo6FlBqOQIB3K+gVFNQPuaVPV/jtkGzjXmjwNnNy2gU0oYFEkpB9nXFiV4xloD91lBS2oaLCVMItqqqZskbhakemBdDvLs93q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204

Add bindings for thr reset generator which locates in pcierp syscon.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 include/dt-bindings/reset/starfive,jhb100-crg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/reset/starfive,jhb100-crg.h b/include/dt-bindings/reset/starfive,jhb100-crg.h
index 872a4dd25beb..1489bb01c2bd 100644
--- a/include/dt-bindings/reset/starfive,jhb100-crg.h
+++ b/include/dt-bindings/reset/starfive,jhb100-crg.h
@@ -183,4 +183,7 @@
 #define JHB100_PER3RST_MAIN_RSTN_PERIPH3_SENSORS			5
 #define JHB100_PER3RST_IOMUX_PRESETN					6
 
+/* PCIERP SYSCON resets */
+#define JHB100_PCIERP_SYSCONRST_PE2RST_OUT				0
+
 #endif /* __DT_BINDINGS_RESET_STARFIVE_JHB100_CRG_H__ */
-- 
2.25.1

