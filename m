Return-Path: <SRS0=n/Bj=25=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF81C33C9E
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 12:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1D032075D
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 12:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwDXqQhD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgAHMAR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Jan 2020 07:00:17 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33265 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgAHMAR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Jan 2020 07:00:17 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so3138322wrq.0;
        Wed, 08 Jan 2020 04:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fkvTw8nuKOGG7J7vlMkW4QWnRS/Unh/bS82CuU0k0/E=;
        b=BwDXqQhDmnUhHZ96Tk99EKJJ+Tu2ikrs5pjK+cseUy0tXqqne6Gnmrn4Lf6tpitx8b
         3ed+BrbNV0gRA0+QWcxaHxKdIpYWs8Va52oQzLlkMzEDtk6dVd1qxdwJXTVaRq7rYdNr
         zstdrPVsy2ZJtc+ij2cub/v+WglDiDkA1VNd0E3P6mAMgXj8Qgwa9S7xiFzYfOjmI6xE
         qC9h4idhcxze5XpRHwCkl7IFhFdUAl+RJ3yV8OEwpIPxLGQHW+a7jMmseeOeUdzmnoio
         iw9eTC2tGfoubwAJKdKfC+A1kymFLMHy3kf4IfWVddH1TL+cVX6CfDdfP3ukl7XtbiFn
         drqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fkvTw8nuKOGG7J7vlMkW4QWnRS/Unh/bS82CuU0k0/E=;
        b=CnUEs2fxz1rcVgw/iQEFKPpiwaiemzP7/b5FoL2M7Y5XOB3CZDDJQ097ke3zkSq42g
         BnDs0j40+ipRY6dCqyWvE8KrJxAgbwLuD6xe1gd8ycS+N4zVqM7Nyl4800G9VTrMbDRQ
         dAgCJBSVz245J0wQYmM3FjpXZzbExzGkoO2w6gcQ7Nd1jd5HpMgFKqhWFGC+OEbt1d3F
         7Yna4dTJBPnPC/8fVu8lgX27wRGkmXbyNCrcOJXqKacUERwGF2IRnXEWWXMR/ldWN4ll
         B1FbJ593B9trB3RTTlchSNs7ZSsxcZo9XTb27NOLKrco/Gwk56rax6Li5+kSygOPCjfG
         fDPA==
X-Gm-Message-State: APjAAAVsYLUWD3XafHxA4KIzw2/ffyFPCj7l9zNyYGxBbpHq1UPZR1Gn
        PouiXhsTtjLUSjarOHxazVo=
X-Google-Smtp-Source: APXvYqyBmJ3A4HslVib4mPtBFexLp1t0TpdaYUI8juhKXdr5YvZw2OCdKzN1uEQ89uVa3dzLyml0fQ==
X-Received: by 2002:adf:e887:: with SMTP id d7mr4028428wrm.162.1578484815859;
        Wed, 08 Jan 2020 04:00:15 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id o4sm3932302wrw.97.2020.01.08.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 04:00:14 -0800 (PST)
Date:   Wed, 8 Jan 2020 13:00:13 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH V3 2/4] ARM: tegra: Enable PLLP bypass during Tegra124 LP1
Message-ID: <20200108120013.GB1993114@ulmo>
References: <20191003205033.98381-1-swarren@wwwdotorg.org>
 <20191003205033.98381-2-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
In-Reply-To: <20191003205033.98381-2-swarren@wwwdotorg.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 02:50:31PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> For a little over a year, U-Boot has configured the flow controller to
> perform automatic RAM re-repair on off->on power transitions of the CPU
> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
> re-repair relies on certain clocks, which the kernel must enable and
> leave running. PLLP is one of those clocks. This clock is shut down
> during LP1 in order to save power. Enable bypass (which I believe routes
> osc_div_clk, essentially the crystal clock, to the PLL output) so that
> this clock signal toggles even though the PLL is not active. This is
> required so that LP1 power mode (system suspend) operates correctly.
>=20
> The bypass configuration must then be undone when resuming from LP1, so
> that all peripheral clocks run at the expected rate. Without this, many
> peripherals won't work correctly; for example, the UART baud rate would
> be incorrect.
>=20
> NVIDIA's downstream kernel code only does this if not compiled for
> Tegra30, so the added code is made conditional upon the chip ID. NVIDIA's
> downstream code makes this change conditional upon the active CPU
> cluster. The upstream kernel currently doesn't support cluster switching,
> so this patch doesn't test the active CPU cluster ID.
>=20
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v3: No change.
> v2: No change.
> ---
>  arch/arm/mach-tegra/sleep-tegra30.S | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Patches 2-4 applied to for-5.6/arm/core, thanks.

Thierry

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4VxE0ACgkQ3SOs138+
s6E3Ig/+JjmQL+DrA9FZlgMo3Ni2wA7V95dT4yry/2c1athzRmI2QNMrQpfGZScP
zXrhZTpPO4Nyq0mFhxV9cjSDs6HPfMIPqtO3HGt3n2r0glywFRTmzOROfUAwC06B
sGJ8NzV47AGQd4ueON+jf81GXvBvlsqeLsUc2fC8zy1wtuic68jo+p4/Xypw+Lwu
W9lPUE5yThqJ2AegnYTZMwT7L+O4XtpXEJb8kwtDVFSOilRfoZwtURCjUGjRZ9X9
oe40yUAdeiHWo0RyMyawgZ6LpcsFREdBtfS19hI32K7YZr/PtMppD8F4oiNdz7pu
nxtHZwgz3GeLa4I5l5sAVXgaVjnbMaC0qIlnAQJ+mu8x5slHogJtARb/sLOKdahc
2hlfD+0Ig4lCGhNHTG9xvDL5aP1TMX3JseK51H2l/Poo0p6o00auUM83NuLBsavs
y/Xh02MT9bt/Nl4++GPWQxyAyoWUmgNPwlxzLwqAiimSFMmIUw0zla2ux97Mn0wO
hPuyFZrXWysD+y8sl2RjzwbOnF+rWP425zxKNg8hxspCOUGd5zcIsUrKyth2KTJI
Y8tbHYXVO3L6Zt8ctpnah81m19pZEezqDNKXeCjC2BKdQNINeadrOJcXTdzm6y6k
03LVoHLMTU+IfoOvV9W7xM+XfoIy2tTyR7ApXAhsO9BxdVucBw4=
=oiR4
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
