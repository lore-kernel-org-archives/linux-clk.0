Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BEACCA481
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 11:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241351AbiFTLIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 07:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241315AbiFTLHu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 07:07:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EF91581D
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:07:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y32so16674343lfa.6
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=62OO2yCwxwMb/L2GgmcHraQZ1ek3MUdm3J131ESPihc=;
        b=eLtGXgDOOr7siYqeE0W5flGwpG8fq6utLJznkhQXy1kxcY/K4yyTBCY8CD41npihB6
         zPpgW6l3WzOxKVU4ZRxnO3ORUNaWmTfSVX8+2F9OY4fsFyDEqlBj3yoKdcssKqCmKsNY
         T1jpLcHxQ4KqAvD8kbgPQqzeeqdoN0HYI9XAY7c/kWr7tIw4Il18ZwrA+eQOy4/dtZsU
         z5nQxrgWta0nDV2zXTt92RFDLBZyK3EaFa656wTeTObSZ30DKPOzaHkOIbUtZClV9xmn
         aWZrQwRwygb7qYI8PBpLL7nTT49SOY7C1UiUAbROalLTOeg4odgTxDDHuPL6INjskAMT
         TJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62OO2yCwxwMb/L2GgmcHraQZ1ek3MUdm3J131ESPihc=;
        b=vyKGcO+qjKkP4UcdAr1a6YyMbaBRfN5rG4uGIB60dMNPrJT/VZn76dpMvk/SxkZw/7
         gBOff+TjOEMis4Bp8pn+Tz2ESwLRhgyLp68wRAhERC+vT/xWzxdEMMlk+9nGffqh+Kqa
         axtXgYF7fFwPVt7bqn2HFlRN4ItmEKO/+92UxgQi+JmHf6NfAbcsBpRBeAZitiYmXFJN
         hJGCBevsfwB0AzC0kf3H+m44kxZ9Ctbdvsk5edsv/ixoCb534U2n9sHjvKb1/szzJcmV
         a+2LNmalcEDqCeMfpOGxLhBeBT8v6dDac3k6Vj2IEsD2/fCybLQ9GIXScYCku1GJlNjs
         xXBw==
X-Gm-Message-State: AJIora8BVy6+94DyuLMbo9AlNqxtBHoWVbowD4OGKlXpHe/tPzQWgYTn
        Qrj6cmgG77tASF8j84I71HYlSA==
X-Google-Smtp-Source: AGRyM1tANibob6a8MmrreIwp6HYYGHRayHE7zSb9+om8OHS3yYzXteisDCzPfNzWiUSJYWSfW36fQw==
X-Received: by 2002:a05:6512:3da7:b0:47f:56b3:dbe7 with SMTP id k39-20020a0565123da700b0047f56b3dbe7mr8620964lfv.226.1655723267409;
        Mon, 20 Jun 2022 04:07:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a194f13000000b00479a825aa5esm1722564lfb.154.2022.06.20.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:07:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
Date:   Mon, 20 Jun 2022 14:07:39 +0300
Message-Id: <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add pxo/cxo clocks to the GCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 47b97daecef1..61e3ab0ebfd3 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -50,13 +50,13 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
 		};
 
-		pxo_board {
+		pxo_board: pxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <27000000>;
@@ -129,6 +129,8 @@ gcc: clock-controller@900000 {
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
+			clocks = <&pxo_board>, <&cxo_board>;
+			clock-names = "pxo", "cxo";
 		};
 
 		gsbi6: gsbi@16500000 {
-- 
2.35.1

