Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949261;
	b=PR426myfVBQ8e+nGAkL3mDlteHGmbXrfZgRKMooyrLgMhlbalV3v+5zaQtcL7lEPrduB
	 wXGZ7vqAvTEasOAaVsgI9IlclHhWalsmsPmsjeYt8hb6TyxZX333nB6ZpemfWSistzHgQ
	 KmSqHvY7rjIrJPrEkHxGxvITijFVHNwSP5fcRSbMKp7nwojNTGjk5lcNPINE3dT46w7FT
	 4fd+gFiBXT/CUTMPyYcw0HxJWrABqVRwFH1bJ3GVvafcWpttftxRGWO+dTeGm6vy/9YqB
	 34fSD26CPZAmMp8AgKoRB3K2FusLmvGz0e7eJeuoXNGckYvPvYcB0LNBgQANBSsI8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949261;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=79OIXfIsBYtCzhqjtjT5JmD6bsEywr7cWxOeYpj9/3I=;
	b=jg97Bnr0YWlJI91ObD76kgwnCTkI3sVxVuI+4YdAxV+1VlxvqIEgNHxMtWRKESQIcUY0
	 706evQuQc+ibzSdFocRZbgkYdbgh4twvP1V1m43/zIIXpZayjKeoPG5y9aEPzU5ND3P8L
	 nRKz+KXqqV+mMv1wet691BUrof5nvPNgDVizCH3oHaGrifG8o8S/StEYeGlImzR8R25PN
	 NiFbzhUm6tXsE65kzePhp+WP+w65b+n8efhJm0Tp7WOg8PQL4hCAfiVkZrdsz7BkkD2PZ
	 puzep+3hGZYe34sBlspXh0KGJEUAQxmQqWHX8n4r+crr7372PDFeUtlVklRYIL7NjPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=HhTZP2CC;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D439E606A88E;
	Tue, 17 Nov 2026 21:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D439E606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=HhTZP2CC
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 63EEA20D531A;
	Tue, 17 Nov 2026 22:00:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 42E0320D4DE5;
	Tue, 17 Nov 2026 22:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 42E0320D4DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949259;
	bh=79OIXfIsBYtCzhqjtjT5JmD6bsEywr7cWxOeYpj9/3I=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=HhTZP2CCXyGKEnGrVW1AMyoqWRYY4gvuQT0syrcDyOS4V+msempD7LDKU2Xfr2WVO
	 y0tr7vX7DRmqvCuIoo/grWYWTGcrK1SImwcGDT14deyGD4V8cxt+JT4QqnJyRRJFXI
	 WZi3nngoK150nniPAxMBSVCcHvQoaNoAr375TDEgnxW9eC6buIx6ZAUCmtMmKcmrNU
	 58SQZvIZRuUMqerIgcl441wFTrFqc3+/BmCFozU/X9p8tBOeZv70CjTQT4CW49yjLz
	 KrP5BAM/nHizCEH3yuONAL4ulJrW5B/g8EbHxR/T2b1gtncl4RN1UObkriMcoBedUa
	 OgBc96YNQ+S/g==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id Xmq_IYexV-t8; Tue, 17 Nov 2026 22:00:59 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 18EC720D531A;
	Tue, 17 Nov 2026 22:00:58 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 5/6] riscv: dts: spacemit: k1-bananapi-f3: Add PWM fan
Date: Tue, 17 Nov 2026 21:59:50 +0100
Message-ID: <20261117205951.140146-6-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The fan header (J27) has a PWM line driven by GPIO 79 in its RCPU2
PWM2 function. Add the pin group, the fan with the vendor's four
levels at 100 kHz, and active trips on the package sensor at 40, 55,
70 and 85 C, as in the vendor DT.

Tested on a BPI-F3: J27 pin 3 averages 0.86, 1.76, 2.74 and 4.66 V
for 25, 50, 75 and 100% duty (multimeter, 0.04 V off), and the fan
goes to level 1 when the package reaches 40 C under load.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 63 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 +++
 2 files changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886..e69289cc0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -37,6 +37,13 @@ led1 {
 		};
 	};
=20
+	fan: pwm-fan {
+		compatible =3D "pwm-fan";
+		pwms =3D <&rpwm2 0 10000 0>;
+		cooling-levels =3D <0 64 128 192 255>;
+		#cooling-cells =3D <2>;
+	};
+
 	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "PCIE_VCC3V3";
@@ -427,3 +434,59 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status =3D "okay";
 };
+
+&rpwm2 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&rpwm2_0_cfg>;
+	status =3D "okay";
+};
+
+&{/thermal-zones/package-thermal} {
+	trips {
+		package_fan0: package-fan0 {
+			temperature =3D <40000>;
+			hysteresis =3D <5000>;
+			type =3D "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature =3D <55000>;
+			hysteresis =3D <5000>;
+			type =3D "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature =3D <70000>;
+			hysteresis =3D <5000>;
+			type =3D "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature =3D <85000>;
+			hysteresis =3D <5000>;
+			type =3D "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip =3D <&package_fan0>;
+			cooling-device =3D <&fan 0 1>;
+		};
+
+		map1 {
+			trip =3D <&package_fan1>;
+			cooling-device =3D <&fan 1 2>;
+		};
+
+		map2 {
+			trip =3D <&package_fan2>;
+			cooling-device =3D <&fan 2 3>;
+		};
+
+		map3 {
+			trip =3D <&package_fan3>;
+			cooling-device =3D <&fan 3 4>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k1-pinctrl.dtsi
index 8c57ca05d..1f31f3177 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -587,6 +587,13 @@ pwm14-1-pins {
 		};
 	};
=20
+	rpwm2_0_cfg: rpwm2-0-cfg {
+		rpwm2-0-pins {
+			pinmux =3D <K1_PADCONF(79, 2)>;
+			bias-pull-down;
+		};
+	};
+
 	ssp3_0_cfg: ssp3-0-cfg {
 		ssp3-0-pins {
 			pinmux =3D <K1_PADCONF(75, 2)>,	/* SCLK */
--=20
2.47.3

