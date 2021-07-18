Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BA6C636CD
	for <linux-clk@archiver.kernel.org>; Sun, 18 Jul 2021 10:49:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1634611F2
	for <linux-clk@archiver.kernel.org>; Sun, 18 Jul 2021 10:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbhGRKwK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Jul 2021 06:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbhGRKwI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Jul 2021 06:52:08 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41CD9C061766
        for <linux-clk@vger.kernel.org>; Sun, 18 Jul 2021 03:49:09 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id l11so5958627ljq.4
        for <linux-clk@vger.kernel.org>; Sun, 18 Jul 2021 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ns8QFitZLPcwmFGJH/IoWVhidyJ3YSGIPh601UhjtkI=;
        b=jb4KPfNuh2HcFsXjoaZ7xMCSJDtz22TZQxRYH5Ld12mOhGZ/2KDcqeaKvo+d1oStIb
         EKR+AMufiaKJrEn53rJwaUSUU5AF2urVMiCwhReGqmT7pl7hdgeHah0z0T2+VHFsX80Q
         eSH3N60Ar5zw9Ow4TPMWsDIsqWLLitIaNMkUDPiXR3f3LZCJOswO8seQ1mwHtkoEcp+v
         GGLwpJZ5arUbwZmKCt2Svq3az6OesdCT0EH652bekQCzkYWN9uYdO30p1aUUPmxPijvD
         xxmbx8+qIKkKhfH40ZdEvFY+YXBChaCRJJXg78RBQoPIfWn31OIXymHu7cicPtNfZoiD
         BVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ns8QFitZLPcwmFGJH/IoWVhidyJ3YSGIPh601UhjtkI=;
        b=OYsP3GXspKBVaVX6ne4OOtCxIC4CRBYuBGX3C0UmqDFuhjWWG7CGdx3Tis/EWZeaO0
         Cyd0WcE1l+7Mx0tSpgF8OWmNfzjuNE2tMYg5QZi8yXMbEWzEwiqYqewMKYltEiKkvBF2
         l82lhI+R+jg/tur19zVMcBZxXtPjb7yrBxQ7s4asBt7PUf1RFp9wHUSCQtiM5JvdXzEM
         8Ek3FlWBYKeFvZq9iuLBcTCze+swT/CLLn3qqHbl4fwbeLJi/khEidF4ju7wnfNerM4e
         0DdMVMZoGDUc9V1IzBCTzaoMwW1PK1LS+eCv8QdP7SlzZFzNFUToH+IlMODjWD3WdHjy
         hlNQ==
X-Gm-Message-State: AOAM530Qw9HcXK10Ad4V7b9TocYmHZh1RlIhYkAciRhBkJ7qE3OJgUps
        dEDtMv2Trdxz1ZzbCYaxJzGhFQ==
X-Google-Smtp-Source: ABdhPJwQUY96yW4DWHCu3a9S3SRo1yCER4Jyu3t5Ey7be7LR7OHHsHKYC8T7ghLROfIuf/weJoX+7A==
X-Received: by 2002:a2e:a315:: with SMTP id l21mr13201098lje.359.1626605347382;
        Sun, 18 Jul 2021 03:49:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y22sm1039528lfh.154.2021.07.18.03.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 03:49:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] clk: qcom: use power-domain for sm8250's clock controllers
Date:   Sun, 18 Jul 2021 13:48:52 +0300
Message-Id: <20210718104901.454843-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SM8250 both the display and video clock controllers are powered up by
the MMCX power domain. Handle this by linking clock controllers to the
proper power domain, and using runtime power management to enable and
disable the MMCX power domain.

Dependencies:
- https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
  (pending)

Changes since v4:
 - Dropped pm_runtime handling from drivers/clk/qcom/common.c Moved the
   code into dispcc-sm8250.c and videocc-sm8250.c

Changes since v3:
 - Wrap gdsc_enable/gdsc_disable into pm_runtime_get/put calls rather
   than calling pm_runtime_get in gdsc_enabled and _put in gdsc_disable
 - Squash gdsc patches together to remove possible dependencies between
   two patches.

Changes since v2:
 - Move pm_runtime calls from generic genpd code to the gdsc code for
   now (as suggested by Ulf & Bjorn)

Changes since v1:
 - Rebase on top of Bjorn's patches, removing the need for setting
   performance state directly.
 - Move runtime PM calls from GDSC code to generic genpd code.
 - Always call pm_runtime_enable in the Qualcomm generic clock
   controller code.
 - Register GDSC power domains as subdomains of the domain powering the
   clock controller if there is one.

----------------------------------------------------------------
Dmitry Baryshkov (9):
      dt-bindings: clock: qcom,dispcc-sm8x50: add mmcx power domain
      dt-bindings: clock: qcom,videocc: add mmcx power domain
      PM: runtime: add devm_pm_runtime_enable helper
      clk: qcom: dispcc-sm8250: use runtime PM for the clock controller
      clk: qcom: videocc-sm8250: use runtime PM for the clock controller
      clk: qcom: gdsc: enable optional power domain support
      arm64: dts: qcom: sm8250: remove mmcx regulator
      clk: qcom: dispcc-sm8250: stop using mmcx regulator
      clk: qcom: videocc-sm8250: stop using mmcx regulator

 .../bindings/clock/qcom,dispcc-sm8x50.yaml         |  7 +++
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  7 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 11 +---
 drivers/base/power/runtime.c                       | 17 +++++++
 drivers/clk/qcom/dispcc-sm8250.c                   | 21 ++++++--
 drivers/clk/qcom/gdsc.c                            | 59 ++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h                            |  2 +
 drivers/clk/qcom/videocc-sm8250.c                  | 24 ++++++---
 include/linux/pm_runtime.h                         |  4 ++
 9 files changed, 131 insertions(+), 21 deletions(-)


