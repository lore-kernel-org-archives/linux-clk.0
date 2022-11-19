Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E612C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 19 Nov 2022 21:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiKSVjN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Nov 2022 16:39:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiKSVjM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Nov 2022 16:39:12 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F178B1A385;
        Sat, 19 Nov 2022 13:39:11 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id 130so8053787pfu.8;
        Sat, 19 Nov 2022 13:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KI/uaIZ0N9fBDKR3p7hp/D0x83QkWHbMrCesaL5UMNM=;
        b=BsFed5eZw+LHO69lCKjCT1rZZQqvfhqhHZ7bwQ+RusyafOVyBQ7RtalOaLO5GcEuV4
         E6Z6hziRW3N4p3Pzak3YSuxoZZKSQPGzZHF/Dpk3aJCCQ8CuXAx9An1yIbOVqq5ntiqU
         HGaEf7jrJNwiFbrFWZavHLZLoyueeLbk713lrl33xpJwaiJ4IgvRUzg+wkeiz1HKARcy
         Nrz12bvYgw5tl2jiTsFem0puRiwPhQJRc1C7I9ZdgCqLbwDlC5jGEC62P4ftM5PKYLAm
         E36Zm2SLPN6ppwtpP+kow5j1b3SmZShIYro89tZ6NHMsB8H55lxghikVHfj59nhSqrYu
         2LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KI/uaIZ0N9fBDKR3p7hp/D0x83QkWHbMrCesaL5UMNM=;
        b=JJCBbFDmBNOxYBZ/e/YLFGtzWydYlW8LCdIne3+gQW+SOLo2I5qcOw9XWYuT3yK4h0
         rRk/D+37nHCo9+4S5HnrqekCLVYRfxLzBsXnFZY/4XUkqLcFmcusZV08rgubrswLnBBL
         rkCl0J5rwwZhZLxnlkMhKkBmqNpui+mJmnvTGUU5kqIdqgIfNK17TJRXaC6QzhyOJ9RM
         ofMrg6XsYd2a7Iiv40jH5KOPRvb9iwsLuYCZjTkVonGk0+Pyc1oBny7ZAKypPpiu0SjB
         79ZbDtYdaYOjyvebJCOwvWmONUOH+ObJop6tllzBB9+D/tcQ6JAOmqa6cr9xZ/JmYHsH
         AjwA==
X-Gm-Message-State: ANoB5pml1hrkLqxQtGjgTYILdNQ0hp8NG/JKQne8AlIRvCnJ4CIylduy
        8WKgL7yvmL1IvrY6QHXUYpoc+aNV5T5cVdF/FCI=
X-Google-Smtp-Source: AA0mqf7awYUDKXG7wvd8c0eJkPR8Wlh+Iu3FmNtwhKdmdqyS/Vtzmax8pbkbsauiMsFKkV9nViCDhneqpj8JaQwvndg=
X-Received: by 2002:a63:2f46:0:b0:477:4a13:f38e with SMTP id
 v67-20020a632f46000000b004774a13f38emr4171456pgv.131.1668893951380; Sat, 19
 Nov 2022 13:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20220928124108.500369-1-linux@rasmusvillemoes.dk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 19 Nov 2022 18:38:53 -0300
Message-ID: <CAOMZO5BPtEU6VCZXRk5FTHXDad6cegF=+oHTTA0wgjBuoh9-rQ@mail.gmail.com>
Subject: Re: [PATCH] clk: imx8mp: register driver at arch_initcall time
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 28, 2022 at 9:41 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> We have an imx8mp-based board with an external gpio-triggered
> watchdog. Currently, we don't get to handle that in time before it
> resets the board.
>
> The probe of the watchdog device gets deferred because the SOC's GPIO
> controller is not yet ready, and the probe of that in turn gets deferred
> because its clock provider (namely, this driver) is not yet
> ready. Altogether, the watchdog does not get handled until the late
> initcall deferred_probe_initcall has made sure all leftover devices
> have been probed, and that's way too late.
>
> Aside from being necessary for our board, this also reduces total boot
> time because fewer device probes get deferred.
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
> It would probably be reasonable to do the same to the other imx8m* clk
> drivers, but I don't have any such hardware to test on.

Agreed.

> +static void __exit imx8mp_clk_exit(void)
> +{
> +       platform_driver_unregister(&imx8mp_clk_driver);
> +}
> +module_exit(imx8mp_clk_exit);

Isn't module_exit() unnecessary here, since we pass suppress_bind_attrs = true?

With module_exit() removed:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
