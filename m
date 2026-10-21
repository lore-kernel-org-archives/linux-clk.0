Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569189;
	b=nCSuE6WMrAt7uz+L8PdxpbHVp0ayjGL6KZ4M7qif3DSNx8LcaR+v8zf1oHqP/JDB0Tg8
	 EY+8D1UIUB5ibikviHtZPOycnNcc0C8+l/6gjU7DT5rgbjQneD6gGtr7AESS50wu5dusk
	 5TH7eGBzyGGSoHJmiR99n1jVpbM8Kh1d7bX9Ze3cyCIwNTbxRd2TJK3fd2PovuD7KUN8W
	 yWop9Yr5VjYhA1co+1NgmYAPl0oWoKt0LekiImJCCg0rxE8GN6U0be5dG69mpgzm16tPZ
	 MufscsE8I8Y+jMKB8HoG+vS91EQQy75qU3fJGGO/Zf90eRKdJyOQ2PjGbihi4F2oRrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569189;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fOZZ9r0CmT1iLV8NW5Ru9DBs2AykPQxWgR2/m3oBnjg=;
	b=MYJEF/8eHqEJ0X0SgN+cuHjny2xkJhMfngHOMIlaFziXSU3nlzSzAqa7hAQLHOJTsPut
	 /YtINWrByq309oDRMYVUYz+pdcW1tiC14m+ZWrpS9KSKJiGxwpHRufqduDRXO+ZXSr6VY
	 VlqqrIrRAgEROs/1p+7BknjMbRlBzfkA1rKwF2O0jcTZIE2Td7R5GmQsNUvfIB+sdbdvq
	 zhxb1vTPB4ykfb+3oFGN3Csr4DbVJRGTDG8CqJwE3Ia308c0y4MySkkdevjFKaXFFqnHo
	 YoKfBR9Yt6rO+kQ4qp1hCHZ8XDGXhADuYVHsMjz3aGdPHY2Mu07sji0+nkVh/OEWvow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIpnIDLH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF7B606A31A;
	Wed, 21 Oct 2026 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIpnIDLH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BA21F000C9;
	Wed, 21 Oct 2026 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792569189;
	bh=fOZZ9r0CmT1iLV8NW5Ru9DBs2AykPQxWgR2/m3oBnjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WIpnIDLHkRjjeWWAMLQx1uUyrlHx1WHqyrkoZZkue1ifNTze1Koe3dGRPB6oYr9G1
	 ZNSvp1IEZEMYOcf9aQvUtC54Dezxl3YvgWawVqfBOcwFwKfHnhYu0jbLsw1HX0VZFp
	 UKbO/pbX7/lgH8pknwL0iFgQCjS2fFBk2qT6FcXtoiA0EVBxqV6YZsgs7Uo3Fvj7Qm
	 zFNUwTHgDWOSFES8Chjgp7k+RX3L7NkNu1OwRNisoD7g/wD6bAfvU0Bs5wvo7Yyyci
	 DVxvGOSQrbIsqRzYchZqXqxBPlpptSP0Kn8WH2Q3Qm2UtykN7eaXTWwPS6kvIMRjUG
	 6kmUUWrRA/NRA==
Message-ID: <sashiko-outbox-179929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: amlogic: Add Amlogic S4 Audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261021-audio_drvier-v7-5-2b9aeae9cb8a@amlogic.com>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-5-2b9aeae9cb8a@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 07:53:08 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] arm64: dts: amlogic: meson-s4.dtsi references board regulator in=
 acodec
- [Medium] arm64: dts: amlogic: meson-s4.dtsi leaves all audio nodes enable=
d by default
- [Medium] arm64: dts: amlogic: wrong spdifin interrupt number in meson-s4.=
dtsi
- [Medium] ASoC: meson: g12a-toacodec: wrong DAT_SEL shift in s4_toacodec_w=
idgets
- [Medium] arm64: dts: amlogic: missing pinctrl configuration for S4 AQ222 =
S/PDIF coax
- [Low] arm64: dts: amlogic: unused dmics codec node in meson-s4-s805x2-aq2=
22.dts
--

commit a71d27338262d3dbf5d4f70564ecc7b6b1940900
Author: Jiebing Chen <jiebing.chen@amlogic.com>

arm64: dts: amlogic: Add Amlogic S4 Audio

This commit adds audio controller device tree nodes to the Amlogic S4 SoC
dtsi and configures the sound card and audio peripherals on the Amlogic
AQ222 board.

[Severity: Medium]
In arch/arm64/boot/dts/amlogic/meson-s4.dtsi at line 904, the acodec
(audio-controller@1a000) node hardcodes AVDD-supply =3D <&vddio_ao1v8>;.
However, vddio_ao1v8 is not defined in meson-s4.dtsi; it is a board-level
fixed regulator defined in arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq22=
2.dts
at line 70.

Compiling any other Amlogic S4 board device tree that includes meson-s4.dtsi
without defining a board regulator with the exact label vddio_ao1v8 will fa=
il
during dtbs compilation with a non-existent phandle reference error.

Should AVDD-supply be moved out of meson-s4.dtsi and provided in
meson-s4-s805x2-aq222.dts via an &acodec node reference, matching the
separation used in meson-g12-common.dtsi and meson-gxl.dtsi?

[Severity: Medium]
In arch/arm64/boot/dts/amlogic/meson-s4.dtsi (starting at tdmif_a at line
872, acodec at line 904, and clkc_audio at line 915), all 25 audio
controller nodes omit status =3D "disabled";.

Unlike the other optional peripheral nodes in meson-s4.dtsi and the audio
nodes in meson-g12-common.dtsi, meson-sm1.dtsi, and meson-axg.dtsi, leaving
these nodes enabled by default causes of_platform_default_populate_init() to
instantiate and probe all of them on every S4 board (such as
meson-s4-s905y4-khadas-vim1s.dts, as well as unused audio blocks on AQ222
like toddr_d, frddr_d, and pdm). At boot, this unconditionally powers on the
PWRC_S4_AUDIO_ID power domain and runs axg_audio_clkc_probe(),
t9015_probe(), and meson_audio_arb_probe(), keeping CLKID_AUDIO,
CLKID_ACODEC, and AUD_CLKID_DDR_ARB permanently enabled via
devm_clk_get_enabled() and deasserting RESET_AUDIO and RESET_ACODEC.

In addition, the apb4 audio child nodes are appended at the bottom of
meson-s4.dtsi via an &apb4 reference instead of being placed inside
apb4: bus@fe000000, and the headers dt-bindings/sound/meson-g12a-toacodec.h
and dt-bindings/sound/meson-g12a-tohdmitx.h are included in meson-s4.dtsi
where their macros are unused rather than in meson-s4-s805x2-aq222.dts.

Could the audio controller nodes in meson-s4.dtsi default to
status =3D "disabled" and only be enabled in board dts files for the specif=
ic
components wired on each board?

[Severity: Medium]
In arch/arm64/boot/dts/amlogic/meson-s4.dtsi at line 1095, the spdifin
(audio-controller@330400) node specifies:

    interrupts =3D <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;

Across Amlogic AXG (GIC_SPI 84 through 90) and G12A/SM1 (GIC_SPI 148 through
154), the seven audio interrupts form a contiguous range ordered as toddr_a
(+0), toddr_b (+1), toddr_c (+2), spdifin (+3), frddr_a (+4), frddr_b (+5),
and frddr_c (+6).

In meson-s4.dtsi (around line 976), toddr_a through toddr_c are at GIC_SPI
32 through 34 and frddr_a through frddr_c are at GIC_SPI 36 through 38,
leaving GIC_SPI 35 between them for spdifin, while spdifin still has the
G12A/SM1 interrupt number 151.

Was spdifin intended to use GIC_SPI 35 instead of GIC_SPI 151?

[Severity: Medium]
In arch/arm64/boot/dts/amlogic/meson-s4.dtsi at line 1168, the toacodec
(audio-controller@330740) node uses compatible =3D "amlogic,s4-toacodec",
which binds to s4_toacodec_match_data in sound/soc/meson/g12a-toacodec.c
at line 317 (and is wired in dai-link-6, dai-link-7, and dai-link-12 in
meson-s4-s805x2-aq222.dts).

In sound/soc/meson/g12a-toacodec.c, S4 expands the Lane Select mixer control
in TOACODEC_CTRL0 to 8 lanes (shift 16, max 7, occupying bits [18:16]) and
defines field_dat_sel in s4_toacodec_match_data at bits [20:19] via
REG_FIELD(TOACODEC_CTRL0, 19, 20). However, s4_toacodec_widgets at line 147
reuses sm1_toacodec_mux for the SRC DAPM mux widget, whose soc_enum
(sm1_toacodec_mux_enum) uses shift_l =3D 18 (CTRL0_DAT_SEL_SM1_LSB) rather
than 19.

While g12a_toacodec_mux_put_enum() writes the selected source to
priv->field_dat_sel at bits [20:19], both dapm_connect_mux() during probe
and snd_soc_dapm_get_enum_double() when userspace reads the "TOACODEC SRC"
control read TOACODEC_CTRL0 using shift_l =3D 18 and mask =3D 0x3. This ext=
racts
bits [19:18], overlapping bit 18 of Lane Select and reading the wrong bits
for the mux state.

Does s4_toacodec_widgets need a dedicated S4 mux definition with shift 19 to
match field_dat_sel?

[Severity: Medium]
In arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts, the sound node
sets up external S/PDIF coax output in dai-link-9 at line 313 (connecting
spdifout_a to spdif_dit) and S/PDIF coax input in dai-link-11 at line 334
(connecting spdifin to spdif_dir).

However, periphs_pinctrl in meson-s4.dtsi defines no pinmux nodes for the
spdif_in (GPIOH_5) or spdif_out (GPIOH_4 or GPIOZ_9) groups present in
drivers/pinctrl/meson/pinctrl-meson-s4.c, and meson-s4-s805x2-aq222.dts does
not assign pinctrl-0 or pinctrl-names on spdifout_a or spdifin (defined at
line 1089 of meson-s4.dtsi). When axg-spdifout and axg-spdifin probe,
pinctrl_bind_pins() applies no pinmux configuration, leaving the external
S/PDIF coax pads unmuxed.

Are pinctrl definitions and pinctrl-0 properties needed on spdifout_a and
spdifin for the AQ222 S/PDIF coax interfaces to function?

[Severity: Low]
In arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts at line 146, the
dmics (audio-codec-1) node is defined with compatible =3D "dmic-codec" and
sound-name-prefix =3D "MIC". However, the sound node (around line 231) has =
no
dai-link subnode connecting &pdm to &dmics and no audio-routing entries
referencing MIC or PDM Capture, leaving dmics as an unconnected codec
device.

Is the dmics node an unused leftover that should be dropped, or was a PDM
dai-link and routing configuration intended for this board?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021-audio_drvi=
er-v7-0-2b9aeae9cb8a@amlogic.com?part=3D5
