Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE20C4708D
	for <linux-clk@archiver.kernel.org>; Sat,  3 Dec 2022 17:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiLCR6T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Dec 2022 12:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiLCR6N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Dec 2022 12:58:13 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7AC10056
        for <linux-clk@vger.kernel.org>; Sat,  3 Dec 2022 09:58:11 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b3so12225594lfv.2
        for <linux-clk@vger.kernel.org>; Sat, 03 Dec 2022 09:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GV6lStOUC0qtqhWbdKjqKtQ9zNSmxaDPHpqHNhhRf3w=;
        b=YK8W6WGD7l9l5vpBDYUtb/PE7En050lSbHBCnkpVg0DrGWOWIB8eps/f0pvkbWdmXU
         qouznzVH91p79rPkf73L2bEzQY2WGDVTDXoigBvdH69VnQuL5Y0B+TwV2Zm3LqEg8WPO
         nCHym4ZGg2wUFyIzeAw6M+lh9SaGw8omLOZnKxe4AfEcarL9yB6ZSj3jKXP+Hkz+33EM
         p3l1F5+RL1T6LjbRImat91LYd3JCLt/0BJYQNfMs7/wXC6ZHmhkQIWGI5tmcULHvdj18
         NWZdyP253ODJg+luTpu7E3VajP1nr0CEPJeiPaT1FXVkJXYwn0IntSUaWSq2t1QHuG7y
         8UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GV6lStOUC0qtqhWbdKjqKtQ9zNSmxaDPHpqHNhhRf3w=;
        b=2XmFuR6Et4/5s/U9cpG/PuhG3mEQqEaVG5lr+dY3rJ2c8KSJphRpasICflqgtJDmlO
         gHRW/LoayTygpKxQuRXwKq8sZoIwKDi752ItgOCMTt0EfHZR0zD5YwS7oK/KrN4xqO5j
         qDxXBARdrVqokxRyRdBIr2nqM5qjUHwQiwSlK+uDX1VpBenPdpCFdtk2MIRjofySWI8N
         9uBzovZjcbarg8g84oNN258GQm3gVCpN0IxRxL5YhYf+OvoW4QiyQOtAUoFabQiR2QmD
         ADKEh0ZpmxSvspVaVyckya0We1+EJfM2JUJAu8npNORrU36wocHALQiuGAARQSP+NnWN
         vxVQ==
X-Gm-Message-State: ANoB5pkVFiwrsX/73mmmDPjKXxX/HrQfOYU+3G1qm5UUl0o/LFrmDzrA
        b6Gtrsd+DRHZMbTdye4yMmpw5w==
X-Google-Smtp-Source: AA0mqf6J7xAkO0UMSFvsbvvxPAsA+fjiFHu76zH1o3iPMjFFHFlzSUXjYljNUnuWVBrHxMR6UCBW1g==
X-Received: by 2002:a19:8c06:0:b0:4b4:b63f:a69a with SMTP id o6-20020a198c06000000b004b4b63fa69amr25354872lfd.197.1670090289858;
        Sat, 03 Dec 2022 09:58:09 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 00/16] clk: qcom: smd-rpm: drop platform names
Date:   Sat,  3 Dec 2022 19:57:52 +0200
Message-Id: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series concludes the previous work on Qualcomm RPM and RPMH clock
drivers. It reworks the clk-smd-rpm driver to drop the SoC name from the
clock symbol name, as the clock definitions are shared between different
SoCs (platforms). Having an SoC name in the clock definition can lead to
all sources of confusion and/or errors.

Dmitry Baryshkov (16):
  clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125
    clocks
  clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
  clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290
    clocks
  clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
  clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
  clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
  clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL
    clock
  clk: qcom: smd-rpm: drop the rpm_status_id field
  clk: qcom: smd-rpm: move clock definitions together
  clk: qcom: smd-rpm: rename some msm8974 active-only clocks
  clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
  clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
  clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
  clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
  clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
  clk: qcom: smd-rpm: remove usage of platform name

 drivers/clk/qcom/clk-smd-rpm.c         | 1393 ++++++++++++------------
 include/dt-bindings/clock/qcom,rpmcc.h |    2 +
 include/linux/soc/qcom/smd-rpm.h       |    1 -
 3 files changed, 693 insertions(+), 703 deletions(-)

-- 
2.35.1

