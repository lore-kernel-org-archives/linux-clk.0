Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902DF2C326C
	for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192312; cv=none; b=berRJrZ7GlEAjIS9XQvdwQF224xlvymo7NnnbvjW/lOb12dZIWSJw6Yd1E3yUANog1+wdfvrKUkMrC5o+l3FcAX4vwsdnPNJP9PDvV61sPbDMKflgivVQ/rSTxshTd/Bq/smFWh9ldXam3NtIGooD6DbAPJZ5MwgA1YygD5om3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192312; c=relaxed/simple;
	bh=b+UWgl4VBhogsA+QkY0qD2pTi3b1CAQJ6FqebSPoqjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpIshI9pNL8kMIdqvddSC3UGPfrc7rmjQ3B1BdJ7ERliQ79QAew+VeuQJuNBekQMnoP4JEnxL/YZ22BKoskECQzGns0rohi8MYTfKbYk0pP5VvhHjtI0XghXz0FDyFxtZtqmuryZRPNvRT4qG3REmiEXK2VJA1KXaiz0X7ckY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BNww+IZn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BNww+IZn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490be03d47bso73594195e9.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Jun 2026 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781192308; x=1781797108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kAXJTKHdcfnPsavOmPa+dtVqYeGnCPU26Rre5E2RGo=;
        b=BNww+IZnvlSB3LuhaAqnHH539ZDAXBl/evqlW0vtNuS3EtlmMR4zLBViz7iGx/aBM6
         4YJ1J/kJFoprSxoIIPsxsVycTZqniVL1W/YdVpUWBSbYrsRw4XSi4ggUQQBCmtgyZivg
         VIZM/AXmHNH3JuncLTe8cSvFyR2BncZst+pgZLVFh1Ei0V1izXL8FnmUcyLDCQyxoCbL
         ubaOeYpS4zRAJkk3wxSgI21wupFNq/piZ5q6dSuITr2R8c5u+jJsNVAbax+wqmw5x0dA
         LdLIc9kxyAkH+MpwWIOts8SIGre3+wdIMsOuVeKvsqgm7rxSKmDEOCxppdDE4bxUPR4X
         2QQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781192308; x=1781797108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kAXJTKHdcfnPsavOmPa+dtVqYeGnCPU26Rre5E2RGo=;
        b=QuE21vTNOTmk4e9rOKgvGATDmBsOyC7QKwsKy9iYeMJYSE86T9Oi4rFlrsCD59pRcb
         ZMZ0aetvSqzbOplDXLlD2Fbsq0zMt8bOjisirO433ETEK5TRhJc/ANCChmAHSPD18CUk
         Hw18APuS4ywo6xXPYun/mevIR6vHfPT+rto/1GkYA0EjjIeBJI62eHMgw1q1q0H3FXGo
         vGwxL8hgL+98LZWcv5hS4W0CuLL3mLaSseiYuRzBsvim6BtzkXRQoSs+xzid46D+/A0n
         /XouEYRwdfMPKN81e04KDfAFrxxZLtbwZnmWtrwJr9PvptSyZWL7ksbYIbeFYq/NYC3Q
         dKMg==
X-Gm-Message-State: AOJu0YzVlwwNN2UyeiVqWMtC4RpId8LplSAKAxtcZGNz4a9loYFFPt/y
	JHeorJ+12OXeKfHSBBdGrG1zYIKZIMKZfDyXp6OeV+nuRQR1h83KrAK9xZMP8kLHHb4=
X-Gm-Gg: Acq92OEKI+y3p/W1GN0zVY6GGHQRJGnWwP58HWMebgO18YvzvQ1c+fFxKQInsxPIvZ3
	d0euDZAO1PpJISVx/sj9hdBl5fAX+3ePQKSgJoQEUXvX//4UQo7sEMmYuNlaJW6HKEqxzheuBFI
	yY8Ju1h/IgaYWcuMr4Gh1NgQPgiv3+zZmzUp+/ZogYjmKSOjRhUYmEXhOHy3XJPi0zYRvwMwQ8b
	NeUgnBTR7ZzQk3HAHzZjLp+PmTkEoCsJjkJKYCW90SIyne1f2MqLieUU56/C24O3RmOwIHkiLj9
	u2XbQ0dAwSaLffC8cJrQaxIZMm3D+v+9ydj1fBFLBbpbeyYf6/6E4TL/Xk4ervu4dRLDij7vM87
	KokSMAfdTdXyAVAIm3QN3OOezL75ca+qBl75Mw+t1jUv7xVh0n+SA17MczJEH5bims+EmyeVLso
	/wxEs5guFswSXz6S6G6kBgYiZYu4B3/pEtId6XPdoKUKzz2Wt/xbR6YXRS0DoH0zjcQvekrzE84
	0XQb5qUKQgEM8SVoHzzX+ErIU0o7WDPOiCD
X-Received: by 2002:a05:600c:4710:b0:490:bc46:1a58 with SMTP id 5b1f17b1804b1-490e5619aedmr42324925e9.18.1781192307968;
        Thu, 11 Jun 2026 08:38:27 -0700 (PDT)
Received: from localhost (p200300f65f47db044fe8500d14a9bb87.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4fe8:500d:14a9:bb87])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490e4228768sm63851315e9.0.2026.06.11.08.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 08:38:27 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:38:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Max Filippov <jcmvbkbc@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>
Subject: Re: [PATCH v1 0/2] clk: Rework initialization of i2c_device_ids
Message-ID: <airWClCSYG0EY0VS@monoceros>
References: <cover.1778857289.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4zh3w7jthxzposcy"
Content-Disposition: inline
In-Reply-To: <cover.1778857289.git.u.kleine-koenig@baylibre.com>


--4zh3w7jthxzposcy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] clk: Rework initialization of i2c_device_ids
MIME-Version: 1.0

Hello,

On Fri, May 15, 2026 at 05:10:38PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> this series is a preparation for
>=20
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicet=
able.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 	=20
> 	 struct i2c_device_id {
> 		char name[I2C_NAME_SIZE];
> 	-	kernel_ulong_t driver_data;	/* Data private to the driver */
> 	+	union {
> 	+		/* Data private to the driver */
> 	+		kernel_ulong_t driver_data;
> 	+		const void *driver_data_ptr;
> 	+	};
> 	 };
> 	=20
> 	 /* pci_epf */
>=20
> and this requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
>=20
> The union added to struct i2c_device_id enables further cleanups like:
>=20
> 	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
> 	index 0123ca8157a8..84272ba65d08 100644
> 	--- a/drivers/regulator/ad5398.c
> 	+++ b/drivers/regulator/ad5398.c
> 	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
> 	 static const struct ad5398_current_data_format df_10_4_120 =3D {10, 4, =
0, 120000};
> 	=20
> 	 static const struct i2c_device_id ad5398_id[] =3D {
> 	-	{ .name =3D "ad5398", .driver_data =3D (kernel_ulong_t)&df_10_4_120 },
> 	-	{ .name =3D "ad5821", .driver_data =3D (kernel_ulong_t)&df_10_4_120 },
> 	+	{ .name =3D "ad5398", .driver_data_ptr =3D &df_10_4_120 },
> 	+	{ .name =3D "ad5821", .driver_data_ptr =3D &df_10_4_120 },
> 		{ }
> 	 };
> 	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
> 	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
> 		struct regulator_init_data *init_data =3D dev_get_platdata(&client->dev=
);
> 		struct regulator_config config =3D { };
> 		struct ad5398_chip_info *chip;
> 	-	const struct ad5398_current_data_format *df =3D
> 	-			(struct ad5398_current_data_format *)id->driver_data;
> 	+	const struct ad5398_current_data_format *df =3D id->driver_data_ptr;
> 	=20
> 		chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> 		if (!chip)
>=20
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that. (I didn't find a good example in drivers/clk, so an
> regulator driver was used to demonstrate the gain.)

I wonder if you still have this series on your radar, it would be great
to get it into 7.2-rc1.

Best regards
Uwe

--4zh3w7jthxzposcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoq1m8ACgkQj4D7WH0S
/k6RhAf/UmJp/viM519xeQ+8m9hY6zySND5lZps+6FnKi5n4M/AzAMjHSYMN0t1r
aUlDtGv/psn2hvs/qF9yez3I3lx8Hl3gd394VPFCwnWxPluTJwoO93rWAkO1sTau
ONq9Qn7h6ldEKoJz6DTaW5oUG1x+5oc5yUldEdSbYRexE5++dvIm5eXrIjSgADdb
srdr8mSbN+yiz87yOcy1f8sXdR0mLv6MRiUFns1nYrZo8CPSNhYuBifZfYvUO6S2
WYTu7z/NPBJrSUmsAg9g7YGNpgTYLAhsmPevPohgzA7pFgXPDZhxqotAp+hGXyLm
3JV87NUEKHM6YjGOQ4P0S3AgyQmYAQ==
=41lV
-----END PGP SIGNATURE-----

--4zh3w7jthxzposcy--
