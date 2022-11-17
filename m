Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EF6C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 11:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239401AbiKQLhG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 06:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239654AbiKQLg4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 06:36:56 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384756828E
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 03:36:55 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id i10so4334203ejg.6
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 03:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SFs+QuCEjvSeA5k7rG5hAilinvi7WiyttbklMW+zRY=;
        b=HAScRzzTzMiwVuHheDpDzRDi1KBTMXnthhKUw5f+srNRN3JRZeL2EZZBx4TXbkJS/C
         8EBoHuVzhnZTEcDdoLO9cnSv0GYIch6WGLucnPEQFQerTGfTxBJ3m4IIod/EZ6cWLBtH
         XYC4RSnUx0SkkHvuzOjJfQ0xyS7WEQ3dQ0ED4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SFs+QuCEjvSeA5k7rG5hAilinvi7WiyttbklMW+zRY=;
        b=QiEwGqT1iQYpQkCCJE/R9aH7hdQXWMg+Ayifl0qK+HfEJKCmmCwSmSkdmvRJB5NHUR
         aUwBZBbPbY6jfKDGs0u0UoJ2xpaW+i4sqU0ycnwSng1w/wtAp243rVvhS5yxdRfMqXFX
         Rp7xcI53JPZMIIl818L3fcfwBKDfASGFMTnrcMvFX0trjgXY641l3xcy3mfrMY4DB/XW
         ioJeIKV/EN8n/B3ky5KuQjGEOrYI5RB4TVr8Ee8zCoOHCuwXMfvjqtOMWnyMiWfeiQu2
         wsYVFR+umLrUFP0PkTLqTdsz3LRnxekQVnA0SwfnEYO+wvSvKRISPeUexoLrRPTYsEfG
         u7Mg==
X-Gm-Message-State: ANoB5pmNUsQnAQipL51zHmXvE/aTp48yHMPZVVfYPHcbbx6y+5GAg5Xg
        SANTf67E6vuU5oPVYmoONu7OFg==
X-Google-Smtp-Source: AA0mqf4K7r/gLLF24KW0FjHrDSx3N1e7ptvm4Bq2Kgwmep/3Tt6m1SOa7CMxe9/PFzl5etBPl3NN5Q==
X-Received: by 2002:a17:906:15ca:b0:7a5:7c1c:cc5c with SMTP id l10-20020a17090615ca00b007a57c1ccc5cmr1779224ejd.644.1668685013753;
        Thu, 17 Nov 2022 03:36:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (mob-5-90-137-239.net.vodafone.it. [5.90.137.239])
        by smtp.gmail.com with ESMTPSA id g3-20020aa7c843000000b0043bbb3535d6sm413897edt.66.2022.11.17.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:36:53 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com, michael@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 4/5] clk: imx8mn: fix imx8mn_sai2_sels clocks list
Date:   Thu, 17 Nov 2022 12:36:36 +0100
Message-Id: <20221117113637.1978703-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
References: <20221117113637.1978703-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

According to the "Clock Root" table of the reference manual (document
IMX8MNRM Rev 2, 07/2022):

     Clock Root     offset     Source Select (CCM_TARGET_ROOTn[MUX])
        ...          ...                    ...
   SAI2_CLK_ROOT    0xA600            000 - 24M_REF_CLK
                                      001 - AUDIO_PLL1_CLK
                                      010 - AUDIO_PLL2_CLK
                                      011 - VIDEO_PLL_CLK
                                      100 - SYSTEM_PLL1_DIV6
                                      110 - EXT_CLK_2
                                      111 - EXT_CLK_3
        ...          ...                    ...

while the imx8mn_sai2_sels list contained clk_ext3 and clk_ext4 for
source select bits 110b and 111b.

Fixes: 96d6392b54dbb ("clk: imx: Add support for i.MX8MN clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index b80af5d1ef46..37128c35198d 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -109,7 +109,7 @@ static const char * const imx8mn_disp_pixel_sels[] = {"osc_24m", "video_pll_out"
 
 static const char * const imx8mn_sai2_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
 						"video_pll_out", "sys_pll1_133m", "dummy",
-						"clk_ext3", "clk_ext4", };
+						"clk_ext2", "clk_ext3", };
 
 static const char * const imx8mn_sai3_sels[] = {"osc_24m", "audio_pll1_out", "audio_pll2_out",
 						"video_pll_out", "sys_pll1_133m", "dummy",
-- 
2.32.0

