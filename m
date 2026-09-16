Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369DA3D7D80
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551800; cv=none; b=Xq7Gp+ms1M2voYDUN3+IKOj9Wbfh/zR/UmSpph2OX1b/n0lGUBCDHghYGoFFfF9Vvj+J1lIgztDLw8XZolvsAT2mMvULZwMkNptsSNx1iUUbZtKG6GmGvlk5D913w8cnp1n8B9GBsLsGxyE2GY3lfX3c3nFxt0nFaZyCrzoPYjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551800; c=relaxed/simple;
	bh=F3XAkt71bhIAWEC1ICnSKPfvdKIX/T9WRczYZnwW3iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfo/Kd8PTRzmDcL9XvF9Zcczpo/bsyisQ2guYlZCHV9LEK/h0AkgaJX69lL1vTcDrd6CDVl1L2pHSWIULoWtVmBTUfwFPsKfYAHgwsDO/luNMFWfWJPZbfkXZP3uTMRVPNnTxc3rbjBUwcMR4GHu9TXayjE5hZa6kmJzjZnMCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXl8q9ZC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXl8q9ZC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1E51F008BE
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551790;
	bh=F3XAkt71bhIAWEC1ICnSKPfvdKIX/T9WRczYZnwW3iw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IXl8q9ZCD1dvSn2KHw7LYsq5TamJfBC9svJngVUoPtAjGvN3AGOWjcegBVIRcvmFF
	 XT6NrbG9olT/96quf46Aj1p5TW/bOlRJqGEpKc2DvnnTXZ7qmrFaUvn7S/QkLAj9xA
	 VTA9+RM2dRfHk3re3CEfd0MoKCHcUNuhj2uVDlfmDu5vlNWPRtjDIjCN7m2aK4dKa+
	 vri7E5HQr9oevAF/INz6el1lZ/EqryyIvvWL5AuaOv2lDJ9wQjNtc9HTuu5uI9yeIU
	 jvNRYpp4RADOHSwGl1NXhGtH8HhW4PYN63KmDV1bs399TWMPA2ZvEm7XDa38cyNSOc
	 fNkQ+oRZi1HCA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so6404371fa.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 02:43:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByHjYFp3xB/9yq4Svpc1iiOfrSFcwi0AUM33CSYyaYiC8vdhkPMq/BumKzsjsmKw3WG7bi+eXWkuY8=@vger.kernel.org
X-Gm-Message-State: AFuF++lMK46cadbse+Vh7voAw6S2yLSE7dwFuJUVPukPJ2nZmeh9Q+4x
	J+7gH80YJQJ+uauQWBe3Gq/KGWBxFz6uBEqqxd8EFBKq2Uz655C8oPbRNhGV7zeNz9j+GT8xnzr
	OXoYeUD9ROQe7WzwidPtSUJxs67nYf6o=
X-Received: by 2002:a05:6512:318d:b0:5b4:b03e:b17 with SMTP id
 2adb3069b0e04-5b8b6611fb9mr542523e87.4.1789551789409; Wed, 16 Sep 2026
 02:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com> <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
In-Reply-To: <CAMRc=McEOcWq8i3B01AR1PnfBzSQaLEaOzE6Qa+QdVXrvS_YrA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 11:42:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnRL_s9zPNkSj2UnHWPx+QHAXV19DA7dEmGZu0AkxxyaA@mail.gmail.com>
X-Gm-Features: AcwNN1WkFxjMauP_yhzfkji573cflVZ6I3z5YLnNlcrQliI-kEo2Pckshh4B6Vw
Message-ID: <CAD++jLnRL_s9zPNkSj2UnHWPx+QHAXV19DA7dEmGZu0AkxxyaA@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: Bartosz Golaszewski <brgl@kernel.org>, soc@lists.linux.dev
Cc: longzhao@ambarella.com, 
	Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, 15 Sep 2026 13:15:30 +0200, Long Zhao via B4 Relay
> <devnull+longzhao.ambarella.com@kernel.org> said:
> > This series adds minimal Ambarella CV75 support for early bring-up with
> > a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> > gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> > MAINTAINERS.
> >
> > This is a single unified series. Please apply via the SoC
> > tree; subsystem maintainers are Cc'd for their pieces.
> >
>
> I would prefer to take the GPIO regmap bits through the GPIO tree and pro=
vide
> an immutable branch to the SoC tree as it has potential for conflicts tha=
t
> early into the cycle.

Queue them up and send us the IB if you think they are ready!

Long can probably send a PR based on that IB for the rest to the
SoC tree, a bit tricksy but it works.

Yours,
Linus Walleij
