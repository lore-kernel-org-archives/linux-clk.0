Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF59C3DA79
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 04:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbiLZEWj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Dec 2022 23:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiLZEWO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 23:22:14 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430475F4C
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:08 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so14652303lfb.13
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaGBZm9XOHdhHqe4KYTQ28e7yXtOmnBOw61TUxGxm5k=;
        b=qLsODe8ZuxYPrZAbOtyb38xp9A89wzwHpEyrUQYCs6ckZrrWVMhGl8dZCPZOTGH8eR
         m7BqgjioD8Fej5vIysG6MkdS8LSVZsfsmv2aMnOrC7zEdEWWFnHWRa81vpepshAmrE4N
         e9v0Eda3CvBhEffCGSxZuZHiqAlYsDfRV55NaVs0vuqGIRfpsPEWM9emzRJ4iA4AYdle
         4//qzUqXQsWrMB29Fz0Dtruv1OOeB5AXoJHKNsX3ku1ouUx/9SWqnwrfpDWq5e6Yhm+x
         QAdfQqT/u1vQuukvy629JLDf7M9Pe/WCd7iMtzAFFE3LXhtdBd0KzDqEZyuhon382ePH
         8rfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaGBZm9XOHdhHqe4KYTQ28e7yXtOmnBOw61TUxGxm5k=;
        b=rTTHBXrZ3X1IXqZLysXH+f6cfRwD3jbkCtfrcTicgOcvB2KJ7YYb7hItxTOg8vCSjE
         VFZT73YRyylnwkxdX5iBqBcW50enkEJjZmrjOSGB5HoatU10Zg6qjOlnuQt0v43Vk0Eg
         pQHkeMgVsIgf8LjlfTPjjkI3cRi83a4yVAOjE48tPERZusLKefxkB2XCc8VXOH4dOZaU
         HrMQGRYqWbA4JOZzzXuyT1oZL7Z1nxQs4d9INTLcbpia3RnbRSc0cN8YgrodIffA7pX3
         wqTsLkA5u+LeGDmQxiVz9pBZ9MhVEFvmC6UkTIYIr5DYDiPjxIFT5r6m++Z4uuXuTHR2
         dy4w==
X-Gm-Message-State: AFqh2kq1+HCe7v7gJv3bwUcWoTaYBzACgQtHnxVNSqapRyMjaSBcA843
        F6Ydo3pXtJY7uqhzdML46o60Bw==
X-Google-Smtp-Source: AMrXdXvtiRo+vqrragM5g1xfti7wxlrI/SLa8CIobg4X6HXpizWrlLQhDUPkAHap8ev/H68xOLQXYg==
X-Received: by 2002:a05:6512:1094:b0:4a4:68b9:19e7 with SMTP id j20-20020a056512109400b004a468b919e7mr5402453lfg.15.1672028526406;
        Sun, 25 Dec 2022 20:22:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:06 -0800 (PST)
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
Subject: [PATCH v2 16/16] arm64: dts: qcom: qcs404: add xo clock to rpm clock controller
Date:   Mon, 26 Dec 2022 06:21:54 +0200
Message-Id: <20221226042154.2666748-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Populate the rpm clock controller node with clocks and clock-names
properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9206ab13977f..4721b3139df0 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -230,6 +230,8 @@ rpm_requests: glink-channel {
 			rpmcc: clock-controller {
 				compatible = "qcom,rpmcc-qcs404", "qcom,rpmcc";
 				#clock-cells = <1>;
+				clocks = <&xo_board>;
+				clock-names = "xo";
 			};
 
 			rpmpd: power-controller {
-- 
2.35.1

