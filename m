Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D2CE7C4E1
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 16:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243254AbjJDQTD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 12:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243265AbjJDQTC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 12:19:02 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FB1C9
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 09:18:58 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32483535e51so52527f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696436336; x=1697041136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuhFTaij8CkxaSGCgau6p1wn4p1PnkPS9KDREkl6rjc=;
        b=ZayGJP+ZhmEiA3zNvK+8+ghjkd6PvkF3uHCimw6y8ryhAV3fnokNQGvbWRJc8633n9
         FBIrRPlfplC3tsjoH87sWBDnwSNW6SzCqH5WikRKJVsPkvRY1GGzeZz+5G53Z9Hf2hRX
         ctI8BiBmoaoHlcaBPler3iDy8H4v7sbIZBMbkD3ayhZyJLUawFDlo1UP0CJI6CockDT+
         jFreGaypcgHJD2AvbNpcy9kdrOZEXp9ldcleI5//9J4apXWYB6pogrfvLuDF1nfeNcbM
         W100JsbOQ5Yp6OtLb4J1QdnVqbVQoNRx8puc6cy8h+X3nlK6jAZLtvE1MJAQsuWKWXqZ
         IFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436336; x=1697041136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuhFTaij8CkxaSGCgau6p1wn4p1PnkPS9KDREkl6rjc=;
        b=lDxu99dkWj+ev7Ln6zSU3nS8PGs4yvAJIohwGBuznTkxwRJsmo8/ORddrZocH5K/An
         CLSskXKdRcbpDopiZnWihick6IxfayGWDeMnmLxsa/+yf8xEZLlTau40B8mCdxAwXwnK
         1282wT8iFVPdYzMxaCnC9aUOpaVYftEyTa+lkTHdQY3bSCKvesgvJBIsoKbxP/6CfZdz
         hj63AXjMtGrDg+x0SWksz0A2G01eGOn6GdxCT8LveNu7rrpnF1oMvLuorFD/S4aZpfPJ
         ayL8RMBU8fWDPYHRv4nzFI35a7Vcy9j9aT8s6n9YsoPt/JnFoX8OdQ8eZI4AMf6j/qTI
         z0hg==
X-Gm-Message-State: AOJu0Yz1oTYDRM2+Y+biiRjgD4H8oJ1YuDOs1QmYJbVcAiYKic93RpV+
        1Ksl0ZiSm4iGlc/6HhC7hxpaeg==
X-Google-Smtp-Source: AGHT+IFpplTkgGRp8rnQ4WsOfy9Dx9PpGwm+77I2uJ5Zk67hlVkVh4dJWT4ntcpviQe7xU/SEXHitA==
X-Received: by 2002:a5d:45c9:0:b0:323:1f49:de96 with SMTP id b9-20020a5d45c9000000b003231f49de96mr2419310wrs.49.1696436336364;
        Wed, 04 Oct 2023 09:18:56 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r5-20020adfe685000000b003177074f830sm4366940wrm.59.2023.10.04.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 09:18:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/4] Add sc8280xp CAMCC bindings and driver
Date:   Wed,  4 Oct 2023 17:18:49 +0100
Message-Id: <20231004161853.86382-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch depends-on:
https://lore.kernel.org/linux-arm-msm/20230923112105.18102-4-quic_luoj@quicinc.com

V3:
- Resolves CLK_CRITICAL camcc_gdsc_clk by making camcc_gdsc_clk
  always-on and dropping the CLK_CRITICAL flag.
  We want camcc_gdsc_clk for retention, however CLK_CRITICAL is not
  compatible with pm_runtime suspend and power collapse. - Konrad, Bod

- Uses gcc.yaml instead of camcc-common.yaml - Krzysztof

- Drops fix for 8550, TBH I didn't know use for socname-ip.yaml
  with compat strings for different drivers was OK, so long as the
  content of the yaml was compliant for both. - Krzysztof

- Drops clock-names, adds RB as indicated - Konrad

- Reworks "really_probe" to account for patch from Lou Jie which
  is RB from Stephen Boyd but not in any -next tree I can point to right
  now. - Konrad, Bod

- :g/CAM_CC/s//CAMCC/g - Bod

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/clk-for-6.7-camcc-sc8280xp-v3
 
V2:

I've expanded the scope of this series to include some fixups for the
camcc.yaml in general.

- Adds qcom,camcc-common.yaml
  There are a number of repeated patterns in the various camcc yaml
  files which we can contain in a common camcc .yaml instead.
  I used gcc.yaml as a base per Krzysztof's suggestion.

- Adding the common values file I noticed that sm8450 and sm8550 were
  both listed as compatible strings in qcom,sm8450-camcc.yaml.

  This appears to be in error though since sm8450 and sm8550 are
  not compat strings of the same driver but different drivers entirely.

- Switches to indexing, instead of fw_name for clocks - Konrad

- Adds the GCC AHB to the clock index - Bod/Konrad

- Changes reference "cam_cc" to "camcc" throughout camcc-sc8280xp.c

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-26-10-23-sc8280xp-camcc-v2

V1:
This is a bog-standard series to add in the CAMCC for 8280xp.
As a precursor to adding in sc8280xp I thought a bit of tidy up on the
existing yaml for the camcc controllers in general would be worthwhile.

As a result there's a precursor patch which aggregates the various camcc
yaml files into one location.

The sc8280xp looks like sdm845 with more blocks. Similar to sc8280xp we
park GDSC to CXO. Thanks to Dmitry for the suggestion the GDSC parking.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-09-23-sc8280xp-camcc

Bryan O'Donoghue (4):
  dt-bindings: clock: Use gcc.yaml for common clock properties
  dt-bindings: clock: Add SC8280XP CAMCC
  clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
  arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp

 .../bindings/clock/qcom,camcc-sm8250.yaml     |   18 +-
 .../bindings/clock/qcom,sc7180-camcc.yaml     |   18 +-
 .../bindings/clock/qcom,sc7280-camcc.yaml     |   18 +-
 .../bindings/clock/qcom,sdm845-camcc.yaml     |   18 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml     |   20 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   15 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sc8280xp.c             | 3048 +++++++++++++++++
 .../dt-bindings/clock/qcom,sc8280xp-camcc.h   |  179 +
 10 files changed, 3274 insertions(+), 70 deletions(-)
 create mode 100644 drivers/clk/qcom/camcc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,sc8280xp-camcc.h

-- 
2.40.1

