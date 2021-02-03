Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A18FC433DB
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 14:17:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BAB664F2C
	for <linux-clk@archiver.kernel.org>; Wed,  3 Feb 2021 14:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhBCORm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Feb 2021 09:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbhBCORi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Feb 2021 09:17:38 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0532C0613D6
        for <linux-clk@vger.kernel.org>; Wed,  3 Feb 2021 06:16:57 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id w11so11657722qvz.12
        for <linux-clk@vger.kernel.org>; Wed, 03 Feb 2021 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKx3uJPZmePnlL93mK/U5koaWC3gTC8OGj972WJi/uk=;
        b=u4z21jPbV4qoGn8f7xGMTWbQYMk2F4eU4WQja9xLGyq/qDnEAUdbSOModaoVZlwSu5
         ZvNutHhs0g4YI5Br4K3Na4SuDWxIXAtU0UlPYDg4yAsd3Z6B7uyHcKjbM/NlMXyAcORY
         gk7kKI5RPXYWDxNJp1vLhRxvXBnrATJAokc84xRfkuvdQU1MJnlc+mHrI4LGdDQdwcMa
         ks48k0VHXnqbw3P2JMN4wgUrdSbr4CDqkLygxLToWpGSuAiaIKAsBi8Dr1G/tMU+csXa
         pzybaf6OMGoVaUfXzIsIeJYqjtsVmLB/jR1kstTYT4oatFf8NMnt6Bs0rXHhBgR1AF8Q
         zr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKx3uJPZmePnlL93mK/U5koaWC3gTC8OGj972WJi/uk=;
        b=LFGqQvGpW3OhlJ/Emil36/xk6AzEUG1ZtQaw+2xw3zYad4OPGo2dWazgVS/lHpaEaq
         aoXkwdYPkqrfvOhjznyF75ClkukRIoAF8/ehQFIsUx2fLfgX2Qqj2UVz8VFXW/QACEDX
         C1SreTpLLOMl6185exPBVKohScyANKEC6q2Bg0akWILSVKE/Iep7LhFT9DsX+BvydBVe
         f+NIPq4jm7WzUyoLzpsYBBOwaF++uSQ/kyuFbv0J1UpPHB4Uux12mW0zWrFMp1gUkz4Q
         Pq81SW3mhlrwzNKs+/w+MrlN3YiDv4n8FwF0FaacFgfkDm6JnQtWGNxTjB4RWsppaGdU
         seqQ==
X-Gm-Message-State: AOAM532lYCsYbGgjbwhLJhivoi+zTgBeGZGIhqQghfxyIByEaUWtWtez
        /xUl9ST/BtrhxN8uwiV75oth6zdv/41kIYwofno20Q==
X-Google-Smtp-Source: ABdhPJz3pfdeXW8rEpq6+RJaBTEnbpC6wBz3cIDKfG6hqkQVujxl43VS7Prq3JKhJ5fuLPTnRc+cPNCxxahRPxI5qgA=
X-Received: by 2002:a05:6214:18cb:: with SMTP id cy11mr2645941qvb.61.1612361817238;
 Wed, 03 Feb 2021 06:16:57 -0800 (PST)
MIME-Version: 1.0
References: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210203115456.1072975-1-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 3 Feb 2021 17:16:33 +0300
Message-ID: <CAA8EJpppSpzknWnnL1MiZbmTUhu8_K9cD4Vqv-wA+QdRiWnpfA@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/4] Fixup clocks for venus on sm8250
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Patch 3 should reference 'video_cc_mvs0_clk' rather than
'video_cc_mvs0_div_clk'  in the commit message.

With that fixed all patches are:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On Wed, 3 Feb 2021 at 14:53, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> - Adds some missing indices to the videocc index
> - Adds videocc clock tree hirearchy for msv0
> - Adds a regulator to power the videocc consistent with downstream
>
> Once done we can move on to enabling these clocks in the DTS and switch on
> the venus.
>
> Bryan O'Donoghue (4):
>   dt-bindings: clock: Add missing SM8250 videoc clock indices
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
>   clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
>   clk: qcom: videocc: Add gdsc mmcx-reg supply hook
>
>  drivers/clk/qcom/videocc-sm8250.c             | 39 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,videocc-sm8250.h   |  2 +
>  2 files changed, 41 insertions(+)
>
> --
> 2.29.2
>


-- 
With best wishes
Dmitry
