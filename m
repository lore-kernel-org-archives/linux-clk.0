Return-Path: <SRS0=2CVv=V4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F73C32751
	for <linux-clk@archiver.kernel.org>; Wed, 31 Jul 2019 20:30:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBC05206A3
	for <linux-clk@archiver.kernel.org>; Wed, 31 Jul 2019 20:30:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YV/R5BSM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbfGaUaT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Jul 2019 16:30:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36666 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730757AbfGaU3w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Jul 2019 16:29:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id g67so56891713wme.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2019 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eN7cVd81RI8zQ0Y9k2UD2x6CFiI8Tg5XhL9VySum/g=;
        b=YV/R5BSMFAh570iRGRBD+cQsWsJMFzQ9gG4bGL/RfB32IWA8XWQeNI5O0Thy2ZYp3D
         0R9pHt+GGiTfp0GJbd7ldKYk/cGLe4sDDFbAxLUywQ8JpeGf04r2+4aXtZvWA41ZNgOz
         Ga687vg1J/lEgYqb2BK7TqMePNgA5tMCBoqMtIiqAwNmUj2veS08uPt9qYWEw79ufpms
         AMsxqa5tQzIjPGAQZVtrImgh9ifM/d/sWBl+iDfNP3djoNjHT+3jg9gOeiztVzXdAMMR
         oLeGbEuGiUBJv17NIERP3qXzZA1aIXI6F5E9+wMnlf8vPQuU5shUVedUGy5fClF3LwLm
         V/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eN7cVd81RI8zQ0Y9k2UD2x6CFiI8Tg5XhL9VySum/g=;
        b=HwL/3nglhEYdGsXvMyMnzZ7UqfGWr53hgaHaRR1ghCRTmOxQ44ixR5XOq0vIH1JGte
         xKSBo/vuJGSg3mWSW/GJ+Lbl9tdUQYRxleDLWyv1wJYtuVmq4p0/LyH1ZUi/6883/bix
         M4dW8TDKL/YaxDkZUkwOn16RRfC5XXeyV9VggWhTn1+8+r45xhWN9YE1TlrFFxViXpRP
         Nc0aGryCISA2Vy6B1rqxUQsnUj7DZCsUrLcpkBF40Vt2ci5jtTeVnTIzm3OSMNzA/a5z
         cP+72f9HOJhkks3OBFNS/d8I/ZF9OD842wjiyDvW0fEPhT96YH8h2W6v+MYjMDRZ8d+Q
         OiHA==
X-Gm-Message-State: APjAAAUgv6+0ASa2de/5P0PZfeelTaKLE1z6dDX5ZdFpbDht3lzt0B56
        MU6KM3nJCfgiq5zOR58gkTFbBg==
X-Google-Smtp-Source: APXvYqzNwzPOT8ikRcH8Z10UCUrFJdD9U7xIkEr2QVEDWI8Dja3e2Osr7FtBYRKIc8wpPjGJiXNCVg==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr37876401wmk.36.1564604991184;
        Wed, 31 Jul 2019 13:29:51 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:50 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
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
Subject: [PATCH v4 09/13] arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
Date:   Wed, 31 Jul 2019 22:29:25 +0200
Message-Id: <20190731202929.16443-10-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

The driver still supports the previous bindings; however with this
update it we allow the msm8916 to access the parent clock names
required by the driver operation using the device tree node.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..96dc7a12aa94 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -429,7 +429,8 @@
 			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0xb011000 0x1000>;
 			#mbox-cells = <1>;
-			clocks = <&a53pll>;
+			clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
+			clock-names = "aux", "pll";
 			#clock-cells = <0>;
 		};
 
-- 
2.22.0

