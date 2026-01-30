Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3A37881B;
	Fri, 30 Jan 2026 17:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794101; cv=fail; b=nLXyQGC7fOfFs3XwJWLqTGOY75Cg+YvMRoEct7Oa1m67DiAGJdamItLpHhrSx1kw1L532UhdXAA+04ZhV9qQXRBA0beaMEkeXxc/ZtQGyb4KA8js1JSJCI7CNtlKhyEOf59W2Qog9DK/3WmKvORl55qqbKSevC9LbJPI666L1/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794101; c=relaxed/simple;
	bh=RKLIfN5+ZXjXjO7P5jcKlSnkE6NENkFHQqxITK4yRkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DAIZq7lvnX5pmM7KSieZ+9qFU4vrkOhXNYMtcaOgrnukLF8g8xxl5QGZv0nLztxUZ7W0maCSJqdwccjWhAHWEVdFz42R6fd+g/3DHuSW85eAWXCjB5hdt1mgxMBf6+3DpPccrUHhGwDVZeArQ45E9fWOuESJrcsYRyme8WRQj/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fkgi2IGC; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fkgi2IGC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOOMXkZPO2vwT8lCFGgg/Hut5jY6ebs+v0HwJxn2sMCTaVaJTfprN1qfl7UCUGxMqUAVWFu9lS0XeiqJVfOSmIxy7M/4791N5EAQzBms66yZnWMtfvdXdcNfTslFZx4hu9eykFGRN0VHwIMIkZwo6ZsjhY7erutt5f6ROJYdYLCS/L5ynPrm/zniQNxPVuALY7S41TrPFx1BRKSJcnbsbc+7oIwtQuO5RJf+g3ep0IH/bbSfr0CGmWCMiS76ZbgH+NYszH51vbOjFsMq2g2zt9SGXcKeyKQjNtGSoe8X35S16MrUhlPYJYenw9GhiySHHKBLhPksPDL9i+u5RM3Hkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mba9ln5GDdQD1ihteSht5k2u7XiYz99p7G5anLrZYOs=;
 b=lNNSvzdEq2sGz0Qp9l/rTf83y3BtbDxdFyWpyGoUO3pcmUQfF60LVUOvXXBIXdD5T03o4cAvxdO4ZFFN9Bojp9lX1SXoLjGDAjGaU/fg1RweFqwhOdZeDG7yMaffnLzOarKrWQjXeWdxuSK/v9a7OkRxV4jWcCB/HFMfa+AIn8oE/1T18VPhiFsHVc92g/uJChoodxihwTbH5mwKsQZWjRfUcko9ndqJmKl1El8q0gBDQwJImnbXd5S6Skn8Cjv4KeoWof+32F6GXPmd2FDNGkRt8Yk5S4t7GP7VzHLApOTYQ50/eeqlx5UzJ9WCNixpghQMvXADZHC4A0+v0s7P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mba9ln5GDdQD1ihteSht5k2u7XiYz99p7G5anLrZYOs=;
 b=fkgi2IGC1romP9MKVhDpwRtXaOsczFMvbcvwTMQPVXAYHtEoxirT0E4kmcBXHpdJcLhkf4hLyh45GQu6lHMNtj4pLs8kixuk7jPfZ5/hHnEG758HX/NIllkWn3CnGpLoSnrjB+W0MqKidQix25uk3oQNmT3l/mowwnXVMFJ6y/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:17 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:17 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 17/20] arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
Date: Fri, 30 Jan 2026 18:25:14 +0100
Message-ID: <2d84a4b934828eeb6ff043930fdd341a64bd7bd1.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13818:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9f6502-4936-44ec-cdb3-08de6024f4b0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?pRXFBHUuLo5k9SS/jibJHtOptRlib23pHJiooiNMOY3wwT15jsOCf8q30sQh?=
 =?us-ascii?Q?swq2TUImXxw2Gh5LyXckWfZbHk3JSJAmc2GtVflsDDYFKYOC6abLHVt2C7rr?=
 =?us-ascii?Q?w1QM/W1rDrOLdFv4AHKbXyQnOubuuIQdP7gEtGuyxc37a9rT5pGSezNELkpj?=
 =?us-ascii?Q?IRNDxJ9ZgwrHxGKlpCo9ng8ycmD46HCPKFQQHdSKWn75nhTnK/iV6FSsFVzG?=
 =?us-ascii?Q?6LNU/wyzCUnyAIrcpTGyNJyRXtILWw9CCnuWOWTiM5pECY7NZxu0BOhBZTbf?=
 =?us-ascii?Q?D6YHKo5Hcqsr6Ikrzmo1dbG3CFMoYJE+6kBL4qnoAHysk0UzQaUwzWeXuaH8?=
 =?us-ascii?Q?3taSFvcNyfSgOShUtimKfi1VjiXpf4PZ/7WQQpVqU3ZKep5akcYJ9rjPXgSX?=
 =?us-ascii?Q?HsLAzRVX1/MnT5A7FuVMtddPfrJv7JCAACHM1LRrJXVYCrDm5nO4vfPO+0I4?=
 =?us-ascii?Q?9Plk1XPhE8H4F343kPnion9UK+aWMQ7BTL2SoSYxwqLLP+HZ1kesAaZ0LRuf?=
 =?us-ascii?Q?qEQOTjjbtipw3eQN8c2x9uUpkMrGHxrxE6gqjU23LIPeGYYA1Q9EkQrRjeK8?=
 =?us-ascii?Q?0V8auXdwdqJ/7NCCK+dwYLZMcUOCXyx3xdkzEPQy8X+4DQJAqOg6Jm4O0Rcj?=
 =?us-ascii?Q?RBZnOGAQvWrMctkoMTt8H7VaZ2NDv2U+FnaAO4ObMJ54VHcINtzlS1O3+Run?=
 =?us-ascii?Q?PFC33swvvPIXXOp19UXIFA3r/3BL8z3G6A6G1Ocnh9qIASj5OM9yQ7Aipu0S?=
 =?us-ascii?Q?nIaf7Oh7ZZO21kQchUKbIJQBAtFY8Bf+iBAH13UKSmjPzC2tVZP0kKyZUd5g?=
 =?us-ascii?Q?5tVwBA+D7z/xjSMLKW8FkABjKlxFtG4xeKclRsTK8CGK25BUrzBrDo9ItrGe?=
 =?us-ascii?Q?Qe/NJk9sB7llEsjXatzYxUrxyz83a19nubFQnHiddqIK6SKSg1ivyjifpgE4?=
 =?us-ascii?Q?5ngmCaIopxsJIxRX4wTQLXB0iqQekBZLrLh4bQ7YLRaCpDoCRof7o3rbjxN5?=
 =?us-ascii?Q?Mvgf52w03vLmOgIjkPPuKP8HqWrKCw8P/5opUPB79PKk8QQs0Efzu9CsD414?=
 =?us-ascii?Q?8bfLp8fqG0z/mdCe0NohTarOACcfm4TTUK0Vl01ITWSOGyK6CxlZmlxJ9UO3?=
 =?us-ascii?Q?A+pvlee82WWc/p0HoKqO7JFITxElw7SpHNH21ZL7avoFcvmugFO2Dk56zSnS?=
 =?us-ascii?Q?C/G6nIvbqxJfZXhKyxCcAoEGQSwc2r/hLAVCwT5byU81d6rDoGNjZz+iD3+h?=
 =?us-ascii?Q?jKEHN0xB20TeV3rz5H4nahLXFGfbuAbf3fI4qKNMJlA3drvXwGFtF1NQ/3jn?=
 =?us-ascii?Q?ile2NBucO0H2IsYhab4eabYVAS69gJkeujdwlhH+yP0Mn6ZJe5sMv6tlcOpO?=
 =?us-ascii?Q?HTFAAZU3WwwvikphzSjxrUUxBuy0s2Z996NhTzoNJcN5PKAJuJFat1OOfuXH?=
 =?us-ascii?Q?nVQlkJmYjMqvl3SXcUkz7wCoeP4tPA/SoT5oEqOnLKu09Cv0Wm+o2A2IoLEM?=
 =?us-ascii?Q?+qDXaMXvrsKNdb8+UVQ1pd5dG2gr2qhHtjy1V8SLris34q+DKtZFEpUacd0t?=
 =?us-ascii?Q?HWKVxmJaqUSF/kvuYSdWfR9xJt2WjhZIBirwlK2AR5xKpvPDcnODKf8v/0DJ?=
 =?us-ascii?Q?WwMBC6HW1iRO+WGV3q+GcqM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kmUrstQy2trDx+f2ptoQ6HBzxJMVkmBNC7ZhAqK82TGWGTQD/8DUsv1kLx2M?=
 =?us-ascii?Q?I/C09noY5fs7J8QKOU6YaZq2GShuS/Gby+jlqBGuzD0uSuKD/WYM0XSuNCLR?=
 =?us-ascii?Q?XNqPttTWZHk85FT0ZTdx5CWYJL4wvL7JO9MPzjr5IpfYXjTJUCgIwr6rVlqa?=
 =?us-ascii?Q?sMDCYKF9elGZiRYxgKK1dtL5naSONOviLNKfSj1/0CvGral2Y4jgrpP90i8V?=
 =?us-ascii?Q?rn8ViCsaXbF1iJ9g1HnDwok1bjSTrReeoZtvSNwHpNm5xBc5BMNB2YyfTH3Y?=
 =?us-ascii?Q?FiloPpkbvYpG2AjLtFPPjCcbZDmGTybDhGiIG4jfUWSugRNhCkfqSkbQ+YQ3?=
 =?us-ascii?Q?H9QyEUIeNuxDgu/++1A2T5zGVOqxitwZZ8UgjJrF6+1QTjxnf7Cugmzd0Ifx?=
 =?us-ascii?Q?A9MD8CMG1M55XO6t0WWJDf6dhG5KYMNvT7lfAvj1SXGamixUVeEs8sO6a8aO?=
 =?us-ascii?Q?VrvdSPwUpr25D3yLmGmduFgNhJR4dj0l8rvnjJvmsrP6NqBJy4zm6Bt6oHS0?=
 =?us-ascii?Q?G7cuM2T9ZYj3dU9uoUANS0jY7FbfBqQyF6HGPQ5zsUiiU8J+E/B9EpLRA5Tj?=
 =?us-ascii?Q?+j0V0ytAbac+ZTtvmrb3U7v/qynEMn/YGKw4EzTTen0OkU9+N+xdWwbFC/Ip?=
 =?us-ascii?Q?W0bIjJRqqxtHAi2mIXaVHRf+pQvrowOHCwVwgsMpY/KOoZoVdrdZ0PnnmXbc?=
 =?us-ascii?Q?jh7gRV5FIT0icYf+qtCL8ISMT2w6rk7lGl8z6p4TmnwSvPEL365TWitr6D6a?=
 =?us-ascii?Q?OeEqz0QigzMT0SmGDG31KhksHHHDXEADd0BAAdArUvql7wSXa4kfftmDWjBI?=
 =?us-ascii?Q?dyqzgVdeCizq680qTRLCz2O+J39QrFqtadg9QhHt/VgEDsG3gWFoxEO2K/BG?=
 =?us-ascii?Q?i9LQ23QcShAT+iocJ7AGuq/4pq02J1g3yXKZSyLnVcfFUgxk73Sq7vRptr9y?=
 =?us-ascii?Q?pkD9qKADA4U4+Fqy/Y0lUZPMa16puLBxkla/6N74hgC3nVbm8o094CuM9niR?=
 =?us-ascii?Q?BlDr5uRIgNcLeAAPftjn0z6/yRWz3Wqba6FhMziT1finvlUkZKkE7PsICiLh?=
 =?us-ascii?Q?SxBtvNtvDPanTi715S6RakqhRYfbZqa3dyrBDk5ryINigSuEW+Iu5MhIiyUX?=
 =?us-ascii?Q?RUaAUfKPuNNoLbv1NOqQmXc6VcOWg4b3s6E9MIv6MEkYPA/cKlfexDqUKVr5?=
 =?us-ascii?Q?KNWoMBmkza34hFPOY7Jv3j12/MyVEMn0oEQAN9KMn5W3rC75DV7SFrtcq/qf?=
 =?us-ascii?Q?dZfFx0UpE59IVllN/8cq99ZkIoMPwcVqRQUlP/1qhL4I6y87/aKPZyMk19bS?=
 =?us-ascii?Q?8BkDNKAu6BGW2Ucv5oHli/FQhJ5p19JgIi2UE8pSgmhtw5HOHZnRqMjqPd+G?=
 =?us-ascii?Q?zTqXkkKUIG2VDnGnS1cJbQ3qNbCWKq6uk/wvVzLn98Qn0XwEGL30Xezwbnbo?=
 =?us-ascii?Q?S5Z/gbSIPlD7Ps6pXxhQguumtmj7LLTiPg9evxgxGLpQrNPA145vy/a0NP5z?=
 =?us-ascii?Q?VNswt3Z2LCnY3hjzdhwLih3bKRxarSsV0/dwgAdUubbt9KAYvTdyAFbRzCuh?=
 =?us-ascii?Q?Ex8x3Ur7nid323nzfnVxL4/YrfBBsfS7b7dtmGEs/6KD0wfuXvJk0UjkZWBW?=
 =?us-ascii?Q?hJDlgu5mldR0BLi77rD1q70GHD/jWFhuwpsgUdzgVrTVlXwiYW402VoDaYaL?=
 =?us-ascii?Q?jno07wriq8BSR/4XA/TSE3yaXcIXKuQDoQEzix3zgZiy/22TDfwdWTIXvqe/?=
 =?us-ascii?Q?VnDK4gZtY3gSkciJIuqjYE7yp4DGyrsfSW6owC79Jo7cyGSpmUKI?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9f6502-4936-44ec-cdb3-08de6024f4b0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:17.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP8djLxg0AKi8O3fgdX3unyBYVL8j6WEvmDQ81LtCSD0UdQGy3VTIanh3OEC0+t5nAdwiqT9132098OJI4Q3eimQuSn3iTKM5RVNyOo/ryUt2HlwZfovVsmFhVcnCfnB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13818

Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed fcpvd0 and fcpvd1 patches into a single patch.
 - Collected tags.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index cbb48ff5028f..c90a778250d6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1431,6 +1431,30 @@ csi2cru: endpoint@0 {
 				};
 			};
 		};
+
+		fcpvd0: fcp@16470000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+		};
+
+		fcpvd1: fcp@164a0000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x164a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

