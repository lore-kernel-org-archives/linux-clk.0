Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF943338925
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131937; cv=none; b=BejdLwG1G+us7nLKYePKN5o4FVMar1JwEudhAGZaCUDSA+9L7PEVHw3CJeHeQmuhmg5lEGcgKOuxV6CYv9Ohh7djv2sj4Zk62W84hHZSuus+u7vmfaHE8yI1gn2itsSD8ggKhzC8M+RQBHTkM7v2LpJR1Jx9S2fFQhqR6tJaPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131937; c=relaxed/simple;
	bh=z+RzTRp5r8OzCOGGuAh/YrjdDUCoh1Vi3Uu3Kf9nFqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKYsFyUcBbaJiijPEoBRwEMb3QFgTohYrhihRyzQPX1TNxdBFW65IKFzwNb6xzCJS5LGiVXPghOngGXXAZnAnQLMO063BsCAOpaRJku+jPsUvRJj/mxR3FY4TcCkyCfycn5wr9xv8USIJEDRsIQ1MI/u+cS04cPW6SLb0F1y97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvVRaWkM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvVRaWkM"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47778b23f64so15710725e9.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131934; x=1763736734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E8Gdb2sthQ98VUv6X44UK4wYs+INDyJZkDCznTeVWQ=;
        b=PvVRaWkM55LmaaZgK4JrSTcmAjlU+MlYJTrU7NM8v4+x292Q9g1wlMj+CW2OvVo7sU
         CxnYuWjJ8kLcQ21spD3fW8TrXqTG9upkoNpRyymGsdytHZfkxHz2t6Tg0pVLW9t0CXhR
         wg9TPP5Z0r6DuPjwYOA0xdudmQqWHq+yYcpXd7xlkGNhKECzhqSFVP+GME8nd3nRaYzx
         LQeNvbYAZpdh96GGFvzbLTn3FTYXSlC9pS31MySfc96W8EWLRW2gFUPObHmT8obE3428
         /yrXr5+Ea5nj2w4cnMVQL/EgKL3mphP5yGDxVDNMLAM/5+PF5h0bQPRgO90Wzk2YtikK
         7PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131934; x=1763736734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5E8Gdb2sthQ98VUv6X44UK4wYs+INDyJZkDCznTeVWQ=;
        b=UW6Px9VlYpZ2t+WHI5CH8OTCBJtn2zoibOCWPuaJg1KusSEcT4L1YXMo52oebJ3bLU
         cudSGyZTBZM/XAzCLfKMrm5UuDiBCJhqIEWGVr2Yn+xDrX0cLYG4ww0KGq/e4nwFFi49
         F9v1DYdIYWyiicdlCH2wmQt7xkqFYBj6Mc24yI76xz2r0VOQDWS1RkqnOUCN45+BC2Wy
         7AHcZWS12bU9ZIJ2BdBZqKVcSQtUaUJ+m2/MnF0z06iHPWbmLa/8Q0ikDG21us+TDyb6
         oIykM0Q6eS16h3LBeRkLoX9Fc+blLsq4Ba7DQFmcaLeXazmHKAsgOZm2MgFabS3MGWh1
         io/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8gPLsq1cmwQR6l8LWjvy35IFqI13fzGeb+hHdciCuoyL9sPcQImoIc4DzCJ6H1wrCB4qLlCHve8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YznhciUeUSKJbhm7W/CCfgM+4j5jO8mONhZAdtW69HrrWyQBo80
	zA3OSMfVxCjcAvlE8/QsFEj+UdQiRCh2sxNy4+WsKTx+kIC6P9cs6uxF
X-Gm-Gg: ASbGncuvuig3j7qnGc3X7Y5yLQTgI7oE5ILoQHYdq5LtFMQLf/9CZ5uwhBIvxlEZEz6
	ZskbRPKwSxXOZwCKXHXekntbioappwCmcVdMa0IOGjvqxlvfWjlLZQeokJQ0gMudsMcczuN/byK
	CbwCR+STDA/zq8oA/AFeY14wtiQadCfQqzU2oXcXX2AgimwoxqDkjzwRWF5jgALdEBRjG8zTpnQ
	qc4LAFothWwXQDNvcTQLrIVNONYW6LHaq2l/EMmF4fFL0ZPZR2dNZslQAQJ2HG8VrsE7y2OIr07
	+UF3qCwR2C13lsi60ZWONqWxV5DrmYPmCQhgfGXKPr7DaY/1Upu4NxpVMnDTnRJYs4DSwnhj5Kb
	Li+7FIgPsdUassTFV1VxtFzTktJ6paIq31ksh13UYLIWVw4PB6qgZvkfag7mH7yJtVVdfVOruQr
	yK2kckUq7PNz2i0lpnqdzam+HiokvxFXkxBzf3gWJAcPbgH012a2P4FGsQ7nQ8LuI=
X-Google-Smtp-Source: AGHT+IH6EdaXd2gX/Js68QxagND6wDOIWhXEebCdhFFsFPTeLjXVAI/EuqIEEN3kSXnIM4e9UFmSXg==
X-Received: by 2002:a05:600c:1387:b0:45b:47e1:ef6d with SMTP id 5b1f17b1804b1-4778feb2507mr33143185e9.36.1763131933899;
        Fri, 14 Nov 2025 06:52:13 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm9992753f8f.9.2025.11.14.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:52:12 -0800 (PST)
Date: Fri, 14 Nov 2025 15:52:10 +0100
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
Subject: Re: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
Message-ID: <hk2rs7o4lsxh6uofaro4tsjbdandaq4txpsdx6ggx2zgtjpuxa@zdz66zl7as62>
References: <20251022142051.70400-1-clamor95@gmail.com>
 <20251022142051.70400-14-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwlwwn5ocbycp5js"
Content-Disposition: inline
In-Reply-To: <20251022142051.70400-14-clamor95@gmail.com>


--bwlwwn5ocbycp5js
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI
 node
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:20:41PM +0300, Svyatoslav Ryhel wrote:
> avdd-dsi-csi-supply belongs in CSI node, not VI.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This looks completely independent from the rest, so I've applied this.

Thanks,
Thierry

--bwlwwn5ocbycp5js
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQhoACgkQ3SOs138+
s6GyTxAAlZCHN0/OeOSiVj5R+zlyhttYKy2tPfEzQFAFYVDR7MVrwxLczkHyQzR8
YJdAuuU48wLJ5R/PTldehaf8j+inFtyg5r2WZr1rzfK5Wgj1Ont+RDwb1ohoTLto
6bSXG8Tr8AXEyaL6fycm5fcxWo1GemuiV6oxpaiUtS+I/HUbcJPhe1RuNwYpsubF
P9KGdbbv8XMeaem7fM8j0VLUwObdN1mQBTvI1Wh2Krf7CpevtMRVZf/TCB3d8aI5
HGBTW+TiCBIyGfBTnzV4OjZaKrcVvgzE2lHPkAbu/ZBZNz0dFGkSs3xduMhtg/kg
uPxJz0CQBAkTybL2Sa4k8NapAYg+bhyUj7clt0rqcA79W4BABHdF4ihlVvkrPzJz
p9UQCNPvsh+EnayF5E1AYEWDfnIswAYmUoTqGmZmWz9HLE1pn/TUrPVEXfilfccK
ehav4axp746hfEhvfPg/PXOcJQxIhRbJ6goACP4XB0Jvz/67JUKPS7vybcYa2Ggd
NvBgBnkhHSdbAvENYMdosj1lt4DWUTm2boVCA2GY44NauAI70vJO1bQSfNACQbpK
p/Hk7iF9V7yoDcPeJWh0flowHetdtjJylnQVV53S2V37goFuwovw7b13bsvInLHw
pYq7VeF3eirNU4QbWOCiLFoJ9vftiP4vTbtWR1PbVb3WSbyIEsY=
=vU35
-----END PGP SIGNATURE-----

--bwlwwn5ocbycp5js--
