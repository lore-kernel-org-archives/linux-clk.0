Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC50C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 27 Apr 2022 12:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234980AbiD0M5j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Apr 2022 08:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234805AbiD0M5i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Apr 2022 08:57:38 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E596A10AC
        for <linux-clk@vger.kernel.org>; Wed, 27 Apr 2022 05:54:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g19so3004198lfv.2
        for <linux-clk@vger.kernel.org>; Wed, 27 Apr 2022 05:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqwVCZPmc4mOi+NYnTP0qy4thOKdsBFKwRmb5wY2Y64=;
        b=nb2mYuJus/SBWKqm+xwNcWbLPTPY8OHld/D92DhMZDeDDvXZ1O2qm8P9B2sPE7HjDT
         k5SHg44VprWmmOt+sVgtGU6Mvqtizzsg4DSIsVHcZL9IVKk5tOSDofqu5PBDw9lu0LwA
         C1exm9Ip7hWKEo9MTPlsPSUgZwB7SCxi2RXc6EI9jlHJpxkypBW4+13lBclvGZCwZced
         FO0WN2MofEnZsf6/lK8ffA5xmzxwH2iRFGk6FRzqG8/ej3fhSpIOElB7lXrdrQF/rf1g
         +rEGoG/hnrctD39363ggSuJ/kI4bI0bs9eXqL5U+S069tQjpikEKee23Q6aRMU6hKYrQ
         RFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqwVCZPmc4mOi+NYnTP0qy4thOKdsBFKwRmb5wY2Y64=;
        b=Jo68ymvyIScUhABns66mPQQDSFfSNFrkAmEgcYthJb5AE3kJm6Y37W/QrQHcn7YmgV
         C9D+zrYdKi7PPIqRAGa3Xwo7NqoKcnTWgvWh1RL06Xgk+4Bm0p5p2GQGERwn0vsR5odY
         jXb4EWIHbX6mMBR696hYTmmWIVkB0MAKru1CmknYReg2+a7VXGnpbepP1shWqPjmbVDj
         wvXz5HyqrOHXpyHWIZ0uM8L8VDT5kTBn0WUi6yfIFBM1evwC97yoldDs6/ptDzZQDpt6
         MESFfj5+ku+UNKXC1oIJC645JV7/Edu9XLzljhpqVagg9GUzd+fvtV5qgPiYIZMIVESC
         wa3g==
X-Gm-Message-State: AOAM531fTGIuxPA5Bv2Y0fFpB8wQGhHWiozC20xRrUFD4ya72DygidOj
        rKa22YETG4HRUWn9CJ7anKnjqQ==
X-Google-Smtp-Source: ABdhPJzIgbUxr5NmjM1/E6copsx350dNy6TDDaAQYsEjU2Ck+B9ydWxc5wsxXOyLjTiao6E5dAqaEw==
X-Received: by 2002:ac2:4204:0:b0:464:f034:77a7 with SMTP id y4-20020ac24204000000b00464f03477a7mr19790889lfh.328.1651064065238;
        Wed, 27 Apr 2022 05:54:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r9-20020a2e94c9000000b0024b4c2a1346sm1827445ljh.123.2022.04.27.05.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 05:54:24 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        quic_tdas@quicinc.com
Subject: [PATCH v5 0/3] arm: qcom: qcom-apq8064: add separate device node for tsens
Date:   Wed, 27 Apr 2022 15:54:20 +0300
Message-Id: <20220427125423.3166138-1-dmitry.baryshkov@linaro.org>
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

Changes since v4:
- Added thermal-sensor description to the qcom,gcc-apq8064 schema

Changes since v3:
- Fix a typo qcom,gcc-msm8060 -> qcom,gcc-msm8960 (noted by Krzyshtof)
- Fixed indentation in the example (also noted by Krzyshtof)

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

 .../bindings/clock/qcom,gcc-apq8064.yaml      | 49 +++++++++----------
 arch/arm/boot/dts/qcom-apq8064.dtsi           | 25 +++++++---
 drivers/clk/qcom/gcc-msm8960.c                |  6 ++-
 3 files changed, 44 insertions(+), 36 deletions(-)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
prerequisite-patch-id: b5aad2b1e0db4e6d77d6a2faa2fe95acf274b3c8
prerequisite-patch-id: a0c7dcfc85a1eac4969530b73230f226006d6e1a
prerequisite-patch-id: 0fbf70957a52fa87d038d08f9c599e314c69e7d5
prerequisite-patch-id: d22652b1f0e097692b670a0ed4c3f803875d1c5e
-- 
2.35.1

