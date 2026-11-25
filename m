Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607024;
	b=cD6eYpuS3VPQhe91lGJObllxulolmJJJejBrFkodyHH7zEwq8868ozAAuC5jhyxtKbcY
	 /NP1JS0npU0SMnbv0YDDMxWkl8iGgqwZJtb3EAExd3WytiHTk+00FuyfQxnLwqbd45atl
	 lL4Ls6t5s2EYh/s213i9vNCW8PHeute/AA4SS4gi2a1iK5pNMZjsgNC0db/vuR/KvGgLU
	 wFPflDFDP07LyXlxPTSWD8r1S3tc4TXj49qK/EcmARVUlqYqtFH6pKra8l1jCJvhpszhB
	 7uy+R6DltkXSOkJpPVIJTicGIcXXjDjVN3SyK7ajUlVykm20ieRin1PsfE32mZ4VqVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
	b=sMqQM8Og7FcCye9bgkY2Kj3l7xwM4CxDh3RY5b3fzTA1WCKBXx8OBJILS0LUr0DUV/Fj
	 QCtlf84zVx2JLEYSmt0ePtdFW4BliM1/wrt6DuolFz7mxnMQGmZF56t6UmciOJRlwBb/t
	 CGdwtK7iivtn2PPWzE1IwC3pIWJjLrfIYnxAlEnM/kxlMpi0vnfJyXpj/U3kSDezgqPOX
	 /J9eRJtrDehrDeGArGPs63LSjQF/Al4k777IjNFsNZsOZdek41574Xge9eekKiY6lApmA
	 +ysh6G9vrzv41+avSfEjcmqGJNrCj5PlqK/N67s25WlBZ9gYGwiHdiYE5992fOPs3SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CMRkec4k;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1BB606A327
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D1BB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CMRkec4k
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so58025055e9.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795607023; x=1796211823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=CMRkec4k5ljHKroiikKHK4JTT+TkveMrUsH8OoShvX5KDi5dPTXWqpP2Mbk0Pfj+6J
         Er7ZpXo+2y75226hO+joL+YszbhdM1NRWuxPLKAyEB8pQpjz1DidQalEl4a1lQ4YS7ED
         PL4+0pNUumQ8wO10YMUGsK6lehpVDiG+BMkjoy4YS4BfEUqBSeD2540gXMl05mjpyHvn
         Z6XMOy1+V20r7LVyADNHTgzJf7i9eoIe0AWaBGIGdOli5cuI7uHYFKWZYtWm8k16wUcQ
         m7ZJwnhUp3g4R6xsVYm7WvLZ4+yPkzw5DHQ8jmCE/dx+daeVXeaBXSP0HABTudNC9Z+O
         S0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607023; x=1796211823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orbQl2N4vlIOWiLrIf8SUWQ1uKxLJ8cjnJYad+kaD0M=;
        b=mkm9VeOe5sc8m/TNYkba8Rgqxy2gd6SvegQGzyAxIV+Bs21iqtMieMxWKmzGAh+Df1
         U7hIdKL0eQuh2CVOmk3TNvCL2itJ61zAe40uycT9rJN6eIFtp3I6Nd5KK7HY8hH0RE2l
         dP/3QhrnKaHvLt1D6JuKJLFVPVTcADEa2GQ1hHD/YU6cKsO7+0XgFvDHmdzJrs2snQnJ
         nC3Ldfe55YXeVyPmkydyCr03KJFFQxptyU2OuH+Ubur9K2FCOpaD7YV7oDfFm6kDb0/t
         B9fxtHkvA2Qra+lMbdZyjRr0ePghljUxfNA/qdZufHJFf1WP0iHRfdytykxTRW/9n5Dh
         8HSg==
X-Forwarded-Encrypted: i=1; AL+hErEZ8ywxOcc7qXsgQak8XvgK5ve1qVLoS0aW0FZzk02p+mv48y5M2p2gsVZIgnRPX05ZzslfMzYj3xc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/82KSWPtSaAPS2DIt2TsPdQSzlD3gEu3bQ5oUmjxwvsSHhpWCb
	U/zAWhj6+ijRYQLry/LkIb5Z6fGftRGtQ1yxYrjO1pWODaqQ1wUy3FLYCLMr1HkVctg=
X-Gm-Gg: AZFdTZfD8CoNHCKhUbIZxoZQT7/JEUyARcPvIkMn1beCjg3OhGPLgku9EXWMxs7Fo2t
	xQeXMabWu9a+N3bY0b9bKgrFXDCR/a5uP0BWc+yyca6dYqLNpdLA2Gy7mZRZcI7aA/m/mTjRRfr
	Be2HsNQP/4CKRg5Z+vcwEXkZGOyx59/HzLqyMPtbJpKvAmW3Kiekgu/gOengjawZjf0aOd+I+k5
	RT7QxqFbBuui4z2LoadiOZMlHqWHlyS3q6LpM9nXJbMfThrmrN9YJzXt4reqRdpFKXumMZxkSJA
	qe6GuCZgIf5QcB/L+KFKaUuuDRwsnwSdrV3I1oMeXHy3dwiufTM8yj+01MeBhkZ5wlc+L0/DkrF
	KOrSRBQnxRwxURA/gEzyloOjErU8cI7fF9oSx5lyFVJx7a5Y3abYddk/kpciprCWGDONjYs2xyG
	Zs6WR7mQo4ep4pIBJBtBrZQ5LzAS5RH3mrwFgu16QYZwZNHg0ndiofWmptJzL861Yx8/Itbdo7a
	2FH+2Cl2nOY7t7GZV2SsqUmQKUlUHjKsB2rfwKTZ3O7POCgqjmTRERgKroewkrp+ZNmZMnsXZX0
	otbOc//f5gZBc0wOnVF7B0pStILlwH5BXZr9KDTw+8lDPCAjtUIePeru2bpLDENstyR3bUtG6vB
	NXsmzPEa71QT19a3V
X-Received: by 2002:a05:600c:4e0d:b0:4bb:69b2:d3b3 with SMTP id 5b1f17b1804b1-4bb8881eea5mr364570665e9.27.1795607022789;
        Wed, 25 Nov 2026 03:43:42 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884865a2sm527753115e9.3.2026.11.25.03.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:43:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:43:40 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awbJUwrBQw5TnowW@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huwbq4lvetfh3uwf"
Content-Disposition: inline
In-Reply-To: <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>


--huwbq4lvetfh3uwf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > +#include <linux/mod_devicetable.h>
>=20
> Please include the specific <linux/device-id/*.h> that is needed
> instead of all of <linux/mod_devicetable.h>.

Or better still, rely on the bus headers to provide the needed
*_device_id structures. (That is <linux/platform_device.h> provides
of_device_id (for patch #2) and <linux/auxiliary_bus.h> provides
auxiliary_device_id and of_device_id (for patches #3 - #6)).

Best regards
Uwe

--huwbq4lvetfh3uwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsGyeoACgkQj4D7WH0S
/k7XEggAlcj2TrM3p6EXOwI/xsUxWXF252CxwyEWI8ZmPEpI6bAu6Q2vo1jWzU80
RgNMuXczOoZoJ6+hJdkMeoqHuhp2FPvl718ZM9+ZXmIzmzCoBNWIn7I/StnNApVp
CRTaJoMc3RQ58/iAEYs4Bd6kNCpJoojOnWxMnprqZsXFWDmYDOaKauDIqnRyeGSd
Y/roBTL3HpvnWDZxm7b51fG8984ltXAM06Db+ZRdnLxyged3B5xdXwcFGLlqeoKG
ti6pQXYhQnxuxJFTg8v+DdOAKp8wPe6CkjTN92KfVvWDgxJYHe7zwZ1V0TrgDqMQ
p3mJ8Bmk3uxwBcQfM5lzAgDW6N8h4Q==
=fqd8
-----END PGP SIGNATURE-----

--huwbq4lvetfh3uwf--
