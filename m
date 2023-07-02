Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412A4C18E1B
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:43:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjGBRnV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjGBRm7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:42:59 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B94183
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:42:57 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69f958ef3so58048401fa.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319776; x=1690911776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCh4arQEoAGVlLqffis8gz6DC+6MED45nir984gUIUQ=;
        b=PQ1FnbJjLjaGoWzwf2F33Y0C3tEBfHcEvN2HWoRfNDwaI1ifhG6GtADMndJjR5pQdI
         JFvxXSdIf0dQuwgEDYst+OXflTzcJxkYKnbL7qRP9BnDy4zuo53QyPlEsRBzqRCa6Ngb
         G+VTr65TMn0mZTT7alcG7kc8gff8BgORDiLdZAA+xveLFCAflYSDNtaDX5H7920m/Fli
         9ry3jsRNrHoyXhfLQtMVn/Q3nUwYW1WDaOjQOLaS88I40BgROhAnUvxztleNxD/NjFbC
         9Ynl6nml5sM14HS4z3FIuFHDzZ8tKsTf0oIO2rx3IIyv+gGaiCKh0FIXKi9ViXKHss7C
         IxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319776; x=1690911776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCh4arQEoAGVlLqffis8gz6DC+6MED45nir984gUIUQ=;
        b=bZImOWgFxDfmBKF7ZwEPJ/HdLZo5BAss9aBeAbHIZHsgjj+jYiRP2kio0EhFHks6ZJ
         2pmbJsAZ456Us9bjq9kGEl3vLa8NsDi+T6Y/2vRkEgtAxCKhW1mwxzt4gjqPStiBA3XZ
         t7Y1wRm1PNDNTAH5T5bftnoLf+fdSQ6rGduPjPDGx9JxBAaJrZP1IOpbwykYMa4BrADh
         NTI9XUzAssRyZENnwIgUA9mOlQPaVX4B2AzgZF/ADGx/1vET1S/RSa8WMl46k/Z+DzO8
         2N1RkzdklWieJ1dWM0Y+SLovnFQWYLlvrt6VXG5ImsYfkX4WxaZtx+IYeja7SVvpISxs
         r5Lw==
X-Gm-Message-State: ABy/qLYD7DFzAqcBUM4I6+HgVuP15zwwva4EgHZwGtiX22DzT5Qn1OnZ
        qRVsYecQADkScj6mI4lZicQk6Q==
X-Google-Smtp-Source: APBJJlFDcwAmruS884tyDGFT0vYCrRcYNt7EFXMAe5PudAjTsvGuBqyep/iXsKW+rwXIskmvVCDyUw==
X-Received: by 2002:a2e:8955:0:b0:2b6:9b2e:e352 with SMTP id b21-20020a2e8955000000b002b69b2ee352mr5398196ljk.9.1688319776256;
        Sun, 02 Jul 2023 10:42:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:55 -0700 (PDT)
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
Subject: [PATCH v3 09/28] cpufreq: qcom-nvmem: create L2 cache device
Date:   Sun,  2 Jul 2023 20:42:27 +0300
Message-Id: <20230702174246.121656-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Scaling the frequencies on some of Qualcomm Krait platforms (e.g.
APQ8064) also requires scaling of the L2 cache frequency. As the
l2-cache device node is places under /cpus/ path, it is not created by
default by the OF code. Create corresponding device here.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index a88b6fe5db50..ab78ef1531d0 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -380,6 +380,7 @@ static int __init qcom_cpufreq_init(void)
 {
 	struct device_node *np = of_find_node_by_path("/");
 	const struct of_device_id *match;
+	unsigned int cpu;
 	int ret;
 
 	if (!np)
@@ -390,6 +391,25 @@ static int __init qcom_cpufreq_init(void)
 	if (!match)
 		return -ENODEV;
 
+	for_each_possible_cpu(cpu) {
+		struct device *dev = get_cpu_device(cpu);
+		struct device_node *cache;
+		struct platform_device *pdev;
+
+		cache = of_find_next_cache_node(dev->of_node);
+		if (!cache)
+			continue;
+
+		if (of_device_is_compatible(cache, "qcom,krait-l2-cache")) {
+			pdev = of_platform_device_create(cache, NULL, NULL);
+			if (IS_ERR(pdev))
+				pr_err("%s: %pe, failed to create L2 cache node\n", __func__, pdev);
+			/* the error is not fatal */
+		}
+
+		of_node_put(cache);
+	}
+
 	ret = platform_driver_register(&qcom_cpufreq_driver);
 	if (unlikely(ret < 0))
 		return ret;
-- 
2.39.2

