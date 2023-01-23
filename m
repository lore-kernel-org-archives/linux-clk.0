Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1298BC05027
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 09:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjAWJtq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 04:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjAWJtp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 04:49:45 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA57126F4
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 01:49:44 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id z5so10201260wrt.6
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 01:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JA6ku88Ui7cCR9woFlvNbfPun3e9l3CDKTSDDDWP3/4=;
        b=LsCsorQ8vromB8KvpcIxRMZT0Z7V97LcS9Bs3a4hheoymEkwXmbQPryo9EuMALU+6Z
         tfmVLi8Sjwt0CcUaxRuaEYMjjtZJGNXvZcvsVz+aHzrec4pFw5v64Tm+ch7Xnuw0N7h3
         wS48Tmz2BZzv0yVbZwxDRfwtXTLzg1QCXVlqlda/yOkWSsaAWn6TAnIlvC1K+eabsgMo
         38HSOgArVJvLgBW7w7TlvfAScH24yz0LR5Rvft9UG+LCX2g31AaC7LPEAJ33wgrZQ0MP
         OAVv3OokBOJNQlBWV6/1c9NC4LyhbGU9HUPyTLqZEKRdQTm6wiF3Xc1zOg2O2C43huaL
         UlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA6ku88Ui7cCR9woFlvNbfPun3e9l3CDKTSDDDWP3/4=;
        b=YeHAzppYvb5FH0m2E/QVKP09Qa214maC3TSZ644dP1R/br8zckKb2nRAZiBRQ+o67U
         YJ665z5EytaNn6aIXXn1EmwxPH9D2/CKxffpaBjpSETG6WJkhkzOZR8qJsDQ34TaV+JM
         3Inn+T2GQDAH7pnsDmKAt+VbY3D5UPgkJuLUT7WU8tFkfUlfoBJ8a4keGo3rDjQl7r9y
         9VabgPCgJBw2ERNdfmcn8u4FC2bre5PSf1JAV+xKiQ7j5bJxsseIl37jsV5LC0cYEcRX
         WbxEsJZn4h6iWtNlntuxrpA6Pr2uZldG5GnLKUtG8zypP6xJG6A6ctudsKzIorZxe07P
         4QwA==
X-Gm-Message-State: AFqh2krsDlIEoQ4Wrs9+4wSKWT4jlTuXBTKpGMetT7b3A3x1MXe/skFJ
        dLvwRhfMTRlxYAhy0xjbmm/Yog==
X-Google-Smtp-Source: AMrXdXu2RwlhdXc+m4uvpkI3yuhcARYDAODF4PD8dpS3ovEJGvul2AvjIc8xPVeYi6ofcqJxljhLrg==
X-Received: by 2002:a5d:554f:0:b0:2be:14e:15f3 with SMTP id g15-20020a5d554f000000b002be014e15f3mr19345907wrw.53.1674467383034;
        Mon, 23 Jan 2023 01:49:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f2-20020adff982000000b002bde537721dsm23976864wrr.20.2023.01.23.01.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:49:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] clk: qcom: add compile test to MSM8996 CPU clocks
Date:   Mon, 23 Jan 2023 10:49:24 +0100
Message-Id: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Allow compile testing of MSM8996 CPU clocks for build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1b6615fe1dba..1c360eed72d7 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -48,7 +48,7 @@ config QCOM_CLK_APCS_MSM8916
 config QCOM_CLK_APCC_MSM8996
 	tristate "MSM8996 CPU Clock Controller"
 	select QCOM_KRYO_L2_ACCESSORS
-	depends on ARM64
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support for the CPU clock controller on msm8996 devices.
 	  Say Y if you want to support CPU clock scaling using CPUfreq
-- 
2.34.1

