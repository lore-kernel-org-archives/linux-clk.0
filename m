Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A978C43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 08:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbiF3ITa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 04:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbiF3ITH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 04:19:07 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F91B0D
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:17:48 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx13so13463515ljb.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwgwXCkgqhWhsAYcDwBGLHI9mFw90gt72ulhS68U2Tk=;
        b=MngPsYYp9yTp+LiWi6ew/M9vK4DeUiYv2hq/teOhHL9u2Y2nqC6dMWQdsqcXqGIODw
         5tMduKfmxgvq6EO4slP/MOuEhJ/WvLvwZotvNohXUK99MuXA0lQ3a1xEkb4EDqkR0W5c
         8kbBmk9EL5S2NMCd2ExsuIU3tTL9EqkRwuX/nggVOQ5vc6ClSG9xdxDChYJi9i6HjR+J
         +L+HRmDhZgsSiNW91MuMe/Nqi5uRaBAIxBTqknL5q0fRd9m8cC9MbShyVurX4faqetor
         KlWrThKAjCog5/QDKZZoX4QqiYCm6mEv5CvTTntXJ0UtWOwcrMFN9+E0VCrOhrs8PNhb
         K46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iwgwXCkgqhWhsAYcDwBGLHI9mFw90gt72ulhS68U2Tk=;
        b=oKrInjyOrSndaBtdJq28fAjUYrxofHMwgifxnh/aN1N8YXKNGRzNfIDdqeYjONxgf+
         56JCEnrgoMAE9fjZxe11QG117+A1/STOOtvmbor73BZWFXhy5uboPsmL9UkeQdY+XEwr
         YGog89/+YiSTQih4zjG2LnLctMY0FX2A4L+tnPdmYmOr7iv0KGHwqnmgDk+8zokQOYy4
         0yvaSFzHMvoV0KmOs9FZd2qh46Rl42DQoyO8eMLynySbySqolq/h6Xiod5B/vIjw7uT0
         tVbPX3hEk9CQiagWFo+qv4WI94bbM/6IHxIAUs6+D16gb+jCFJ4xRxfcn0RoRiwL463+
         ZjDA==
X-Gm-Message-State: AJIora/NDk+JVxrOVBUYxTeazqCeJreMS9IV9qsi4jMYw2iHHYLXVX8v
        w5oBr8BvEMyapPLH6JP1JkwWVw==
X-Google-Smtp-Source: AGRyM1vG5Bcu+l/FIdi7zPxP8vjkhzHPb/yFlAt0h9EmzNtCM6r+XXga3thU/FLotGxVtQDRs9fYkg==
X-Received: by 2002:a2e:b049:0:b0:25a:89a2:df44 with SMTP id d9-20020a2eb049000000b0025a89a2df44mr4456080ljl.207.1656577066598;
        Thu, 30 Jun 2022 01:17:46 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id p18-20020a2eb992000000b0025bda317bdcsm913623ljp.88.2022.06.30.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:17:44 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v9 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Thu, 30 Jun 2022 11:17:40 +0300
Message-Id: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patchset adds support of a camera clock controller found on
QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configurtion,
the published version is intended to support SM8450 CS SoC.

Changes from v8 to v9:
* removed clock-names property per request from Bjorn,
* corrected a path in the yaml file to the added include file,
* put status property as the last one in the list of properties,
* non-functional changes in the clock provider driver code.

Changes from v7 to v8:
* rebased on top of v5.19-rc2,
* added Stephen's tags,
* improved an example found in added yaml file,
* improved some of the commit messages,
* narrowed down a list of included headers,
* constified .hw.init anonymous structs.

Changes from v6 to v7:
* rebased on top of v5.19-rc1,
* fixed a warning in a usage example found in yaml file.

Changes from v5 to v6:
* rebased on top of linux-next,
* added Rob's tag,
* fixed a topology of power domains around titan_top.

Changes from v4 to v5:
* fixed the same typo in a usage example found in yaml file as in v3
  change.

Changes from v3 to v4:
* fixed a changed path in the yaml file.

Changes from v2 to v3:
* fixed a typo in a usage example found in yaml file,
* renamed dt related files to match the compatible "qcom,sm8450-camcc",
* minor fixes in the driver per review requests from Bjorn,
* added Bjorn's tag to a change of exported symbols namespace.

Changes from v1 to v2:
* updated qcom,camcc-sm8450.yaml according to review comments from Rob,
* changed qcom,camcc-sm8450.h licence to dual one,
* disabled camcc device tree node by default,
* added Stephen's tag,
* rebased the series on top of clk-for-5.18

Vladimir Zapolskiy (7):
  dt-bindings: clock: add QCOM SM8450 camera clock bindings
  arm64: dts: qcom: sm8450: Add description of camera clock controller
  clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
  clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
  clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
  clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
  clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   80 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   16 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2856 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  144 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3268 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

