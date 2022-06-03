Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DFDC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jun 2022 08:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242675AbiFCIAf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbiFCIAe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 04:00:34 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7340B35DCC
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 01:00:32 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id m25so4339751lji.11
        for <linux-clk@vger.kernel.org>; Fri, 03 Jun 2022 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrvGGdTixNtHqZKbOYhe2mvn4ahNb6KY/VMia2Pab18=;
        b=loatCcjfMy7QKanwzr7GedUfJt9jEKeeIOhv+ylp7vFZM6yhMnocRI8wi8e0al3jJ0
         TheIEChZviLS/tO+zzjhKQ6yvO5XsWY8o/+oNrHGHIpVkHG1paoUbQILXEdTxdgFkCrk
         xCpLKkHsMlT5JOjHgmOzmvwy0ek1h22+mNBaLqeW0Is/BXM5TJlgfF6ht+wv0I24W1Qy
         emptBGYbQY/+PPY28O1iNkROYdVP9JTyi4QlVEYzvQE6QEfV07tGpjniHF4cKJupzbCy
         wG8L3Sm3G+ayrij4zQxIa9ieqCRE0SdRUucWUWl13ckYlY0wbpvwKHYqNhd0969Ybdnv
         YbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jrvGGdTixNtHqZKbOYhe2mvn4ahNb6KY/VMia2Pab18=;
        b=AbjnimaBpQlpV2rZ9QlLZLJ/r4fHu67nzrbiv92ZcHWYGDE6+pEQVAtVJrbA+jUEU0
         2FLZCZ1tWXmtPs52YN2/YZ+75ccaPTmlAEBY1y4Ky1HhEFQocQj48N5kLO4+H7wkwhyG
         N4DX8pw3prx4sVfXCXlVAQTB9nfBtsqm1wyLyLdHMx7lbS6g9tVXefOnqMx1PHpEoT9R
         ia5YHz220NzwcO9EnC7+cBc5cw3N5y27TaNj9T7FMDchm41nuJD3D+NiaiEd9bZzFPur
         zwUeF58Hw4ssHQXgeLazhkD0IwfRbiCZ0LH2cTKeSd4w4nl7GOVaz0ByF1eOTSmFZc8Z
         waZQ==
X-Gm-Message-State: AOAM531WDxuFOTMI97h0VFyDTe/qJgMwGP4BD7hdl3CAraDdX/s3LeR9
        Lu6hsN3JeXRkvFZy54hlFk7IOQ==
X-Google-Smtp-Source: ABdhPJzCHzolNrS18FB+PHhzFrcPQ66j9Yf7aK5+y9+0Viwj/6TelSvj7QMtjERQmN9kRmO0Ic98Dg==
X-Received: by 2002:a2e:81c1:0:b0:24b:f44:3970 with SMTP id s1-20020a2e81c1000000b0024b0f443970mr44204367ljg.97.1654243230728;
        Fri, 03 Jun 2022 01:00:30 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id l13-20020a2e868d000000b0025582d66aebsm50356lji.70.2022.06.03.01.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:00:30 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v6 0/7] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Fri,  3 Jun 2022 11:00:17 +0300
Message-Id: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
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

 .../bindings/clock/qcom,sm8450-camcc.yaml     |   89 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   20 +
 drivers/clk/qcom/Kconfig                      |    7 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8450.c               | 2866 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,sm8450-camcc.h |  159 +
 8 files changed, 3292 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-camcc.h

-- 
2.33.0

