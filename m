Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C58C38159
	for <linux-clk@archiver.kernel.org>; Sat, 21 Jan 2023 19:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjAUTfw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Jan 2023 14:35:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjAUTfv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Jan 2023 14:35:51 -0500
Received: from out-1.mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0925B18163
        for <linux-clk@vger.kernel.org>; Sat, 21 Jan 2023 11:35:49 -0800 (PST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1674329148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=U7rpjGG4NdYtPyqjlrpIBGX8eBcKA0o9fEOPBmr9xxM=;
        b=maZmw7af+WirSWWRtUHAHGWuAcxXdgehxoaEgMdmANaqDMsCh57bMMvse6LI9QGwdr7enq
        fB+GTWamOmLdxSkkcukmFCDBd6uMeGarmRrbNeGhvSSs5BX6C6Yeg+1ztEPCDFD+u6ydAF
        4bQ4UDdxah9PudCIst/80zA8hEXuYf0=
From:   Rayyan Ansari <rayyan@ansari.sh>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rayyan Ansari <rayyan@ansari.sh>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v4 0/3] Add XO clocks for MSM8226/MSM8974
Date:   Sat, 21 Jan 2023 19:25:37 +0000
Message-Id: <20230121192540.9177-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes since v3:
- Put the rpmcc.h include back in

Rayyan Ansari (3):
  clk: qcom: smd: Add XO RPM clocks for MSM8226/MSM8974
  ARM: dts: qcom: msm8226: add clocks and clock-names to GCC node
  ARM: dts: qcom: msm8974: add correct XO clock source to GCC node

 arch/arm/boot/dts/qcom-msm8226.dtsi | 6 ++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 drivers/clk/qcom/clk-smd-rpm.c      | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.39.0

