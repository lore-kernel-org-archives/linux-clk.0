Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF63B428492
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556498; cv=none; b=efE6BpbDf63iJMuN4VJDxPrsxQs2hKQaLeLj9uxHkCUiI/CMTsKl9kMyM9PTWvsNj8BuETeT07dYnxj7zFF0BlByRP+lwrHYdZ6hr9J+AisSEl9Z050BXZuG1y04rLLj9hX2w+Db8d+HvQNL19Pz5I1Zf1wyBcTVLX/iu1m53zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556498; c=relaxed/simple;
	bh=cbNlAQD4vaMPcdCTyxOV3QscBcL0a5EhES5s/lF1+qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFoF7qQBemCIOdszNUpYXAvb0JrNJUGhUdQ7AwP8j6j+ydkVgyou6AimIJLGA0240kiocImXmwpdjdAaUm9EzNqlUjAeDxBrn9m1bDBMtiKYKfhKq8O5n2pMOVrXHVkGy7gGiSk4zxvrFsNzxpUX7KDNMAtVdhL7X0yEATYweDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iYD4Md31; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iYD4Md31"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493f75f7172so79935855e9.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784556494; x=1785161294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cbNlAQD4vaMPcdCTyxOV3QscBcL0a5EhES5s/lF1+qI=;
        b=iYD4Md31igGBFwYYpHorK5kAQUlS3FwGaZcZLzjZHXr6IGL543fNkr/30DfpIeNAns
         5WgX//L2vxaqFmM7JjUGmKzqXf/jOtnVmIviZaBadigtgJOhuaASKVHvyPYadGAdUdCv
         T/yL29YpfiBtWxELV/5edoi8duI64BDsoA6J3b1gacLCme3IhqXoATj+Vd/8o+mWDsPD
         GRiT3s1LIZ1za9HEAraKb3TzX2F2wN6pEL5nN7RfB5W7MMPqxeuFwvXS7GEKhDlWgPa/
         BQYvUs4Z+TnBdIdbSxu7Fwrs1bdEpD+3kHHZ/hus4gQ8XKHgYQiXgksc+D9CLxDWeSCC
         KjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556494; x=1785161294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbNlAQD4vaMPcdCTyxOV3QscBcL0a5EhES5s/lF1+qI=;
        b=kp7eH5mCXUIV35r94xa2Dh1soYlXggVF9HGKMQgwSJ5loOsgvjtbdeioY3iuCG4u9v
         OMdshtv/gt8iu/CCOQcKZtEEUpKt/0WuHkoPl5ZCDs4fkCIuo70o6Oj2WJAMLERZlWvd
         vPWItO+nPDT/+Tq+X5efiQr2+u8/sqYsVVOHpktJGab0Fi2AF0I0wWshg2g5cUpE3zaM
         skGpJ8bht7eWqhKUE0DfaG6buAtCAUDi5vAD2r5b7zSp6lDsrt+a+9k/qPJNArrHqyZT
         +02f6gerMefk4RiQZsLZyzpjJ+kfnmjINhFzmtVUPW4xxZDmHUsSZDlgTiebox9d6jeX
         QJQQ==
X-Forwarded-Encrypted: i=1; AHgh+RplDJ1AtTyTcKinsZYGBA3WAtG36+9+sFaJEUruc9u5NBZ1SklErtc2/xUIWOpCUU86ml1zt04BkKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1708UQ+DXUohY2zvvJhb2c9WDIV9Gjk/RlaEF4w7aZ+WHVmC
	TzRxPue3EQryqsIiesQ5Ngef4nmZ/Hc9I5D7TbY9gkJ4YhLBhcangT3XSbv+kaOVQAg=
X-Gm-Gg: AfdE7clhAmWo+35ImnVFs6z4yN1LJ7t5cWK+xj8R5ywNgUPAw6mHewdRq/MI/UIQe/7
	LcpGfUYiJ5PY+NbQ1ZKEK4z2VkeeIG0tuTbwrPOM+LwuSrWGiOcMX3ieBcIsCVuXP/NBkfeOw29
	9h1H/imceZF2fubyP+NMgpqEN2Xg1IiCzgsIHIqTntPS2lkPYGBEo6JN9RBzlBXVkDk32x9Zy0U
	apnmGJ0x5MDb6d/2VypfVBiwiHXq2bpMbzZcoHzqFC7mzNbdcr/JkmWMLPAob4cZrgHeiEc9jLu
	IBOHwMPGhybSwEH/jV6PMJpY9Jsf2+8NVpZ13cDsHNhS5xk9Klj4BmblCKtl9GCTdoMYzUDrpHc
	CjqPaigQ6JH8yfefe1um6XwYz02PddCvl64YdtT2bA1s2CvXvu7MSHkQ29zQh2KuaFcI+exwuWT
	OrZ+H52cZ0N6SrHmDasLC9QvueZiVH75F1dZ910mQ9ElqqSm6zWpSL7RP6y6Dc4SqBIA==
X-Received: by 2002:a05:600c:4714:b0:495:3f84:a792 with SMTP id 5b1f17b1804b1-4954a3ed494mr166218475e9.12.1784556493925;
        Mon, 20 Jul 2026 07:08:13 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49548e0fcdbsm241920195e9.2.2026.07.20.07.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:08:13 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:08:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>
Subject: Re: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers
 for platform_device_id arrays]
Message-ID: <al4rKFweyMy-s-MH@monoceros>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <aln6H4A2QTO9w3Rq@monoceros>
 <alpC8l8qPFL955ZB@redhat.com>
 <aluuES750vojgH3q@monoceros>
 <al4QKxSTz6wd8EsW@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elkpkh5zbtozz6y7"
Content-Disposition: inline
In-Reply-To: <al4QKxSTz6wd8EsW@redhat.com>


--elkpkh5zbtozz6y7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers
 for platform_device_id arrays]
MIME-Version: 1.0

Hello Brian,

On Mon, Jul 20, 2026 at 08:10:19AM -0400, Brian Masney wrote:
> As Chen-Yu mentioned, I talked to Stephen about this at Linux Plumbers
> in person last December. I'm interested, and given the importance of the
> subsystem, I think we actually need even more people to help spread the
> load for a healthy ecosystem.

I mentioned that internally in Baylibre. Maybe someone among my
colleagues is motivated to spend some review time for clk.

> [... quite some things that Brian did ...]

Judging from where I stand, I like your efforts.

> To help with review, I also think that we should enable Sashiko reviews
> to the mainglist like some other subsystems currently have enabled.

I created a pull request for that:
https://github.com/sashiko-dev/sashiko/pull/349

Best regards
Uwe

--elkpkh5zbtozz6y7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpeK8kACgkQj4D7WH0S
/k5/2Qf+O4s1NjIClsUopbDwnf2NJHmB75jAu98JmWQUg65K0qVtWdZCfI8ttiBk
Wm+Azs0ZTBOyDVtm14/fc8gUTB/AEU0wK5OasVQqNYAzxLZIRHLyL0ntYtE/3LaY
yazydpoA14OiMU2jkjHB/HUS9Xz3ROop5S6Fo344g/Kgucggpj5taCSrxocLkVE9
vrw/dLT9oueDDRrMHIhA++ZLkWyQYYIdb8Vw/gSTpA/1GJyh6fv2bkRwwGNg/T8+
2N/7a/6qi5Dco/J9axsQy6PC8t3i7XZSGcyoMdZmbOib3avMBI4Z7QHadGOeo3k4
Qb+8M+0Z1w60kvI29dr2AkK7SS5t+A==
=PHkx
-----END PGP SIGNATURE-----

--elkpkh5zbtozz6y7--
