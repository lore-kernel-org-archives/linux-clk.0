Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9722FC03C
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565627; cv=none; b=c+5NIefzDFwUZD8Y1wBS4hYPIsdlPMHpXuCIt1Zf04oVbPZtPwnCFYFayb6Ecg4yuaoUOO/rfAkLuAxUGGABK5nSabw/op+3c3I8CoVz/0unEH/6a8NbeZFHlMrzv/OIMEvuSwuzyX9mZShGcMXhP+EEETgKzWDRhaGxvC1XVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565627; c=relaxed/simple;
	bh=KbZYIBikwWSI+GVCWKg5+OPGcA2UgrEFkQgweLtQ6xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqWZI9Kb0jZW4ySG3aUVxx40fB/u/JCF0J1GUl37eEwoknBj26wdc0zBh2oBv5Hiv3hm1u8uqiLVXajwiNY+GzzkqMOCF+DWlmcr6yokvNq4sXT7PeRd5y+FV6CzI44UEGEmsD6eskR0/EPH+W1i9dK3q4JbxKab8f8U7Gko0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN1iBm/a; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN1iBm/a"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36bf096b092so44361461fa.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565623; x=1762170423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPhjrYnraGxNN/VaL/O/6qvA4/L6CwleXg/ScEIiVlQ=;
        b=gN1iBm/aT27avoIk/DrZG8G1WrMT7FSaFrGJsRmY3xXQJT/zDpvPTVBzfxjqF+J6En
         pkykq5+eBwgsQR5ujS48JaFusMQrESuHebjrPDO+JfwJ7yBSZFBs0M7v9HbadRgyZtyr
         tvjGzNgcSQcIPURCK7YcjQ1vkbtu5y5XHqiOxqJ4ZRbZj4Pe3TeimAI1uwwWHy8O6uYl
         uQWSizZNparIpxig4ziJ/WAV24OnbnRVRe7MvhUAJ/g4X9uZtZE2pFdagi1G1QLXKxwy
         lFLvFi9PTchxpXLlGuPgwBA4EC0ZUezbxAdVmV7DBl8FjNaLAjEOk+3asKKYAgznwowM
         Tekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565623; x=1762170423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPhjrYnraGxNN/VaL/O/6qvA4/L6CwleXg/ScEIiVlQ=;
        b=gr9oH7Fuo4HKXNVQZRtszcm5EHZ8e2kUQg1HpUfIxeFyn12OKaKjvA+6nufdF/92Md
         4mUVHNOKgVEag77bCl5xRDrzfzICfipO5fpIcCY+SeBU/PCJRuI743noLywVB4PMA+MF
         fsOrVVEb2xxdlyymZnPiwbLW8ei4JpyVxML2ItUS3fM6eCJS0IH3vH1vHHhcUiLwervJ
         emB2U6EAOQ3f9paLh0q47pOtuqEYEZBXoKi5QEZ5x3dXwDYON4KeMqUp+bc80Xllxorb
         pYLwXfH1Q2EZ9H29T0CKngbAHKh2vMnbWfuTWhHe+XiHamIo7M4g0lL1bbyeSzsEK+F7
         Or+w==
X-Forwarded-Encrypted: i=1; AJvYcCVs3eJK3K5XaPFeUCa4NC6YiBIxuVSWbpW0FR8qnrCB3Jr06D84WXsDccosJqT/54vtXw5uX4KiyU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ83IoHQgSCxa7NHfqFC7juE6O+OD6MbnVj+bvAdpWPP0u6eV6
	kgSWjC/fLm/7/NGkJzKcSNEDw+Lk9aVgbSkeblVOgzDuL6Yu/QX2AILk
X-Gm-Gg: ASbGncvSIlrsZURWhcNfZE6YLuNSv2nYjnFIRkbtVgjlQD+syhjakyRRPjogzd2BkSr
	0iU0YZ1W6SHls2xWP5SkdiJoYHnidXraCwYYgZklyVMfh0ZTigcz1A/qP9l5yhz+Z9j0nRU95Yd
	uvBzVeiyRQNW3RVCLFz7nCx02N3UkBIM9pNKIjIZaMhep6J8CpJkGmiEmzfotEW8qn6+UOfb0Z8
	ka9ury4W70rH/W6bSQQTskXCs2ORauEEmM6YM6DBNTp82xzN/Ou2NO03y4PXLw050AkFCb+PfYu
	ON2ly7Na4cGELUSjDBtEL2Vk0CnGbLQLh2H2+D5qoqYxd12v4StBvw54PHCfjG2K4zUG8jF6J1h
	Pid4tW8JxMFFcwMcnf9MrqltiHt1+puzuVAEFXvEvIwU1hKS4iS9OXIh9Lz/LvJhR9CIfnF+gJ9
	ZTsHy2crtqhR8Wue4ojA==
X-Google-Smtp-Source: AGHT+IFGTBYWCW3ld91Gaf4BxcDyit2xahwuUUbRDChRLg+8atXmQtWwSm/UbdG2xVg1KoE+9y6aEg==
X-Received: by 2002:a05:651c:221f:b0:337:e151:9ec with SMTP id 38308e7fff4ca-377978aeff0mr114706621fa.16.1761565622062;
        Mon, 27 Oct 2025 04:47:02 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0d3712sm20091881fa.36.2025.10.27.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:47:01 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:46:57 +0200
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
Subject: [PATCH v2 08/15] regulator: bd71828: rename IC specific entities
Message-ID: <aa2b31267e6cc93bad4c823ef1ba07ba43efd572.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHlLATUC+NJoLwSU"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--hHlLATUC+NJoLwSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The new ROHM BD72720 PMIC has similarities with the BD71828. It makes
sense to support the regulator control for both PMICs using the same
driver. It is often more clear to have the IC specific functions and
globals named starting with the chip-name. So, as a preparatory step,
prefix the BD71828 specific functions and globals with the bd71828.

It would be tempting to try also removing the chip ID from those
functions which will be common for both PMICs. I have bad experiences on
this as it tends to lead to problems when yet another IC is being
supported with the same driver, and we will have some functions used for
all, some for two of the three, and some for just one. At this point
I used to start inventing wildcards like BD718XX or BD7272X. This
approach is pretty much always failing as we tend to eventually have
something like BD73900 - where all the wildcard stuff will break down.

So, my approach these days is to:
 - keep the original chip-id prefix for anything that had it already
   (and avoid the churn).
 - use same prefix for all things that are used by multiple ICs -
   typically the chip-ID of the first chip. This typically matches also
   the driver and file names.
 - use specific chip-ID as a prefix for anything which is specific to
   just one chip.

As a preparatory step to adding the BD72720, add bd71828 prefix to all
commonly usable functions and globals.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

---
Revision history:
 RFCv1 =3D>:
 - No changes
No functional changes intended.
---
 drivers/regulator/bd71828-regulator.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71=
828-regulator.c
index dd871ffe979c..3d18dbfdb84e 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -28,7 +28,7 @@ struct bd71828_regulator_data {
 	int reg_init_amnt;
 };
=20
-static const struct reg_init buck1_inits[] =3D {
+static const struct reg_init bd71828_buck1_inits[] =3D {
 	/*
 	 * DVS Buck voltages can be changed by register values or via GPIO.
 	 * Use register accesses by default.
@@ -40,7 +40,7 @@ static const struct reg_init buck1_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck2_inits[] =3D {
+static const struct reg_init bd71828_buck2_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK2_CTRL,
@@ -48,7 +48,7 @@ static const struct reg_init buck2_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck6_inits[] =3D {
+static const struct reg_init bd71828_buck6_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK6_CTRL,
@@ -56,7 +56,7 @@ static const struct reg_init buck6_inits[] =3D {
 	},
 };
=20
-static const struct reg_init buck7_inits[] =3D {
+static const struct reg_init bd71828_buck7_inits[] =3D {
 	{
 		.reg =3D BD71828_REG_PS_CTRL_1,
 		.mask =3D BD71828_MASK_DVS_BUCK7_CTRL,
@@ -102,9 +102,9 @@ static int buck_set_hw_dvs_levels(struct device_node *n=
p,
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }
=20
-static int ldo6_parse_dt(struct device_node *np,
-			 const struct regulator_desc *desc,
-			 struct regulator_config *cfg)
+static int bd71828_ldo6_parse_dt(struct device_node *np,
+				 const struct regulator_desc *desc,
+				 struct regulator_config *cfg)
 {
 	int ret, i;
 	uint32_t uv =3D 0;
@@ -212,8 +212,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			 */
 			.lpsr_on_mask =3D BD71828_MASK_LPSR_EN,
 		},
-		.reg_inits =3D buck1_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck1_inits),
+		.reg_inits =3D bd71828_buck1_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck1_inits),
 	},
 	{
 		.desc =3D {
@@ -253,8 +253,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK2_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck2_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck2_inits),
+		.reg_inits =3D bd71828_buck2_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck2_inits),
 	},
 	{
 		.desc =3D {
@@ -399,8 +399,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK6_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck6_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck6_inits),
+		.reg_inits =3D bd71828_buck6_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck6_inits),
 	},
 	{
 		.desc =3D {
@@ -440,8 +440,8 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			.lpsr_reg =3D BD71828_REG_BUCK7_SUSP_VOLT,
 			.lpsr_mask =3D BD71828_MASK_BUCK1267_VOLT,
 		},
-		.reg_inits =3D buck7_inits,
-		.reg_init_amnt =3D ARRAY_SIZE(buck7_inits),
+		.reg_inits =3D bd71828_buck7_inits,
+		.reg_init_amnt =3D ARRAY_SIZE(bd71828_buck7_inits),
 	},
 	{
 		.desc =3D {
@@ -633,7 +633,7 @@ static const struct bd71828_regulator_data bd71828_rdat=
a[] =3D {
 			 * LDO6 only supports enable/disable for all states.
 			 * Voltage for LDO6 is fixed.
 			 */
-			.of_parse_cb =3D ldo6_parse_dt,
+			.of_parse_cb =3D bd71828_ldo6_parse_dt,
 		},
 	}, {
 		.desc =3D {
--=20
2.51.0


--hHlLATUC+NJoLwSU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W7EACgkQeFA3/03a
ocXFRAf/X2TvPapTD+az8EHYbCCnjJcIvHuUfnEQlERv5ijnP0Gl1KSmtaVPlpvl
VEVmc5eK8QfVVA8akUmsAFtEQ17BUXteFoPdjVb37GJGuyW+tH+R4GpNKRXbpsPT
kxqHs/o5fxk7ESJZhWCSErb1jZyKhuluMo8331A00dHZW9zGIielOf/2Cs8eoxMf
tF4+VUmvy/nfAGhfOyfvPy7WLouZFhQdgUI/u7KhsibBAlIBjVrWz2pcXsCAx2qu
dtxESaLBV3H3wleVqN84Hxhiok+cPhW8tz85MtBhBxHT7tNbM+QjUe/jHxk2GnOM
5t6EpGBTVdq0zs4EwAkPzUE5uFCr2Q==
=9ybE
-----END PGP SIGNATURE-----

--hHlLATUC+NJoLwSU--
