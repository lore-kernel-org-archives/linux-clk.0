Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D5AC25B47
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 08:49:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbjJYItw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 04:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbjJYIjA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 04:39:00 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38026133
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:38:58 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-773ac11de71so363794585a.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 01:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223137; x=1698827937; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+HrZtoWX4MGej1kjpZeux1yQTbKjE1+8I/SDf43PFI=;
        b=Bq/z0A4i6cXYzFRa/C4Ohea5ucTSdbw42mzdqEd2b3sC+GWDmGAiOCQY7rjbt3OvFI
         Mhw6bRcPNodDrHxfy9xTUOwIyVUJO6JgIPtQL6DwcnZORjtnWDqpYIZl+nDcIg+KMGY4
         tBhePpT2k3qP3qtYZ8Ok2gYKlMUuasjCXoJfzxK2iaNUjLghs0wzB2Js9+uqRH9Ufeji
         eqhjnJLRz7PNSg573xlSWbgI0sgo8UdYBIv8xh08QFgKqJAY0o8/xcLMZdMGutRpgi0S
         V5KOIgbA5jsU2r0mtHoB3NNfqd1TzsqBM7NADFnIN7XpVJcwEhr/2JnFpP8AtSFrLgHU
         /e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223137; x=1698827937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+HrZtoWX4MGej1kjpZeux1yQTbKjE1+8I/SDf43PFI=;
        b=XD5Hb13D/AzuDZfQeqYPyCv6Ara8VRzh9mbFxgHk48IAnT2thrGSoiMItKlH1mnsZl
         S0Qloww3emhKOt398VYO2CJDjCV5ZlMvegVLBxvBaLPjITcmtakD55vVG83QmAlX7d9c
         btVNe+n0EMKS9jWJJasRmemj1VzTx1DuVLYb6PJeSdSRaiePnqe3fsezVgfIDRzQ2z/N
         mRrG1nllnFCh0/lqPsWUFLWvletmjENwMThbqa9ZaYOLbRz3D8Sjnt06NGJPp6j12gSH
         Mvp1Ro/7iFvObKWigbJ0w8aPG3pTRsNWUfEg3vsNFvRX52LpCQv5b0Wf/xqIpfziqxbF
         3CaQ==
X-Gm-Message-State: AOJu0Yxzejd9XCIkUshDf3wY2VZCrECCejDiInDk1BQ4uAMZOMb+0wi9
        0RfkfqFcRoiN5Aa6PT3YQvxi0krIkNU5eaWwo65cMQ==
X-Google-Smtp-Source: AGHT+IFpttfLKc+8yhH0Vs/Ju8O18uR5VvebR6HGULWTGLk7A35/Y9mGhceIgeo2cuprDThVebXDaO9qppJzZ6aqMls=
X-Received: by 2002:a05:620a:2590:b0:775:79d6:9e57 with SMTP id
 x16-20020a05620a259000b0077579d69e57mr14950031qko.61.1698223137246; Wed, 25
 Oct 2023 01:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231025-topic-sm8650-upstream-clocks-v1-0-c89b59594caf@linaro.org>
 <20231025-topic-sm8650-upstream-clocks-v1-7-c89b59594caf@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-clocks-v1-7-c89b59594caf@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 25 Oct 2023 11:38:46 +0300
Message-ID: <CAA8EJppurAdn=sX8YvZ=x+6dq6GHGbE_kp5bVRS69NiYnNGeiw@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: qcom: add the SM8650 TCSR Clock Controller driver
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 25 Oct 2023 at 10:36, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add TCSR Clock Controller support for SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig         |   7 ++
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-sm8650.c | 192 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 200 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
