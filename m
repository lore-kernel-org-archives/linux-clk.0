Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5A0C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 08:39:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ED7B218C3
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 08:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9f7Eqzy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbfBRIjE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 03:39:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32852 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728689AbfBRIjC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Feb 2019 03:39:02 -0500
Received: by mail-wm1-f66.google.com with SMTP id h22so11531331wmb.0;
        Mon, 18 Feb 2019 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3xyjbVPPBBFLI9lC+Zt3UTjugI3I7mNe9kQYlDSpiH0=;
        b=h9f7EqzydXGFyt/Cun9/8S6bnljrukZhF0oxRvu8+Jt/4pe2M9oA1OTnXXtWRTL5hS
         y2sP2j26OkOg8ioF5nbGVj8xjjCM852LCz1DS456+2cpotdY9BN+h8INd2GGyRxUMGG2
         L1gbzhliOjN5bN82fS5cGT87pmi65bBM5YWtcChy8O+zHr78N4+SbgCc8mH530rUYQF3
         L6G495lQxYfQVNr5IcgQDnSwh08eKg7epsW0y/o3/agFELrGAknHNHXMxefkUb9VAzcJ
         0MsZFHj7QWYVEES58l47vVGQ2fJxoQL+EGG3sgk07RkZMdbIVfC8/0u0LuY0Sg06kQ8s
         +EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3xyjbVPPBBFLI9lC+Zt3UTjugI3I7mNe9kQYlDSpiH0=;
        b=H2wMx19lMJDDytK49MicYZlCEQTi/CbtDkqYNDMSpkkjYVzEuYOtRR6kzWAuJ5pTCE
         unNcmdpV2PnIhmmHn0tvpYQXWDDtlzpkCeClAxHbY6d42J+thCbRdLA7NKfGs3x95VkW
         KJvOP80Bt9f9WShpxoKJ0xbIWZUt5VZuT+c8f7ERiApF9mfI6UFvh4KKnuSJ8xYvinYa
         EnjDx6/NUHgPtgRODXR4HJicg4tQ678s1reywyMzIYJO5NmEFv4adF1iDCi8STRZYESZ
         xxpWLJRzcfkyuk2rQ4FJyO6ACGDJtrq+HVMxn4eNBXse42+K+Vnzf18+RUDmifIg93lw
         Ap0Q==
X-Gm-Message-State: AHQUAuaaGEr83fw/t/6JXSjdFf96OEoTeeSwKbVGCt0nn5bPNODFp4P3
        h3Y7V0TPxemHH8vYzJul8TApjxVM
X-Google-Smtp-Source: AHgI3IaNx0ZnUdCRhCGhGYCbn71Qyo/eoRSJo0JOqkYapDXV+CqViyYcK89QbXtIpGkGXjeFDJ8Jgg==
X-Received: by 2002:a05:600c:2144:: with SMTP id v4mr4643352wml.4.1550479140304;
        Mon, 18 Feb 2019 00:39:00 -0800 (PST)
Received: from localhost (pD9E51D2D.dip0.t-ipconnect.de. [217.229.29.45])
        by smtp.gmail.com with ESMTPSA id q6sm9556991wmq.4.2019.02.18.00.38.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 00:38:59 -0800 (PST)
Date:   Mon, 18 Feb 2019 09:38:58 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        "\\ Peter De Schrijver" <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] clk: tegra: dfll: Make symbol
 'tegra210_cpu_cvb_tables' static
Message-ID: <20190218083858.GA19363@ulmo>
References: <20190218070609.167535-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20190218070609.167535-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 07:06:09AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
>=20
> drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:244:18: warning:
>  symbol 'tegra210_cpu_cvb_tables' was not declared. Should it be static?
>=20
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

ARM SoC maintainers,

This fixes a sparse warning introduced in the tegra-for-5.1-clk pull
request that you pulled last week. Do you want me to send you another
pull request (perhaps give it a few more days in case other fixes are
going to show up) or would you rather apply this directly?

In the latter case, here's a link to patchwork:

	http://patchwork.ozlabs.org/patch/1043804/

and this is:

Acked-by: Thierry Reding <treding@nvidia.com>

In the meantime, I'll go and improve my build scripts to run sparse as
well. I used to do that but then removed it again because it was so
noisy that it was impossible to filter out the Tegra-specific bits. I
wonder if I could do something like have the build scripts build the
branch base first, without sparse checking, and then fast-forward to the
branch head and build again with sparse checking enabled. That way I
should only be seeing the sparse results for code that was modified in
the branch.

Thierry

> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/teg=
ra/clk-tegra124-dfll-fcpu.c
> index 4b6dd2b3767f..e8ec42bf8638 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -241,7 +241,7 @@ static const unsigned long tegra210_cpu_max_freq_tabl=
e[] =3D {
>  		{          0UL,	{       0, 0, 0 } }, \
>  	}
> =20
> -struct cvb_table tegra210_cpu_cvb_tables[] =3D {
> +static struct cvb_table tegra210_cpu_cvb_tables[] =3D {
>  	{
>  		.speedo_id =3D 10,
>  		.process_id =3D 0,
>=20
>=20
>=20

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqbx4ACgkQ3SOs138+
s6GKiA/+O71hH4NiwOvrteKU/ofEN7JlIgDMQoiqJRu0NzEKKZifkUYIwg0lSfjE
/NZmxOwLw+vexqFjBcJ83Vk8wYyQr602x1oQt18RB0RZwB9AQHcvK+sGZtMxzf0G
fSYojvtY0mnbausiJwVhkYpzIausLBJmZpx+xMqGF5QctLuHC49PszPDV8XHqnRv
rLvOgRHAwFz1UEou/2xWydmsMDVx36NSZY0GCWkrxTGGmoqpMS8iW5CWv/9Bc2jX
1COrodbiY8tjOYeFxdYGIc/wU5Krj96ujTM99WrHoVdwXVs1kkL6J1HS4YznAtIP
wPvqioaHaXHQq5mkFUUxOkzECKz8z1TUrHqXZ3HNHfEPFEexNpF17TRRQMyYyQGs
jTlx6+vGtZLvdb2aXmhA4eEejLXfzQN8cpZ/hmMsplB0y0eu2JUZz9uMX/0QhCbK
IhFpbiw0ZkrBW7/8gSiIyfqNBkcClfLA/EN7chC5pebqcxduOJ28BA/miDwBlztX
gIu/fn2LAgZkhxYLEIpojauyBgwHmMAwyxg1WX/6+9DwMNaJpEXcLqUT3fZINni6
uftRHSUFIlSKBfJpskxy2anUWJi1iKY1IoL/rFlEwqahAJzdFDENyNdAAPtJ5rrY
fOWdPAY2iUrZcdeTlNGoCbKpsSpz/etG6d+IL+MFdHYzE2hYn6g=
=OP2W
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
