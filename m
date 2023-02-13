Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFC0C636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjBMNIP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:08:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbjBMNIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:08:12 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41B2B76F
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:08:10 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id fi26so12767639edb.7
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q3sX6YTXGYHIP374Q+pFww/SYTQVJ2mqj5WKR3Qc1U=;
        b=VEMOJGZfRFhuyLg7lJH20ccxW+3/EDrb6KjPSTVbZxOKL1kd997eEqZB5NHItDQ2JR
         NN47Tkm3z2hNxasjOfQMk65BF0iizc98TKQyBmFp+qUwy/HiqXNnucaPV/AcdmEyGM38
         RnxAhSxpCGTz0tZvqez6uLz0fCRoqP0fgTTwshyV9zdlSDdjqA4Ohth5OcH+V2sN2/Z0
         PUuT21Dgl7lRwNvI7MAH5feEHcrK6YCJCmTBAY0uAlXV+jZdj+Mx4DsstF7oHibAi0gk
         63zQ/HcNkHFbDJLGpoI9xVLpU9ZEXhHs/qWCoFi5Sj5P53I6cYpG4JxAj3bhfnwkbRTB
         /1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q3sX6YTXGYHIP374Q+pFww/SYTQVJ2mqj5WKR3Qc1U=;
        b=X9uNFsSUyLMEA+h/HNplbIRx9JslY5p01trg7goFrcxiv1OM1OQUIiZ7/O75wLriZf
         DZdOjTqolP6C9SFC47HZgpxc4Fjo38DSK6fxuOPVLrqYjA5t0BMusBMo7x8zVJC/lsbn
         RJ2b5vfQufQT/slL8Psn1W1My3hevzRPz41nC45g+VeY6uBvTOp7cjzkeQ1TWqznYR8y
         2NHQV0mpPZxwOE4aI0YZDGJM3xLp2Op6jceRGYGTPMK50Vqvl13U+dg3EOwd+Xn5419u
         E2alPQ3r/T1vqhDfXiNg/s7BJicW3w5cxkmoHZh46hPy2fSI9KBjHXeVLqixi/YxTd1K
         HG5g==
X-Gm-Message-State: AO0yUKUKOIJRt5V4+t1JdunV3WgXcsINFy8inyQhthXCj9XzbEX5A2Q8
        uRhi+7VtPoLOur6i/FRX5cR5pg==
X-Google-Smtp-Source: AK7set/xOReg3Jv9h+mSg2lzbM42BxhGyvLmh709X7k41xmwqbg4WQH+BhC2ybGthkhKvGgEut2gDA==
X-Received: by 2002:a50:a44d:0:b0:4aa:b7ac:e0d2 with SMTP id v13-20020a50a44d000000b004aab7ace0d2mr22992579edb.19.1676293689394;
        Mon, 13 Feb 2023 05:08:09 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id f22-20020a50a6d6000000b004acc6cbc451sm1616515edc.36.2023.02.13.05.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 05:08:09 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 13 Feb 2023 14:08:07 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm6350: add power domain to camcc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v2-2-60a507bf3e68@z3ntu.xyz>
References: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v2-0-60a507bf3e68@z3ntu.xyz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the CX power domain to the camcc node so the power domain gets
marked as in-use when camcc is used.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 1e1d366c92c1..62d6dcd8d1fe 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1507,6 +1507,8 @@ camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0 0x0ad00000 0 0x16000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			power-domains = <&rpmhpd SM6350_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.39.1

