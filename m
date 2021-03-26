Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD150C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 18:10:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76D9D61A26
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 18:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhCZSJ6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 14:09:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230180AbhCZSJd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Mar 2021 14:09:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 237B261A13;
        Fri, 26 Mar 2021 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616782173;
        bh=oZuNNowA8hJn4kt24Qmg+vwOtPMVCc72tQAlQNlwhek=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VyVyzQFnmwAJ5JuccpSdd3iFn/WWtOCUUzBwObShmf5bM/uWy5qtzHZ2lhGc+Fh+Z
         6Y/ts3SvLVn7vxbDA7MUd/XjyVTC9Ea20jAAEk57jaFzRG9eid53h35xUuaKBO8Hzn
         OJqGaxXEm9Vf9+PjRBLigHtr/bAM+Tshp3zaoHyOpM1LNrA5WAJoVQkUJJCG/bSt3L
         spat86yD+X+kayPiUVA4sJlF7ofjcTUp0UzFhEBfs/kh+uBntifY0msWDpBT8NhUPw
         56FsAytTMg+bv1pKwGC+wuNrrFoyNUtvr+SQyrz7MGpPTpQASAizwvFWg1dHCgrkab
         NKSoi/0UC+Y9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210325185749.27984-1-nsaenz@kernel.org>
References: <20210325185749.27984-1-nsaenz@kernel.org>
Subject: Re: [PATCH] clk: bcm: rpi: Don't register as OF provider if !dev->np
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org, geert@linux-m68k.org,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Fri, 26 Mar 2021 11:09:31 -0700
Message-ID: <161678217156.3012082.17482478610662557764@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nicolas Saenz Julienne (2021-03-25 11:57:48)
> There are two ways clk-raspberrypi might be registered: through
> device-tree or through an explicit platform device registration. The
> latter happens after firmware/raspberrypi's probe, and it's limited to
> RPi3s, which solely use the ARM clock to scale CPU's frequency. That
> clock is matched with cpu0's device thanks to the ARM clock being
> registered as a clkdev.
>=20
> In that scenario, don't register the device as an OF clock provider, as
> it makes no sense and will cause trouble.

What sort of trouble?

>=20
> Fixes: d4b4f1b6b97e ("clk: bcm: rpi: Add DT provider for the clocks")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index f89b9cfc4309..27e85687326f 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -337,10 +337,12 @@ static int raspberrypi_clk_probe(struct platform_de=
vice *pdev)
>         if (ret)
>                 return ret;
> =20
> -       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> -                                         clk_data);
> -       if (ret)
> -               return ret;
> +       if (dev->of_node) {

Can you add a comment to the code indicating the problem this is fixing?
I fear that we'll look back on this later and simply remove this if
condition because it's "redundant". Better to have some code comment so
we don't have to look up git history to figure out that we only call
this when the of node is populated. I'm not sure I understand what goes
wrong though. Won't the absence of dev->of_node mean the provider
doesn't do anything?

> +               ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecel=
l_get,
> +                                                 clk_data);
> +               if (ret)
> +                       return ret;
> +       }
> =20
>         rpi->cpufreq =3D platform_device_register_data(dev, "raspberrypi-=
cpufreq",
>                                                      -1, NULL, 0);
