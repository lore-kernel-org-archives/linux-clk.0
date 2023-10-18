Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B94CDB482
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 16:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjJRQS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbjJRQS5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 12:18:57 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9D29F;
        Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b2ea7cca04so458829b6e.2;
        Wed, 18 Oct 2023 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697645935; x=1698250735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uw/QwKMXqJsA0ZfWa9ge2ddn0yKUbipF+wTdf3W2lOs=;
        b=PpAbpupvbIMhMiZ8CnwthYZIm2NPAZBZthy7bA3K/APxp7v0NTF73qPf9znNbGiAWi
         VCSNhKYoWhm+TJsqvALIYWe/rc9ztiHMNF5AI4fqZYcX7fw6YTbQshN/8aF3X6oXkTzV
         r+hplPUAx5ggTjt3euT0fKpdRNLmN3T3AyEaSWweZ1kF0sXABW1UPTQEVu4l11agG5Gg
         YJ3wUDJVjBNhqojg2uxUhteq6zjDkLXqJHFsHeR763LpRQgEjDmAkrdxXqwLUf+6AcZw
         5S/0CSbvbDBjy80lnTLj5kjxDCCht969pSTYbqyY4zkyYO6NSNmtn5FN78oxMkplt+Ms
         vFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697645935; x=1698250735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uw/QwKMXqJsA0ZfWa9ge2ddn0yKUbipF+wTdf3W2lOs=;
        b=btyCiaV4sAsVcNuBJEqx/4xCWrgJ2vafG0HJwvP/eT1LlT4ttF9vSjivZCtVblQ2qg
         7xDw1KVWo3srkjgWbM5sFRC1o1uSVKXZBYnB/Q3NoWtI2tWKjYctrA8adVYEQBo7DlA3
         GlmryJdHzUEwCKhF9ce8r7cJ1BjNd5bWImXHH7zrPpLdw8rmBLD1bXR/LO50q+EskPhU
         2EVnZcmnPAPzPjm2hzSuqZU/HzE0GASkthVS77ltsusDglH6jbL3RKqECrzrHFm/URMG
         WOtNhjnDYTqTU643qchPlOWxlAfIlG6iW4ffa+FaYw/O62kipv+aBoNOM7rZLl3FlRvY
         sjpw==
X-Gm-Message-State: AOJu0Yy8W8rkBNVj/Rb4h/4Uq+z3QPevaGEUb37vOYegwI71OaH4V/ff
        NxCchRCZpXV6OOTNDY6KAdA=
X-Google-Smtp-Source: AGHT+IGVxblw+gFyde5QrjeYaigc+JDYVf1IHKc5ZSKgn/8HMCQzxvwUYh6/y+BU9OoipN7Tggfmsg==
X-Received: by 2002:a05:6808:2197:b0:3a8:6b4d:6b78 with SMTP id be23-20020a056808219700b003a86b4d6b78mr6659182oib.35.1697645935531;
        Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id db14-20020a056808408e00b003afe584ed4fsm697390oib.42.2023.10.18.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:18:55 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
        sboyd@kernel.org, mturquette@baylibre.com, daniel@ffwll.ch,
        airlied@gmail.com, sam@ravnborg.org, neil.armstrong@linaro.org,
        heiko@sntech.de, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/5] dt-bindings: display: panel: Update NewVision NV3051D compatibles
Date:   Wed, 18 Oct 2023 11:18:44 -0500
Message-Id: <20231018161848.346947-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018161848.346947-1-macroalpha82@gmail.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Update the NewVision NV3051D compatible strings by adding a new panel,
the powkiddy,rk2023-panel, and removing another entry, the
anbernic,rg353v-panel. The rg353v-panel is exactly identical to the
rg353p-panel and is not currently in use by any existing device tree.
The rk2023-panel is similar to the rg353p-panel but has slightly
different timings.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../devicetree/bindings/display/panel/newvision,nv3051d.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
index cce775a87f87..7a634fbc465e 100644
--- a/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
@@ -21,7 +21,7 @@ properties:
       - enum:
           - anbernic,rg351v-panel
           - anbernic,rg353p-panel
-          - anbernic,rg353v-panel
+          - powkiddy,rk2023-panel
       - const: newvision,nv3051d
 
   reg: true
-- 
2.34.1

