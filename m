Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8536ECAAD3
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 08:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiINISW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 04:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiINISU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 04:18:20 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBDC54654
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:18:19 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a3so11954630lfk.9
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cqlKYYIAKLvsbLj53oR9k582UP5q4RYbtnJSev6cErM=;
        b=Ui29HLS6JX+VL10Nk/QmkazWJs5eqmCGy+EBD5rEqHVWeVDY3jR9jnyTTuenZuP2gN
         FfPaJZMuM7YJ1D0xETS6nq8V/OY9q1tQplruaQC+VqZALHUq9Wm6IUFzNH6lmCcBBMW5
         zj7Diql+6Qg5vdW1ZlxOm5ult7ZN/0TK+kJUskBpshhHyft8pRA6qHqMqGKkrbiXdMDv
         mwoMwHbtjmmwQOWEE8BKiW1rVRGGup1odxYpRa2dRAHrhLmIPCErDuRQjaCOOwGPoLMF
         GddEz6AWWuFqrgMsiJhvNbRul3sp8Pv6YYliW+VOr4jIOGbg9uqvRHF5QROpDJLYtjOO
         zIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cqlKYYIAKLvsbLj53oR9k582UP5q4RYbtnJSev6cErM=;
        b=v0RmX6L24p/x3VTm4cMu9zVuyFVkz32URzxggPhDf56S131fYHejgj+kirCk99AxKJ
         nBZ78Y5CEf/Xa28P6/VyJJxwfN/9e73lfsg44fUoZOlH8jbaLACzT4RCWMDrCYSz4HPv
         YcUPqncNKjfd6RqSyLV/6RUY+Z8LRWniWHA1L7axRYFn+YQxsnYxO2jf5QPor2GsOenq
         skfhwp5OUXRSSC7vs+KQKthyd8TFadpUctIj09dqzfvILE4icgAtQT7CnHgvgqTb+ZJ4
         Zj1lFEgzDZd7miV7JMEUeOz951iBV7tNn/W+e/b0dLqKNruIyd/vkcGwWq0/q0/Yjk+c
         fPNA==
X-Gm-Message-State: ACgBeo314wYCrHTO2Tul1CNQ8Q3x8TX2elKm959jKlfY33cru3ons4F6
        fKFEjejIM07KUQBaNGyVy5k84A==
X-Google-Smtp-Source: AA6agR6P7OpDqTPgN/zl2efEUWG/+XDiPW89d9J9OrHDj0WdFOiF+xS/Sp/rMXTZe8SY7JSdBDn1XQ==
X-Received: by 2002:ac2:4c4b:0:b0:499:3234:64fd with SMTP id o11-20020ac24c4b000000b00499323464fdmr7562363lfk.190.1663143497876;
        Wed, 14 Sep 2022 01:18:17 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id n21-20020a05651203f500b004972b0bb426sm2267909lfq.257.2022.09.14.01.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:18:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] clk: qcom: gcc-msm8660: use parent_hws/_data instead of parent_names
Date:   Wed, 14 Sep 2022 10:18:13 +0200
Message-Id: <20220914081813.350628-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-4-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
