Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C529C001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 18:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233696AbjHHS4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbjHHSzl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:55:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B4F6BD38
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:14:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe457ec6e7so9788706e87.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 10:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691514857; x=1692119657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJRcX7l83GzG4nljjiXsSgTVORkCZorOu6CVVdtQF3E=;
        b=eKcwpt8HJdkX3wZNnK9lL2hw8x8t0S0btrEwmtcJDMEPiVxyCXWP/owW9br/v6Dppu
         2Yh7sx9uh5d+A2LO5cNKlsLaIOKXLIQbdI/1gyZVO+I/qV6mLKpcG8L3yd73pDSqgvIj
         NRRhVQMo9vPE9K5JE1CH2GIBXbAMPnfLmFHua3B4DJR5D0o734KYPtRrBwrVlu5viJt6
         YHNOQO+0O7fJ59EfoFmBdzVb7aY73FvR3L4XhtJuZEzCONNUWB2y/ATmM+fwJeB/wWRB
         osAa21b/nHffnlrGKBWN5ew37PxCKToqbIrm5cIIFaZdhDuTwkZ2rhQ6HayyLXe+JkBa
         ZrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514857; x=1692119657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJRcX7l83GzG4nljjiXsSgTVORkCZorOu6CVVdtQF3E=;
        b=laJwVDo/vRNaYoz6JJH9785gS28OuzaMctC9wToPlIOV3RYHgGulyJnp1nH6/uGyeT
         jUY0onakmw622VU0pj/E+cfnJBzHvvrr48qa4KC2hGUbLG/40r9/9BRzzj7aHRBVWBtT
         inekESvsPPIdKD8kJBHMbXXts3V5dapK4g6di9ChM+oqW0Dtcece0qj726NJcZPEByC9
         git+HckurJPv9IDMNOcsUcB4MEmiztXao3ENr2FwTvVyDo1d3CpC28WAgZ1e3IoKpEFz
         Wu1aOs8eynLzYgIDT/Ar3xAZjuHrla1id44y72UwixglU0YPiss9j60j8KcQZA1nIjPo
         ggZw==
X-Gm-Message-State: AOJu0Yykj5mrU+HcjRCkKjaY9DulHUDozdySHB9aHKww58HlzmIplC3K
        g1Rel6F/d3SgappDV7Cxbdi0xNnbKDMxewKhKnM=
X-Google-Smtp-Source: AGHT+IGHUT7VSfmI8VQtBPNaetpOWrfLKOPZbXgUnGq/oqs5MCTMjFVV+jNZ7mtrZHhq6p1BDeKZtQ==
X-Received: by 2002:a05:6512:39c3:b0:4fb:89e3:5ac6 with SMTP id k3-20020a05651239c300b004fb89e35ac6mr9893926lfu.62.1691487893637;
        Tue, 08 Aug 2023 02:44:53 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id i6-20020a056512006600b004fdba93b92asm1818884lfo.252.2023.08.08.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 02:44:53 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 08 Aug 2023 11:44:43 +0200
Subject: [PATCH v2 3/6] clk: qcom: gcc-msm8998: Don't check halt bit on
 some branch clks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230531-topic-8998_mmssclk-v2-3-34273e275c51@linaro.org>
References: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
In-Reply-To: <20230531-topic-8998_mmssclk-v2-0-34273e275c51@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691487885; l=1627;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4vcJD39xmmwGxR16do/vEynX3nfOkYLGbzSw65dGFMA=;
 b=t/2b5DxWk6eOZxBSMoG1WvSgfjtXnl9wcFAwd+sra0DiGErD9S3YZpkCbKjr1qwJdtT7FY3gv
 IJZo/StB+T4CsgBs40j0+BPJSYBAKHNwSKgL7MrSPgapI+FCbOr3UJU
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some branch clocks are governed externally and we're only supposed to
send a request concerning their shutdown, not actually ensure it happens.

Use the BRANCH_HALT_SKIP define to skip checking the halt bit.

Fixes: db2c7c0a04b1 ("clk: qcom: Add missing msm8998 gcc_bimc_gfx_clk")
Fixes: b5f5f525c547 ("clk: qcom: Add MSM8998 Global Clock Control (GCC) driver")
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 1ba516a0c0f3..257b27d8eeb6 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2060,7 +2060,7 @@ static struct clk_branch gcc_gp3_clk = {
 
 static struct clk_branch gcc_bimc_gfx_clk = {
 	.halt_reg = 0x46040,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x46040,
 		.enable_mask = BIT(0),
@@ -2073,7 +2073,7 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 
 static struct clk_branch gcc_gpu_bimc_gfx_clk = {
 	.halt_reg = 0x71010,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x71010,
 		.enable_mask = BIT(0),
@@ -2099,7 +2099,7 @@ static struct clk_branch gcc_gpu_bimc_gfx_src_clk = {
 
 static struct clk_branch gcc_gpu_cfg_ahb_clk = {
 	.halt_reg = 0x71004,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x71004,
 		.enable_mask = BIT(0),

-- 
2.41.0

