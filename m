Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489DBC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 27 Dec 2022 01:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbiL0Bca (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Dec 2022 20:32:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbiL0Bc3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Dec 2022 20:32:29 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5AB2673
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:27 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id y25so17824940lfa.9
        for <linux-clk@vger.kernel.org>; Mon, 26 Dec 2022 17:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEXLAvh/0qpSDc3bNh+/vKGT8NSfGyUdyOpGl38+5BM=;
        b=nqJh613j482ufkCQq7hCTDH6YVjmwwailU8xGsIC7pDv8TM//7FaKM2QkVDxYgvJob
         wbs/iKHeSem21XXd8rXeAamNPKzMtLmpVyjdZkKg14ctdnYD+DMJWVYPTZmTbqY0KiQA
         caKdeKCYUiHNnPyL4dmfsDxZqH+vPcwDwVc+oAAc54Qg4SDZAmMVMKRFcuy/4EDyFV5m
         K5JdERMlYIu7VmjE0Jxi7ALDDI5L1WAaTgrjFM/P12/nAdlm941riEmhfFCFxsQvB4Ix
         ssboKe6YSnIB9LnNtLOhrMuq92P3Y3nffa/erE5PWsiv6AWv1aEgTUyBoXqEM5DQ6M/A
         1khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEXLAvh/0qpSDc3bNh+/vKGT8NSfGyUdyOpGl38+5BM=;
        b=ZgvB40ZNO9V4cqfa4j4mFGjM2JAwPSprADgKsycaPmJhhNJ3ewslYMnq1REsGj3zZ4
         JaHrXkzGWj2uBxyITt38HhRFqhFJqJhvNVIkYmAKlcPhRhDl9bvNhmzc51uW5kVOK2Cb
         65rA1RLZb6QL47vE6jUYokxQnaDYRIIimOIOiLzsv/fl8litrliySz8Zu3tGjDZTBt5Z
         rVcYsNWEgeqa2Jl0NvkmOsVyU2jWmjVKBccnZwLEgmjOzkXEJU6qfidZXAgRlsjGPhJS
         6ZhERftFABcCR86IGQwRdDGONBM9YxjWcmyzOv1A8twyl5mKAIFN2F0KvIhRn3E9122y
         Ia7g==
X-Gm-Message-State: AFqh2kouxzGr/KOa6Yr69bx7rpxu6ODtjO2fevbngYMQ2u5gs0PkcfYF
        +7ON8RxWKmxAUg2/8fKhonu9hw==
X-Google-Smtp-Source: AMrXdXvNDv7yze88ht/iIQP82iCX/8YgN/uCLLwCz1QpyL0ohJ4rN1/1W8zxAFEqA9L+lvJ7K3Km6A==
X-Received: by 2002:a19:f514:0:b0:4b5:61e8:8934 with SMTP id j20-20020a19f514000000b004b561e88934mr5013779lfb.64.1672104746321;
        Mon, 26 Dec 2022 17:32:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a2e87c6000000b0027fbb12aa53sm674752ljj.20.2022.12.26.17.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:32:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC PATCH 00/12] clock: qcom: apq8084: convert to parent_data/_hws
Date:   Tue, 27 Dec 2022 03:32:13 +0200
Message-Id: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework apq8084 gcc and mmcc drivers to use parent_data and parent_hws
instead of parent_names. The series is sent as an RFC, since some of the
parents are not fully clear to me.

Dmitry Baryshkov (12):
  dt-bindings: clock: qcom,gcc-apq8084: define clocks/clock-names
  dt-bindings: clock: qcom,gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
  dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
  clk: qcom: gcc-apq8084: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: gcc-apq8084: move PLL clocks up
  clk: qcom: gcc-apq8084: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-apq8084: add GCC_MMSS_GPLL0_CLK_SRC
  clk: qcom: mmcc-apq8084: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: mmcc-apq8084: move clock parent tables down
  clk: qcom: mmcc-apq8084: remove spdm clocks
  clk: qcom: mmcc-apq8084: use parent_hws/_data instead of parent_names
  ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device

 .../bindings/clock/qcom,gcc-apq8084.yaml      |   43 +
 .../devicetree/bindings/clock/qcom,mmcc.yaml  |   40 +
 arch/arm/boot/dts/qcom-apq8084.dtsi           |   18 +
 drivers/clk/qcom/gcc-apq8084.c                | 1024 +++++++-------
 drivers/clk/qcom/mmcc-apq8084.c               | 1189 +++++++----------
 include/dt-bindings/clock/qcom,gcc-apq8084.h  |    1 +
 6 files changed, 1095 insertions(+), 1220 deletions(-)

-- 
2.35.1

