Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F012FF67F
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761565573; cv=none; b=PhST8Qtwaq4oDQTPwrunKlZmjYEChFGzfVg0+htwehWbvUXieCLVROMb2MYU/weN4PT7dxqw0hYeLiwAu6qhU750WOWnHJuNEcD3meZOKB7OVAr2bn3qM42NvmWcYKtM5ZJnifncSTEWc4mgsrOWPHh4gnUCr6Fn/2qKQA8ItqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761565573; c=relaxed/simple;
	bh=o5X3qid/yfHH+BoyJqJHvmRGKTTPXZaHJ8WFRZQcNlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNlYIUvYgTm+6Q/Kd3v5ZRXZ+40xaqnO+pYXAGo/KL4NmnvcR8rHyE7JHvkMYWB9MMlpwWRZHwmx0fWIn+JuTJg6JJ9yhXNTmoX3x1a97Xxvf+3/3cjI2H0BExReRU1bUo8DH2ILZFi3EZXWtI2Fq6uHZGlBElOSqi/SkgZ9BqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHAh0e/6; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHAh0e/6"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-586883eb9fbso5518134e87.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 04:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761565569; x=1762170369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wthRWPyiVp8yh4VwotqDPqYh//R/kAW37sGEOtokSs=;
        b=UHAh0e/6RVCghKxy6if56ZY65mQbkLTGI+qrMbV4hqVAxukBmuRSvZtNf/fs+Afw61
         qJslBlMXM31vuLRC14d6QIz6Cg2TVOeINjbjITwCU2hfQo9jel9cFBbbaa4UTY4wLCkp
         rp1ytV8xR46a9YoCFPjMm2mnTEdtUCWKCOtcr6gnj92T4/3UNloEdwwEA5dN4k1lmgUe
         diWXbfRr1w5zsRPEATqhEDZIgW8DM1xx6CQBxh6r8E2y4PvAYWSf0hBWABXuDDCj7cjz
         KMIf4c2R9lMbQcYUzKjRyEp+FriZUEFcGLul+avSMf0e4N3uQlMQYyBahw82MI2nHFZ1
         2s+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761565569; x=1762170369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wthRWPyiVp8yh4VwotqDPqYh//R/kAW37sGEOtokSs=;
        b=TTqV/b9JDLmBBCB0JyButhMO2FL3pusWZj9MgN1e5vNb7iPUWPs04wj/uNRWd/hSb9
         ooS0X9o9rlcBfmuVL92Mil9N+OJ58Mn+uMWunO8K9By2Cjfand1rciJVzq1JgMshVjM5
         fkp0GhWigRHjP5TvRA2oG47rpBX8mQSPlaMekASZPkTDori88zZESY97Ox58RofgmIx9
         wtDpJ2dbm5aVduSNzP2G2dwwuIq4Nf4p16PIvus1h8m1LBRAQFaqnBTARSLVKYrjf1+R
         uBisUsoHs6IdBIbISFy4QjTC+uismw3DfIx2yXxmLGTXdHbmlBH/N8xOak6o0Hxo8xHZ
         VuTw==
X-Forwarded-Encrypted: i=1; AJvYcCXsHx0fyfCe1eJxXltsAkXgDm6V+Y4Bv/SPnGtJCo0tGtUq0yFa9vryj6uJgdp3Edbdfm/SDSk8o9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+fFk7XSaQl5h/TX5iuZJXs/9Z1QTS2wihOKj/SmG5gNqT8VJ
	hQPqAlVsL0KmB4wicWL+KUurtBrgkL2gB2LvtSx4hr3NS5F5vYC/Ym7J
X-Gm-Gg: ASbGncv7uJTLRhk/yUWgVtBoDYY5WmW8iFJegxgPb6I+p2YwVYjYH1LuKCr9SSLpKCg
	bkg9WJWoKY0H/jFxzjxAtinK2VmzS/U5WGaJj9ZoxfkuUCYHj+slz3BnPvyzv3NqmkSBpf/afrR
	W9M0n4VWwi9qFGP7rJC0voAUvXhjtTMbHPKcTPF1i216mZFbS05qd4laIgfT/iZb3dXuJYe2eyy
	VTBzDFnmlJ+u2Zl1Y2WejTOih1Jh9LkpBXyKkS6p12vz9/DzBsM4hqpVCG+0whfFhkkics1JCiq
	P+jjufx0OzeJ8T6gmknM/T/cEIe/z0WLsrpelJ4P4L/9+C7utSjaIUZu8faGLG6Fq/Zc3MstymG
	BBwNPPA8HD1a90l2+WqvrwOzpYIBOpteHeG9OA7MDe+kwlDy34NJljeAaJU8/rKPGe9DPmB3JMS
	Rt1PPqc9E=
X-Google-Smtp-Source: AGHT+IGpx5VaEstHr/dfUOeY/sT/AIsaR48RyvzDra31HtwNJ+UB6/DopkQBca9Vf1sT5NaznaxtPQ==
X-Received: by 2002:a05:6512:4047:20b0:591:eab5:d8dc with SMTP id 2adb3069b0e04-591eab5dd39mr5211536e87.35.1761565568841;
        Mon, 27 Oct 2025 04:46:08 -0700 (PDT)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f558a3sm2221582e87.51.2025.10.27.04.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:46:07 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:46:04 +0200
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
Subject: [PATCH v2 05/15] dt-bindings: leds: bd72720: Add BD72720
Message-ID: <fae1285b43acdd19cebfcfbcf4530bf90064f601.1761564043.git.mazziesaccount@gmail.com>
References: <cover.1761564043.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hcLA+ux7eVKOsxx"
Content-Disposition: inline
In-Reply-To: <cover.1761564043.git.mazziesaccount@gmail.com>


--4hcLA+ux7eVKOsxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add the ROHM BD72720 documentation to the binding documents.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
---

NOTE: The Linux LED driver does currently have: values
bd72720-grnled and bd72720-ambled for the rohm,led-compatible. These are
handled identically to the existing bd71828-grnled and bd71828-ambled
and should be removed from the driver. Thus they are not documented in
the binding document.

Furthermore, the BD72720 Linux driver does not use the compatible property
=66rom the LED node. The Linux driver is load and probed based on the PMIC
compatible in the MFD node. Thus no compatible string for the BD72720
LED node is added.

---
Revision history:
 RFCv1 =3D>:
 - No changes
---
 .../devicetree/bindings/leds/rohm,bd71828-leds.yaml        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml =
b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
index b7a3ef76cbf4..64cc40523e3d 100644
--- a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -10,11 +10,12 @@ maintainers:
   - Matti Vaittinen <mazziesaccount@gmail.com>
=20
 description: |
-  This module is part of the ROHM BD71828 MFD device. For more details
-  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+  This module is part of the ROHM BD71828 and BD72720 MFD device. For more
+  details see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+  and Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
=20
   The LED controller is represented as a sub-node of the PMIC node on the =
device
-  tree.
+  tree. This should be located under "leds" - node in PMIC node.
=20
   The device has two LED outputs referred as GRNLED and AMBLED in data-she=
et.
=20
--=20
2.51.0


--4hcLA+ux7eVKOsxx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmj/W3sACgkQeFA3/03a
ocW9fgf/RpKlDcHIMKbMyCIcpDbELXKdqHFVQmRDH0oXD++RG0QLz4MUO5Meanix
Lrn+YT27QBVb307Hptc/7Ui9Ot+0VgjqhoF8Kam4X5M7ZTI2GFD9oIDIzzUv6G7s
zbax4mKZSypJulHy0njs+VSFo37GrNcXe3oEzgEUxs7kkSz6vQEAvm6lrRZQd6Gm
0KE3eVgWb8y0ImoU9FBdjOfc6cvE0irhzNKx1POEAnePyzqwo1OlVB9p3WI9IB7c
D1k3RxGwMXtl6Ze18F06LcJvEpkZUH597P+JODLa3ks12bveEQ1ncLgRlgoe6vZt
jq5wDk7fUJq9ysDNwnZpCtWENVcbcw==
=m6hY
-----END PGP SIGNATURE-----

--4hcLA+ux7eVKOsxx--
