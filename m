Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05611C48BD4
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD488204FD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 16:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRMY0hQP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfFYQsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 12:48:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55925 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731112AbfFYQrq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 12:47:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id a15so3541764wmj.5
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e2iDgG+a1Cwxalhjo4sK1dl1x5ZGYIy8c2NDgb0cIKI=;
        b=hRMY0hQPqZa1EOkLq/pcbXQACdZ2vJch4Nwcss07dQdC/POnex3oN18t0XpCs3k2jP
         NvyO5+bb+SYAUpaa/6dukYsJS2HKigF9ncRCCtBSOguyAZLciEXdUxNLAOHBRmIDO+XY
         1ZT2UPFc1MMyvFBH8cKmGYRfjmoc8NVw9ITwdFWuyuXBZzgwlQPOmu336h92jyz85L32
         c2G1liFbrRMmUnrc8zuOdrTOGQcKpBhCwGfzFNalHwsyG+RpdzhcucUUltKduAZwFi1p
         pj8rEVfuV3ePPORyN7CqUsceLTjVphHP5v/f12iQFjZVxMwr1ZeIcSgn2nFlPojvEU5y
         7plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e2iDgG+a1Cwxalhjo4sK1dl1x5ZGYIy8c2NDgb0cIKI=;
        b=lnPzv8PJfe8H7d7e8RcEuwLXKjp0dQ4v63Lz2rD74Ns4AvY8aIDjgkg8tGld6DED4s
         IWxpD/PQfNB7U5wqhC529QD7lxsISE6JIhqJ7GpoA52IwrsukHoJigNgZYcX9PpWIePQ
         hZF9JGSf7XPVMsLV5eFZK2yYVJyUgtr8eTQP9OcFHr8csM39U+rgisj32Nc/C0UCAlE3
         IuzOyZlUidSo+ssyU/9w7zKfX/4bOTpiLTq3z8ctKKk1sYCF5C5+rP3G47bGQHHYVr0v
         MBDgxOOWMXfbodgbQHf/Z/RUz1kM+HiVVPgIiEj3Ib1GUQ9oNbLkGVyyso0ENsEGSS7R
         kU7g==
X-Gm-Message-State: APjAAAUnJfKsK58FUWJNDBznMTFVTUJUKcZH0dJwKhcXQdLlu3FsiFDA
        HDFmNtjPCMEMu422NmKOTfjeUw==
X-Google-Smtp-Source: APXvYqzzKybU5L5CHAou+6YROvKHjyTDhRvTNHkGwif2kC9QtUTdJvvPwjxfryuq9YWgxxmIB0Rwqg==
X-Received: by 2002:a1c:39d6:: with SMTP id g205mr19367816wma.85.1561481264441;
        Tue, 25 Jun 2019 09:47:44 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:43 -0700 (PDT)
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
Subject: [PATCH v3 04/14] dt-bindings: mailbox: qcom: Add clock-name optional property
Date:   Tue, 25 Jun 2019 18:47:23 +0200
Message-Id: <20190625164733.11091-5-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../mailbox/qcom,apcs-kpss-global.txt         | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 1232fc9fc709..b69310322b09 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -18,10 +18,11 @@ platforms.
 	Usage: required
 	Value type: <prop-encoded-array>
 	Definition: must specify the base address and size of the global block
+
 - clocks:
-	Usage: required if #clocks-cells property is present
-	Value type: <phandle>
-	Definition: phandle to the input PLL, which feeds the APCS mux/divider
+	Usage: required if #clock-names property is present
+	Value type: <phandle array>
+	Definition: phandles to the two parent clocks of the clock driver.
 
 - #mbox-cells:
 	Usage: required
@@ -33,6 +34,12 @@ platforms.
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
@@ -65,3 +72,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
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
2.21.0

