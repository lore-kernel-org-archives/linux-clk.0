Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91168E776C7
	for <linux-clk@archiver.kernel.org>; Mon,  2 Oct 2023 18:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238530AbjJBS7w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Oct 2023 14:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238543AbjJBS7v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Oct 2023 14:59:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65C2B0
        for <linux-clk@vger.kernel.org>; Mon,  2 Oct 2023 11:59:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-503397ee920so41376e87.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Oct 2023 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696273186; x=1696877986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETmrOyXpzkFbupwItSkBNFCMqm+cnfW5vWqiMF83MgM=;
        b=KXDx19e3//Y8kt0JJre+F6jhUk0ruqw4A3TRW2+76Yj/+X9CHgG8eeu6/CsIgqTn6E
         NaCzrD0egxBynwKreHodsfqeg6Anra8B/pyd46VJwXi2zEEfW98lDBGbATy+Mq8LHEze
         kJaiFRa793vc2BsITA77TNfunGvnskZE/UrOIPlE2zZ+PE3O5gUCB9fe0RDJebclKG0r
         ZC6v+x1tR8q/TjPUYf/9c7gFPZyQNKM03y6NMM5lxND/gEFLM1aMOUewnr7u4EqfLVT6
         iLtKMQiIoZQVYP+ky6DL7rBFMTkcxjBgnrlbVYi7hd5+ZdWqj/ZalPClaOwrO70YHT4S
         lRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696273186; x=1696877986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETmrOyXpzkFbupwItSkBNFCMqm+cnfW5vWqiMF83MgM=;
        b=me4AvAw9HRqDgbx8VigeAt2Or1wZ2AkzHra/1NYk5L3UO+eghObvpxerIAnL8adzR7
         QqJeqE+urc266+ZfKKiO3OhtVkEwf1dyz2AA+6052qhMPounP1MFgC+gCx68FygDBs8C
         wQkayF/0pN1XHkZSiwXNZ+NAa6DzKO0nbgaumEtV3cbgQKq6c5fN4hdHpKiPloYcg2sP
         OnzrgIglvhR25oHsBTl/WS1XP3ulsfbJhdkLhC4yaN3csTXCpCQbQiMASCGRLKU8vj5D
         MpduP3Olx3+D08X3X8pBpCjMUbTEQUOfuDWmagD5QTr5fwK/efM6HDoA6YXV7k4FeMNI
         j6qA==
X-Gm-Message-State: AOJu0YxVLYIPnNx1z7XpYY2BmTgOKJwyW4H76Eo6iQO0fycFDpzegXUe
        htfnKgovUjkPXkt/yLksVwP5IQ==
X-Google-Smtp-Source: AGHT+IGoo4epBUciQRmMmhHMfybHxLIJNCItcKoPirP6vC0ZxB9+PFXBJdN8BkE3vJgSJ2vYEEuuPA==
X-Received: by 2002:a19:8c47:0:b0:500:9524:f733 with SMTP id i7-20020a198c47000000b005009524f733mr9981048lfj.20.1696273186047;
        Mon, 02 Oct 2023 11:59:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t6-20020a19ad06000000b00502d7365e8fsm2443981lfc.137.2023.10.02.11.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:59:45 -0700 (PDT)
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
Subject: [PATCH v5 6/6] cpufreq: qcom-nvmem: enable core voltage scaling for MSM8960
Date:   Mon,  2 Oct 2023 21:59:40 +0300
Message-Id: <20231002185940.1271800-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
References: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
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
index e1cf677b0c6f..6b54a674e9ea 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -408,7 +408,7 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
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

