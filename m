Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA79ECAAD3
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 08:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiINIVR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 04:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiINIVP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 04:21:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA49BB854
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:21:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q21so24047787lfo.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HPOc2r2Mv0iLL9j0PTNSIeCrmzZgG3Oinx57Kh7zhpo=;
        b=nnHRkeL3hOTdYU4DZmToXZGXxw6fXLVX0nccWGidAhFYIDbMG3HcrehWL3g+UrwLy7
         6uu+oT/t6UM3M7HpY95R1leTNPcYYbNq2Zeu+xhKViBa210aAmCQhp7hAozEyS4c3HKC
         8ko2jaBkwAQ9uyb60Ez3b0hTdOwfKClafuVL9unxc5CIlaKCRzZkM0yr7D+I1KwqwUgV
         1w9Dxe300q570rn7HoY4eU9cMla5ar1ubU7cflmTUYJbPv14hg0LpXnjNE2WYTsWq09v
         QCG2ZUk99ySDWRXt8bm8C7fT9nXrExhBZ7M8Nf+pX9r9mYe7CBwK0+fnrvMo+XRX9ldz
         xirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HPOc2r2Mv0iLL9j0PTNSIeCrmzZgG3Oinx57Kh7zhpo=;
        b=BcN3K0hDvJMJSJ/OSDxGbwhltpBiOiayWzvBmoyg/kH0IUkrgQZHhdh0NBKhAbQQWM
         8mFORQDrvVKju/sxNNjPWlrkeHQ/k03GAYN1pvWN3QTteT3Y8KMTGE0MKIf6f3J18G7f
         u3+h7tq4JYZd3znv4Ryz585DRiwk/2amRcX7+UdY69K5lpGhuFK24SXMCXEHODDuBpt6
         eQr0EL3ekXTuGNhJ2V25VcH282XEfLz3srMvBIfMH1bsoxgonhmVENxNdFdRkUN2DEJN
         Ta9t9NOyomAbZTXxciFkAADTmXCC/qhu9+9ejgL/tqdLgNE3GKDOiOZc5xUNbUlVCOB+
         /f8g==
X-Gm-Message-State: ACgBeo22TkIrLB+/vXV+qNysFE2tQAh+Y8fDgGvmSzkScfRaBffnMCP1
        b+obxnErXsjClC5S1cPGCvfc2g==
X-Google-Smtp-Source: AA6agR6SeoZ+/gpeQWg206vhajN6dCAqsepzi40f7Xpfh3rG+8q5rqyQ2wzg5KGyWwFwSXnxZ0VpTQ==
X-Received: by 2002:a05:6512:903:b0:494:8355:baef with SMTP id e3-20020a056512090300b004948355baefmr11164218lft.180.1663143672229;
        Wed, 14 Sep 2022 01:21:12 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id d12-20020ac244cc000000b004979db5aa5bsm2077666lfm.223.2022.09.14.01.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:21:11 -0700 (PDT)
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
Subject: Re: [PATCH v2 4/5] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
Date:   Wed, 14 Sep 2022 10:21:09 +0200
Message-Id: <20220914082109.350834-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-5-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Add pxo/cxo clocks to the GCC device tree node.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Oh there is that patch, very nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
