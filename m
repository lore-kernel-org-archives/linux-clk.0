Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E77C433FE
	for <linux-clk@archiver.kernel.org>; Wed,  6 Apr 2022 05:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbiDFFn5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Apr 2022 01:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1851332AbiDFDDQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Apr 2022 23:03:16 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A5923BED
        for <linux-clk@vger.kernel.org>; Tue,  5 Apr 2022 16:59:15 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a30so1040815ljq.13
        for <linux-clk@vger.kernel.org>; Tue, 05 Apr 2022 16:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c/JxrbhWAHjw8ckYVJv9DMMKqM3jkzyjVUcpKG0Ot64=;
        b=gaza2oJTKLFw55AclhDk0/Ajbh8SVxqqcz7RXA5284kNNaZd+zz78VoQQLeNAXTfzf
         apiYrA1In7nO1jdEHkJhlN4hkDydpgPsUtBvi+e1KiV9X7XMmJHJRo71Ym10pEw+jY/2
         WUYWLbbSwKje9rLp4XLw1fzGGgMrJlIDgLFVHTqpXgGR5bIYoZNTR0zU0Xth5GNl55Lt
         qUuCbZemsdwDq5KzgcWoE9IaXJHu1gJCZgusgZrgjT06xpW247WgVMF6GkyoaGim1+Er
         cKe22mNTd7vON6v802JQanFyJ5++0kcOqFo3v3hkexjoU1xFlgQOIh1bxptGhmYjMFpc
         2k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c/JxrbhWAHjw8ckYVJv9DMMKqM3jkzyjVUcpKG0Ot64=;
        b=aQNVrBRCplgKztm7t7rldye/aUl6xRQ4ma6pVMYSU3pYwKAxgGYWOejwisjy4erJUN
         oCfbaSKhIoKbmFFfJmqDz5eIZoTcYQkuMLa/svXdqMqxHC7PjWTKUTmknEuTQ6FUMqmx
         Dh9c4vLyN2RLvRY2u8WD2MN+6pSpTICVfy/eHesC/lAeyrHz7OU6bd+gszrSBX6H4Cee
         Vaf0OrkYxg+mzIY00w7lsGk8grnCma8tv8p5IJcufjLAdBPRtgHSL0W3xbsjyU7rtL19
         ffogLYVukZ6C4w1uee1b00F0htKOh9vnlAUJ+RNE+uSM7hiGLzGKd3GqBL0RHN4thpZk
         jcQw==
X-Gm-Message-State: AOAM5305dPf3ObCy8T9G6ZqqriCGD8bKMbjYwkh/PdtxVhiQsc4zoKXj
        7ug9jcwPvvy9yIiUagXNy35J6A==
X-Google-Smtp-Source: ABdhPJwWdHLZp9cwRO5mb+bG5RQ8DC3/RcS13t+LRAGrf5jqQ2VvX4VTZcc5deIUZjy5rCpcfCv6QQ==
X-Received: by 2002:a2e:9ec4:0:b0:24b:115c:aedb with SMTP id h4-20020a2e9ec4000000b0024b115caedbmr3561269ljk.235.1649203153677;
        Tue, 05 Apr 2022 16:59:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w14-20020a0565120b0e00b0044a9b61d2b3sm1646471lfu.221.2022.04.05.16.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 16:59:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/4] thermal/drivers/tsens: add compat string for the qcom,msm8960
Date:   Wed,  6 Apr 2022 02:59:08 +0300
Message-Id: <20220405235910.373107-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
References: <20220405235910.373107-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On apq8064 (msm8960) platforms the tsens device is created manually by
the gcc driver. Prepare the tsens driver for the qcom,msm8960-tsens
device instantiated from the device tree.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 154d3cb19c88..7963ee33bf75 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -979,6 +979,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,msm8939-tsens",
 		.data = &data_8939,
+	}, {
+		.compatible = "qcom,msm8960-tsens",
+		.data = &data_8960,
 	}, {
 		.compatible = "qcom,msm8974-tsens",
 		.data = &data_8974,
-- 
2.35.1

