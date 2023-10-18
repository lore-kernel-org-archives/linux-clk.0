Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841A0CDB485
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 16:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjJRQTB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjJRQS7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 12:18:59 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3329AFA;
        Wed, 18 Oct 2023 09:18:58 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b2b1af09c5so2923738b6e.0;
        Wed, 18 Oct 2023 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645937; x=1698250737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM+gahaFfhqvyzMw+hLPiLwUYVFl/GwZI4lQvIkPZFg=;
        b=GtdcjuCn+ii8ccKgdn6nAB1C198Rl0WmpB1UZLnD8aIS/KO5FcSWgukKlXi1kWTPgh
         kGqdSkThMrudsaamxq+jKevsCyihe9rmsHYmdATxyGVCevUkKG6/9i8bRUKBjR4EGCwb
         uPT8qPBwe+jThVcB2V50VX0fUAIT3a5VB6m0widCnoWRQKjqP9t51fzCIaN9owhsmsuB
         l6D9/YW9D3YQph9Z66ESoyYSzVr6yjVGf1IuE3Yq0OmEYPoh0w3/DKKW9cMDfRib8gvV
         hkGJMNtt5rpNvQ6qih5Tcg00uEezZOXEn6vq9ehLvwn/5To0ubq8+ZO/bq7JDtG0iRFX
         irLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645937; x=1698250737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hM+gahaFfhqvyzMw+hLPiLwUYVFl/GwZI4lQvIkPZFg=;
        b=Zj+6/XKsgyCCWfrnlagH1PYPMXswCazU5IYF0ub302stSV6DFghipidz8dhu/yFgwM
         dfgVgI1Iz0e3LA1j3pDThsQnYXq7pnx1Zt52vFMDiAGFFNZMtiJ7pCi8QDhFZsUd1Zpz
         PPnxYE5DNWgvM8ZPnMWmEb7hAEskDKGPigVsedUO29Vihzl9g24Ysz4gq8Za8uRS8n38
         08H/rH1oFxtaOoSCCnjTwHBBOCt/czOf93rFPoFSuO3wzEyk/O9ni65PNNXuN/O5P3st
         U2TkWdr8a1PwxSd7dsaOjtwBB73+GrIxqzDubgpXjQ8BlgWgcbKgMmJ8wF7O7vfA7Gtx
         EYNA==
X-Gm-Message-State: AOJu0Yx7D7ZbFBoLeEej54bfCR5d6LB97W4q4vX3Ir7fLZnS/sZy0In3
        zUi0k07Bh/KMZaPFQ0fyqL8=
X-Google-Smtp-Source: AGHT+IH4OYf/H6hu8k3PAsRf3mm4jsjcixitYV7dNNGP1JInDwCe05WxnBR6TBxPI5AC2/tf1wVZoA==
X-Received: by 2002:a05:6808:f8f:b0:3af:b6ea:2e2 with SMTP id o15-20020a0568080f8f00b003afb6ea02e2mr6734005oiw.59.1697645937480;
        Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:18:57 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
        sboyd@kernel.org, mturquette@baylibre.com, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
        heiko@sntech.de, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date:   Wed, 18 Oct 2023 11:18:47 -0500
Message-Id: <20231018161848.346947-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a349bf4da6bc..a6612185a7ff 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -674,6 +674,11 @@ properties:
           - const: powkiddy,rgb30
           - const: rockchip,rk3566
 
+      - description: Powkiddy RK2023
+        items:
+          - const: powkiddy,rk2023
+          - const: rockchip,rk3566
+
       - description: Radxa Compute Module 3(CM3)
         items:
           - enum:
-- 
2.34.1

