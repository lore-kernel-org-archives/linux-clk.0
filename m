Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B540DFCC
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653312; cv=none; b=jWhOJFFcC0FIw2BTFdadv7Ukl50GdbcHAmRdlclgJhDMOpnypMEek0YzOBARtxjnr/g+9TQDJsL9VkJfGepTCjDY/Pr316eWM7uF0W4LhYfqXxkE70M1kMS3VC5hN5qloi+LV6BmHseRd/HRss2XqTHrXOc6xUQ9qmtfwMZbjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653312; c=relaxed/simple;
	bh=sQmw9lWDcF2d/4KFoX+2MzyqctprsKDF8SgNpypvZGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2pN8GjX6MwUagwbSfV1kgAtL21lsq8aPjECJi+/qDM/sets/8jIod9g9NdOMyV/Tstdtjzp6d9SGj7hkk6gaCOyW3/kwlpc5NU63b5IXqeBVqo41zMxY9Hti4YdgelXqXoJ7PkpdJ0Ztg068Bxlr1T7REP788AF+ZRf/LyFywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9c5cb48bso1863158e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 06:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653309; x=1776258109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/ehc1JvHivWXa8+tx/BxLqhZP9bLnNS5TsQxkh+zto=;
        b=djRaXkNmMATH+dK/b2r0uHUsUnWyGXRqn8rZx2I5VnhSWiB8OUX6JUKUZqRYHMpJC3
         u+UEx7P0yJuBADb9CkvtZr4sa/xouhs1fbDBPskAEZjkAfDHJrh3pO5kL78fsAH5BIR+
         e9fHSNb22MzzFqy5I1nEhWL7nJtVTVOXIklgNX5NgRocg+BKiHWKrPvg2nfK8/mZ/Y5m
         AfQqAbIllD1j86fVSVh8w+GmpFj89hUyn1DVATYb0F7lZY3klwnlDbLdZcHDeGpISTuP
         UeBHYUPL1kfHx2vdQ28+yhGpr9CmqDF6pRKU7Jpzxh89eovfH36DOef9Y657JQo0n9z5
         Krew==
X-Forwarded-Encrypted: i=1; AJvYcCVR1NtMkBGFdzrYgkiXZ9FkFZCQyQh7yZtffoAyPXsJrvPMWM+wfaycsRDu7Eh/oDe03uWLFLSkbX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiiM7uhulN44D7OCypcAjw+UypkIA6l9p3Z/pkPls5vgcu6SGt
	gEBus1FsE1FPEgMvpGbmGMkAqjq5PLTy/SyLD/rUkMS/ubfWSaUB/eyL5wqZshJn
X-Gm-Gg: AeBDievoCUqcN7LZaLSoGtNc/cuhW/muD/OvxmRsHGAP7UkpfXYpMl3Z9yZpsGqxVub
	OuksXA8tcXZFbaItIPRFk7xORBC5qCzdlJgifLvi830rL8TefKK1AZKlCoAd0WqI3pIHb1TSnDp
	MzVxMInvZKklXhzK5BDUDBCMIB/gMN+fSMNcyGoB+l6kDmSGcRVFe690BCGqSPCFk34+yJ6HmEH
	KZAzHFFl3GBPHbFAvcWvHT1PWqY3ogpqaVp2RZO3UQaJNGfMW0rUu15ufS5y6SWZYgAPJvaYXd1
	fZg1IfRGlSe4/X84Ev9foc7C0Gw2FTMggPTQmafZ/WNacV0CzRUTdNaTi5pEjV2/v0ccxofg7HR
	Hw5jhTCHg6rLJDfa3PTIHMt3RagJiiA74It1ge+CCwKhRV+dASw7XBgdPSOdnW0u2senF4clzZ9
	CC2cjUOMQgG/KGQo+Pf/5F/OUPl6OwU6NWBGjBgLe9OJyRFy/AbYLabnzH3LtfAX7d
X-Received: by 2002:a05:6122:698d:b0:56c:d81a:5863 with SMTP id 71dfb90a1353d-56dab9461b8mr7556487e0c.8.1775653308866;
        Wed, 08 Apr 2026 06:01:48 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9cbbasm20897933e0c.9.2026.04.08.06.01.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:01:45 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56d958880ecso1771188e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 06:01:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiD8Bm1LsNT4x+P5I4AZC5St3doAy/lXny2k29cvDCzXPMrGb5hEMXGbR63F5XVTLwhX6sJdJ5OHQ=@vger.kernel.org
X-Received: by 2002:a05:6122:a05:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56dab90cf81mr7244283e0c.6.1775653285855; Wed, 08 Apr 2026
 06:01:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com> <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <481fefa0c9f6f0629a663fe3da1fb17e7f4a1a05.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 15:01:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWimH9kaOcwVx1LnujT=Lbm8cE50mj+YFxtBQMZCT0N8w@mail.gmail.com>
X-Gm-Features: AQROBzB38k87n7vfkgAHJ2zbU_998n7zblsjoYLjCSjeXBMYaqe_VAmcFna50bs
Message-ID: <CAMuHMdWimH9kaOcwVx1LnujT=Lbm8cE50mj+YFxtBQMZCT0N8w@mail.gmail.com>
Subject: Re: [PATCH v6 21/21] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 DU0 and DSI support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 8 Apr 2026 at 12:40, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable DU0, DSI and ADV7535 on RZ/G3E SMARC EVK.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -33,6 +33,7 @@ aliases {
>                 ethernet0 = &eth0;
>                 ethernet1 = &eth1;
>                 i2c2 = &i2c2;
> +               i2c7 = &i2c7;
>                 mmc0 = &sdhi0;
>                 mmc2 = &sdhi2;
>         };
> @@ -77,12 +78,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
>                 regulator-always-on;
>         };
>
> +       reg_1p8v_adv: regulator-1p8v-adv {

Please preserve sort order (alphabetical, by node name).

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-1.8V";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };
> +
> +       reg_3p3v_adv: regulator-3p3v-adv {
> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-3.3V";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +       };

Why not reusing the existing reg_1p8v and reg_3p3v?
Note that reg_1p8v driving eMMC and QSPI are also not the same
physical power rail.

> +
> +       osc1: cec-clock {

Please preserve sort order (alphabetical, by node name).

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <12000000>;
> +       };
> +
>         /* 32.768kHz crystal */
>         x3: x3-clock {
>                 compatible = "fixed-clock";
>                 #clock-cells = <0>;
>                 clock-frequency = <32768>;
>         };
> +
> +       dsi-to-hdmi-out {

hdmi-out?

Please preserve sort order (alphabetical, by node name).

> +               compatible = "hdmi-connector";
> +               type = "d";
> +
> +               port {
> +                       dsi_to_hdmi_out: endpoint {
> +                               remote-endpoint = <&adv7535_out>;
> +                       };
> +               };
> +       };
>  };
>
>  &audio_extal_clk {
> @@ -107,6 +143,37 @@ &eth1 {
>         status = "okay";
>  };
>
> +&dsi {

Please preserve sort-order (alphabetical, by label).

> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       dsi_in0: endpoint {
> +                               remote-endpoint = <&du0_out_dsi>;
> +                       };
> +               };
> +
> +               port@2 {
> +                       dsi_out: endpoint {
> +                               remote-endpoint = <&adv7535_in>;
> +                               data-lanes = <1 2 3 4>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du0 {
> +       status = "okay";
> +
> +       ports {
> +               port@0 {
> +                       du0_out_dsi: endpoint {
> +                               remote-endpoint = <&dsi_in0>;
> +                       };
> +               };
> +       };
> +};
> +
>  &gpu {
>         status = "okay";
>         mali-supply = <&reg_vdd0p8v_others>;
> @@ -132,6 +199,48 @@ raa215300: pmic@12 {
>         };
>  };
>
> +&i2c7 {
> +       pinctrl-0 = <&i2c7_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       adv7535: hdmi@3d {
> +               compatible = "adi,adv7535";
> +               reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
> +               reg-names = "main", "edid", "cec", "packet";
> +               clocks = <&osc1>;
> +               clock-names = "cec";
> +               avdd-supply = <&reg_1p8v_adv>;
> +               dvdd-supply = <&reg_1p8v_adv>;
> +               pvdd-supply = <&reg_1p8v_adv>;
> +               a2vdd-supply = <&reg_1p8v_adv>;
> +               v3p3-supply = <&reg_3p3v_adv>;
> +               v1p2-supply = <&reg_1p8v_adv>;
> +               adi,dsi-lanes = <4>;
> +               interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               adv7535_in: endpoint {
> +                                       remote-endpoint = <&dsi_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               adv7535_out: endpoint {
> +                                       remote-endpoint = <&dsi_to_hdmi_out>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
>  &i3c {
>         pinctrl-0 = <&i3c_pins>;
>         pinctrl-names = "default";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
