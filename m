Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAB2C001E0
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 11:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234233AbjHALEU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 07:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234265AbjHALEE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 07:04:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C501358C;
        Tue,  1 Aug 2023 03:57:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D306961528;
        Tue,  1 Aug 2023 10:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30BBC433C7;
        Tue,  1 Aug 2023 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690887446;
        bh=igqPclbn33iQ9Myb2xT63wPBpAiGtwav3k7hWqdmNcA=;
        h=From:To:Cc:Subject:Date:From;
        b=FAqmARKIqgIZS8LjC46BceHTw/STKMHz9+ICI4AQw6el4u4oXOrOANfItpJENPVfJ
         e8wh44NYhEwW43unA4jMS5r+wzLR+AYZw5PoNCVz9f6sbgCDXPOHL0VM48ojp6xebI
         WHmRHNBrSTvaWj/uulKXYP0w2Wwe7HByUGPKEHqcuU23oz2Linx1cXUQGy0S9EPuq2
         CNO6q0y9jfQgXIYECur8UG9E2d5EFKJmOlJujfQjmxaDA1AwEPERMQz9c1y5ajVibt
         9mg2zUXIb5l3mar8xP+qi3I/n9IzqxOfoDlJcYqVSVtbs4fZyw6uTazwA2dS9E+ErE
         FntfCNQnBt4Og==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: fix some Kconfig corner cases
Date:   Tue,  1 Aug 2023 12:56:32 +0200
Message-Id: <20230801105718.3658612-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The SM_GCC_8550 symbol and others can only be built for ARM64 or when
compile testing, but it gets selected by other drivers that can also be
built for 32-bit ARCH_QCOM when not compile testing, which results in
a Kconfig warning:

WARNING: unmet direct dependencies detected for SM_GCC_8550
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
  Selected by [m]:
  - SM_GPUCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
  - SM_VIDEOCC_8550 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]

Add further 'depends on' statements to tighten this in a way that
avoids the missing dependencies.

Fixes: fd0b5b106fcab ("clk: qcom: Introduce SM8350 VIDEOCC")
Fixes: 441fe711be384 ("clk: qcom: videocc-sm8450: Add video clock controller driver for SM8450")
Fixes: f53153a37969c ("clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/qcom/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 263e55d75e3f5..ed7dc3349e34e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -995,6 +995,7 @@ config SM_GPUCC_8450
 
 config SM_GPUCC_8550
 	tristate "SM8550 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
 	help
 	  Support for the graphics clock controller on SM8550 devices.
@@ -1031,6 +1032,7 @@ config SM_VIDEOCC_8250
 
 config SM_VIDEOCC_8350
 	tristate "SM8350 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8350
 	select QCOM_GDSC
 	help
@@ -1040,6 +1042,7 @@ config SM_VIDEOCC_8350
 
 config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8550
 	select QCOM_GDSC
 	help
@@ -1088,6 +1091,7 @@ config CLK_GFM_LPASS_SM8250
 
 config SM_VIDEOCC_8450
 	tristate "SM8450 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
 	select QCOM_GDSC
 	help
-- 
2.39.2

