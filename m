Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9BAC2D0E4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 07:27:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1841246EB
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 07:27:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IakSS16g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgKSH1e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 02:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgKSH1e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 02:27:34 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B24C0617A7
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 23:27:34 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w14so3610409pfd.7
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 23:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=RU7wqKfv+LHgDxaPO29yong1ckKnttrhFl59yq3IpUI=;
        b=IakSS16gwXF63uN3L/x39vp5/9lblBW8F+b0zHPH7e3uOQJRVHkChfagvvQX37XOij
         z9TTJV95j8jUZUAWpZ1ijbL1Ggus5j9Gsv5mG4ksoQz+9EK9UmFkGusvAy2Jc7krt95+
         noRLmeAmKDbDydaqVdEx9U0jOnCp2LaHzG3VD3K5BGXpf4bGEKf2E3W/IR750gHdKWpd
         EmaecTOvHrVMYOMUBXCcOfTq/AdDZ/t0WEcgqfnolx6GQR8Yo/u4cPgZl5uzKfKSKhCB
         2jpb6e+fKItPv8oVYTwahrsaREt/EjaZ48pJmelgU6uiNBrM45U02qB9rLphuuqRvhgH
         yyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RU7wqKfv+LHgDxaPO29yong1ckKnttrhFl59yq3IpUI=;
        b=EeI71A+uBizlNJLKqWlLxGNU1OlEwUPKfOX4RTNj7slrf68U/6bQ9ei0vZUY5Oto/o
         ii1LVOtONVUp5XT9PGFYPFXeB+U0ykUZoI3UOt354oKPv+EEUfUEA5zgzkpITtOBEUmE
         9UxsopKcU+Jm3tKHjAawsm152y7N5JQzDsOGXsG5++Ts+oFlgS0GE+YX9F61W8UbjaoJ
         YHYLhqa8tlz2qiPQtO56qvVs9sbYTg+b6OcHdnDFDOL6M+TeJUjHkQBw0pOaxgtZt2hK
         SmAPQvuMoLsjbRXDNv9MFMCvoHrB6jtV5iE4HhgSK0ITzUB+GOgwbst8cDvUNxQCWbUv
         cW0g==
X-Gm-Message-State: AOAM533aaIDGyxEUDRXaLBbRAPCD/Si+BgnfXYGeMHvLBIPekoI5Ng9T
        pWq3P4ir4RinQo0WvUb37Qtr
X-Google-Smtp-Source: ABdhPJzDqCIzqK/L4m3tm0v2ROFYN/c2jaZW/pQwsTLEpr7eMivyAIwng7u4MmbNVAaAYgCpFDrtSg==
X-Received: by 2002:a17:90a:6283:: with SMTP id d3mr3029466pjj.96.1605770853467;
        Wed, 18 Nov 2020 23:27:33 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a8sm26802923pfa.132.2020.11.18.23.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:27:32 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/4] Add GCC and RPMh clock support for SDX55
Date:   Thu, 19 Nov 2020 12:57:10 +0530
Message-Id: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

This series adds Global Clock Controller (GCC) and RPMh clock support
for SDX55 SoC from Qualcomm with relevant DT bindings.

This series has been tested on SDX55 MTP board. The dts patches for this
SoC/board will be posted later.

Thanks,
Mani

Changes in v3:

* Documented core_bi_pll_test_se clock in dt binding
* Collected reviews

Changes in v2:

* Modified the GCC Kconfig symbol from GCC_SDX55 to SDX_GCC_55
* Added S-o-b tag to bindings patch
* Incorporated review comments from Stephen on the gcc driver
* Added review tag from Bjorn on RPMh patch

Manivannan Sadhasivam (1):
  clk: qcom: Add support for SDX55 RPMh clocks

Naveen Yadav (1):
  clk: qcom: Add SDX55 GCC support

Vinod Koul (2):
  dt-bindings: clock: Add SDX55 GCC clock bindings
  dt-bindings: clock: Introduce RPMHCC bindings for SDX55

 .../bindings/clock/qcom,gcc-sdx55.yaml        |   73 +
 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-rpmh.c                   |   20 +
 drivers/clk/qcom/gcc-sdx55.c                  | 1626 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sdx55.h    |  112 ++
 include/dt-bindings/clock/qcom,rpmh.h         |    1 +
 8 files changed, 1841 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
 create mode 100644 drivers/clk/qcom/gcc-sdx55.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdx55.h

-- 
2.17.1

