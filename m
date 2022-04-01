Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30054C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Apr 2022 15:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345070AbiDAP4S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Apr 2022 11:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349947AbiDAPQk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Apr 2022 11:16:40 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFDC39BBA
        for <linux-clk@vger.kernel.org>; Fri,  1 Apr 2022 07:58:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a1so4616342wrh.10
        for <linux-clk@vger.kernel.org>; Fri, 01 Apr 2022 07:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ICeNYWa2Lu8MC4Yz+R4SAQRJBRHRTm1TYs96sZ9kNyc=;
        b=ebPjWiuajvdUO0CovP7ziagVo1cBG6ynbEdtJ9TwK+Ai5vXtgkIftvEib2Zi0MZNJJ
         Y0retZHoniG6FmRwBBuVvXKI2VVB2IO2JZ4fk1O5TW941s23XBjB3+X8Tld8HkzfbVWq
         kOXNee+vDaBX2ylx6olaxAz1wP+MOtovAC9UexyVe32kQ7T355lUquHKxuk4WXXpxZO4
         /ZyHaLKssQtWz9mvjz7oCqjuuOZzqZgbt3qe2b1qDs0ocqFYj8uM4Vm4krLtXn25du8X
         r2UfV3GKJGu3yXMFJsNVwHKt6drobF/7XW+1zkOpRtzn564uu0S8Tvlyfd3mBgM5pUJ5
         iIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ICeNYWa2Lu8MC4Yz+R4SAQRJBRHRTm1TYs96sZ9kNyc=;
        b=XY0Q31UZvWK0OU7InlhnAIIpng0AekJQfTA1r01R8Qe8bOuQAL76RzxTpD31TQaxA4
         I5L62jDvoRIYI2dW+UChUUpMjrTBdkPqDE5OvarU21jP2doaa2ggo/KOgO1pP9w36Hsu
         v0sFu1Zd4AA4btQD7f0zGRzVUIQtDCazX+8I8IT5P+QucD9yoZodu9Q6jI0Mge03IZBo
         a9/LWlnx6u5fsLjoRKh+ImeX2x3qlYisFaKTlqFgnqUyPZciYt0xhV5GDdg607im8TR4
         xOachvQbSO5dswhEAZGFA6ch8snvokqkepFtycrK0UhKL3zlrbt+tcs3mqwontf0cNMb
         3xjw==
X-Gm-Message-State: AOAM530OMBQpT12TVmSdwr+ozF9ltuNgB6oDNrWQZIkjGnP2h2aiBWW9
        jNiUv+RZgPkh/vddgMEF5+lrCg==
X-Google-Smtp-Source: ABdhPJw+xy1DDvUDde0B9+44fl6cDuv49xHXyxQV9kuD+BTp4u3uSkrp32L1vOH8RhMpaqHPA0hXSg==
X-Received: by 2002:adf:d1cc:0:b0:203:e857:85b4 with SMTP id b12-20020adfd1cc000000b00203e85785b4mr7817426wrd.666.1648825106657;
        Fri, 01 Apr 2022 07:58:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c404800b0038cc9c7670bsm8530722wmm.3.2022.04.01.07.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 07:58:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 1/4] dt-bindings: clock: qcom,gcc-sdm845: add parent power domain
Date:   Fri,  1 Apr 2022 16:58:17 +0200
Message-Id: <20220401145820.1003826-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
References: <20220401145820.1003826-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow Qualcomm GCC to register its parent power domain (e.g. RPMHPD) to
properly pass performance state from children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index d902f137ab17..5fe1b2c42d5a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -43,6 +43,9 @@ properties:
   '#reset-cells':
     const: 1
 
+  powert-domains:
+    maxItems: 1
+
   '#power-domain-cells':
     const: 1
 
-- 
2.32.0

