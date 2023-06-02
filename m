Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E4CC7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 22:16:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236194AbjFBWQS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 18:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235994AbjFBWQR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 18:16:17 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F3C1B7
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 15:16:16 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-19a34a63522so525752fac.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 15:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685744175; x=1688336175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YaPsyLeb5FyKRIBkJzm+0FR3Zt6fEWpe98Trce5vtAY=;
        b=j4LEKIeBvGlQxksrmagLpuwp15x2hZ5EARGIfhIcdtCCP8GhSDc4bZX0BAmc05dnbI
         Ved/4LtLd+FMmL5kTxmnjbX6F5oLjIGeb76iAZHtVPKV6HFXXzdij9NCOKtcqGXmXosj
         ubhKnTERh+JsC9QpT7hRKXJmtzlZBCeMfsrJK2EDJYj1QOWh9hxWoJPxRIqJD8uZxjIq
         9uYHnfy8LyVXP9MlHeF6+37bodx+oBsXs+BWRN5ABPYodF2SM08cIrpn80IKhBj2lzAh
         OQ8lH1dxerL9ly8Xj0hHK8S1VqANBmNbQrkHLXAfGfnHTZ6+IXvN1tjjpPpUPsCOZ4r9
         J88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685744175; x=1688336175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaPsyLeb5FyKRIBkJzm+0FR3Zt6fEWpe98Trce5vtAY=;
        b=PgMqw5Rrw4tZmuZl3lSErSUzbBbEh0QFP572zZDIw7wYDxQFB5ToxI+0zL0WhSEwxx
         tkSauVkbbodshtXGXtLMeeCLTOP/1tM0nHn1gLcZ3hkwrtw8AtgrIWkU7tHszX7popnp
         NpRxTCK0Wgs2nEQTjRSIxsxggPtanap4/nlUbu1JfwvfTkYO4l6V/vf70rzd7nJLe1dF
         aCQ7aVSxVow7qomwgV0pXF6ERzM0GFhxW6bfDxb0k1xAgydCLNp4z+gPw2nlpxUtEIYh
         nYv45Uo8IBxHmjS7cFmbcr3F70vvYmZEfrmKxDgQ/eEqoEi6HJQKzZGAXW8Sz1k/XqLl
         OoYw==
X-Gm-Message-State: AC+VfDy+1OwxG+UfYuEuzPQ1t1tV6d2viNibDdAHD/a7YLoYhNdw7A1C
        s9+LZuCzIh/uvY95gs21D1k=
X-Google-Smtp-Source: ACHHUZ6RqSGNNXksBXWmvjRaNtjha/H2AFlj+aOTib8aUYjfs5QsvNzi4Og5/aTAtwzKt9LaY+8mNQ==
X-Received: by 2002:a05:6870:c08e:b0:192:beba:7bd with SMTP id c14-20020a056870c08e00b00192beba07bdmr8503650oad.2.1685744175578;
        Fri, 02 Jun 2023 15:16:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dad1:c980:e6de:3901])
        by smtp.gmail.com with ESMTPSA id k4-20020a4a4304000000b005584e0c8f9csm951587ooj.3.2023.06.02.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 15:16:15 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     hs@denx.de, abelvesa@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] ARM: dts: imx6sx: Remove LDB endpoint
Date:   Fri,  2 Jun 2023 19:16:02 -0300
Message-Id: <20230602221604.155027-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Remove the LDB endpoint description from the common imx6sx.dtsi
as it causes regression for boards that has the LCDIF connected
directly to a parallel display.

Let the LDB endpoint be described in the board devicetree file
instead.

Fixes: b74edf626c4f ("ARM: dts: imx6sx: Add LDB support")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/imx6sx.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 3a4308666552..41c900929758 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -863,7 +863,6 @@ port@0 {
 							reg = <0>;
 
 							ldb_from_lcdif1: endpoint {
-								remote-endpoint = <&lcdif1_to_ldb>;
 							};
 						};
 
@@ -1309,11 +1308,8 @@ lcdif1: lcdif@2220000 {
 					power-domains = <&pd_disp>;
 					status = "disabled";
 
-					ports {
-						port {
-							lcdif1_to_ldb: endpoint {
-								remote-endpoint = <&ldb_from_lcdif1>;
-							};
+					port {
+						lcdif1_to_ldb: endpoint {
 						};
 					};
 				};
-- 
2.34.1

