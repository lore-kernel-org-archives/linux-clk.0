Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D572C7EE2E
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 03:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjFIDNG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 23:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjFIDNE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 23:13:04 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC91330E6
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 20:13:03 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-39c40b94fedso109252b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 20:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686280383; x=1688872383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdcoXrVKUjNxK20AUGxUd3nCpXpvG2ISuks4CEzgCZ4=;
        b=IRmsHH3e0y2zI1SQsQA6zlPQ0K8S8eLRrtrwTtJyRvBDJMAqpe/p1912uqZDFFVBye
         NgGw/+FSzebELnvVkLMtNTL0rTYhaxpyakqMAfY45gZsgtR63rLky/IjtvwkV7oRNMst
         5b1GBxWmYiCfeR58IuQVgOZp5mVZIEi5Uu2X+80YC90qZlUkHjF33KyWmEuRB+QLhkD8
         KLzrPAzHdOSDJRx0XQuh2sqsI2zp9NFVKRfc5gvUERBI/Pw970Uj6fpXFQRht0i93A7m
         RFWkLcNp5uBZwENNxO5VK5UGEw7TJ1RSsOF0eRaUgeXos1gRL0v4BOD2/pZmYf9QLmSu
         YuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686280383; x=1688872383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdcoXrVKUjNxK20AUGxUd3nCpXpvG2ISuks4CEzgCZ4=;
        b=BB8h9n7dfpwMvTKAdzOf/hgsfVJBspxhvO3FFoG6PgAGBIJ+Nl4UyXbMx4yvyG3udM
         Md9eIFWmtMuGOEXxSt6MUpVFcVxX5ZZXeaTw8m3RPu2ReKvqFip4Vm2jZfetb24geifY
         J5xLBMJRlKXfhKNaJHK5oD2gl77PgJn8xUydVXz5r2pjiZln0hA2cnlulJP2xLw5Wz9f
         DpM6KAGfGQTdmXOM2QhtDG0bcTwU81HZ9G238juZT/VdYnWg9ChFMznZ+0vi1exwy+KP
         Gd1dL8iRWEzF4U09qnLkLAMWp4YTGBEIzyhx5XSOfynpbepyhLhD7xnXRKXBPlkifV6p
         VnJA==
X-Gm-Message-State: AC+VfDyUcVhD2FKiQ5fbExnz1Vx/1qYBWvzGXwlB+4Qf9k6Vy8Rv0ysq
        rwpB5VuizJQtun5n+bgOJMY=
X-Google-Smtp-Source: ACHHUZ7aV6JiIRnVdy3z9BctAAbLJ0NFniFjkGmZHcvZWsFw5zrbszYlMUB7vZObABURZ3Rai9IihA==
X-Received: by 2002:aca:ef06:0:b0:394:b8:cb8b with SMTP id n6-20020acaef06000000b0039400b8cb8bmr198478oih.5.1686280383022;
        Thu, 08 Jun 2023 20:13:03 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c46:67c3:a757:2399])
        by smtp.gmail.com with ESMTPSA id r3-20020acac103000000b00395f5cd1a0dsm1047493oif.9.2023.06.08.20.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 20:13:02 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     sboyd@kernel.org, abelvesa@kernel.org, hs@denx.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/3] ARM: dts: imx6sx: Describe the default LCDIF1 parent
Date:   Fri,  9 Jun 2023 00:12:48 -0300
Message-Id: <20230609031249.3692841-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609031249.3692841-1-festevam@gmail.com>
References: <20230609031249.3692841-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

A suitable default for the LCDIF parent is the PLL5 clock, so
describe it in the device tree.

The imx6sx clock driver harcodes PLL5 as the LCDIF1 parent, but
in preparation for removing such hardcoding, describe the parent
relationship via devicetree.

There are some boards that may want to use a different parent
for the LCDIF due to EMI reasons, for example.

With this approch, the user can change the LCDIF parent in the board
devicetree if needed.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- None

 arch/arm/boot/dts/imx6sx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 41c900929758..0d549e1f3ced 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -1305,6 +1305,10 @@ lcdif1: lcdif@2220000 {
 						 <&clks IMX6SX_CLK_LCDIF_APB>,
 						 <&clks IMX6SX_CLK_DISPLAY_AXI>;
 					clock-names = "pix", "axi", "disp_axi";
+					assigned-clocks = <&clks IMX6SX_CLK_LCDIF1_PRE_SEL>,
+							  <&clks IMX6SX_CLK_LCDIF1_SEL>;
+					assigned-clock-parents = <&clks IMX6SX_CLK_PLL5_VIDEO_DIV>,
+								 <&clks IMX6SX_CLK_LCDIF1_PODF>;
 					power-domains = <&pd_disp>;
 					status = "disabled";
 
-- 
2.34.1

