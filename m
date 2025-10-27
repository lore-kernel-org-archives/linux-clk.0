Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBA302759
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565693; cv=none; b=jFh3P73I5jkbIWS29co678/YCo21dV3FY4OAZJ44/GcptUGJMkWT6olQRP9XturuM6GlOdwCBQLxg4cIvoUmJSD6hCOpF0xAx1WpC94VQA9ildRYIX/9urwy9OF0fMksAZM09WYvLFTNlaeTodviuP6QeFShm9ppPf9PNrT4ydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565693; c=relaxed/simple;
	bh=XZWwV054M9qiK218nIwhoEfRCBZY2K2ISL+JV8zHiW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWqIrrAa1Kim5zgDUNDyS8VXp8SLCacvF/Cex7HfeQZhdAjF+AaOFw8fJAudF9f4JGj4R4Un1LDfKCpTfYX0mQmHN8EtxkW08/EWGNQm1na/cHJvEHTguf1b7lsYjfiC3jkElroXiG/bUWv6GmbaZoaFXgrYbgWt3rqchza7kFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOazdrDA; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOazdrDA"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-592f22b1e49so4195947e87.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 04:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565689; x=1762170489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2WyxLWgy+GLmOKDJvSmkPG0LoCEHUMt4PkmDwMKiOHA=;
        b=fOazdrDAdVzPHCCUdJMM2LchT8t4zQS4TNHaldHSm2cUyzjYb9eLxy8juVECFq/++A
         W8+iwWfE/WHIazVJ2LMQpoQEGW1a+PAwKtWGWWiWZrvVbU8U3Lp0TeDUiB9pWf8ClX8D
         rcRHQlFu68sIEin/2yR6JGEvYV1fNv+vDb+v6OGJuJE7zKweYyOglV5Bq9A35tXKQ5rw
         c07UOlh930QzeRKAZ2D2rndOIgLok/0/jxd70DjKbKHlvM9b5NnfxH+DP8bMZ3bVQt0V
         WNppd2Ucr6l2x1rNYKkxXTNZYWah8Zbx9UMdLOWtPoqPuHKCyBQAWEO6VrRSqWZQtDAE
         CHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565689; x=1762170489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WyxLWgy+GLmOKDJvSmkPG0LoCEHUMt4PkmDwMKiOHA=;
        b=VqRZoycFvhPCqhTxMzSFbqZiyamLtDMs4dMdZVYa/Cy7SjwulKZa2tusUptdaKN3oS
         auifSWAerYaCXxzxsFtJHBLXUGKpDm6j2cuy1rktB+ohkkBbsP/BAWW22/+Eg6cFwAGA
         /cRHJ09x16wYl9k/trH3FHgH0ApEDQF8BP0c/MIcnL3s0zLXUGK6rCv9LFMwxkYn7wH6
         X37xTpOZ11G7Tmr0tA+WGyHks2885DXu8Ntsnk6R+mmRd2LNAvzQijSxaRgNzI3ciqnD
         2y5dfZ42f1ZovB8tq4LXwNDct7jJghUDctfODZgrW5AEfMXDG82ytB7mvhmpiXLh+6sr
         Gecw==
X-Forwarded-Encrypted: i=1; AJvYcCW5OrpGU4mEn5xR0t6xxi9I0PwAMvH1YuGMLCWs63wxG6Nq4ijBu/yMfnIXT+aPQZ62zlQgJv75Ddw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgwrB7Hwi0z0rFwwCrhtNDZGjOhb+SGLLXpY1YGpS4qjTtlbz
	RKgtEmFdC6TFlyfzYNcqw/VFn4k8T0u7Bei+7b2viC2q92v5gIwUkPAO
X-Gm-Gg: ASbGncub8PK4MzY21Z/5RCWHBjRkcyeQHZg9isy3mFFSjqw4pn4o37210tEqmAdKZhS
	7Drk5fjFfxZBEvyaJP9bQk61QoMWZGP/4FUPO5BS89Omn315uYlB//u7y8ETywSPlbcTciKbU0W
	Hx7zKRjL6efoqT7yAI2F2ImtFRN/WLjXPE9pR8XtHTnQBnRTqXL8zoALhQmMQQkIFpXS/kWJfi3
	yuih2a2v4N1dadAoiYQmxH9U5qogjj9BZiVlp51k/ZBzFnrjOxA3ECMwbVHOyiwhs11KvdIywmd
	BtvCVfDusTzdtX1pZmApJt9iWSsfUjwuJn4SSJJ+SXxKPiCzeskUP+TaNpyg4zh32G20JAt4v/v
	FNdIDpnbWMjw5hKbFZCpEnLdbuWXWuzk0Of4fitOANCGa/QmvO/7ZW6kLbbDNznVn2PvSxw/Npl
	O5PV2Leg7bO3ctyESXzQ==
X-Google-Smtp-Source: AGHT+IGhFV2dET4sdPBGpKbrKHn3UNt8L2evgmjiuyfGDmbke1yATwFb/UDFHADN5Gw3GttMPPu/HQ==
X-Received: by 2002:a05:6512:110b:b0:592:f9ca:feef with SMTP id 2adb3069b0e04-592f9cb0158mr4555884e87.46.1761565689125;
        Mon, 27 Oct 2025 04:48:09 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f50ab9sm2236579e87.38.2025.10.27.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:48:08 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:48:04 +0200
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
Subject: [PATCH v2 13/15] power: supply: bd71828: Support wider register
 addresses
Message-ID: <a590dac57dab146d43d7e57b396a9ccdc91311a6.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KYsPi76e1BOFrY/3"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--KYsPi76e1BOFrY/3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The BD71828 power-supply driver assumes register addresses to be 8-bit.
The new BD72720 will use stacked register maps to hide paging which is
done using secondary I2C slave address. This requires use of 9-bit
register addresses in the power-supply driver (added offset 0x100 to
the 8-bit hardware register addresses).

The cost is slightly used memory consumption as the members in the
struct pwr_regs will be changed from u8 to unsigned int, which means 3
byte increase / member / instance.
This is currently 14 members (expected to possibly be increased when
adding new variants / new functionality which may introduce new
registers, but not expected to grow much) and 2 instances (will be 3
instances when BD72720 gets added).

So, even if the number of registers grew to 50 it'd be 150 bytes /
instance. Assuming we eventually supported 5 variants, it'd be
5 * 150 bytes, which stays very reasonable considering systems we are
dealing with.

As a side note, we can reduce the "wasted space / member / instance" from
3 bytes to 1 byte, by using u16 instead of the unsigned int if needed. I
rather use unsigned int to be initially prepared for devices with 32 bit
registers if there is no need to count bytes.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
Revision history:
 RFCv1 =3D> v2:
 - New patch
---
 drivers/power/supply/bd71828-power.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/power/supply/bd71828-power.c b/drivers/power/supply/bd=
71828-power.c
index f667baedeb77..ce73c0f48397 100644
--- a/drivers/power/supply/bd71828-power.c
+++ b/drivers/power/supply/bd71828-power.c
@@ -44,19 +44,19 @@
 #define VBAT_LOW_TH			0x00D4
=20
 struct pwr_regs {
-	u8 vbat_avg;
-	u8 ibat;
-	u8 ibat_avg;
-	u8 btemp_vth;
-	u8 chg_state;
-	u8 bat_temp;
-	u8 dcin_stat;
-	u8 dcin_collapse_limit;
-	u8 chg_set1;
-	u8 chg_en;
-	u8 vbat_alm_limit_u;
-	u8 conf;
-	u8 vdcin;
+	unsigned int vbat_avg;
+	unsigned int ibat;
+	unsigned int ibat_avg;
+	unsigned int btemp_vth;
+	unsigned int chg_state;
+	unsigned int bat_temp;
+	unsigned int dcin_stat;
+	unsigned int dcin_collapse_limit;
+	unsigned int chg_set1;
+	unsigned int chg_en;
+	unsigned int vbat_alm_limit_u;
+	unsigned int conf;
+	unsigned int vdcin;
 };
=20
 static const struct pwr_regs pwr_regs_bd71828 =3D {
--=20
2.51.0


--KYsPi76e1BOFrY/3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W/QACgkQeFA3/03a
ocULaQf9FnW8a4aC3CR/Gco2xpcMcYEYnN74DjgG5yHJmtFN7prPODevcHLpTL+A
6Mk6Av8UuiNaAoUq9wRlxiBb+U4c4G4oIDzaX3/niJal/J/pXerETcCPBfzZpHhx
qq5fTjJsp59yOtxurBqmjykh1wNP+6F8EYCA2Ig336x2LcllG1xFyolI2JnKiKin
qLr4Sr5gWtOqC32pVsFgEBAfOdV+GJskEg4wTaEQ1GlsSmt+wMWj9TurlMRXzdZ3
9/fN3vD+4GdWDiCj5BZvYHLv/DhXJUdT0OWLgxKvMDwD5pH2cfSoLpi14jifpr7f
dQ11Gtvb4PMfmRvOYQ/+npJxk6apeg==
=BPJb
-----END PGP SIGNATURE-----

--KYsPi76e1BOFrY/3--
