Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A7BC48BE5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C31B6115B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 14:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbhFPOOU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233952AbhFPOOQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 10:14:16 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6EDC0611BC
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id d184so1389189wmd.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OGHMR1jQwoAH96uaUuvrSUUPBxq6apuQySMYgFNC+8=;
        b=kGxNcqKYzteoQLEjouWsoqpog/GQkUccBVFhhkiTeIe5/t0daMxG4P9ctOdRj3FKDf
         f35XXENwD5eF2YD7AjGscAhOjdXmhVmsIqwBaV8nUrkfLfNjRdJ1TceSncUp/dqzSVFO
         y7CGsb6y983KbkQhubGPOJLMVWByM18yY1WnFoX+MEdZVuCArKj29cePpb0qCzxHtWOr
         6cWoIpWRhKVV7hlukN9Mxe0H8o8iJbqX2BI/nJdtRnoZq82eojNPNWbaywvvs6dsIoQI
         wllAK/dVD+rQdfsSuqN644UdRirYg6dBPvpqYnoLEfixwVDQJ1vHltM2J+nWu7blpEK3
         ytbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OGHMR1jQwoAH96uaUuvrSUUPBxq6apuQySMYgFNC+8=;
        b=s6DG+UP1+1iJbmcbRhLAdXYK93qXPUBm88Mm+oSf2PDd4k0GHZuefIcF4kW/Cwzfd5
         rJ+qVVjKTfFQXtLLaPhJmcdagEkSZq90I1XhtbKn4uNT/s93v6a0a8hWtyEdLdxVuQHH
         if/TJ5i16fk4zW0gK3C2ic5XBLckf/eDzsPoQica4k3E+LHBWrBnS1M9qIWcpNjMXpA1
         DfuWzS8ivP/fJANQRLZtfwBkCfDu0iz2R6Qt1nVe1IRqi6qVjnClVY3FuqdKbbnay43T
         DM9YFTJIkW1beVBenZBPSGHMIj3iKPSuPE9dwS/B6JrKQ2D8r3lNC8PXV+sE0jmRjiZi
         4SQg==
X-Gm-Message-State: AOAM531FgO4MkHosTzFVwR50fP1w1h4z+AYsriSXHofidKAQvn8lkdmx
        pMkaciFXmz9CAAS6S7U3QFn1Kmt4u8kXkbnX
X-Google-Smtp-Source: ABdhPJzwqIxK1guQTFvJIrbdSCMaJU7rjFZiwV51dUJROYEEm75zQ/JOgZVb4ePh2R7keeQGOxoJ0g==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr11591494wmc.5.1623852694046;
        Wed, 16 Jun 2021 07:11:34 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 10/11] arm64: dts: qcom: sm8350: Add videocc DT node
Date:   Wed, 16 Jun 2021 16:11:06 +0200
Message-Id: <20210616141107.291430-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This commit adds the videocc DTS node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5dd32d4b1936..b270fb94da8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/clock/qcom,videocc-sm8350.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1285,6 +1286,18 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		videocc: qcom,videocc@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			mmcx-supply = <&mmcx_reg>;
+			clock-names = "bi_tcxo", "bi_tcxo_ao";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.30.2

