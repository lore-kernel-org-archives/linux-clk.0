Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D7AC678D9
	for <linux-clk@archiver.kernel.org>; Fri,  6 Jan 2023 20:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbjAFULA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Jan 2023 15:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbjAFUKm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Jan 2023 15:10:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899AF840A7
        for <linux-clk@vger.kernel.org>; Fri,  6 Jan 2023 12:10:41 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id cf42so3546896lfb.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Jan 2023 12:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjPB6qMW5CCrupsiViZnWcfIPvSm2Sn0b8lV/kmvycs=;
        b=fiycu6f9SM9Qtvt4lC3tNhv6teCDNmJVHyj58FWRNeK0Fp03pk1Vnqq5U7Y4x3nfLt
         KWXrya3wMr+nx9JFkKDDcfsemDxzoZ4A2vwrF9oRX7k6sAKd6Icnhqux9/nmfkbaD4BI
         PkNm4eME6SGquYHpDEVfWUzLNknfBpo8W97WE8ESIVQ+8mCfWnTDysR9Zueu+YEEpFcl
         f12MQAnMa96SCcdbTKrI3v3E2cRBCJfdL/lSpv86KJa6dBrd7OSuaTkor033iRydsUXp
         BeEqM9trnbEehpSsd2kGd+vvESTQtKEVQBFVQRYvdMkIshK9Z8YUIqSsAt7RkdzvE/s/
         LTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjPB6qMW5CCrupsiViZnWcfIPvSm2Sn0b8lV/kmvycs=;
        b=5rcIE43ZSlDvqf7aR+xElZH6KhWnwZo0GasCTFhSVOxjymhHgwdtaRzDHmpZtEz/Qr
         5QgxNZpFvMt3mkAxbwGOVszpQsGOZBY/0Qc8pOOT9j0bgFQikRTLLv493Z8m10/JEdHk
         jjVWjx6zjMUeyIM5mbXNUUO2hORe3391s/vWCfQysPWZPUk64NdlMSmZtv5Deb4ed9lU
         vDMoAC+2/oORqeQw/tn0ukqVQd/TK13/fWi01YC+WQ9Nb+PmLCk2xvZCUtYGCo4k38xq
         TPrYKHPPiy4qtP11RlFT4DWYNIOhebg/WRPkn4qLc7OaDpvUTAZXB16zJh0+HktIez/J
         0uQg==
X-Gm-Message-State: AFqh2kr8QH90dGoIFbCvQkInK/TpW+Ryd4nNRZYUGOQcavEP0RdXKrGq
        AeZaczA9za0EACMNLgUakPBLSQ==
X-Google-Smtp-Source: AMrXdXt8wl68v8XvhFZ6lYEY21ShlaYEfGBja0VDtA8DeQOt+TRWmuY5YIn8qmWT0jSjvdWGvExG0w==
X-Received: by 2002:ac2:5f43:0:b0:4cb:2c19:ec26 with SMTP id 3-20020ac25f43000000b004cb2c19ec26mr6719874lfz.35.1673035839977;
        Fri, 06 Jan 2023 12:10:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f14-20020a0565123b0e00b004b7033da2d7sm260875lfv.128.2023.01.06.12.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:10:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 11/11] arm64: dts: qcom: sm8250: drop the virtual ipa-virt device
Date:   Fri,  6 Jan 2023 22:10:28 +0200
Message-Id: <20230106201028.1809541-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
References: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Drop the virtual ipa-virt device. The interconnects it provided are
going to be represented as <&rpmhcc RPMH_IPA_CLK> clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index b3ab2896a6cc..af298dec0568 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2215,13 +2215,6 @@ ufs_mem_phy_lanes: phy@1d87400 {
 			};
 		};
 
-		ipa_virt: interconnect@1e00000 {
-			compatible = "qcom,sm8250-ipa-virt";
-			reg = <0 0x01e00000 0 0x1000>;
-			#interconnect-cells = <1>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
-
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.39.0

