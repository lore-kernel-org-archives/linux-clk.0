Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B5DC433ED
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 142C661244
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 14:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348068AbhESOlL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 10:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353978AbhESOky (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 May 2021 10:40:54 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31686C06137D
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:38:59 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id y32so9583754pga.11
        for <linux-clk@vger.kernel.org>; Wed, 19 May 2021 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DJ0dnnuzoeTgYR3s2q2rVPLNWq3NbJZWo1BzkyjqRwk=;
        b=m/uNEaF4R7ZLKlP+RvsBZ6ySpgoBfW9IhsmyZRm+U/pmrvLJqYTNlH3QSTPCpAuSmO
         HLG9idUpUwqxrUXKT8fy3VkUEX4Clg+j1G3F3oRphZT015VY9VW4mDxVLw1jrVWlYLg4
         l+Yepm0Q4PAEDPlaXreWKjyIadN3GS6vP3+6BrriHpX2+2ixo2jfbBrhL5042AdG6fF8
         a92FGRUgwn6+A1ueB6EOLQI3IZ4nehva2+WUXsaFkoyVk8iW9TAFy8Eizfd0fUJ2A1Oy
         LIUny2yugyprMwHK0/YFxCEuIaKXH5+DVXLlawjlVrGyidJURzVQqIPVLtCwx5ZHP9ya
         FBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DJ0dnnuzoeTgYR3s2q2rVPLNWq3NbJZWo1BzkyjqRwk=;
        b=T7leCpcCY6u5pTjGb641As5+/RKDYxgwysnq7DC97JdSsir8kR+KebiAQAPlbEWANK
         2NViMSOl2Jz/Tmh3n2gmffpAJfuZ+kGsKYnwgU67apCS0k7OFhV203RU5njv3qsu37zp
         uCA/hRUjEVqoolobGhO2ujkkEBTYJUnYaP5Xbc4yrW8exe5WBDUvpQ9lmynf72rh6Jif
         hzudHx3sx8189sKZjIHNm87vDzYB+YdUxgvCL74+zyuNThWkw+EtHhYOyiSuYn4J/w2v
         xriniBQ1/E3XU4afIKXrOfFjS2+WCaEQPuY0ytEMyFPYclaxtcCXjtP/3ccyuoU2L8mt
         0oLA==
X-Gm-Message-State: AOAM531s68oQQgyJe7PHRDsb7ZWZxB23USgCHUPGmybn/JEFP7VWTw1L
        Q0BFCRTJGCs1X5TvakCcnndBbw==
X-Google-Smtp-Source: ABdhPJyVdhAIfoRX/kxSiK99dNqfNVL0mpMBrPr8LftZML2nuwc6WPF3Q0BOEZM9nkUVY+/3v6Hlcg==
X-Received: by 2002:a65:48c5:: with SMTP id o5mr11326507pgs.101.1621435138781;
        Wed, 19 May 2021 07:38:58 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.135.250])
        by smtp.gmail.com with ESMTPSA id o24sm9239515pgl.55.2021.05.19.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:38:58 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH v3 14/17] crypto: qce: Print a failure msg in case probe() fails
Date:   Wed, 19 May 2021 20:06:57 +0530
Message-Id: <20210519143700.27392-15-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Print a failure message (dev_err) in case the qcom qce crypto
driver probe() fails.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/crypto/qce/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8c3c68ba579e..aecb2cdd79e5 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -300,6 +300,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 err_clks_core:
 	clk_disable_unprepare(qce->core);
 err_out:
+	dev_err(dev, "%s failed : %d\n", __func__, ret);
 	return ret;
 }
 
-- 
2.31.1

