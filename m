Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6CC3E5EDA
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281885; cv=none; b=rF7t807laM1yM98TiEhc4+CicALTDkK3RkMJUkR9Gmolb2fJmQ+tDxCG96MhqEKLOXoKW+yI1dCml3eI4cwvSFV80irDJoIzW3U4SffrpZxrbLmXcGfh4cAxiFy6LJHBLeuOYsPdjFDrQ4oZ5l6RI7necZ4eQDANp1K9npeiyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281885; c=relaxed/simple;
	bh=ZB3H3f3ElaLpxDpPNUF4NsqqhjJPg/4ycXg5Jb65iVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1EitBKd8U1Rpzl9zfJlsh3FkJc89Wa9aRpo26NfvPantqS/wIzzLApl4foCztXRlsxNXVXZ+XU7607XMLUIj+oLk5UUz4bqkSMqfTiXTK8LPQ5Hf1eao57c5BZfa2RC0u7a8/GeBDl8tihE4U1JXU4KtJyhdobJCp0JdvVrRV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cB+tdg1X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cB+tdg1X"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476a130c138so4112607f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784281879; x=1784886679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZB3H3f3ElaLpxDpPNUF4NsqqhjJPg/4ycXg5Jb65iVQ=;
        b=cB+tdg1XWIVi/nE4Jy5/Pgsw+Y00eJVeUkaXLNESntJ3OXzp5cGChc08JvvMrD4X8p
         tt9I48cU7Or0u/P44pZaFM1YemrURJgP8mxwSUw86Hsw5u14cLnQdc2K8Hwn+fZaq/WI
         hUxsMX2l5MCE+C9JVNV2vuctRQ2uXnFn5x6NCeQQj0tkYSIJes/jC5k6IzGnzaCdGepX
         mQRoQ2HJZBJz1Rnc1PDcq9rGtMrLjOExGA936TipDwZpi+E64xHPhWSYx0n6VVdIb1rX
         58jRdJriWpckJXQplf/wIdKVbdCP378zaX1OCKbw9si8tq766IsHXa3FuTF4Jzd6xUC+
         7Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281879; x=1784886679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZB3H3f3ElaLpxDpPNUF4NsqqhjJPg/4ycXg5Jb65iVQ=;
        b=hb6w+tnpBbPCCgb9JEqfr35ZJPGBQCRJ/PF9JKsnyviabF7W5ej9Xb/exjL6L+KeYf
         Le1R+Imxx/jb55Qtc6yuxZBlVrV/ZtvyOHdkVbVvz6THK2KWs8jq9LT7kl3cMQRb91cx
         BzU17YxtPg+eWyMaWR//0SAZ2gAU4OjZS+6Ye71XgavD8kSIAvgseQsGoKIg3JXkaGRY
         YHA5nOtuxvIToH0XyL5PVUnSxj3hsOjvkgCJ+j7/w1+M69l/wZLvBQO9dRrhJy3gOwzx
         1KwYZJAp4/RoQRf6wjgkrFf/vkyf4/6o35aw3NJytYTRRle4UxRCqswtosGiAs5ZuVCE
         kSnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYt2EbWtpm+Ws1N6pGeoN/8z9q2u6madQP0VMR8kWaX9cJGmYU7iG/TeiozebOSs4NX5vPocLTd3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMkeOeJK+esdzUXIwIgOH4wQsx71d0SM2rP9AD0//RcSBcN2+0
	NR+kJTdv2dQTfIHNdCHrFz2MhR+zUDq4sNGrA9FVnMb5QCaYN0BY51/F4rOquqAk930=
X-Gm-Gg: AfdE7ckiHBij44O4AdNHyL/TeR6AUiFywkfhs0t5BYywjya6o4Jy225Yp4ikQno9ZaW
	BDwcmVtb7rWKkniMZ9eRSYqGejyAlzeRPJZ+XYkoJ7775MWCRPAr7hUUzR98i0VBe8pC08DX6CJ
	kk4QNHxUDL67HPAdJDCm8bbvXF424jVS1iTKRIfQr7xP4JcH6NwWfIG+wwlMG4y7w1c9gRF7yaL
	Uup3RF1ItGxmiSuV2w8FPs2dg17136PdwKFLpfBDmv+jB9k6gm41U/mY2Xb+In0LJ7tFYjN6ETn
	N5IjimN4txbTMN9RLxE7sC+D8cW1gc7en6lA6RN1+uCBP9cjv1J3L9e8Id/QBgjnBrX8fVDMP1P
	F9oGJ1qxyU5VSMvPrDog83ojIZ0jlKBxsfuIov+/XUwcy0gysyIr+GCmUuBy6cGxrm36tbvRyBc
	4QMl+7MaX1BkDlHH+P1CTP0eboCS2KyxoJaSC+JzUvae9/E9gCdKnYiepWLw5QBldjDtPK0huOm
	zNO
X-Received: by 2002:a05:6000:26cf:b0:46e:483c:2262 with SMTP id ffacd0b85a97d-47f622f81e5mr2795318f8f.14.1784281879131;
        Fri, 17 Jul 2026 02:51:19 -0700 (PDT)
Received: from localhost (p200300f65f47db047d2d8b161e35ab77.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d2d:8b16:1e35:ab77])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e496afsm2730880f8f.1.2026.07.17.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:51:18 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:51:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, 
	Brian Masney <bmasney@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
Message-ID: <aln6H4A2QTO9w3Rq@monoceros>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fkycjd7kwh675awn"
Content-Disposition: inline
In-Reply-To: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>


--fkycjd7kwh675awn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] clk: Use named initializers for platform_device_id
 arrays
MIME-Version: 1.0

Hello,

On Thu, May 28, 2026 at 12:29:38PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
>=20
> While touching these arrays unify spacing and usage of commas.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

This patch still applies to next-20260716 and still is complete (i.e. no
new clk drivers appeared that require this type of adaption).

The patch sits in my queue for quite a while now, got positive feedback
only and already missed one merge window.

Do you still have it on your radar?

Best regards
Uwe

--fkycjd7kwh675awn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpZ+xIACgkQj4D7WH0S
/k4RPAf/R/neZTJeROp5HDfAB1kjiKdTD1eb+lCt/Alu7OUMfPtNCohc+wbWz0aD
9VLN0xNFPWisKl7W+P4wIm/oBhVUpj9YI8Xe63UGQUTRD+pMXyWR0tum0HiUJ7fe
BFPKV8aY+GJ7FwbxX764+avTkKzUBJQSUzerE4Ea8QtB+YU5zUPe/X/NePEgMYJ2
KMGSQJqpPjooKUbhKdUHbEOHxfomCWX4U1mUW6fuiUEg1zoGXbzsfXy1DibGlBtw
BDhBd/LMd+okrZyBw0mXnzKLVn0bDosN4Qdc+UUh21otT2ahbWBYTjwlUlZkHvZi
sWFrnPSXKS02gFdBmGivvUcQMzygWg==
=PWp0
-----END PGP SIGNATURE-----

--fkycjd7kwh675awn--
