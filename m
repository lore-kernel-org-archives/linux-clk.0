Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778EB284663
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 18:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750270067; cv=none; b=fRr0BVJu4Rt1bD33l19RQvxEX5IgfigOcIshl+Ehbczuf3nwyeqcbJUoIVrWhPmVtMdjbcF7KF0k6KvOHU1U74Qc710s27N+mP+efNakryxSz2Xb3+Jv4V1NFC+zU4EBWwOJr/CinfAHSMGvMnLy9gY3H72c/58RR4bgZF0LfXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750270067; c=relaxed/simple;
	bh=OORpbyIv7wOwpEmO2nAi9DFYlQJd4JcdOYUYd3nnzKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKZCT7QwAhQfgOK8Y8DMgriEnIdpTLHsr7Re+ePc0+QtKYUDEj7hDfAdOb4uHlTtbt+1ELEGRf8apIYnXnoUb33SSUg1404MPKk2lgE4gJN7R6wuF8W6R8nB7YaVb/YOtvLV0HF1MZxUQMFoR/IllT8ynCtTdUbiMrdE2QSijzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EQZjs8nJ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EQZjs8nJ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade326e366dso1332810066b.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 11:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750270063; x=1750874863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OORpbyIv7wOwpEmO2nAi9DFYlQJd4JcdOYUYd3nnzKw=;
        b=EQZjs8nJwxLaHdj9QUW2xw1qhApkKAfBwm1OMQc50WMvianu5HAGSZ9Udt19sqHkJe
         kRvea7IaDWNwOUi5eaYKqBY7/+FXvion6G8Y8YvwCWRJR0lvGtYyikEMWDaOJ5N/ayOF
         lBX9Gh/9put2ibE5kvPRn6YbKszROjcYaIAde3aoiVwX3L5Qi65kyO5zMRouj8dtuyqS
         kqV3IG3UpMQY8xlMx1kfYi8f1RS0epvOw4YDMoQFhOWZZJ0lc11EQw7JclvrRwGQdlMu
         tyP8FCu5uYQmkGIu8klCRdWnybqJly0KdnlukOn0c2by51YPY8m4juCIDZ/2q+T/EImn
         Veug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750270063; x=1750874863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OORpbyIv7wOwpEmO2nAi9DFYlQJd4JcdOYUYd3nnzKw=;
        b=j2QciGzuGn2H9aZ7jbANXu613q4oIHuivDPazLQTEpg7v2c6NErt4dw/eVciIRDBvR
         /JHLQ4S0YXXtWn5zRL2lDYx9b+HV/YvpRn4b/wNM2vSM0Oz1AP/5L0a+Ot0KObjVlAHC
         Ffv4E2pKmlxsDu6gvxUiNr6ZSylYj35W6xFywq8m2bwNSr9mwx8jf8qaCdtgLwuKYqfv
         svJQuffMJdINrQPBC/pay5ASSWsDq0FatD89eYWdj7YrtxyByiT8W/aw6iM3IDPBm1HD
         EPzvPDF3xLckveHCXIDAF2hIXOjqRCzH771CwiceyieQQqUBp3vaHZ6kpu85KokJ+Kic
         MKNg==
X-Gm-Message-State: AOJu0Yxy+3+00+rhaEOc6XCSzeUzBha3ZiFrkB0ZR+yEE1fJrIe9PYZO
	3jTWj6dO7iJwBt9Mgg2gq2cx6MxzpZ+jzCvBvMGHXdY3iK88BDuZ9LqwZrCG5zZPRdE=
X-Gm-Gg: ASbGnctsaock2fc+VWKNeOli8r7QiOyok1pWY0qvCP2myVVTm82HbmPGhsGxi8EIXgp
	6dQ04/pEf0I4Rs0+TTEDINDxXO+dM92ZXpSBW77CDcd6pFc4+KSrHPDxSjjyCQpxvbYmaE9ihU+
	PuwTJSgeUOE12v3rdDbgXVt1hACcgtcw9SCO2c3iam35V9AVey0SenHJ17gqoQh6wbMaf42YY08
	MzD1kZp3JWvVD3sIC0XO0RSf42eG/0luwsBavF1AHb37JO5MB6XNdidoB3Br8EXsGLQt1xEbDXt
	YI7jUrwj8WwHjQUCoLuuCuhRhmlxTvDeg6+5Or8IAb2z2lZrx+8AnllXIFrRrfU7/3wU1eCidP8
	HMLrUD8j55lACZNogF537m/arcKHP
X-Google-Smtp-Source: AGHT+IEN1axOTTyGZ+47pb4M7RuhULwD+cCfnYhjQipu2S+AjBZym/amFSpaw9xH663+D6RVqndEcw==
X-Received: by 2002:a17:907:d86a:b0:ae0:1dbf:32b9 with SMTP id a640c23a62f3a-ae01dbf4305mr392573466b.5.1750270062644;
        Wed, 18 Jun 2025 11:07:42 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec81c1fc2sm1096774366b.59.2025.06.18.11.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:07:41 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:07:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: pwm: A few improvements
Message-ID: <du3xj5fkhw55oppor3feyk4pgchprcog2ew2epaixhsvf2e2sm@humm6imft4sp>
References: <cover.1746006578.git.ukleinek@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="djs46wk4reaxddc2"
Content-Disposition: inline
In-Reply-To: <cover.1746006578.git.ukleinek@baylibre.com>


--djs46wk4reaxddc2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] clk: pwm: A few improvements
MIME-Version: 1.0

Hello,

On Wed, Apr 30, 2025 at 11:57:45AM +0200, Uwe Kleine-K=F6nig wrote:
> my main objective here to get rid of the call to pwm_config() as I want
> to drop that function. While implementing that I found a few changes
> left and right of it that I think improve the driver.

This was sent a few weeks before v6.15 and it missed the window for
v6.16-rc1. Is it only lack of review capacities that there was no
reaction yet, or did it fall through the cracks?

Best regards
Uwe

--djs46wk4reaxddc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhTAGkACgkQj4D7WH0S
/k5Z0wf/Tlso92kkFmYl7I0XH0zZ6HdaBnkGzptHXaL8Pa4NxqGBmLEXacmsOWgm
5p0F0KVYwDJ+dbARBWj6nZ51WSFL5Gec4SQ6qlD3u70cYux8A5NwlLkV3LnW/GUe
4wx1XJijZM+p9hZAznin8V7r31SGH4wZk8dEuAvH9AKvEy4DvHPWAC9JIWUcc6Z2
+rRaCWZ5aEnbPuml5e6tjC0oRhwmkho/e8b5Brn8VF7Grz7WT2rmFzJIxj2iUHSO
RxQXc5Rz1obXSeXxz0l/pmlXiifrFreVoz+KJ9DCKhfjB3afNxbkzfdyvU0ufrL/
iVNHHVXnk0+pXpARy/Dlq386kLQsnA==
=nDTk
-----END PGP SIGNATURE-----

--djs46wk4reaxddc2--
