Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5584AC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 10:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4003A60FA0
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 10:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239691AbhJHKXI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Oct 2021 06:23:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46248 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239538AbhJHKXG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 06:23:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 718461F4575E
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] clk: qcom: mmcc-sdm660: Add hw_ctrl flag to venus_core0_gdsc
Date:   Fri,  8 Oct 2021 12:20:41 +0200
Message-Id: <20211008102041.268253-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008102041.268253-1-angelogioacchino.delregno@collabora.com>
References: <20211008102041.268253-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As shown downstream[1], this GDSC supports HW trigger mode and
we're supposed to enable it in order to ensure correct operation.

[1]: https://github.com/sonyxperiadev/kernel/blob/aosp/LA.UM.6.4.r1/arch/arm/boot/dts/qcom/sdm630.dtsi#L2181

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/qcom/mmcc-sdm660.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index c5fdc36e3c34..bc19a23e13f8 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2575,6 +2575,7 @@ static struct gdsc venus_core0_gdsc = {
 	},
 	.parent = &venus_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
 };
 
 static struct gdsc mdss_gdsc = {
-- 
2.33.0

