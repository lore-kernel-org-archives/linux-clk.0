Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16465CA1013
	for <linux-clk@archiver.kernel.org>; Sun, 27 Aug 2023 11:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjH0LvU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Aug 2023 07:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjH0LvC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 27 Aug 2023 07:51:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248A819A
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5009d4a4897so3531972e87.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Aug 2023 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137053; x=1693741853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rzx9Bm824S2wRWYFO7S2MdJvHvf/jzSVekqRFumNr7k=;
        b=VKlq61LG7eiUVDlCu1oOs0TkRJTbsYvQqWvjCRgyDh4261NSRyrk6YloVEyca0sTaF
         29YwGLcuj6pb1PlsAaw4qGzLFP67VXskypHQxXeV5Qoj1SFR7jCgT0H+msqeKhdMd9+M
         cDLwdt2Tdlf2U2bSFAIuRR1nqc/1EjZAQakEXu/Oh1IE526FkyhpBnL4ABWEgIlE3tEy
         juQNJrBC6Z3ON65rfiELxGYXrzkTeM4cmNs4EPGZF2ySaLVaHDq1d4DjwseGf6g5LVt7
         vDfduzDIUESXJZ0rz6Ly9LZtPTVI26zgg16V9AGPwTOn3T+ufczczVmkdEFTqBNf0OlG
         AkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137053; x=1693741853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rzx9Bm824S2wRWYFO7S2MdJvHvf/jzSVekqRFumNr7k=;
        b=dNj95e1Bd3O73oQC5/Z1Px2rr37hlCtDdxBxAdKDWh+TfQMQUotE/kL5gngzzt022P
         XiliQYerdF9LTFN/ZkDizb2jXZ6Ls6W2uFt57zVFXwbMWAl1ve703Cird07Aw9ttP8i+
         FbX/4rgwyxDIGQPQYYHxLO4ldGmsIkAT5K/yDoax8VRF4PHgM0Pt9e3KoifkfypUVqvJ
         ZoiQdHFl+ekjxa1sxoWPTn/7+XaSs4PycWKXtsJJosMLG7e5f+ou0m3HliUe9nL2WJEf
         M4VKHJUpBxOPiN91ALGognRVOwBoZQeu4XkVVqaHsTse5rMyN2UwJ8ytqWjkwd5pvZOy
         ufug==
X-Gm-Message-State: AOJu0YzNeu72m1AyzAuUGoq0erj39fG1UzVzRrHUiy12QcwjT+LAPEgW
        zbdccoSvgrZqtufB2QhuT+t4bRp6hQ9+1oKmCt0=
X-Google-Smtp-Source: AGHT+IGqlgoo4wUMXLVlAqHZbEMker1couiI+m+u0qpCzAbR2CI/aAjORLP/ZrpQrfkF8v7v6brvrA==
X-Received: by 2002:a05:6512:4026:b0:4f9:570c:7b28 with SMTP id br38-20020a056512402600b004f9570c7b28mr20427762lfb.32.1693137053533;
        Sun, 27 Aug 2023 04:50:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:53 -0700 (PDT)
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
Subject: [PATCH v4 23/23] ARM: dts: qcom: ipq8064: drop 'regulator' property from SAW2 devices
Date:   Sun, 27 Aug 2023 14:50:33 +0300
Message-Id: <20230827115033.935089-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator nodes show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index c3677440b786..191d1cb27cb7 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -589,7 +589,6 @@ acc0: clock-controller@2088000 {
 		saw0: regulator@2089000 {
 			compatible = "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
 		};
 
 		acc1: clock-controller@2098000 {
@@ -604,7 +603,6 @@ acc1: clock-controller@2098000 {
 		saw1: regulator@2099000 {
 			compatible = "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
 		};
 
 		nss_common: syscon@3000000 {
-- 
2.39.2

