Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBEBC678DF
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 23:49:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjAQXtr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 18:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjAQXt1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 18:49:27 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B4F5B456
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:33 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id v6so36045952ejg.6
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jEqdGtyBbqWcrp6Pvw8/l4oThEOWyJiXSzY/dBYsqg=;
        b=gbtZn88Oxh9k7ANsEdCV3iSNPui95jhWmyBC5jZf++N+AMCkZwdzyds5JhV0nX8uOy
         tBrYPte3WHtH+87Io7i/xKAFxr38uvIMeayzzODAxassOJH7x5a3Yfn3n3uLu49XArXj
         Dsmbq08GEDtEhmLUc8DfCLsglth6DXYpPb5OYUV8h80MhSkhmANvYdu/cv0AoBbtmGRs
         gMc9B9NQ9wkSF6IZa16j1uOyIoyYxi1ZCYIJMNHgHxRnZIHcvBxnigHSows5Q0jHOKLB
         kPUCV2BwPEKvhTVaTWst1VcMrvuODoV7DuUsl1f1PtXqSGjt1BB3H29Bw3cFepEdw6FD
         uwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jEqdGtyBbqWcrp6Pvw8/l4oThEOWyJiXSzY/dBYsqg=;
        b=6h5+E1KFZmA8WcFHWTvIfjbzGMNxsIXfi3W+8Y4TlPCaCtITagbcE0WbO7R6gkyh9s
         SRditfkRhfMppESGhRpOuDYKiqIUF0boWZTfVOogXWKfj4MTxkvvXnBid6o7ty5xT1GI
         cwuMsTyt8H7H5bLz7cohcaVxl8ejhkiQG/nX+5Yk4+rVJsZMqlKvQH4J5x/O9/gskjO2
         wQ/ElJbzwKFMxsMqOmsQtOvGWCodrV6Y9k0rzXkG2K7TNjV3ATC0aeFS4HtCd4gcb/Hq
         y2UUzZKJQg1IWyx5AlSxrj8+O6aNncnEfFtxwmeWng1QP6MUVQ5jlE2LdsAKjKzBBqfX
         X3mg==
X-Gm-Message-State: AFqh2krjhe7Z/+yb0yFqSdqN3ErtEkBhWeKE9/oZq8QODwPybpNLcNjV
        oralds71YEtw06dSUrRqNwq7hw==
X-Google-Smtp-Source: AMrXdXu4nBhl8pMvwCzOPf30JraOhXnT06IOwYElLA6qMZkDa2SbP+ArX3YGeAyG5PBSwbBBr3bXQw==
X-Received: by 2002:a17:906:48cb:b0:86d:d334:b90b with SMTP id d11-20020a17090648cb00b0086dd334b90bmr4415264ejt.67.1673996313451;
        Tue, 17 Jan 2023 14:58:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm3919762ejg.223.2023.01.17.14.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:58:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
Date:   Wed, 18 Jan 2023 00:58:24 +0200
Message-Id: <20230117225824.1552604-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
according to CPU frequencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 50 +++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 7d8e31b84959..fc932a059d9f 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -49,6 +49,7 @@ CPU0: cpu@0 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 0>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -66,6 +67,7 @@ CPU1: cpu@1 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 0>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster0_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_0>;
@@ -79,6 +81,7 @@ CPU2: cpu@100 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 1>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
@@ -96,6 +99,7 @@ CPU3: cpu@101 {
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			capacity-dmips-mhz = <1024>;
 			clocks = <&kryocc 1>;
+			interconnects = <&cbf 0 &cbf 1>;
 			operating-points-v2 = <&cluster1_opp>;
 			#cooling-cells = <2>;
 			next-level-cache = <&L2_1>;
@@ -147,91 +151,109 @@ opp-307200000 {
 			opp-hz = /bits/ 64 <307200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-422400000 {
 			opp-hz = /bits/ 64 <422400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-480000000 {
 			opp-hz = /bits/ 64 <480000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-556800000 {
 			opp-hz = /bits/ 64 <556800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-652800000 {
 			opp-hz = /bits/ 64 <652800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <384000>;
 		};
 		opp-729600000 {
 			opp-hz = /bits/ 64 <729600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <460800>;
 		};
 		opp-844800000 {
 			opp-hz = /bits/ 64 <844800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <537600>;
 		};
 		opp-960000000 {
 			opp-hz = /bits/ 64 <960000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1036800000 {
 			opp-hz = /bits/ 64 <1036800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1113600000 {
 			opp-hz = /bits/ 64 <1113600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <825600>;
 		};
 		opp-1190400000 {
 			opp-hz = /bits/ 64 <1190400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <825600>;
 		};
 		opp-1228800000 {
 			opp-hz = /bits/ 64 <1228800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <902400>;
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
 			opp-supported-hw = <0xd>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1056000>;
 		};
 		opp-1363200000 {
 			opp-hz = /bits/ 64 <1363200000>;
 			opp-supported-hw = <0x2>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1132800>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
 			opp-supported-hw = <0xd>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1132800>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
 			opp-supported-hw = <0x9>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1190400>;
 		};
 		opp-1497600000 {
 			opp-hz = /bits/ 64 <1497600000>;
 			opp-supported-hw = <0x04>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1593600000 {
 			opp-hz = /bits/ 64 <1593600000>;
 			opp-supported-hw = <0x9>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1382400>;
 		};
 	};
 
@@ -245,136 +267,163 @@ opp-307200000 {
 			opp-hz = /bits/ 64 <307200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-403200000 {
 			opp-hz = /bits/ 64 <403200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-480000000 {
 			opp-hz = /bits/ 64 <480000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-556800000 {
 			opp-hz = /bits/ 64 <556800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-652800000 {
 			opp-hz = /bits/ 64 <652800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-729600000 {
 			opp-hz = /bits/ 64 <729600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <307200>;
 		};
 		opp-806400000 {
 			opp-hz = /bits/ 64 <806400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <384000>;
 		};
 		opp-883200000 {
 			opp-hz = /bits/ 64 <883200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <460800>;
 		};
 		opp-940800000 {
 			opp-hz = /bits/ 64 <940800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <537600>;
 		};
 		opp-1036800000 {
 			opp-hz = /bits/ 64 <1036800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <595200>;
 		};
 		opp-1113600000 {
 			opp-hz = /bits/ 64 <1113600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1190400000 {
 			opp-hz = /bits/ 64 <1190400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <672000>;
 		};
 		opp-1248000000 {
 			opp-hz = /bits/ 64 <1248000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <748800>;
 		};
 		opp-1324800000 {
 			opp-hz = /bits/ 64 <1324800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <825600>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <902400>;
 		};
 		opp-1478400000 {
 			opp-hz = /bits/ 64 <1478400000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <979200>;
 		};
 		opp-1555200000 {
 			opp-hz = /bits/ 64 <1555200000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1056000>;
 		};
 		opp-1632000000 {
 			opp-hz = /bits/ 64 <1632000000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1190400>;
 		};
 		opp-1708800000 {
 			opp-hz = /bits/ 64 <1708800000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1228800>;
 		};
 		opp-1785600000 {
 			opp-hz = /bits/ 64 <1785600000>;
 			opp-supported-hw = <0xf>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1804800000 {
 			opp-hz = /bits/ 64 <1804800000>;
 			opp-supported-hw = <0xe>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1824000000 {
 			opp-hz = /bits/ 64 <1824000000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1382400>;
 		};
 		opp-1900800000 {
 			opp-hz = /bits/ 64 <1900800000>;
 			opp-supported-hw = <0x4>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1305600>;
 		};
 		opp-1920000000 {
 			opp-hz = /bits/ 64 <1920000000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1459200>;
 		};
 		opp-1996800000 {
 			opp-hz = /bits/ 64 <1996800000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1593600>;
 		};
 		opp-2073600000 {
 			opp-hz = /bits/ 64 <2073600000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1593600>;
 		};
 		opp-2150400000 {
 			opp-hz = /bits/ 64 <2150400000>;
 			opp-supported-hw = <0x1>;
 			clock-latency-ns = <200000>;
+			opp-peak-kBps = <1593600>;
 		};
 	};
 
@@ -3567,6 +3616,7 @@ cbf: clock-controller@9a11000 {
 			reg = <0x09a11000 0x10000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&apcs_glb>;
 			#clock-cells = <0>;
+			#interconnect-cells = <1>;
 		};
 
 		intc: interrupt-controller@9bc0000 {
-- 
2.39.0

