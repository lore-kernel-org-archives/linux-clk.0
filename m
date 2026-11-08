Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794156689;
	b=Hky21z8zg2nznpULbo102gjtxeadHXXN4W3YotJpcnDCELBRLM0/zv2VTRCogrfD6Gzl
	 SPHN/7BnRq0R1lRZN7PV207RWSb1HeYafQRIn8g0k+KPZALyWtcIHL+7RtDN5uvXnvBWL
	 JUK4jJoge1crXusJ+X62LaXyKwg+UCLLw7HixFUDP5Z1kQ6v++g3hJ3+Mv1AZQX7sRBH4
	 6LOFZGgOG3dZw58jHXJG8kcJJRcXDwZli3ZNQ5fO1MAtDa796m/uXXI4/nJx+OMZmz/D1
	 1Rr1DrbV/Ud4mn73gvlcGR0FXoiyWNv0YYvi0aSm6VyxZSz7DCQR8IuKB4WJKdFMdOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156689;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HYdezMpMDTFxzK1FZSXPnbV9koPM+33TOfuH3HebiDY=;
	b=yH8CJpXgT8gkS6dET4FToy3URon3fHwXb/6k3naGLYZXA7BrRj++Zck/2ni4rFc6s6aE
	 RYp2piQuPZbBbLtrSbXXXUa9D21SyhaHPKRhzVVdCVkRwFPTiRO4czCLnDaGAFcp//GcW
	 EfbtnDRjCfBprI1VvKUmKq7FOZsdXIE+wAIaOfn5ZValHcmf822qnckV++pj6WqWi9nXx
	 gLqnLCPHG6hZubtc7escrxHznmYb21sgpET1fldl5EYAMqlQ2Q3SVOpXngjmilrEFVjaj
	 aDpg6Z9sVH3aJ/OPYvmWN/mvgvtHgNIUWTQW0wpCEktznEbEofXXQY6q2ostj3xOQtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKY5HchF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3BE606A320
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKY5HchF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17D61F0089F
	for <linux-clk@vger.kernel.org>; Sun,  8 Nov 2026 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794156688;
	bh=HYdezMpMDTFxzK1FZSXPnbV9koPM+33TOfuH3HebiDY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cKY5HchFPJJy/ssHlxCtcZgd7QCYCOxatgwRkpX8JEKqBjsmbhNM79r0PcpXYzo8e
	 gh7Y2w7rK14qmB88u1U2WdH19UQJmkgX0nGJjCY0/BZASK+6NhUyBeJ2krTxzVwkEi
	 qrex2+0GSGngAboBwHrknrxGb+Y1g3sCrGM4K/xO0YR9u4BGY5Wq3k+cAx01xlSBp8
	 mNEPWbK7bWeEzyKZPC3AJcfCPQA76p3bw5DIIm5lTWXAfeC4md0egZbaoaSbUGG2hS
	 14E0rScpkZw/1vIFFRgzRVOTmDRLtrtMFh4bR+wrnILPdVk6Is3NTlfO9W+8f6z+y9
	 +32eJN5G9PJpQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso1804661fa.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Nov 2026 08:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1T2QqEvQ+b4F1ZyksR1jPnxaFDjZBaO+s7QEXrhD1flHBBzFTDoGz9BUEDVHpd2vPFIjcIoR14UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I/tn0WY6qQDFIcNBc/XtPWTU7goDmrpd/AdXcLHSt69lQr9jo
	Yc0PPrFwlHVF6MuspI/+HdBRvlTjcLPrYgAI2MfK1fIB+8uire6WZ+Le5CRNMkOsWox9Kx7mliF
	QIv3C9xAou8eU1s6GLwOvtsJDDJL1aCQ=
X-Received: by 2002:a2e:bcc2:0:b0:3ac:43b3:d926 with SMTP id
 38308e7fff4ca-3adfa427714mr2794851fa.8.1794156686440; Sun, 08 Nov 2026
 08:51:26 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com>
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 9 Nov 2026 01:51:13 +0900
X-Gmail-Original-Message-ID: <CAGb2v659Km1rsvEbnwtFZwX8O+rztBXc1xuSoS9_=siz0EDxRw@mail.gmail.com>
X-Gm-Features: AclHuK-CJjXMYHavmXJ4Bjl3HAAm8K3xT0QbfHYHd9dVDpGfItJLvFreCyFJ8Tw
Message-ID: <CAGb2v659Km1rsvEbnwtFZwX8O+rztBXc1xuSoS9_=siz0EDxRw@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: sunxi-ng: describe CCUs as tables, add the
 Allwinner B288
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 12:58=E2=80=AFAM Pablo Mazzini <pmazzini@gmail.com> =
wrote:
>
> sunxi-ng drivers describe each clock as a static structure, list it
> twice (ccu_clks and hw_clks) and keep a separate reset table. This adds
> a table front end: a SoC lists its clocks once, indexed by their binding
> clock ID, and the core builds the usual ccu_* clocks from that table.
> Bus resets come from the gate entries, and clocks that a SoC generation
> shares come from templates. Existing drivers and bindings are not
> affected.

I think you're going to have to give more justification. What do we gain?
What are the trade-offs? Building all the data at run-time means we end
up consuming even more memory. The tables from init time typically aren't
dropped when a driver is built as a module.


ChenYu

> The first user is the B288. Its driver is 212 lines here, against 749
> in the current style.
>
> This replaces patches 01 and 02 of the B288 series v4:
> https://lore.kernel.org/r/20261012100816.331033-1-pmazzini@gmail.com
>
> Pablo Mazzini (3):
>   dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>   clk: sunxi-ng: add a table front end
>   clk: sunxi-ng: add Allwinner B288 CCU driver
>
>  .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
>  drivers/clk/sunxi-ng/Kconfig                  |   5 +
>  drivers/clk/sunxi-ng/Makefile                 |   2 +
>  drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 212 ++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  11 +
>  drivers/clk/sunxi-ng/ccu_table.c              | 510 ++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_table.h              | 233 ++++++++
>  include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 +++
>  include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 ++
>  9 files changed, 1101 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu_table.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu_table.h
>  create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.52.0
>
>
