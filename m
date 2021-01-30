Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA992C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 16:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6A7564E0C
	for <linux-clk@archiver.kernel.org>; Sat, 30 Jan 2021 16:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhA3QYI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Jan 2021 11:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbhA3OrZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 30 Jan 2021 09:47:25 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4CAC061574
        for <linux-clk@vger.kernel.org>; Sat, 30 Jan 2021 06:46:35 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id a19so11768270qka.2
        for <linux-clk@vger.kernel.org>; Sat, 30 Jan 2021 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3pfpynUB+ghu2LoZqqyAhNW2zyksaYmyZ1AVdni/rQ=;
        b=KB9heY6R341kDq8rIj9IDGMqmTCbYz+TXMov44wK69i1LnSON6dvqDeosIFbnLDeOL
         mPZ0KbwTIWuK8Ia0O+PN7xnZaBgDpBmBubRTQek7CsLjTS3McfLnnjYay6W5fKIwISpj
         escxF6ufl7bb3IwGvR37ZEAvY+Ob90UkGjrvgRoFzCz5tPM4rvlzhUxeNXRAk+UT7VYN
         73+B86vrjvyllXGd2czcsDGfBWWqNBfo8+nT4JIpKpO+RboSiKd1BqxPWLyY5F9rhUQa
         aAVmvUCT+xKGkjcTTu6miRW4Q84t54YJ3NGWy1vPKRGNmDTAmff37Yee1PpCAGRUJNjx
         Dp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C3pfpynUB+ghu2LoZqqyAhNW2zyksaYmyZ1AVdni/rQ=;
        b=SoePyxiZ2AMMa17xxy/hwmiOBjTHJPcQkYSrt5kB8onLijg2JPVv1eodVKqQFAn5e6
         HmxB4oy2+W/ajqtQHIbU1JSH0kBy+4TiAzt6EPb/F8EWoVtioiUqvxHstwu5eQBwgd6f
         mQrvHoZEs9WbEVp6FphuZDg1JHNSf7xWkTf425mmXFs5YbZd14Zizf1DD+sY8VIY/hIq
         /DvgSJlB4pRSjxWXrOcITEpLDKQs3JxhQohgYkNENArsL6JnNyrSw/4x99R9sFrsNRZo
         K+3vg1W0peB693qPBOJMrKRqmF0vaD8hZIfNlfQiH3zyrpp1HT+LOn/irHJ+uzz8X3ac
         qzZQ==
X-Gm-Message-State: AOAM533EXvUdJYzjEZcRw7O9bs0tM3vR6XmhHOrkF6q0icCOW710nyYW
        mXO0v26Ht7YYmbXa/B95TLk=
X-Google-Smtp-Source: ABdhPJxbduF2KLZtnSPC3sgSOEIgUwJwL/I1MjFV7cRjwCwQJc4+JBxBfEnAAAQnex+jiMNERmRvUA==
X-Received: by 2002:a37:418d:: with SMTP id o135mr8809823qka.426.1612017994624;
        Sat, 30 Jan 2021 06:46:34 -0800 (PST)
Received: from localhost.localdomain ([2804:431:d77e:d35b:c52:e75f:e3d0:6528])
        by smtp.gmail.com with ESMTPSA id 193sm8941652qki.28.2021.01.30.06.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 06:46:33 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     robh+dt@kernel.org
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: clock: imx: Switch to my personal address
Date:   Sat, 30 Jan 2021 11:45:58 -0300
Message-Id: <20210130144558.133534-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

My nxp account will expire soon, so switch to my personal e-mail
address.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/clock/imx27-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx31-clock.yaml | 2 +-
 Documentation/devicetree/bindings/clock/imx5-clock.yaml  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx27-clock.yaml b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
index a75365453dbc..160268f24487 100644
--- a/Documentation/devicetree/bindings/clock/imx27-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx27-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX27
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@nxp.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx31-clock.yaml b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
index a25a374b3b2a..d2336261c922 100644
--- a/Documentation/devicetree/bindings/clock/imx31-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx31-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX31
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@nxp.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
diff --git a/Documentation/devicetree/bindings/clock/imx5-clock.yaml b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
index 90775c2669b8..b1740d7abe68 100644
--- a/Documentation/devicetree/bindings/clock/imx5-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx5-clock.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Clock bindings for Freescale i.MX5
 
 maintainers:
-  - Fabio Estevam <fabio.estevam@nxp.com>
+  - Fabio Estevam <festevam@gmail.com>
 
 description: |
   The clock consumer should specify the desired clock by having the clock
-- 
2.25.1

