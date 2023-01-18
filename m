Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE105C38159
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 13:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjARNw3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjARNvk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 08:51:40 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C1F2A9A8
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:22:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id vw16so20043559ejc.12
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=mdlQpnPf+uKgvSYoCCHJ/a33KtYz7Y/Z91Keh7J1dVduTh+DVWviEa7bfa+49wHu6U
         XjrdGvOWaikxGOrenkW4klkxNFQaO6IW6f7MjBG6/680yL+aBU6J9nCD00cV08qFTA46
         DqL0eqKskZkO+mYgQLtns5Vn/bX1CpirCtj1frA+wuOFVqUyBWyXaLYJTSs//0wIiZax
         g8QBmppPDRSTF2WGTaulWHljkIBxB/gg3lKrtd1bxx2LLXx0kbycZw5WQg6pyE8grr6J
         iHGs9kQZtpanuG7WPuIj9c8YBKcwcI6pI9budQ8ntLeJ6WoQMvuY/234Vz0Bwg+YZ9YS
         6O4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQXELW2Do44btByeSJJTILU+sMVZVBVp+PBgWqh0iPQ=;
        b=7QWoofrRJ1cTHMkW744P9v0zagwp11sYilrCL5Q7Y+5f4eY7cjTdZgWvFy1N0sR1ro
         5UAwOCsttayiUotegimLaXj10qnhbi1jI1qd+SPkI0QrpTGjPqoBZ36O2vOos7Gt+2OF
         WA8qjPWZLiAV/hyy+bo10wIFyan0BDPxJy+8CS7icxQvNUbZq15HnZTExabrioCP8u7B
         hBQog+BLYctN5fFyX0aYn0uR6fEWbVMK9mAwAYR+zoTpUz0jBTdeAda/Z2cxnVNSGNj/
         vvATT+FL0zxVYmEs/KeJMxGSV75t6S8nVjAagMnt4+/IsQ2OJoaAzhmpEo9nU5DA2URI
         KTuA==
X-Gm-Message-State: AFqh2kqeS6XAUszB91bHrD1cUqG7vvk/sEd69Skm992fvEMUJ60gXuBw
        wlzCZJir4t/6jNOzIRsfd49BcQ==
X-Google-Smtp-Source: AMrXdXu5CSOCJza++NFweL6KpfKXKYInRWlUyYp9fYiDkiK6c0iahxTAEyYET9kPGEz0jBuXBSRamA==
X-Received: by 2002:a17:907:2135:b0:86f:fe8a:be with SMTP id qo21-20020a170907213500b0086ffe8a00bemr6880577ejb.4.1674048177546;
        Wed, 18 Jan 2023 05:22:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:22:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/7] dt-bindings: mailbox: qcom: add SDX55 compatible
Date:   Wed, 18 Jan 2023 15:22:48 +0200
Message-Id: <20230118132254.2356209-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The commit 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55
APCS") added SDX55 compatible string to one of clock-selection
conditions, but failed to add one to the main schema's compatible list.
Fix this omission.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..36deddca1524 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8953-apcs-kpss-global
               - qcom,msm8994-apcs-kpss-global
               - qcom,qcs404-apcs-apps-global
+              - qcom,sdx55-apcs-gcc
           - const: syscon
   reg:
     maxItems: 1
-- 
2.39.0

