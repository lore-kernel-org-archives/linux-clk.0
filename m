Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFF4C7EE3A
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 20:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbjEAUeQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 16:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbjEAUeO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 16:34:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95832D57
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 13:34:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4edb26f762dso3599519e87.3
        for <linux-clk@vger.kernel.org>; Mon, 01 May 2023 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973250; x=1685565250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAxH9rWCk/bpezJ8GFL6XWAviGE5bfFxt6Nmj/QILfo=;
        b=UoS+O0XjKskhozCJF1BzTkblrM3ESP4xbCUF0PQbD0VoLqygD+YHha4IKbqiIdNE1+
         3iLwyFZwVPaVJeTuhgJCExE16CkAdEpeefmYs8AHgst3aQt70erCwi1uSI7CGa5x7lO5
         cquQ+n2a7uFPx6UbKyHz0YrsnX12JikCCvWld+whFNQR5NZfOXyRzawJDcyMFGjMHp8x
         Wjjk9WF4cXDZTDwZnniAWCW/Xzy6ImuWmbhwFCU9gi7aEkS0gDDhrrjl+5BX8AUxxj/l
         G7p/JV5QhLgYoula6BXsQuBTLElszZtl4gZVlhBdADVAsSW2j37owjEOlyyqZf5S5u3p
         rI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973250; x=1685565250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAxH9rWCk/bpezJ8GFL6XWAviGE5bfFxt6Nmj/QILfo=;
        b=aStvAc3Fn0gHDN1f5L5x0ko6Eby2xdR4Xhidt9WtnTWwbwVs9MT/6OGirFLrdPKfav
         dz0+efXBjWif6bYAHg0GRPmiVfq90k8YdWLlhh2uvtpBMql5hNYmiWlNvFMHhyjE+E74
         nM8KWDqHdnAPt3oXHffnzo5Z6uHJO2ZNHWKaTuohQnQBubcZhRMGAk7cijPR0eJRl+Cz
         4r71bejMEELK9BKa3lPYDhCjuNNG8HbbQeADPGWY3OvCzW9YwPsJ6PpuD/6lIFsoaWTQ
         ewqvEm/cmmi3dLCXdrkdUw3aBBgMTbT+f1slanbWxDr3NHz7AXb37KS8Xz1o6kibc3BA
         Wtyw==
X-Gm-Message-State: AC+VfDx+GZhNHE9In78k8oqUxhSC40Io8M1aqn2ZSF+o7WPzfqoMC7ya
        tNKndzN526IFfGTGDz0vxjvx/g==
X-Google-Smtp-Source: ACHHUZ41tcIugchhXd5BECUV/v1wRfZTDaMsvNUst3/lnUFmjxG0o/tDSE0Z+mvNrs1udgvr2VTF0A==
X-Received: by 2002:a19:f80a:0:b0:4ed:ca97:2feb with SMTP id a10-20020a19f80a000000b004edca972febmr4557562lff.61.1682973249915;
        Mon, 01 May 2023 13:34:09 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:09 -0700 (PDT)
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
Subject: [PATCH 09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc device
Date:   Mon,  1 May 2023 23:34:00 +0300
Message-Id: <20230501203401.41393-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify clocks used by the LCC device on the MDM9615 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index b40c52ddf9b4..556abe90cf5b 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -39,7 +39,7 @@ cpu-pmu {
 	};
 
 	clocks {
-		cxo_board {
+		cxo_board: cxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <19200000>;
@@ -113,6 +113,20 @@ lcc: clock-controller@28000000 {
 			reg = <0x28000000 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&cxo_board>,
+				 <&gcc PLL4_VOTE>,
+				 <0>,
+				 <0>, <0>,
+				 <0>, <0>,
+				 <0>;
+			clock-names = "cxo",
+				      "pll4_vote",
+				      "mi2s_codec_clk",
+				      "codec_i2s_mic_codec_clk",
+				      "spare_i2s_mic_codec_clk",
+				      "codec_i2s_spkr_codec_clk",
+				      "spare_i2s_spkr_codec_clk",
+				      "pcm_codec_clk";
 		};
 
 		l2cc: clock-controller@2011000 {
-- 
2.39.2

