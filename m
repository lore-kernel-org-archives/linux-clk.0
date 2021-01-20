Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B3EC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 00:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23BD123772
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 00:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAUA3l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 19:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403762AbhATXSy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2021 18:18:54 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85F8C06179B
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 14:37:33 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id f132so24351oib.12
        for <linux-clk@vger.kernel.org>; Wed, 20 Jan 2021 14:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QlobmqniGcNLDZStrX8yR0AATJKukz2SeJVeBU/abQ=;
        b=ZCB38np/civ6i0PE8ZZ8KFrurMep/cxsH2jm1K1Rz3GrtdyW+AdclDO2UIZShEzp+6
         LqSnUXDCz/gl8bBVV/gsvSXBSfAsQPha9RKkrabOHOezOPUhkQxrRE1EMkz14X5tqKl4
         TU4+nWWZJRwOr4L9qQR7mwoLliUSgy+7M86j7NhV0h6ZDeCJQQqELazp/VnMKDtzSpI3
         m5+AVw0foHB04i0dBrppp6AsXXoQjrzC4iJMYQeXAu6jc4jofo8sSOFRTBwsRlLQQpc9
         A0RQokIr6fgFpWSful0hAq+eqRjpMMKByRUCm0Ha/9e/9mbLEcmSTQw/9eYtnzITt6jC
         BsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QlobmqniGcNLDZStrX8yR0AATJKukz2SeJVeBU/abQ=;
        b=lo12pesUs67Wv1ax862e2i9+ekR9Ex69TYcFiP4l0grVexX79cY4w6YhDL5u+GByr2
         /IIiE0SQ9AjMnis+v7p/F+76arVwDYjzu3g5GYlcZLuK5X1Pn0km4VqR3BT0ch1MSHPA
         79AKBMNEDar4LS4TbfTjGevgiaPjBU9Sg1jzLyeFTS9tmi/GRuORQnDfdzlw06C8+EcX
         3OlBmpOo17Jl2YZcQzPC8N9SghsVxSuFPnkpfvw2NanxMCpaEv6H8ecmjQnrndjqsw+F
         WGXhlB60S73BCb+49avtWmMyt8sP3y2SAW1L1KR9XJLCYskJgDytSfpbB8dPEPHYzCZs
         tVrQ==
X-Gm-Message-State: AOAM532I1g/V5JcIsVfN7i+Wo3GeJRQm7BJKb8RD6ZyHy1eol+XIDTAx
        GUkIqtwI3nvxvPAAWCxYaGhjFg==
X-Google-Smtp-Source: ABdhPJwCsecR2YD/TrzVI95JD6+pMNSPOtjOi/sbseb9A4bVw9/6/23amg9Sl8Zj2A+TZcBocWhCyw==
X-Received: by 2002:aca:180b:: with SMTP id h11mr4310484oih.18.1611182253422;
        Wed, 20 Jan 2021 14:37:33 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j9sm614894ooq.1.2021.01.20.14.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:37:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom: rpmhcc: Add sc8180x rpmh clocks
Date:   Wed, 20 Jan 2021 14:37:40 -0800
Message-Id: <20210120223741.1610344-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add Qualcomm SC8180x to the list of compatibles for the RPMHCC binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 12c9cbc0ebf9..167b018effcc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-rpmh-clk
+      - qcom,sc8180x-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
       - qcom,sm8150-rpmh-clk
-- 
2.29.2

