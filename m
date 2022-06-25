Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2190C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 22:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233609AbiFYWzN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 25 Jun 2022 18:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbiFYWzL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Jun 2022 18:55:11 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F67613F51
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 15:55:10 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-318889e6a2cso54645847b3.1
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kza4iCK5n/6nRyHCyuCBCP2aYiHxgKwrMFt8Ta+E1+Q=;
        b=Hfao2+W8P5pwO/BzpJtGXjHcwCjNIc7/ZNWwt11izHKVG9C6jwO3AoW8jTr4tTHzli
         tn9Qe5yWYvUYNxY34ERCSWFvx9n43A8RF0zd20ldJFRHMBaBiRCekMfk3UzVz5US3UOw
         kQsqkWbypY1R6qiMC0SVHAT9W7iweTYYdO8s0SPv0gIBMX+DnQUteIPOZ+t9mJkiWXEt
         HqBD6corLFas0HIKxAal7EeL2jmxp+vFkLstQr4yJkUzimjqPNhRGWKyesmczvvZqNUs
         ukqBHDQKM6pEPezXQIsTv/jLuElgDfKMe/tiz/2b4QwQgmWLBAqkAFvhxsjXB08zVcex
         BMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kza4iCK5n/6nRyHCyuCBCP2aYiHxgKwrMFt8Ta+E1+Q=;
        b=IDL/keiDYLo29Sb+Kt79eXPUjWaOYPcJ6ulsQl2FLdtpKAjY/3w38TDnNZY3+XYRDJ
         5Wl8ikiYCIaqYzmXSe3WdNS0yTV7v9Xo5KrHPrlSrNn3vwrUCMlE93UUaenM68DfNl/L
         3L3iZNKxmoKWDuSGwOViEA5xQfLAiYXfT19iCwORBw+oavCFe56bLrYxIxUGGcyP4UJr
         eqnSJKmlBzOhwoAK6uznwjejk7MKDgf0nOdcYi1Olm4eI9S91KMmKcrBsKiaMYZW3nTj
         +YpqI4Yl20i4ZP81aCeCoWS6UCLUIeK7P9fr09fYWnyodY4qpZmclUzt7VNWl4j+nHg1
         dhgA==
X-Gm-Message-State: AJIora8l5WzEe731nBjuolWh+RQScW/ocLVYOVsrr/QDJb0wM2HsRgcY
        ewnTk4N2XZt9+9NBuM7DbilvPV0gA4ISosUgqeHZag==
X-Google-Smtp-Source: AGRyM1tE0n1MLKqKamVo/6nJvSZ22T0wylCIz0/meNPRZjScyYQitzswvzWUOSVM62tJu43fYwWWH90cXtEEGEhMg6w=
X-Received: by 2002:a81:71c6:0:b0:318:38d5:37f3 with SMTP id
 m189-20020a8171c6000000b0031838d537f3mr6907650ywc.268.1656197709368; Sat, 25
 Jun 2022 15:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220612145955.385787-1-nikita@trvn.ru> <20220612145955.385787-4-nikita@trvn.ru>
In-Reply-To: <20220612145955.385787-4-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 26 Jun 2022 00:54:58 +0200
Message-ID: <CACRpkdZN14UMM+CJszPXr4x72ngN2cHjTXnqwu3pbjNfOMz5BQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: msm8916: Allow CAMSS GP clocks to
 be muxed
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org, tdas@codeaurora.org,
        joonwoop@codeaurora.org, svarbanov@mm-sol.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jun 12, 2022 at 5:00 PM Nikita Travkin <nikita@trvn.ru> wrote:

> GPIO 31, 32 can be muxed to GCC_CAMSS_GP(1,2)_CLK respectively but the
> function was never assigned to the pingroup (even though the function
> exists already).
>
> Add this mode to the related pins.
>
> Fixes: 5373a2c5abb6 ("pinctrl: qcom: Add msm8916 pinctrl driver")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

This patch 3/4 applied to the pinctrl tree so you have one less thing
to iterate (and one less person to involve).

Yours,
Linus Walleij
