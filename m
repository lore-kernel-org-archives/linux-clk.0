Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C35DE9271B
	for <linux-clk@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbjJEQE5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236886AbjJEQDg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 12:03:36 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58B285DBF
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 08:57:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32799639a2aso1153316f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521445; x=1697126245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJY5YzgjF6JlKZ8w8bEEVJWVaD5OM94gHSjpC6e/tYU=;
        b=NZJtyAUmqCnPHXpOwrhYGZpGfzxJOiYvHXFpRUCEHQdWEjCLogFfV9F7v7NcT2RlkU
         u9ozCQxwMSmOoMygxK5UwogrRjtBfQQa5pVq6LASjv3fqT3XRQ1ojOVLtifl4w1HhEgO
         kvQvFWgOnGei3Wqb0xrZU+keHscXL9w3wjS+P5lPiq93/eurG1sCep8/jijzH+lS6Xmz
         flhRovigTT8duxbceUvFiq2aOpq3Cr2OocveK5AJm/QEtciOWHo/Ms0tzziJD+0Han46
         ZaoNRbgPTyVoIEKPY0b/yWpLf8jEG3erJJdjUbFbDXE9TfGXXruupDjATFHM7/YxqZcW
         Uq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521445; x=1697126245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJY5YzgjF6JlKZ8w8bEEVJWVaD5OM94gHSjpC6e/tYU=;
        b=stjdCEZRwamRzKb0U24oV+gWH2z16OqwqABrZF1fC/MOKol7t+RoeoEATyb3/tu5K8
         W4RiA4X+yks/DAcMNQ3Qf3m0JlssxQb2GvSIsihi3LIm3lwZm8eW3GFJhdObxsQCb5OG
         I/kz0e1WzM6m8gx61YWW4D2dGcYhHzNHyx9ey43rlZc2xpCutq2SB2mBGVYMdMFtOZ0v
         a7PFFHHPypU+iilUH0Oad8ThbchxOWMDbnBTezVbORRnaD4tBpDnXL3sgDfhUzXMS6l2
         vKgL/L0fbqxvJoCvBGvot0lRpxxbGX1ApmMCqJARxneMy/RdCAzYbdkKfwGcU0wivI6q
         JZ2g==
X-Gm-Message-State: AOJu0YwfVDWHmdcNcEd8yQ7r2iyMr95pYcS0J/9rAk+dk0lGc3vzfGDm
        vefdxk5JwBEP4r4vBngTpH18RA==
X-Google-Smtp-Source: AGHT+IGiE4LAahvWXJtk7tI8KG5YKIIkGsBVrQ6crOBhLdNhWbs7O377srtrTm+hbZwXS/xfBg4ukg==
X-Received: by 2002:a5d:5912:0:b0:31f:f11b:8b68 with SMTP id v18-20020a5d5912000000b0031ff11b8b68mr4581645wrd.71.1696521445200;
        Thu, 05 Oct 2023 08:57:25 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:24 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 04/21] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date:   Thu,  5 Oct 2023 16:56:01 +0100
Message-ID: <20231005155618.700312-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..02f580d6489b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -50,6 +50,13 @@ properties:
               - samsung,exynosautov9-peric1-sysreg
           - const: samsung,exynosautov9-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: google,gs101-sysreg
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.42.0.582.g8ccd20d70d-goog

