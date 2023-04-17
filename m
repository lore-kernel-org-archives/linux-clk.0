Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08152C77B72
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 11:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjDQLsJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 07:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjDQLsI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 07:48:08 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D947A96
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 04:47:05 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l15so1538126ljq.8
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681732020; x=1684324020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUIApCxHRXMR9r97tiawGsgCeEwOjVwHyinCZfxW1W0=;
        b=M8nRuba3eP6ZlV09KdMCztgFtMv01BGx2+nyHK4leSkoO6+p5mv7L17E1GjLX+i+mV
         Zsp5t9ErkKh7aIkz8YZCtFSoTDKXedH2eOn2JLRxcfB6FLeC9UTy9xhRO8nljoZ2Vbno
         2Jc44GoW+gtyLSvqYn6sbz4VFqVFlmn8UXmyAcbS75rcFeEeSU9OJwePemY3ddd+nLzM
         ij6q5rlX7yzwbryBD6YWd1TCX1FQ8lUNhwCjUhe/b7CjERpTHVrrkGV/IiJwH2CVptRG
         95eOVnwyZxOVlCXJ+OpikLBB/VYb/vJdy1Wxal6F+C+4Ps7huULweywala+YJjzhnc47
         np0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681732020; x=1684324020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUIApCxHRXMR9r97tiawGsgCeEwOjVwHyinCZfxW1W0=;
        b=SQVduz2EB6BbtoCD6dYbgxhf04MEITWAJwHuUPF/rPlVae8JTQCdOgeAK735M0LSuY
         aSSXJT38YRqae5vYpTH0SRtT4xMgvMNe18uLKfApQXmQZbOrwx4vi6SSzh5BUzkr0sZi
         EnlqPGuHp1jdOPijGgxazq6HBpDn/cH5jXesL7XwKCq/oe27/GVfFum44JVn+YzV2gOh
         72DSTlzUNIgGtp+rgikl0nNYGwuIQVTwYYT0w+dA8LD/lxMeKfIDpVK849BJliZZVMED
         eLJePXmiO4MgeZbyo2gG4rmokj7pimtbhFz8YM8K5lvCs2VDrAG/ULk5pTrgVZCCNvn5
         nJyw==
X-Gm-Message-State: AAQBX9c8pvDSg7SrVgQeEJNuSKNrEtSBUf+5guN/uX68T8G3Kweah6Kr
        5uSvEvJiCSqsiKVE8ugQEJRorfjUGzt2HUsR7MM=
X-Google-Smtp-Source: AKy350Y13uDz1cSJuHgD3oFACCaEgrsZ8ALiSnrybEdaQdry0Z5I39gAzs3Pc+MByw/d8mbYTsSiPQ==
X-Received: by 2002:a2e:9248:0:b0:2a8:c3c7:b551 with SMTP id v8-20020a2e9248000000b002a8c3c7b551mr920410ljg.17.1681732020426;
        Mon, 17 Apr 2023 04:47:00 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020a2e9d9a000000b0029b32a40934sm2181751ljj.113.2023.04.17.04.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 04:47:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: include cc device name into error messages
Date:   Mon, 17 Apr 2023 14:46:59 +0300
Message-Id: <20230417114659.137535-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To ease debugging of the incorrect clock configurations, add the name of
clock controller to the "invalid index" error message.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..7dcf818e1dd9 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -19,6 +19,7 @@
 
 struct qcom_cc {
 	struct qcom_reset_controller reset;
+	struct device *dev;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
 };
@@ -227,7 +228,7 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	unsigned int idx = clkspec->args[0];
 
 	if (idx >= cc->num_rclks) {
-		pr_err("%s: invalid index %u\n", __func__, idx);
+		dev_err(cc->dev, "%s: requested invalid clock index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -251,6 +252,8 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (!cc)
 		return -ENOMEM;
 
+	cc->dev = dev;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
-- 
2.39.2

