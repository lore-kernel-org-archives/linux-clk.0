Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA85CC43217
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 20:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235802AbiBOURE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 15:17:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbiBOURB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 15:17:01 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61F2EB17B
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 12:15:43 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id n24so142860ljj.10
        for <linux-clk@vger.kernel.org>; Tue, 15 Feb 2022 12:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9NbJtEvv0ukMJBaopDs5ubGBPdRqOGbN+OGXiRZPTY=;
        b=MPqP9JnBGs3iOr+qashv95B4yvxgsK2DsKqkPCvh3mgaz72zoU9ki8uYx7p08a5aHA
         eNTfHpMYgDEesp1q1G/M2IYVfgeevtYKDxA8c6zCLN7Km8DeiXk0Xxj7EKJeMFRrQV3F
         gIPlI/KdWYQoCsKbVTVjL+aRF0dsfvropn+lH/QsDdM70FD/yVNtiv8KPL3YM9ypvI8M
         3QD+uKrfDRlK3GMH0jk+6IgGOXrFs4eczTbyYEFOAwq4+fO9H76Z8RAJLilQ/T40Bu9w
         O5QPsz9brHqJS7RK0P1FNQAKTouDpHEpJwIF/70EAAJa6PPvE2BS2U+rTKyamjHJTMvC
         vHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9NbJtEvv0ukMJBaopDs5ubGBPdRqOGbN+OGXiRZPTY=;
        b=wLYDIESoX+8JWHpSYylkAdCDRkT0gIypyH8phFXmK5We+PLqfphdxS+X2WtTuaDdbz
         bdw99Or0UdgNEsRLhjbM1vNVilY1Q5SmWofzO/SrUVpzUoXv7qDHUy8Y/h+bTPfgrgve
         zpuSDawZB/yrPzS/yd15KgRlzpyaPs0gGMRZzjcIZkM2th2v3egJB3rrlW0f5mROZUZ5
         afZlPy0/D1llWBk8pvQmkqTYFnX2h6fjqxm4RHG/ER7q2y8IYAfOnf8WVdzbx/9OGp68
         zjIuM+M1XbQRybskTyo9/y5tOuofIqGOfHPM5WT0LYKYEm/5r9rA3LASLocXHd1FaLPR
         GtHw==
X-Gm-Message-State: AOAM530JWKfq2/afum1+isRcDtzNEMdr6D3Tvq77VtNfS6A47Sv1ZhTZ
        gSnHUxvZUuHqExyBvx7RQGlg9Q==
X-Google-Smtp-Source: ABdhPJxaRI/+wZH1B7MIjCeyOlSNzv2Yf30wRAMvNNzhlVclgrEwkjKIEQjWYAOE2oypjLfsX7qZWw==
X-Received: by 2002:a2e:9c04:: with SMTP id s4mr494486lji.431.1644956142095;
        Tue, 15 Feb 2022 12:15:42 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm4548419ljg.111.2022.02.15.12.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 12:15:41 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: clocks: qcom,sdm845-camcc: add clocks/clock-names
Date:   Tue, 15 Feb 2022 23:15:36 +0300
Message-Id: <20220215201539.3970459-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
References: <20220215201539.3970459-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The driver can parse bi-tcxo clock from the clocks passed in the device
tree. Specify it in schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index c61314caf692..d4239ccae917 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -56,6 +56,8 @@ examples:
     clock-controller@ad00000 {
       compatible = "qcom,sdm845-camcc";
       reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      clock-names = "bi_tcxo";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-- 
2.34.1

