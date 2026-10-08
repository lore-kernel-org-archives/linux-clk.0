Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9634F46F;
	Thu,  8 Oct 2026 20:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490199; cv=fail; b=GIgm4YsXxQ5s/6sdHnl5l9nMC6P08fXzR3q/YyVr1ypQbxs9tLENAUBHBnBl4cZmRZxfUgNOr+4uo37QQyWCymr1aKmzxq9eGjLzbWaBtu6LVPY6stAQXze46fYFkCqYwGT4hpE2KexOwmxsxmfy2HTqUbgrRLiAv/WiOiv1JrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490199; c=relaxed/simple;
	bh=UiX5XjJNUcrueZxhM7bT6Xj9UymzgxylSV+SxmhFz/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JaRKRCpR5D31q7d0T81mhi0W7g4IyTF61yvfVmEhiGqkERC4jzXeFobH39YQNCNgiYNQHVmdnbQz63DYFp6QBU0BUZtyOcEi/Hj6LaRreeqIdVJzqy7hYigXx5vdyxVIIH9i1bPiQJjNlYnmqaHXY2CFBhJJOBDAEWDU909uGcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5npQ3K7AsHWPAjvdjE+q5sv3nyvyfa3wKsU3hbu0PM7JBDYbWEFE1c2XF7itIjMlpGzPrMW3skmxAaxJl9X0MrdzGBzox7z3gcDuTfb6pgJBk1WO0/QQ8JWb8HAhQB7wAhHoebt/TvBufx31W/Brn42ii/WORXDVlDQHJGVyYBIWPoefCWhnEUB5ry2U44/5KuMgcn1K8oSJyhIIAOEJ2BwnV8zsZiwG0lnM8LFjpb8i7Pnlo8A3EW5GONLuogtCXGP1VTV4i8Fagy9yh2XcFPOUOiexsWxUE5yOK+W99PwG67NuTef3LZfhpzVWKRgz0tw47+daOjBjkTo2U7P3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZHLzbP5KOXiY4QrRIUEeiTdAExcImWk5gPdjF/ccG0=;
 b=dImWcCjqZGyFiARzssgs3uvAHjs2i+xbqxtjHcORjPaLLvQOalDthKGoHg6E/e2r2oQ9Uac7WIl33NgK69OvgQwIvEfwt6c64RJYnmSLxOns86m/vB1jmSztFd4w9mogEZ6hBCopdR9uYFDNCF3sE2oJH3MzUympLtonD83DPsp7RYXrz+2qnq1pAirLSkl5q+UGuz6tTVhCTfRK5H0PDYzuQ3MhjSmOtCL2FdLaFG/hDj6nE9GW8NIM2W46KuRCT46X/K6e2sFQmNYkDGe/GUhXFyFUlX207V8skjzbluEtBUBLwjIx9SbZ9BK4XBNaSYTYH0omNqpSmYC3g7XApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:57 +0000
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
Subject: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for inverted divider clocks
Date: Thu,  8 Oct 2026 05:33:31 -0700
Message-Id: <20261008123338.11081-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5429f9a1-3720-407a-6cef-08df25386c5f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|6133799003|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	dq2mpWNWDvN2rjOUETjC/NvowYwBoGLLLZsQrYRJgK6tWgr4nFUFT6lmFk9Xgo06wyyLZ4d9jxD1tQ67h6tWiJKSiVZ/q02S2ul+jDjoUcsiAYy5yeVh0RttZvCh/c6ZiK12E+KUj02pD6JFJ5lhSyNxS269ZMS86ZyVHYz4NMcq7gYOHLKS6i8wRc+wopVc/aenF5ZvvVYDwn5kXgP82FDtQ4FaZ9gmFeNETNDTGmcf8A0JuQljIr7/HQ5kn3hnfpSB8HwazJb+Kax4ZvXcNOdgj31BaPX9ZsPWastcm5qAoAOI42cVV/TOHPML06IGDQlWbIEgmMi6xuzqm6bzjAgnR0LUQj5m/1AVfrwdter65l2IGfWlFl3YiMEULfJo+mqpd6LnRqNYLzzgESU+weBOi3lu9hrAXuGI3iorfcgnC/7jZjGmRqmo7JELXrff3OyczHn0IFevmw8BX6ofoMI7frxwUhm2bxmozD3Uwhh5XMGRM0n2xHabUKzWIrPaNtRwRL3dWkDcpRQTZ2KpiMrfcbCHhr2PaCqI/Y2D1lARzubKTwoFnJuFVKTevqw+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yuRXQhdPeSXqhWvn9VQ6rHbs9ecdTnI2t3bTpgXSO3yAguBxAzYA3xYB3jH3?=
 =?us-ascii?Q?xTzIuIEt2aIcpcxwir+hzjd2t+zwYrqW+DSPGSZ/zMO2wYy8gKRhiJPlcnKK?=
 =?us-ascii?Q?zWgeTmJB82FJTRn+F/KumDxocXvw0ulh0Dy1zf4+AUWTZznzVVTk5sefTES7?=
 =?us-ascii?Q?PrfFsA4rxGGKPIrn0zsGrlRgpnXaoTb+7CSxtylWOmgNIiRWeS5fU6bRfpZn?=
 =?us-ascii?Q?JclDOy0Q4WGlapCE/uodyP19dVGSmb38l2pqI9O+JHesTZtsYlGZvhy2AghB?=
 =?us-ascii?Q?Fp3ANwaPXC9eKZP6793EH0+zGp/+LLAWuxEhVK7zbKY/F98GCUj3Zv2lNYAm?=
 =?us-ascii?Q?opaMha+sVTHucb3x8HicJArOLa3037+HHxBtV5jVk6SYf44dvVT32ze5b2eB?=
 =?us-ascii?Q?Pnht1PqyAU3Rk6fnKG1bi+jcDIpyx8kFpRKHittJ2DvPPI7nKXgioT54WoC4?=
 =?us-ascii?Q?zSDxZslCtHNQL98JyJTuFZA4ez29PKFXgDL1D9dWStgqWD0vQEtMJsxogPOF?=
 =?us-ascii?Q?aCyU6iEe+o0JzUIjCS9EY5vHoytNhWtsQQA2i3suxKbRwXAuj2P489ySaGkP?=
 =?us-ascii?Q?q1xib47ZF4+AdsSH0xouvAtiamNIdf1HGqhGDNnK314iPZ7JV46PSiBQQM4J?=
 =?us-ascii?Q?p1pNC4LyJm6XXSjXboBKapjojoqB+dcQ1ihp0HZykG/NG4A0sDk0ks5umDfV?=
 =?us-ascii?Q?Wz5QoFQUUdw2K0ILwxfnpUd1geu4/Ghc1xiy7RIw1K1zz16vMT+T5iw2cdLT?=
 =?us-ascii?Q?8bd1DIBSK1Pj0DD4ne9yA1fShlmui7IxZh5T2i0RwLmaLCuHvPa2nYvGM9YX?=
 =?us-ascii?Q?pqJzG48Ue6pkNb/Cd+u+E8CSt3qPHjHgQYhQ/6LIwdt6zz5jQ5T+llTWYZg0?=
 =?us-ascii?Q?Qi2rL5UXVcqxVJTOx2/tbk3dUie0rwPL+5LAn6PQxpUh1fUe0Btd5/bIv5fC?=
 =?us-ascii?Q?U2DKQ9pmZhBndpB/SPcJXPbTyc07gAQdrad5/GeU+zpjusx1Lq/NljTGlm+d?=
 =?us-ascii?Q?BPwhGK/PI4MVD35cn2dYFi4vXHSDjr25J2mxMg6lSD2TH/q6ZM0JpP6+kxmW?=
 =?us-ascii?Q?WVXR5vj65/8e8r2gSuTsv6xRQQykwolsUuQhrBX7l+gvid0R6yyWqwlO7elq?=
 =?us-ascii?Q?4AfYshhTrhrc1fY+H/Yaq4hI6j3rH6RvLWTb+hF8mO+eQH2TPspfSBMEXsgQ?=
 =?us-ascii?Q?HHcydRnD1R66NyOZmEj3EpZcvwdAzxe7vft7l/o7L7BazZaNa1MqhpMpAqOE?=
 =?us-ascii?Q?HHMkG4V5ot8uy81GIzCj6ZHER8/xoq9/8AVTOlK8XtaqXeqTkGDIk+tG2SYr?=
 =?us-ascii?Q?t6uWag0jNT5CawGfquQZYg8VNMCbLrd06jOmol1tgfvR1xuemx+JzzB4g2bO?=
 =?us-ascii?Q?JnaHdChKAGhYnlklNat2x5GYrHbCQRYgVBYugT/cNdEwVgPHt2/MDvoSXntH?=
 =?us-ascii?Q?Asy1t8Okunz5ljPqwGGlh1QCC3mjEwx1hc4GMBtFuUI/Wtkz4JpfhRzMNLgr?=
 =?us-ascii?Q?5YKgS44ftMRWPC0yMVgGw7UC3DDsZhNVle82yBNjJGz1ipgwPk6+D/O6jLSX?=
 =?us-ascii?Q?V7mDuQ6VY+sh9ZIjup8GxdfMvTOYmnJfyiy3reFqZwup7wn/ZKBd9ISyNcdf?=
 =?us-ascii?Q?iADj8pfgnHMvXawQPX0RMbjIuiRohvc7qaIKLtNA75Ee5UIHsaLH9V9JnKJK?=
 =?us-ascii?Q?7JsABnKAtKtVs7gMq6cAAZAJrg1TBYE1gTkij4kDNtLo0LescEm1x5WGXs/E?=
 =?us-ascii?Q?GiNcJ2p8qQKHA8jiGZjM57HM/IDpTwwmQtw+BCQ45ViTc2LVHUXX?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5429f9a1-3720-407a-6cef-08df25386c5f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:57.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybnNcy5Lr2lf3qqrZOZSSMxW1/OHQ4Ux4+MW0uVEiBVAO/t73tuJ7kZ8aj3hSe+w2r337TTqwZaOkxeyfAUCCUxEX8arxEKU9wXiYQs9jaWazwMBNVKm739biHCE1+9v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Some StarFive clocks only advertise the divider and invert capabilities
(via JH71X0_CLK_INVERT, without ENABLE). Add the JH71X0_IDIV() macro
to declare such clocks, and jh71x0_clk_idiv_ops, which combines the
divider rate operations with get_phase/set_phase.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index c5ee82db3c92..224fcc3d08db 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
 	.debug_init = jh71x0_clk_debug_init,
 };
 
+static const struct clk_ops jh71x0_clk_idiv_ops = {
+	.get_phase = jh71x0_clk_get_phase,
+	.set_phase = jh71x0_clk_set_phase,
+	.recalc_rate = jh71x0_clk_recalc_rate,
+	.determine_rate = jh71x0_clk_determine_rate,
+	.set_rate = jh71x0_clk_set_rate,
+	.debug_init = jh71x0_clk_debug_init,
+};
+
 const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
 {
 	if (max & JH71X0_CLK_DIV_MASK) {
@@ -313,7 +322,9 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
 		}
 		if (max & JH71X0_CLK_ENABLE)
 			return &jh71x0_clk_gdiv_ops;
-		if (max == JH71X0_CLK_FRAC_MAX)
+		else if (max & JH71X0_CLK_INVERT)
+			return &jh71x0_clk_idiv_ops;
+		else if (max == JH71X0_CLK_FRAC_MAX)
 			return &jh71x0_clk_fdiv_ops;
 		return &jh71x0_clk_div_ops;
 	}
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 2a1f0fb4cbb1..4cb3c2ef9525 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -104,6 +104,14 @@ struct jh71x0_clk_data {
 	.parents = { [0] = _parent },						\
 }
 
+#define JH71X0_IDIV(_idx, _name, _flags, _max, _parent)			\
+[_idx] = {									\
+	.name = _name,								\
+	.flags = _flags,							\
+	.max = JH71X0_CLK_INVERT | (_max),					\
+	.parents = { [0] = _parent },						\
+}
+
 struct jh71x0_clk {
 	struct clk_hw hw;
 	unsigned int idx;
-- 
2.25.1

