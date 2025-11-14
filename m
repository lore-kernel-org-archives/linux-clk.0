Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7CA32D42F
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132183; cv=none; b=rv30bcQ9UtVNKdkHM/kYNnQXNTSS3r0fiZ2SyDuABjkV6v9Vt7sQoQnJPF48PXT/MXVoj3Mr4qglHQt81qgt/tEtHP/D0HZZucM9AKm8ZcEPzXkmTiKQZMd06GY8ZGC1u9deLl/0CFmzaLphE+X2c5L1ADfNiIQKlXYkXgka7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132183; c=relaxed/simple;
	bh=8C9FHp7PZ631e2Ybbwogq7Pblu3WU18LYULy9dqpPsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twCDF37b3sEobHs69zcCv4aB71wL8svVwTODFau2JKlZ4F0COIO73BSwJxPBnmhb/DWn+nwqIRGymLKh5zVILDo1yODotD99Wn36dZVIrbls5NN1hg6ELtkhPL+xT2EHqJgw7ufk0ZQoaheMgsK8B6MgfJhRpPkKB8YYYFdGZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrzXRK73; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrzXRK73"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47721743fd0so12304815e9.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763132179; x=1763736979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
        b=DrzXRK7309makCRyyckanFU2YCV0LbP+bHzVkskNtEeH0OAG+sRIJAX6BLER8S6CFI
         tqze0a/N5MsVsN5V0pe9c6Za77WJc7mZP5Ig78s5/iJZ5AqTgAgZ3I1EZzXCzTct9RVH
         ClxDL2LG4S64qptAwYmry+CljmjOptdPcADGXKKzEovmWzcNZ4q0oiCuhIrgAYGavj17
         82cWtM8L4MTqJKCblgM5Bmjec6wYN/ZiVWtNKK3HAu/RyEDjPsutxck1Co8GRGTogWdc
         B/8snNSfEbAJkeJPI5ZjsEW+idV9XcJP5FXJMbz+L7KP/u2GWm1JUh1AyHlim5TfqMW6
         nA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132179; x=1763736979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/9mxyG1LVSxOgn1WKCRkmy+qBsoYVMZn7X9oY3XK/o=;
        b=nmf1VS1oN7t9BXD+WNyAQBelvnxP1xn8zpoq+QbVKhbskeYaDMHIl2L/brrGyfKk3g
         Lb+MLDGH+nacNCRLS0L7+6dLKT+4s/A88d8W200oFAqLt0qVEDbyLdlG5TAncvjYMz/W
         kF2WrtyOO9o0/iO5K2nl1LTV0scAdQurdtoAujrp8OCgWUHATN858xzCZomnjQbBFlHl
         L7ekQGclBcnX1lf8L4zEsL5p3Em51bRczz67JTp23k1BoiiEqtxZlg7tOrKfc0bEoU8O
         we1CDsv8DdDsnSRxKnqMnXbfCvrb1a3Tb9wl7M3BR6bFaKu0mYgt6HtwZ51PvauRUhpY
         6gFA==
X-Forwarded-Encrypted: i=1; AJvYcCX4nvAwtt0TpAMQr+mPQnTyacd9eneZ7F58X8xaHWSFYcJ7nRWWlYRNRHwcwoT0ZavFqj8rdTzcLGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHzOZWgOJ5Y18leirUuX2mwqnL/KbiTK7Ud2leYr/4mTfEWI2
	afT8DOlZciCWNYCXLXMZV+2hBhzBec6IqWp1YqurXfsDsNLh1cB1vQJ9
X-Gm-Gg: ASbGncv0R9cBfgOV2zO5iGE35LqIsH6pccAFNwNMfovDbVYDRQfaqTIWsDLNSZK4ORf
	AkZJvQd9fZK1ZQ08q3pgH5pfJ9vLK+WRG5HBIorJrV4nceB3h3Akr//9yw/fgNsA9coPc1IMSd5
	J0sJnhknmUTokgCMmuvbZMTOctIW3wpbTN4f5sG36QUCUZ2HpJlSOehYkj9AICYnhk992EDI4WR
	ml5OoMthFe+FFauofPEUNy7fdJKP+aqzFFeCO8bQMAc4cVWItE73ZOMK5Hz6GOXZwIShfYhIOfV
	oG1LVd5hvOwE7NPmcUEBAxSB/5chJnI3TuRJ6Na+W1OPwbxJPg8qiqOELleB39e+fPutSxuS1Yp
	f58fukxoiU/56OTU0HJ12YDH9pQpuKTliBeqXVzwkQ9wFCt2rUuNtWJXJVuEwCy6mb5bd4vLNEr
	nN/qUE7YXRQz/0rMhnpviCdoVWiDDI/4YADe9NkrzTGfA7opUCFxSo2oTLOoViKqw=
X-Google-Smtp-Source: AGHT+IHH+QDPwizZAqaXOkEIZoWon24hqYUWks1VOVo0gf4ap+2tE/j3QWY4er5Dp7X0/B6XnzFATw==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4778fe5ff23mr34390975e9.1.1763132178710;
        Fri, 14 Nov 2025 06:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm148886025e9.2.2025.11.14.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:56:17 -0800 (PST)
Date: Fri, 14 Nov 2025 15:56:15 +0100
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
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <cd467v5xu6aaxtllfc5awt6sen6jw3u4vdr35ue3x6e5cao6vz@4kjeiwo63tce>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqyqdls54xm3etue"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>


--tqyqdls54xm3etue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:28PM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
>=20
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra20-csi.yaml

Applied, thanks.

Thierry

--tqyqdls54xm3etue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQw8ACgkQ3SOs138+
s6Fc0w//YzvvfrnY2oE+gg920G2CSw3rl1e0FAgNvins2Qt8x1QUys+Tr3GyLm3k
k2TYECD1jsXh6dGN5XWZUxY8m0G+pzXgFqZ8jnLRstWRC0I3Vn+nGsbXBUMpbp0F
ogRuV3DGK+9Z3eDBahsQulOIQtRMvM9fMO3csuzI/ql+XCVzwjFzD1yjWkwsgl55
spLXD/YnC2YRd6rB0CbTxKb4CZX7xJm6eFZ0JWAgWdUDemIKLQXEmFIK5ZoqCK/q
PYn9uuFLeebTTLQF5dCuvSGSjoQY+SrVHBPDRDUqFL5m2PQPIWdVIgWPTrQ5vllZ
AkED1KPfot8yoPt0lP97nynkWFaC6jp0aSSKGhNiv3gwunwF1Tzf4KMlwtn/NZhl
jGrwt2CkVE6i0pW2lf6xneM6Kg206eSuCA5Shla69u74LGB0f4+sCfdNfDxg0y4v
24rrOPlNcFrJduCiGW+wgszu3XiR1Uy/l/UlSV505O44uHTRck16zup+hA6mz9Xv
s12707JMhxwtvqNUlvHc5pyu6KU7dgOzG4X3ezHKd/o3Zuxun8ZOtqUsWvhlRrrd
XkLbkt11kNxmCuVgBPxIwLTXSgIDZZxDN641pvWfFUx/sV5QZ8RgObK79ne4d/yC
BvXV19RCcd0c/aYfIaOn92k74QkOzOgFR2h9HOzDlaxTHEY/hFo=
=ETS8
-----END PGP SIGNATURE-----

--tqyqdls54xm3etue--
