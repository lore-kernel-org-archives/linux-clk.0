Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E0E2FE56D
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565515; cv=none; b=gaCmSuuzlrDSBce8jqQBwFchwZ2RVOmYwq/RXGE9E9kRDhRHdWAXKlR0/1M+BhuuxNbP8ghorxV8o0cZsEf8Fxe5BsNhdq8MaV2T5LAdGmfTTXKtpRtikqZty0AmxS0P8lr8TaAfdaunyXwXtY2E2i/BQ+NadqJ6Cjl8Vr5w9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565515; c=relaxed/simple;
	bh=IjpBU42ntX9XaYmyRucOHQzBqWEweHkDi9vYXmN8LMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYi/oMIK9iu3HmvxvPK1soVjgi8eaXvJLGEoYZoqAecry0errlODFEK9/nq8CVEWubyQVFJF7UmRjMaPpmiOk8iLr5y6nwfSYFFHQDadd+E4JZUgqGcKyk8kGnwoLmSUg1Xf5CJiauZ4W+jWco4E/SQ0JAT84C76PR0dXb2kgG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODS30pIt; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODS30pIt"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378d50e1c77so41149391fa.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 04:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565510; x=1762170310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3bvBuQH05UYV7qQeFG6dlKCPrhvCySjKkIncy7Gx44=;
        b=ODS30pItJia4v+EkFJTKwrB+i3DItT+o2TLpFP3zZnYPf30k+e3X/2CFVI3LZPYyMt
         /A3bOyjc+akTrbysEXVFYcA3GtLMHmOoCJfM/a65nt4ywNaerdGGp7ig883OMS7C+Rhw
         QTODaKXbrQhd9TQAhM/W0e4CJsp9wR2V7eHqemIgavolDfE54e43gllAbJ8UfIeis93x
         sTQGtT3tgwYUXWeYarCaWM6ZpfJ/Mjgv4jDsdDHvcntuB09SG2FdKVhnHVeswuhVyQOq
         SXxsSy5BwY5kw/DX1PNL/b/tJHKFWMYWPgwYMpI//dqEkWZkM3pzEe2QOam+okXFSWnf
         eYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565510; x=1762170310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3bvBuQH05UYV7qQeFG6dlKCPrhvCySjKkIncy7Gx44=;
        b=n+FjSqlUbgTAgq9YwTJy2+sGHDqqkGs3Y55XLWh+KlJNK2vWKBUNYBE+7RwPxgqbqE
         Aqjca1askbJN4UnOmBtP2pXCjJNc0f1fQIBjED+VR+NFjxWNr8ME0lfEWimZqKDG40s6
         gf5bwR09JT2xt29kD6Cz32oRjslYQ1KA03i7PqTk4ox5t6alKvksu9H6UPeyRBg1yxm5
         eIJMizgcvjf7Dcu0QOx9w8aQZTb+DB4OXRvEKUCw9dgvWS5FagmC5+wSfQO2pIAa5eI8
         PXUW2g0TY6AcF17VfA7JKAGLAYvNW2rjLCrQtCr/8IXxLsCQYttMwxz4pUapuIM2hjKN
         BLWg==
X-Forwarded-Encrypted: i=1; AJvYcCX0i8STVUHlN0SX0F8CXas2AX6wDtPymZ7tK+a47/SvnlF2FzjSv9oNkYjJ5HD8jS+odR50ksJ3Xbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGI1EgzxykAhC24mCi26OibRpNd4buIaowszHiddne/sfEtv/
	xI4D9tXlBp9cZjXbdWPeMzTSrlKSxjAIqZNXGaBzQ5vPNdUynynwEthN
X-Gm-Gg: ASbGncu6E0wQodrYB5RBv+DXsw9m2jpyK9NPBrtn7XHqBcQ/k4lGU1NVk8k6JmIO6Ss
	xNhZ3cnTh5aC83/j5zZv//CNQaF4dewpj3SkyBDoNzUjdRqhyn17FglnC70X4pytKPtBls+iN+2
	q0xD7k73RgV1gxmsax/6drv+hy+QxJh6ejySut2L2OigMjpLwlSlUkALFF59Bb/QPe+0TSaMnbC
	5ahS6Q+zR50o4nih/bTBcz4SPloaXpqttGoSoR+RHirpqzXw9zqsK/c1EfeMTVqT2GBpt+ptv5W
	Yr6TRPzZqeKb4OFAPosZ10ea4r3dIw+d3pKzvm8AI6cqSfiZZYLZMgOI/LVpyr6I3iwGEYhzDK0
	ooXo9oYGgvT4nRNDg9NQ6VpuV52n4g505FyjSsm40zN+HFEqWq2PPAhkqi5qXmfhIGdVtiYZij+
	VtWnTC0Oc=
X-Google-Smtp-Source: AGHT+IG040q7cqWV71VuTHnX5coaOHS5RsTVRj/7BqmGOTBNKnaNhaPjcm0wBLEa4smz5wwn4wiKuQ==
X-Received: by 2002:a05:6512:4022:b0:592:f5a4:ece6 with SMTP id 2adb3069b0e04-592f5a4f458mr5888071e87.14.1761565510170;
        Mon, 27 Oct 2025 04:45:10 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5fc75sm2207808e87.59.2025.10.27.04.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:45:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:45:05 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Kemnade <andreas@kemnade.info>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v2 02/15] dt-bindings: Add trickle-charge upper limit
Message-ID: <b13b733e7e0fba05652f49f727412fed9e0ceb02.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0aGnDoHzYmHLbrXY"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--0aGnDoHzYmHLbrXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some of the chargers for lithium-ion batteries use a trickle-charging as
a first charging phase for very empty batteries, to "wake-up" the battery.
Trickle-charging is a low current, constant current phase. After the
voltage of the very empty battery has reached an upper limit for
trickle charging, the pre-charge phase is started with a higher current.

Allow defining the upper limit for trickle charging voltage, after which
the charging should be changed to the pre-charging.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 Documentation/devicetree/bindings/power/supply/battery.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/battery.yaml b/=
Documentation/devicetree/bindings/power/supply/battery.yaml
index 491488e7b970..66bed24b3dee 100644
--- a/Documentation/devicetree/bindings/power/supply/battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/battery.yaml
@@ -66,6 +66,9 @@ properties:
   trickle-charge-current-microamp:
     description: current for trickle-charge phase
=20
+  tricklecharge-upper-limit-microvolt:
+    description: limit when to change to precharge from trickle charge
+
   precharge-current-microamp:
     description: current for pre-charge phase
=20
--=20
2.51.0


--0aGnDoHzYmHLbrXY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W0EACgkQeFA3/03a
ocVHlwf/WmMG+VHvvbW2L2DZtJpJaw0EfC6PYPUNs9yBLXDr+CfL0pRslVccxRKB
Jmbbt/J+CQ5jhDcPysdGvd4gvl2XqZlNW74w9zBpGGeoAXN3RepiLjwPu07tbi3q
KsMyf0UBeVGeZMD89Z0iyf+i9uAPjIbL7jsJ67Im5cg7H5xWctMEjPmQSAYOZI3n
HLbSqG7+HsWQN/9V3fqNVE4g3O7gipBY8F0ZZQzdZcU0EEimtnwhpyUz1VHnQVIQ
R9MRt7+1ynYb/Hr3y/3yUjLfNmwvD5atDA2znKphM6acJ/LgYTJA4sg2Nvco36Xw
A5pNMofVjUgxD7NYCslLgrj9UeRj+Q==
=OPBq
-----END PGP SIGNATURE-----

--0aGnDoHzYmHLbrXY--
