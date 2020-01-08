Return-Path: <SRS0=n/Bj=25=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024FBC33C9E
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 11:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C67FD206ED
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 11:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpYYVKZ+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgAHL7y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Jan 2020 06:59:54 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54005 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgAHL7y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Jan 2020 06:59:54 -0500
Received: by mail-wm1-f67.google.com with SMTP id m24so2187222wmc.3;
        Wed, 08 Jan 2020 03:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VweC90OhMbRB5YC06/dP5Bg2TdjACi3YY8MpAp++EzY=;
        b=NpYYVKZ+Z9rpqPMje8On2UojyJa3jonkiJ/zW+2DguQc+IdBPd11Fgbzj2PvXSUH3g
         kYpU0587O1bsBTyeNTUYANPla7o1NbKgNfdB/NxojFaOKYausRFuRlpbqI9lXEDGJLmd
         tpQChw+XiyyQ09ABL3FIqr+KJeX55wugMimRHd5NdFDXFBWt5ak0nXaqeuoWkFeJ/ulQ
         K5QY3dGGZxHYT+uWwIjCFls8Any7E1KVrhUaIjmVkoyfJiBdfxWEfphQWNBiYe3RPMfW
         yPQCKGWmdiRKlh5T6EblpcOoq+ZYty6AMYVgxwE0BIcZQU413tVE+/lNqOmrep0aX9DY
         o4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VweC90OhMbRB5YC06/dP5Bg2TdjACi3YY8MpAp++EzY=;
        b=WBvg0jeCdnfqkFdd9qjxoc8liO9ZsCkNVhRb0PCkxDo5NKNLIx4sfqCvNR2TZ3rGjS
         ZxEI9vdGM8F8feod0Jdj96kh/pPAHzLAWJoYjc8WZGkBch/g7nQwJkYoBvWa50WfUv1s
         leNALiUy7m3FVGKrfQSiJIabBLmd0BU9w60A2p86ighxg4a86x/Cg1EV7DbJHnLAER4C
         NexMl/xNLkH/JWzq1EaBeF0oLGkHdj1O07ckq3xovaDYzAz3Y5Qcc5do+GQuvI5C2KTQ
         9gmVF6Y8WG5CEE3NDv+at1rWbSnjUKxS/B1qr5iNLSajGxJN7htFc+CEe2pJQp7U7xh0
         TPrw==
X-Gm-Message-State: APjAAAW1Ne2Mg6hPywcp+oDjrw/zeOh6vbVrv8+L8dJTmi8dJ1E1tdpj
        QB0YAp4BN4SEIUNqeHt2Esk=
X-Google-Smtp-Source: APXvYqzH19+2YKXGZL/Gjf2VptczLfcFBt9bdRvOwXVszToouij5SZJpfPWgkLCY8hDUO42jb+u8Yg==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr3464058wmi.31.1578484792384;
        Wed, 08 Jan 2020 03:59:52 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id d10sm4138463wrw.64.2020.01.08.03.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 03:59:50 -0800 (PST)
Date:   Wed, 8 Jan 2020 12:59:49 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH V3 1/4] clk: tegra: mark fuse clock as critical
Message-ID: <20200108115949.GA1993114@ulmo>
References: <20191003205033.98381-1-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20191003205033.98381-1-swarren@wwwdotorg.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2019 at 02:50:30PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> For a little over a year, U-Boot on Tegra124 has configured the flow
> controller to perform automatic RAM re-repair on off->on power transitions
> of the CPU rail1]. This is mandatory for correct operation of Tegra124.
> However, RAM re-repair relies on certain clocks, which the kernel must
> enable and leave running. The fuse clock is one of those clocks. Mark this
> clock as critical so that LP1 power mode (system suspend) operates
> correctly.
>=20
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v3: Added comment to the clock table entry indicating why the clock is
>     critical.
> v2: Set CRITICAL flag on the clock, rather than enabling it in
>     tegra124_init_table[].
> ---
>  drivers/clk/tegra/clk-tegra-periph.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to for-5.6/clk, thanks.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4VxDMACgkQ3SOs138+
s6F6PhAAlrIuajL3DdiqYncmRYYV7/TjqJxFw2VwBy9bhCisUem0d4zjoIWBl90E
0smLovIXi5278XwG2zdZAtPqA58tKy6xybLzZRez0CY3ACghUSPnfxC6fLH0EMpj
QecOh6LeN6mKkf0EtM810FDRTh+k2YJciaFGV7l5lz+d6qmxEPGeawy81VbnVNyB
F16b9sCYjzqPlEbz/UxySc/b6hD7po6+MBguko8kb6xXs0beKRiKVQ7hJxuOUA2F
RhR1h1amdCArtcqRwWIgTGhS+e+M2sMssv/JCywjBGhm9yMjI6hPffyKkawCoLJD
GUBbV2cnt3ucR1DxmWnnkm1Vks577M11PDro+7V4FM0qWMBsLysO4t2uq2QlkHpk
2tAhMt7X0VvSqtG7pO8aUteCezY+JPck26XOhMuzCVR/ByaaIVi2gEFOzwOezgDy
YuyAa0zL1oB92AjsaTwtgZ7jIULmUox+kEt2IwEJJcDesOGOmTDfsvZTWiXsJe0K
JfhmAsU3jnFHUkgUCATa6gSuZJiFhcfY1pPJoZ2GJDtEHDP0DTF63WDJDDqM/i8l
CTjNIg8dC4MX8wEkZvdZ1VP2Dp/A1zWEl2cppCLX/y5rQFCB8hSyIfYg++KvVN0b
whEWoIWUs0tJfDWAFroFO2GLa6B2n2NbzgaEIKl6tTN6A6p7BeY=
=zoua
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
