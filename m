Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA0AC04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbiI1PAn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbiI1PAQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:00:16 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D307A193D5
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a3so20736705lfk.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LtgKFbu4xqrBfa/UrtX2sBDc1GeFUYPgf38w51iW7Nk=;
        b=Iv35MiLznn/D0K8UTRyRcqgGBwwGImiPAYgqYnb+ZzlkVb3BcS9NVIUNjDYi5nB3Pb
         WK9EjEtjpWBDVSFuE/lQibiPhn74MWHfsx62bmFd+wjS7yMLouMVm1+sZ0gZ5SGOhM0a
         WoOagqQkrTPRLTvdtTvcAUb9/tEKt1DP2taUN3ghOLOJhHTlV+2ZBvezH8TNRIwzBsEf
         B5JrOa4tRWAdAhi7FRmSnraHrrGcfBPqEuhCFwtU9z1gZaUUxvSBSQTP+8AyVuxms1lS
         hgMN6fhk3oQQAbMwQaLaCYk7HeyOevF4zQ4pwXgahvyGnDV/AwqKONdSNnXXsfU41kDJ
         icmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LtgKFbu4xqrBfa/UrtX2sBDc1GeFUYPgf38w51iW7Nk=;
        b=4kscg3tEYZoH6MDdYyjQJNBf6SqJXBEvruiVZdsiiImsM9gF4d4cYEeDUGmz9LXMcJ
         i1eTwUoAQ9fSRNhpmPUYDb3uxsIZ/mERQJkCRIgRlJMA27/J6XarUnSF3dOx5H1RU/Oj
         RZxdmlQK6tCCpKmhXAVGuk4SG8sQraBpyLYYJxyEcV70aQrBo7m/mtieGas9ksJ0dqVE
         2PQZwxqTRrff3SdSZz/V9RQsRP0NrLfXmAuTIX9LPfg1NAT3d93iZKMxguojz6fw9jsG
         FDnz2boLga32X17KGAqtAcd6fkxpPLC3mAb8PpHBUO7lrtYwiQxT0FlDBnHINVaXMMsj
         3hlA==
X-Gm-Message-State: ACrzQf2S5YqtFojeLrO3Up09U1t9IO53XiEgXUf45wo0U3L9nqWVm0o/
        Uy5XNdn2rDL74gxl0Mw0xdQvGw==
X-Google-Smtp-Source: AMsMyM4FREszGlL2+XHKulFWgB1264kaoph75qVa8jSSu2nL5puYWiGKb2yxb9iuFhfkdBFVhDkWoA==
X-Received: by 2002:ac2:57c9:0:b0:49c:3e64:de95 with SMTP id k9-20020ac257c9000000b0049c3e64de95mr13703590lfo.452.1664377207499;
        Wed, 28 Sep 2022 08:00:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
Date:   Wed, 28 Sep 2022 17:59:57 +0300
Message-Id: <20220928145958.376288-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add clocks and clock-names nodes to the gcc device to bind clocks using
the DT links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 810a163ca14f..68ef494ca87a 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1054,6 +1054,10 @@ gcc: clock-controller@fc400000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0xfc400000 0x4000>;
+
+			clock-names = "xo", "sleep_clk";
+			clocks = <&xo_board>,
+				 <&sleep_clk>;
 		};
 
 		rpm_msg_ram: memory@fc428000 {
-- 
2.35.1

