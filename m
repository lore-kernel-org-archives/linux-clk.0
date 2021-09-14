Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7901DC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 518606121D
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 22:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbhINWPS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 18:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbhINWPR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Sep 2021 18:15:17 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93C3C061762
        for <linux-clk@vger.kernel.org>; Tue, 14 Sep 2021 15:13:59 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a4so1613845lfg.8
        for <linux-clk@vger.kernel.org>; Tue, 14 Sep 2021 15:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JWsTCdHYGd/aJ+PxtTnWChkbPZ5sbeK96OrviSNN3s8=;
        b=JwI9vP436C/kVkfUnMuUGF+nI4pwVjPPhEoYpHVyjC6EGPiJv+o1dTFRN2BzmBU3V4
         EFFigSIycU81Epm9FYDl8VXTUYBK94Abt6JH3NzRFHzQjqNB8+Xc85rqKExn/7wtwZ9S
         1pepJ65JI72LsWybw/vCvgtEqajrodwo4swId+LSjCBPfV1GdO9k2HaDOnW2jPNMJgYb
         CJLrmqwxBt/mVUwJmbdjcNK5WmsCwEyziri5Oa5TsCtutle5iOXW3uaRUMpZOOxPGC3y
         sFFYKLqsPpl8TFxyjNMvtL+5wHWLOECkG5cAa8mC4zVs9IHEMzq2SVXrkN3AX4PUeZvP
         oXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWsTCdHYGd/aJ+PxtTnWChkbPZ5sbeK96OrviSNN3s8=;
        b=7afeEQl5B0P5BDjG20VjBqtGz4u+YcLO0VsxYLgX32AMdoTA27plsCWKjV6H5LhVC/
         Sa9RpIUYnSjf3U+7LkvocqR3wLnp02j4v2bRlVbjdBelQ81LJKuIpmUHCBt066aeU06m
         fvzrmdTgtGa6D0POMlsCZIpiQrEyuC70xL/Z+A3XV7KgGk5PVp+xAsIYP9tOB6P263tY
         k4GVRFDB+axMsuvxyhLjudqo0x1fnGRkSlnguuRsm87F3Rn5n9cjP3wKv8NpC4XBPfzP
         RGYSxXpfB+wW0UhjWjp2OzgzDImXJSZoOp68jYbM2+iXk6pBIJZ3vdglV9eqiWX56v1f
         HQ/Q==
X-Gm-Message-State: AOAM532qWKkChFi63r4ANB45zeX/zUh2GqRyxIDyWbPFdy8pc6eTvp8T
        KawB/4WwRPQW6/vqzvlIiO0Oz3c/h5Oc0LcIQ5kHkw==
X-Google-Smtp-Source: ABdhPJw++97HufaRBpmc24LoXmsRYCQ4n4TAIcOI/0662lI81pQdxcBwCQcnx6Q2PmqquC39Np2lofu+7pCvVqvvHVE=
X-Received: by 2002:a05:6512:3096:: with SMTP id z22mr14628711lfd.584.1631657638198;
 Tue, 14 Sep 2021 15:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210913192816.1225025-1-robh@kernel.org> <20210913192816.1225025-6-robh@kernel.org>
In-Reply-To: <20210913192816.1225025-6-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Sep 2021 00:13:46 +0200
Message-ID: <CACRpkdaykxaECTH6nY4Z-k0qwxq+-o28O=OUqNR4fDRxD0P0zg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] clk: versatile: clk-icst: Support 'reg' in
 addition to 'vco-offset' for register address
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Sep 13, 2021 at 9:28 PM Rob Herring <robh@kernel.org> wrote:

> The ICST binding now also supports 'reg' in addition to 'vco-offset' for
> the VCO register address. Add support to the driver to get the VCO
> address from 'reg'.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
