Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248F9CCA47A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbiFSQuY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 12:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235547AbiFSQuW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 12:50:22 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B151640B
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:21 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id a10so4639260wmj.5
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1wp9fg7GLV3pi+6N9b23chCh97u+d99m5VcERi7ehs=;
        b=bPnyXKWN64AHnZToeVUO26HMas9/tkxyQqtdLVRhdC+buVatlHnFMXdVVxgkESp/A0
         /1fXdPu57m3R1lk+dB2zygAbwZRjSH4KVqkRLvwHDPruj9h14mCjz2zVNu3s5f1awmS0
         ewXdPp8hughiHf3N7oWAaA4pNA75h6XO7zS/+w73bY7EoxpqSF1ormze50BhwXH2jj3L
         lQ5rnsJPdJa6O/VqkNvxSArJLsPmkZh9EP+It4o5yFg+rUYq0lsu6Hm0KD3QL1a+1ofC
         SMMoEZEFRu5ys/E9neTRnaJM+st+vUuX/9TzcjuY54aS9fckKvnumpv3lIJCcqy4HozJ
         EAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1wp9fg7GLV3pi+6N9b23chCh97u+d99m5VcERi7ehs=;
        b=Yl3fxpEmqXvbZxKM30nzZYvaQbZggtZYSxO545maAIPUSWTRPdWCMNRlibsfO9FjvF
         w3rTOkuKWxe6SApwL8Ra9NM6UOMkRIm9jXbm+4b2vv5R+0wCp8diWaCHX3qU9avp2I87
         JUtVcvFgLXWrTx+ao+26j43KIMWQRIn436zd7dactJ46P0s/EhnfWVT/wtupkvtnoWr3
         XPRhktwPES+MWJGfH07oy17tWK2MbjTD+L5+OjxNY+kPOfA4Du/oKSP+KpkYTKaj+KDp
         Mft4B2n5Y13qmrb0rFksTCvCITaakM2Td7CHJ5UHYB2cWslm9T8PLCcdkUVRbpjUJl9J
         vsOw==
X-Gm-Message-State: AJIora9zcKD39wnnwg7ECReky/cHFX9RzOggpvNKVN6kDbdllvN6kaq8
        r/z0EQWCNV5jyH1nZV6s36Eqqw==
X-Google-Smtp-Source: AGRyM1uF0ceBCoDGb8f7820OuMYLUviRQuhZsDcnfdtER4rIoj2V0+8xcQxMV4x24fp4JC4HNI8OQw==
X-Received: by 2002:a05:600c:3d18:b0:39c:474c:eb with SMTP id bh24-20020a05600c3d1800b0039c474c00ebmr20396587wmb.87.1655657419809;
        Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daire McNamara <daire.mcnamara@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC 2/6] dt-bindings: net: cdns,macb: document polarfire soc's macb
Date:   Sun, 19 Jun 2022 17:49:32 +0100
Message-Id: <20220619164935.1492823-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

Until now the PolarFire SoC (MPFS) has been using the generic
"cdns,macb" compatible but has optional reset support. Add a specific
compatible which falls back to the currently used generic binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
index 86fc31c2d91b..9c92156869b2 100644
--- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
+++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - cdns,at91sam9260-macb # Atmel at91sam9 SoCs
               - cdns,sam9x60-macb     # Microchip sam9x60 SoC
+              - microchip,mpfs-macb   # Microchip PolarFire SoC
           - const: cdns,macb          # Generic
 
       - items:
-- 
2.36.1

