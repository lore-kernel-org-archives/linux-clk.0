Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512E9C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 17 Mar 2022 22:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiCQW0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Mar 2022 18:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiCQW0q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Mar 2022 18:26:46 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85655234574
        for <linux-clk@vger.kernel.org>; Thu, 17 Mar 2022 15:25:27 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a8so13616665ejc.8
        for <linux-clk@vger.kernel.org>; Thu, 17 Mar 2022 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=he5SYi2i8fnJsV9XJ7BjYt6CsD8atydpjeDiU4Eqw2I=;
        b=CXw3IFQ1Fhhf/LJrTcBsPUQ7ryNjlpwia1KfOQuYTYdh/igOYUtvcWxOuRnd07Y2m6
         zln98DPcLhv3iy/H0+c6zhaEbOQXsuc4k7i5LcZWki1+QokVmpe0NBW+CGqHAFy8IUlF
         B0V+f/RXCC7M4h4IIsieOnQ3FPOOzUnMW/xjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=he5SYi2i8fnJsV9XJ7BjYt6CsD8atydpjeDiU4Eqw2I=;
        b=CtSzD7zT387sDudhfxh7I1Ecuysrqr4wtqoVqAmnGYiaBsbzq2HdwQ7J7aZE7Nnz74
         yyN3Aki2NaeSSLQnH/ie8mAMcijPMbubLH928fts9mtsawAdtTSmoI7nNjUVIjV9gVSL
         4TOP/RgkDB8D/14PUeLIJ6PS4/Ii1cv/9FD6xxrtIk2RNn/BC/oCQwhGU8zJYsTwKMaW
         XtnZ6PLvtOhj0z9Jz7z94+eu1BSgntEAqDbSKjLn2eF/CmsAq/iDVaCutO3qFkPPqCxb
         ocilc5p7Rr00wZ+afXNT7f3GCxXmRo19d8rcM8a40vyaBuSkc8Rliab5ub4ACAf/RXnD
         hLDw==
X-Gm-Message-State: AOAM532rPOR82JiNA1l19ld7vdgT0ajLTzSB1lGEa4UAxgfGfmcyInsp
        RFWC4vz/e7tfCibcykA/zYzpQw==
X-Google-Smtp-Source: ABdhPJxgX/wXd+34bhzCk9cw+jFEVE6cMoRGT/ICO7kBqqHpet4BknKxAsc0UhhsSs69Alq7gUbZnw==
X-Received: by 2002:a17:906:c18c:b0:6d5:8518:e567 with SMTP id g12-20020a170906c18c00b006d58518e567mr6319063ejz.37.1647555926042;
        Thu, 17 Mar 2022 15:25:26 -0700 (PDT)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id m24-20020a170906161800b006d420027b63sm2949654ejd.18.2022.03.17.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 15:25:25 -0700 (PDT)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: imx: add clock bindings for i.MX8MN GPT
Date:   Thu, 17 Mar 2022 23:25:20 +0100
Message-Id: <20220317222521.170762-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The i.MX8MN has a General Purpose Timer (GPT) just like the i.MX8MM,
which already has such bindings. Add the relevant bindings for the Nano
SoC too.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 include/dt-bindings/clock/imx8mn-clock.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mn-clock.h b/include/dt-bindings/clock/imx8mn-clock.h
index 01e8bab1d767..07b8a282c268 100644
--- a/include/dt-bindings/clock/imx8mn-clock.h
+++ b/include/dt-bindings/clock/imx8mn-clock.h
@@ -243,6 +243,20 @@
 
 #define IMX8MN_CLK_M7_CORE			221
 
-#define IMX8MN_CLK_END				222
+#define IMX8MN_CLK_GPT_3M			222
+#define IMX8MN_CLK_GPT1				223
+#define IMX8MN_CLK_GPT1_ROOT			224
+#define IMX8MN_CLK_GPT2				225
+#define IMX8MN_CLK_GPT2_ROOT			226
+#define IMX8MN_CLK_GPT3				227
+#define IMX8MN_CLK_GPT3_ROOT			228
+#define IMX8MN_CLK_GPT4				229
+#define IMX8MN_CLK_GPT4_ROOT			230
+#define IMX8MN_CLK_GPT5				231
+#define IMX8MN_CLK_GPT5_ROOT			232
+#define IMX8MN_CLK_GPT6				233
+#define IMX8MN_CLK_GPT6_ROOT			234
+
+#define IMX8MN_CLK_END				235
 
 #endif
-- 
2.35.1

