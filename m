Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A5C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Mar 2022 14:39:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351084AbiCXOlP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Mar 2022 10:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351109AbiCXOlP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Mar 2022 10:41:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4147C5C371
        for <linux-clk@vger.kernel.org>; Thu, 24 Mar 2022 07:39:42 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n35so2843323wms.5
        for <linux-clk@vger.kernel.org>; Thu, 24 Mar 2022 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yuX9u5ic7NYyoUUkYeHSUuK8umCvOBjLstYMGoYWvr4=;
        b=g1sB5B/7wd0ibbAj2gulvKlRbRrGzUE4BmMu8K/X/ZjDNtCjj7RTKgucDZbzsoeeXn
         ZWdsC4WxBD/YLiebuvaV1XiJS/g+3CkEFeVmUJ/eqeBx438WjD7L/0Veitv63ixKdu38
         d3LMYGex9GnO7eccdvJDhv3J/3UvYSZf+f92jJb0QXca7vGDyPdcFQv1YKUG/FFqtqbC
         xkViGbC1Jp3xUhaQfnbGI96e2Q2OX/Q3+69AWvV1QNwCaHHnmxfdYJEaJEnTAvX1K7oT
         +YhzhTrOuUInXL0fRAmlSG+SBOr1KHzMuSQSedq7qlE2cPrhjOe2n2uTVa4cjNX7YtSu
         3JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yuX9u5ic7NYyoUUkYeHSUuK8umCvOBjLstYMGoYWvr4=;
        b=64w1vfwRxYlJ024iG9KH3cax0cPUQAgNvvnrvNqxoyZLY942iLi5e4ecWF3U2WbYPt
         f5W4W4SiVmx8wU9wQS1iiD6GUdGtsYWtMzsS5AGmUKGW770UMk+QkTZviSA4Ie5dOlZP
         krpDeLCCO1OKUSnGklYjk6m/fG3ArJlcCB//GcRo1lB1p/z1wiU5jJlV60eLlO9ec0TE
         caDdzSqxRisQ/V5by1BMi9AXqiO6DjdChywJoNb5Y97ONey4ChXEckaOdWc9QNmvMEp5
         c5mt1eEofka4ql4O44YbGhj6LmFBj/VBs06SmMQW3gFiMEHG7PKswFtItiif+1DEiaEC
         iYeg==
X-Gm-Message-State: AOAM53273a+LMImn/HUW/8KbrzJMGEP9vJR92jH0ryb+HtGychloHL8Y
        cRODivBrn9FZp6im2G7GkLFrpA==
X-Google-Smtp-Source: ABdhPJwwutAFQH46sr/Eifshdz0kv/5F3hT4G3rOQl2zfBYrq9a7wGb9kXNA8/sONUK2ruMxMETdAA==
X-Received: by 2002:a1c:7313:0:b0:38c:8690:1f30 with SMTP id d19-20020a1c7313000000b0038c86901f30mr14890199wmb.188.1648132780856;
        Thu, 24 Mar 2022 07:39:40 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a1-20020a056000188100b002041a652dfdsm3075745wri.25.2022.03.24.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 07:39:40 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: clock: qcom: prevent interpret of See also: as keyword
Date:   Thu, 24 Mar 2022 14:39:35 +0000
Message-Id: <20220324143935.1117426-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The "See also:" in description generates a DT check error since it is
interpreted as a field. Setting description as formatted description fix
that.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 4dc0274dbd6b..6c45e0f85494 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Stephen Boyd <sboyd@kernel.org>
   - Taniya Das <tdas@codeaurora.org>
 
-description:
+description: |
   Qualcomm global clock control module which supports the clocks, resets and
   power domains.
 
-- 
2.34.1

