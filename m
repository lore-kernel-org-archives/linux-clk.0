Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC27E0FF
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 00:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609209; cv=none; b=j2IssNExMa6VwB6HbnzfwYrCyF986gHp+NDMDQFZEt1/c5J4azQkUg1siOPl6Uu9Hxjg+gWMiftpfR/f1NQ7id28Ylgb7dxpeqlA4MK9yaLe74EN9+DRBLZW36yvxhtzPQnOtiQT3JLd9W1rFKmYD9TGWTiJPNTbecbLj3RV4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609209; c=relaxed/simple;
	bh=8VsYUdV+ZGtwBbWIdtRn602J4qIYJ25Ps5b08wwWbxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyQlZQAioTNOcPPX5+1+PN5oADLvsBLggUybiS67eFy1V0o+4pE3hKS4S7CvF7g2DKpGoiBdnhXfzcdAqgfO1FjqcIA7JAlRhckPARWbOREZouHRYSsS4EU51CwVesPicsAx8UOV1BbA4vHh1IsfrS1cK8iodxY8LN8Lqemtnjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTV7uoRk; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTV7uoRk"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ae38f81be1so3364961eec.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609208; x=1769214008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cczEx05352KICGWcEnd+Dlv+PGQV2cIqtx8pi5Cp/Qo=;
        b=kTV7uoRkUfwbHSU2NeGpYt0A2DjQKyjCQ3XpjeK6jFdONDRZdzMhKMVjK//zUmPX8L
         AU51m0k3FxyqKhbBs1APeNKMDnznrvId6mQ52FvKSmVyWWZkGm3eORhjTMHAiOdbp3eC
         Af5wugvuDxomYGT1E4BrM4QnFQrEEwNrztdPo7fXSFUCMDfVwl92BjpM4W8N2mA2/cXh
         UahDc0VjojNV4c0hgp5h++Emy0cidn6aZCrSNjrxGWkkJTm9o0wCoiIyRD72VDhk9W9U
         Nt/m8auvr1LO8QE0DOhr1J6rzVtGOcM+uTj+GvIH6O5ZWDGSNRT5Ay8b4dAMJikmIB48
         m7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609208; x=1769214008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cczEx05352KICGWcEnd+Dlv+PGQV2cIqtx8pi5Cp/Qo=;
        b=OfPpTmP9VlrkdpTH8sUBvcBNf44cyZaQx0aR9hLqY3YXWSCLzVxkWHbu5fjrLXu0bC
         dfOrSy8pG0hwZprDmBZ4LIpf7KN1U/INjj3pdwKl0Ue+pfRC+MDtULtORkZm64LPtKjw
         oqyNXbCRQIxE/uuhlP2BLFOA9ClQvT5l7pZSCDWKSeLqXfqgvTPgUk53/b/kry/1FtCK
         Ig5Lvi+n4wG80oMoD+zJcz/4XfGg4ybIPpwUL9SORFuI2Q2Adh7dfV/gV94tYrM32DSf
         fUFnW+lTFTrlRpjsDYxTlJDigFI9JFeQABh1oWks7gjfDdYIldy/p0hpnfGnXf0vBudA
         gNiA==
X-Forwarded-Encrypted: i=1; AJvYcCUSAepdUTBUHJSeCyH4TVOQ1yweNrJlPX6KLJU51Mx/sJX4eeKG9yk49cHo6b8xC8vym9OW230CiZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCdc7qHK73+gc8FJF6BqFQ1jNUOxlihuM+fHz3CVSRrJ2aHDB
	6RAs2Xu/70AU/LsLBSFNfybHf7DVeAYWxBua8nOeY1KcnwEQYF454CGZ
X-Gm-Gg: AY/fxX5EZHi1raEee+IWlQsWrB07WTjIlow63tJuEVZpibgFNw+xbGbu0Z7xW0VJL3N
	J/uazBZwR/r1RYB3a835ycpFr++k9bN7X8Ag5CSKZB/si7Zg11Z3UvB7rFq2zazwzj/zULj2XwJ
	MDli49NLmcgVWrhdi8ySj9wzCmFLH7cRlQB7p9HMfZJhXa/Ksbl2y+h+t7tp3d2pVgdVeW3pt/Z
	bFpg/0RQRc9WZUO77W+kTo56k7bF4BYUzIhYfdQrPB4N66GX/DUMQMEb+aPNGojC4npxlxSdfKb
	26/L0sJv/zr1KIjiRda61JQ6VCMkmtoCxHu2okxst3ZjdhQ+KIr7uk7rJLmIwGjN9jhHHrq1kd9
	FBuhZ/rPuXWj+K/lXnKH1nZmz29pdHUQApZxbwPcxl9/rdL6GGksPpvgQjd7b6QD9MXjbPFmeZf
	QhxhKBr7SyuzB3eRzKFgtIe59sAOk4g+1CxP+osADJ9PkrcAPDCrmd6dksaZjtC4wF9nuWLEFdz
	A==
X-Received: by 2002:a05:7301:1e85:b0:2ae:546a:f2c3 with SMTP id 5a478bee46e88-2b6b46d2dd9mr3435395eec.3.1768609207520;
        Fri, 16 Jan 2026 16:20:07 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm3932999eec.25.2026.01.16.16.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:20:06 -0800 (PST)
Date: Sat, 17 Jan 2026 01:19:59 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
Message-ID: <aWrVplD0jfx-JM1v@orome>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaydkfl2lwerisz4"
Content-Disposition: inline
In-Reply-To: <20251204061703.5579-2-clamor95@gmail.com>


--jaydkfl2lwerisz4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to
 pll_d_out0
MIME-Version: 1.0

On Thu, Dec 04, 2025 at 08:17:00AM +0200, Svyatoslav Ryhel wrote:
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--jaydkfl2lwerisz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlq1a8ACgkQ3SOs138+
s6G7cg/+Nqq8drdePQg7ZDPcGam2jT1OJFozjkQqShUwbw65NT30Ld24jWkBEDET
V66VMxWnuD+FqJUtmYFgBgP+09riMOIn1kjUwq48fs2/gTigorAcdLx60a80NuP3
uBece6NnnstpG/euRgY5blBwruOhTSyLnu9JPOVnnRSAoRncMndRKLWRykAn201U
ikxuUD7pdh2KLMbPDdqQaTgE/IyyEqjmtt8N50vHBLOZZAvgxaG7UwQsf5RH/KUh
GbB1fyfApGFoCvVJJT+Y3RIH1R0UA7Cz2iQ9BpnWq0qKZbRdx2aD3YoEhsAXT+qu
U/bY+kcvYwshKoxl1KQoM3jkk0k4V7QoN03fnjyR21ZsXjnQzf0RKu/0UzC1BK5y
vLBkf9olK7gFjgLDjrXEzKQUB3sIY/YGWig21onNSMU69zB+JOB6Y8ClDIOoyyJY
HtzjYhTgsuwPMi1vocOk2HrDTlWl7KYZOOi2y00YGp8/bOhWoOvP9z7D4AcbR3zW
kV248pj2Mzd/4/k0H2k69lMZeoBlXZnxAtK07aADqo7eRqYEFUjaESqAPSn7y1OL
5wSs+0gnrfv7vEAC5r1wJ5e+VEXk20ErPvTfzrbQtmo98iyWuRLvR1e7t5X9vuAj
BP+2EYu0xjdpPW9R9wuZG04CSNWKx4490GPl+9UTm8BmHsO5kPk=
=bC1o
-----END PGP SIGNATURE-----

--jaydkfl2lwerisz4--
