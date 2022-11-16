Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9858DC43217
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 10:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238949AbiKPK74 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 05:59:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232283AbiKPK7U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 05:59:20 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B8242995
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 02:47:49 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id g12so29013635wrs.10
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 02:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1Tc2RVUxyY/wPgm/kZo/scwJJwqK1LQAAoSgxEFsQQ=;
        b=TugSr+/lSFhtvLU4DEgeUvhD9VO/pYDpQ9Ln9qc09Uq5x7F6tjqQyujNhxnOUG0pr1
         QyoUXtRe46H2Lfg9KoX1UvW3wv3aMkZHaCBUgICdDECMNpmJbWZ6b3gjFNOrvN1tQKYE
         s6Vppsl9tga0X2ULd9h7SHVGFRRTRAJtDXelQVc3TuXqhQHt499HMV/KyVf16RHw2mzr
         vbdBMIC1Msb6e6EPVeeW6uq7KHJVkdze0J4CTndUWTr4UAgztPA2ciCBV6iNJRrK31qk
         7jVS6wHOMekMCbUir4Qk+exCpzLD22oGAdAaIRvUlHUr6Agw5x0VS5efIQnQHvJcjov4
         gZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1Tc2RVUxyY/wPgm/kZo/scwJJwqK1LQAAoSgxEFsQQ=;
        b=qmojbqnw7PQcJC5GPXXOhMx9TNLyGkwOeSCiockIpZwD+315UnX2m9JhjLHbtPVzCn
         IpTHwmja9tyrHkjSOEStnWq2NejLfe+PWY5uWVskmD2d4okIFtYXicHeeqY/UmExfQGG
         LKtBkIPrM7PiYtHXkzLp7I/VcbitJBJkI3iXIIbCRQoa5Cq8S7AZz9dwtDFVNjfPfPYw
         Dy/nbc+rtFYx4efR0tDOqOWGYqTqMtoXyFHG1s4vlTgmMBihtqTLWQeRnQLIWAbVPAUo
         tG2+zp9vQuwK3Wa7A6JlT1nF0CGA0mFZ7EAvc5wD2CV0FspmO3venIpPUY43xvwhhtwV
         yS9g==
X-Gm-Message-State: ANoB5pme6TP8ZsBcFcyteqwOELQLRHQ7h3RbGGHU/eTDcb5OA4cCeRcK
        ZphHNGMDH2k5ek3S+JHGWkx4Dw==
X-Google-Smtp-Source: AA0mqf4FoEk+dNIahXYw8o4NPh8WPEnrSdSxaX8yD9XOLE1b0DUkQD+a8Uf72Rhpwec1HuThqd2RjQ==
X-Received: by 2002:a5d:6e55:0:b0:23a:239b:7e73 with SMTP id j21-20020a5d6e55000000b0023a239b7e73mr13326846wrz.233.1668595667673;
        Wed, 16 Nov 2022 02:47:47 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b3-20020adff903000000b002366fb99cdasm14674206wrr.50.2022.11.16.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:47:47 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 6/9] dt-bindings: clock: qcom,rpmh: Add CXO PAD clock IDs
Date:   Wed, 16 Nov 2022 12:47:13 +0200
Message-Id: <20221116104716.2583320-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116104716.2583320-1-abel.vesa@linaro.org>
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SM8550 has a new fixed divider as child clock of CXO
called CXO_PAD, so add IDs for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 include/dt-bindings/clock/qcom,rpmh.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..f3e0288420ce 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_CXO_PAD_CLK			27
+#define RPMH_CXO_PAD_CLK_A			28
 
 #endif
-- 
2.34.1

