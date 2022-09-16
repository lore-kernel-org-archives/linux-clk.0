Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98AFEC54EE9
	for <linux-clk@archiver.kernel.org>; Fri, 16 Sep 2022 06:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbiIPGRp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Sep 2022 02:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiIPGRo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Sep 2022 02:17:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189E94CA34
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u18so33932984lfo.8
        for <linux-clk@vger.kernel.org>; Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IGJdO2o9W+EN9QbSgrXXc87YNjS5Imv5FNNu7TSke8M=;
        b=ediOniOvKQsnu4ipXEdJ5RnQ3r0QzOmyZDnEkpC1CrOtZBCl7KfHzXi/AJWbcHuyHT
         h7fxsdnHxyR3pCtQ7s528qKw7XPVRrcdvDelAzB2BSh7GeIz9uXcRKXfPwN70Tml48ox
         sutHHaZ0NRAMc0ki5J9OTB2T2fGMWEJqhqOfVkhLR2uFYo2NIflwPYXPhB/RZxQkkpNK
         IKvUUgV9ZerqwxG4Yrte23h+YgFcK96eY6+4z3lsAJf3rrgE280RgZKDmaD9UNsV6NzL
         eAu5G/jVG6cEwCaBB5lToVx09WqXDnhnFt8TOg5/skwTyW4N10wRkDosSlEmYqwYz5rt
         nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IGJdO2o9W+EN9QbSgrXXc87YNjS5Imv5FNNu7TSke8M=;
        b=xanCAsK0pjPcf/VtfChqBOYSWt1uWIUgeueH1b/XwI9V1Di23Z2j5M12GzQFAI4xlp
         eB50V9Xwey1OBYDNJVnas7R0UsaLeFO+bv5KDgY2OyfCYgsqAPZiv9mSM+mpR+awFZLN
         7KhGwjN6kzWRgdXFaOTY3906q6YA3K4tN7ydEKWLCyfElh+ndGy40ZMUOYKqQucAZYKd
         uXC+f25u+oMZpLXdeXYJPUgdV0skr1+en8J6R+B1et4FpN+Efafyqu3qiz58JLmRRuO2
         BKgTjMMkRIHw8LUBks8iLNUwVjkmnuKXx4e6M0RtKnLx6ytiaio5B+ntISzF8JmCnOJq
         g1gQ==
X-Gm-Message-State: ACrzQf1uG0YMOqR1FqrfW7NPtNx6VB2zoOP6ZWeePQ8PYsS190MZsaUW
        52DayhG7nOUS0cuCHYr5nbdAog==
X-Google-Smtp-Source: AMsMyM6PIkWlCjzFPaXY8+6RRN4/pzBptHKoG2rk9EfbxoDRJtBRoHvHNGcRABuG92wKdtplYTFrrQ==
X-Received: by 2002:a05:6512:3da1:b0:49f:1b3d:88b9 with SMTP id k33-20020a0565123da100b0049f1b3d88b9mr1057157lfv.67.1663309061446;
        Thu, 15 Sep 2022 23:17:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b15-20020a2eb90f000000b00261eaa819b7sm3529383ljb.30.2022.09.15.23.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 23:17:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: [PATCH v4 0/3] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Fri, 16 Sep 2022 09:17:37 +0300
Message-Id: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
be used as GCC clock parents).

Changes since v3:
- Rewrote asm9260 clk driver to fix the TODO item by using parent index
  rather than calling of_clk_get_parent_name().

Changes since v2:
- Added error handling to phy_symbols_clk_register() (requested by
  Johan).

Changes since v1:
- Added a macro used by clk-asm9260, so that the clk-fixed-rate changes
  do not affect the driver
- Changed registered clock names to be unique (as e.g. SC8280XP will
  have two UFS PHYs).

Dmitry Baryshkov (3):
  clk: asm9260: use parent index to link the reference clock
  clk: fixed-rate: add devm_clk_hw_register_fixed_rate
  phy: qcom-qmp-ufs: provide symbol clocks

 drivers/clk/clk-asm9260.c               | 29 +++++-------
 drivers/clk/clk-fixed-rate.c            | 28 ++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++++++++++++++
 include/linux/clk-provider.h            | 48 +++++++++++++++++---
 4 files changed, 136 insertions(+), 28 deletions(-)

-- 
2.35.1

