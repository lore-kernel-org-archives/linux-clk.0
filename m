Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B5E47ACC7;
	Sat, 10 Oct 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630883; cv=fail; b=GY/VQZZZKnHd44IuIxmPwAu/17aBGSPj4pHgIAlcRSFQNK9KYnomg9HwRJOPxRr9Or7M4Xvxxpwi577GOWjy+010eJspbAbCX8VMDb8m+ZWpPAzyVMIscK6STeh01RxgcSZP7UM3D+4tD3/pnoysXq23iCo+Vx8F1jQ5h96/BAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630883; c=relaxed/simple;
	bh=7Zt3ee8G9vbqpyOHgC1LCICGDnv0e/7bsAKQHfdWV9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=plAVpeFncDxT9STe3QKFGlESP0qbp0KCmZDwUyjU3h/tucGSGjaQop/4BRL128CgpqR5FTQW/Cr0EAhqSBYhqSaDRyQB/HZKQJXKU6/CtaxL4oAm6qnqIuvfSi3lJxzObwXf4BROkm4so6fJ1iZANZR1cambTfeGLmwDGKYQkcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW6tuL7yfqWsuCKWp4h8GZGg20DQrP9guZqCDy9q/hBj8J7r6vLjg+3q++lhn8IpJ1N1mwTzx3k3aTc+HONaHpSSLzFaMpjSKqUyCMt4dxvrZAnXASHvMTqqwhZz7/G8oTtFLO+gFjsIuSK1d/wQx7BS5rkOP7bCvfRpPXYMhH22TXiirfctPoTQ5bvpXE4I551VosMBxxqVbajwO93bzJlaLA6mGAVzQnAZBELXU1v/G/xqEGHNHdHQSrv/FNPw6/Epl/AqlhlN34OK4G/7w0jcNoKJ5mWnPstWSVBP8QKjXb+e1hpAZA+90865D9i50EyeGE64cRAsJqUUeLVizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IS6wB5zhQDR96iFg6IZ6NTdfTOqPH97FzkCcR/YN0A=;
 b=TRPJsgm4EbNF732pZaVYag4lci6irGFV0woLWq+UJdwwpeHpJa9qjL6uupz82FU60q1fpJSej/n66DmUf8MD6ObuJQFD2OrNfDV6sNFfO0lNAZGSF3zsMTiBOB6W9998gBBfjyVQEwRbMgdNOgshIpXl+Cu4sV6DvnocVpaDs7s6sknlrW9QmkV6KEkUxOaI5TVp0kiM9pmZtnTMiuMYwerCwuAMcJWHiCdfH+Tb+hvXG6unARDOV5ztJMDO0IEuLB99q1QX5/L2B0mRnNIk9YZHNShwSdTEsgjZi0eILVDD7vSNBsGvsQoQb0qVQTsvkLgy1KlMTkiNH+iSVMyOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Sat, 10 Oct
 2026 10:59:42 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0496.017; Sat, 10 Oct 2026 10:59:42 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v6 4/5] reset: starfive: Introduce active_low
Date: Sat, 10 Oct 2026 03:58:58 -0700
Message-Id: <20261010105859.19505-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1005:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e3842a-5150-4b3c-1640-08df26bd9628
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|22082099003|18002099003|10067099003|261009223027099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	YhlspRwMycZqxMcCAaVzofd8liEW8pauGDhoT2S3EXZVEB+DvI2I61xAm83f4mhGQbH/TRmED1fjfaIpEQHEGwLaVmVT8Ct8mzFQJQY4SGAoTN7sfvxlmEVVAf8RLkje6/5x87REIlBwgptg9bv0kPmRRaPFjhuPMRHeFOSWUnh992MEZuuLAetr2H/+FQs4x6tBTbOxgdfskneLrot9mhOR+WAcaItCOCeYr8ZvUrE4fp8f0EXuQRBNJVSRx8mLYkD8d1oB3BCjRMSGbjkomdEtTYXOsPBiwdMMeCKPKXSEcIMvfQQfhS724dKhbTLucEpCFZBs192BfZGfm2bb6wb51UfPp5IjT+yBYN5G+h8EsoCr+KlQlfZGLB7d1J8nWku3bw6EWLRfjDqCx9Eht0iaMUGeC+wb/Sf/myMCgqJOc3eWWEODlGIXOKVfKCl4qPXuPs1fkp4fWxw4ileuCRZtSv68PQDp6WKarcyptAA48NzxaTHb6KRuEMgQBTuI2a0Ru8+bw1SaaPLu2cEsIDkU+G0PQAWG6kbj7f75Nhnpz4Cz+l13qzKj4tUZbuat
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9W6Ihuiu2E2le31L4ktdY8omrmsFevQfxETYvTli+9RypodAjfSsafhnA4Pa?=
 =?us-ascii?Q?73YkyHN0+KB4gCoAjRtDdy2jsHokii/Nr8d43wL/TrE83HMQ4XDNCfxqj58+?=
 =?us-ascii?Q?6gFoJxvHTv+YK3NH835aGipTUZ5x1QfyD3ViA0/Vvbyn7gHCXNv1p+LjwjXi?=
 =?us-ascii?Q?0J2QLScuzmEGNOTQSziZNNaaNBABi4PjEskvSEIuhI/4CjmF2+d8OpijiJiZ?=
 =?us-ascii?Q?VrFUDRLu4X115ZEIClXDcJ0VcFXLtAonFWCNjflexUjnQ5UKeTIf/iSUWMNY?=
 =?us-ascii?Q?FrjwBjwh8rJm/cFTLMJO2b5+2hXsdhBmEQggcU6FbkTE0CIe3jh6Mi/uQGiG?=
 =?us-ascii?Q?s3m3JGzWYzsMUeZWN3JNDLXkNLn14eXqSDtdYKYxE33zh8pqILlOjYZnSRl2?=
 =?us-ascii?Q?ioTVq/82jVCv70+MZopzNhNEP+EkKDYXCTOdYsDlBqJsv9jQeYqnRW7Hxsax?=
 =?us-ascii?Q?HvXIeYnPHa5IZ9p+QfKvlCPQ47JGfRsO+7uzSQZCVOMOHf6e60aP1BM1yLdG?=
 =?us-ascii?Q?ItOdLZL4krxmH7vIGJQkgytdHjCUiN4NDDu4PKPrC+ovsCaIxLXwru3jXjVU?=
 =?us-ascii?Q?6j/BOa6/BeV26YA2eyQGExu8Ncpm8C701swuGYinhXOxGsApm1xpbb2BO5rn?=
 =?us-ascii?Q?lNTUJozcgp0ItUFmakzq4L3d+haMZWbEwCFGuqT/DbQwZTfdC3PawAAjQT5u?=
 =?us-ascii?Q?jkukDBo4hHt5XXUX5Rr/yr86HE9cQcIRLTK9zd9QUveCBCcE0YKe6vBAVq1t?=
 =?us-ascii?Q?2ou/9gDIaR8OTaksUQw5yME90K3Xb5kw2IxQCDlWsxQkKAfBFHZyA8e+Ujsb?=
 =?us-ascii?Q?2uUvd5EaVIBUQQVns8kEPE/FiUjNjKgfdh4+Q4Io94wER1d+23TpKMHWz4au?=
 =?us-ascii?Q?bJ31OhmYSA/AI1Q7WhzlIClkrBEJCg0e9GgSymc/DAJKndBHqrxg+s27qFpc?=
 =?us-ascii?Q?yLqEnWkGhbyXos4suiTmGVvYG1Ae/bCJd9EJQG9E8b34flEIgqAhvFqVyq1/?=
 =?us-ascii?Q?Exj/J2u8XLO+qfkcp/YXsByzXHlW4ouxOz+vNpnSq++VjBkZFQ2b+UMWMZ/6?=
 =?us-ascii?Q?AgHmuQEFetkKalBUZKvRLxzM2rZ55q/Xf+CrMgHv7aHXRJRMAr4zAXMXAEpp?=
 =?us-ascii?Q?s86kgml3/fB7GokRQoF+xfFvMwH24IO3c8Q072NzVujPonl2AVLuI+UBhyWi?=
 =?us-ascii?Q?7vNS2kV2O689jZhUX5Dz8NJhvY44maNijIAMbv3KTkNLH70QH9stm53F8ili?=
 =?us-ascii?Q?HTm6lwPPFvEK/hZeBTXKvWzccX4VwzMuaIf35cbmAmLyzOuAH1KjwrLPxFQT?=
 =?us-ascii?Q?MgeNGQJyKmmeGx36lDBHnAdAf4qYCTAAJlL+ks8tCJmhT7om6lzcKPJ24IBH?=
 =?us-ascii?Q?awGl9BFJCaPToTZS+IvBxv3nyz14JIjgRab9NvVGGOsIrgFTTfsjoiTTaqF2?=
 =?us-ascii?Q?ln4U2BWefXWptlDF2NF7klzu1O2IL3wzc4FPt7oEWHKQiph4DlUwVd9SFjnR?=
 =?us-ascii?Q?6m1ykpfNEthpLINwaU3XDiW1YHiLkZajfQ4p+1BR1Oc99GovQr0egBRy9bE9?=
 =?us-ascii?Q?0eoqH+osaTFw8oFiIqy4gsAmssLH89jlCWjg8PyT53KtmLCKXFAXLBu0Owoh?=
 =?us-ascii?Q?Zj0DFbz7bW483iU1ZtAGXOCNvRNUaribQJ73KjJ3PwIWTUqg0n5JMYvkmY2f?=
 =?us-ascii?Q?Z+6PF1l9sKgMPps3TLW/FBGTYSmKvHSOsv3lu9VTEgY1tdTwPYGmic/VVR0V?=
 =?us-ascii?Q?dgck0sn3UASRZCES7pQDkEHu0xKsp0WvNnB61vWOmLG3T2iuap1c?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e3842a-5150-4b3c-1640-08df26bd9628
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:59:42.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCHoSjTEEnuMS7+auVn5YXiVtLivHUgT9LBcWA9YStuAv1Vom3WLO0Ez3ofKVmoL7NT5Tcu6CCCORn38kiORlmLVVg6YUiOlY62Tw6ahtAeSKKMW2tc+NWsZ2P0B+xeJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005

The JHB100 SoC supports inverted operations for reset
assertion/deassertion, introducing an active_low field to distinguish
between different operation logics.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh71x0.c | 3 ++-
 drivers/reset/starfive/reset-starfive-jh71x0.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index fd1c755a0017..f48959b66f7c 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -52,6 +52,7 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
+	bool active_low = data->info && data->info->active_low;
 	unsigned long offset, flags;
 	void __iomem *reg_assert;
 	void __iomem *reg_status;
@@ -76,7 +77,7 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 	spin_lock_irqsave(&data->lock, flags);
 
 	value = readl(reg_assert);
-	if (assert)
+	if (assert != active_low)
 		value |= mask;
 	else
 		value &= ~mask;
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index 36f198139602..7a967eeb3181 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -15,6 +15,12 @@ struct jh71x0_reset_info {
 	unsigned int nr_resets;
 	unsigned int assert_offset;
 	unsigned int status_offset;
+
+	/*
+	 * If true, the reset is asserted by clearing the bit and deasserted
+	 * by setting it. If false, it is the other way around.
+	 */
+	bool active_low;
 	bool discontiguous;
 	const struct jh71x0_reset_map *map;
 };
-- 
2.25.1

