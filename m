Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1C4CDB47E
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 00:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjJSA4Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 20:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJSA4X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 20:56:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7679895;
        Wed, 18 Oct 2023 17:56:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3A4C433C7;
        Thu, 19 Oct 2023 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697676982;
        bh=WBntg8zzzf4HCRak51jj4EmuHrrC1UVXYnDuqgbht4w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DBm2sTxMFjgOeD7LUKo0KS2v6Bn1VFJASD/VXfKLPZhgJcE6B/wHvHu4loaO4VjvY
         7LCbiaNCB3sMd2ph4nq2R/rO32Bcsa06wQ0TKNgDuIoJF7KOFgXMB4Gr0cjXsB2L2T
         aCNajb6dTAE+0sShGZJvvrPT0vadSuH2QOlna8wozx3nja46heSN994g06JqwHK3jF
         NbEmCzxYkMvnyXil9azCla8kUI0z0aJ26/80ib2uUNRkA9xsMvFl8uqaAv8QhSF296
         fzLWh2O5R77P8Nef5MoIswe3t+8BgzdPtt68gx0ho0Ic2dGI7DWcjg4KUkIS3XegJ5
         jwAqyz7dJAkXg==
Message-ID: <9fa65e037c68a6caea9cf2f68488df23.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7782b4f1-deed-49dc-8207-b6ea06d7602f@moroto.mountain>
References: <7782b4f1-deed-49dc-8207-b6ea06d7602f@moroto.mountain>
Subject: Re: [PATCH] clk: at91: remove unnecessary conditions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 18 Oct 2023 17:56:19 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2023-10-17 07:06:53)
> This code checks "if (parent_hw)" is non-NULL, but then it has more
> checks if parent_hw is non-NULL on the lines inside the if statement.
> It is a bit confusing.
>=20
> For the else statement, keep in mind that at the start of the function
> we checked:
>=20
>         if (!(parent_name || parent_hw))
>                 return ERR_PTR(-EINVAL);
>=20
> That check ensures that if parent_hw is NULL that means that parent_name
> is non-NULL.  At least one must always be non-NULL.  So here again, the
> checks inside the if statement can be removed.
>=20
> In the original code, it was a bit confusing and you could easily get
> the impression that "init.num_parents" could be zero.  When we remove
> the unnecessary checking it's more obvious that it's always set to 1.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-next
