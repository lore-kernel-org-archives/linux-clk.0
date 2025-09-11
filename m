Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78592239E70
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611163; cv=none; b=C+aw8FChcrnsYI5em3Xo3CGU7MCIZmFDpIYLCUflNE8vhbOuL/1FBR52XC5jYErH2LDKjlBXO75WXonrbfFduG6q+rtguSHIDEVv0YX/lG866PnYkR2zPwb1lpQ4Th8+PwS2ML80OJeWMu2xk4krRp6ulYNHzWextYiEyYOe7t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611163; c=relaxed/simple;
	bh=z2gtPUXB7/LXbkSd38vOHruaxUvSZAbiHNqziAkJ0rE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=To7GxLJN1tJgFfmpelNpIp5vpsKEYj/CXzayHjCjqYaircnAaIQtSEohOTbPPU2tuIHEZunPgnR6Df1tbdNMzfG8lpHE710Hh95y1f4EmU+wl/aat8bQXVaECTBAkwzG4jow74FcgrxxymApJ5YSsqF2FNedifmaiCpc5E4y8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gzus+dHV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gzus+dHV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3db9641b725so861900f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757611160; x=1758215960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rx9Yhlqw+0SU2LxMIy3CyY83e0mubLsvcInhwmm1OUM=;
        b=Gzus+dHVUZ7CzdhhAqu332T7B440P0w5tVqzNV+YQ0/gIXowkEbiNfx45u43DEHPgs
         Tt/efgXiuVW2oUlr0aAucdsQWBsHxb5747+QnVBLhkWPsd2Uu7LuZVMK9svAdQxjk+8m
         e7YROrq03VTYa5//NQNVVlNx7jayjkF3LOxZjRU+1WcKTh+njA76ttpeRwesxerzqSba
         ng9Y+1K29gWIZkazV4SICVqVjMjlQhIdOh2TCIdJiVdTv2wOGjDw4bxyeyefWahSJKXC
         AeXQgHlQC8du4aMnBjHZc7ejKPC2wzh411oUw8zK7b3AOdycohdOEwgr4kwWxjjr7v7l
         FRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757611160; x=1758215960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx9Yhlqw+0SU2LxMIy3CyY83e0mubLsvcInhwmm1OUM=;
        b=nrlZYOivskTw1y8ipBgWHZHu9YXLbHnER3VR3o8G0z2LSOevW27AHgW2tZ8TddLey9
         NE2iKSgt/e9ZGXNsFIOf8k2jZH1MLKSEgqKnsX+DygN+1Pytc7c2dBEgVK5EAPgLIWCG
         U8esA0wJvDS8+FXGsdw5KRAWtQ+FjfGxFFrgUYedCgLd3dFQy1Ti9MXqw0jKrgJ03HBt
         0GSPcKbsaz8J45dW9c38YsqReCLjyiZD2mUB8ahqRKWSQzzH62SejN91Jf3yqHaPTzkf
         NiRU1mOa4hEE0vJB0w6Lb04P1I3GejW9R/rnWqhCmTCm4Pz8e1FX0iQ3ET4atieuDma2
         OIEg==
X-Forwarded-Encrypted: i=1; AJvYcCXioImgqF87f8RgeL2KZcCYk1XLxz6XPLCLOT0OPLUN3Ip2OOwPQzrTD58hFu6a49yWqFB6+Ufampg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KAeSc80Qg8kBTFo8lZv3ze7zxmhX5npchJbxZwhqekSIm7dS
	bw+qJihIDJ62Ftj/khLGIJww4knERkpKb4Pr2XrO+jy930AIgLsiTKmi
X-Gm-Gg: ASbGncupgbHeg7f5CeIzbfwXjo3AzqHHMFg5WTLOkinaKzZUhPFZ3ZMF42tMhfYr2lM
	qjbLdqW87lewuTgD9gBA3a+fxMfVA8WymhPMVmaNJGUtzZ7Hj/rOkzxPxnH93gAcnJ7GHZjwHiO
	OL6Zj6IKsb/CkSw/dQa/nxcK7kEojqP1WbGiRC2aw2PE3C/LtydagFQnwG3+QBoBjnq7KGau1Na
	bK2v2hmVVZXa5avboQbVQTRZBiRd7zZQEUHGq60h9wOv4bcPTfAR5/PLEyY66/4TJTQVu3dnzG6
	mi1VvOlwpx1WwGpCysFlf2Q8Fl2qwxcoOM4I/uAjxcYF4OPTirQEgcvtSqozBQHkq2NvSSOzKDR
	oAhk0Lzd6TeslTuHc0+N4zsK+uzaQN7bkd/Si7BeBxxipH4e8kJ6sGMu5hQKUgxp34JUuO/WLQa
	ct3+il583kmHLNHc7KTa4=
X-Google-Smtp-Source: AGHT+IEf2gXfdcNvdRzd70DEbnbwTZwMjmAbAlOFv57WQK8ZacZzewIz4tro1Hmj+L+IBaWx2B7KfQ==
X-Received: by 2002:a05:6000:4211:b0:3e3:921b:65a2 with SMTP id ffacd0b85a97d-3e765a49430mr86583f8f.50.1757611159699;
        Thu, 11 Sep 2025 10:19:19 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786cddsm3307395f8f.14.2025.09.11.10.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 10:19:18 -0700 (PDT)
Date: Thu, 11 Sep 2025 19:19:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH] clk: tegra: Remove redundant semicolons
Message-ID: <axjur75ks4ib6273l2xfcu3prrjnmxwro26ocrct2dgobw42wo@nan7vw4egkow>
References: <20250813094003.552308-1-liaoyuanhong@vivo.com>
 <175761090509.3229177.9207716245913935287.b4-ty@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hrth5zdfdtzr3exd"
Content-Disposition: inline
In-Reply-To: <175761090509.3229177.9207716245913935287.b4-ty@nvidia.com>


--hrth5zdfdtzr3exd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: tegra: Remove redundant semicolons
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 07:15:32PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
>=20
> On Wed, 13 Aug 2025 17:40:03 +0800, Liao Yuanhong wrote:
> > Remove unnecessary semicolons.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [1/1] clk: tegra: Remove redundant semicolons
>       commit: 8ec061e72f15da80df10d4cf29777556992074e1

Scratch that. Stephen already applied this.

Thierry

--hrth5zdfdtzr3exd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjDBJQACgkQ3SOs138+
s6Fnhw//aAmXHrNo8uDwH1S2CoJOmfSWtDC41SjGjRBp3u9JOSy+WFP6LFwj6G4S
aVy8AnD9COKvtTc9q/Tjg7YkhnyPc7mVrmgp5dCj12rvLNHt6WXYJBplj/lEvwYy
RnIjYvx4bnI72/nmjBrGrDV5xwX3cbYH1FpahksGXzwG/hd9C4CtbnTGgrkpqhB0
PzBQO3/O1Cm0HkSHAvvtQfWUDQ1cBbRsSdXLsNrBH6dz8+s4VIhxyBt/AcIs/q95
Sadv/LGYOcXGbjX163JwGtsCo4OcCcwunBLeoOU9ZuLoV1qfnUMyKiA8H2gsoKDA
OOPeqHwfGTuVv6TOIQBFmUxpiUVlqibPC/gfKynhc+QpPeB8iqJi6+zIlkUgfk8u
xNFQRKL7AejFz8fx+wn1u72O8WkAhlY3jNKzKcksj0pA9o8I6ujYVrl0lzXbRZI6
WAvYHeTurejO4yYNKvHKG8XfF9SGGOiYjI21fXvAICWPhZv3yz3lHWq+qvtJnXqD
qyyJau2ylyHS5xdijMZl9IC2dheTdd+nC+pQd55gezy1F+P8Cbubwak1XXN8lVbS
xQjSpNlVpLS8BNXw6RhwoTdllK6OcRGnpeROzaTJ3p7RJwABCt5oOak25K/ssylc
VP8wFE7EthPFDYORCcKOCwy/iBS8gtCKK3PU4/4ekNRiguvbq2A=
=YMuX
-----END PGP SIGNATURE-----

--hrth5zdfdtzr3exd--
