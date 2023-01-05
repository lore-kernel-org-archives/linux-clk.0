Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A34C6379F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Jan 2023 13:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbjAENlo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Jan 2023 08:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbjAENlm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Jan 2023 08:41:42 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309A8E012
        for <linux-clk@vger.kernel.org>; Thu,  5 Jan 2023 05:41:40 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f34so55000319lfv.10
        for <linux-clk@vger.kernel.org>; Thu, 05 Jan 2023 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+DQLUS+svsqFnNK/csJVVvJPUxO+foIv1sSuM5hxQ=;
        b=C/8pytCjAv0pKlod0LiR5tmqpUAvjqdOpweE+Sh0Jy0s/pRfBBI5tWmlC7ho0Trz5r
         3O3IES/zVEPsz56Gq4GMom5GOqZvvgLBUX+szcUQNUOmGvH6dMPmlgXEmphsc2F1t7zn
         gSgc7pHx069OiDdyuZjQ7dm5gGdrWlwcJQPwknaRDp/WLjz2LO83tyEc45/M6FBCrZ8w
         4Xyz2n22yMXMxR6LZEYERE2cjAm6hqdisDlfa1ep9sKHKT3q8E9W+6jNrTHp+orStgh6
         0Wx6Lre2mExAzqZigGURSPc1izx+jdhsQBMANIuEH1cuIEy+KOBNn21/10OPfE0hNQFD
         GyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8+DQLUS+svsqFnNK/csJVVvJPUxO+foIv1sSuM5hxQ=;
        b=dimty9UK1ciEjsT99sPWB38tUcE+9+ezm+TvcRquRyTsaob08CMYTb6kOGwGqLsaqy
         /66Z8hORzTnI1keEc//AkCbDHuli5nDC3VtFlMNiUedYyGzjmzGUljwPtiiJs1DMV1E4
         QrZQKvYG5LZVp8o7F/j8iQCxLK7LebF9XqczEoU5mFFq3nOfBlvc9B50/omdM27Kt3Kw
         qW8+RahJCDl5eDRlmlpZgol7u8gbL1R8f5RhYCn70Wq8WyfImGogMTSJa+szGrKp+gkG
         oC2HRILJKsd1cqg8arzfReo0cm4MnXrDWVTRTaft+Sc00Kz9tPKxHk3hFOTpHYURD0h+
         v9wQ==
X-Gm-Message-State: AFqh2kqaBpT8kPDni381F0hXL5ocGga80eN6TOug++IBNAf+bc3sRNEC
        B308GfE02wNQqfidPTyT85rCgfxsW0I4G7/Y
X-Google-Smtp-Source: AMrXdXt3rywYX3W7lbaVyJySrFvgfpWvfgFi5KFUNerhVbXoq/NF4QsZdswpsh2AHU1NC6adeowW1g==
X-Received: by 2002:a05:6512:3750:b0:4a4:68b9:66cc with SMTP id a16-20020a056512375000b004a468b966ccmr13287579lfs.23.1672926099760;
        Thu, 05 Jan 2023 05:41:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 07/12] clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
Date:   Thu,  5 Jan 2023 15:41:28 +0200
Message-Id: <20230105134133.1550618-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
the multimedia subsystem.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-apq8084.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index c26e222c78d4..7085d2ccae49 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -1382,6 +1382,19 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
 	},
 };
 
+static struct clk_regmap gcc_mmss_gpll0_clk_src = {
+	.enable_reg = 0x1484,
+	.enable_mask = BIT(26),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmss_gpll0_vote",
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0_vote.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_branch_simple_ops,
+	},
+};
+
 static struct clk_branch gcc_bam_dma_ahb_clk = {
 	.halt_reg = 0x0d44,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3480,6 +3493,7 @@ static struct clk_regmap *gcc_apq8084_clocks[] = {
 	[GCC_USB_HSIC_IO_CAL_SLEEP_CLK] = &gcc_usb_hsic_io_cal_sleep_clk.clkr,
 	[GCC_USB_HSIC_MOCK_UTMI_CLK] = &gcc_usb_hsic_mock_utmi_clk.clkr,
 	[GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
+	[GCC_MMSS_GPLL0_CLK_SRC] = &gcc_mmss_gpll0_clk_src,
 };
 
 static struct gdsc *gcc_apq8084_gdscs[] = {
-- 
2.39.0

