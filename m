Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D2ACCA483
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 23:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355210AbiFUXeX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 19:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237933AbiFUXeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 19:34:22 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FC830543
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 16:34:19 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id jb13so265712plb.9
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 16:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j6EHLC1I3sWRh0/mAsfU2ZCVNMk8CE7YRjypzOnx64c=;
        b=ny3qCYdwkoUpLmuRdVbSsOq6jsHe9rpqDDqLQqrXz6nByKilro0DP4ezMhrbR0SJqB
         FoEeGs/0KqYKIO0u/AbqJh4tTPMWNOn4JSYvSnoPwDOaKv1ABF+nrB0APB6130vJfsTR
         M3HfP4uKcxtpwZLnTGnPsFSmRO+kQ/hVnqCzheHZGbv0YUnzklzmqpazOH3E2sRWQ7C8
         yaUdG690fvYfG8GV8Qr+YU3/4QrtZhxq8j+ugj4qBs8H9HlGveNYGpXzc0YK/9J3vsW/
         2l9aJ1+luUEHAfiJ7ZU1e5tOJ5rp2oLkiUsHGzPlwQuNmSMbJQk1WJ5kL2XTg6SqCP+k
         QI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j6EHLC1I3sWRh0/mAsfU2ZCVNMk8CE7YRjypzOnx64c=;
        b=aOsIcdSz8JfEBCXCb3XDWR65a2Fr/Fxg9ZiJxaYBJswMcpRe0RMGsXu5pDyyu/lsa+
         jdoT2aoFhRakN54L+5p6XwQESYzK12j8li1Bg8X6cFsG08p6dvg3KX/4GXsvAf80blcI
         tz/yp776+OVeqwBZM1BSDh3LXQU350MxNpssV9tOO0H0cJDsxWVlZW/g3KCUiksX726r
         +wdEUTCm4kS7fiaZ47hhhwWDIxJGneZgQQh0pWXlLUBrkv3nz5MfqzZ/VBXfHvYd1nUP
         kDvr8S/ppR6ypbznRkcQTXPnaYCdizeSWSSy6KdlrgwvT1h42qYERDN7fz3u3sXaNEvp
         zELQ==
X-Gm-Message-State: AJIora+rm2C27dYHpALazmOC04Y+fAOKC4mHduzUXO4u+AHaanATWi1E
        ALe+Z37kXwvaFY8FBc5OGkM3jw==
X-Google-Smtp-Source: AGRyM1sZvtNuqN3d0+/aGvE46mIOMd7ki2UIMNFbuxfZwpXow/kWmkaMMZ4+AE05cbkJOQASbSkebw==
X-Received: by 2002:a17:902:e746:b0:16a:3b5c:2134 with SMTP id p6-20020a170902e74600b0016a3b5c2134mr4693244plf.36.1655854458772;
        Tue, 21 Jun 2022 16:34:18 -0700 (PDT)
Received: from prec5560.. (71-212-119-14.tukw.qwest.net. [71.212.119.14])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090302c700b00168e83eda56sm11297873plk.3.2022.06.21.16.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:34:18 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, robert.foss@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v6 0/6] SM8350 Display/GPU clock enablement
Date:   Wed, 22 Jun 2022 01:34:06 +0200
Message-Id: <20220621233412.506768-1-robert.foss@linaro.org>
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



Jonathan Marek (2):
  clk: qcom: add support for SM8350 DISPCC
  dt-bindings: clock: Add Qcom SM8350 DISPCC bindings

Robert Foss (4):
  arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
  clk: qcom: add support for SM8350 GPUCC
  dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
  arm64: dts: qcom: sm8350: Add DISPCC node

 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |   6 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml     |  72 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  42 +-
 drivers/clk/qcom/Kconfig                      |  12 +-
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/dispcc-sm8250.c              |  60 +-
 drivers/clk/qcom/gpucc-sm8350.c               | 637 ++++++++++++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    |   1 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h |  52 ++
 9 files changed, 870 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

-- 
2.34.1

