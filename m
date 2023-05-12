Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B73C7EE39
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239676AbjELAcr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239675AbjELAcp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:45 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0E055AC
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:39 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac8cc8829fso84069901fa.3
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851558; x=1686443558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcrbCAngai1gJP+uz7CuGmMzMn9VwTBw+sIaCb/i0AQ=;
        b=XKKdhcbnjkrhqAbtx9NvFsrcaY4WDQ2nGoe6K+WcAFbSUDXEMuH4bAZSSDdIH9rPpB
         yoVpaok7gcfd3Vnzu7AsdrFKadSHy0NdheTNDWyf1DLABpvS40ALroxtmRJXs/UDzJML
         x/0zv+6icepwz5Zvlx4CRbXlWCevq1mbDaZ9YUSzvG3kCJB3IGkno7zz0G/7mFQb7uZl
         BAYH1EsHDNXXaDwBvLuRlhPd3dQavyxDDxsuOWEjW4RxNlKxyPCREkRGNjNWSikSPwcz
         p2v6wabrjomB750MV4Ww4sEsh+cbyYBhlL3zLPuaAuq2fyOi6oADD0Z/E2JSohTxez72
         qRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851558; x=1686443558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcrbCAngai1gJP+uz7CuGmMzMn9VwTBw+sIaCb/i0AQ=;
        b=RqybWYHeFPAH8jRCgcoSY4K507h0jR9jCYvDtRVgI1juhLXAZ6Y8kAFlit5mIBNw8l
         1NnYxDmh7/wz1s9VuvQzh/Pp1fGpXobEYwttVOrPjaOCwrz7ZjKchSh18BTyk73t1ycq
         E/ZIuGtr2IMQhZn6gLFDhOIsiEbQxbGnrLa2JgOIcEYVtU6zHcGQTIWlzpLeSPapsKB7
         o70S8OZtc2+ZKT0+z4q+nLNeWLQByNfiJsSfFfXwjAV9ldk5SSuRI0BZYZgpSXNa0DK/
         StxkUuY0e2Nglr3XAvJwGZopSZyrdnujglVObJadICqpvjrHnCsv5OZ0nps9ZtQxZ7h8
         Y2PQ==
X-Gm-Message-State: AC+VfDxTiEBIw7ec8goYP41lGlfd0n2R7su/klFChrHRH0//m0SFIE3I
        OYg4uZQA7t8VQvwudo1JbRuLpQ==
X-Google-Smtp-Source: ACHHUZ4PkfyS2pLW+IZdpRUbfSgdVlLRsTn8CzuQwzjgVmJNhHiNkn7WbdS7K3CZl9DWdYLW73rL3g==
X-Received: by 2002:a05:6512:1024:b0:4f1:4e95:119a with SMTP id r4-20020a056512102400b004f14e95119amr3036366lfr.12.1683851558216;
        Thu, 11 May 2023 17:32:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:37 -0700 (PDT)
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
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc device
Date:   Fri, 12 May 2023 03:32:29 +0300
Message-Id: <20230512003230.3043284-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Specify clocks used by the LCC device on the MDM9615 platform.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

