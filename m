Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391271;
	b=22H1eHs5tkkNOL1sFyOISbwv1b3T47u9k+g/Q6nNC5ieLh4zBdc2KBxGogQ9Agp2sdKY
	 QBqE4qaTdlIJlp0q0Qu+UqljuX2NR78o1mSp9WFW/G6wu5+wXfb6BcBOLbU7WdMCEJix7
	 dTQtSTU4LUu+zspHWabDODxSEziMEVR/HC1xb0e2Vrahz4WnxSS0f3owVyIhnLqKtQE0R
	 V8MvG2caQD/7988QsiyQbMNjxjZkHCSVaC+KbMB7uvehOx1k0MdtpXFrQSsdbdHQoHjWr
	 suCcRGowS+1FL4auD03/j4BHXw1B8COGidZDgZeyFpik44ghsxknSXekKEhL8/CYaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391271;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mUmhg+XzSgOizBM/HTfpUu2nybv+pdSuGATpu3ukT5k=;
	b=bBxz3nf0HoWgTmgUpofq/+AH6ROmyQWi2vCIvP/c+6Bef16FzuaEdEX3iWYd6rRKvU1i
	 /qZ3aAqkwt6SeQ7pGnFG+79G2XnlbHW7/Rc6Q6rT0Ve9HBrpkbb1wLRkmBWoZvA32vX6m
	 O4Ch7aCe7IwZhbOq4RVZd25VfyBGPWzxZ9lMS2L6OYUMKCFzIjAMGsqcXir+NRk39humT
	 Vnds8NXJ+RuCOyXs41wBxCKLt+47yxVcqts/8VOHC+XNrjf02+KgnXQjgjimUKP35HrgD
	 7EvsomhjfTsZOQTMHH18N6fHeSM62/CrPHx4T/GsM7cMEAquQD4b4sBXIE/rHuOcV3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fykzx5cC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C219560A6F7B
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fykzx5cC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5E41F00A08
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391271;
	bh=mUmhg+XzSgOizBM/HTfpUu2nybv+pdSuGATpu3ukT5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fykzx5cC3L9jM8/I6Rfitp1+muWVGMx62FgpMlSvqHw2GSFdoPfuIJu+N/ZvQiXqN
	 13oYocRR2C/gD0bXPlhifDPN77+ETJKd7NRjZSHMcHrlUC4r267dV9XIXRh0vPrfTm
	 RbskapgDNObCfzbG64FXCS2xVy36+Csu+vUjuiCR5B616m+p3B049AD1EKPmO7CLQh
	 xJ2xs0zQ0tgL6ZJ9gfae6nCTpXUo8euAdOc9/LqaJfSd94T1oMUYuupRitH7xdaJ2t
	 23cqsfeTWiYrnlu4b5CvipqjimjtgXoDybiN8Lpjzl4Fvtj1M1AZGcs/Il4HScKt3S
	 s/lgUgRPxbY9A==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-716ea2598eeso1733761eaf.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 02:01:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEENBC4MlTZtJctc7u0h5FnPqFglm1HAG9varcbGPEAy0yr+6InUqcZvGbxYCuJ8xpDEgom2tETtCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sCzdmcVqW2cvAdNDGcvu/nFOLrxX+Lxwk3w2DzFu/T0/sBiOI
	JV0TA5lqOYa+kYpgLZJLJvm3eMrjWykqZ6RnIJehKb4nOXvM890BEoTbBNFOiTWCp1GHvXktJv6
	gIYlm9Y/batDs6pNpoXaciPcvEoOGeIw=
X-Received: by 2002:a05:6820:c453:10b0:716:c485:eba4 with SMTP id
 006d021491bc7-719179c7cdamr758103eaf.85.1794391270535; Wed, 11 Nov 2026
 02:01:10 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-xg6846b-bcmbca-xrdp-reset-v3-0-d6adeb71afc9@kernel.org>
 <20261106-xg6846b-bcmbca-xrdp-reset-v3-5-d6adeb71afc9@kernel.org> <22be96ba4139cad12e46b5e64ae95b0033bde60a.camel@pengutronix.de>
In-Reply-To: <22be96ba4139cad12e46b5e64ae95b0033bde60a.camel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Nov 2026 11:00:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=-VYB23V-vD91Pfsae7QJjoQmv7M7Yu+FobDY90s+NVA@mail.gmail.com>
X-Gm-Features: AclHuK-czsJQZI3zTXq1LXffjfdefI2Xg2qfnJzhUIoxyF6N0VNLuNo5D59OV-k
Message-ID: <CAD++jL=-VYB23V-vD91Pfsae7QJjoQmv7M7Yu+FobDY90s+NVA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] reset: Add BCMBCA block resets through the PMB
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Ulf Hansson <ulfh@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:59=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
> On Fr, 2026-11-06 at 09:26 +0100, Linus Walleij wrote:

> > Implement the BCM6846 XRDP reset group through the shared PMB regmap.
> > Assert all blocks before releasing any of them, preserving the vendor
> > reset masks and ordering. Provide the independent PVTMON acquisition
> > reset as well. Serialize complete sequences and hold blocks in reset
> > on failure.
> >
> > Power domain consumers must enable their domains before requesting a
> > reset.
>
> Before requesting or before (de)asserting?

Before (de)asserting, I'll clarify or just drop the comments because
it's kinda obvious.

> > Zone transitions belong to the PMB power domain subdriver.
>
> Why mention it here?

Thinking aloud while working on the whole patch series.

> > +static struct platform_driver bcmbca_pmb_reset_driver =3D {
> > +     .probe =3D bcmbca_pmb_reset_probe,
> > +     .driver =3D {
> > +             .name =3D "brcm-pmb-reset",
> > +             .of_match_table =3D bcmbca_pmb_reset_of_match,
> > +             .suppress_bind_attrs =3D true,
>
> This is new. Why?

Other patches in the series got review comments (I think from Sashiko)
that as usual it is possible to build a system where you can wreac
havoc in sysfs by interectively unbinding and binding the drivers
if you wanna, and it's seen as a bad thing.

So I made the same change everywhere.

I'll look into the rest of the comments and (hjopefully) fix them.

Yours,
Linus Walleij
