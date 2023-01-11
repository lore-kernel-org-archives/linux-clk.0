Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA8C54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 20:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235735AbjAKUFi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 15:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbjAKUFN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 15:05:13 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F50344352
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:39 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bq39so25246656lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 12:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrcNxK9Y+DcgHqm/UsDl3fgR8jlK0PF2lYfm+cSn93I=;
        b=Vh8j+egJ7ToeOFqmKvwRDxL2WQrbG7EysITmLHKEw9TO528IxMMhPROAd8yM9XKI4N
         Md5qk073k6PTrxBdCeWvEz5vmPK7kMLa2j2ZJhRYiKsBZGt4HPhtoGP5kN2XSj6tSr4j
         a/39OYw7LbezjVTHT0WfavsM2bRU9KBBPfIZ85pOo98A55QO4XiBzmjFUONMGMqxMnC3
         nxHd0OIP/IdPelG7mOHz60n2lnhQzmbtInGcgYBPHkD9LNJWzYDuCPDdpY2MWim77xzf
         HbgDFBDeHoMC3NzFava0cLR/fBIg7YWt/G1/P2r7vOsotWsRv1aqIEK/V6d81k368Ulp
         GCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrcNxK9Y+DcgHqm/UsDl3fgR8jlK0PF2lYfm+cSn93I=;
        b=lSzMmDcL164vWVC9h3Qh0n7F4OFP67cFBs/9z0a1YOV08Z+chISf72zOOoyn5xLLQF
         9fDYvYQmzKe3CLm6ZdrWmxfbGDOv5Vev8jnqr+0Va8FxjrcKbpWxATXorcI7BItDkDcj
         BDw8UHx5w1nJj7qRuBVreo77b++aZCGIW9Bp9C4++hzMUv99TLoMF8sJs5tZ8a67o1AU
         DsmkMgS+EMHmnmIDEzoGDVSu6EOFcPDfKsp3mCo7Q82hc8ovDJu1xyMsJtT5V3v3VUj0
         YdS8q9fMD0b1qA7mB+pYWOCoOojJmnWxXRztMrA689SP2ipz4gGX+IZ1yeDQ18IijQX4
         hHoQ==
X-Gm-Message-State: AFqh2kps90FFTK5B32LZRh6dAoUKJ4WljmtDYcuSUGYly79cBNOVo/pd
        OUUd7uAZSLz9/GJ39LfgD0c62g==
X-Google-Smtp-Source: AMrXdXsaDClN0vuBlujdqZnxkRnsmvEbNO55rqMUGIL2WCYe6/6TZ5jBxS7cGLnAgFBYvf2AN7WMKg==
X-Received: by 2002:a05:6512:c01:b0:4cb:3449:1354 with SMTP id z1-20020a0565120c0100b004cb34491354mr12232812lfu.22.1673467298572;
        Wed, 11 Jan 2023 12:01:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:38 -0800 (PST)
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
Subject: [PATCH v2 14/14] arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input
Date:   Wed, 11 Jan 2023 23:01:28 +0300
Message-Id: <20230111200128.2593359-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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
index 8a35a785b4f7..37ebd8a3b2c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2946,8 +2946,8 @@ kryocc: clock-controller@6400000 {
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

