Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE96C3DA7D
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 14:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbjACOzU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 09:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233469AbjACOzS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 09:55:18 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E794DFD0C
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 06:55:17 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id i19so19162402ljg.8
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkeuSTrUwMmPm8PtoG7xtSFktcIJW9+evFPZiE9ItTw=;
        b=neDEoJAHcJ8YkPt6bcDPRHGKqSBV1jiVQ2LkyJRUJu65KP68ZmhBfoSaSLvzYt6LyY
         j9t8e2ot50oA01QY1bsMfPgKltqNJnnN0U9cx08AAqUjs35WCB+Ou3lOlpkb8XvibD5k
         g7zR3xsvXSPBFYVOARVzEVms7IZSXmRMPmW2Ad6Gyj4X3GY0/PtL62WPGYfWH3vzxbLw
         bZjV0/KRbpmAXaKJZLTKfuVts6p3Lfi3w3SCYSdUolfn+So+ouqBO8L0vaDkkjooSPk6
         KIkiSG7LZEygLqZSB3otYxzvszXd1DCVurwPfIFrSokrtesEp1034V7nYkq7sZMtWWAy
         C+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkeuSTrUwMmPm8PtoG7xtSFktcIJW9+evFPZiE9ItTw=;
        b=51J3Yb4jXeObx9rdqPbm52uTFnpkDOEEzfYlM0HpX8XX0jHjkiyW13dsi5Kzi8sBN+
         4wKMKCHXZwcUzCB5uxWUj2xvVcPDpiukFdwKf+lKs2zYKwe/iGKHUkuWIZCIroYbV/Cd
         g4+FkFlIkWMq0xQkmlgl2Ce/56fRBJBTLHmGHHwrJXCZjW8kEaWYXk91tspEAxCYjyR7
         cPN9O+GawxcyptqOCiYcoe0w51VJQapSs7H/99cFxwtWEmLPvETM95ZydvdE0IPcsJm+
         9zGEnCD5AB4w8D+y92+NKW8opVk7H89cA2XMX+znrt+F81Tq3RaCukc8C2APyiuAeHYV
         oy7g==
X-Gm-Message-State: AFqh2kqYlXkEu+bZqnN7BNAKPXptruz5Gd0HY1614MLSRucl8J2QtgcC
        ivqiNBktJUCDrv5rLka8Y9YcAA==
X-Google-Smtp-Source: AMrXdXtScCdTATWkVchRPPhhH1wiOIqoz/OXzuVNUoiS+5DXnENCKTqHAequzsvKyIQ2+rYoweKJvw==
X-Received: by 2002:a2e:b895:0:b0:279:ee72:6ab1 with SMTP id r21-20020a2eb895000000b00279ee726ab1mr15112540ljp.42.1672757716266;
        Tue, 03 Jan 2023 06:55:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 00/21] clk: qcom: small cleanup
Date:   Tue,  3 Jan 2023 16:54:54 +0200
Message-Id: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

While reviewing dispcc-sm8550 I noticed that existing drivers also have
several small points for improvement.

Dmitry Baryshkov (21):
  clk: qcom: dispcc-sm8450: switch to parent_hws
  clk: qcom: dispcc-sc7180: switch to parent_hws
  clk: qcom: dispcc-sm6375: switch to parent_hws
  clk: qcom: camcc-sc7280: switch to parent_hws
  clk: qcom: camcc-sm8450: switch to parent_hws
  clk: qcom: gcc-msm8939: switch to parent_hws
  clk: qcom: gcc-msm8976: switch to parent_hws
  clk: qcom: gcc-sc7180: switch to parent_hws
  clk: qcom: gcc-sc7280: switch to parent_hws
  clk: qcom: gcc-sdx65: switch to parent_hws
  clk: qcom: gcc-sm6375: switch to parent_hws
  clk: qcom: gcc-sm8250: switch to parent_hws
  clk: qcom: gcc-sm8450: switch to parent_hws
  clk: qcom: gcc-sm8550: switch to parent_hws
  clk: qcom: gpucc-msm8998: switch to parent_hws
  clk: qcom: gpucc-sc7180: switch to parent_hws
  clk: qcom: lpasscc-sc7180: switch to parent_hws
  clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
  clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
  clk: qcom: lpasscc-sc7280: switch to devm_pm_runtime_enable
  clk: qcom: videocc-sm8250: switch to devm_pm_runtime_enable

 drivers/clk/qcom/camcc-sc7280.c       | 268 ++++++++++-----------
 drivers/clk/qcom/camcc-sm8450.c       | 324 +++++++++++++-------------
 drivers/clk/qcom/dispcc-sc7180.c      |   8 +-
 drivers/clk/qcom/dispcc-sm6375.c      |   4 +-
 drivers/clk/qcom/dispcc-sm8250.c      |   9 +-
 drivers/clk/qcom/dispcc-sm8450.c      | 221 +++++++++---------
 drivers/clk/qcom/gcc-msm8939.c        |  32 +--
 drivers/clk/qcom/gcc-msm8976.c        |  30 +--
 drivers/clk/qcom/gcc-sc7180.c         |   3 +-
 drivers/clk/qcom/gcc-sc7280.c         |  10 +-
 drivers/clk/qcom/gcc-sdx65.c          | 109 +++++----
 drivers/clk/qcom/gcc-sm6375.c         | 252 ++++++++++----------
 drivers/clk/qcom/gcc-sm8250.c         |  10 +-
 drivers/clk/qcom/gcc-sm8450.c         | 236 +++++++++----------
 drivers/clk/qcom/gcc-sm8550.c         | 252 ++++++++++----------
 drivers/clk/qcom/gpucc-msm8998.c      |   8 +-
 drivers/clk/qcom/gpucc-sc7180.c       |   4 +-
 drivers/clk/qcom/lpasscc-sc7280.c     |  10 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c |  20 +-
 drivers/clk/qcom/videocc-sm8250.c     |   9 +-
 20 files changed, 896 insertions(+), 923 deletions(-)

-- 
2.39.0

