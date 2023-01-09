Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB66C54EBD
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 00:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjAIA3m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 8 Jan 2023 19:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjAIA3k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Jan 2023 19:29:40 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0736FBF6F
        for <linux-clk@vger.kernel.org>; Sun,  8 Jan 2023 16:29:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id p25so1169747ljn.12
        for <linux-clk@vger.kernel.org>; Sun, 08 Jan 2023 16:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FyO60+1ahxnZMeLVY7otQN3Vyc7r0+eEdWjJHYyzXHM=;
        b=QaTLOCozXErPo9kask6wWLzoyG0h+4q1CKRhG6R43i2OugYNGLOk3PxKM/0N5aVT/2
         nCrU/yhfvlVm88fV1xQ9jRCGZytzbEsCZPs+RkKrM4y5w15ksQ+RQUqk6U3z2bz4T0hE
         OcJ8rSUGWgU8spsiPRbXiqwApQ12s3yKI8FPEmTo6suVV2zwEeB4UFqjAfoIUGU1QvIK
         XKLzTUQXdQqCu8tfUDOPmJfIPrQsTir3DJKoBYvl1jTgdgQ9Hhh0aoMe6UQQW0vrv46y
         MVBPKTZFq773J9Ozzie5WviOmV1Q8UyMzXMou8mVuxEKWp8gd+GrJPoWXzBiFgna2ZI/
         6ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyO60+1ahxnZMeLVY7otQN3Vyc7r0+eEdWjJHYyzXHM=;
        b=u1NS9InMKbjuJn2tTMDChizpFRI3/v8lVLvFAk+vh+iIK6ic2ASfkG3+cd3XvsfR8Q
         TiiYWeNe/0CXZNnMl2nbUTcLh4BYnzXXU/Jm+R9M4+G3xIILl5DkYP1sSGR8S6EYjOuE
         IuOTGGuGFyXpPhGg8k+a2xBZw1DemZgE032JSyO8A/y15YwAyfHY7bmHZh/v+0ROweWp
         SLL3DHLH5cfj8b29UxaHB9248lxK+dpc3eU7t1oJLVbmgMw1wb8zipo+Y9LTKpCmyegF
         GTBJEI9JY2/kMMCjko7ceLcAwbhmMx2gDrcB639dNgGWN4h6S9EL40g0sbHdwxc1JMnW
         s4eQ==
X-Gm-Message-State: AFqh2koVvsPw5LxEMlJLJ+AKXSa63Q7yidRo9ODmf0IEjKq7xG498tZS
        VbkUUHZ1Egf4shOw3TpKq7LJuPCVmQLNZPOe
X-Google-Smtp-Source: AMrXdXs/wyYesCXijvkDtUnD3XBx/Fcih0q5zjrj9do8jkcsWkXXxqnbBBl+MxPO4JkemxIiWjleoQ==
X-Received: by 2002:a2e:8344:0:b0:281:f44c:5dcb with SMTP id l4-20020a2e8344000000b00281f44c5dcbmr2563785ljh.32.1673224176375;
        Sun, 08 Jan 2023 16:29:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 00/12] clk/interconnect: qcom: finish migration of IP0 to clocks
Date:   Mon,  9 Jan 2023 02:29:23 +0200
Message-Id: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commits 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0
interconnects") and 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0
interconnects") removed IP0 interconnects (and ipa-virt devices support)
in favour of the RPMH clocks. Follow this example for other platforms
defining IP0 RPMH resource. While we are at it, remove several leftover
from the mentioned patches.

Changes since v2:
- Fixed the stack frame size warning by moving the ignore_list out of
  the function to the rodata section.

Changes since v1:
- Reorder patches to put clock patch after the interconnect patches
  (Alex)
- Add comments in place of removed defines (Alex)
- Drop ipa-virt nodes from device trees
- Add removed ipa-virt nodes to the blacklist in of_count_icc_providers
  to let icc_sync_state work even with non-updated device trees.

Dmitry Baryshkov (12):
  interconnect: qcom: sdx55: drop IP0 remnants
  interconnect: qcom: sc7180: drop IP0 remnants
  interconnect: move ignore_list out of of_count_icc_providers()
  interconnect: qcom: sm8150: Drop IP0 interconnects
  interconnect: qcom: sm8250: Drop IP0 interconnects
  interconnect: qcom: sc8180x: Drop IP0 interconnects
  interconnect: qcom: sc8280xp: Drop IP0 interconnects
  dt-bindings: interconnect: qcom: Remove ipa-virt compatibles
  dt-bindings: interconnect: qcom: drop IPA_CORE related defines
  clk: qcom: rpmh: define IPA clocks where required
  arm64: dts: qcom: sm8150: drop the virtual ipa-virt device
  arm64: dts: qcom: sm8250: drop the virtual ipa-virt device

 .../bindings/interconnect/qcom,rpmh.yaml      |  3 --
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  7 ----
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  7 ----
 drivers/clk/qcom/clk-rpmh.c                   |  4 ++
 drivers/interconnect/core.c                   | 14 ++++---
 drivers/interconnect/qcom/sc7180.h            |  4 +-
 drivers/interconnect/qcom/sc8180x.c           | 38 -------------------
 drivers/interconnect/qcom/sc8180x.h           |  4 +-
 drivers/interconnect/qcom/sc8280xp.c          | 25 ------------
 drivers/interconnect/qcom/sc8280xp.h          |  4 +-
 drivers/interconnect/qcom/sdx55.h             |  4 +-
 drivers/interconnect/qcom/sm8150.c            | 21 ----------
 drivers/interconnect/qcom/sm8150.h            |  4 +-
 drivers/interconnect/qcom/sm8250.c            | 21 ----------
 drivers/interconnect/qcom/sm8250.h            |  4 +-
 .../dt-bindings/interconnect/qcom,sc7180.h    |  3 --
 .../dt-bindings/interconnect/qcom,sc8180x.h   |  3 --
 .../dt-bindings/interconnect/qcom,sc8280xp.h  |  4 +-
 include/dt-bindings/interconnect/qcom,sdx55.h |  2 -
 .../dt-bindings/interconnect/qcom,sm8150.h    |  3 --
 .../dt-bindings/interconnect/qcom,sm8250.h    |  3 --
 21 files changed, 27 insertions(+), 155 deletions(-)

-- 
2.39.0

