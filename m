Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:41310 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752060AbdLFMN5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Dec 2017 07:13:57 -0500
Received: by mail-wr0-f193.google.com with SMTP id z18so3652120wrb.8
        for <linux-clk@vger.kernel.org>; Wed, 06 Dec 2017 04:13:57 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: sboyd@codeaurora.org, linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/2] clk: qcom: msm8916: add 12.288 MHz support to codec dig clk
Date: Wed,  6 Dec 2017 12:11:39 +0000
Message-Id: <20171206121139.18936-3-srinivas.kandagatla@linaro.org>
In-Reply-To: <20171206121139.18936-1-srinivas.kandagatla@linaro.org>
References: <20171206121139.18936-1-srinivas.kandagatla@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patch adds 12.288 MHz suport to codec digital clk, this clock.
Some external PA requires a 12.288 MHz to work.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index d973aeaab943..d6c7f50ba86a 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1436,6 +1436,7 @@ static struct clk_branch gcc_ultaudio_stc_xo_clk = {
 
 static const struct freq_tbl ftbl_codec_clk[] = {
 	F(9600000, P_XO, 2, 0, 0),
+	F(12288000, P_XO, 1, 16, 25),
 	F(19200000, P_XO, 1, 0, 0),
 	F(11289600, P_EXT_MCLK, 1, 0, 0),
 	{ }
-- 
2.15.0

