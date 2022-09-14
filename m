Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB38ECAAD8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 08:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiINIPO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Sep 2022 04:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiINIPB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 04:15:01 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B621715FC8
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:15:00 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id h3so8864895lja.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Sep 2022 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8RRCOdQnpmtutEqtQvPMLNpTzK51CTB0ru4gSDKO/Us=;
        b=jnrXEJwBplft7oAfUxVnfOBe1djOFZrTwOKzU7CTnT9o4juLeF7MrfO8W8TOXELwZa
         t3oveUNDzKjCySsIPgSr/qMbn20K5iSj/H3MsAHQQC2mEqrWHU0Crb1pRdDyW/zeTx37
         96lejqHoMC2NHYhMMwBBHX8y6PgOAEEcUHAn6qVBLS2Au+2QwpF/xr9otPzidCSKSIcL
         YTIw38e4jpwiQtjFlTEwHKwXyfFf2vZn6hjRT5pwnlWRshPNucreya0ab1id2a5pZ2Ns
         GYFs6B37gXIfWp6NrH6q+0mx8W50LLhcAxkTZSgwhFyur3X/vLVwRvHR7OMhMenoqLHX
         vbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8RRCOdQnpmtutEqtQvPMLNpTzK51CTB0ru4gSDKO/Us=;
        b=kDQpCXDzKvMe5X2CGiFiyU+W+ib1HFk6+URh2K2CiAWFpKwvKjGkrd4cvnMZQTSurc
         oT929+eK54+toSEAFBtVeDDY6TkWmoc8eE/wA9x0/SnAnxW6irkg5llPAihJuu9sj2D7
         keyqb3heWhZTz1/96DWv7RugviNFBZXdWHqVxkrOCjm3qokY3Y7BPvGiJ1aFHH0VOYuS
         9xEYsQf78Ts9J9gah7HDRIgv0WZetCD9Yo5gw3G6zXLtgHaONExyhQwsUly9cqm+cZ2o
         Kf3oCU2DSGuOY+dZOkd8cBC+EexgSm4g4NeYySu5qxheHTLHWI0TCjbhD82C30ksgKki
         JJuQ==
X-Gm-Message-State: ACgBeo38mQETEL6OLEO+2G6vqUPzR7SCa4erS0IpR9RqXLJann3MArvE
        tfj6p/kDyx1+fSXwMztUZ7jjFg==
X-Google-Smtp-Source: AA6agR7O0xXmBUyN6fGuo0VjLxLTdeBiYX55+Dg0mviXsfPe9YIpYWX6avBhKAr/0quudkM0E9qY6A==
X-Received: by 2002:a2e:904b:0:b0:26c:fbe:ef40 with SMTP id n11-20020a2e904b000000b0026c0fbeef40mr3268873ljg.219.1663143299004;
        Wed, 14 Sep 2022 01:14:59 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id 2-20020a2e0902000000b0026ad753448fsm2324671ljj.85.2022.09.14.01.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:14:58 -0700 (PDT)
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
Subject: Re: [PATCH v2 2/5] clk: qcom: gcc-msm8660: use ARRAY_SIZE instead of specifying num_parents
Date:   Wed, 14 Sep 2022 10:14:54 +0200
Message-Id: <20220914081454.350428-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-3-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
