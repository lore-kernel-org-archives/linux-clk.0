Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E75CCA47A
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbiFSQuX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 12:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbiFSQuW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 12:50:22 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 002DD63C5
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so488041wmb.5
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OdzijZhojJfexvUiHUDLq5z4PsGSFwQ1Ytr2BP9BCIg=;
        b=PWA4JJOFAtMdKuAwHauf5W0ilkam9+c284EfGOoeFfBxf73/U3WhmRonRDLM9YkFq7
         bXrvdq1MvbW4jcJQNEfv99schOsEgU8AxXsLtq8HqNmK8RTgB+WPs3prQdtrSpXphsv3
         PDKpjD2sE+YGBKavd99Z/4KdZH8b+vD/EGw1aMT/nhcIx17IdEMnfi0klW+QvxETCrdu
         ufR/+VR5poo6Nnp+w5yM2u4joLnHecINMOecWblxkbCXSka3zerwe2DdgAGjrgl063bq
         OeLVMsyhBjIQnxfYid1cwKIYct0v1Lb4aYeptnBNQIH+0Ki8ewyuz2pi/YMcTgDZS6VM
         So3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OdzijZhojJfexvUiHUDLq5z4PsGSFwQ1Ytr2BP9BCIg=;
        b=5kWYPoSXTCaRh/FTtQEhAkR57+ZkqUEdq9dpOYOm8hKVKMYkpoATyiph7PaoDFPSZP
         2HzYjHW0MPKOaE58yk6jSsKn3EvS0QKWMZEMuq9RWrmeYHJjmD9seK6sjjmoAY0ScLOh
         rKjwhpp5tQNuk9jetvRpkRa9ne8qPrzQruM1CCYPemRE0TaSbCKOlp8w3AGKUbz8cZGU
         3RkOdaoHjAd2A0x3CDEBE/sNSY3JNHWqRTMWup0dG/qNCqMKfTdaNRkJ4QYb1lAm+ALp
         MwTmqPfEwHRqYq4dxhv4kG6amR10SgqZE2Rc8v7oVxURZMAK+AG3FGvITIeprJa9QBYx
         fuSg==
X-Gm-Message-State: AOAM532WvO4MpY+RrdZwekKBeihMaoopT3XX7EsTw0FbZ1l80odFevfv
        igYL0I2j11TDzn+WDTTZLUIOMg==
X-Google-Smtp-Source: ABdhPJz0xPBZmWQTo9K8KRhE/AtjcNNKaUjJZKnJFvDuhZ5Qur5cAWc+N3xl1u+1XObV9D2uRhHE6g==
X-Received: by 2002:a05:600c:3048:b0:39c:4c03:d54f with SMTP id n8-20020a05600c304800b0039c4c03d54fmr30692648wmh.89.1655657418512;
        Sun, 19 Jun 2022 09:50:18 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:17 -0700 (PDT)
From:   Conor Dooley <mail@conchuod.ie>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daire McNamara <daire.mcnamara@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC 1/6] dt-bindings: clk: microchip: mpfs: add reset controller support
Date:   Sun, 19 Jun 2022 17:49:31 +0100
Message-Id: <20220619164935.1492823-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Conor Dooley <conor.dooley@microchip.com>

The "peripheral" devices on PolarFire SoC can be put into reset, so
update the device tree binding to reflect the presence of a reset
controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/clock/microchip,mpfs.yaml          | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
index 016a4f378b9b..1d0b6a4fda42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
@@ -40,8 +40,21 @@ properties:
     const: 1
     description: |
       The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See include/dt-bindings/clock/microchip,mpfs-clock.h
-      for the full list of PolarFire clock IDs.
+      ID in its "clocks" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+
+  resets:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      The AHB/AXI peripherals on the PolarFire SoC have reset support, so from
+      CLK_ENVM to CLK_CFM. The reset consumer should specify the desired
+      peripheral via the clock ID in its "resets" phandle cell.
+      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
+      PolarFire clock IDs.
+    const: 1
 
 required:
   - compatible
-- 
2.36.1

