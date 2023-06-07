Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2E2C7EE23
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 10:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbjFGK6s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 06:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240135AbjFGK5m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 06:57:42 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792AB1FD4
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 03:57:15 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so30642975e9.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 03:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135399; x=1688727399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgHlIp8rd/JoK3Zjsck6JfDJb4jbMhbNb4z71Qp9U50=;
        b=ayjqD12N1ZsunmZ0tHTCvpj62FZC7XZ7/JoYBF0n/d+IDas0ncxLWZyNZ27P7KGH35
         k2ikCN8lYROGcg/RcERXlcgWVQB7t18IiaTXxmzTk0pY+Xej2mH1l9+xTH9Sy8cfgdrA
         /7+GY0kAA0/OytefhHhqVP5l0VqLkVenU6vrDMEe48FFbY8hjSHQHcQ5VoSkwai6H0CT
         FmLD8LQGiQWa3M+7CmKT7sBVCpWilZmoZiLj6ReUw5YA2Mqv4cupBURlBnDDDGDGyjBe
         go/HuAuTiFZt2UGXl0MhF1WSneGVINWapW+MhyPXpV83faFfDHjEaa5TA2Q0CZTuCMIx
         gL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135399; x=1688727399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgHlIp8rd/JoK3Zjsck6JfDJb4jbMhbNb4z71Qp9U50=;
        b=CXaU20nI2F2zxpYK8G9D9GuQOlAu3jiGBwhM6glBY7sPgi/X8WTx/IKyK44wB2rZp9
         GXcYjF9u7LLLmQaiPkj8m6OdX9vPDSZ8K0o8+cEk6rPEDV1gYMrWoswwiVxgeMTWLSgS
         C2LcySZmXfvaXq8D2ZCsgwSNIaNnAax4Yp7yqdvJlsuPSeGz8Xzg00CSBuCTWAZQrA24
         yPSCCTK6Wa8+epQw6uoUweNtXJltgDGOoGNFlU3k5oKUCc1FDazbn2BFNm0qwYPlmp7H
         gj40Ul8qDsPbEyQHOPauYyhPh3ubkZWKwdwb1aK8stJaC46aNJ96jTsMTTFexvEAIRqx
         g6Vg==
X-Gm-Message-State: AC+VfDwsGD59+P7EfriHsAa/ZdxoxGPlCx02wxVXk8oVT+TXOrskASGp
        K8Wfe6KymknaaUxZIFqR8FJ9Cg==
X-Google-Smtp-Source: ACHHUZ70TJJP4SrzSnaCG86sHEDnrTnK9xZg/EAQTAkcqN4pK+IYpDzCj2A9Z/oXOAXYObUpKmjuUA==
X-Received: by 2002:a5d:65d2:0:b0:30a:f1dd:dc55 with SMTP id e18-20020a5d65d2000000b0030af1dddc55mr4380789wrw.53.1686135399201;
        Wed, 07 Jun 2023 03:56:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:38 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 07 Jun 2023 12:56:28 +0200
Subject: [PATCH 17/18] clk: meson: meson8b: move bindings include to main
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-17-9676afa6b22c@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2v1ExfVoRjPSA8nhH9KXi+nhZZijoqLD9hcDzuwzg4E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJVq7uWY2TiwMErdfLhlEha1K68LCCHkbMA7gTs
 zNQFznGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiVQAKCRB33NvayMhJ0dNeD/
 4sg5Kq8ApucjxwUvHYp4Cpyg1G//MJithuQ5VrmaAYkNgw8VJjX5RZE149wz2Tam9Pa5bH115WziNY
 CPya8S1pIG07N4jKl7uQbBudLaAsbwfnrW5cmHe5Pzdm5JhjeqIqusCILVnoWmP8rpM2Ch+mZTpGQS
 dBflwJMCu+RqbOEPxd2pd3Efi1OFkDk7kKKHEQfVqE82P1FjTB8cktP+evFuKzXXR9R1RIARDj1GUF
 /7cB3CnQbPmvASsaKQav6WW85lgI/QiTnnnvPKAMHrbgdZcg6wqBYg/D1zq07U6pcRNiKtFuP1gtWX
 STHU2khMXfY6dT2bFvZxzn86G73l2hJ89gB20v3SJo2kCSKEPbJRWMADEIBba2zhFfqNb2QpdLuIff
 7hVqda8kAIrCTpxKkFws8D3yK7E6ZGag/G8pUGmCa5AZcbPwEneggZH79pbUQ4i5cquyphCoDyvn6R
 8Z6fq4SKIF/bEVkbPfpu1E6gp33XXglbEAyJOYIC70xXFRl71lxmeZyIGf5kdx0VDyjIjSlc1a6WeG
 dNCjioLmVdmLa1/CqcLvqeVx8GbbAUYu3AI/odg/KIJDfhRZEXv7JExZWV48AUb0DVuGx5gRVAGLEA
 5dlZuOeigUlhS2Da+ZqYdiwQl7OJmVtdPB72Ayf8BJvg4NM7UIfAzxuzKhvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Now the clock ids are no more defined in private headers,
cleanup and include the dt-bindings headers from the main
driver file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/meson8b.c | 3 +++
 drivers/clk/meson/meson8b.h | 7 -------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 1e1313991a68..f8fad1118472 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -21,6 +21,9 @@
 #include "clk-pll.h"
 #include "clk-mpll.h"
 
+#include <dt-bindings/clock/meson8b-clkc.h>
+#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
+
 static DEFINE_SPINLOCK(meson_clk_lock);
 
 struct meson8b_clk_reset {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 2a9c4fe29ca2..a5b6e67eeefb 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -77,11 +77,4 @@
 #define HHI_MPLL_CNTL9			0x2A0 /* 0xa8 offset in data sheet */
 #define HHI_MPLL_CNTL10			0x2A4 /* 0xa9 offset in data sheet */
 
-/*
- * include the CLKID and RESETID that have
- * been made part of the stable DT binding
- */
-#include <dt-bindings/clock/meson8b-clkc.h>
-#include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
-
 #endif /* __MESON8B_H */

-- 
2.34.1

