Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6D8C00528
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjGBRuw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjGBRuw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:50:52 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E55E5F
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:50:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so5626127e87.2
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688320248; x=1690912248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njCJmlbSIeB3iLgzCjXAUGSkcFcm0Wzmp2XKu6LQ3g4=;
        b=ssG7/m80HLcUtzN1Tp8sf8cWXOe8MEJXLIi4oxSezPkJSudJCvDjF/iosLzHuIpJjh
         Mnyh+TxoYYdGlxwWrKErzgisnI/UMEo3BaZdq+qjL/Z60/voNmMirPCr6atuWj8I5kye
         fgKs/+SK8eTchJAXlyQp4x985BuSAb4jfS8v0pxbvT5hnmorTGHOCT86elBvIOmloi/W
         dXS5fDdITV6ExL3/k2LwgJuqu6dGfTPri5EYb+M+s5rR14Fu5dF+7sOPZptI4Ch7xtYI
         3An7LkVTxHd2tvG/5BRhFzCCKReqxuIYbu4llyrl7tnNa0mdlg7r8g5l6sV1x6yD5GNW
         hbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688320248; x=1690912248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njCJmlbSIeB3iLgzCjXAUGSkcFcm0Wzmp2XKu6LQ3g4=;
        b=KIis81YE9r+7AB0JzHXnE/pd4BiK9fCbOhBXy+C+Hn1uXV0mDG76bVYJEJRTaTXYwE
         6mj2/jsW5t5wSL1nsXo556XN3MFtXm/qEgMe+48fyb3w4EbaHZufS9NtrRIKKeD9IZsr
         xFsWZmKVsPEvpEtq05nkvnHTlWYCTCddFaXfcAVn4He4419clRH/wuStAJB2RCpusWbK
         PGWux5HTOUoIWMT8KzjnfgY1w9ejQf5jrbL5KzuhEIVPWunzgoq8BR4jNmx+xzDEK0eB
         ZLQT1pdwTRGeTKGgnIHGDRxzdqb5mRZ0QRQUoPSLyXqN1rYzhMA1MQzoBIbcYE/IfljR
         7Ycw==
X-Gm-Message-State: ABy/qLZW8H1Fn8s0CiHlj+oBoqTaebeUe3oAr4mqs6IrzdUnVUrJY/SG
        jXs1h/X1uGjyoqF4A8c01sfxIA==
X-Google-Smtp-Source: APBJJlFId1IOZctJQ1PTPLk4Ird+SgEb9UvsJMTQSH7UqV6if0h47PhvKg0F4NMxVXrij5LPMbKCiw==
X-Received: by 2002:a05:6512:34c8:b0:4fb:85ad:b6e2 with SMTP id w8-20020a05651234c800b004fb85adb6e2mr5110913lfr.50.1688320248082;
        Sun, 02 Jul 2023 10:50:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020ac24c81000000b004fb759964a9sm3354130lfl.168.2023.07.02.10.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:50:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [RFC PATCH 2/8] cpufreq: qcom-nvmem: enable core voltage scaling for MSM8960
Date:   Sun,  2 Jul 2023 20:50:39 +0300
Message-Id: <20230702175045.122041-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
References: <20230702175045.122041-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Reuse APQ8064 config for MSM8960 to enable core voltage scaling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 422fd8ca8a00..113f35668048 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -410,7 +410,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
 	{ .compatible = "qcom,ipq8064", .data = &match_data_krait },
 	{ .compatible = "qcom,apq8064", .data = &match_data_apq8064 },
 	{ .compatible = "qcom,msm8974", .data = &match_data_krait },
-	{ .compatible = "qcom,msm8960", .data = &match_data_krait },
+	{ .compatible = "qcom,msm8960", .data = &match_data_apq8064 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_match_list);
-- 
2.39.2

