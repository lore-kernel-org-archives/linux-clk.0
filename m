Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD39C00A5A
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 09:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjASJAI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 04:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjASJAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 04:00:07 -0500
Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3DE6796A
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 01:00:05 -0800 (PST)
Received: from toolbox.toradex.int ([31.10.206.125]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1N33hJ-1oZIlF0O2H-013PPj;
 Thu, 19 Jan 2023 09:54:36 +0100
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v1 2/2] dt-bindings: imx8ulp: clock: no spaces before tabs
Date:   Thu, 19 Jan 2023 09:54:21 +0100
Message-Id: <20230119085421.102804-3-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230119085421.102804-1-marcel@ziswiler.com>
References: <20230119085421.102804-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3lsqMvUjg840JDNVAxsVGyJ9oYSECeJt/YcR4tz5LlvH0MyIZ5M
 8Npt2lmIuRVcgtf1FuK5eoaiXKMvRPsy03Q6VVJH3lsSLnN2gYdZEAWQsDbTE/2rTJmN8Ny
 mDYkTeBq2CZQToy+ImK2B61bskOsXQpfclANoSvv8huslrBWc4l+TwjcPLtnViecnxUt0z0
 YO+I3Wm/IbA8cJEvn3NNA==
UI-OutboundReport: notjunk:1;M01:P0:dFUiy6TnYGY=;f35icOD0Cj6LpLsQF+z4FEdzXzx
 WLJ6qHmpIlWQGH8Pagpd2RyT725Wuyv/vM7FWAXJCQuWSi1ZP4XOfXho9Xuet5V8nIxevGusj
 dq6vwQNaoYTzx/woK2p34AEbCRd7nM/vU2WuxTflTt0rju0Hi0nkWtGHjY1/ceVKpXYib21Mv
 78HAVLEXrvY18nqHOsAwuSS30FJMT2KolZuIDzR5B2xcJo3juRl3IHgcFc5YzFL57wy87DKox
 T7wZQ+mpMc9HapUYA/YcHMhYN6psJn4Nr0z94pLEHxx8jPYX6tcfyu+xiFFsmg6OnZmxUSacb
 VjUorHEQQaRe7RZmv7ZvcGNuVqi71O+aJVOVJQSrvlP5X36fC7BoyJHIW2onEVRoJFwpfcvcQ
 qr8BS/dAzmCfs1VWdALqeYy5biiR5pPP4GQUGtegsJIkP+beGMace/2vmERrhB8aIbsGqesiR
 kh1cJhEa/yxJuA1b41UdcvJali7n2IVU8IjPFPf3QtShjDtvXaSvwon5CRCUDhFkqaRLtihDB
 HlKYgWOBggWz+sdqcW1Ctz6A4iHnehu3M7pmw5s59wbyuSphIY9iD8RKH2T+VqJuzKPnXbm/u
 mXj8mKoXBGeehm/A6neoBzhuO9mR2B1mhrlAATD7SOy2HNIC5fWVKNm1um1rDetKRVl8WKMey
 xKv0nOpy2xDCTzjS5YF0hjxJDkAwu1/GJUheT1HTVw==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes the following warnings:

include/dt-bindings/clock/imx8ulp-clock.h:204: warning: please, no space
 before tabs
include/dt-bindings/clock/imx8ulp-clock.h:215: warning: please, no space
 before tabs

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 include/dt-bindings/clock/imx8ulp-clock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
index 953ecfe8ebcc..827404fadf5c 100644
--- a/include/dt-bindings/clock/imx8ulp-clock.h
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -201,7 +201,7 @@
 #define IMX8ULP_CLK_SAI7		2
 #define IMX8ULP_CLK_SPDIF		3
 #define IMX8ULP_CLK_ISI			4
-#define IMX8ULP_CLK_CSI_REGS 		5
+#define IMX8ULP_CLK_CSI_REGS		5
 #define IMX8ULP_CLK_PCTLD		6
 #define IMX8ULP_CLK_CSI			7
 #define IMX8ULP_CLK_DSI			8
@@ -212,7 +212,7 @@
 #define IMX8ULP_CLK_GPU2D		13
 #define IMX8ULP_CLK_GPU3D		14
 #define IMX8ULP_CLK_DC_NANO		15
-#define IMX8ULP_CLK_CSI_CLK_UI 		16
+#define IMX8ULP_CLK_CSI_CLK_UI		16
 #define IMX8ULP_CLK_CSI_CLK_ESC		17
 #define IMX8ULP_CLK_RGPIOD		18
 #define IMX8ULP_CLK_DMA2_MP		19
-- 
2.36.1

