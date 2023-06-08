Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0283FC7EE25
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 12:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbjFHMxh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 08:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236580AbjFHMx2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 08:53:28 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF10C2D78
        for <linux-clk@vger.kernel.org>; Thu,  8 Jun 2023 05:53:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso3626905e9.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jun 2023 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686228799; x=1688820799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QQqUodnKFRw5PuAn21ea5xgnb65xZ+y7rpLRNAHSBq0=;
        b=QARtFkl3BE7pv0WEI9bFBrivf3G3ykvKP6HcVtAaKp7FW1zn+ez91HsWbb4gcuR5Ky
         RfFFdspFIb+3wCKDqFS64Hc+PvfsN3mM3Jr1S72xl97mQA6j/X2/tX+Gqombh8PmSKLh
         3RH+enwKKNPsKb0N48d5ULAyacpWwDviKbopWQ4iNsLvrIStbOdTsh46TMZMVu0r6xvq
         CUAONNr824F+e5kIObinwqNt/VuKzRvpY/sjdWzNKi/52FQfRBfkz/uRxLUrPyJIQJCe
         W872jVlnM+QkP/tSxOGAboG9PwkG3E5IPuq0yEn50zJgjL2oujbA/TJGZ66G2GCGhumC
         PdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686228799; x=1688820799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQqUodnKFRw5PuAn21ea5xgnb65xZ+y7rpLRNAHSBq0=;
        b=Jw2GQgG8Z1jF/YyKKIwh7VgFokeCSvSFZl218kGtSQndFRDtAuCbmIHZWkWciBi93P
         ymaA835pcojERRCcSV2xUAdoSeKc/Mkx3M9VZTAGTYNpwSeXj32s2udwDubObZa55BDI
         eBCg8AGTSbaDznP676Jog3bn/lHdQXOcoxi6Ybndc0V73eCPuAFFZUhJzNOxP1/K5klF
         otzd0SvrNym/SzV4YL1jGWhsWley7r5FtKr7CSFDzzDw+4Z+Tfm77wqkxm3c/yvLI2Cg
         3eZxN2ewQFaI5pTvKGieYZbXjube0bMTFab1U22tcIimXLD3ROjm3mKhQxq+aCnZbay+
         0c7A==
X-Gm-Message-State: AC+VfDwp1pMDQ/wv9oMcuU5bx2SbgizITDOF9y+jWS3ceUZpZVWiKBSC
        7e9AvMb0wR4ISZ5xH0q01LY8tA==
X-Google-Smtp-Source: ACHHUZ4ru1zt3M7bVlzAGdqtRefGHALasJmz6KndsByVBcsJZDFjMn5AzZvwh1kkEygV4dHKKqhlMw==
X-Received: by 2002:a7b:cbc6:0:b0:3f6:2ee:6993 with SMTP id n6-20020a7bcbc6000000b003f602ee6993mr1538418wmi.4.1686228799390;
        Thu, 08 Jun 2023 05:53:19 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003f7e4d143cfsm1894032wmc.15.2023.06.08.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 05:53:18 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/6] clk: qcom: sc8280xp: add lpasscc reset control
Date:   Thu,  8 Jun 2023 13:53:09 +0100
Message-Id: <20230608125315.11454-1-srinivas.kandagatla@linaro.org>
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

Changes since v2:
	- removed qcom,adsp-pil-mode bindings, can be added when
	 we have a variant of this SoC without dsp control
	- added compile check in Kconfig
	- fix variable naming to reflect correct cc.
	- few minor style related changes

Srinivas Kandagatla (6):
  dt-bindings: clock: Add LPASSCC and reset controller for SC8280XP
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for
    SC8280XP
  clk: qcom: Add lpass clock controller driver for SC8280XP
  clk: qcom: Add lpass audio clock controller driver for SC8280XP
  arm64: dts: qcom: sc8280xp: add resets for soundwire controllers
  arm64: defconfig: Enable sc828x0xp lpasscc clock controller

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml | 60 +++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 21 +++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/qcom/Kconfig                      |  9 ++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-sc8280xp.c           | 87 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sc8280xp-lpasscc.h | 17 ++++
 7 files changed, 196 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,sc8280xp-lpasscc.h

-- 
2.25.1

