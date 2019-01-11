Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B7EC43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 13:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14CE320874
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 13:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732735AbfAKNiB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 08:38:01 -0500
Received: from smtp3-g21.free.fr ([212.27.42.3]:51654 "EHLO smtp3-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728590AbfAKNiA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 11 Jan 2019 08:38:00 -0500
Received: from [192.168.108.68] (unknown [213.36.7.13])
        (Authenticated sender: marc.w.gonzalez)
        by smtp3-g21.free.fr (Postfix) with ESMTPSA id AA40E13F8BC;
        Fri, 11 Jan 2019 14:37:43 +0100 (CET)
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <andy.gross@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] clk: qcom: Select QCOM_GDSC with MSM_GCC_8998
Message-ID: <b0970d61-5658-5a00-0f5e-158f31aa2460@free.fr>
Date:   Fri, 11 Jan 2019 14:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If QCOM_GDSC is disabled, gdsc_register() returns -ENOSYS, which causes
gcc_msm8998_probe() to fail. Select QCOM_GDSC to solve the problem.

gcc-msm8998: probe of 100000.clock-controller failed with error -38

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1b1ba54e33dd..1c04575c118f 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -215,6 +215,7 @@ config MSM_MMCC_8996
 
 config MSM_GCC_8998
 	tristate "MSM8998 Global Clock Controller"
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on msm8998 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
-- 
2.17.1
