Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0336C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 22:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjBUWu2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 17:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjBUWu1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 17:50:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697ED2ED74;
        Tue, 21 Feb 2023 14:50:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B76A5B80F01;
        Tue, 21 Feb 2023 22:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F856C433EF;
        Tue, 21 Feb 2023 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677019822;
        bh=IffyvW5Atm7oajpsNnP6gCiCgyMk3+5BS2IJKL3o0MA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AsQX+GUgyy7zRxcMuAfCdV8miYVviuAgxpZ2zzQ2eWm+uSB/a+b6K+2riRB2NoPqU
         fY1TzpdSHX4PwzWioynKgI6bUzD68K95To239UJcR/Bfp2frBiu5aEUEjG9rp2kc+I
         OeTKnTnxy3MQI2WpmT6PvlMP0vmWmltP+AqHT90Oy5zVUnI+WOsUPHd21LXI6dib6F
         FZ0fFhAa27uB3Dp+fMPjiPyvt2ZloPfli4fdnsAjpvjodhU+Tmtw5ksjJjpjk1XxKl
         snMK30wXygF04U8XaCY7Dl+YkuhfLw2lC7MgPy54Ry2SsAgQomE9EsqXFZ2PXCgVL7
         jnyasCashMzkg==
Message-ID: <1e05156120fdfd79ed267f44fe7f3491.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230222215834.3507-1-zeming@nfschina.com>
References: <20230222215834.3507-1-zeming@nfschina.com>
Subject: Re: [PATCH] zynq: clkc: Add kmalloc allocation flag
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>
To:     Li zeming <zeming@nfschina.com>, michal.simek@xilinx.com,
        mturquette@baylibre.com
Date:   Tue, 21 Feb 2023 14:50:20 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Li zeming (2023-02-22 13:58:34)
> The kmalloc could crash if allocation fails. Add the __GFP_NOFAIL flag
> to ensure that allocation succeeds every time.
>=20
> Signed-off-by: Li zeming <zeming@nfschina.com>
> ---
>  drivers/clk/zynq/clkc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/zynq/clkc.c b/drivers/clk/zynq/clkc.c
> index 7bdeaff2bfd6..7621c2f00468 100644
> --- a/drivers/clk/zynq/clkc.c
> +++ b/drivers/clk/zynq/clkc.c
> @@ -427,7 +427,7 @@ static void __init zynq_clk_setup(struct device_node =
*np)
>                         SLCR_GEM1_CLK_CTRL, 0, 0, &gem1clk_lock);
> =20
>         tmp =3D strlen("mio_clk_00x");
> -       clk_name =3D kmalloc(tmp, GFP_KERNEL);
> +       clk_name =3D kmalloc(tmp, GFP_KERNEL | __GFP_NOFAIL);

There are so many more allocations happening in this function and they
aren't marked nofail. Why is this one special?

I could see a patch moving mio_clk_00x to the stack and then printing to
it. But it is also fine like this, so I don't see any reason to change
this.
