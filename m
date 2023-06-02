Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C65C77B7A
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 22:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236190AbjFBWQV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 18:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbjFBWQU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 18:16:20 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38431B7
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 15:16:19 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-19a336df959so334373fac.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 15:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685744179; x=1688336179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK9ooTnIIPstvRuHFdXn4jUqcXC6NMJg2ggUZKFIvy8=;
        b=fqNW2WgZWlvWlv3Hr75Zeylkqm2/Vm5PuMRmuGBfFS0GjJgoMSjT0b9On2BFDxq9eE
         09mdkXGtSYrdd4dxol4GN75+gv5cUUw5ifRtta6szECqhosYbDNquKflzO6EfB2HXwV0
         RCGQ8ewA5D53eF0MYa4rj6B48rPbok9bc3GflKHc21W3RKmONIiMtxgJW4I95wSDR4vo
         q7tdPfZGfYg6ud8LYmD5wFAAUUzTkNPJJqZMEZohBuAqI1wJScWH8vdXVy5MzXnLauXQ
         z5rbzcBsPC+eFAr3fAhX7NJF/ya1BizTjFPAS5Fkv0zqc7Osd6Uy+NoeD1xQsNdvbvCT
         pKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685744179; x=1688336179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mK9ooTnIIPstvRuHFdXn4jUqcXC6NMJg2ggUZKFIvy8=;
        b=a4kC2laSMld1l1/jhl7sbac242sXQI0b1ptgOvWoIrkPfA867BdMrI+IyvuuYEzVn4
         yK1iOy+WS7CM8iH2h31XY1TblplSOQTsj8tzglMoYSy59LregqFSlPd7Vfuj3WwImgOV
         7nDsN4FVMrIdQ0zKEqlhmk7+GowBqr/8vKvnEIAL8eCQr0qNArUCHFm+phZ1BVAuE/sz
         34ucGfj1xOlkzROvX2s0p8pjZJ4YtPKfDMLtMnE+Wl5NINUOmyogtPBaY+S6MMfUw0Uq
         56BTyqIBf69ho+eTn3rh+6CnCX4ZkT3KLe8BnxWMaoBA6T8K7GAe8OcYVku+I6SY5hw3
         ghLg==
X-Gm-Message-State: AC+VfDw5/YbUSc2xXsEsfnVuc4uuBLicgrM1cmI8UPZvFba47Q4GUlxb
        JhsFzR9j0LldNRrb1sbCY04=
X-Google-Smtp-Source: ACHHUZ5PcZIPcD/CDwiMTGCm6Hjx0oaaa6NIs0etRWPWX9rPJxQ+L5t5kG7HP1j3LClnmyBj1/DBxg==
X-Received: by 2002:a05:6870:8184:b0:187:afcb:87ec with SMTP id k4-20020a056870818400b00187afcb87ecmr7646427oae.4.1685744179006;
        Fri, 02 Jun 2023 15:16:19 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dad1:c980:e6de:3901])
        by smtp.gmail.com with ESMTPSA id k4-20020a4a4304000000b005584e0c8f9csm951587ooj.3.2023.06.02.15.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 15:16:18 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     hs@denx.de, abelvesa@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] ARM: dts: imx6sx: Describe the default LCDIF1 parent
Date:   Fri,  2 Jun 2023 19:16:03 -0300
Message-Id: <20230602221604.155027-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602221604.155027-1-festevam@gmail.com>
References: <20230602221604.155027-1-festevam@gmail.com>
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

