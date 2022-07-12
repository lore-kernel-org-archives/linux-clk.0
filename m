Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC68CCA47C
	for <linux-clk@archiver.kernel.org>; Tue, 12 Jul 2022 12:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbiGLM72 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Jul 2022 08:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiGLM71 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2022 08:59:27 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA431EEDC
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id bu1so9881231wrb.9
        for <linux-clk@vger.kernel.org>; Tue, 12 Jul 2022 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8VZ0clunUQBnjW7zf8qlAsvO8C64gVCnbbBGVGcFgM=;
        b=adoif1L1XNbykYk33LLvb+mM60dhPvmSPTDnTCV126MZgphD6iYn/L6Ii4+YDOqPxP
         JUVSllPZrOCAkRXSr4svr+6htFgZUUZ82NZtA304fvl8TDdguchQcGRvxYTsSsg0E3Mn
         auXf1pWBYCMwqYU8zkfxNZ7/CrNcGAQUkOuIbiXuKdY5264sH/yc5EbmpWRlcF8Ex6kz
         kF1OD6xRlbiBqDu660bD6DD0NfsnAC6NWSnnJihG0+s1poYgIP7fyjI5bxX1xWtMq+r3
         niTsXGrFgzORTDsI2aBwfmIzjrLz1uUFCLXI16wd7whjBUAZvVac0JleFRhX51Tj2Yb8
         WvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j8VZ0clunUQBnjW7zf8qlAsvO8C64gVCnbbBGVGcFgM=;
        b=neISJ2P4sOkpHDqNYaHLTaDSBm5qvUKdkoVMvl421OlJnUrdswB7sGnr3NioRtd7BK
         3pdjmBAhMbQceFDfjfK7Ph87tnbygxwM2XSfUNNBTVfr2TNFYV+7YHb2DuJZdX2te5lp
         ksjnuZYIoLpSQKFwW732o1FXfYT4IOUw3883etAR7LQrjLcMqvttEufDvqZN7Nl8D2Xq
         ZjneXQWQOU+T3IzSaPFXh7gaLO75YOa6aNn6UOUAnuwyqnHJLD89QiDA9yYsROS/5Yzv
         o07fyJ5iXuTlJbxoTtfyHbAVVHm55pS3QSIpaY9BufgbzkV+Vlc+WJjnSr335lRCsm6w
         jDgA==
X-Gm-Message-State: AJIora/vYlS+PGeZ/oFQmZJd+/n1HMitcEnfCtywA0m3wg9Rd9pAI7yX
        t1bvgcr5OamXfQ2zZOg3Qu2tKw==
X-Google-Smtp-Source: AGRyM1s7EwNMlAWio5Kd772TWMYptjSJsAawCToYB/HjbL9ipwCIOivSTMTo516tbxYyGVQD1ns4Dg==
X-Received: by 2002:adf:f345:0:b0:21d:6927:ec8f with SMTP id e5-20020adff345000000b0021d6927ec8fmr22258111wrp.490.1657630764806;
        Tue, 12 Jul 2022 05:59:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t123-20020a1c4681000000b003973c54bd69sm13008627wma.1.2022.07.12.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 05:59:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/6] clk: qcom: gcc-msm8939: Align clock frequencies with downstream driver
Date:   Tue, 12 Jul 2022 13:59:16 +0100
Message-Id: <20220712125922.3461675-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The gcc-msm8939 driver is a copy/paste of the gcc-msm8916 for the good
reason that msm8936/msm8939 are an expanded version of msm8916. Reviewing
the qcom driver though there are some obvious missing/wrong frequencies
which a simple side-by-side comparison can show up.

This series captures that side-by-side and transmits into updated frequency
tables.

Bryan O'Donoghue (6):
  clk: qcom: gcc-msm8939: Fix weird field spacing in
    ftbl_gcc_camss_cci_clk
  clk: qcom: gcc-msm8939: Add missing CAMSS CCI bus clock
  clk: qcom: gcc-msm8939: Fix venus0_vcodec0_clk frequency definitions
  clk: qcom: gcc-msm8939: Add missing CAMSS CPP clock frequencies
  clk: qcom: gcc-msm8939: Add missing MDSS MDP clock frequencies
  clk: qcom: gcc-msm8939: Add missing USB HS system clock frequencies

 drivers/clk/qcom/gcc-msm8939.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.36.1

