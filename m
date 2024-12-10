Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50473242ABC
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850663; cv=none; b=l8+OZmW9MzK5bHx5po2T8bOVkS3wTnu87Sj/HwsLYHn+LHPxMHzSatB/U2NO5pI2NyVJ1CYtc2XGxBMc/KBz9Affv4KWcfgjls/YLvEmHPNJmi78EKEjo/0vUtYZgaYzStfSoqNHu/vjDdqah10DN7mZIj9zHr/9W7haUPEeP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850663; c=relaxed/simple;
	bh=j3EZQQ+bJ4Pgh8+9W/k4Ypg3jmTVeLSoZtZxACS5Ilw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rUn0E+AA+tYn03IyUE846EL3Qfs3mTJ5+jXmb9buTvSkW4ZgYwJ0G3ht1r17ZXfHekUvCOz5dFkHhorFcbubWzThGElHWR+iyYMwfawDz5DPQHqdX/T3vZMzNK7DTp1P4nRlaM94JGkoxmHkCopOBUdenCuozawEze3ZNHZJZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZUd6KoHx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZUd6KoHx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so5072443a12.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 09:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850660; x=1734455460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE6wTwaLZbTxO8+1zmhGoRQFuhziI2yndu2tr5ybLTY=;
        b=ZUd6KoHxKUkZMl4YclFXBsHflSt9GCw+rx+Gpsrq6TTs5QX4jgkXrgGTYXCN6PALaK
         q80rRXMJsxj3Qt3fCxRv/oKsmrtOAPPw1UMJJdne8jQrCcp6JlvB03urTzkY7rakPhnQ
         T69cej1tAaWAijNxNwOvbIA0BOPlAGX+NIIrCMvuwKujcTl98Vn+3TMwjdD/eAblZCP+
         zYFIXt+2umxLxxLRDuGg7Wty0d2hf3UZVOOf9m352Ufe8fS6bH0mLohsiO82326s5i0c
         2dmH6ZtwOpFUkyur5lGfjGKOPLHhlaKR+T8hMPbsMkwntU2NjqTBrG1jqjjFu386saVU
         GUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850660; x=1734455460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jE6wTwaLZbTxO8+1zmhGoRQFuhziI2yndu2tr5ybLTY=;
        b=SvefgTZh1pmYkSQNJh7UnfBAqA20KSmg7ZuumTap/gGtaXUeAxysJJaV5PQ7j64aHr
         5obpDTc54xaK11CMMoDP60BCT41a177EVl3TFy3UnAqcklhR/1bmSvczCHwauOXrZg4s
         RxzwQndKhEBV0t2m0bW5MuJQFQXTOJkShs2H22EWuNuWjK6CjzVKDOfa+OsyyOu+K1Ly
         k4oBeoBmPGTlxc1cIGgsSThiirBeTMzarjXU1ir3m28an5badBLCUqIsgJImB82Co4IP
         fye8dgZN3aigCsb0HJENk0ajojahE0ZpQ2I3Gpk/OV9An6N/2KkHJaHhaJizZnC728MC
         CVKg==
X-Forwarded-Encrypted: i=1; AJvYcCUUWD9XNHG5CAh7PVjgpwXDO3RRWZy8RWGQmB+fzSR0TJQEJbhhHhzpMHs7W17MnVbXmMsRipr3CRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hb4w/gLggmULxr6Vmbc0J5RFiTHp5ljg6AWEIc62lUy7x6s9
	kr0jU4qfz+EAiSYsdchp0/dDIDDNrQCgdlC9GD7iQ5RxmvdQQLKt1iLxKEGV6MA=
X-Gm-Gg: ASbGnctM06dcmhBL92i1l7HW25m+5oEYKtWdqh/IMuWJhF8tqOoZdak9O4EUd1DvH9f
	3AMpEiI6pCX4WgARS+Ltqe7M/+bXkfgWY6bKFcohdztB4UBkzNDrxlyvw9Uzyo+XwUiIZ2T8tTT
	cn/JQhDUpGc+B0buzBXB3x8i2hC/k9JjAVSmEQdgUfpplYof0vohEQH43Ze5u6GP9oSjfGXhWOY
	UCxMMIKEBdvx3iLxPtUXklJ45RXvpz0whOa+3nIpGV/MXE+WnNR9Q/dCc2i5c1FoWFahXn8UIxK
	jLVt+1RD
X-Google-Smtp-Source: AGHT+IFlYyo736yb9cxpJS2cGnLCOO0TpZQwWI6UbvDphomE+gSa6jZr1VtWzN9wAD+vqnofdD3cjQ==
X-Received: by 2002:a05:6402:2791:b0:5d0:b925:a8a with SMTP id 4fb4d7f45d1cf-5d3be6c1598mr19946134a12.16.1733850659570;
        Tue, 10 Dec 2024 09:10:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 23/24] arm64: dts: renesas: rzg3s-smarc: Enable SSI3
Date: Tue, 10 Dec 2024 19:09:52 +0200
Message-Id: <20241210170953.2936724-24-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SSI3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags
- dropped status for audio_clk2

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 899d88467d79..1944468a2961 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -64,6 +64,10 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&audio_clk2 {
+	clock-frequency = <12288000>;
+};
+
 &i2c0 {
 	status = "okay";
 
@@ -105,6 +109,11 @@ power-monitor@44 {
 };
 
 &pinctrl {
+	audio_clock_pins: audio-clock {
+		pins = "AUDIO_CLK1", "AUDIO_CLK2";
+		input-enable;
+	};
+
 	key-1-gpio-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(18, 0) GPIO_ACTIVE_LOW>;
@@ -162,6 +171,13 @@ cd {
 			pinmux = <RZG2L_PORT_PINMUX(0, 2, 1)>; /* SD1_CD */
 		};
 	};
+
+	ssi3_pins: ssi3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 2, 8)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(18, 3, 8)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(18, 4, 8)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(18, 5, 8)>; /* RXD */
+	};
 };
 
 &scif0 {
@@ -182,3 +198,12 @@ &sdhi1 {
 	max-frequency = <125000000>;
 	status = "okay";
 };
+
+&ssi3 {
+	clocks = <&cpg CPG_MOD R9A08G045_SSI3_PCLK2>,
+		 <&cpg CPG_MOD R9A08G045_SSI3_PCLK_SFR>,
+		 <&versa3 2>, <&audio_clk2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&ssi3_pins>, <&audio_clock_pins>;
+	status = "okay";
+};
-- 
2.39.2

