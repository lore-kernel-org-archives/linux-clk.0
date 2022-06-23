Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9492CCA492
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 12:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbiFWMEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 08:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbiFWMEi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 08:04:38 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4375048E53
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a2so32963741lfg.5
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 05:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+tNhadDBx2Mq1kJDMUgdyYtlOpWvGl9xi89nQgO19JU=;
        b=K1lNnZM6p+IyAvah0X4luOkIAjRCrd8PjwvEUx4NLhAq2k6XTJ3kCoxUJaSf+5Sxto
         /BKk5CsZnktWXI6eXrl4oLplDKnUcnGAI+j7MdV+ZWloZON39ZlxgKZosahAZYk7U7we
         DDrX4dlckE2xYUM5/mJtioDg7wKV4aWfhYKaZ7va0cnOxIxzeBPCMmbjjSwAq+KPaqJR
         a3OK5tLDCI061JuSEB8aKZxO46VCi0xgB4zLFgMKFYmPD9EdBZRLw33nnTv3XYs+prS1
         ccxuWzMIzl495LZMrGn364O9DwcarDN3HTIl4Hl3SoYpGYgUehUh0gWewbEz0JY1IEJa
         62gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+tNhadDBx2Mq1kJDMUgdyYtlOpWvGl9xi89nQgO19JU=;
        b=GJkI1o3ei5gfuFst8mq3hjs+DCxUrExvvD/wnB8V68imVH7PUiX5PRLtKQtpIzeX8F
         wiOZeLlpjsZvOhkXfWffK96sUcZJt7ZbgM0bfj32vV97IH8Bbjs0W3DuY63m43s6g1Qk
         /RB/za9jK8xn3zBdQp9SLe+Ym+LIfA1cA0FbXJe+0ojbWvQiY3muHVpDk/Enck/reIjE
         cGnkS1+lf8MVmdx8HtbCjmzFyE29EK9Wag8OKmHqQCx5ckuzM+HJxiOYFIHUU2uNtqxC
         NkI6TPnjip3PccSwJOswRwIMBIOsvDHHD5ATSJ9k39wIYOTgH3lRCoDJ7KFFwGnG93ut
         8ohg==
X-Gm-Message-State: AJIora/2upYOfppnfh+yS0bd33iRzUp90cAyDjT1oi+qDFjhRqexosFS
        75KD8PaKlJFj++QKzPAqNGEtXlLxyNv5lQpp
X-Google-Smtp-Source: AGRyM1sOZReogl6jPV0ye5gLuAo10dUlFv/zeIYK9LQfzy+h8jO3gfY6Jll2MYYR+30XCNHK+hIPIg==
X-Received: by 2002:a05:6512:118a:b0:47f:93c4:fcb2 with SMTP id g10-20020a056512118a00b0047f93c4fcb2mr5066704lfr.39.1655985869003;
        Thu, 23 Jun 2022 05:04:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 12/15] ARM: dts: qcom: apq8064: add clocks to the GCC device node
Date:   Thu, 23 Jun 2022 15:04:15 +0300
Message-Id: <20220623120418.250589-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we are converting this platform to use DT clock bindings, add clocks
and clock-names properties to the GCC device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 72b099ed4543..9ea279f04a78 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -815,6 +816,10 @@ gcc: clock-controller@900000 {
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
+			clocks = <&cxo_board>,
+				 <&pxo_board>,
+				 <&lcc PLL4>;
+			clock-names = "cxo", "pxo", "pll4";
 
 			tsens: thermal-sensor {
 				compatible = "qcom,msm8960-tsens";
-- 
2.35.1

