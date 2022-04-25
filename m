Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E577C43217
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 22:21:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234616AbiDYWYl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 18:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343516AbiDYVa7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 17:30:59 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85565220CE
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 14:27:54 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id k12so4140119lfr.9
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3gVY44DVF1y7zdefajo6u3CKe3aVY/euE49UOOawFzk=;
        b=jRmo0SpHDBz5apKEalXqAVnP3JNXwC7+7qia8GGi4s29oRf4tpppZx81UJ8xpalkXa
         99kv5SA9q5apsKoqs4Ay7wP6B+uw6LNJq2k0rmVYxQfxkUDQVmNBVJpwuzXvtNCcC7MI
         zl3+zKJECuuTRqFvE/xgGgAWjvbQCJgmaOUICvE0xiaf4yzSU8w1tWQlOVCla7PU3bv8
         g++aykqaJ4RkMeQ95A0PR2yEg4ZefxW9tOtjQbumouvfrWRuin9M8eMCzQRnxRQWYaq1
         c4e79A9dLJBuOyyv2WasqlE6csEzFV9i/BDZfS8KWu+O8xLJn2aeSLulTZyrE86QnMil
         Ouog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3gVY44DVF1y7zdefajo6u3CKe3aVY/euE49UOOawFzk=;
        b=4hdsBTA/q6L7FEtY/qWM4GYR5luoDOWjlAj5mDMLSZ6oRjq41l+NotN6v5F61MnTre
         S70V+4QmFim6Y4PUW4P4TOdy4Ka9aN1vhEti18EvBv5ghn2Dp8Ae1Q/6PF8Axjfy0bIH
         Y7r8Jk73MD0QwlJCvRV+1RFYn+iCp6lV0Y9VbdoP27YS6zx+eisG1pwe+DdXImPgllL6
         i59xN3MbBrjcR6P0ZvdlB3ZlajRRTzpjCfs3/rtVGrBkgXQM+5m/dlzmDEvVk4raHXML
         YOQ61uav75p1zdaoAlJ31Z8OI8gKOY3RfWBzoGI+uQ9QiIjv/b4GQxif9QbQFs3qCKG6
         Qlqw==
X-Gm-Message-State: AOAM533T2vnWviwHXwqZTdsu5GgEhgt3cnw7294ReeyFBW78OCDu67P0
        tmSHhkcH8nDeOMwpNfsbUv+DWw==
X-Google-Smtp-Source: ABdhPJz7e+TOf2sNiJDfS84im2PT7UAjBiL9ICoMFGaLk1Fe7kPvyMqdqdXDDus3YzQZEvT/mM0O2A==
X-Received: by 2002:ac2:4e0c:0:b0:472:5d1:ce49 with SMTP id e12-20020ac24e0c000000b0047205d1ce49mr5340928lfr.602.1650922072862;
        Mon, 25 Apr 2022 14:27:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l13-20020a19494d000000b0046ba0e38750sm1533314lfj.3.2022.04.25.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:27:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 0/3] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Tue, 26 Apr 2022 00:27:47 +0300
Message-Id: <20220425212750.2749135-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens device. Instantiate
the device using DT node instead. This makes the APQ8064 follow the
IPQ8064 device tree schema (which is also closer to the way tsens
devices are described on newer Qualcomm platforms).

Compatibility with the previous devices trees is kept intact.

Changes since v2:
- Remove patches merged by Daniel
- Rephrase commit messages to emphasize that these changes make apq8064
  follow ipq8064

Changes since v1:
- populate child devices in gcc-msm8960
- add syscon to the gcc device tree node

Dmitry Baryshkov (3):
  clk: qcom: gcc-msm8960: create tsens device if there are no child
    nodes
  arm: dts: qcom-apq8064: create tsens device node
  dt-bindings: clock: qcom,gcc-apq8064: split tsens to the child node

 .../bindings/clock/qcom,gcc-apq8064.yaml      | 45 +++++++------------
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 25 +++++++----
 drivers/clk/qcom/gcc-msm8960.c                |  6 ++-
 3 files changed, 39 insertions(+), 37 deletions(-)

-- 
2.35.1

