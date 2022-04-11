Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3D6C4167D
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 15:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348172AbiDKPql (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348168AbiDKPqY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 11:46:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3432714
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 08:44:08 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id k23so31736010ejd.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K/VH4iXX/HSvKxY6FnWRf9tFEMBnPZdBMAJ6em5xnqg=;
        b=UGGTSUjSAL9NJgQLtybygrDJb4vXO3cNduQvPayzRK+bZW0CJAg/czgJYYpwUkCkz/
         g2sVarYA4gjU4dM3pX/7gZQJJV0Rf3mP673DCCsOSXT2a5wv0OR+lDBY9UIbgVk5fPEj
         Hmj11yCdw1n7nlh2Iptx3Bjw3oUf27qh5v2nVFKVdT/bcBzwz9jxxJMW1goeUwzgyVa6
         y8+HnYKi19tDgn18Vk6ieukuQVPeLbijXrNeTGVZNoCKcKPqFQbTUD3bGT/6AxqcrEyj
         n/nv/lqpTOcTxkcfHs6oaiA3R65VSov7sb/iBdypQzoO4eb+tGYdvmQt4gF5v0KXsvjD
         Grbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K/VH4iXX/HSvKxY6FnWRf9tFEMBnPZdBMAJ6em5xnqg=;
        b=ozJN34iO2Y/oadMG47+/ynU5nW40zFnFgJbKHzDgYjs+JWS2AlFceOCM0Gf85ORwYb
         Sy1CC2OFveAIJKStme5QgI2SnejBYPYMu4wlhUkm3dWXBrLO3GfvRZMY1kV0N59L41Ba
         b8UDu+Ql9U6yVE0eJplqKdN4RZ+oQjqsxi+GJW4WQHJnkXBnfRMcNJrKrT/ltKIo8qTC
         v9xBPF8c+nntF5ZmuGOz3bRb5zXHaoiJp5piu3yP9UJH7cdO/i4jWq8HzuAaXEz82Vhx
         e5CcZRmet0Q8knA98wlLrIUHEEI4fGDLozpWTgAqjr5EQtzuujmeG4QsV1xXWHXaV5Zs
         2m0w==
X-Gm-Message-State: AOAM532GmJaWg+kw7U/CQaBc7H3Q7FEt9NUMy/hTWGFyX+ENI0U2s2Cy
        cUM352aM121rRLL2yBMNePkryX7q1n/Cpf7F
X-Google-Smtp-Source: ABdhPJyyTzBko5kSxEeXxWHuBtOf1c1YnoIFTwVmCQmEzWG+0S2JVR3bspyNTYSGSf/bPjPbl7Ff2Q==
X-Received: by 2002:a17:907:7ea3:b0:6e8:92eb:3dcc with SMTP id qb35-20020a1709077ea300b006e892eb3dccmr5019092ejc.75.1649691846674;
        Mon, 11 Apr 2022 08:44:06 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906608e00b006d1455acc62sm12173177ejj.74.2022.04.11.08.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 08:44:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH v2 2/6] dt-bindings: opp: accept array of frequencies
Date:   Mon, 11 Apr 2022 17:43:43 +0200
Message-Id: <20220411154347.491396-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
References: <20220411154347.491396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Devices might need to control several clocks when scaling the frequency
and voltage.  Allow passing array of clock frequencies, similarly to the
voltages.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/opp/opp-v2-base.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
index 76c8acd981b3..1d7216008f95 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
@@ -50,6 +50,14 @@ patternProperties:
           property to uniquely identify the OPP nodes exists. Devices like power
           domains must have another (implementation dependent) property.
 
+          This can be also an array of frequencies for each clock provided to the
+          device.  In such case value of 0 means the clock frequency should not
+          be configured for given clock.
+        minItems: 1
+        maxItems: 16
+        items:
+          maxItems: 1
+
       opp-microvolt:
         description: |
           Voltage for the OPP
-- 
2.32.0

