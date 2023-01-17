Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D109BC38147
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 22:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjAQWn6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 17:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjAQWmq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 17:42:46 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BF15CFF9
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:16 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id vm8so78881749ejc.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti+F59dwmnBVoTf/TrsKke+wcsbpbxaJrIFqVhERiI0=;
        b=C5TrC53PHhrt4Vb6IDm8yVvw8vSb8dmZy4pvQkwkA2HIgN0L0wf4u35P9oiqei3XBk
         D8heP9Hjk3gfrhSeeK9a0p8cFc7HWdlOANH2mmUj5LB0wqTSSyvxP0fDEXqRAEmXzsHr
         VP6R0CXufDBjiCMHFczquqXTDrCiWS/nWhpCm+jOrmyVHa5CH/V9rl8V6Gmq0goGMKE/
         AizBwooxHuUJ2y+Vy/L8+w8OGuhdxar31ubnVow33JlHxzoYCut6SR5AqJawnN97plWM
         LYiWXd8zsrhVv9/j0K4boWKG6urumT0Igv5slT0I1hVt8ytq/0VLHtUIyncn8XU7T0xH
         bgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ti+F59dwmnBVoTf/TrsKke+wcsbpbxaJrIFqVhERiI0=;
        b=5neoTcjGKT5MlAiVZ4M+8FYHzsrT8enwlt87LfBw97Crpamsn+Ypp+j/9YGXYhWUi5
         YJ/pok2BQntNUcGcVQiBgYALUa0oQ5cpMJA8Mc2N/6ocNqtG3RkKlVxsiLLb8NIKIOCZ
         HbiLtXqPHlP+i+QuG8cMT3//CT/Lv7qQElWD5mhWgSmRVn/3/XnIHB4NiBIP3gv0A9OJ
         5IkqSp+Uj2xAIspFg7pfHRcUFkMIRC2E5rxVrLEeiAuoTRVkrWiNylB1Gv98KteRxRjW
         nVE5/JDim7/Kz3makRKrNj1VdXW+pwiPcf7fcUS9lT1/yidS8Furwi68hXFXsvfjsZ/h
         zfnw==
X-Gm-Message-State: AFqh2kql5i9MIXaNTn5vTt5YEPWe6OAWfN5UnsSAaBGTD0F0nXYXzV9j
        r1rOrtTHfIuHQprU3yunuOVOKA==
X-Google-Smtp-Source: AMrXdXvSrv2OQ9UaAFQLdEBJeB8/jVPapHDhn3u9mCTsQiiU2bq+TQfCjA4YIXMkxapfLx9sS40ARA==
X-Received: by 2002:a17:907:bb92:b0:871:89d:75e with SMTP id xo18-20020a170907bb9200b00871089d075emr4961117ejc.16.1673994614735;
        Tue, 17 Jan 2023 14:30:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] clk: qcom: msm8996: add APCS clock driver
Date:   Wed, 18 Jan 2023 00:30:07 +0200
Message-Id: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The sys_apcs_aux clock can be used by CPU and CBF clock drivers to drive
those clocks from GPLL0 while doing initial setup. Add simple driver to
setup and export this clock.

Changes since v2:
- Added the conditional clause to schema forbidding usage of clocks and
  clock-names on platforms which do not pass additional clocks to the
  APCS device node (Krzysztof)
- Added SDX55 compat string
- Moved MSM8976 compat to the list of platforms using syscon.

Changes since v1:
- Removed the clk.h header inclusion (Stephen)
- Changed the module license from GPL v2 to bare GPL.

Dmitry Baryshkov (6):
  dt-bindings: mailbox: qcom: add SDX55 compatible
  dt-bindings: mailbox: qcom: enable syscon compatible for msm8976
  dt-bindings: mailbox: qcom: correct the list of platforms using clocks
  dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
  mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
  clk: qcom: add the driver for the MSM8996 APCS clocks

 .../mailbox/qcom,apcs-kpss-global.yaml        | 37 ++++++---
 drivers/clk/qcom/Makefile                     |  2 +-
 drivers/clk/qcom/apcs-msm8996.c               | 76 +++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |  2 +-
 4 files changed, 106 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

-- 
2.39.0

