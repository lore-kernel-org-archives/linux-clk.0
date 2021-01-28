Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5E2C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 17:05:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A580964E15
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 17:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhA1RFC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jan 2021 12:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbhA1RDA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jan 2021 12:03:00 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A90AC061788
        for <linux-clk@vger.kernel.org>; Thu, 28 Jan 2021 09:02:19 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id b11so6083036ybj.9
        for <linux-clk@vger.kernel.org>; Thu, 28 Jan 2021 09:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TxfC0LSb+w4Mx5k+ngQX+YNZxCiSH66WcjjhmDzqjHw=;
        b=dprUGeiX80gn4mEgVWVAQCiaSyP+m5HgsKhjQSonal4Ez9hNsuFcoPwDKC4hVeL5ZX
         Ak4k2WMrsKmRlW3eUbu7YtVYAj29ghMGpnYo5ld4mFOhciRN5lhlra2YEW4wrS7vattw
         ZpZoqV4YHJX2ARch0m/+VkekczL00sadSBn9n9lh8x4bzaV7jSX3f1txIq2uigtUo9ku
         C9fkPMxBgZUohNKp05EwcV2L1ZAwdxEWadwy7LVp3rxibUATf6SlL+XPdiF3cDNsSOqM
         mp2Il9FeM9Q+6z3Nu0iY3DpmgilW4kduekuAsEPOteB4q3NH8n0eRgNKSoLb3rt6dQmu
         dtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TxfC0LSb+w4Mx5k+ngQX+YNZxCiSH66WcjjhmDzqjHw=;
        b=kkqTmfmEqQwrIC6TLPh2bBSs1qWSpRxX9NYV53hurlJFsQVWSHEEhR4qOOF73tyjQ+
         Cyq5QID8XI4TcPAVY0ZYi0gnD70Y81n6GhpoDWZjYGkbkWpQfMxT3XNOs+AQX9jp5Nig
         UwUME27Dei1acNxfj3PakEirHfflxrlmJAVj9jLSIGMGiyonik6zefbgz6sKkt+PnsmZ
         ZVA5U+HHXKRw5tOu+T/9ublCXCRD+syJoZbe9nT1rZks6MWny1q2VZH6mjNAaVvmsew+
         bf2gKUPMC8mywflY6rlMSHcuFFjoAFz6UpKjDzkXRPF9cjQxM6W6A0V62SCqwvY/01kU
         qrzg==
X-Gm-Message-State: AOAM532hKQx0kstyBkTDcouDNhgLI9ujQUF9cYW9S+iIZha3EIO8gDaP
        bw2GFVUGViHIRZdpXFokLPJhMUa5LlAwG8+J41G6DQ==
X-Google-Smtp-Source: ABdhPJyJ64ff4ZX4+kB76nIxgR7kFcJYguXJs6b9+CHVRVxs4BiVUGNPcgoSUAlcDDiF4Ql+4jx6gRCwLt5HuRMnAtc=
X-Received: by 2002:a25:718b:: with SMTP id m133mr170374ybc.412.1611853338032;
 Thu, 28 Jan 2021 09:02:18 -0800 (PST)
MIME-Version: 1.0
References: <20210128104446.164269-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210128104446.164269-1-tudor.ambarus@microchip.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 28 Jan 2021 09:01:41 -0800
Message-ID: <CAGETcx9CodHDeqSYM1zQXRi-p_rFUJQgwMtnuWeKvCt_B3dCOw@mail.gmail.com>
Subject: Re: [PATCH] clk: at91: sama5d2: Mark device OF_POPULATED after setup
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        claudiu.beznea@microchip.com, mirq-linux@rere.qmqm.pl,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-clk@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 28, 2021 at 2:45 AM Tudor Ambarus
<tudor.ambarus@microchip.com> wrote:
>
> The sama5d2 requires the clock provider initialized before timers.
> We can't use a platform driver for the sama5d2-pmc driver, as the
> platform_bus_init() is called later on, after time_init().
>
> As fw_devlink considers only devices, it does not know that the
> pmc is ready. Hence probing of devices that depend on it fail:
> probe deferral - supplier f0014000.pmc not ready
>
> Fix this by setting the OF_POPULATED flag for the sama5d2_pmc
> device node after successful setup. This will make
> of_link_to_phandle() ignore the sama5d2_pmc device node as a
> dependency, and consumer devices will be probed again.
>
> Fixes: e590474768f1cc04 ("driver core: Set fw_devlink=on by default")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> I'll be out of office, will check the rest of the at91 SoCs
> at the begining of next week.
>
>  drivers/clk/at91/sama5d2.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index 9a5cbc7cd55a..5eea2b4a63dd 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -367,6 +367,8 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>
>         of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama5d2_pmc);
>
> +       of_node_set_flag(np, OF_POPULATED);
> +
>         return;

Hi Tudor,

Thanks for looking into this.

I already accounted for early clocks like this when I designed
fw_devlink. Each driver shouldn't need to set OF_POPULATED.
drivers/clk/clk.c already does this for you.

I think the problem is that your driver is using
CLK_OF_DECLARE_DRIVER() instead of CLK_OF_DECLARE(). The comments for
CLK_OF_DECLARE_DRIVER() says:
/*
 * Use this macro when you have a driver that requires two initialization
 * routines, one at of_clk_init(), and one at platform device probe
 */

In your case, you are explicitly NOT having a driver bind to this
clock later. So you shouldn't be using CLK_OF_DECLARE() instead.

Thanks,
Saravana
