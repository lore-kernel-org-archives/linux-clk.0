Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64613C7EE24
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 11:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjERLkh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 07:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbjERLkf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 07:40:35 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C991BD1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:12 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3078d1c8828so1811541f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684409991; x=1687001991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=slLMHWh39zOaBNdbVpwl/j1HD7B9S6TGQGQ7OANz+KY=;
        b=kx5n9GC/vNGIeE2LyD2IqtiC0LBNDAiqelKek+CvGhTZn8OJBC7x3+lrrOTozmyrK5
         tzjQbyIxcYfSgvx+nE+zs8S7BiAyzlRAiwwX0+ln4AMPWi23NqgdGdQ8v06GqREzr1Pi
         muSmvYBBzxs4+zd1erOLLTytWG9ZOjPteo7RofMSJx2XNOO6RG8Z9lpPYLXfdLpZ514s
         6n/WXjds/V51FSzxI9S1JTY9AIZl8BsRn0hCA64Z6DrldKMHjsJoW1GOwM3er+SLYCRA
         +KwHqYUzE/IL7KTZ1hSlXnQFCnBboNWp0ArEJEKBPF5rcbAbwFVmJRtbMc3DVSz4T+n8
         mLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684409991; x=1687001991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slLMHWh39zOaBNdbVpwl/j1HD7B9S6TGQGQ7OANz+KY=;
        b=P5yWRqsDhX3lZqPwoSZ/L6eiAdla1utqMghOKq9L4D9IwFe0FYng6qMrfimL7hwUGj
         J1mh002ItH9lBVhAGMJqbRxGsha2PhlhfbKG17yvIweBrazo0xSh+oX2BfUECTg5he9e
         caKd99IzEL5VgI/rHDf4PAgrhe0GLFVPmyepjXWGylpy3E09TkN0ZrZpDLvAiitAu2mV
         Vo92ZYiLPut+mtU+oF7sMA+t6oabogVroi9CejRcpH4jbm3Q7iS62x3r3gZ6wNhBpqyu
         t/Slp31rYqFQ0pg/uq7Mg1DiffFUYnT3MBhbLuTgin7e2JOIqkBPBPtJcRqcHG5oOmJm
         q0mA==
X-Gm-Message-State: AC+VfDyK5GeUwyAH0/rJpzhJCHU8msZtqE1fiNBLng6qclrr/15bZOQu
        xJEuUjvwDElYNT0ikCPzuUNw4Q==
X-Google-Smtp-Source: ACHHUZ4E4x/FX+OKpX6cuZr+u9L5Sb8D6S6tJyg4Od2ZdXmtRfyzN6favFXt5HQw3Pfa9PKHINHgdg==
X-Received: by 2002:a5d:420c:0:b0:309:3db8:51e6 with SMTP id n12-20020a5d420c000000b003093db851e6mr1399017wrq.35.1684409991406;
        Thu, 18 May 2023 04:39:51 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b003047d5b8817sm1897135wrv.80.2023.05.18.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 04:39:50 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/5] clk: qcom: sc8280xp: add lpasscc reset control
Date:   Thu, 18 May 2023 12:37:55 +0100
Message-Id: <20230518113800.339158-1-srinivas.kandagatla@linaro.org>
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

Srinivas Kandagatla (5):
  dt-bindings: clock: Add YAML schemas for LPASSCC and reset on SC8280XP
  dt-bindings: clock: Add YAML schemas for LPASS AUDIOCC and reset on
    SC8280XP
  clk: qcom: Add lpass clock controller driver for SC8280XP
  clk: qcom: Add lpass audio clock controller driver for SC8280XP
  arm64: dts: qcom: sc8280xp: add resets for soundwire controllers

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml | 68 ++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 19 ++++
 drivers/clk/qcom/Kconfig                      |  8 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sc8280xp.c           | 94 +++++++++++++++++++
 .../dt-bindings/clock/qcom,lpasscc-sc8280xp.h | 17 ++++
 6 files changed, 207 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h

-- 
2.25.1

