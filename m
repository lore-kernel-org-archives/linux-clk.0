Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53021C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 234B620881
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="SWu1KohV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfA1Sd6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:33:58 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38052 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbfA1Sdj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:39 -0500
Received: by mail-wm1-f65.google.com with SMTP id m22so15107804wml.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eKEG4PSnkdw0wbmM3EXS4MNpW9S0VVzPeVsDCYH9cC0=;
        b=SWu1KohVPEDN62e9GI7Pp9rkyz0nPsSFiKPFv5EbE5rqlP7N4qpbH7R2yCb18KZwcx
         NoRVga7pQsCg6LhBCy/KapUGZIHkw1Qv65vnXLNJvM0I25SbbcFJeTFK3lF4mlW/GTkc
         XMwIv5ApWAIvUUyhHR1BVNjTEUDdv08dIyDYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eKEG4PSnkdw0wbmM3EXS4MNpW9S0VVzPeVsDCYH9cC0=;
        b=DZrtTfuseCIHYqqbFm+duHKdqL4Z+uFcmWvpSPLQaJ+QZkm1uUAhTZtYLumCCFhDeo
         2aep5SuF8M0CSlqAh7flSlHpH6dyUeicljDHOcDe/eZx/dRdMqAFtPA0MH8d80bMfJjW
         l8WlBdPUoM6AEsq97cFqeROS9Ap9yNpMSu8e5wHkYkPvS+JFEpfOWVweC6yOlWuAYOTw
         uUVn+ltCzd0n0eJ+UWa+bokiR7IJDLxfgvD86Mw+2VYoUjtu/i4jPRccZ2SFBwwH/K6r
         zPmDHMgYj3cVfydzlYnk3TrmayzaD/srBWPICqdwTwUJrJeCIP3fbc4tDOyR0cz4AoAJ
         L5vQ==
X-Gm-Message-State: AJcUukcSOgRd6GbK4+e2IDA42Q6Vh7oznl4THAtFoGDlB/p4XJgZ19ts
        YuXK5Jcvn+D4fUus0qd3NDzeKA==
X-Google-Smtp-Source: ALg8bN5HBg/3AVwE/R6LQ+V2d+N3KCdQA1GJ9B3JemX+Vubhhdq3SbgrKeSRBV9X2irshm3zsM7/1Q==
X-Received: by 2002:a1c:6e01:: with SMTP id j1mr17759452wmc.103.1548700418085;
        Mon, 28 Jan 2019 10:33:38 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:37 -0800 (PST)
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
Subject: [PATCH v2 12/14] arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
Date:   Mon, 28 Jan 2019 19:32:59 +0100
Message-Id: <1548700381-22376-13-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 6a4f8a2..948ba3c 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -373,6 +373,9 @@
 			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
+			clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
+			clock-names = "aux", "pll";
+			#clock-cells = <0>;
 		};
 
 		apcs_hfpll: clock-controller@b016000 {
-- 
2.7.4

