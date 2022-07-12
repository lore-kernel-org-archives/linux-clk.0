Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F02FC43334
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 12:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbiGLM7e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiGLM7c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 08:59:32 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228371FCEA
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:31 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d16so11036955wrv.10
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yS4aszlD6wfaJXkFTxX6G5kce/Ags3GTvPz2INj0vkA=;
        b=UtgpWScOPK7ulWYKExX2Qx9TQNSVmYi0q0KDI8/sVm3ASbTAMqcfHrtlRs990t4y+h
         XM/fntk0QB3Bb+zaUnAZQvKcxryXHvT11aOocDHsC+nvnkNfh4PVLK34/qMv+RrozEyU
         tBF2bz0PdodHsLRBZkOjfxSJybvznPt552YmFU7nGv6AWU1GaQegj1yoaPvyDFC4fZzE
         8rhSsy4v+8p2nPWGnt1b8X9c4nNAvj2yj6j7vrFltMbTSvuO/gtHxc5ntYM5jpIH8rnt
         a8JS2JkHTJFcYQTc2BtnqCsMaiZ+yRBwCd2Wp5i1t4F5xGNci8H2g2Qt4F/Kk49N45+i
         uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yS4aszlD6wfaJXkFTxX6G5kce/Ags3GTvPz2INj0vkA=;
        b=FXDKDWjyJFSdd4+aNP+xOvUo+057/R/6cin8WFTvAHC07hRixnAGy0yYzXIyiOxfjN
         cxdpC+o25i5mtMEzYTRJnYKAOloeuO43IB29zuRiUktMXpni6Vzw30p19PdOnszZ8ljY
         44S4KfETrKfbQY9pMvI1T3QDVMxZcaiZybBOo2TVfLEBcmCsYxDDWgy0AhOIRPrJrxSN
         8aqOL9GvR2qhUVczwcHoVB4Bg5ii9x1rRVVPFEhntHCaRqxKmR3vEymfPd9kRQeWnUaT
         1DyMds5XI+46xxt7rIOxR65g+6E4YxzESCbuQXEWzwcrPTdhTH34/joJL+6n/wmm4MQz
         zGaA==
X-Gm-Message-State: AJIora+i+nrS2Q13ae2PHkQ9LELaNeiv3CJ6fstNzXX5VUOvk76mdRuU
        dZCPcBL/Hsi/9zcRXoR+4c0mCg==
X-Google-Smtp-Source: AGRyM1u3GMRPvrLIVNDWN96Q8Wkz0b8cZSpRfZWd35w1BmXUjX2DQ+HSF8WSSV36pxXN0vvN+Id6Gw==
X-Received: by 2002:a5d:4584:0:b0:21d:62f5:c2da with SMTP id p4-20020a5d4584000000b0021d62f5c2damr22706157wrq.671.1657630770741;
        Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:30 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 6/6] clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies
Date:   Tue, 12 Jul 2022 13:59:22 +0100
Message-Id: <20220712125922.3461675-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
References: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The shipped qcom driver defines:
static struct clk_freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
        F(  57140000,      gpll0_out_main,  14,    0,    0),
        F(  80000000,      gpll0_out_main,  10,   0,    0),
        F( 100000000,      gpll0_out_main,   8,   0,    0),
        F_END
};
In the upstream code we omit 57.14 MHz and 100 MHz.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 7f71491d52c4b..754d5573b1df5 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1468,7 +1468,9 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
+	F(57140000, P_GPLL0, 14, 0, 0),
 	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	{ }
 };
 
-- 
2.36.1

