Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEC3C7EE2E
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 11:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbjERLkx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 07:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231332AbjERLku (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 07:40:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A37212C
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:22 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1284370f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684409997; x=1687001997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+NnmS4Y3N2+zWv4AXvVWEIhI6GRLW/Tqx1d8cSKZH0=;
        b=WgmcYd3c2c6AmlCrESXGoTOnB4d/DjLyAxklZQY3IlX6lsIPNn9B8cYkfuSa/SKIj4
         zLrhmGGzX/x++nUUWvv8gFHW1cLmJikKbJffcn/hSMa5GOJ5YXOW78CjVVWl+OKOHFSe
         Ko2sUmtsolRJIiLptuFsMxn/87vmOMYtIVo9VudQMJTAllWLLsHV9/8MDqhMxaFTzWKV
         dYVQvogf0/W7aDP38KKsH3dZH66xxx1hcO+FEuWQB6faRP0YnydpqGmcS/RJoY6Cb4sZ
         bJXLs8IcZBbliLdNkTxfDmGrd1A0HOihgl/GskeUcmecsE1hDzsBfgHrs4eQSqMQ30Tm
         Royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684409997; x=1687001997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+NnmS4Y3N2+zWv4AXvVWEIhI6GRLW/Tqx1d8cSKZH0=;
        b=IPU2YsOdbAnNgIB3gSqQbGA+iRsMEo5IsBuvSuGpSH7IUmeAMHfRdDZMn11vdwDYEl
         uCfD+lPMlz92loX1vc2ZdF1g6ZCFAGpQSY49nrYBFrumVdw/NeD4M4yiNxCkf2/TMc71
         TcqTmPYVvTZDW+qHukCw41dUQN/8odK5zW7cDbWRUOrgIeBL4dEHdvH28r7UOfWYzhVS
         Nhl/8V4t/kHvNr0filFJ/MZZ5NPVn4AvIgdReonxpVOttRfI9kBc26/6fglrfLhV6Afq
         +2ch81H5AokcywWmdbIJgWslNvUSdosuC4Z3FUCYV83FegpYIDhgIESwRkYOJLZcqUWV
         0dTg==
X-Gm-Message-State: AC+VfDym4blCj1ef2UpeP+0UV3m5wKvtjrrP0EO+qWwoHbLiLNeqqVGg
        mxDY1XIPbAJEt40at3rdKHEOCQ==
X-Google-Smtp-Source: ACHHUZ4xc23L4sP/TfxuHDTrwImaj5xkH98OAx2YSlJWBzyYAHAXNTvdKHWzQ+9tUgRkhCphmGYYHw==
X-Received: by 2002:a5d:6d50:0:b0:309:475c:c90e with SMTP id k16-20020a5d6d50000000b00309475cc90emr1637260wri.37.1684409996910;
        Thu, 18 May 2023 04:39:56 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b003047d5b8817sm1897135wrv.80.2023.05.18.04.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:39:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/5] clk: qcom: Add lpass audio clock controller driver for SC8280XP
Date:   Thu, 18 May 2023 12:37:59 +0100
Message-Id: <20230518113800.339158-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
References: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for the lpass audio clock controller found on SC8280XP based
devices. This would allow lpass peripheral loader drivers to control the
clocks and bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/lpasscc-sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-sc8280xp.c b/drivers/clk/qcom/lpasscc-sc8280xp.c
index 118320f8ee40..e221ae2d40ae 100644
--- a/drivers/clk/qcom/lpasscc-sc8280xp.c
+++ b/drivers/clk/qcom/lpasscc-sc8280xp.c
@@ -13,6 +13,26 @@
 #include "common.h"
 #include "reset.h"
 
+static const struct qcom_reset_map lpass_audio_csr_sc8280xp_resets[] = {
+	[LPASS_AUDIO_SWR_RX_CGCR] =  { 0xa0, 1 },
+	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
+	[LPASS_AUDIO_SWR_WSA2_CGCR] =  { 0xd8, 1 },
+};
+
+static struct regmap_config lpass_audio_csr_sc8280xp_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-audio-csr",
+	.max_register = 0x1000,
+};
+
+static const struct qcom_cc_desc lpass_audio_csr_reset_sc8280xp_desc = {
+	.config = &lpass_audio_csr_sc8280xp_regmap_config,
+	.resets = lpass_audio_csr_sc8280xp_resets,
+	.num_resets = ARRAY_SIZE(lpass_audio_csr_sc8280xp_resets),
+};
+
 static const struct qcom_reset_map lpass_tcsr_sc8280xp_resets[] = {
 	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xc010, 1 },
 };
@@ -33,6 +53,9 @@ static const struct qcom_cc_desc lpass_tcsr_reset_sc8280xp_desc = {
 
 static const struct of_device_id lpasscc_sc8280xp_match_table[] = {
 	{
+		.compatible = "qcom,sc8280xp-lpassaudiocc",
+		.data = &lpass_audio_csr_reset_sc8280xp_desc,
+	}, {
 		.compatible = "qcom,sc8280xp-lpasscc",
 		.data = &lpass_tcsr_reset_sc8280xp_desc,
 	},
-- 
2.25.1

