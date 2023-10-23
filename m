Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334E3C00A8F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Oct 2023 10:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjJWKW4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 06:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjJWKWy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 06:22:54 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7492BD6E
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:52 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40907b82ab9so1494585e9.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 03:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698056571; x=1698661371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pww7da1n7UWS02L2LkSYEEM6OsT/YObeILUz4Nv4Nyo=;
        b=Zg1PMzYSY/svIeo1uSb0GBD5CVAGdmQ3IvbbI7HUGWnQbWtwscgLGpPJ/zgrdWv+sV
         tfPBRQBTFTBHpfQcUWgGQcaLydfbPwhNrkTqF8KG9ZstcnmD+Uuwu1r0Za6dp5Ez4Q1v
         oWkmRNvMNu4+LxeHmXxvPrKZlWa9UYK9ausu8lAcEfumSaR9LuzOYiYdbJSCzyafo7uR
         MdHs6yF3z7JKhk0WxyN9SvLFx6tkXozwjyC3dSD1jp1yN8d4JhR2OXN0nUuze+y+aQdG
         bozQ/Q7ltCmwda4+b0nryhPC7GHli4+BURsbJy10uKe2Xgd06j9h+TZndOhnKR9IMcns
         vLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698056571; x=1698661371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pww7da1n7UWS02L2LkSYEEM6OsT/YObeILUz4Nv4Nyo=;
        b=PfAJjKTPPMy7hyRs4dBo81tEwepz1wqrAv3tRrIRxwSnWXCgvEnCBpIQvMvHPd6+e3
         iPCEmGKa4ChxVS49Knd1hkSz5fyZCjQ3yF4GbFh2IM04l7WAWRz/1GyFVNGjYoE//OyH
         jUoKQkBVlRjhecwuWgohhPDECSQ6QIp0zyGAkVnpFHpWnXeXXXAKVzlKLnwXXigRd4zG
         cs8JqKNoAkIEAG6TbcEXJFocINiOEsZ/5el+kxqdpM5OtX0qCv8Wi3coWomjf+gb905y
         sqiveNSIujmkxDXGbi0l4CxFHjaurOEBi/zl6VHpzXxCDIQ7TJwsMWKcwCkrKgbYCXHT
         bqRg==
X-Gm-Message-State: AOJu0YzKJ21jU48+jyJhqyNiKcX2APToVFkMz/eLapvi+0jAI3pGKKLm
        6hR41c4AaxyX+7D1ZpA5CEH+yg==
X-Google-Smtp-Source: AGHT+IHG+ByNpckXdtbAjkLS73leG1MuuYY26azOQjkLbervqzdsRg3e+b+9MLQ7/FEaNzlIse/tiw==
X-Received: by 2002:a05:600c:4fc6:b0:405:19dd:ad82 with SMTP id o6-20020a05600c4fc600b0040519ddad82mr8563116wmq.16.1698056570768;
        Mon, 23 Oct 2023 03:22:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm13593275wmf.5.2023.10.23.03.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:22:50 -0700 (PDT)
From:   Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To:     tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        geert+renesas@glider.be, magnus.damm@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/7] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: document RZ/G3S
Date:   Mon, 23 Oct 2023 13:22:17 +0300
Message-Id: <20231023102223.1309614-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231023102223.1309614-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document RZ/G3S (R9108G045) interrupt controller. This has few extra
functionalities compared with RZ/G2UL but the already existing driver
could still be used.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 .../bindings/interrupt-controller/renesas,rzg2l-irqc.yaml    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index 2ef3081eaaf3..d3b5aec0a3f7 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043u-irqc   # RZ/G2UL
           - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
           - renesas,r9a07g054-irqc    # RZ/V2L
+          - renesas,r9a08g045-irqc    # RZ/G3S
       - const: renesas,rzg2l-irqc
 
   '#interrupt-cells':
@@ -167,7 +168,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a07g043u-irqc
+            enum:
+              - renesas,r9a07g043u-irqc
+              - renesas,r9a08g045-irqc
     then:
       properties:
         interrupts:
-- 
2.39.2

