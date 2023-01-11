Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B72C678D8
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbjAKTUb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:20:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbjAKTUR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:17 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E059317E28
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:16 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id g14so17028396ljh.10
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6oxkO9QAPLP0YswH75g78WKyT87UeTs24N1///f/iE=;
        b=GUzn5UYzDux1UDq5x9iKZ0hwiCHxBTdC4+4a/gOGfTQatCqYzPXg1u9laL4niqclbK
         CpJy1E5vVVNKuF13JZRXJJUh+4wgxl8CiPMIneLGducXPFaV4DUEwVpbSyT6LYRotbg1
         qs5K32HRykTy7s0U3UnTXba4a5hPbct7nStNaqX/LAhglEVQFTDftauauce7v54CqYAQ
         Bg+SEBcs2EkKekeZTZYqySjuxGFAq91/qdF89m37d4l+1owcPqKaxntAEWFfigy3biut
         4/L4oA25BMO7XTIWfOpOn+IcMgITki9K24X/Lw7q2Lbelxisgs6NEBH2eKd+cOGhAJ/Q
         afbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6oxkO9QAPLP0YswH75g78WKyT87UeTs24N1///f/iE=;
        b=LXaTk8oOIAf1eAKlAUN0yBSl/0Szx3sgNJV2+b9o3++gc7ckAwBTAvlpIb+b23Ya6K
         he2UDdv0WYCRfpCS82fJRXL5HbyyZ12KBEbRO3BcAK/xcF0kYfGE2S6EtLs4miIf8Nvo
         KjuTsCd5sOkneSMG0nHO/slco2xDAc9etFdudziKGp17SMibjY5+SV3xQcRLADqhibMm
         6Gs2Gwdaokgxg9l7/pCOOoYKNsMLh7C2dXiyvP6PcprczS2n9AnoBWiPc7RyOTTCSYrx
         4oTEp7D7cSvByOcvCa5VQ7AC477H6/egUYsJtC2BSLx7Qvkxdh/G0ATRwuxc7xZYOlEu
         j7bg==
X-Gm-Message-State: AFqh2krhKifc9UUj2XjbEFousK0mWxEghuJJw15hM9TIopIlXvVQIQjg
        6ZEMbvBUxSoP/0Y3uWtxjSfBEg==
X-Google-Smtp-Source: AMrXdXvl0IM1Ir+K7DmFG3Jey9+jyD+I9e8lHBh+JSb7ZROysP5ogmll+FHtNFsKiyGgc5RwSX+hWA==
X-Received: by 2002:a2e:b5c4:0:b0:285:820a:3167 with SMTP id g4-20020a2eb5c4000000b00285820a3167mr2686929ljn.36.1673464816401;
        Wed, 11 Jan 2023 11:20:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:16 -0800 (PST)
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
Subject: [PATCH 13/13] arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input
Date:   Wed, 11 Jan 2023 22:20:04 +0300
Message-Id: <20230111192004.2509750-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In some cases the driver might need using GPLL0 to drive CPU clocks.
Bring it in through the sys_apcs_aux clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index d52023c19682..4e3068bedf4c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2940,8 +2940,8 @@ kryocc: clock-controller@6400000 {
 			compatible = "qcom,msm8996-apcc";
 			reg = <0x06400000 0x90000>;
 
-			clock-names = "xo";
-			clocks = <&rpmcc RPM_SMD_BB_CLK1>;
+			clock-names = "xo", "sys_apcs_aux";
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
 
 			#clock-cells = <1>;
 		};
-- 
2.30.2

