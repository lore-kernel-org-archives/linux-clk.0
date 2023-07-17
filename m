Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B1BC00528
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjGQPUS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbjGQPT5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 11:19:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3143E19A5
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb41682472so7381470e87.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607168; x=1692199168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hib3PW+pD9Vw/aBXh9phjmFHPMYV0WlytMyF3Y7iRI0=;
        b=ySpZsA4uVOf6a6NXu+CgSrkKV5uqya3BOQAA+PS1SpMmvBS6r5JwQ0aEyQoK9ZqMsS
         UKzy/px5q2FbmTiNEmBJRaPJguE6qdd+xTqVBW/b5QDk53EtVvk1y9m0IAAMrflxzaLd
         4vV2BLae/ubxxUqgS42VH34WPIJ3kHI+D0siP70LlKBAFyIll6YRsjHiKeo8AcjyyIlK
         0p7Yk0RvADkVXGaxhTZ7kHf8WBdlpu+U42L7zp4vJFluYWnwWEnrztiF2fRj3GZrInZb
         NLueirZg6JMDXq9CojQ1hzuIi4DwwPYtfRZKLw3xjnlpXcLNuKWJ5JwEwqymz6+cnfF+
         ZNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607168; x=1692199168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hib3PW+pD9Vw/aBXh9phjmFHPMYV0WlytMyF3Y7iRI0=;
        b=AB40at9hqARHevde47lMDNoPiy1++8+Q0QyyYjuIn2KOPUwNzrtDZ5sP0On1yJPQ97
         MsfNODC3WPtc++PFWyeUL6hYbTTbD3IWV/tbaN7QlL3zU8yJhRPa8DR9pB6eS//NPils
         l7cXiQwmubih7L5xhfj8J+Y2fj21rvz4mSxUQr013D3D72pi7rJuXOSAvrNVpqysr8H6
         k2XXQl03/x2wZdZ+QrcVIFAmSoAHVOxqQT+H2h5RpYw8/WWGH3YjMpBKVPNLUkoE8P2W
         NIjuKbm7jAo/IWv4MFhsSuOXAbAki4c7RpEWCGRVfo5IphG6y1mXwQFT4yIHYr3pDNpb
         o3uQ==
X-Gm-Message-State: ABy/qLbY8+354hU+W1VFbuyKr4gMYHN3f24BcHlWmo8zfO5hmD8dCl8m
        R1k4X0qZLnVay78KWA0R5iBZZA==
X-Google-Smtp-Source: APBJJlHAd+cImmf9IAr9Szob0MMlVWb2rHb5jscP1K+qpg1C3WKfO7W8NAOaeuotXyJaqsYCyv3FXA==
X-Received: by 2002:a05:6512:53b:b0:4fb:89bb:bcc5 with SMTP id o27-20020a056512053b00b004fb89bbbcc5mr11228445lfc.50.1689607168350;
        Mon, 17 Jul 2023 08:19:28 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:27 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:19 +0200
Subject: [PATCH 12/15] arm64: dts: qcom: sm6375: Add VDD_CX to GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-12-27784d27a4f4@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=718;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=C5XEfW1WulMPJ7l5fdZmAX7BDZDcdKgcMmWnfi4QWbk=;
 b=lIIYO4AAgn3LQgFkNPM78AvqMep4285ACx41eHmSryMN4ieLlG+4MiBKsUD0PFHAb/5ggeJap
 upV1mIuDrvvC9e87w7J/sOYEIiT3vtWIVYbQWLFanqfT4fy1tBV90/8
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index e7ff55443da7..6fec45b54c98 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -904,6 +904,7 @@ gcc: clock-controller@1400000 {
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&sleep_clk>;
+			power-domains = <&rpmpd SM6375_VDDCX>;
 			#power-domain-cells = <1>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.41.0

