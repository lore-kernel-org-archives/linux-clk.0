Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849E47FAFD
	for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328727; cv=none; b=shpAqs0wO/NZFIQUN/73IkcRmlw6DEMWOlzltlTDTNR1aUVIOVF1MgJaFAW28qypizJrXsc72cEvgtZlDtuMFyud2xd4KqfQY+jWZi9MSab4La8nCht0f07FsOlyI4Qhj4IgkyBu0G8opz+6LFJTqE2NyAiEOhVFIMjzNMgvWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328727; c=relaxed/simple;
	bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/f5renSkKmrNksUGijIpnvx83jmECb7KId+5u6Z9A2nU4cOoviir6oA+8t413iDSAeyzEERRVmGGjtMt6qzSVbX4yPaQQ1vxc+zBi5POzwvrRew6siz7NxR/fC1LF5nNwiakm0n2Fm/eGyaPi+X5oFW4bqVFqwbyDP6hmfItYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RpvviNdi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RpvviNdi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so9346245e9.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2026 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328708; x=1785933508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=RpvviNdil079QTbzeNJSIzKAzCRM6N4fSPXOEQ+ueuNBZbx/6k6D6BSrNq3bvHHymA
         1QQq3QSUykPEIU2DqC4XfmaEIbpu3gmWggt4v1MtNk4WWQPg8TnwCwWvpkDMvhvBFV54
         Kd1m4Wm6DF2FnFt2v8WPAOY7MkQAxJyObw/ufFl/jYKk2d32zbZ838Wi3Prp3uPin7TT
         XVj6/OanMGmjX8nCshJtmHq5je2/Y4tST7wKcKL2E3KGNdJe+xRPUivcc1XbS3/d2v5+
         K2KgSIut+fJrwT7hp4+cFxr5/Iwck3xPELZxv7P7eMcNLchusIr83EV2K2TB1U1IHhYO
         adDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328708; x=1785933508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbiqMD+wNgf/uak20PPJVEhWm20pEqxlGI705rh+Bvc=;
        b=BsC0iJi/kmgZgd+ZA7D8MHlnO5exk1Lc1AF8GfUEKAJ1t7OLWQhiPCk5TEunFmivUT
         dA1FBNLIG9xXF+IbuV5lLxMrMUxeE7f8GzRaFwm6pC4L/OKLjEQGtEQkn60R/qHPQuC/
         XoPM/vc6BMo7a7pEGVAlVj7uQc0zzDqheBK6/6ctbj7bNqrlT8HwvjhxKcw3Nye6fse4
         ZYDB1UsISTBz8MSKU0BaSiOREjcU/gBVFZfuMHUSXU4jG6cbhoKmmMcq28PiIIyPkcV+
         r8xqlPQCO6fIyyuHQACa3Mh6zCcydj73mLBfhzhI20gYN/Y6HCF5yD2yLyMRvzqBQs6h
         OhGg==
X-Forwarded-Encrypted: i=1; AHgh+RofMyZBYsxQkp56v3rwHTyiVT1sj4hzEmH584OXLjz4J1oJEcjIIxDnhkAiIjgy4IM83cRnGuq1Ixg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFxuBmmCSd9iZRpxuF4maGA8SqZptAA6wIfiVDBSGlEkWrqKc
	0LzO1L3TmlAOGi2/LYRMIQnLrx2N7cmQhcjKeQ2JSg6ISfucBOiOjMh4vMpptAydKYM=
X-Gm-Gg: AR+sD12rSpTAZV7LYVnmg74C5THpjBEk29G1S118rSpiwdEHhm6AasRqNNMMVnAs2CV
	jnftNJAwOhcu0w4ZmrngZKNfFNlpCUiRLACvpQXmtF+nOqqJNvB0qQUpFcR7eOWBAnODCqI/qF1
	awND5eFetBSR7N1CWbRnMR1qu2eFPUTJhXGS8J0LYqbyFPc4NqxKy8YXOW/ovqY9y0Ei+562/XI
	j3A9P9ySxB7xEXW53QmJN/aKv/wLKOWsyJPrUBZ00laVibdGmsxl54i4+Zru8DeugwydHmkiQ34
	EEx0dp4kyn5muKb7uGkSbcfKCrh0AHe7vgQobVVWnDaujDYWMu5woUK0em8KCxhR9p9eyYdnD+V
	QlOuRDQujNEeAW8UHljP76lZ5itCLGp6U5ueXuKnrdaCahM8FwpHX1oMOKn29CrWljWJOxeKvt8
	ePSP9meGBJsnkaWkmRff7PMFzOJK1NZ1WDiboP1pqVQj/lIZAzwBaObjDiYWUS8P+fgxwsC0eeZ
	G3rbX39qxiLfFB8XDEN723peVI3HsmRklfke64c6Qx0GDZbEiIRDhycyePnzQ==
X-Received: by 2002:a05:600c:470d:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-496c6431be1mr70896085e9.13.1785328708527;
        Wed, 29 Jul 2026 05:38:28 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fb6b2768fsm7708739f8f.37.2026.07.29.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:38:27 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:38:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "raghav.s" <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com, 
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hajun.sung@samsung.com, 
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Message-ID: <amnz5qkX_zeeVUjU@monoceros>
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
 <20260728121111.2077860-4-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="upw3ihnr2pijnj4s"
Content-Disposition: inline
In-Reply-To: <20260728121111.2077860-4-raghav.s@samsung.com>


--upw3ihnr2pijnj4s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
MIME-Version: 1.0

Hello,

On Tue, Jul 28, 2026 at 05:41:01PM +0530, raghav.s wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id
is available and <linux/mod_devicetable.h> will go away soon.

So please don't #include the latter.

Best regards
Uwe

--upw3ihnr2pijnj4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp9D8ACgkQj4D7WH0S
/k5ORAf/Wc6gzSRyNn1+1FIXBR6MXs+6IigrmrQ45vjkC74pGi8j6I1XeucCzzuf
1MhDeQy6g8vGye7y9b0BY3nTOx4Lp71Zbgl5eF30pEKPBi8A29Nz6y0yfEjFfbS7
Vprcpq2dl7yiq22DXzzRBG1/XXhrjG3Pq2NPlpq6GSDvCMlZi32b2L3soaUWPgKX
0sjawB7A1voa8wd+tXglN4kpRiLsPK9aRac8r8SPIhAu47zAJTlbfNWLR43a6vsa
VFQzmBIw5G+rfDjtBYaLwxNtvlan+97F/lQzGWG3JxTwuEg58TM7GmSdnJ92jWRP
Tyk6i+iZlV8rbsX9EW8g/KllvAmioA==
=kgeI
-----END PGP SIGNATURE-----

--upw3ihnr2pijnj4s--
