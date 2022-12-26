Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D131C3DA79
	for <linux-clk@archiver.kernel.org>; Mon, 26 Dec 2022 04:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbiLZEWc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 25 Dec 2022 23:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbiLZEWL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 25 Dec 2022 23:22:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F8955A3
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:06 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y25so14675499lfa.9
        for <linux-clk@vger.kernel.org>; Sun, 25 Dec 2022 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYtAPbaOIrpvmuNd+Z18UO1jiB4rVtL7fqIVx9X8Dkw=;
        b=xijE81+qRG/+QaiHQUIrDo2nHp8Q1dJL8Ql4C5JNlw753HBQ3O5S/YpuZIZqCStDwS
         ZdX3V88sgNikYIMeyqZP7DfvGPfCrnJq2/mNa6CnwilYPm0OJDE+rReKYbqgCIP51uHp
         X95f/iS2fBm9HFmvcVAlahTlqF3UZV54F+5z62O3PyJ/uit8CwWQxS9yVMRuYPAwZJJn
         6D+F7/mpXgjE1eD5MfQM92j8di0qwhKqwEfepXxFkpJ411qW7oylxYODP8TelsmnFqZu
         lAkZxTMJhZlHfORpiTQ+27EO1vKCvp8JtWp6eqrdKsE+8G4nplC9zggZ6NRC/A3V8ml3
         jJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYtAPbaOIrpvmuNd+Z18UO1jiB4rVtL7fqIVx9X8Dkw=;
        b=o3jWUe9wRqZNwsnwzatfZAPQsXvWqZG8BZ27TdmqpHxnfsgIhTonNiykI+Mop3UgwT
         b2QQbSsIWhDf9vu9ps12Ts68JFA+Nh4TbMRizwfkXjfXUtBQyMr1JM8f9z2G9hiFuqAx
         HXcD1Eg/frfVcVR7hwqxKsQAVqT5IXm1c+tQ627tVc07X9+gGUv0g9NcFwdXnMgtFW+S
         pP813q375d6Ok6INoBHsYI8pPywj9pQx0qti9XdpB6M9dCQCImxXxU4CZDLcsrbtfg4e
         Q1lS817TjFmtHzmVG76OpkwbiFazUYxZghnSZxliFXFWTeXlYfZxtng6GqW6e+27F9I4
         3/gg==
X-Gm-Message-State: AFqh2kqxOJAGrwVKNaloipmTBkrh4DCIpX7z/5Wdv+5jdmLgaEO/O3qV
        5GkAOEAaXZ7ne7KPBnw0JCL8Yw==
X-Google-Smtp-Source: AMrXdXtZFjRronhgYVZ5q4X6RAAPYK1UKVSP5s1hEQv9hUf3v2yfLOkSIuo9uN5Cb68mERnspmFs8A==
X-Received: by 2002:a05:6512:b14:b0:4ca:f5a1:8896 with SMTP id w20-20020a0565120b1400b004caf5a18896mr4290367lfu.37.1672028525134;
        Sun, 25 Dec 2022 20:22:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:04 -0800 (PST)
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
Subject: [PATCH v2 14/16] arm64: dts: qcom: qcs404: add power-domains-cells to gcc node
Date:   Mon, 26 Dec 2022 06:21:52 +0200
Message-Id: <20221226042154.2666748-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As gcc now provides two GDSCs, add #power-domain-cells property to the
gcc device node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index ffc4b081bb62..b72542631337 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -729,6 +729,7 @@ gcc: clock-controller@1800000 {
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#power-domain-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
-- 
2.35.1

