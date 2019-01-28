Return-Path: <SRS0=UrzD=QE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CB0C282C8
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B13DD20855
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jan 2019 18:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkkgjNoF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfA1SdS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:33:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35482 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfA1SdS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Jan 2019 13:33:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id 96so19267782wrb.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Jan 2019 10:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ePCCBTV1D/rgy7QpQRMhWU66DEdJXmEhHQjyHV5CCKE=;
        b=ZkkgjNoFWO4eaFliYBVr2XLSoTnkWguoBC13eb+U+cHvWebKhZdtAokMzI4eQEsEyq
         jau2pa2nXCsKPsrjFRFPAHvZMc4IqVY98wAAqy9blZc4nOayUFgq6Nb51l/R0+Cb6Ve1
         kCH9gNAxfyuYiX5p5WNW6lSjmAVQTHCZken4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ePCCBTV1D/rgy7QpQRMhWU66DEdJXmEhHQjyHV5CCKE=;
        b=X1rHWl8jDQi9KIw1xTmlaMdMRT6fqFgAAyrcyKK1tbIT2/MLXR8u25bhtST2t4weGy
         SdQJ8YdVINK/7HGyUeRQWFpKxAVXpnWziLHBRxWR+fsP4x6YXRUxYIJxCN4/fUB7xPNU
         JMpNfdXokkCXya9YpDni8kjhDyt2rGelfxFldGmwHPk3sWxzy/Clp7BtO0PtOB7Lv1dT
         YECXzTy00eXSUvfIukXQrp/PLfFy13VYChWRARejuqma869X1SqorchvGoU7a70JIsm2
         YfsWlhPiFZrhY6J6UWO3TDQi5Sr8CUN0gcjaBTUKnAXslHnSQ2mVI7H8Qphf3Nmwxj0k
         YwiQ==
X-Gm-Message-State: AHQUAuYaqDvs8qbRmrBw2OZB1NQbCjZtFpTtZv9uX04IzTTcYo6qnq3Y
        ypPy3gw9528DZaZhvwsfCoFCdA==
X-Google-Smtp-Source: AHgI3IY34tRbxoM7z3ib5Ve8alip7z6s718Di/W0laJ0rCyBPVKSo2JgL/EjAQIEZk8ASfp8H0UBCw==
X-Received: by 2002:adf:be0f:: with SMTP id n15mr9993608wrh.267.1548700395986;
        Mon, 28 Jan 2019 10:33:15 -0800 (PST)
Received: from localhost.localdomain (233.red-81-47-145.staticip.rima-tde.net. [81.47.145.233])
        by smtp.gmail.com with ESMTPSA id l19sm270082wme.21.2019.01.28.10.33.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 10:33:15 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v2 00/14] Support CPU frequency scaling on QCS404
Date:   Mon, 28 Jan 2019 19:32:47 +0100
Message-Id: <1548700381-22376-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following patchset enables CPU frequency scaling support on the
QCS404.

Patch 8 "clk: qcom: hfpll: CLK_IGNORE_UNUSED" is a bit controversial;
in this platform, this PLL provides the clock signal to a CPU
core. But in others it might not.

I opted for the minimal ammount of changes without affecting the
default functionality: simply bypassing the COMMON_CLK_DISABLE_UNUSED
framework and letting the firwmare chose whether to enable or disable
the clock at boot. However maybe a DT property and marking the clock
as critical would be more appropriate for this PLL. I'd appreciate the
maintainer's input on this topic.

v2:
   - dts: ms8916: apcs mux/divider: new bindings
     (the driver can still support the old bindings)
     
   - qcs404.dtsi
     fix apcs-hfpll definition
     fix cpu_opp_table definition
     
   - GPLL0_AO_OUT operating frequency
     define new alpha_pll_fixed_ops to limit the operating frequency
   
Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Jorge Ramirez-Ortiz (14):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  mbox: qcom: add APCS child device for QCS404
  mbox: qcom: replace integer with valid macro
  dt-bindings: mailbox: qcom: Add clock-name optional property
  clk: qcom: apcs-msm8916: get parent clock names from DT
  clk: qcom: hfpll: get parent clock names from DT
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
  arm64: dts: qcom: qcs404: Add OPP table
  arm64: dts: qcom: qcs404: Add HFPLL node
  arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
  arm64: dts: qcom: qcs404: Add cpufreq support
  arm64: defconfig: Enable HFPLL

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 24 +++++++++++++--
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  3 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               | 35 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/clk/qcom/apcs-msm8916.c                    | 32 +++++++++++++++-----
 drivers/clk/qcom/clk-alpha-pll.c                   |  8 +++++
 drivers/clk/qcom/clk-alpha-pll.h                   |  1 +
 drivers/clk/qcom/gcc-qcs404.c                      |  3 +-
 drivers/clk/qcom/hfpll.c                           | 19 +++++++++++-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 21 ++++++++-----
 10 files changed, 125 insertions(+), 22 deletions(-)

-- 
2.7.4

