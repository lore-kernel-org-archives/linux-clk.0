Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5240CC48BD4
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27FAD21655
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kI+F4y9J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731770AbfFYQr4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 12:47:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33512 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732170AbfFYQr4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 12:47:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id h19so2711010wme.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrzyeFr44bncESExYjY2Xqm7hHRQ10WfGAsR66xmSU0=;
        b=kI+F4y9Juq4UtO+H7tm4R23zk+eYgxqBO1Rw6hrz74Fj/gAdeyhxUnPYLp0fJtVsqB
         wtfT+RsceD8eJWFhIG5efmhcWhuetah0Y6H6maBKnlWO+ycI9X5mrNtHq/uDMJO9i1Dl
         6gFQ6d1oLnklYadUNmApNLHrjroFKbsDAqxdnTe9KJMN1AGtQSsnuDaDwKhXDkHdoqIj
         1g7DK0K9jTzM28miEa9h/UFoPBGO+S9fps/jHV/s5WLQ8OafqQwNsyuB/3cj0gRvp/4+
         8txBkwYdTZdGjvZz7Oe+vcBvE5uCp9NoravLkOp0jiEK0dM+aE6fQn2C5wTEL44tD4lX
         p+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrzyeFr44bncESExYjY2Xqm7hHRQ10WfGAsR66xmSU0=;
        b=PZK27sJD2jdR8gIk9LnT9ygy0W9PtnwYvl+hYRzeS7btEI8UXHQQq9/i9hOZgTZECu
         DlivWWabJgV0d8+KWTaQPxL0PvSkHgm46gYN/8NyOA62deII/VX3P7hgh4DDeHDk43kO
         MwTP4knv+w5NOomCHfBnHC+Kgm8w1Ip92Dri1Qc2qoKHuFThpLaLZLgjV4kvKDUxBUKA
         3qobWj4zEzNoVX6NWziuMYoTKPsqxJxAYCtSeJshn25+mhAv6MjHUEq5yoWxcQDfshO0
         v/m2RzD4wWjQMZximEArs/BO3KutjipJWfsKMjcz0qC1LRlmpkGDidDoK/FUaC9ApzDi
         BuHg==
X-Gm-Message-State: APjAAAXawSPd/NHhdJwMqYRqjqIbIFuk/loGSrAidv8fJukZ07703EVZ
        wgFb7lTSfjkxMyQcjyL86oHmaQ==
X-Google-Smtp-Source: APXvYqywQ5Ml0QHQWPuK1teKrX2xUjmr8yueMadE/iBk+qI3mi0tbuXh03Y902YxT3PO+OdG5eixTg==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr21566006wmb.81.1561481274595;
        Tue, 25 Jun 2019 09:47:54 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:54 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 10/14] arm64: dts: qcom: qcs404: Add OPP table
Date:   Tue, 25 Jun 2019 18:47:29 +0200
Message-Id: <20190625164733.11091-11-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a CPU OPP table to qcs404

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3f17e1b09c13..d876dae5b0a5 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -83,6 +83,24 @@
 		};
 	};
 
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-microvolt = <1224000 1224000 1224000>;
+		};
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <1288000 1288000 1288000>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-microvolt = <1384000 1384000 1384000>;
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs404", "qcom,scm";
-- 
2.21.0

