Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7608DC04A6A
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjGQPU0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 11:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231847AbjGQPT7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 11:19:59 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D283C1BDB
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso7454288e87.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689607171; x=1692199171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZVz0HHbNacYcZ7SswA3bwyZfWy1YH5AMNjeXJBFPFg=;
        b=rNZgbBZpPSV/suV6tgIxgg4kwXvvWfXFhsYAXsuDsXPyn3ogYa6AhAMB3K/eb7b9m0
         kTlXUad7J2qcGe3C5yzvyjW8qyEJlPRWmHZQpZ7KdpM3bGqMkbFS8KfBSHYo9pGMv3Kz
         V3F+kyEZSClCsJYw06QomxibukGtsnZOUgJiBXHmbcM59vrI3TJrenZleJJAOvikgUiL
         TUASUEtBkdtCPDHxLhb+IzarEOgHsaTSrleD6nlrlFCzFftztEyK26g3Pl0l19DpeAtY
         dvEYD5Zi6rHZI2vcpNtuOW2puNkRGTXxXljnSoc7kwwDio5gAaPICN9qWfL2oAx278VE
         qqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607171; x=1692199171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZVz0HHbNacYcZ7SswA3bwyZfWy1YH5AMNjeXJBFPFg=;
        b=WiqLehKvTH5H18PjqJJigmBprf9vCaiCwh4euYrQpcBKg/+2N7DFstkRtpHWuX8hqg
         cf20EdMXRFZf8PbxJPxWTqiqhRTT90nIM/XoXW8/dfuoU8VUwcMhdBrouappRFkEE08b
         eigjamYQ8s46X1aewCG3D24MENYryzDetYB1gZ+Vwao+RZMVQFgHe/xOd7xez1PuuoXD
         07PnVo48icdya3was2luykc+fKP1eTtI+x6PMn7+wU79ZCIUUvX5Raae8nRlmhnK6bGU
         u+NTlyGtlwESpo2otpdx+CCZeITNdIT6CPI8G+0WF75OJ/uNiSPvhQ+FtQHshyrd5WI3
         uz0Q==
X-Gm-Message-State: ABy/qLaNBPKbY7cTuUe9/d3r7ALn/5PavGirI96LmGWzUib2HKoCMeeF
        rP2+4MOznLgaK571Xxy92AcQag==
X-Google-Smtp-Source: APBJJlE66n6oQEJ427y2dX9pgdTTKd00k6qtINgc9SZdc8nG9vgP5b0qivWIq4kYysk9vggbXLOGXg==
X-Received: by 2002:a05:6512:304e:b0:4fb:89e3:5ac4 with SMTP id b14-20020a056512304e00b004fb89e35ac4mr9148515lfb.66.1689607171063;
        Mon, 17 Jul 2023 08:19:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004f26d63f823sm2873949lfh.237.2023.07.17.08.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:19:30 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 17 Jul 2023 17:19:21 +0200
Subject: [PATCH 14/15] arm64: dts: qcom: sm6115: Add VDD_CX to GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v1-14-27784d27a4f4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689607149; l=758;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=teCmvh/mH8/+KIQ6w2EiUF+9FzEW2n4wijD09cbH2a4=;
 b=Z6lj84tCtOpwyb5JGxRB90l01ovLnN0ixjCPdiYSidGzkn9vehSp80TM9eBEPDZtKZiNTZMJx
 jHf11RCWkK0CDgzc5nJ9DXHOh81HZwyCwcG3HSLvDV8PIeemm2MGyUo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GCC block is mainly powered by VDD_CX. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..29b5b388cd94 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -784,6 +784,7 @@ gcc: clock-controller@1400000 {
 			reg = <0x0 0x01400000 0x0 0x1f0000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&sleep_clk>;
 			clock-names = "bi_tcxo", "sleep_clk";
+			power-domains = <&rpmpd SM6115_VDDCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.41.0

