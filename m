Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F7C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 14 Nov 2022 08:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbiKNISu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Nov 2022 03:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236279AbiKNISr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Nov 2022 03:18:47 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592EF64EF;
        Mon, 14 Nov 2022 00:18:42 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 39AB9FF804;
        Mon, 14 Nov 2022 08:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668413921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X576UZhTAk2kjGWa6Mn1KvO6tfONS5DcXAcdb1drDss=;
        b=hocuovv9/oJJJ9D5Izl2DfBvqUrHK5qx8Mq+Y45rNa0Oth00wChrNtAI4XBEGW8Vr8JQlZ
        DRM/NWn/T9cUFsyLmWfriZ4qev88Yy0UAq/Un06b7LEa9T/HwMmCyxkxBGZR6wi1urgLjI
        pEP3pKkFcyzX+ZY6PFTG8L2LVwU23ZsZWOG52cgoyr/acNvg7SR7gAZdnUnPzY0dao4M76
        e9wCAOS/melM9YW2q+6T0tESPicC3NLr14zLh+FY/0OoCbLdgJUvbjWqunvA/eGMUJwCIr
        3HCUsZTLM92gfnqyBUycuaBil52uIJIu7ETd7VbMaYTkdub9JDAUtY9VfWURyg==
Date:   Mon, 14 Nov 2022 09:18:36 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Heiko =?UTF-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: Remove a useless include
Message-ID: <20221114091836.650b893b@booty>
In-Reply-To: <1jo7ta3aao.fsf@starbuckisacylon.baylibre.com>
References: <12dd5cb49efa7714f8e0389e4c7b3bc829e8a90e.1668289299.git.christophe.jaillet@wanadoo.fr>
        <3166437.e9J7NaK4W3@diego>
        <1jo7ta3aao.fsf@starbuckisacylon.baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Jerome,

On Sun, 13 Nov 2022 20:29:43 +0100
Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Sun 13 Nov 2022 at 09:48, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>=20
> > Am Samstag, 12. November 2022, 22:43:03 CET schrieb Christophe JAILLET:=
 =20
> >> <linux/rational.h> is not needed for these drivers. Remove the
> >> corresponding #include.
> >>=20
> >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> ---
> >>  drivers/clk/clk-versaclock5.c | 1 -
> >>  drivers/clk/meson/clk-pll.c   | 1 -
> >>  drivers/clk/rockchip/clk.c    | 1 - =20
> >
> > Clock-trees for soc families normally have different sub-maintainers,
> > so depending on how we want to merge this, you might need to split
> > this into 3 patches.
> >
> > But at least for the Rockchip part, I'm also fine with the patch going
> > in as a whole, so (for the Rockchip part):
> >
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
> >
> >
> > Heiko =20
>=20
> Same for the Amlogic part
>=20
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>

And the same for Versaclock:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
