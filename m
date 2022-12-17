Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0590C6379F
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiLQAYM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiLQAXT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:19 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB157E298
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:44 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z26so5868816lfu.8
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IakMGoNeAkiafUmQyTYpE4STAOzYx1wLgMpz/v+W8ao=;
        b=gtUM7rgOl3NWuHdHVJ+11cJsj01C6/8ZgNNQ/DlRMO8KZoTb3WAeN8TQW2gTc0l/QL
         6FRIJCuQBH1OEUCzXYkR52dMEAJyNxMfCm7Ao83or+QxGqPdMRu9ut5spBcRdOk8oDJ0
         aUi/dv3zc3z1QZqsv6L08kaf/9n2YSJfpzcP07/Lqhj1TdZe21sgCvnhu1IiF8dcgkUR
         UotVQdtVd0KtlNf1ColX1NRF2OdeGAGkmpjG5694VpQ4Xyy6MEk3qDfDIYZgNVX/mxeQ
         MItvvdh0ETgtdhzDuVvEFvJeR+KkLW7H6ZujyQ05B1ofw6XV/Jw0pPB+2NRT4l0rU9NQ
         urhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IakMGoNeAkiafUmQyTYpE4STAOzYx1wLgMpz/v+W8ao=;
        b=4pl4XZ+8AQIceCAcnIcomwES/jkzOB/GLJyjtZNM+MaKkC/Ao2LsRaTSt7lSKZDBAo
         GTYMzbDOt5WFD8G2zbrC0wekZvW0qq5BDsT6ZtdqYVKByXHVpRExDNgH0fOdWTAVPyp+
         Ctm6ObAfBd9OUm6xRJci54t8acSfCfttZdHP6zKc0esQwQxgKw1wY3bS9uFSDxIMVtKE
         dP7xpOno97ZHeFwj1nqxfqdn1R9be9s0FVLifhccxmkta2zPL7U7nnB8QZsZmwuNK/sY
         qaiCgs0mT8Ju2ncUkThuhwRHfqJ2l9oNgQuILA2J38tZcBUdIHDUCDPJArajkfV1qjjF
         heUw==
X-Gm-Message-State: ANoB5pmn5mIjATLCDrDmFPQd0tG29wGJpGM/LHcBqdQVrExFx+A6XTkH
        lXzPydFyPjNZzSannAEK7p0JcQ==
X-Google-Smtp-Source: AA0mqf7x2WdR/+5Wh61oqWdZBmYm7BWZfGQtYvK7acmOqBpQ6tod/EDIbGs+3nxToPHONFh7ye+lkA==
X-Received: by 2002:a05:6512:7b:b0:4a9:9827:68e8 with SMTP id i27-20020a056512007b00b004a9982768e8mr7609075lfo.7.1671236263654;
        Fri, 16 Dec 2022 16:17:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:43 -0800 (PST)
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
Subject: [PATCH 15/15] arm64: dts: qcom: qcs404: add clocks to the gcc node
Date:   Sat, 17 Dec 2022 02:17:30 +0200
Message-Id: <20221217001730.540502-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Populate the gcc node with the clocks and clock-names properties to
enable DT-based lookups for the parent clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index b72542631337..ee337a3980fa 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -731,6 +731,19 @@ gcc: clock-controller@1800000 {
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <&pcie_phy>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "cxo",
+				      "sleep_clk",
+				      "pcie_0_pipe_clk_src",
+				      "dsi0pll",
+				      "dsi0pllbyte",
+				      "hdmi_pll";
+
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
 		};
-- 
2.35.1

