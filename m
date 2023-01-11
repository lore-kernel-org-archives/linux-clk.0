Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BD5C54EBE
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 06:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbjAKGEX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 01:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbjAKGEO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 01:04:14 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCBDB866
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:09 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v25so21892915lfe.12
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8+DQLUS+svsqFnNK/csJVVvJPUxO+foIv1sSuM5hxQ=;
        b=NHVDE7ImoI4muFh/qL8WmEoIONOveB+mAGqWVrFr2dFJvSkRMN0auvr9ESzKbhQ3dz
         iSbPnqtkNo2spd3zyl5+nrIpGZQX0P5NHXKFwjtlZ/GMK1sF0yUe4aDjtVwMIfwb12zJ
         EgV3vzt88G8ujuEpsa6vy/eASWZ7Cdcpsni6kBmMQXQH3wV0CTMFRfTPWxG3ELevzIsC
         CQmyzBKTqAy/OHhTninrdt9ofV/iPkIBdT+LB3mqwKk02Z78gqOOzOkP+YJ1dZcbcLQG
         3aabkv8pC89YTRXNgY6WfPOSxIYZOoLaJERc4CL+0yIbfR+CND3CpLuxoI0Osb9lSAL9
         A4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8+DQLUS+svsqFnNK/csJVVvJPUxO+foIv1sSuM5hxQ=;
        b=icx/hhZFRll/rSiDp2A2fA6kFQLWWXvBeG9n5lbwh8zZ4J/CIATJGf0oebKU4sEjXo
         jVzwfz2XrC5K7FADFe00XUb5XXvvDyv/qeJjcUECo5sBVXo2tvtBDome+yKcJp1miZ+d
         yudB8wTxPUA8dqyBEprD58+MLj68XRlU9w32ncpWBGu27LEPKxyEFNP1hzC8bHFeGMk8
         xqMPt51mdvSUovjM9GkpLki+BqxnzemtMtjFIem1mHKfq3NRuPIN9IA2p6kF6/0WeA6f
         ZzQd1e3VQa78l0I3VnZKitj9h5TMshr5Tx+PCOmaJb196/nKGZ3+13Oilpe5JbpZjK9q
         qtQw==
X-Gm-Message-State: AFqh2kr/6YaePkf5qVO2kT5MFfWqdAHie8/MVCcPJtVtEJ+ukOiuXoPM
        AyvdNjwlCCcewr62sw/YzNX1sw==
X-Google-Smtp-Source: AMrXdXvBt8zAeVbkOBKgiAWAx18j3LdqRWkMgW0h0IN1bwAfBVBLw+FZj/rO/gSrPtAIINv1EBzKlw==
X-Received: by 2002:ac2:50c1:0:b0:4b5:2eb9:8d3 with SMTP id h1-20020ac250c1000000b004b52eb908d3mr18537857lfm.19.1673417048640;
        Tue, 10 Jan 2023 22:04:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:08 -0800 (PST)
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
Subject: [PATCH v3 07/12] clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
Date:   Wed, 11 Jan 2023 08:03:57 +0200
Message-Id: <20230111060402.1168726-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
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

