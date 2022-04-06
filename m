Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8A8C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Apr 2022 05:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiDFFoF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Apr 2022 01:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1578934AbiDFEQg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Apr 2022 00:16:36 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208EC2B4A4B
        for <linux-clk@vger.kernel.org>; Tue,  5 Apr 2022 17:26:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 5so1356897lfp.1
        for <linux-clk@vger.kernel.org>; Tue, 05 Apr 2022 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWsEvD55MkSgPt/PW3YvzfqgUnAHkT214mKs5UGjYz4=;
        b=dMWHpVdQ005sI4XU1e5nFitPDm5Z3cmPOxruAZ16PlNwzh7HFSNA01JyNAi7Na29bG
         Vt7gxl5UI5K04ssnMNwmfX1cfGgzAty7Pz6K5WXl/fEpxZP8sI1A41p7AkdgnDqdZjST
         iCK6/O2hD3h7WLf3LoAqVlh/yut15gXVlevk6lUhEHwW0Rsqy9XDqjDLChT07w0dU5MV
         NE9iMxWjUa9qwXkkf8KPZR3rRh3LR6mKr/DQaECPK0qPWt9anwd/MqgMcd7iRdFh7mA9
         foflWczm7HkdMZ3BHSLrvNzNuYYxIp/JAV7UoHX5N6NKF0DJ6U3cLS81oea0GWo413WH
         Sf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWsEvD55MkSgPt/PW3YvzfqgUnAHkT214mKs5UGjYz4=;
        b=J63NPDyVr2IuepklGCx79TsQDsS3HMg9YWiecyMXTJTB07x/RSfFyHHtuj/YdtdQ7p
         L8Plq80JE3GsBCFahGfisWnBHLEdVrxcwe2cSb1v9daITCsVJliHi/u2rvR1E5ZgMEbd
         cEYY7X30bD4yXxY/5l+EP/kzk4I7j9SDrN8Wpkdjlr+qrCnJU2FNT2/isE/1NBY+7FJ8
         kI0RWOnq2FHgqLF3u6Ug/JoKK9q5zyvwi+pebhC1Tgb1GAPHMSKBA76Ureaai/otQ+sq
         MPvp28R9mbqrwsK4QI2pYa8TQZ8AHgapjppADVO+ssLcXMlDaS8dcnyL1DKjtSJ/z0VX
         iOEQ==
X-Gm-Message-State: AOAM533MXDlVsHjKofsUHyAb3xGpAX78Kt39slIVz0hhvEhoDAmdvbrS
        tY/Q9K5wwhaQYNmgLE/l4xjYSA==
X-Google-Smtp-Source: ABdhPJwdTKEaaj1bfpQk7YyIeEr9Rzt+ZEqImN9ce08usAO1IqH6ck7wJsWycvIRyd9sQKyb8ODTng==
X-Received: by 2002:a05:6512:b11:b0:44a:2ead:daf2 with SMTP id w17-20020a0565120b1100b0044a2eaddaf2mr4294784lfu.642.1649204810445;
        Tue, 05 Apr 2022 17:26:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512239500b0044aa21dadeasm1660270lfv.60.2022.04.05.17.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 17:26:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 0/4] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Wed,  6 Apr 2022 03:26:44 +0300
Message-Id: <20220406002648.393486-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens device. Instantiate
the device using DT node instead. This follow the IPQ8064 device tree
schema.

Compatibility with the previous devices trees is kept intact.

Changes since v1:

- populate child devices in gcc-msm8960
- add syscon to the gcc device tree node

Dmitry Baryshkov (4):
  dt-bindings: thermal: qcom-tsens.yaml: add msm8960 compat string
  thermal/drivers/tsens: add compat string for the qcom,msm8960
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node

 .../bindings/thermal/qcom-tsens.yaml          |  4 ++-
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 25 +++++++++++++------
 drivers/clk/qcom/gcc-msm8960.c                |  6 ++++-
 drivers/thermal/qcom/tsens.c                  |  3 +++
 4 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.35.1

