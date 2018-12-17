Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217E3C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD38920675
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 09:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdHo/8Vl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732159AbeLQJqs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 04:46:48 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45445 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732156AbeLQJqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Dec 2018 04:46:46 -0500
Received: by mail-wr1-f66.google.com with SMTP id t6so11359154wrr.12
        for <linux-clk@vger.kernel.org>; Mon, 17 Dec 2018 01:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RXGJUDtV43vtkJcjcMqswspwSUTkhQ4p8WwX+rLLTcY=;
        b=YdHo/8VlDHD/XH++DFycOyIheMQnzZsvbLugbbHc7UQZcNUmGcurmALjHh0qfwqFAO
         1+iCxmpXAHraLrtCGrNtgw+bXyRr78aSb9mf48IqnDu5imbXEZUUX1TX6gKmuvSg36qY
         kgiE0JP7rrL6FXcVFIc/RRM5iiPPqO1AIgK5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RXGJUDtV43vtkJcjcMqswspwSUTkhQ4p8WwX+rLLTcY=;
        b=eho9iTb5/ldYCDxnsH2KylGToTnVN+/RjAeGw8UEyF0Jcys7Zgmo/48VTlkRPa8Pch
         WimKa5IuQFqMzweXCOxw7G0pDy5xlSw/sXDnRR2ebExajMXdQfVdaWvC33M9mCIRpg0V
         EqQuizGFpGHHGz1YdBWNi1HG3jqcOgNQqSSFkjYzEt8afMdkpxS9AiAeh43FPiOukABh
         cs3Vj4lkFF/Hor6Q6xp5ZFcPriNx/FVucll68yMgvvT9KM4lAKqkg+dqGL6LZedgdG/f
         8fakNtwCEYYaHdtX//KeDg1HjGnRLy+io/IzOwRPstmIBLNDapBOuXwELdM/rN+QwmJB
         ZAkg==
X-Gm-Message-State: AA+aEWaPZmf/tEXJUVy9TGHr8rlXE4pmBVbUJbQmd3aPhtXc7RPqU6vJ
        fjKjHhsAdQRJXJDlnxOD/dh/0g==
X-Google-Smtp-Source: AFSGD/W8DpmQ1e838SqPlmsvrSAYTNxnzP5FGpj5vmGIgcpooxl9YQ4KtNc5pi02rANEG/HKd3RoRA==
X-Received: by 2002:adf:c042:: with SMTP id c2mr10420188wrf.158.1545040003249;
        Mon, 17 Dec 2018 01:46:43 -0800 (PST)
Received: from localhost.localdomain (58.red-81-47-145.staticip.rima-tde.net. [81.47.145.58])
        by smtp.gmail.com with ESMTPSA id h12sm28878113wma.48.2018.12.17.01.46.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 01:46:42 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 04/13] dt-bindings: mailbox: qcom: Add clock-name optional property
Date:   Mon, 17 Dec 2018 10:46:21 +0100
Message-Id: <1545039990-19984-5-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When the APCS clock is registered (platform dependent), it retrieves
its parent names from hardcoded values in the driver.

The following commit allows the DT node to provide such clock names to
the platform data based clock driver therefore avoiding having to
explicitly embed those names in the clock driver source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 .../bindings/mailbox/qcom,apcs-kpss-global.txt      | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 1232fc9..f252439 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -23,6 +23,10 @@ platforms.
 	Value type: <phandle>
 	Definition: phandle to the input PLL, which feeds the APCS mux/divider
 
+       Usage: required if #clock-names property is present
+       Value type: <phandle array>
+	Definition: phandles to the two parent clocks of the clock driver.
+
 - #mbox-cells:
 	Usage: required
 	Value type: <u32>
@@ -33,6 +37,12 @@ platforms.
 	Value type: <u32>
 	Definition: as described in clock.txt, must be 0
 
+- clock-names:
+	Usage: required if the platform data based clock driver needs to
+	retrieve the parent clock names from device tree.
+	This will requires two mandatory clocks to be defined.
+	Value type: <string-array>
+	Definition: must be "aux" and "pll"
 
 = EXAMPLE
 The following example describes the APCS HMSS found in MSM8996 and part of the
@@ -65,3 +75,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
 		clocks = <&a53pll>;
 		#clock-cells = <0>;
 	};
+
+Below is another example of the APCS binding on QCS404 platforms:
+
+	apcs_glb: mailbox@b011000 {
+		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
+		reg = <0x0b011000 0x1000>;
+		#mbox-cells = <1>;
+		clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
+		clock-names = "aux", "pll";
+		#clock-cells = <0>;
+	};
-- 
2.7.4

