Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AA5C83005
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 09:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjFLJ25 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjFLJ2Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 05:28:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9074C15
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:22:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso47395871fa.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686561771; x=1689153771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aokZ02DTWb9itSjNmX3GX1bnlGBgRvBPpzBUwT1r8Ks=;
        b=zgaXR068y2KvRcu+CefSXblQauZN/5694hY3v3A7mOv8L2XDoiACIFYh0En2bjFWO7
         elrV6OhqE7pubIBMZnNEpe3US8kk7cx7qjr/U3dOsamyYot1184AjFRQr74Nu3xec5pp
         4EmEIYb+GCt1S83vlEWaJor7gMzYeFdsu50yEG6n0Blk2gFifRyCFnPAdDUNNCU4CrJl
         NES3HC0wKGdRVeaa7i557J1WaXaISlJNWJLOO8+jV5VGT0Uo2gVx12TYt9qDZsKLF3jJ
         nBLzxypmxW1pNtaab38uryMBiz8WRkg0DEA56Bi4B+Ei1fn0Vewaymmg3YWbwf1v7unA
         ymcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561771; x=1689153771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aokZ02DTWb9itSjNmX3GX1bnlGBgRvBPpzBUwT1r8Ks=;
        b=DRNxYSWW8SI8JlZw1OFV60yS3wVEXH+ecDUejVCdk6OuanA8eE4Z7kSE+sS3tD9j4/
         kF/JoTxx67pT13SuVQk3KyL11weV9CvfqYLDGrajCZHIm1SKpqe7Xjbuw70G3i051aaZ
         WufPa4CPJFrtCuAhcSyQvV++rxZHnW2WzNMSzqUEdy/g9tzbcP0H8CtILIZCPSGF/CzC
         ctEC4/I9ktSkiUskBMZ6vbB2lvDK2IY/G1Pd0/xz/eh2NpCu7Ru2aL5ji+hbudwhddOe
         IGTFW1H3pD9JPJjnBkCRIvul5qYoqCjWg8lcQ/C5X64tiaByuD4U1Ep7HiABh6sRrI9S
         Qhkg==
X-Gm-Message-State: AC+VfDwOhz3IPoY4LnayxOIIENRlW6bsc5d2D/HNqassPCnRsxNKmqIR
        hDzPSJ0paxE53x0rtlQMy/bfRA==
X-Google-Smtp-Source: ACHHUZ5AjcfJ5uMMKue3jHOWd8iRAU/zsDR+PTI2mRCF58UVPCYAZha4zaL1zKZ8sMKtUSCKN3XhxA==
X-Received: by 2002:a05:651c:22a:b0:2af:2441:f709 with SMTP id z10-20020a05651c022a00b002af2441f709mr2312656ljn.29.1686561770934;
        Mon, 12 Jun 2023 02:22:50 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id o20-20020a2e7314000000b002adc2fe3fc8sm1681722ljc.4.2023.06.12.02.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:22:50 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 11:22:47 +0200
Subject: [PATCH 1/2] clk: qcom: rcg2: Introduce read-only RCG2 ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-topic-rcg2_ro-v1-1-e7d824aeb628@linaro.org>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
In-Reply-To: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686561768; l=1865;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=3gIA9vzv7N0fpwHj2dbt5ZFR2hwXZW2370PjU3vkRU0=;
 b=/QuvsvHHTCcXI2H4Y3Vl48qEwTbc+OqDpUK9QFPMGjfNXa4lqdxBVWHNLyqKbv6mkQe9Xoc0t
 SRRPfn5u4jmAHeAyOv/Oz3gazVUBpjYJv2DCh5qsADr/ZIRk9wy3zIF
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clocks are physically part of a clock controller block (e.g. GCC),
but are under no circumstances supposed to be touched from HLOS/APSS, as
another subsystem manages them, and trying to alter its configuration
may (and likely will) wreck total havoc over whatever the clock is
attached to.

Add read-only ops for RCG clocks. This allows us to peak at the rates
(and other configuration parameters) of such clocks without the risk
of messing up half of the SoC due to an erroneous CCF call.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  | 1 +
 drivers/clk/qcom/clk-rcg2.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6d84c8c7989..4b4ff156539f 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -170,6 +170,7 @@ struct clk_rcg2_gfx3d {
 extern const struct clk_ops clk_rcg2_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
 extern const struct clk_ops clk_rcg2_mux_closest_ops;
+extern const struct clk_ops clk_rcg2_ro_ops;
 extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_byte2_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index e22baf3a7112..71de1cd8d45b 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -518,6 +518,14 @@ const struct clk_ops clk_rcg2_mux_closest_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_mux_closest_ops);
 
+const struct clk_ops clk_rcg2_ro_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_ro_ops);
+
 struct frac_entry {
 	int num;
 	int den;

-- 
2.41.0

