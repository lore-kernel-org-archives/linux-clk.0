Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E241C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:34:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CD4D20989
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FP7HwM2T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfA1Sd6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:33:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36015 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728020AbfA1Sdh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:37 -0500
Received: by mail-wr1-f68.google.com with SMTP id u4so19239540wrp.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OVxxzmEh7O/wpeFAQp3T6SExbMI3Aurwjiqrjgi1z+A=;
        b=FP7HwM2TSUkrIzNgUgG81sDzpBy1MOMEoPvqCecdfRPpDpVQ5LmCEuFQKYFV9eBd12
         /O3Il73uqXfnJ+Y7g4nX3CpLkaCZm2o4JRrFE+4B2Quez8vvqQN1bIdW86sjujlDMt3b
         riz5HTi3W5KUdadChQakj9B/2+sw+7Hfj6BLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OVxxzmEh7O/wpeFAQp3T6SExbMI3Aurwjiqrjgi1z+A=;
        b=C/80DvYI7p5r7mZldhOLTszXEYtf6+PEViWA/VrbIA0LoahVODx3VO3jSUhQnhF/ll
         th7xsd+zKLp2jpbdnuDLPgTSYMjEcdGCdwZjX/sgIOKVoTs/ioiM4qCpAKRjLJ+y2PT+
         VAHVDBYRsfq1Il0Q/6G6cABAeO1mRgnfzNNlMwlF8tS1PY7GAwX3Pm/n9K88MGyHaRgc
         7wemB8UGumdxKNTVOKKCcibNNjBsfXBzf2akZ4FzUbMbZpCV6vStbyxfWT5Sc3eYcTvy
         FZJriuW3j83qrMQYzTGokEzPBZ8xmBumC/Cgu5OFg/4JohUASFcWTZubMa66jQJctrhw
         8Otg==
X-Gm-Message-State: AJcUuke9UmUNWlFMDtrc18d8q4TcKjqUQM97ng0GgL52YMF4pwQwUzI+
        At+oGFRuXg9BWgC8HCaza980BQ==
X-Google-Smtp-Source: ALg8bN4SXh1T9ga64YDOTO69/f0UDKj9oqz1dD6hdFF1PkvJnEnxBBXmTr4nQlg7jzgMSnBfwyKZVA==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr23945970wrn.142.1548700416145;
        Mon, 28 Jan 2019 10:33:36 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:35 -0800 (PST)
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
Subject: [PATCH v2 11/14] arm64: dts: qcom: qcs404: Add HFPLL node
Date:   Mon, 28 Jan 2019 19:32:58 +0100
Message-Id: <1548700381-22376-12-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The high frequency pll functionality is required to enable CPU
frequency scaling operation.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 4594fea7..6a4f8a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -62,7 +62,7 @@
 		};
 	};
 
-	cpu_opp_table: cpu_opp_table {
+	cpu_opp_table: cpu-opp-table {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -375,6 +375,15 @@
 			#mbox-cells = <1>;
 		};
 
+		apcs_hfpll: clock-controller@b016000 {
+			compatible = "qcom,hfpll";
+			reg = <0x0b016000 0x30>;
+			#clock-cells = <0>;
+			clock-output-names = "apcs_hfpll";
+			clocks = <&xo_board>;
+			clock-names = "xo";
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.7.4

