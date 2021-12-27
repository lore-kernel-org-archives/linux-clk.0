Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67322C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 27 Dec 2021 13:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbhL0NcN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 08:32:13 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54462
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234051AbhL0NcK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 08:32:10 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4AACC402E2
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640611926;
        bh=y5MJv5dkFEWJeZ+ENEwYHJsdTdmbB9oIwbRFldgvfL0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=BP9M00ZoN29zuv08qJJmuekdohnbW3EhqGxI1tMjT8GFGYaxSWh2NHjgUJqFmqiOD
         vBSfUIYkNJqw+svUfJchYlVwl4eAyFtsp6euWygo1K5N77USJxS2edt3IMfBw0FGJH
         /Iel2W2ZrkfPZnpRL5AcAiApmshO7VPZi6pvr/JtitbpBe2/dGjUA3iM3t7h6lrfXF
         SKtEBWXh1ZVDxAhQ+UVnsnnpQsrcuOmAO5Sb3LKF0Birh3M06IePrR9lNFIuDCF051
         Cc0OB9yUD8BkhH9VnY+dsAul/D+CDP1V2NN3AmB9fBOGYTnpPI+SY/nDho9ceBlD7a
         dTcBth4bKC1Fw==
Received: by mail-lf1-f70.google.com with SMTP id k25-20020a056512331900b004259a8d8090so3685895lfe.12
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 05:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y5MJv5dkFEWJeZ+ENEwYHJsdTdmbB9oIwbRFldgvfL0=;
        b=o2ULiiL810qHAUHv4Ra7su3CFVmJX1PEYRkSiQg+M4hR08hba0xem2k569+zv3pqMN
         oDHAQiXvqAGiZMA5YerjSWkLhGMHq692Ng8rSNY2WzktsFe+5zbp5BbEb1VLcWiHjhCh
         6V1CdmivUhDXmyaBdix0sJkQZSh25ZUbOOkAR2cDc014AWra8LY5jZ/+8Bs4ucf1JV24
         Yc5cmDCos+ohxY9TTBkAr/08S+W/yVcV3TrAzHJpkpB8YNAVaaUxgxdxiK9n7kxRQwed
         tRBbqfxEZQiVzUtXxmiqqGK7ppUNHFSY+m9yg9oaxqhXf0oBLRnRhayNC/rFkY3B1CLA
         rFow==
X-Gm-Message-State: AOAM532GBJGFG2C53+CyQi2Z84l557Cgo2Lvlrra2qO62dUFyxfEyuOG
        5stTv+r/83DyvndKQav4QqaEZAIJe28zgPG3h8hltzzkOTwszptXf//FttE8X6HOKmruv5VIAhv
        D4BShOI4azEjH8AhBQ74sO0PF7Pwop9yAQR55Xw==
X-Received: by 2002:a19:6e0b:: with SMTP id j11mr15350183lfc.226.1640611925721;
        Mon, 27 Dec 2021 05:32:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdC9kbL0s6EJ1Ul2bU9vVLa0PpXYnccCSTpvf6T3GQkXGRZJCOybKlDM22aTnjracXRomVlw==
X-Received: by 2002:a19:6e0b:: with SMTP id j11mr15350120lfc.226.1640611924436;
        Mon, 27 Dec 2021 05:32:04 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id d14sm1433510lfg.18.2021.12.27.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 05:32:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dinh Nguyen <dinguyen@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 02/19] dt-bindings: altera: document existing Cyclone 5 board compatibles
Date:   Mon, 27 Dec 2021 14:31:14 +0100
Message-Id: <20211227133131.134369-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
References: <20211227133131.134369-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Several Cyclone 5 SoCFPGA based boards have additional board compatibles
which are not documented in the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/arm/altera.yaml       | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index c15c92fdf2ed..0d62c2bde053 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -13,12 +13,30 @@ properties:
   $nodename:
     const: "/"
   compatible:
-    items:
-      - enum:
-          - altr,socfpga-cyclone5
-          - altr,socfpga-arria5
-          - altr,socfpga-arria10
-      - const: altr,socfpga
+    oneOf:
+      - description: Arria 5 boards
+        items:
+          - const: altr,socfpga-arria5
+          - const: altr,socfpga
+
+      - description: Arria 10 boards
+        items:
+          - const: altr,socfpga-arria10
+          - const: altr,socfpga
+
+      - description: Cyclone 5 boards
+        items:
+          - enum:
+              - altr,socfpga-cyclone5-socdk
+              - denx,mcvevk
+              - ebv,socrates
+              - macnica,sodia
+              - novtech,chameleon96
+              - samtec,vining
+              - terasic,de0-atlas
+              - terasic,socfpga-cyclone5-sockit
+          - const: altr,socfpga-cyclone5
+          - const: altr,socfpga
 
 additionalProperties: true
 
-- 
2.32.0

