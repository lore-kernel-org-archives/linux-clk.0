Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D6CC282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 667AC20855
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5AyREJ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfA1Sde (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:33:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39956 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbfA1Sde (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so19236148wrt.7
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bXD61WOsWcnEz5wNZP2XyoOaf7zm1bNwGyi1ZRGejfM=;
        b=f5AyREJ63jdfBtSQujWJw4CHJOH9YzluWQ/QaRbKqB+e9lrZDbflqahEW+dvmoShOK
         Q8Vcvd59ZbiwSqptctIKZPV7OCvlALFFu4kV+rd6fRuh5QErIT7DMEFj+pG0ucZDjCyA
         oZK2+7CbBhGiSbBza1Jk/fbW8TMDyu4ejnW+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bXD61WOsWcnEz5wNZP2XyoOaf7zm1bNwGyi1ZRGejfM=;
        b=T7vwDn80A5X925Nx1hUvGqvbiCoeDLFNx8DU+8b3U8ogcYa2I+8rhuLlqcyG9fg9sy
         SKm9xxOK3H8EkYKD5sLCCcku9Iu0z4iVGNG3Km3tuOymjMP+bo15PkijCKcRyZ+TbGOd
         g8elKQY683yTNb+94viBA2lhhy1dcR0y+eQmcMe9XqWuEzezsuZcvRMgAbM+UBqKq4e3
         JOT1+wqOCjKn5Uh5Pczu/n3h/8JvftWHw4wGe7UXx1XEpORqTvkOI1KnIr0NJuJsF7yH
         e9oKFp+bCT3kjgUOoS0gpy8xXa5XvyEPI0diMsA23MAQ+S3XwJCB1L3ABJKfTZnXD+7v
         hn+g==
X-Gm-Message-State: AJcUuked6PnIb2+42FK9fDHTtV9S5pnIC8Q2a5UDcn1Gf6UVaRtHD1Yy
        9y5tZjDYBQjJnZCXYwtgL6AmvP6wwVY=
X-Google-Smtp-Source: ALg8bN7IUUDiO2kIbBZLQO9YLuKtRgNNn4xP5EB+tVQtTQAJGM2141LERPLElq87BAVY0DZKOPMBWQ==
X-Received: by 2002:adf:db51:: with SMTP id f17mr21594735wrj.90.1548700412437;
        Mon, 28 Jan 2019 10:33:32 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:31 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v2 09/14] arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
Date:   Mon, 28 Jan 2019 19:32:56 +0100
Message-Id: <1548700381-22376-10-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify the cloks that feed the APCS mux/dirivider instead of using
default hardcoded values in the source code.

The driver still supports the previous bindings; however with this
update it we allow the msm8916 to access the parent clock names
required by the driver operation using the device tree node.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index c5348c3..729c117 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -425,7 +425,8 @@
 			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0xb011000 0x1000>;
 			#mbox-cells = <1>;
-			clocks = <&a53pll>;
+			clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
+			clock-names = "aux", "pll";
 			#clock-cells = <0>;
 		};
 
-- 
2.7.4

