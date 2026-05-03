Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918E9340281;
	Sun,  3 May 2026 02:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777776661; cv=none; b=oozaOKJrUb51gk0YdJsusTr8oAeYYzqI2/l0K5XwhpXvBIlOwyq1d9DegII72gZp5OFbqOyeVH/NyNnQavkv/8uop6pGO6Byz3dNGZO0FO/wHXFc9s3x3GFYNtkXUabDq2uUtL7Pxc3XFxUfnjCvj3PUsaUYR5GPqQWo3DNNOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777776661; c=relaxed/simple;
	bh=SWduPrPv7Hs1tnivvKljivRKChxKhiE0bWPaYXn0xWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ggc1MV4zcExki33IK6CGyFIBku7+FqB/0OSQW518BwHJxtNYCVfP5w9U+i6hPM2sIHUJFqXYkPPn7DIjQivE+9OKsEqIGz9VgbNZPHKG1UqSKiwk+6tNBoiiM3L9wNiwqrwboZsAlVn5Ep+dA2IMDR5cVycHex73o1nWHD+XWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yKfjR2zD; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yKfjR2zD"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g7TmT5w3Xz9t9n;
	Sun,  3 May 2026 04:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777776649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jmyfPlNX23L/mOTTiiXLgc1RStN2ndJcGiPbqaR3dc=;
	b=yKfjR2zDF2QVZrLp6pEZKOu5gV9mYEU6Mk+OazS9IYYjoW0P1NXTpKq7Ae5UQJSoN1fMVk
	Py0EhjKLEREv1fLBw1nLuWuG+8b6Nchn/RSJY2fNe/PM6J1JTzxhW/UZq/7vIoLUtFW0yv
	s/PhL+ePEglLuFZ2T85rkVBy2g3mxQr9ESJxq7FeavP7m/KsikGyglB8V6Qyl7ADK2vsQs
	Lxhmp7Xe6woXw6Mnbz99982wWZTODw85yb/GWfgkOKPdRZ/cyznxkWLCjKUekPCqE/xvOl
	Y1dm6O0e2sCtnnsQk52zamiI5kTPe7Pgs+s5gkLBMtHXR9qEtHKQGw5gdQ8nHg==
Message-ID: <0875e4a1-f112-4619-a229-2f6f9197f21c@mailbox.org>
Date: Sun, 3 May 2026 03:25:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-8-marek.vasut+renesas@mailbox.org>
 <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdX17D3n_5vxsvmaSmionjOqrEdPygjPdYuu6a0DR7b83w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: btp1myu5i1sycqg3wd8pncfykxy8hp97
X-MBO-RS-ID: 0401f179b09affd0292

On 4/29/26 3:59 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
> 
> This include is not needed?

It is not.

>> +#include "salvator-panel-aa104xd12.dtso"
>> +
>> +&{/panel} {
>> +       data-mapping = "jeida-24";
> 
> Is there any specific reason Geist needs "jeida-24", while all other
> boards use "jeida-18"?

This is a leftover, it should be jeida-18 , the Geist board pulls LVDS 
output(LVDS0) pin 19 MODE=L , which on the aa104xd12 means 6-bit mode.

> It looks like the major difference between Salvator-X(S) and Geist vs.
> Draak and Ebisu is that the former connect to lvds0, and the latter to lvds1.
> So what about renaming
> salvator-panel-aa104xd12.dtso to lvds0-panel-aa104xd12.dtso, and
> draak-ebisu-panel-aa104xd12.dtso to lvds1-panel-aa104xd12.dtso?

Will do in V2, although in a slightly different way.

[...]

>> +       x22_clk: x22-clock {
>> +               compatible = "fixed-clock";
>> +               #clock-cells = <0>;
>> +               clock-frequency = <33000000>;
>> +       };
> 
> X22 is not wired to anything; should we keep it?

DT is supposed to be hardware description, the xtal is there and the 
resistor footprint to connect it to the SoC is on the PCB, so someone 
might populate it and use the xtal. This isn't a particularly convincing 
argument for keeping the x22 node though.

[...]

>> +&audio_clk_a {
>> +       clock-frequency = <22579200>;
>> +};
>> +
>> +&avb {
>> +       pinctrl-0 = <&avb_pins>;
>> +       pinctrl-names = "default";
>> +       phy-handle = <&phy0>;
>> +       tx-internal-delay-ps = <2000>;
>> +       status = "okay";
>> +
>> +       phy0: ethernet-phy@0 {
> 
> compatible = "ethernet-phy-id0022.1622";
> 
>> +               rxc-skew-ps = <1500>;
>> +               reg = <0>;
>> +               interrupt-parent = <&gpio2>;
>> +               interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> 
> interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> 
>> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>> +               reset-assert-us = <100>;
>> +               reset-deassert-us = <100>;
> 
> Do we need these two? We don't have them in e.g.
> arch/arm64/boot/dts/renesas/salvator-common.dtsi

I believe we should add them, the KSZ9031 PHY does require 100us delay 
after reset is deasserted and before MDIO access is possible:

https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf

FIGURE 7-5: POWER-UP/POWER-DOWN/RESET TIMING

"
Note 2: After the de-assertion of reset, wait a minimum of 100 µs before 
starting programming on the MIIM (MDC/MDIO)
interface
"

[...]

>> +       pwm2_pins: pwm2 {
>> +               groups = "pwm2_a";
>> +               function = "pwm2";
>> +       };
> 
> What is pwm2 used for?

The signal is accessible on the EXIO connector D (LBSC) .
It is up to user to use the pin for their purposes.

[...]

The rest is addressed, thanks !
