Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3146EB64DD
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jun 2023 16:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbjF3Q3r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jun 2023 12:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbjF3Q3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jun 2023 12:29:40 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226D23C3E
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:30 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-311367a3e12so2428578f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Jun 2023 09:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142568; x=1690734568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzGw3mnXKJmEBxB/ZGH2LxB1IwHqbuKVGACW14o5hFY=;
        b=uH9tw5y+VJ0y+4kgZdqchDXhttOF1TOMBKbn5v348YsV9NtptKzIei9IjxJhTPVWp7
         cEXGg2GjrsoTMRiRq6Ls0JtuNRL++8L9Y1Fus7NWO/K8fVXW1o9f7YatyZhrxAwIou86
         MomcuZeGCm8p1q4GXhaEFecrlib7/gBk4R/mSAQKWrdqCfg3k9O5+Kq88P6lw/ykLeXH
         xBqjX0RgvVwDIs+YMogRHDiFoHulwscWox08w2rE8tA0ZjLQNVnC4Apk+ZIu4waa2ZN/
         ZZAyERVfqe8PdKAjqnulxKhcaxdZeOMT5tk9+Op86IQxS326Djvpj93x8xqyv1hhBvV2
         iGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142568; x=1690734568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzGw3mnXKJmEBxB/ZGH2LxB1IwHqbuKVGACW14o5hFY=;
        b=EE7IhgH+ppKNulfJNGwhtZih/zACjOFzSOBXBrkOR6KRB2FucoiHLeq9tC8yjyw7yx
         NJAz/yCsnT0nC/OcuKnxcra3TSGDilPqczYOWTgZ3lFaiYWmmhruolsE+OBrE87qtOaS
         jKjAuELgNdKTihbaPlf0vgJsGoHjKRFnsKiRjUVGSpsZw4bwQ0bhoWX0dRj1Dq7VENhx
         m2yhoT+rRvH8JJ2o+K07TBDeYwpONxRY1SxA5YT44YK64ZFlMryxM2yJhed+8jpHmcpX
         aQfyec9sEy8uyeqLlRDly0K7Qp89WnM00GvU8eP6s7rRirDj6FAXUNwBb3Nw2ANjguQX
         ZsOQ==
X-Gm-Message-State: ABy/qLYKD2TkgxYGMCa79cTgf/FfBEIH7CEVVaqaPdyE1QvyMowkiI95
        CnQdOMsuwlWMYIlekoQmvSD0/g==
X-Google-Smtp-Source: APBJJlHOw0fHEM8OxVmEe2OQCY4Q0OvnByA6qIxCaA9DEaSsG1TfMf8YEAfqqIa2lQOZIxuTXmGPIg==
X-Received: by 2002:a5d:4e84:0:b0:313:e2c4:7bd1 with SMTP id e4-20020a5d4e84000000b00313e2c47bd1mr2558602wru.42.1688142568645;
        Fri, 30 Jun 2023 09:29:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:28 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 30 Jun 2023 18:29:15 +0200
Subject: [PATCH v6 8/9] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-8-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Nicolas Belin <nbelin@baylibre.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=833;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=fIWufPqpiAaBMP19Qwx5MHQ5YAp+jh4vCf4MBkZNrjM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLdpv72EK7bfEvAqIU+IC8nzuU1qCNC/cegjEsU
 zALrbveJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C3QAKCRB33NvayMhJ0fMrD/
 0TG+O3dy9ys2nlKYIHma1c7yIUAyJQPUGwWlrn5+pEWfoy2pUdZ1o7+vBnXqIZtpF4W8HtuIC9rjQp
 p/0QTVKCOD9uF+QWNe0bGB2vbkOa+kWyPcXsTbnPWDZElztpWriVQ+vUuWhG3sWh5FSCjmVXhwmPCJ
 IPuJX38jaWtRDDiwnq6ABoSLtJ+ivowRg0JrUnSefAMbtH8A5LlwViQAQYwlBhw27zIpgR7fa90kpa
 35IOR5uwkQMDV8renPkAfL17Bz9J+OmM6/BlQ5il3He0Rem6bAYPvEygh1P21nh6w59uwJ7kZqhNSK
 cw/TJi61tc8rL49oozt1cg+mhHOKyrSGsFWKdcgkEpH5VzO5/21rCLDKDFf0Yrh5gMiTlNCuIZp4+4
 64JGt29RIa9C1Px6T6p5LyusoXAcy91n3mTU7n1+ohTPlsyCpDcxEOvQs2zpWVPXbUR8eimau+ApeJ
 DfNMNgu8XNzX5laR/Y4SaIHJLOcJz32T0N2ZagKa5kw1iXVb1BVRmCV+z9fcN78I2WM5U/l8mB1/99
 CKA3Ud6t5ONotbCGtfQip2Gf0nwZziNIO3NPltqk5Y0bMPShc8IdKma9Ote09gMEtKbtTq2zUbmZ+Q
 g12ZIdslv7ox1JHa+zyjNJ0KPExWhftTHGd5ti9DQanOe9sStcj7p+yPRm9A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d59842655c..c237afef5093 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -163,6 +163,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

