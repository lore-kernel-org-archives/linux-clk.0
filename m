Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22ACC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jan 2022 15:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234510AbiAXP1k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jan 2022 10:27:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239044AbiAXP1i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Jan 2022 10:27:38 -0500
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF76C061401
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 07:27:38 -0800 (PST)
Received: by mail-vk1-xa2e.google.com with SMTP id 48so7250002vki.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Jan 2022 07:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3HDDkZ4JptQvUueROJyMLPvuWRpma8Lk9Kajk4VoZ7g=;
        b=oCZW1Uf34XcMXjVM7frYNDOAJhTX8eifTi5L9BJqN4uZJ5E5GRaSY8GmkvNuysIg4J
         SSJHF0q7lgcbjS2DUyJtgKeRbw3rM1DckwB99lwNYnoz26GvbKvveQoG9BHnbR3+Fshu
         ktWvS6ywdxY2xQlyr7XUaRaMUSsLlZD0wqdm09DMnbZm6FYs43QzgfIjmVZNxFMKGP3Q
         EvC5Gez0WbuDEMzcKfjFvwURn12duMeyr/bdHehL1SFrzV0dAbqQjy6hi0PBE3w2ywjt
         PnBzGCwAPVaWomYjsmKM+qwYG7hWQBtlDC7spCVHsg8jqpBvccAgSU6xZzuRRr7cM62G
         lkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3HDDkZ4JptQvUueROJyMLPvuWRpma8Lk9Kajk4VoZ7g=;
        b=cY0tEPsJ7qHkk1Wo7St2X9nFuVQkof8Qj2QzRjYVjZFh9X0gFAE9SMDUSezBGySL/e
         MQ48ruk2rib3ODkXKcRbUYw5KF8PlvJY1UNsgnjg/37vbT8J4FHsudmHAIiJc57PiiwS
         oqEJ6vgZRABT6L363jEyMCgZUSYrWO2iKwHbXd+VQu/2ugD3cc6P56lOOT89C3NJZQT/
         /2qbEnomizQVUGFFezSNp0oq3n5dHKnKs2jmgbg4hSsyky9Nuidlj6mjrJ0/jdWUw6CA
         p/m8R0W5+Y/rLulwdXZuykSDnzVsBrHyKJRvfYvZTSwqzlpOfOI9acpCWKWs+E+IWh4k
         BTuA==
X-Gm-Message-State: AOAM530jfenPX+hiJtQ50dg0d9X9U/Jy3d6nc3qhrSC/43skGxzLushU
        BERdESIKKIi/oTDSxztRkcM0Z7d2aZnzjE0utCZTcNT8nyY=
X-Google-Smtp-Source: ABdhPJycPXj58poXbIS7wrV7p/bJJKo5dmP5xCUFrpidft8+LA9/WrCcL9NqzoSpBkz/mtGiO73S/qyVN+j8LB5Wtgk=
X-Received: by 2002:a17:902:b10d:b0:14b:4e8c:4859 with SMTP id
 q13-20020a170902b10d00b0014b4e8c4859mr5060131plr.95.1643038046755; Mon, 24
 Jan 2022 07:27:26 -0800 (PST)
MIME-Version: 1.0
References: <1639763060-24524-1-git-send-email-loic.poulain@linaro.org> <1639763060-24524-2-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1639763060-24524-2-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 24 Jan 2022 16:39:03 +0100
Message-ID: <CAMZdPi_q17UPdU-exVGPLffUwfL2LBxkdV69WOdugeo5nosF8g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] clk: qcom: Add display clock controller driver for QCM2290
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, shawn.guo@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Bjorn,

On Fri, 17 Dec 2021 at 18:32, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Add support for the display clock controller found in QCM2290
> based devices. This clock controller feeds the Multimedia Display
> SubSystem (MDSS).
>
> It's a porting of dispcc-scuba GPL-2.0 driver from CAF msm-4.19 kernel:
> https://source.codeaurora.org/quic/la/kernel/msm-4.19/tree/drivers/clk/qcom/dispcc-scuba.c?h=LE.UM.4.4.1.r3
>
> Global clock name references (parent_names) have been replaced by
> parent_data and parent_hws.
>
> Clocks marked enable_safe_config have their clk_rcg2_ops moved to
> clk_rcg2_shared_ops.
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Any other comments on this series?

Regards,
Loic

> ---
>  v2: Added missing dispcc-qcm2290.h header file
>  v3: - Moved dt-bindings header into dt bindings commit
>      - clk_rcg2_ops to clk_rcg2_shared_ops for enable_safe_config
>        marked clocks.
>  v4: - Removed useless NOCACHE clk flags
>      - Added explicit comment for OPS_PARENT_ENABLE flag
>      - Removed useless headers (clk.h, reset.h)
>      - spark_vco tab as const
>      - removed global .name reference for sleep_clk
>      - removed dispcc_xo_clk as it is always on (enabled in probe)
>      - removed dev_info message on probe success
>      - Kconfig: Select QCM_GCC_2290 for builtin
