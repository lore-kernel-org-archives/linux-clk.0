Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50150FA3749
	for <linux-clk@archiver.kernel.org>; Sun, 30 Oct 2022 15:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiJ3Pzh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Oct 2022 11:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiJ3Pzg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 30 Oct 2022 11:55:36 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B233B4A1
        for <linux-clk@vger.kernel.org>; Sun, 30 Oct 2022 08:55:34 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t4so2713777lfp.2
        for <linux-clk@vger.kernel.org>; Sun, 30 Oct 2022 08:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SknTmdpytaVoqgEhV4VIoKMy6fb6ElvI7+52rPABNIg=;
        b=z6PgYoPKULoMtyhXyvnfdfdc9H8b4xcfIWYSimuwDeXxsPk3p852HNEIuvseW8Sodh
         XYtUrSyaxLsWy3NhVf2TOiQXuA0OKFWBVAyKB4eB/VokhHE5Ulfg7obsoyioRYkjrJZ5
         Cjg8zRHfhsIlP0YhyPW6SCSQEfyAEsrcffKZiHnHPPM6jTHpp6VUZbufd44HtVjd+rSr
         9SrGpYpqX5zt+g012rC+ec/2gjinq0QOoVJB1NVFcQjOeEnYVPI+fh636o30jwcBQS4c
         oh0Xk1x2s0OwCJCpBzYtvr4XJXxnYNK55rnEqaVsHr0EoVPpd6EE4qdUW7beymEtPyAw
         329Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SknTmdpytaVoqgEhV4VIoKMy6fb6ElvI7+52rPABNIg=;
        b=kuxenrNNQEY819EJ5B+jS3jTrOyTUDugSJEysYU4RsI0qsXaqS6cTU7jd1D2IwlGYP
         LolsobWMKUMNolLfA/Peuls/bNa3fIctsG/iBwhWarqiDiozjCtF+pfCeCNLCvugsDTX
         8pWKDxqQ/8Dm5U5PMiqmM5AUgSk0mSGFf6Wr/Lt28+z1IlVy2YfoFYEssuDGg7dApsO3
         pSE10mQEbfBhWqfmKFlejM85wT6stN1WlrGN/PbOtjgrgVBHsfvJ970ma4KchLhnRPub
         4+9laZVYZkj0gDx9fPS+dh+uDjmNh59jMT+37TfDaFH1UMxYmj9pDkXzV07i1I9piGvS
         laIQ==
X-Gm-Message-State: ACrzQf1vMZXhgsqo6AHskD3njix2C9adEE6O/BMx1yMgE3pz3xxP07l5
        t02FmaPYhWJsjgGxzjqwG/GUOA==
X-Google-Smtp-Source: AMsMyM7ss24luX83icB/8CUTch7wgGolrzjJUShn2J7NJWWT4/pTr8HrrtZPeYas0dT8xgEo0RJb9w==
X-Received: by 2002:a05:6512:3da2:b0:4a2:6fb7:b64b with SMTP id k34-20020a0565123da200b004a26fb7b64bmr3414609lfv.442.1667145332868;
        Sun, 30 Oct 2022 08:55:32 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id f4-20020ac24e44000000b00497a1f92a72sm842982lfr.221.2022.10.30.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 08:55:32 -0700 (PDT)
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
Subject: [PATCH v3 10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
Date:   Sun, 30 Oct 2022 18:55:19 +0300
Message-Id: <20221030155520.91629-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
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
index 7f8b4356ccdb..4e70f51c8750 100644
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
 
 		rpm_msg_ram: sram@fc428000 {
-- 
2.35.1

