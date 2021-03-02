Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28405C433DB
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:25:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC1F964E86
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352808AbhCCEP7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Mar 2021 23:15:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:37284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2361094AbhCBXTk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Mar 2021 18:19:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0067A64F2C;
        Tue,  2 Mar 2021 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614727140;
        bh=Anexr7Llvf84ZS8OZ4LRFE0gk0oQZ9aE+DtC8CM24i4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qvX9L6IZS8mnwkSyzhftMe254C7ycVXPjr3n6DJ66RsT63OCU3PnVvJ3tU7Nj45rc
         A30zpHx6jvS+avlnyrdUEz774gV+7BAb2fx3C6SG96A8YAbnCDapsW74UzgpqJrwJt
         9+xXKQozeJ9QWtdUMiQqujf1aU+mRZuql5akKKur2Qmx/iiF8SkidhRdakDMt3AkIQ
         7BWRY/eKKmOGRZHWaept6iECYJXfIMLz2qf2G7mSoXHlpYkAxDSMMN3GwPkYcnCvV6
         J8VH1q6BJ6TNKPO+SaH5PvUSKiuky9DCIUmr4tCma4vlWO++53srvijHAAJ4/QQKky
         DiA1OwBxzsBsQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210225155909.1853812-2-maxime@cerno.tech>
References: <20210225155909.1853812-1-maxime@cerno.tech> <20210225155909.1853812-2-maxime@cerno.tech>
Subject: Re: [PATCH 1/8] clk: Add range accessors
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Date:   Tue, 02 Mar 2021 15:18:58 -0800
Message-ID: <161472713858.1478170.9594904338107431350@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-02-25 07:59:02)
> Some devices might need to access the current available range of a clock
> to discover their capabilities. Let's add those accessors.

This needs more than two sentences to describe what's required.

>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
>  include/linux/clk.h | 16 ++++++++++++++++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8c1d04db990d..b7307d4f090d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2407,6 +2407,36 @@ int clk_set_max_rate(struct clk *clk, unsigned lon=
g rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> =20
> +long clk_get_min_rate(struct clk *clk)

I need to read the rest of the patches but I don't see the justification
for this sort of API vs. having the consumer constrain the clk frequency
that it wants. Is the code that's setting the min/max constraints not
the same as the code that's calling this API? Would an OPP table better
serve this so the device knows what frequencies are valid?s Please
provide the use case/justification in the commit text.

Why two functions instead of one function to get both min and max?

> +{
> +       unsigned long min_rate, max_rate;
> +
> +       if (!clk)
> +               return 0;
> +
> +       clk_prepare_lock();

Please add a comment indicating why we grab the lock. Yes
clk_core_get_boundaries() has a lock held assertion, but I don't know
why we care about the lock here besides that we don't want the consumers
to change while we calculate the boundaries as it may be some inaccurate
number.

> +       clk_core_get_boundaries(clk->core, &min_rate, &max_rate);
> +       clk_prepare_unlock();
> +
> +       return min_rate;
> +}
> +EXPORT_SYMBOL_GPL(clk_get_min_rate);
> +
> +long clk_get_max_rate(struct clk *clk)
> +{
> +       unsigned long min_rate, max_rate;
> +
> +       if (!clk)
> +               return 0;

ULONG_MAX?

> +
> +       clk_prepare_lock();
> +       clk_core_get_boundaries(clk->core, &min_rate, &max_rate);
> +       clk_prepare_unlock();
> +
> +       return max_rate;
> +}
> +EXPORT_SYMBOL_GPL(clk_get_max_rate);
> +
>  /**
>   * clk_get_parent - return the parent of a clk
>   * @clk: the clk whose parent gets returned
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 31ff1bf1b79f..6f0c00ddf3ac 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -709,6 +709,22 @@ int clk_set_min_rate(struct clk *clk, unsigned long =
rate);
>   */
>  int clk_set_max_rate(struct clk *clk, unsigned long rate);
> =20
> +/**
> + * clk_get_min_rate - get the minimum clock rate for a clock source
> + * @clk: clock source
> +  *
> + * Returns the minimum rate or negative errno.

Hmm?

> + */
> +long clk_get_min_rate(struct clk *clk);

Why long instead of unsigned long? Error values don't seem to be
returned.

> +
> +/**
> + * clk_get_max_rate - get the maximum clock rate for a clock source
> + * @clk: clock source
> +  *
> + * Returns the maximum rate or negative errno.
> + */
> +long clk_get_max_rate(struct clk *clk);
> +
>  /**
>   * clk_set_parent - set the parent clock source for this clock
>   * @clk: clock source
> --
