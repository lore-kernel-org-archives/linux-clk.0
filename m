Return-Path: <SRS0=w6Q+=WO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACAAC3A589
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C0B7206DF
	for <linux-clk@archiver.kernel.org>; Sun, 18 Aug 2019 16:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="VdXh5FGD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHRQYZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Aug 2019 12:24:25 -0400
Received: from mout.gmx.net ([212.227.15.18]:50827 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbfHRQYZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Aug 2019 12:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566145452;
        bh=2EQQbD1OW5Bat6jRODQb5wvrchX/224QkLBdZwcOXzg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=VdXh5FGDMapgTSr12/QmTtV/UlGS8CuQjDa2sK0Niv+b1O4Yfc5dgOq58N6RXfXec
         c8YR4ZM843RkL+KEA0XGrg/1HOF37XlTkia74NzpI8M+rd+reYxD5H5uxJSL1PhsNk
         YvyAawFNzF4ZHjcKwLjjCQPnKt0/oVenlgMCVh0c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MGSgq-1i3jYa2Jay-00DEvS; Sun, 18 Aug 2019 18:24:12 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/4] clk: bcm2835: Introduce SoC specific clock registration
Date:   Sun, 18 Aug 2019 18:23:42 +0200
Message-Id: <1566145424-3186-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
References: <1566145424-3186-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:3+OL5bhxKNbr6IFtcjyo9FSr2ymBIiDKeonKZfyvq8Cau5Cj9lp
 mAepi+FeNDU80vobYer0HxKU98DzzIfjiuyHM3oJHK99FpxqXN07wS7pyo9KFZ8QQyxGg7w
 c/MLdAHVAuIgXn9OwfKvfS5pI7QvyhkZEuWGfiX2lMgrAotYnaJfH7gVBYcT0mizKAsFx/P
 qiviF+vIDtrdmtROE+FqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wnYFS8Kxe9k=:L8xS8SfUMwrvKcHDsW9HX8
 LiNv2UPjodY8Z8rChhHVToQnqAO+cwnbLe88sDa3o+SGePTNZ2kiVetLnc3EeLKufYX0M+ow5
 B8kcUM21u+uBy8SKuSyu2+thZds+vmFTYQZBrNAZpGn6rG7fxso3My+ihf8AZ9PSBVSGsIuMp
 7nIlrt4JCmmkATprBwU8IiWW6CaP/egqCxbIFbtduiy3Obl1gzCBD8VRHyD2QCmB1sSIm6pMY
 dsV4rgJ+FknzgR4aIW8TV1g3hC8YsxBeEWwR650W38yFN7Wcfnal6A1JJnMf1va84nd5NLHkJ
 XxoUHIOOEG9nCXePJN3tw8i8fmAW/7B42EG86G61w6miF6WLSif+vgqWBUY9pyk/cmkY40X4L
 WlVmIqMG97n0tRDDz/Ph8lp4x6zRFo17fvtMNxGhb57Ei5XJzpRfViy+aLXSpJBADgKRUfe4Q
 ibLeEfYKGcxPFibrsO6u48jCvUCuoWCkB70I6v1ZhQR7Tcv7uD+7IcxGj7PJcI1RUy2acJGQR
 Qv3r0HjeXgFc5kmRyhfClo20jtBub+/qo/mKYWb97j7CmS7gfWSgT9e6ROJtck79OzT06/hXp
 qxz6oLVjD6Et291ePU/YKDQrsc5WCxEmqUxw4YHRYEPoF15UXQoONAvNoeEgDDauRT2I6YeBA
 ZNlMO1xooObMDpXaC8d6Hn21iiIQ+MTiq2qTZK8iFd/rv5LVzJjOcFPFCcZ081zwRt6NNYklI
 EASX2MH8/YBsl5nuZjIw3ofX+C77FNvFE6imop0hKwgWGTYkHzvPE+Rbepie141VuL6WhhA4Z
 639/XiFa3Nud93xTdbQFv/3gWkRPP+SD83Ge900tVz0BSN6jRAkUy66AJOUVi0SlE+MYjG2ZM
 LFqTnvBYsZ0eIcuNb5Syv9X4fl4HGOvDBgfgwVVGChsud1KAQkoCJW233Ks41tje5dLqLc3bM
 qOVNubYrHHRGrpNvlwHEu6hVppZAdbSExQc+OBx+KSwbusBZ8u4pc8Nph2SobEUNl3YDg9tf8
 YK70ZQzq77akPGegm4Ecb0I/u5rCgIUXWyqmEHryCIHo13QaBtWjDug+PYtvotYhyW6xfuF7p
 hma6mkWfYFoWUZ7U951MKyR7LCNkI8D6wdpEJBr8ySFq0Bkx0T41yvKp4nWwPWXh22idwEciZ
 RkLjkh3VYoASapliZI1dwr2a6B1yyr1ApPljMXsIPTTCdkzg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to support SoC specific clocks (e.g. emmc2 for BCM2711), we
extend the description with a SoC support flag. This approach avoids long
and mostly redundant lists of clock IDs. Since PLLH is specific to
BCM2835, we register only rest of the clocks as common to all SoC.

Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Acked-by: Eric Anholt <eric@anholt.net>
Reviewed-by: Eric Anholt <eric@anholt.net>
=2D--
 drivers/clk/bcm/clk-bcm2835.c | 113 +++++++++++++++++++++++++++++++++++--=
-----
 1 file changed, 96 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 867ae3c..21cd952 100644
=2D-- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -31,7 +31,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <dt-bindings/clock/bcm2835.h>
@@ -289,6 +289,9 @@
 #define LOCK_TIMEOUT_NS		100000000
 #define BCM2835_MAX_FB_RATE	1750000000u

+#define SOC_BCM2835		BIT(0)
+#define SOC_ALL			(SOC_BCM2835)
+
 /*
  * Names of clocks used within the driver that need to be replaced
  * with an external parent's name.  This array is in the order that
@@ -320,6 +323,10 @@ struct bcm2835_cprman {
 	struct clk_hw_onecell_data onecell;
 };

+struct cprman_plat_data {
+	unsigned int soc;
+};
+
 static inline void cprman_write(struct bcm2835_cprman *cprman, u32 reg, u=
32 val)
 {
 	writel(CM_PASSWORD | val, cprman->regs + reg);
@@ -1451,22 +1458,28 @@ typedef struct clk_hw *(*bcm2835_clk_register)(str=
uct bcm2835_cprman *cprman,
 					       const void *data);
 struct bcm2835_clk_desc {
 	bcm2835_clk_register clk_register;
+	unsigned int supported;
 	const void *data;
 };

 /* assignment helper macros for different clock types */
-#define _REGISTER(f, ...) { .clk_register =3D (bcm2835_clk_register)f, \
-			    .data =3D __VA_ARGS__ }
-#define REGISTER_PLL(...)	_REGISTER(&bcm2835_register_pll,	\
+#define _REGISTER(f, s, ...) { .clk_register =3D (bcm2835_clk_register)f,=
 \
+			       .supported =3D s,				\
+			       .data =3D __VA_ARGS__ }
+#define REGISTER_PLL(s, ...)	_REGISTER(&bcm2835_register_pll,	\
+					  s,				\
 					  &(struct bcm2835_pll_data)	\
 					  {__VA_ARGS__})
-#define REGISTER_PLL_DIV(...)	_REGISTER(&bcm2835_register_pll_divider, \
-					  &(struct bcm2835_pll_divider_data) \
-					  {__VA_ARGS__})
-#define REGISTER_CLK(...)	_REGISTER(&bcm2835_register_clock,	\
+#define REGISTER_PLL_DIV(s, ...) _REGISTER(&bcm2835_register_pll_divider,=
 \
+					   s,				  \
+					   &(struct bcm2835_pll_divider_data) \
+					   {__VA_ARGS__})
+#define REGISTER_CLK(s, ...)	_REGISTER(&bcm2835_register_clock,	\
+					  s,				\
 					  &(struct bcm2835_clock_data)	\
 					  {__VA_ARGS__})
-#define REGISTER_GATE(...)	_REGISTER(&bcm2835_register_gate,	\
+#define REGISTER_GATE(s, ...)	_REGISTER(&bcm2835_register_gate,	\
+					  s,				\
 					  &(struct bcm2835_gate_data)	\
 					  {__VA_ARGS__})

@@ -1480,7 +1493,8 @@ static const char *const bcm2835_clock_osc_parents[]=
 =3D {
 	"testdebug1"
 };

-#define REGISTER_OSC_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_OSC_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_osc_parents),	\
 	.parents =3D bcm2835_clock_osc_parents,				\
 	__VA_ARGS__)
@@ -1497,7 +1511,8 @@ static const char *const bcm2835_clock_per_parents[]=
 =3D {
 	"pllh_aux",
 };

-#define REGISTER_PER_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_PER_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_per_parents),	\
 	.parents =3D bcm2835_clock_per_parents,				\
 	__VA_ARGS__)
@@ -1522,7 +1537,8 @@ static const char *const bcm2835_pcm_per_parents[] =
=3D {
 	"-",
 };

-#define REGISTER_PCM_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_PCM_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_pcm_per_parents),		\
 	.parents =3D bcm2835_pcm_per_parents,				\
 	__VA_ARGS__)
@@ -1541,7 +1557,8 @@ static const char *const bcm2835_clock_vpu_parents[]=
 =3D {
 	"pllc_core2",
 };

-#define REGISTER_VPU_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_VPU_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_vpu_parents),	\
 	.parents =3D bcm2835_clock_vpu_parents,				\
 	__VA_ARGS__)
@@ -1577,12 +1594,14 @@ static const char *const bcm2835_clock_dsi1_parent=
s[] =3D {
 	"dsi1_byte_inv",
 };

-#define REGISTER_DSI0_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_DSI0_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_dsi0_parents),	\
 	.parents =3D bcm2835_clock_dsi0_parents,				\
 	__VA_ARGS__)

-#define REGISTER_DSI1_CLK(...)	REGISTER_CLK(				\
+#define REGISTER_DSI1_CLK(s, ...)	REGISTER_CLK(			\
+	s,								\
 	.num_mux_parents =3D ARRAY_SIZE(bcm2835_clock_dsi1_parents),	\
 	.parents =3D bcm2835_clock_dsi1_parents,				\
 	__VA_ARGS__)
@@ -1602,6 +1621,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLA]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "plla",
 		.cm_ctrl_reg =3D CM_PLLA,
 		.a2w_ctrl_reg =3D A2W_PLLA_CTRL,
@@ -1616,6 +1636,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 2400000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLA_CORE]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_core",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1625,6 +1646,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_per",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1634,6 +1656,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_DSI0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_dsi0",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1642,6 +1665,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.hold_mask =3D CM_PLLA_HOLDDSI0,
 		.fixed_divider =3D 1),
 	[BCM2835_PLLA_CCP2]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plla_ccp2",
 		.source_pll =3D "plla",
 		.cm_reg =3D CM_PLLA,
@@ -1663,6 +1687,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLC]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "pllc",
 		.cm_ctrl_reg =3D CM_PLLC,
 		.a2w_ctrl_reg =3D A2W_PLLC_CTRL,
@@ -1677,6 +1702,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 3000000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLC_CORE0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core0",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1686,6 +1712,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_CORE1]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core1",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1695,6 +1722,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_CORE2]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_core2",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1704,6 +1732,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLC_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "pllc_per",
 		.source_pll =3D "pllc",
 		.cm_reg =3D CM_PLLC,
@@ -1720,6 +1749,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * AUDIO domain is on.
 	 */
 	[BCM2835_PLLD]		=3D REGISTER_PLL(
+		SOC_ALL,
 		.name =3D "plld",
 		.cm_ctrl_reg =3D CM_PLLD,
 		.a2w_ctrl_reg =3D A2W_PLLD_CTRL,
@@ -1734,6 +1764,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 2400000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLD_CORE]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_core",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1743,6 +1774,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_PER]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_per",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1752,6 +1784,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLD_DSI0]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_dsi0",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1760,6 +1793,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.hold_mask =3D CM_PLLD_HOLDDSI0,
 		.fixed_divider =3D 1),
 	[BCM2835_PLLD_DSI1]	=3D REGISTER_PLL_DIV(
+		SOC_ALL,
 		.name =3D "plld_dsi1",
 		.source_pll =3D "plld",
 		.cm_reg =3D CM_PLLD,
@@ -1775,6 +1809,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * It is in the HDMI power domain.
 	 */
 	[BCM2835_PLLH]		=3D REGISTER_PLL(
+		SOC_BCM2835,
 		"pllh",
 		.cm_ctrl_reg =3D CM_PLLH,
 		.a2w_ctrl_reg =3D A2W_PLLH_CTRL,
@@ -1789,6 +1824,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.max_rate =3D 3000000000u,
 		.max_fb_rate =3D BCM2835_MAX_FB_RATE),
 	[BCM2835_PLLH_RCAL]	=3D REGISTER_PLL_DIV(
+		SOC_BCM2835,
 		.name =3D "pllh_rcal",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1798,6 +1834,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 10,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_AUX]	=3D REGISTER_PLL_DIV(
+		SOC_BCM2835,
 		.name =3D "pllh_aux",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1807,6 +1844,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.fixed_divider =3D 1,
 		.flags =3D CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_PIX]	=3D REGISTER_PLL_DIV(
+		SOC_BCM2835,
 		.name =3D "pllh_pix",
 		.source_pll =3D "pllh",
 		.cm_reg =3D CM_PLLH,
@@ -1822,6 +1860,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* One Time Programmable Memory clock.  Maximum 10Mhz. */
 	[BCM2835_CLOCK_OTP]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "otp",
 		.ctl_reg =3D CM_OTPCTL,
 		.div_reg =3D CM_OTPDIV,
@@ -1833,6 +1872,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * bythe watchdog timer and the camera pulse generator.
 	 */
 	[BCM2835_CLOCK_TIMER]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "timer",
 		.ctl_reg =3D CM_TIMERCTL,
 		.div_reg =3D CM_TIMERDIV,
@@ -1843,12 +1883,14 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
 	 * Generally run at 2Mhz, max 5Mhz.
 	 */
 	[BCM2835_CLOCK_TSENS]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "tsens",
 		.ctl_reg =3D CM_TSENSCTL,
 		.div_reg =3D CM_TSENSDIV,
 		.int_bits =3D 5,
 		.frac_bits =3D 0),
 	[BCM2835_CLOCK_TEC]	=3D REGISTER_OSC_CLK(
+		SOC_ALL,
 		.name =3D "tec",
 		.ctl_reg =3D CM_TECCTL,
 		.div_reg =3D CM_TECDIV,
@@ -1857,6 +1899,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* clocks with vpu parent mux */
 	[BCM2835_CLOCK_H264]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "h264",
 		.ctl_reg =3D CM_H264CTL,
 		.div_reg =3D CM_H264DIV,
@@ -1864,6 +1907,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 1),
 	[BCM2835_CLOCK_ISP]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "isp",
 		.ctl_reg =3D CM_ISPCTL,
 		.div_reg =3D CM_ISPDIV,
@@ -1876,6 +1920,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * in the SDRAM controller can't be used.
 	 */
 	[BCM2835_CLOCK_SDRAM]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "sdram",
 		.ctl_reg =3D CM_SDCCTL,
 		.div_reg =3D CM_SDCDIV,
@@ -1883,6 +1928,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 3),
 	[BCM2835_CLOCK_V3D]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "v3d",
 		.ctl_reg =3D CM_V3DCTL,
 		.div_reg =3D CM_V3DDIV,
@@ -1896,6 +1942,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * in various hardware documentation.
 	 */
 	[BCM2835_CLOCK_VPU]	=3D REGISTER_VPU_CLK(
+		SOC_ALL,
 		.name =3D "vpu",
 		.ctl_reg =3D CM_VPUCTL,
 		.div_reg =3D CM_VPUDIV,
@@ -1907,6 +1954,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* clocks with per parent mux */
 	[BCM2835_CLOCK_AVEO]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "aveo",
 		.ctl_reg =3D CM_AVEOCTL,
 		.div_reg =3D CM_AVEODIV,
@@ -1914,6 +1962,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 38),
 	[BCM2835_CLOCK_CAM0]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "cam0",
 		.ctl_reg =3D CM_CAM0CTL,
 		.div_reg =3D CM_CAM0DIV,
@@ -1921,6 +1970,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 14),
 	[BCM2835_CLOCK_CAM1]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "cam1",
 		.ctl_reg =3D CM_CAM1CTL,
 		.div_reg =3D CM_CAM1DIV,
@@ -1928,12 +1978,14 @@ static const struct bcm2835_clk_desc clk_desc_arra=
y[] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 15),
 	[BCM2835_CLOCK_DFT]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dft",
 		.ctl_reg =3D CM_DFTCTL,
 		.div_reg =3D CM_DFTDIV,
 		.int_bits =3D 5,
 		.frac_bits =3D 0),
 	[BCM2835_CLOCK_DPI]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dpi",
 		.ctl_reg =3D CM_DPICTL,
 		.div_reg =3D CM_DPIDIV,
@@ -1943,6 +1995,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* Arasan EMMC clock */
 	[BCM2835_CLOCK_EMMC]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "emmc",
 		.ctl_reg =3D CM_EMMCCTL,
 		.div_reg =3D CM_EMMCDIV,
@@ -1952,6 +2005,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* General purpose (GPIO) clocks */
 	[BCM2835_CLOCK_GP0]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp0",
 		.ctl_reg =3D CM_GP0CTL,
 		.div_reg =3D CM_GP0DIV,
@@ -1960,6 +2014,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 20),
 	[BCM2835_CLOCK_GP1]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp1",
 		.ctl_reg =3D CM_GP1CTL,
 		.div_reg =3D CM_GP1DIV,
@@ -1969,6 +2024,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 21),
 	[BCM2835_CLOCK_GP2]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "gp2",
 		.ctl_reg =3D CM_GP2CTL,
 		.div_reg =3D CM_GP2DIV,
@@ -1978,6 +2034,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* HDMI state machine */
 	[BCM2835_CLOCK_HSM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "hsm",
 		.ctl_reg =3D CM_HSMCTL,
 		.div_reg =3D CM_HSMDIV,
@@ -1985,6 +2042,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 22),
 	[BCM2835_CLOCK_PCM]	=3D REGISTER_PCM_CLK(
+		SOC_ALL,
 		.name =3D "pcm",
 		.ctl_reg =3D CM_PCMCTL,
 		.div_reg =3D CM_PCMDIV,
@@ -1994,6 +2052,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.low_jitter =3D true,
 		.tcnt_mux =3D 23),
 	[BCM2835_CLOCK_PWM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "pwm",
 		.ctl_reg =3D CM_PWMCTL,
 		.div_reg =3D CM_PWMDIV,
@@ -2002,6 +2061,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 24),
 	[BCM2835_CLOCK_SLIM]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "slim",
 		.ctl_reg =3D CM_SLIMCTL,
 		.div_reg =3D CM_SLIMDIV,
@@ -2010,6 +2070,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.is_mash_clock =3D true,
 		.tcnt_mux =3D 25),
 	[BCM2835_CLOCK_SMI]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "smi",
 		.ctl_reg =3D CM_SMICTL,
 		.div_reg =3D CM_SMIDIV,
@@ -2017,6 +2078,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 27),
 	[BCM2835_CLOCK_UART]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "uart",
 		.ctl_reg =3D CM_UARTCTL,
 		.div_reg =3D CM_UARTDIV,
@@ -2026,6 +2088,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* TV encoder clock.  Only operating frequency is 108Mhz.  */
 	[BCM2835_CLOCK_VEC]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "vec",
 		.ctl_reg =3D CM_VECCTL,
 		.div_reg =3D CM_VECDIV,
@@ -2040,6 +2103,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {

 	/* dsi clocks */
 	[BCM2835_CLOCK_DSI0E]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dsi0e",
 		.ctl_reg =3D CM_DSI0ECTL,
 		.div_reg =3D CM_DSI0EDIV,
@@ -2047,6 +2111,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 18),
 	[BCM2835_CLOCK_DSI1E]	=3D REGISTER_PER_CLK(
+		SOC_ALL,
 		.name =3D "dsi1e",
 		.ctl_reg =3D CM_DSI1ECTL,
 		.div_reg =3D CM_DSI1EDIV,
@@ -2054,6 +2119,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 8,
 		.tcnt_mux =3D 19),
 	[BCM2835_CLOCK_DSI0P]	=3D REGISTER_DSI0_CLK(
+		SOC_ALL,
 		.name =3D "dsi0p",
 		.ctl_reg =3D CM_DSI0PCTL,
 		.div_reg =3D CM_DSI0PDIV,
@@ -2061,6 +2127,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 		.frac_bits =3D 0,
 		.tcnt_mux =3D 12),
 	[BCM2835_CLOCK_DSI1P]	=3D REGISTER_DSI1_CLK(
+		SOC_ALL,
 		.name =3D "dsi1p",
 		.ctl_reg =3D CM_DSI1PCTL,
 		.div_reg =3D CM_DSI1PDIV,
@@ -2077,6 +2144,7 @@ static const struct bcm2835_clk_desc clk_desc_array[=
] =3D {
 	 * non-stop vpu clock.
 	 */
 	[BCM2835_CLOCK_PERI_IMAGE] =3D REGISTER_GATE(
+		SOC_ALL,
 		.name =3D "peri_image",
 		.parent =3D "vpu",
 		.ctl_reg =3D CM_PERIICTL),
@@ -2109,9 +2177,14 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)
 	struct resource *res;
 	const struct bcm2835_clk_desc *desc;
 	const size_t asize =3D ARRAY_SIZE(clk_desc_array);
+	const struct cprman_plat_data *pdata;
 	size_t i;
 	int ret;

+	pdata =3D of_device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return -ENODEV;
+
 	cprman =3D devm_kzalloc(dev,
 			      struct_size(cprman, onecell.hws, asize),
 			      GFP_KERNEL);
@@ -2147,8 +2220,10 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)

 	for (i =3D 0; i < asize; i++) {
 		desc =3D &clk_desc_array[i];
-		if (desc->clk_register && desc->data)
+		if (desc->clk_register && desc->data &&
+		    (desc->supported & pdata->soc)) {
 			hws[i] =3D desc->clk_register(cprman, desc->data);
+		}
 	}

 	ret =3D bcm2835_mark_sdc_parent_critical(hws[BCM2835_CLOCK_SDRAM]->clk);
@@ -2159,8 +2234,12 @@ static int bcm2835_clk_probe(struct platform_device=
 *pdev)
 				      &cprman->onecell);
 }

+static const struct cprman_plat_data cprman_bcm2835_plat_data =3D {
+	.soc =3D SOC_BCM2835,
+};
+
 static const struct of_device_id bcm2835_clk_of_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-cprman", },
+	{ .compatible =3D "brcm,bcm2835-cprman", .data =3D &cprman_bcm2835_plat_=
data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, bcm2835_clk_of_match);
=2D-
2.7.4

