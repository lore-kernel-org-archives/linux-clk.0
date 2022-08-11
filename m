Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C710C25B0C
	for <linux-clk@archiver.kernel.org>; Thu, 11 Aug 2022 04:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbiHKE0W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Aug 2022 00:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbiHKE0U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Aug 2022 00:26:20 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A028193EC
        for <linux-clk@vger.kernel.org>; Wed, 10 Aug 2022 21:26:19 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id j5so14390890oih.6
        for <linux-clk@vger.kernel.org>; Wed, 10 Aug 2022 21:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=H1D2I5F6jEY4Yho4Ry80Q/V7w8am8kAH/C1aUroh9io=;
        b=q8DxvR0+uMAaBPlHZlPA5S7nLlH2th+z7nIkuuh8u59GZidpQQW3qi56H+zUMkl4Bi
         3Wr8LJAwi+l61nM+KyUTMM+gTU1c+s2elv6Ba1DZ6olExnsY+7n0o0gPvrNrTaWajpJ4
         ZEbZ8pdev0J1vIFoEWv5hYQiN/hBphBLe3IADnwu4zNe2mGtpL2GjQwV514prWn5Esxy
         he7CXdVgyjfSBl0Cd1BOIC+DO/Hb+O1cArHJeJ5X5a53fJf073zQCz7kNaCQD/eWuf+5
         fNlOeIP84liinkTgYun5gV8DPSnhbnO9g8OaxNU98bobsV+P0VwZzQ55FdBxSQKoS2b0
         A6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=H1D2I5F6jEY4Yho4Ry80Q/V7w8am8kAH/C1aUroh9io=;
        b=nTwShByXFx3RLH5/2XSDE0jUlmyoY5faTQVSaOODLvoNZMcI2lWCS2sALdyJ//FOE8
         3GjFB6jg4uzQc8B5gQhNB+/Uyp9OfAhhf8JCn9AQjLiqJdRJKcOryyxVnrELw66Y2POp
         1c+DqgVATtW31VzSa6A5W4BONC339dV3WQKzWZfnzYQmZxANOnVKp7HfTENg2M/x48hq
         aIM2Wxt8v+9mKh/uyTJCg7/jDE4emDwuu8UPEXTVsSMWrsZ6RiK98pv0kXqzAQ3Vf9Hc
         hSy1UuRHEeSnoJpmErhOJXCK5kPlRzO0fYNwzvXp8ZRjMXCPfKV9EqNj8aCR+eIUaL1h
         FTig==
X-Gm-Message-State: ACgBeo2EQrQR/zQtRxMl99958v2RiDdQeObN+3BI+nnIzlj3WmVP+YHi
        9S6CQH6Zy9S0HQMxIgUDNTWmAA==
X-Google-Smtp-Source: AA6agR5vjFsODD7MmgxqVSNhUlWvgAy0IeZt4SYblC9qgNSbGpfnjRNLN6bgQipCk/Zph+plR9vfbQ==
X-Received: by 2002:a05:6808:d4d:b0:33b:6ae:bd06 with SMTP id w13-20020a0568080d4d00b0033b06aebd06mr2687110oik.183.1660191978945;
        Wed, 10 Aug 2022 21:26:18 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l17-20020a9d7351000000b006370c0e5be0sm1009517otk.48.2022.08.10.21.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 21:26:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Add SC8280XP GPU clock controller
Date:   Wed, 10 Aug 2022 21:28:53 -0700
Message-Id: <20220811042855.3867774-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

What the subject says.

Bjorn Andersson (2):
  dt-bindings: clock: Add Qualcomm SC8280XP GPU binding
  clk: qcom: Add SC8280XP GPU clock controller

 .../devicetree/bindings/clock/qcom,gpucc.yaml |   2 +
 drivers/clk/qcom/Kconfig                      |   8 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/gpucc-sc8280xp.c             | 460 ++++++++++++++++++
 .../dt-bindings/clock/qcom,gpucc-sc8280xp.h   |  35 ++
 5 files changed, 506 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc8280xp.h

-- 
2.35.1

