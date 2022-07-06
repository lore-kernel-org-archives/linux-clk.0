Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F9CCCA473
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 15:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbiGFPtk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234437AbiGFPtL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 11:49:11 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0D42A72E
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 08:43:43 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id h23so27753537ejj.12
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLyp9dgcj9TjrbTGfy1uRAiX4gDvkkEXBDjNRWPJTz0=;
        b=RDnXIHfM/t/Mw/Hc0FT2P+etq6Mm191X17WntZOlzpOAYA4NgEYocNTHri3XunKTPU
         9nRxrvsqZjc354aZ8qBwWaf4hW+0REiTGrKzBJ8u3yScjSVSKsBIrwlIRE9XGBT46lJP
         IwUNtca3VwggiGTUwGPjBwOZsLKPCsKqPvOQie3B4pCpvwph304lyMKbkm4pwO6zgfuA
         tcS5ZET2626qKj2zckBrmMeLlEjdFuf2HGgPd1zpDsslzhyHx87kSguMAkUT6NCHQ2oC
         gzMOF3NmbliXy6rZ5sTQXuOr7sC9mCPCiHSu2ADVjvj3v3ORYDBs8BbfE9PdbqI+XiTS
         Wvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLyp9dgcj9TjrbTGfy1uRAiX4gDvkkEXBDjNRWPJTz0=;
        b=Kj9nWMPYRVl2DX5C8aK/gAjKmucchu9A7qm3/vpIrjNU80r/nWqawj7jwPM/k4rlPO
         E7WZwEA/OlNnnkxlkhH2T7qRoW9bp8Vq0oJbBcJkFaDF8t4s9AJ0ymkm3PDhsV+W/47T
         Ix4yUFaRCMmaM8h7meAPayg6hbpOlC+7P/rNG8qruDieQsT+54UHMnk6KZ7n8YnalxtA
         6UoI8vkNGSX5yK3FeDM55h2lWi/QBa6x6Acffx8iqbQwYqZlCLZXPxNvYejYy6RyWZkQ
         YKLBQf370y3vmp0dFE1awR1PmWDOBkUarjb/2kJbr/lJhz38wlbnuNj4UYEgKo65YX/w
         esgA==
X-Gm-Message-State: AJIora+hls9hbjmRo2UtW7XRMBddtjkmaBJyRn3dfjm7JQQfPD0PBk+h
        CrRA0SNFqKkoYD8IxrAR0Fo6YA==
X-Google-Smtp-Source: AGRyM1vshDdtWpI77FwW6NTJLihOzK5IYjEF0p0tbIeldanQk73Qgtjy3bVRNLO8/1TTAcQ32+yVDw==
X-Received: by 2002:a17:907:6d86:b0:726:99d7:20e4 with SMTP id sb6-20020a1709076d8600b0072699d720e4mr40054273ejc.342.1657122221465;
        Wed, 06 Jul 2022 08:43:41 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id fi18-20020a056402551200b0043a43fcde13sm7711033edb.13.2022.07.06.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:43:40 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8 0/5] SM8350 Display/GPU clock enablement
Date:   Wed,  6 Jul 2022 17:43:32 +0200
Message-Id: <20220706154337.2026269-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes since v2
 - Dropped "clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED"
 - Dropped "clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable"
 - Dropped "clk: qcom: rcg2: Cache rate changes for parked RCGs"

Changes since v3:
 - Dropped RBs & SoBs for bigger changes
 - Changed author to me for patches with big changes

Changes since v5:
 - Reverted dispcc-sm8350 split from dispcc-sm8250
   and related .index changes - Bjorn
 - Re-added Tags that were thrown out due to the 
   above revert

Changes since v7
 - Added Vinods RBs
 - Re-ordered patches to make bindings come before 
 - Removed rpmdpd patch from series



Jonathan Marek (2):
  dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
  clk: qcom: add support for SM8350 DISPCC

Robert Foss (3):
  dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
  clk: qcom: add support for SM8350 GPUCC
  arm64: dts: qcom: sm8350: Add DISPCC node

 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |   6 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml     |  72 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  26 +
 drivers/clk/qcom/Kconfig                      |  14 +-
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/dispcc-sm8250.c              |  63 +-
 drivers/clk/qcom/gpucc-sm8350.c               | 637 ++++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    |   1 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h |  52 ++
 9 files changed, 866 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

-- 
2.34.1

