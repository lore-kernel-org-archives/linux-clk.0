Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49699C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 14:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237469AbiEWO4g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 10:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237417AbiEWO4g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 10:56:36 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8483B41602
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 07:56:34 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id f5-20020a4aa685000000b0040e7e819183so868887oom.3
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 07:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5p71BIdSffyci9oS1GEBoO6Hvvh+FQt15GEReLDlDuc=;
        b=HqfxLV20FvSqJr63yG0bHzAT+iKcqaxSZeP5pJkxSqMMRaO8OBcs5nsBUA02Sr9M/X
         WdEkY12N67JeBUcsIDZk7oeDMAOU9v7JlCoHlHIfIR3XUsDl+ykcmn/XfbEAP+G2IWtA
         666wtccbdmCpa+mGnUD209unqTO6n+wqWpTGyJ3ozVlfSHFwqTUlsE8ynoj+OWMOGkde
         QLZLU8GKx3ompPydmL5jCeHg3Khh/jxPwkvFDm5RQNDxZJe/XZPPO+m7eg1tap4ZmS8Q
         LrQZpn8y3kPZdJM2oHZpGlbdb9jSNcLJUCy1EKgHIgqHxxHgTd6RtXYilnekRfWmX495
         rDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5p71BIdSffyci9oS1GEBoO6Hvvh+FQt15GEReLDlDuc=;
        b=fr1PM39PHEcezO9E9ZZc7FmmGJD4/KgPKaG+nif+nblJKtbcGfPHzeUyZxdAvE9a9o
         0dNsumxbJoXFVz2h/HqUJc32/oIjqzNiSI5UXJESNVplCbdXEh3LF+uGsLgtFfKH0zq0
         PGCb0LWRJ9w52LcGLuKz6qy9pymOoCf1F475UXi41HmVnNtY2z9R4+kX038uzm9UBGw5
         hucEUtnAbjHZCGwAXPXGV9dDnKbbTOYsjjtcm2K0NZUdJizzoQGmSELN/aH9UiP8XVkp
         dfUCWX/RUcRPvObvWZDenLtk5Q8/4qHuz7jVIifr7zr4UdQqkKBt1ie35d83rFjU8V9z
         eD5Q==
X-Gm-Message-State: AOAM531ng2fh8TiMViujkrjqqYu/n1CypkvPjFrj5yoUxGgp0nNlYHWH
        bcDMyteW/mJp49GHvR1CafnmaQ==
X-Google-Smtp-Source: ABdhPJyoOJ1HH8gLzOg+3tKjfNaWX5Ch00ycxsgFJGgBHkfWH1QUCCazWXeJXaZG/aTeofZ8y+pXHA==
X-Received: by 2002:a4a:b687:0:b0:40e:7950:e52 with SMTP id v7-20020a4ab687000000b0040e79500e52mr3629986ooo.74.1653317793818;
        Mon, 23 May 2022 07:56:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l6-20020a056871068600b000e686d1389esm3978422oao.56.2022.05.23.07.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:56:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, Adam Skladowski <a39.skl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Taniya Das <tdas@codeaurora.org>
Subject: [GIT PULL] Qualcomm clock updates for v5.19
Date:   Mon, 23 May 2022 09:56:32 -0500
Message-Id: <20220523145632.42086-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-5.19

for you to fetch changes up to 703db1f5da1e3a62b84356a29c150efa24a2377d:

  clk: qcom: rcg2: Cache CFG register updates for parked RCGs (2022-05-19 16:42:30 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v5.19

This introduces the LPASS clock controller driver for sc7280 and the
global clock controller for SC8280XP.

It adds modem reset, corrects RPM clocks and moves to floor ops for SDCC
on MSM8976. It introduces clocks needed to operate the Sensor Subsystem
in MSM8998.

It enhances the logic for parked shared RCG2s, to avoid problems on
recent platforms. And lastly it introduces a new mechanism for handling
the PCIe pipe_clk, which also needs to be parked on a safe source when
the PHY is turned off.

----------------------------------------------------------------
Adam Skladowski (4):
      clk: qcom: smd: Update MSM8976 RPM clocks.
      clk: qcom: gcc-msm8976: Set floor ops for SDCC
      dt-bindings: clk: qcom: gcc-msm8976: Add modem reset
      clk: qcom: gcc-msm8976: Add modem reset

Bjorn Andersson (6):
      Merge tag '20220323085010.1753493-4-dmitry.baryshkov@linaro.org' into clk-for-5.19
      Merge branch '20220223172248.18877-1-tdas@codeaurora.org' into clk-for-5.19
      Merge branch '20220411072156.24451-2-michael.srba@seznam.cz' into clk-for-5.19
      dt-bindings: clock: Add Qualcomm SC8280XP GCC bindings
      clk: qcom: add sc8280xp GCC driver
      clk: qcom: rcg2: Cache CFG register updates for parked RCGs

Dmitry Baryshkov (3):
      clk: qcom: regmap-mux: add pipe clk implementation
      clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
      clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe clocks

Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,rpmcc: convert to dtschema
      dt-bindings: clock: qcom,rpmcc: add clocks property
      dt-bindings: clock: qcom,gcc-apq8064: Fix typo in compatible and split apq8084

Michael Srba (2):
      dt-bindings: clock: gcc-msm8998: Add definitions of SSC-related clocks
      clk: qcom: gcc-msm8998: add SSC-related clocks

Taniya Das (2):
      dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
      clk: qcom: lpass: Add support for LPASS clock controller for SC7280

 .../bindings/clock/qcom,gcc-apq8064.yaml           |    4 +-
 .../bindings/clock/qcom,gcc-apq8084.yaml           |   42 +
 .../bindings/clock/qcom,gcc-sc8280xp.yaml          |  128 +
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   63 -
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   75 +
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |  172 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |    4 +
 drivers/clk/qcom/Kconfig                           |   19 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rcg.h                         |    2 +
 drivers/clk/qcom/clk-rcg2.c                        |  126 +-
 drivers/clk/qcom/clk-regmap-mux.c                  |   78 +
 drivers/clk/qcom/clk-regmap-mux.h                  |    3 +
 drivers/clk/qcom/clk-smd-rpm.c                     |    8 +-
 drivers/clk/qcom/gcc-msm8976.c                     |    7 +-
 drivers/clk/qcom/gcc-msm8998.c                     |   56 +
 drivers/clk/qcom/gcc-sc7280.c                      |    6 +-
 drivers/clk/qcom/gcc-sc8280xp.c                    | 7488 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sm8450.c                      |    6 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |  838 +++
 drivers/clk/qcom/lpasscorecc-sc7280.c              |  431 ++
 include/dt-bindings/clock/qcom,gcc-msm8976.h       |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |    4 +
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h      |  496 ++
 .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |   43 +
 .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |   26 +
 26 files changed, 10024 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
 create mode 100644 drivers/clk/qcom/gcc-sc8280xp.c
 create mode 100644 drivers/clk/qcom/lpassaudiocc-sc7280.c
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7280.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8280xp.h
 create mode 100644 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
 create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h
