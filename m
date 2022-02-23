Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DB5C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 04:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235885AbiBWEnn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 23:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbiBWEnn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 23:43:43 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93581527DB
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 20:43:16 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so20734417ooi.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qruHXlRoqxs4+A7Z/lv06mLaqKtVlNGxttTstRQX1hg=;
        b=ISeOZQlB0FBgBaqDLCT4cl6VnZJABhXAMOxhyE05ncBsuMrHV47NTOIXFB7EHwHQ9Y
         TEUf3dYSpZa30seLhVIn7vhGW1ROnlEA2JSb0KFZ5sNZpiw1O58ff7yMkvfOBFC0rBdd
         gis+4EHxWGXthBMzryOd48ebLa2LQfflngCnJuXLGrQ1mSJgTYiMxuBA9h0091F/q7eM
         yV3TBsfr31KRS3Fk3v2hwMS814eUN3e17cZGvC9Wrng8ktGhIGFpiHAqd64ZCUi//wgU
         p/87GlZc0LOAsYqVR9/5/YdWUDWtWpZF781Z4qeT9KnQgGS9iwV9Qs46GBtAfoz+eCBL
         be+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qruHXlRoqxs4+A7Z/lv06mLaqKtVlNGxttTstRQX1hg=;
        b=rI5OR5dVCKnLgrMPI0WmWw9O045RO4gwlQb0b4EKp8z0rNmV3mrg4ql1RG2mvrtpDA
         llpJTC6C91++fx8187WpLDjtkrDUvR1v1jtf4LnIeoS1/t1HGlRPt4333J4zOYmAA2+t
         ZKWY1aL94P+JuntsOmvdyxeuI9mZRpsU/ytO7Di3WZhqOoFWl0l8prNvROzXplUS1ZW/
         W3le5EQwSnRxC30YCSlKDxGF/xv5tx94gdoQjkvoVV7f7uyHj7wGSWuc/jV6zJfaThPE
         DN6/pvVxZ08i2PenKqc+UfMVosvcIZ4qLxRXDmctCrifEekAS4XeZhQAXXg7fxTLPo64
         +Ywg==
X-Gm-Message-State: AOAM531fk8ord7KoFoMG3bfQLfDSYDR/elvFS/MDZq+GiGAsPivEiy26
        RoPsQqFJK4co8w6NROfC1qhlVg==
X-Google-Smtp-Source: ABdhPJx0yjVa5DlqBTrdD3SPtFWf1XrEfBfwWEBc6yO3DINlryP83xOT9gltvKhIBRtr8NYnhgdddA==
X-Received: by 2002:a05:6870:219b:b0:d0:a3ae:919f with SMTP id l27-20020a056870219b00b000d0a3ae919fmr3138048oae.269.1645591395952;
        Tue, 22 Feb 2022 20:43:15 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i20sm115251ota.71.2022.02.22.20.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 20:43:15 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: Add sc8280xp to the RPMh clock controller binding
Date:   Tue, 22 Feb 2022 20:45:15 -0800
Message-Id: <20220223044516.3776637-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Qualcomm SC8280XP has a RPMh clock controller, so add a compatible
for this to the binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 8406dde17937..8fcaf418f84a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,sc7180-rpmh-clk
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk
+      - qcom,sc8280xp-rpmh-clk
       - qcom,sdm845-rpmh-clk
       - qcom,sdx55-rpmh-clk
       - qcom,sdx65-rpmh-clk
-- 
2.33.1

