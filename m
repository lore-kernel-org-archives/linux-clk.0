Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB84C004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 09:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjASJAF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 04:00:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjASJAD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 04:00:03 -0500
X-Greylist: delayed 313 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Jan 2023 01:00:02 PST
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA7B67975
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 01:00:02 -0800 (PST)
Received: from toolbox.toradex.int ([31.10.206.125]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MHnyM-1pXKPO2Kb0-00Eqzc;
 Thu, 19 Jan 2023 09:54:33 +0100
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
Subject: [RESEND PATCH v1 1/2] clk: imx6sll: add proper spdx license identifier
Date:   Thu, 19 Jan 2023 09:54:20 +0100
Message-Id: <20230119085421.102804-2-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230119085421.102804-1-marcel@ziswiler.com>
References: <20230119085421.102804-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GL2rVT1JpqMd06MBhb1IBAtTIz0M492IhxLsitDd6WeuTyBlAKe
 t/SnNg0eLxYXzBrOdrC5iH2Pa+Cbnf00EVKe5G9N21OsAXQZRwY6DPR8DSiJry1Oh47o8HM
 +XJNHHHF/aNHU5Y3DqZJx+CZHMRLwsQ6/Mwfky5ODwMtzs3t03+NJ+JrZn7krRY1+1bVbcA
 CfnjzHWB3E5trFWT0K2fg==
UI-OutboundReport: notjunk:1;M01:P0:SNMhYVDnNOs=;R0dkgFMnbPT3sxFZ3yfu1TyMqfM
 xPmFVf0g+PcXpA/wVjcOVXZjbW3tDNAz8Pz8wBARAJtkKMSOUOUl77wM8Vt9VHP48kzq7/pay
 ZVmFrCzivlxA7S978LXVaYFd4ts0r8PqFcKmg7tgoJbXQdnaiK2EfNYRMnDPhK7Oyctd6udQL
 2h2A5jG6/7Jew7zyB9D7/3LGOqBd4WlCOdHVMn+3O0Yoo1XaDcJnbt3Cul24C0mtPdECJ2L7e
 GV4rI+c2Wrp/9y7w9YDeZxdemhIxGrwGpRNnZmJ6nfPWRIu1D4q9NRxqINOrfmlkrzj9r68KP
 v3nwjxTF0iJXf1O3a4J0WF6GB06JRYcM7yvaHPTugfQ+k+HnuChjZGjlicVTWx5l9AC4CYQbQ
 l8lTUKeLp3MB+20uH/Bk61bjLqYrlnQEmNNR5O8nF0p5WFgFxIGsZqyBjx/TxZ2JSKj12KSQH
 n/g4izKJui7WGOMKm+BTmONACfFX89lA6PhjZPKH36ZLuy7xwrrIVIfpy805jCtdYNl2Dkna+
 KnHqVf+oIM3tcu2/1H0491UwxSrXe6dr/IOTwgCO7gy8nMgMih/Jb9LZWJvVgkGR/ligo5MsT
 SYibpczQVS0+iYtU5WJlYubeX3WRtBEzPV9AqEK/VROo3IM+4rv1JZJ5PhdRNPbfGpRsHCyNC
 /XsumcsRdAsvgJ/wRBkOY5nzowsGJTk9oDhSZUt02w==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This fixes the following error:

include/dt-bindings/clock/imx6sll-clock.h:1: warning: Improper SPDX
 comment style for 'include/dt-bindings/clock/imx6sll-clock.h', please
 use '/*' instead
include/dt-bindings/clock/imx6sll-clock.h:1: warning: Missing or
 malformed SPDX-License-Identifier tag in line 1

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
---

 include/dt-bindings/clock/imx6sll-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx6sll-clock.h b/include/dt-bindings/clock/imx6sll-clock.h
index f446710fe63d..494fd0c37fb5 100644
--- a/include/dt-bindings/clock/imx6sll-clock.h
+++ b/include/dt-bindings/clock/imx6sll-clock.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2016 Freescale Semiconductor, Inc.
  * Copyright 2017-2018 NXP.
-- 
2.36.1

