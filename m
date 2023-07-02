Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A370C27C44
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjGBRnk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjGBRnO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:43:14 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F286E59
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:43:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso53921541fa.1
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319792; x=1690911792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3iVCt7nS+euIxpXidw/3v385QWRNdeTuls6EQqgHh0=;
        b=FWVdcPcQM0oDX7YXc1hgasumud57y5IH/tcRSF+Z8YRQjkfIHq6ewN5IGjP4MyUJZX
         kiiKmNoV8ixbCH/qLyvBrtczqfa9NWfTzrlMki7OLrjNXy/FPPQhAWMjfJW1hJcGRKJC
         820KeUqROhpKxwX3TpOongGe20QdY4njeT+ZtxgKaW3fWwylcZKK1DAzTF4Lmi4RCcqG
         2wrsC+usDOyWUHu0uCo5Y0LPQ+0IEPF92Ltjq9brtjwnxpCE+bDFiZF8s/fnySRut9fd
         Lkpzspw/0Jc6qbL96bkSolVK1QxUIR7QuAv7hbXWh3iP6D99p72md0DW3MVKwVtg/nhJ
         mmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319792; x=1690911792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3iVCt7nS+euIxpXidw/3v385QWRNdeTuls6EQqgHh0=;
        b=Duw1zM4eJ+JAjIqB4xPOpYSFEymTuT2cZ236DFKriifOkXyYT9Nj1Y7dPq2siZfEmW
         H3RewGklS8HNViNsAmMk2XzXxRAuoGpxD+aRLyHH2rsxk17t3qRUSs5ijuHvTbaU4qeH
         nFMUatYAuuaThSSRTxB/UckmqRFrBu7YREpMLABx13/W9YFgnJ+n6U+AmfkbtdYiTzv7
         BYW6n3RZNpTSQeSNL0uP+dv0DJxUesWQ+QzTIeIL5QKnAKZ2sjHuIgCD4dEPloHdOYaJ
         EFlk1ADweSp9tHcUZKznNdpDB1XgryzCOm1A5Jsssn1pjDa6ceyvBik17NvfK9ldCDwP
         M0wQ==
X-Gm-Message-State: ABy/qLYT+6bPUMRozbC84M5x/b9apjUfZwqYYTgEN9UYi6TAXYS+HxDv
        iqIhSXsRFt3WxECLrV0sYq1urkAbVgHztysanec=
X-Google-Smtp-Source: APBJJlGUFIcXD9GA76VfUeHACSqBSmGW1Heb75yKtmzwl7EWw9fDwWQbsPOmnA68jFGPBWfJSlXLtw==
X-Received: by 2002:a2e:8257:0:b0:2b6:d084:e589 with SMTP id j23-20020a2e8257000000b002b6d084e589mr4307228ljh.47.1688319791965;
        Sun, 02 Jul 2023 10:43:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:43:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v3 26/28] ARM: dts: qcom: msm8974: drop 'regulator' property from SAW2 device
Date:   Sun,  2 Jul 2023 20:42:44 +0300
Message-Id: <20230702174246.121656-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator node show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index a4ff1fe63903..bb4f08d40ca4 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -416,7 +416,6 @@ saw3: power-controller@f90b9000 {
 		saw_l2: power-controller@f9012000 {
 			compatible = "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
-			regulator;
 		};
 
 		acc0: power-manager@f9088000 {
-- 
2.39.2

