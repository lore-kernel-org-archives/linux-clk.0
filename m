Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347C2EB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 29 Jul 2023 03:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjG2D2n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 23:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjG2D2m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 23:28:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63F7449F;
        Fri, 28 Jul 2023 20:28:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5983162234;
        Sat, 29 Jul 2023 03:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ABEC433C8;
        Sat, 29 Jul 2023 03:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690601320;
        bh=2m1Eut3V0qwzdB9kA5ACQKdPTgm6ypjeYNp7GiP+N0A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Sv55ecYSaDyCG+6oBa28HU9UjgVb58HrI2EH6RwAv4IbTEz2oL9/nwcO0R0grPuuv
         M6b3xxOwZBRsxJjFQZQVrmlpPO5J9DzgT1IwWz3CGs3N7N+ptB7/FkhbkpwyIrTqiD
         TiwQCZNtfKQWZW/4sUcqfYIDwFMQ8gDU0S8qwxlacmpvHG+e+fJ8Hvp9Nmcg0tABVG
         UwlR2+Yas07CFvWYPicUcpVN5gLeqnhuhMKXCoa5sjNAyAVgGOydPR/aGlle2REwIh
         4EeSo4HbpM89ganI9W59ufnM9PUMbWWWz54AJZmuvAUS3oobeuAVEmqHkVx+KDVOVD
         QQ3NJbINiH61g==
Message-ID: <412f9209637e6eb861cd07e1d6dbc346.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230727053156.13587-4-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev> <20230727053156.13587-4-claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 03/42] clk: at91: sam9x60: switch to parent_hw and parent_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        alexandre.belloni@bootlin.com, mripard@kernel.org,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Fri, 28 Jul 2023 20:28:38 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2023-07-26 22:31:17)
> @@ -177,31 +178,34 @@ static const struct {
> =20
>  static void __init sam9x60_pmc_setup(struct device_node *np)
>  {
> +       struct clk_hw *td_slck_hw, *md_slck_hw, *main_xtal_hw, *main_rc_h=
w, *main_osc_hw;
> +       struct clk_hw *parent_hws[6], *hw, *usbck_hw;
> +       static struct clk_parent_data parent_data;
>         struct clk_range range =3D CLK_RANGE(0, 0);
> -       const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +       const char *main_xtal_name =3D "main_xtal";
>         struct pmc_data *sam9x60_pmc;
> -       const char *parent_names[6];
> -       struct clk_hw *main_osc_hw;
>         struct regmap *regmap;
> -       struct clk_hw *hw;
> +       struct clk *clk;
>         int i;
> =20
> -       i =3D of_property_match_string(np, "clock-names", "td_slck");
> -       if (i < 0)
> +       clk =3D of_clk_get_by_name(np, "td_slck");
> +       if (IS_ERR(clk))
>                 return;
> -
> -       td_slck_name =3D of_clk_get_parent_name(np, i);
> -
> -       i =3D of_property_match_string(np, "clock-names", "md_slck");
> -       if (i < 0)
> +       td_slck_hw =3D __clk_get_hw(clk);

Don't introduce more usage of __clk_get_hw(). The index for "td_slck"
should be known, and it can be used as the index member in struct
clk_parent_data.  This allows the clk framework to lazily find the
parent, instead of requiring the parent to be registered before this
code runs. It also reduces the usage of __clk_get_hw().
