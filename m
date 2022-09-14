Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C586ECAAD8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 08:24:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiINIYI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 04:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiINIYF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 04:24:05 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E7061116
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:24:02 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id r20so5092520ljj.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V1YVYSsl5D5EOMmP45EuuB6/EETaN2F4Y3Yv5mQzyP0=;
        b=v4wytsxa48nEgAD91g/pZa596RMNquTq15IEhMx7xp5Q86y6iY/DNPspO8hxsStsMO
         rVeIVf4fsNxkJDdeqwFz/CPf5gVvDPfJKsUHKUoJzBaS7BXlvb14wNvYcQjMVjsRiEKB
         soEnc+muFJQn69YRy8oxblBk0e6E2cfFYp6wU9EGMdbC0A1YWZH5drhyw2WA3IU7lX8E
         5uLq31lNxu1JKyVDYkwYmjWKIGVKuKnu8/lqaHy9qDEzPGWDn7sokhn2DtTgw/VJRH8X
         AslAlzM1JQish00MRTcHJUO6Vezfq6aQIgB0Q/Lf3objanuKxNo+waDhbqR+Y+ScYhiu
         +m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V1YVYSsl5D5EOMmP45EuuB6/EETaN2F4Y3Yv5mQzyP0=;
        b=rq/FtoOfwdQ+fMk3uf/RtNctdINnH02hdtsLg/DXwZXzUOxan7N5TPU101cVXGCV9F
         gwJ9dUb/tO+Q3zVkAsRDlFTbwtHXQ7TMF/qufDhrOfU27ch0oojmbvF9nOj1jUT8N428
         HRvmrG/QRlZ2ohjS38oFhUDcHLMW0apka+Kt8sz7Ue2DLmePBQZdNfF7PXlHK+vYL4z4
         /ZchOlv3dDXQPIhq7S+D/81GhHZhKiw3o+c7YuZDMFverRtbJumD3FjHJCXu4p2dTrSQ
         6Hrh+6QGhc8oxneHT349kasPnJqtQ4YYie7zpCcGQ+QvmNFEJOHJ3EkIxZlfj8s5wud9
         DC4A==
X-Gm-Message-State: ACgBeo0H/5z0asBaUvmyt+Enz8mSFSa4+i25UaLdqa12LKulKS74ZrLb
        tpm/gPIaxoKdKv5huKesoFr8RA==
X-Google-Smtp-Source: AA6agR5rklM6tu/ivEH7rZ+xthwXKKqcvkr4NjOV71oLH8VLbJajXjeCDpCBdloTLPGCpTf6RlEz3g==
X-Received: by 2002:a2e:50b:0:b0:26a:b7ec:59ea with SMTP id 11-20020a2e050b000000b0026ab7ec59eamr10910287ljf.312.1663143840708;
        Wed, 14 Sep 2022 01:24:00 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o10-20020ac25e2a000000b00497a879e552sm2113647lfg.291.2022.09.14.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:24:00 -0700 (PDT)
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
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom-msm8660: fix node names for fixed clocks
Date:   Wed, 14 Sep 2022 10:23:58 +0200
Message-Id: <20220914082358.350971-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Fix node names for three fixed clocks to follow the
> no-underscores-in-name rule. To remain compatible with the drivers
> expecting to find the old clock names, add clock-output-names
> properties.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
