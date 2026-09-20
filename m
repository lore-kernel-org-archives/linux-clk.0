Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24505485CDD
	for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943094; cv=none; b=rgmrIAjCccvUN4uffLV6hFET8euwMG9JnjlytaKWKY65ZLKtZ79BQCmPvfh3ogvmggsopyuKW7YOaM0HUbUYZxm/cE/QbCaZUndEAxfGNH6EQZWFlO+02jzESWsJjlYHYTvMDK2k8Rwo2xgj2WBAb4Ri8IJgkYPOt4+fBBOllEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943094; c=relaxed/simple;
	bh=WUPInYN4PL/yK9hW5R5yIfO87gDLK/c9FX+2yDiavu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M328iEYYAlAVtUKnehvlVZT2Oue8dCiORbl9hwZXb0X7Jvpiu9X45s6XnJkkxYOjLwdOt5sp6FwIUxAoaZclrJ1s6RcktJNKNy1dPFddkk5Q0uE4uGCdr1Pu51lNHrU78M+Oq6ZuFZh07BDY1CTWtBLLRgH0es4MAwtlWes5dfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZdIrP5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZdIrP5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D003B1F00902
	for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 22:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943090;
	bh=WUPInYN4PL/yK9hW5R5yIfO87gDLK/c9FX+2yDiavu8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bZdIrP5zvfwLap8QfgPC6COgqkkxn0Rp0hb4PQKz9GA5pE0+W/gBasPcsR/EvdFSt
	 UXm6945/ajbswS+4XQ+4dx7fZeirRuIc+eZIGHIAumn/joKyaWlX0hyYa+o71uUG10
	 AIdFA1c7JncyvouIlGceLHUvQwE3Cf+5H3xPuexO1N/xCbK2b8EjoGGNqBgV16XJTs
	 MFWpLEeSjom1yw8Bz/I9F2JDOetHNwbGFCMbEnrt8GPy2HiXcaLxcva//65OIZKiBq
	 C2P5cn1+tlcTLioHtUKEGVz/r7KfY7fmx+OnX+W2CU8cI5BaUMibP55Z3XY37kQhmZ
	 ENLiItDcfxrmg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5d4688decso23469341fa.2
        for <linux-clk@vger.kernel.org>; Sun, 20 Sep 2026 15:24:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxW6EDa8RxOtDAPX+6BIKwHuuqPs/77KRD9wrshd0w1ycpX1VznGlAo+J7VsXddJO5AUA9NuWH6K4I=@vger.kernel.org
X-Gm-Message-State: AFuF++lAtiiZ3JEsTkM0qCT0TxsxO/cnLqVHwocDx6uiA/AFUsoCQBBh
	xCCq8rImdaYQbYDPyc2D8oC5A/1LGWa26wk5YqfodDTWR4dVtWGTcbXEBQg2QZIwzfi2AYv73JL
	c3ez2w+Dq0gR+Dqp9zxcBP94XdIUvP3g=
X-Received: by 2002:a05:6512:4023:b0:5b6:1a7c:fd96 with SMTP id
 2adb3069b0e04-5b8c197532bmr2591380e87.60.1789943089466; Sun, 20 Sep 2026
 15:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com> <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:24:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbK8AHth2qQ6O-Yh8m4_8uKL1cJdNFqBjnP1ssUe3+Pw@mail.gmail.com>
X-Gm-Features: AcwNN1WFNRVHMkwoIIIv3cjD7Ln9bstVj0LBZyLRdnKTtq0jQLXH6pVRP5eDyRQ
Message-ID: <CAD++jLmbK8AHth2qQ6O-Yh8m4_8uKL1cJdNFqBjnP1ssUe3+Pw@mail.gmail.com>
Subject: Re: [PATCH v7 11/15] gpio: pl061: add Ambarella register-layout variant
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 1:15=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
> MASK and ENABLE. Probe unmasks the bank and enables the controller.
> IRQ type changes also clear the pending bit. This derivative does not
> need write-after-direction or system suspend save/restore.
>
> Match the part with designer AMBA_VENDOR_AMBARELLA (JEP106 identity
> 0x68, bit 7 set) and part number 0x061.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
