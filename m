Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37E7C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 23:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242076AbiF0XbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 19:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240811AbiF0XbK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 19:31:10 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF4F1176
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 16:31:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C34D2B818E4
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 23:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646B0C34115;
        Mon, 27 Jun 2022 23:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656372666;
        bh=u/3x3rFsHl4tLclQPtx2S5zzRqg90KTzidXHVB97Usk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PyQUAb+q6ugWe9Ra3zTAzvOkMlomwf1iY2GOdGO1qFcNKsC2WNXqShusxcavc9mtO
         hxmb95MZNwX+MtmTCfxS1Ro33g0cDjHY4dYD3+m0jCZaobBAciCi1PFAjR5BxqIZ9V
         EI3A9A54MHQYVl3J5HUYa+8oEsmTB9XcqsuVDyAUz45UwzABwJlOB6lVA8EToN2HCO
         9bzQDGwTEcdCyEUQp4RrunbBwya+3AmSfVcQteqdwF3+gwUzswzh2mvKlb+hrf4HwX
         jNUMqUB2baCX03of+zB8uVaX6gXpI/ppqdkfId0EFMa5rkEXqylk4WreCuEEW/d9Ki
         O8ezS29rJdRkg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-5-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-5-maxime@cerno.tech>
Subject: Re: [PATCH v5 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 27 Jun 2022 16:31:04 -0700
User-Agent: alot/0.10
Message-Id: <20220627233106.646B0C34115@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:03)
> In order to support higher HDMI frequencies, users have to set the
> hdmi_enable_4kp60 parameter in their config.txt file.
>=20
> We were detecting this so far by calling clk_round_rate() on the core
> clock with the frequency we're supposed to run at when one of those
> modes is enabled. Whether or not the parameter was enabled could then be
> inferred by the returned rate since the maximum clock rate reported by
> the firmware was one of the side effect of setting that parameter.
>=20
> However, the recent clock rework we did changed what clk_round_rate()
> was returning to always return the minimum allowed, and thus this test
> wasn't reliable anymore.
>=20
> Let's use the new clk_get_max_rate() function to reliably determine the
> maximum rate allowed on that clock and fix the 4k@60Hz output.
>=20
> Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate =
allowed")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 6aadb65eb640..962a1b9b1c4f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2891,7 +2891,7 @@ static int vc4_hdmi_bind(struct device *dev, struct=
 device *master, void *data)
> =20
>         if (variant->max_pixel_clock =3D=3D 600000000) {
>                 struct vc4_dev *vc4 =3D to_vc4_dev(drm);
> -               long max_rate =3D clk_round_rate(vc4->hvs->core_clk, 5500=
00000);
> +               unsigned long max_rate =3D clk_get_max_rate(vc4->hvs->cor=
e_clk);

Ok, so this driver must want the new API.

What is happening here though? The driver is setting 'disable_4kp60' at
bind/probe time based on a clk_round_rate() returning a frequency. That
returned value could change at runtime though based on rate constraints,
or simply because the clk driver decides that the wind is blowing
differently today and thus calling clk_set_rate() with that frequency
will cause the clk to be wildly different than before.

I don't understand how we can decide to disable 4kp60 at probe time. Why
doesn't the driver try to set the rate it wants (or the rate range it
wants) and then if that succeeds it knows 4kp60 is achievable and if not
then it rejects the attempt by userspace to set such a resolution.
