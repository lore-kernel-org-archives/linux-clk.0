Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB43BC680
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838772; cv=none; b=nqagt+w6hb4TxjAQOvk/UlLVMXrcLZoAEzKk+0exVx3N4sZNV9Lu1Ex090MFnlL2HzErSoIYXJggW2Y6h50z1LmTCUDdxu4G4dKk1pmmpN2jDizX/2OU4pTkSnlAJVk1b6xM98rmptup6opKuYSRN58e5GU9ceTGiP2yb2rKX6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838772; c=relaxed/simple;
	bh=FveIuuZW3MWr0DW5S0AtbDNefqSkX06Xtrdwa3y5Gzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAkpzh8QnyHqQx0W3DDdDIglY0MoK1os7oqKhP6pETBvOLMGbh8AmtyOojFRHeuvcYEtQ4w1YeT9GpFQ2G+Qj8eFS4AIkYyLNK11roR5fIYNQg24SsDkNBlR7eWgxmIUW/VnSOa1dAaZzd/EJD9bZc5VGEOpytK8D5P5m2TNWOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HMv/7z6x; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HMv/7z6x"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so2178159f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782838770; x=1783443570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ToPfySYGPKghPkEJRrJrIYgPfvQVtZ8t1xpbJGBGmt8=;
        b=HMv/7z6x82U/9firCQd5Xc3oP3uGYVM2fx9TKGFGMYXYnHTvKWKKmfbyZ2z2t7DAvB
         3EAepJB16g7eLUhHebRs95S8JkTZgAYRJL7BPaRKc0BsGG9PDV7yudPm6lbxJcxf0O3X
         SuDzqsCYm9i47b+uEEp6R8x8e7lWtSVd2GusKejdq3kouLQeXYkIYqtQsKkJGox1vZgJ
         XG28bM6A2rAhPydowd/8pKaAfJON4PL4yF1PTLDayUb/sO2PkrhoPpFa7z4RiCb8KJUR
         r04R9pFDfCTBZMeE3eCbIvfbGefKgA++pu8MfwbqQTv30HK+MmYigTXXtBQvcJwg6o9L
         xvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838770; x=1783443570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToPfySYGPKghPkEJRrJrIYgPfvQVtZ8t1xpbJGBGmt8=;
        b=r7XCxQcBNvqZFoGS5sNmubGxagNyy/8Ef/6rQHf/Ow5z4Mlz9bAV/+Ea4LsWJwMgno
         TpsYBn23fTuU+xZxlSqgOUizuj0S7XFLmPmOBgj3VujT7mCiERS2YYvhINVfgwBrQB06
         28f6FwlYkFQNyGKiwdotwdp0HWnPpUUKZLx9p2kFWsfbcAkfKhP/lc5yvcTokzXX4+hw
         tIctdcS0GtfRZC5Wi34fEG5A6Ga/6XK4c09OFC/FxAPFFaBnsQUpV6WgAIMDF6ySg33H
         HuKYZCuif/ZthsjL9s4tMNveFxnwpfQWeTHgdGXQOQbRL2p0ZNZxhmWV/a/YRkF0PVNS
         DCwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp56aJ2sQgR3SNOfPrYjOegVKR3WnlH3aSvyzN5QIgIB1HG7yVfWKbTrmnBIs+hfO6PTvhkEei54HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsTu0rbqOtI9tIOZ/Jtgka5m9Q535YvYFQn5CXkr4db+D4rrSu
	Tcu5ViMnwnjkJplL/0/4wlqxRCtgC5Qv3cCguS58d8WFYW5tevN+cvda4yJ2bF3UxTA=
X-Gm-Gg: AfdE7cldA0BBaRapSyH9/Y8gJMyH31OfyBadD5kTIgrjFAkOwUD+w5gVD/bGwVL6zhT
	KhlmETK7HDtIhMgXFSJzgjHYCVglptE6nJYl6k43BWJtrTVom1BYOVT2q+730GEmUwfZQt7KNha
	fEPqLf1YFYQK/UBqLPv6aB8cBCCr43NT+PcJ2jUOIHj6Hw4ilAIv2/1Y+Ep18bjQD4MAlPJQ6Ua
	LV65SN6C3amDSD07Of+EJmltHrIJKYHF0KoMgIOTJ8+z/8LQ2UhKcbiG8c5KfcNelgUfpi64dF4
	iR9tXlQh0G23NJM7guXuM8IktXG4/TGOSvcQByfnH1ydKJbGO8L+vfiheMzdWIbN4pzrEfWKYmR
	zaKSZ5EZOUz8e3v9NXuvS2QsFTcUD2AO/MsIgKtDXiFQct1/qZ00eVA0oyuhBU1IzswtQc6+3jX
	gSPWXy2hKWTsGRmBBn5trMGM2PIyRbbHYjGBASVfggcRECxKM4G+9/z7jisW8DmhzxEZ5tktwgz
	bM8
X-Received: by 2002:adf:e44e:0:b0:473:6e8d:7f8 with SMTP id ffacd0b85a97d-476586d066fmr1739874f8f.14.1782838769975;
        Tue, 30 Jun 2026 09:59:29 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47563d194b0sm9864992f8f.1.2026.06.30.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:59:29 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:59:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Subject: Re: [PATCH v6 2/3] clk: cs2600: Add Fractional-N clock driver
Message-ID: <akP1uxP3uDp9er4X@monoceros>
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-3-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uank47bqgvhpmjv7"
Content-Disposition: inline
In-Reply-To: <20260630155549.824059-3-rf@opensource.cirrus.com>


--uank47bqgvhpmjv7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v6 2/3] clk: cs2600: Add Fractional-N clock driver
MIME-Version: 1.0

On Tue, Jun 30, 2026 at 04:55:48PM +0100, Richard Fitzgerald wrote:
> +static const struct i2c_device_id cs2600_id[] = {
> +	{ "cs2600", },
> +	{}
> +};

Please make this:
	static const struct i2c_device_id cs2600_id[] = {
		{ .name = "cs2600" },
		{ }
	};

to match the common style.

Best regards
Uwe

--uank47bqgvhpmjv7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD9ewACgkQj4D7WH0S
/k4xTQgAjU7n2LgMUu9Q0GkPON5In9ieUddR+wc8yV7m4IKTBvEFVmoq69UniHC6
uVr+Lp+vDSMKPXAm1ZzppVFCb0C6N2GlZpg++smO1/ssBrCHxeCn0j3WlcgAy3rL
2/o8dMDwYk/kfqYNoXCnYHkGE83aPsfM4zqFlz0BZ6vsOPdAJ1g1QZIgzjPEEGgQ
+VR0HuiIFc3OadpTDVnq/SFN4vZ8ONt889m2O6SXWdnXM6Z3Bcf7CC2EwpYJpwXb
Ov2Qvu+f52plS8czZ++zwS4ZyKpAn/gNY48tAW5Ax2gJHYo+XXq3lC8U6zecvRXc
zHXTvrJLZCC0s46GMcVdh5SbgYP2aA==
=x3xX
-----END PGP SIGNATURE-----

--uank47bqgvhpmjv7--
