Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3474FC48BD5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 22:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E41332086D
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 22:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561503294;
	bh=weSpa/4xdwfTOEStQFLeie/OEq+r1l5XfSl6GUCyf5o=;
	h=In-Reply-To:References:To:From:Subject:Date:List-ID:From;
	b=HJO2VUCTN6ej0IKOufuzF4wuLQXQQ50BtBbDiGlDivK2O2XqAfRloXMWX8kRB0bVi
	 /6L5KAJ62WfamS6f5OYpkaskAYkxO7kmdmtXaI0nT8kOHdC7/yuK/ezlBoevNCo88i
	 0bMbALOe1+RSLBeV7s95USMBY8LOfB5u1JqvTimI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfFYWyx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 18:54:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:46994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726223AbfFYWyx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jun 2019 18:54:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BDD020665;
        Tue, 25 Jun 2019 22:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561503293;
        bh=weSpa/4xdwfTOEStQFLeie/OEq+r1l5XfSl6GUCyf5o=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=P/DAftrvTcSOM/Vj6YUPGlRh54jB9EtGlaaAhNgk3PJ1rmcYR8uqc/LVeqlgX7ZOV
         /ueC8Gx2PyPRiPcEA69Rt8qwSL2DgVYyBWHofAhFQKqNG/m3rmwXo5PYwgapLazU0Y
         Wnr4s8PkTgow+HHZeb1xptnTp02BLkqqiy3PU6gI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1560484363-77239-1-git-send-email-preid@electromag.com.au>
References: <1560484363-77239-1-git-send-email-preid@electromag.com.au>
To:     linux-clk@vger.kernel.org, mturquette@baylibre.com,
        preid@electromag.com.au
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/1] clk: clk-cdce925: Add regulator support
User-Agent: alot/0.8.1
Date:   Tue, 25 Jun 2019 15:54:52 -0700
Message-Id: <20190625225453.1BDD020665@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Reid (2019-06-13 20:52:43)
> The cdce925 power supplies could be controllable on some platforms.
> Enable them before communicating with the cdce925.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>=20
> Notes:
>     We see a kernel panic later in the boot if the regulator is not
>     enabled. Unsure what in the driver is causing that. Something
>     to do with regmap perhaps?
>=20
>  drivers/clk/clk-cdce925.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/drivers/clk/clk-cdce925.c b/drivers/clk/clk-cdce925.c
> index a98b3f19..2678ee6 100644
> --- a/drivers/clk/clk-cdce925.c
> +++ b/drivers/clk/clk-cdce925.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/gcd.h>
> =20
> @@ -602,6 +603,30 @@ static int cdce925_regmap_i2c_read(void *context,
>         return &data->clk[idx].hw;
>  }
> =20
> +static void cdce925_regulator_disable(void *regulator)
> +{
> +       regulator_disable(regulator);
> +}
> +
> +static int cdce925_regulator_enable(struct device *dev, const char *name)
> +{
> +       struct regulator *regulator;
> +       int err;
> +
> +       regulator =3D devm_regulator_get(dev, name);
> +       if (IS_ERR(regulator))
> +               return PTR_ERR(regulator);
> +
> +       err =3D regulator_enable(regulator);

The regulator is never turned off though. Are these regulators really
just always on regulators that don't need to be managed by this driver?

Also, is there an update to the DT binding somewhere?

