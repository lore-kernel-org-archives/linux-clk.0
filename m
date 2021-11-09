Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9BAC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 12:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0139561152
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 12:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhKINAg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Nov 2021 08:00:36 -0500
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:37608
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233652AbhKINAf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 08:00:35 -0500
Received: from localhost.localdomain (unknown [123.112.64.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 544CA3F213;
        Tue,  9 Nov 2021 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636462669;
        bh=KM+H3vprzX8Jgtwc2xcg/GVzqKFw6CiX5Ct/gnPN9YI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pykNYcI09zGYr9IahsXeaOYxOLV55xIBF5dNeg/zAP8Mj8X/H5ieef5vhAIMnYYnL
         UnR/Nkk5mMWyL096MQKLe91mQO5XWA95wwQ6vVvYTcB3CeJ4fV+lFXLOA69M03zWhf
         JathsGy2Jbtbwq4sTI7Ic5YEV+Sj8iZIHNhHzirVa6fSasI/z5yzc+p9CQG614Av2R
         vHS/iU213A2IXe2UIl2XuvYbFFIIZp/Ic39veZYEMOcmwPOnMbZfpYE0aBrvfD5Opq
         XSoDs5nsNlCheJKYtHVbp9rPXJXJO3qDjhy7zwnpgtTyA10ldCK9lzmAxCmj1dweio
         cytk74YyytllQ==
From:   Hui Wang <hui.wang@canonical.com>
To:     linux-clk@vger.kernel.org, linux-imx@nxp.com, abel.vesa@nxp.com
Cc:     shawnguo@kernel.org, Anson.Huang@nxp.com, ping.bai@nxp.com,
        hui.wang@canonical.com
Subject: [PATCH 2/2] clk: imx8mp: Fix the parent clk of the audio_root_clk
Date:   Tue,  9 Nov 2021 20:56:57 +0800
Message-Id: <20211109125657.63485-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109125657.63485-1-hui.wang@canonical.com>
References: <20211109125657.63485-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Recently we tried to enable the BSP on a platform based on imx8mp, we
backported the audiomix related drivers to mainline kernel from
https://source.codeaurora.org/external/imx/linux-imx, when kernel
boots to the audiomix powerdomain driver, the kernel will hang
immediately. That is because we set the audio_root_clk to
audiomix in the device tree, but the parent of the audio_root_clk is
wrong in the clk-imx8mp.c.

And we could also refer to the section "5.1.4 System Clocks" of the
IMX8MPRM.pdf, the parent clk of CCGR101 (Audiomix) is the
AUDIO_AHB_CLK_ROOT.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 12837304545d..c990ad37882b 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -700,7 +700,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_HDMI_ROOT] = imx_clk_hw_gate4("hdmi_root_clk", "hdmi_axi", ccm_base + 0x45f0, 0);
 	hws[IMX8MP_CLK_TSENSOR_ROOT] = imx_clk_hw_gate4("tsensor_root_clk", "ipg_root", ccm_base + 0x4620, 0);
 	hws[IMX8MP_CLK_VPU_ROOT] = imx_clk_hw_gate4("vpu_root_clk", "vpu_bus", ccm_base + 0x4630, 0);
-	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "ipg_root", ccm_base + 0x4650, 0);
+	hws[IMX8MP_CLK_AUDIO_ROOT] = imx_clk_hw_gate4("audio_root_clk", "audio_ahb", ccm_base + 0x4650, 0);
 
 	hws[IMX8MP_CLK_ARM] = imx_clk_hw_cpu("arm", "arm_a53_core",
 					     hws[IMX8MP_CLK_A53_CORE]->clk,
-- 
2.25.1

