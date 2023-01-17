Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5DDC54E76
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 18:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjAQSnT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 13:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbjAQScy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 13:32:54 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD47253F92
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 10:04:40 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so25139306wms.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 10:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KBPtb5kB7phRN2HyeU727IaxXRKzBI0qHI+gXLYhw7Y=;
        b=ClpPpXyniScMXOMCRlplFUjOlwCjRSmBW9rMYR/cAmLHnmHaa2ASXhhoYZgW5AMz7D
         7/1/E7MwBpNSPAdz+Ye155/YRdxU1XL9V8955MblAQGUlVaQDiQE1oJki8WsfKbeRgX5
         i7fC3zAKp7KSgy3LzCJLRVcuTSt9kXDIrbO6+aQvd+7boGg00pItttB/7qGWlt6nWUCW
         O4H6RZtoGXg4WaSmkzd47EdA6WKM60SZDu00opIRR/cLXk55aLC416kpQ0jwBtEfVyRW
         4sSJGUSt+zyiHsCPIkmmpn974Oa83ih3eltGA3CrnfItJF+cBhVfbyzPJ66F8IH6Jzd2
         IDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBPtb5kB7phRN2HyeU727IaxXRKzBI0qHI+gXLYhw7Y=;
        b=UyU1iBzJyv3vD90gRz/M2Xot0UFASX0HQP+gEH7/t2OXoaX1jT4FbhUVNgPzr6GGT1
         1f4NqbW/kMrZDlgl9lWm1BNWvYgz0mQOry3H1CTcXz75jc29b4PvkJrg3BuPRACyoiDI
         vzs7AIWbqlcLP/e0wTQybTIZKW5QgVL4Tvv7wITLddGI4I/zOShlVY+443X32pGwnRBx
         e3vABjKEkY18luV/qNgUN0YNZILO3Tj8YznqGFoPnNnaQ1u82KH9kOM76SyLTXpU5sXr
         3jTY/tcFt9lpFLs9SPSDqB8kQ3Um8PBSu5OySvlrFrmS8OTtE7urTXE9Z4kfgR/s18cH
         2zbw==
X-Gm-Message-State: AFqh2kriiw37I/LPySneUInDKKTTLYx9I6JxM4gNiAGJ9GnQH5l7syPs
        LtUe0Cian+jnzKtPFqcMh4w+Vw==
X-Google-Smtp-Source: AMrXdXu3unw8WBLHAeJhgOLo9n3+ap345utf67uMWZmJFzFH8SfgPHxxfhGIk2SYm9ufTb+ARBg4gw==
X-Received: by 2002:a05:600c:3b1e:b0:3cf:497c:c4f5 with SMTP id m30-20020a05600c3b1e00b003cf497cc4f5mr4116868wms.13.1673978679194;
        Tue, 17 Jan 2023 10:04:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:9236:abcb:4905:a64e])
        by smtp.gmail.com with ESMTPSA id bp28-20020a5d5a9c000000b00273cd321a1bsm29356681wrb.107.2023.01.17.10.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:04:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] qcom: sa8775p: add the GCC clock driver for Qualcomm SA8775P platforms
Date:   Tue, 17 Jan 2023 19:04:27 +0100
Message-Id: <20230117180429.305266-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the DT bindings and driver for the GCC clock on the sa8775p platform
from Qualcomm.

v1 -> v2:
- fix examples in DT bindings and make sure they pass tests
- use lowercase letters in hex numbers
- fix the name of DT compatible and headers (gcc-sa8775p -> sa8775p-gcc)
- fix licensing of DT bindings
- fix the regmap's max_register property
- use clk_regmap_phy_mux_ops where applicable
- other minor tweaks and improvements

Bartosz Golaszewski (1):
  dt-bindings: clock: qcom: document the GCC clock on Qualcomm sa8775p

Shazad Hussain (1):
  clk: qcom: add the GCC driver for sa8775p

 .../bindings/clock/qcom,sa8775p-gcc.yaml      |   79 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sa8775p.c                | 4805 +++++++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-gcc.h  |  320 ++
 5 files changed, 5214 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.yaml
 create mode 100644 drivers/clk/qcom/gcc-sa8775p.c
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-gcc.h

-- 
2.37.2

