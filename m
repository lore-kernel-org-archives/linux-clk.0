Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D5DDDAD
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 03:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753760134; cv=fail; b=t95BiLAG1UdiVrlSpU54mFgWUTILKGGpgU2tHjmHScfflmUuTj7Ar9ss7APwba0H6m8VNHeo9ku3wZE76WP9qAs0iZtXDSS6GqQSxsiXXtoiXn7J5MB+9jRXYxNXolBxQ/3bhPE1m1/8k1PP/BAKFqrzQDNRse6yW0vtuoH7KSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753760134; c=relaxed/simple;
	bh=PCXKkuKDWxalE6pTvYsoWASLn91ulOdKVAqX6vfqfXw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fnvco/OzRGhYnh63phcNvpsgMDDE0hA8Y6MYMflEEE8ls609FAz89vjeCEqT6PhRGxfsHuTEbPI9B8UVm62AR4C2DL8iud46VeZ5rRjGVrfwxIMgclj9QRMxdvvoqGEJDrSgTV0vs9az3VnWUf49UO9Nrp2WuOzF0TezGhNC1rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=E6iJ8DNE; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="E6iJ8DNE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsVEHnCc3TGqKOzSvszGcLcd49QFbUpvB+YmW9ZZ1MtPkqTWcvj/sxdNbfGBhT+6VCCklm73ozU1BqlgA12r5TKML5H3nO3K0XHNKYj00z+S6fwa+Ai8bFkiFvjhs1fqxhIYaJuhNP+S3AojWJ6iE255WA9ohFQNios+DhMlT069eLYANwbxC+4MOK759Hg4sn6Tx/N+ov+yhpvsArx4bieMcau2hmyJHzXuw6JonxfRGDBvu9pAuceMkdoHNeE6ibpb6jkS/mNdtaI2JYLuwXT68MyYAPBwylkSbqtxm6/O0qLvNdRUxYAzW/Vwp99qDK0Y6wdE2lRXefLJnD5f8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ar7HQr/ZGRrILU3kmzj7B27Q6EqGiWk8u2+WdqhO7mY=;
 b=YsoxXdWygYegohTSa54gofeCh8SE3vxwjA05JrWcjrrLV0wZGJVXq48KetBeVA4xZM3sVueLl+mlvNXMy4ty7guHUSD50CcOcKFJtBdpkUVknX2Evjf0/gCH8ajS2X1cglmkjzO+jPxsMiRWcA6DsgQrx4fKnknYtTDTtWRovXzHjzUMfycsPOzYI5UuW8RFpnNpSWwuEMhsdoAKNIVBYTb8N4Gx8gcJzDNhTss6t6v3b9oNbbC8UFmaRxu336fKgbnAHvJ9TyxlIIbKDWGoO7zxIr1Js3b84nKwvK63guCj5g1o4GxynzVzqLzBbVZfiKPn2OMjPDrztFBp7KZ1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar7HQr/ZGRrILU3kmzj7B27Q6EqGiWk8u2+WdqhO7mY=;
 b=E6iJ8DNERC+eArszIepgQ3XPhPzkssvtDR6z8DpKFI/JYR4yv+2/HigoPEPo2Mb2N4YWgJMwdmQuyMl0DTMCwGKEKMSrB41HjfPixnxhrO6Lql3B+HTc2tmi/VKA9XtlL/WiSEjMAzZNp+vZVxlt7MM540flDz98eaEzmBYGbN1KdpxL7H45XX09KmFV5n5+jAU/cuFM5xA7fVSWXnmN7WP1W9L5erNslen0a/Fa9jCMgzK+r0Dobsc5V4rcjwe/CA/vR1Nz5rlTuUo4Jc1sRjNHwGA+YVEeyoAOAQq1KT8jsGxT4aV9446l+0cuQ0GnUcO70az7BKYfWepVA6Vq1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PR3PR04MB7289.eurprd04.prod.outlook.com (2603:10a6:102:8a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 03:35:29 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%5]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 03:35:29 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] clk: imx: Add some delay before deassert the reset
Date: Tue, 29 Jul 2025 11:38:17 +0800
Message-Id: <20250729033817.1239646-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PR3PR04MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 461ff93d-63f3-4c65-e9e0-08ddce50f6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sGu5QSoakmV8dJnKn0zwl8u+vU8OamMIrSMKtutISA70m5/y8UOdraw61/JP?=
 =?us-ascii?Q?0FnZ/vJ/PMgGIMpPELrAroU5cwF4hl3P/do2f2Bn2IP6YZStWv1WmTmuYyZQ?=
 =?us-ascii?Q?BD4UYC1z0p2ownKLa9Gln20sAO6DwDBR52hjQT7U4JzEgNamEBRTz9PS7YKw?=
 =?us-ascii?Q?d3UaXB0eOEJphYwWT4pTAptED+JfmghyvRObPW9NGQYl9FlBV/eSHejUmU0y?=
 =?us-ascii?Q?mJt8dsNoim56cHxmgdQCgFKDcAIKUJLfvnXAvh51rl2bwGfN1DZa/XFCwqn2?=
 =?us-ascii?Q?7HyL+nYQugHdPYUV6wYrHJIzOP24Fke8V+Cdh9WmSnMQ9RDB4LqnF30XkIUp?=
 =?us-ascii?Q?xPipJjlbAHuCavy/NewLhycLygHHGuWnCiszwLqWuoQ9aeLUgFr1HU9GwrKo?=
 =?us-ascii?Q?HIagJRILgRnzGl2B/VY3Y1KFnKe44VogB/GfOTlbtf/i1QSqteM+2Awhdx1k?=
 =?us-ascii?Q?wYgY0fOBlS0nQ0+QmiM6Kn/5Zc9QZDE1aZpIoSKEpcukU+XW/5Kx88ZIbk9E?=
 =?us-ascii?Q?drS9HBKHHKO0rbvYDW7I2ZwlHqtQ0b4GOznNT6S+7yqLinRRjzYqcyAIb0ZH?=
 =?us-ascii?Q?9mAtoo9W0jzRmJP+fqTMnHfy9olHAeBe+mLAzhPzO0ish6yELI30r2OjvxgN?=
 =?us-ascii?Q?yXTF4bg1tCMWvYSUH/aYPdKrTBztZnOqJmviewZ4LFY5f5s6AdyIalKNXwk3?=
 =?us-ascii?Q?gJHXzO81GdVyl1y4SS5XG1joM4bDo2IcKTRLj5FqbwJLMpkARQmZq7ZgyUdP?=
 =?us-ascii?Q?aCyzorODY1N1PmWYM7l6LK9XvitQKBXa37UO4fML/EudHg2UrJMXpsqzlYOz?=
 =?us-ascii?Q?K4ZgRrLXcwk9VjxkaodSL1+UIVvRtP4KGNp3UVI9Un29WlfvHOhmyXE1IZaZ?=
 =?us-ascii?Q?K8pIpVYanpOQMmEge1yEwEVwdY48MtqQo6ixyqJA0K0Zz+olXJw2YBadPSZF?=
 =?us-ascii?Q?D8APZZE37FJBxpRjAOsvRB85OfJ71hOxjFlF0StQhmc6g/hWINXqr3HKu2z0?=
 =?us-ascii?Q?mwk+kncpz9kFY841QZlueAl5yxCICwUPzATe1AANJ+f30iZGYtlLZyaPC5KO?=
 =?us-ascii?Q?aDmjiJl5/VqYXKgf3FIDqI5eG96AK4yK/gQS6Bpw8douBafw6xyW86YkmqmW?=
 =?us-ascii?Q?XR+BdJ2nkJS+De+OuGRehM8ST4rnGzDeaNTJcMLuIZIz0ub/YNdFW7Az5xKE?=
 =?us-ascii?Q?Pg9NaZ13qw/VjUA4ES2etJHPcLQkdvT+1zQbz/h8+7GvNJ9ylA9/NgB5U9+L?=
 =?us-ascii?Q?eWua3LDhxdIjagJYtgc7V6z8NQQtYv6D0AomBgm4aobWrRQdO4iiChA5scDK?=
 =?us-ascii?Q?zVHZa2dc8kmiUFB88mwzfVXHLWFLG77tR13zDfwF6G2Bq3Rbxv5VB+o65ui6?=
 =?us-ascii?Q?2HLU8Gmcnaecjj5RDvTLq0KRM6T5Sd2Tdma+tx20wzg0UsCTqHallT9poNO0?=
 =?us-ascii?Q?/qKG7bPsxnCj+d7x+QPgLnN8UHSxUviF1iBgcGn9HY0aXVOq57dvsg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SOgXS2FU3sIpU+scZGuit/BjYGYdUjhb0AtT0jgCAp/2+BrUHw45I5iJtZMl?=
 =?us-ascii?Q?WhIiyDp5hbQ8UPEQTVqLLVEn+YL7FoS5Nceg2e+pOmwuW9t2OhGpOYj7BBHo?=
 =?us-ascii?Q?qJxxgUKFo3IRP9/THjPO8mMGpo5qYm+SqVssSSSOawZR2II6gi0Il1TWcWiQ?=
 =?us-ascii?Q?u7QOH6R/R6+awp5cKQYczW7/OpnRd+dgHXeWc4W6TQz/PClPG+bI32Z9j1lr?=
 =?us-ascii?Q?KbwFhHoXI2fqqKVGaCo9wqgp5DnDusa3Qcj+vaavwAFRXHuP4BNJMeDuCwKE?=
 =?us-ascii?Q?avcSJRj/Xkc29jiqJh36oWB2lBybLqdsZYPm6LPAEdt4Y9FDDPEjZ9sYyseo?=
 =?us-ascii?Q?MxP8FSZXGANt+mi7oxiKJsSBymbhFlAzZthmnbRcI2t2akas3/2kHwY6Uv6M?=
 =?us-ascii?Q?Fk5Us/7Tj0Ku1CVx1UTUNtsVkpyJzBM3NiflS/we38i2m/WjR0y/msSZlnsu?=
 =?us-ascii?Q?cAfxZ7mjYR8kymcoOokG6M12TlvM+MKavL5kwfwy72nDj/YLIRiqlQ4D0JgF?=
 =?us-ascii?Q?bhvpO6SLZ6tRYS6Dt4cbwu18DiOz5FISin0+fYilePDxbYRQyTX7EoAkngcc?=
 =?us-ascii?Q?vrlSqD+buDD52UaqCamI5ttaeKx6D6odKVrpuqf+Xz/LJBVroMO+8TTM8Jgy?=
 =?us-ascii?Q?9FFlRx+t/EuhAbOq7g9fa+Q0s4l450BF+ko+xFLgrv3cJQi1WR2HObsUgU8O?=
 =?us-ascii?Q?YyEJe9QItcUb+Rqb/Qiwady9M55SWdqsDiSDAIBPToXF6SXE6Kw0gSWtFFng?=
 =?us-ascii?Q?ZtAVNtbN4LcmYut/NvvxP3rOskGywzqDAf4psw5exjAuiSFyrK6/tWv3ZCQn?=
 =?us-ascii?Q?iDpc2j4fAmIXUKfuKZ1VQp+w+Z76YTo6d8RAAQ4RPuo94XE+iIk+blveoayw?=
 =?us-ascii?Q?c1JmzbwVkT0dYsNT12cDjtLNXPXASPsJaZNkSGf3v6T4GLT5yLz3GgIKowL4?=
 =?us-ascii?Q?9+JoxC6FMztyadzxyKUskazE7nHzJ3jb6qhrcqUPTI4UVmlj5czDgLkgqgLr?=
 =?us-ascii?Q?oM02m1wdq/bL2kPZjWlD3aNy2zz6ObV6eSRfSO3jXvY4QNNnBPGvKW6VRCSo?=
 =?us-ascii?Q?kxs5IoXbb8gt0dyeyUemT8PiEK75bUZGqx6qmFuPq41sCNkunqZiT6NfONh/?=
 =?us-ascii?Q?hI/J+2yZ16fiPFSWZAy8kfY6EqbdewbY+Kf2XpezVbT20oDqrVHU9DO2ZF0U?=
 =?us-ascii?Q?yHRzO8TR9nvkNj2HglzCl2bnmKyfcCwiwy5a3dD4MTBnhxMG6z+nnM3cgD95?=
 =?us-ascii?Q?nNGY5wkWM3Jsg5pyALsGK3J7liW4l1yD+f3/QQIpjbSw2jjOUKm2dEy8iwzH?=
 =?us-ascii?Q?e+TFxIGiUZdYQ5Q2Fjc0rf6dy/1chZhKV5lNlw3+8EF0gREj84E0rok7aUPG?=
 =?us-ascii?Q?glrrt0W2GY6tbiJhyYuxyliJDrc9S4SMuM3Ov3AaIrFON/qBA6k+JngCrNKZ?=
 =?us-ascii?Q?gfTTvTY+Q5QJ1AQtgTrSe/pejNG730Hx1ytrKM7/riqyQJYD4R7ZkBawgQeQ?=
 =?us-ascii?Q?So4WxCRrkCnssX4NW79/lKCOZeT0F9Pte+W55x3n+Cm2eYtN1yYnWfXIz6A0?=
 =?us-ascii?Q?9hjY6XPZTc/yZoSz9vhgmhUg1FrIQo3nGCNVy71y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461ff93d-63f3-4c65-e9e0-08ddce50f6f6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 03:35:29.5766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JSRYF4NslTAh0q6xczewp26QXucNipSYYLR+HpdWa+aDLLXH2lN/+0cdRc9mTniO04piGjryHSYgrZ+oP2ZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7289

Some of the PCCs on i.MX8ULP have a sw_rst bit to control
the peripheral reset through SW method. For peripherals like GPU
that need sync reset, some delay is necessary befere & after release
the reset to make sure the HW is reset into a known status. So add
some delay before & after release reset.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-composite-7ulp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index 8ed2e0ad2769..710fe4f84465 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -36,6 +37,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
+	/* wait before release reset */
+	udelay(1);
+
 	spin_lock_irqsave(gate->lock, flags);
 	/*
 	 * release the sw reset for peripherals associated with
@@ -47,6 +51,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
 
 	spin_unlock_irqrestore(gate->lock, flags);
 
+	/* wait sync reset done */
+	udelay(1);
+
 	return 0;
 }
 
-- 
2.34.1

