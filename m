Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B638C7EE2F
	for <linux-clk@archiver.kernel.org>; Thu, 25 May 2023 12:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241158AbjEYM3x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 May 2023 08:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjEYM3p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 May 2023 08:29:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34A2122
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:43 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so2006441f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 25 May 2023 05:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017782; x=1687609782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbjF4qIKtaMQTYJ+wlxvW8+DnMXh9O9l4H+hCicLL3g=;
        b=WhWXnEZ2q8RXW6A/hQwITkthrXBDl4NRDYPZoetBFLivPwZFyDuDZ3vqEEPtomUCq0
         6RcN8Amy90LcgKN2jruJrysXD5V1EESMrbJmIGh26LHp83hyUZxkqBWL6hA88kXOx0lJ
         ab1agDtK04+8MvjsaeyjnwuHMGXN8gph62LaGHNK365H0PsPxx87wxLZBy6brAjzxfMa
         MskIXA8vH4UYfAuhclqLpVx1NDrwFEB3sXFkeizVzUjNI9YWgyegyjdekRF3vOstetD4
         sxi+BCRBQdjQ1Svu2Kbbt8T2XcO86WYCW5RC65zwO1zdLM2LWhQk1kR5sAtONgxziebl
         wzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017782; x=1687609782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbjF4qIKtaMQTYJ+wlxvW8+DnMXh9O9l4H+hCicLL3g=;
        b=Kk5qWBx/V7v+5rGx5RAOSyJCCAYR2blOH15ZGRoQfpxMcrljrjnUGsoPiFm97hPzKK
         JiHV+/qu0nCtKC7Sw1OpXCldhTjne1989Ddr+2N0u6Lcf6krnJ/JPo695tUsWU2I7mf4
         qQFZcStJC2c03vqSdWGeM9m6GHPSDtXCt9auRKhrhzmskeExkPvyf8pFcTsb2JnyanHX
         My9cbi+Tp7UxqhpoeeT8N3OM+kEvXUnXBAx6yKmNAXf2CMYb8GL3mBoXNpmTqDYgoUdV
         ffy/QL2RAYggXDhbUok+llicyngRmhb6taRv6SM+XQLo3pDuj71q76P+kb9GAcTBSPrP
         1Jtw==
X-Gm-Message-State: AC+VfDxeZfK/T+rrwaiAoDV4CIrxkdDrQsNxKpFQSC7kSvNBcvx0pY23
        FwnIavNXEYHQMddPtFkQjkj+SA==
X-Google-Smtp-Source: ACHHUZ6XaRtDhw79YdAx0/lPJBVfzOSxgMjj4wnynLjJpXTf31y0b6w/Rhm/mRIe+JywkadDjlHL9g==
X-Received: by 2002:adf:f348:0:b0:306:3381:67fe with SMTP id e8-20020adff348000000b00306338167femr2517041wrp.27.1685017782357;
        Thu, 25 May 2023 05:29:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id k7-20020adfe3c7000000b003062b2c5255sm1700227wrm.40.2023.05.25.05.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:29:41 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/6] clk: qcom: sc8280xp: add lpasscc reset control
Date:   Thu, 25 May 2023 13:29:24 +0100
Message-Id: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SC8280XP, LPASS IP is controlled by q6dsp, however the reset lines
required by some of the IPs like Soundwire still need to be programmed from
Apps processor. This patchset adds support to reset controller on LPASS
CC and LPASS AudioCC.

Tested on X13s.

Thanks,
Srini

Changes since v1:
	- updated dt binding to be in a accending order and fixed spaces in example
	- updated kconfig and make file to fix the order.
	- updated driver with various minor comments Johan.
	- added defconfig changes patch
	- fixed missing reset entry for swr0

Srinivas Kandagatla (6):
  dt-bindings: clock: Add YAML schemas for LPASSCC and reset on SC8280XP
  dt-bindings: clock: Add YAML schemas for LPASS AUDIOCC and reset on
    SC8280XP
  clk: qcom: Add lpass clock controller driver for SC8280XP
  clk: qcom: Add lpass audio clock controller driver for SC8280XP
  arm64: dts: qcom: sc8280xp: add resets for soundwire controllers
  arm64: defconfig: Enable sc828x0xp lpasscc clock controller

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml | 68 +++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 23 +++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/qcom/Kconfig                      |  8 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sc8280xp.c           | 86 +++++++++++++++++++
 .../dt-bindings/clock/qcom,lpasscc-sc8280xp.h | 17 ++++
 7 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h

-- 
2.21.0

