Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88080C67871
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbjAKUBL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239576AbjAKUAV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:00:21 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567F5431B5
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:58:00 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m6so25171729lfj.11
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B63VT2XNdTplBaf20FqUazw3bzmszToy+dO5wC8xTz0=;
        b=aUMBsBAHfA+ZaxPBCUBkqMITZvJvJgSgI0ZGveTFy5Xh8suXUtImGmQChPsqQnFTBN
         15G9dRPzA1pZsdhduCbnMnqBsUYixm3V+L8VyVyef3PCk8OisHoMlctSW2bzhV6+UkTE
         vEycLicjVdwflzo8M6bvrFjrOTa0V1BI1Ny1A4i8Tc6ozQGt+1qGs7x2Bywg6BUNh9uj
         S8f4okhhrCxVRbKByJ97Gb4q6DKr+AfquyRg0exDObqM/Wb/nysebjJmi8cwnYXs5OFT
         iRR7fmb3DZeGn5xFGxCDP2m3LQ49stgx5VN6iBdX/nbaa6nBWa0vAngxoQDNVgRn0LnF
         KvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B63VT2XNdTplBaf20FqUazw3bzmszToy+dO5wC8xTz0=;
        b=C8LWi2dRuVmoQspbC9B/GQfg1qwE0A47xJ9bFTxeVCldBasUjsrntTjX4n89zYFpqy
         oAqwiMS22UaUORKirPiZVjq1jJiWiE2AWKXealwwMOeevOGUof32ZT+LS3hqPsSCqnkl
         PgdVQ3FHSyOOA2u3X098CjiVTuIr7rO8MV9d/Ai1WvRG1AKQfaOs+XqQNY7U7m3QnMKB
         XlLMhlNKsUp0W94sJ0NQhy7uUxiVuBRDW5vx8wKuUaVlq3bjqFT5KJws23ynnEb4T6o/
         fc/OElHoGqPh8W5apso9ZLkrOI+nkW+c0h1dnhGLvXSJtptOWdrrt6gfUagUS4d2kCP1
         izeA==
X-Gm-Message-State: AFqh2krsUSzehAoIUXGfmQOr6Y+ZHno1MC+k5rofBcpaeex4MZWVeH+j
        Dq0flX6zA7DB0usk2RitoFGaIg==
X-Google-Smtp-Source: AMrXdXs4lnJF93IR8FGah7mj5Bc34Em1rzzop+W0wKRE7YR9p+NwYw2SfRZXdoh/ZswMj7EXGlBe8w==
X-Received: by 2002:a05:6512:b81:b0:4b5:869e:b5ec with SMTP id b1-20020a0565120b8100b004b5869eb5ecmr3154707lfv.61.1673467078656;
        Wed, 11 Jan 2023 11:57:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b0049f54c5f2a4sm2872452lfc.229.2023.01.11.11.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:57:58 -0800 (PST)
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
Subject: [PATCH 4/5] arm64: dts: qcom: msm8996: add CBF device entry
Date:   Wed, 11 Jan 2023 22:57:53 +0300
Message-Id: <20230111195754.2593134-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add device tree node for the CBF clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 37ebd8a3b2c8..e5a638b85ffc 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3558,6 +3558,13 @@ saw3: syscon@9a10000 {
 			reg = <0x09a10000 0x1000>;
 		};
 
+		cbf: clock-controller@9a11000 {
+			compatible = "qcom,msm8996-cbf";
+			reg = <0x09a11000 0x10000>;
+			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
+			#clock-cells = <0>;
+		};
+
 		intc: interrupt-controller@9bc0000 {
 			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.30.2

