Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D28316198
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763380582; cv=none; b=aa3YJT1z+Q9Y+vBPV6EY8HAFWVt67+/kdC/V8dCHKfzcxxkwYaZLG40YXnuew9iEgZIAsX17PM2MMBSHWoaX+kHEmaJA6n4q9d2ow3TFYeLZGT+AK1Dr/Rp+brGBcuNhWGVgRtkkRy/RbG4LBhZA6R0cmjmwMjm1eUS917JHcIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763380582; c=relaxed/simple;
	bh=IoPbm27xlqMQUcqxETSpkG+UYV649jqk6iAorfC4n8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFOUzFN4cAsIQ4rL+T784kBtEwg8SU0eA9rg6iyb5gazMDN3vqPvvA06GkprmOL6mlGbh2IG74/b4y8pLFG4QTiJdVEFQCDRPaA8zhChauKR6YYUIm6vRhws1nIZOFk4s88m4jUz1kfHJtdlL8Q1/JZfY2UrPVjCqWo4ZDjSOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZHMEM3G; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZHMEM3G"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b32900c8bso2365648f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763380579; x=1763985379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWXDrHTHFq+LoH950osN3acgfrZIVN9A2hnRrxaWjK8=;
        b=PZHMEM3GXiPrSq34Q0BdUk84t7c/SHM+UBapc6416nGFGKlqNWd2MM0Eu/gc8s82X/
         dxWgyT0ibcTO6pHO9YNbCZDykre1fuq/0U6nL54EqnXzWcHx2WHVRcHUTupRCSq9nEvl
         pBzUNGr/KufNFzIg7CXz5oEa+IDMPQScb6wdBGovRbGwaFQA2qmRth08N244Ip1sUb6f
         BKLuqd3Nik41AIArCo3WnBaHEnarTJ4kGJTraO85xhivjOMOe6a7CIi451XWhn2DB3WC
         G8HcyumIdJJr3abQREgF02P2q3odn13xca+R3RpnsVtUbkXX+s7soltQEB7kxCWAZWYr
         lWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763380579; x=1763985379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWXDrHTHFq+LoH950osN3acgfrZIVN9A2hnRrxaWjK8=;
        b=AGEex8zX8f42qJD0XGr7HkwYWFXj3UW47fesa9qCVdPmNS9b4J+4PWZYbA6TYfjC+s
         oN5zjOkw9wsfzytxw9K0oXBZrQ0qCZmOy3UXm1zqjWsNt/lUzVgTG42fy+oKIvZSISN8
         rTPYluULSKh0qvwkdNZJkeHUpmcWEDHOExbSpuUxHnoaEmO5OBRWWV1l10SPpwSHBUTI
         n7uq56wkRkL2Q9OcfADTxX7DBydAJhCpKlA0o0PkCy08hWZwQfz++lOsPemX57qMfJNG
         WQXPEjWD56KPgIud/HXpME+jchip7+ut9AGyPpYUd9VTFBeqIqhSTl/IqZfe3lP0c7bq
         t6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdkLt/eGRsh12adpHZvRh2u981rSJ+YjUMGuaQ+ie/YGm+GnERXfPErf8NJKS0CkzkIPVPvC1CXQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9MsJONF8LzNY+TI4oURxqUpHZ2kpMcPHLZurAuoQ1mPSotCee
	/sjWdKs4T69H2XYcKnAcnj8h6Fx1uo6YZTec863+6Aq7fXrNSD02uYU0
X-Gm-Gg: ASbGnctl64YpdNYW9Oy8++VQaI3DXprSQFuOY3PEYRow7sh7ir9SjfQ+luFS6zXKyro
	rToXQ1xK0rxP36NTtMNdGwU9nKOWjq78Iqh01qzwSRzgiXNPIpLM4ifD8Lu1INarJnuNkBllxVf
	ReVGnfVPSvObZ4+1ewDcoQ3APDg3r11lqwXA94J6CkII0T3LblrAwh3g4hL52MLFQGtdQhiEe0b
	HtM6xFdTsxdGrEpWLoo+Z3IHsRhMf21etBgdoLwdE+sFSp4Nffbq0SUw3caxq3GqouUk04TLpC+
	TZ2fL5uydH0YWpEUjrpcgtRC7/5sob3WMrQLcKiHGBw+Dst0ukLZ6uLFV6LVvn7/eQXFLfNr3iD
	R3DZzND2TeFOHcYtI0HdrUC8FpHDEOhGYzbDnvcn4hfI6zk4nCISbc+5M7oaijpSskvM9nuLTLm
	niz+KiqQJyDcH4eJRjSvTveh+RfGrkV9MToNFRIK+sNYutpolTmfU7kEovb9f6Zb2574Yywhs5u
	w==
X-Google-Smtp-Source: AGHT+IGyc0tqDOwSpepSxf6zhqj7TmN9ClebDcKhn8W2nmVRELCNueCBZL+FZrHTRO+B3NHj6nEyNg==
X-Received: by 2002:a05:6000:4029:b0:42b:4177:7139 with SMTP id ffacd0b85a97d-42b59374d6emr11588070f8f.46.1763380578949;
        Mon, 17 Nov 2025 03:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm26367014f8f.19.2025.11.17.03.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 03:56:16 -0800 (PST)
Date: Mon, 17 Nov 2025 12:56:14 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="chm563f4rduz3hg6"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-3-clamor95@gmail.com>


--chm563f4rduz3hg6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:30PM +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 and
> Tegra30 SoC.
>=20
> To get CSI operational, an additional syncpoint was allocated to serve as
> the CSI frame counter. Both VIP and CSI use an existing syncpoint for VI
> frame start events. That said, the frame capture function was refactored
> to reflect the addition of the CSI syncpoint, and the CSI-specific
> configuration is guarded by the presence of a passed CSI channel structure
> pointer.
>=20
> The camera capture setup's configuration was reconsidered: the first two
> writes must be done before tegra_channel_set_stream for MIPI calibration
> to work properly; the third write was moved to VIP/CSI-specific functions
> since it must be source-specific; the function was placed after
> tegra_channel_set_stream so the initial sequence is preserved and expande=
d.
>=20
> CSI configuration sequences were added based on downstream 3.1 kernel
> sources and adjusted to the existing video-tegra framework. Although
> Tegra20 and Tegra30 have the same set of configurations, they differ by
> the number of clocks used by CSI.
>=20
> Dropped the software syncpoint counters in favor of reading syncpoints
> directly and passing the incremented value to the polling function. If the
> syncpoint increase fails, the PP is reset. This change should prevent
> possible race conditions.
>=20
> MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> have no dedicated hardware block for these operations and use CSI. These
> calls are used for both CSI and DSI to work properly, which is why MIPI
> calibration cannot be contained within CSI. The pads passed to the
> calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) and
> DSI-B (4).
>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c     |  23 +
>  drivers/staging/media/tegra-video/csi.h     |   4 +
>  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 -
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  5 files changed, 608 insertions(+), 47 deletions(-)

Sorry, didn't realize that this was supposed to be part of the earlier
series that contains the opsification since it shows up as separate
patch series. Admittedly the numbering should've given it away... Thanks
Mikko for pointing that out.

Anyway, most of my objections remain. You can implement this here just
the same even without most of the extra churn in the prior patch. No
need for moving things to a different header, just keep adding the new
ops stuff to the existing one, which all drivers that need the
calibration functionality already include anyway (including this). Also
no need to split out the SoC specific bits from the mipi.c file since,
like I said, it's not going to grow anymore and can just remain as it
is.

Thierry

--chm563f4rduz3hg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkbDVsACgkQ3SOs138+
s6HaShAAl2Mt1kT8lpQi6WisXh3S3pWUZiGEd4h+Q4mM5o3CX5jGL3HRmrLuw3X9
E46M9ZXWcfbObqJtcXc+adkfJjRp0SZAVv4dOuHYewSpSxJJcqk7MvPaBHVIRQCW
DuNQF0xdh5X/H9aWmCEGuVPE11AOkU2hoT4jS2ovdRGzkV/bK581i7oFSbP8yp+8
x5Ah3mdv97Ffhtmfo6pXDQs6yUdK7NtTVUsUzLixcNMG+YsgzDW9E63xE1Z30ChA
h0E1wT1VhNRnt8xa9bEyfdCJqPdevYXaatR+pPlVkOR58kWKHFiOHNgEUaF8xerQ
BSzWTx3Kp9QLwamVDyGnw0EQ9FQdaOlQcuauh0hqum8RcrugB4VtlGfFw3FPa+3g
GgZAOQJ+0ZVGSB/hAEuNyr4wGu95OISvuXKIkqrdoHbYU+TASM0CxSNQtPPEzmZ2
diLGGMXsUorMYEbX9qBO8LtvanKOCXneaZsEsM8qWz9bVDhCMhQrgc9Pc+tsqCny
AIaDMNMyxijTd5v3gKBFW7zTwtd6lWas7lyUoZau+o1eSFfuB4e41PBmK/wVhMs7
gfpOhWIdHftMKP5vG8CqUAWanoe6uv+CeWrELFtrsmXB9l2aO50m+qOu/tK3IJGl
d2KOoBu0b3FYme9XArllewm8eUA56emOKuD9D5FkDvRinR3ljDY=
=co+3
-----END PGP SIGNATURE-----

--chm563f4rduz3hg6--
