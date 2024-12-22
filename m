Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2E148FF5;
	Sun, 22 Dec 2024 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734862659; cv=none; b=Up0tVgzGOG2zh+N673Z/etJ7HGff0t4yFjd7cFh97h4fwRgyaTpkrNhzsuv1LvAMW//OQcOGEjuW/mwp0WjeVVjZC8vb/yFMGyb5Asdpjm5+vamA74pCRXD6bUxdLG//EK9eHzk+0AgLE9X5KuaIcphv2wa7RcCW1YpKKuWKUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734862659; c=relaxed/simple;
	bh=mniBqk/RexziIWML9GCoBdOKAriTgcbv6f8UiJZg9O8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zs9WP9KgI0zCiS/SCZNHVIAo9nDYmUBWmqLNdqCjBTXqky0uMwZnejGRdjhZZzMtFC1RqwCaDrkJv/3Xb1J0vxi0OFq4Vn2WP8lRJnuPpnd55AmNUUm7ZfIfXG2uVddDF0eKIzrymCmJyfH8+WqofWcrrNnzG5MDXfgvTxGVYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev; spf=pass smtp.mailfrom=oltmanns.dev; dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b=jz7MWse3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="jz7MWse3"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YGHCC0pywz9sr2;
	Sun, 22 Dec 2024 11:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1734862647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7bWVFZ2ocZx/i+mr3Fjw04VK06XaWuS30/5YDXiDlM=;
	b=jz7MWse3HHVYSkcgb0cSihd2gV9xa6ibXhjO1V9QeYrJiJUvZnDK80sDTpixYf2oeQvDsf
	xyJjXrn3FRCcZUiooF2NQgpQMot0YDYQEkG5OeepMa+cFhUjntBAJJz0dyGq4yYfrdju4g
	etDa9LQoVLzc/tJGH4uQRFU0nZfGqp7yw2uQ5QrLz9aIKUL6nWbQxdaqXzmFORMHlFLgZR
	FaO11Nz4qW3KzkSoX8D8h5tsjngWqloMwcND/DrD0C14fAVnbZ/Rm9TOKcnSYiKgN71HUq
	wZdbH32Y35uV/rH2lTq9SKIXKVY+Z2joaDQ885Es6hS13ITTG9iDbKXLIy0vPA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Maxime
 Ripard <mripard@kernel.org>,  Roman Beranek <me@crly.cz>,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH 0/3] arm64: allwinner: a64: fix video output on Pinebook
In-Reply-To: <20241215053639.738890-1-anarsoul@gmail.com> (Vasily Khoruzhick's
	message of "Sat, 14 Dec 2024 21:34:56 -0800")
References: <20241215053639.738890-1-anarsoul@gmail.com>
Date: Sun, 22 Dec 2024 11:17:09 +0100
Message-ID: <87pllk58ey.fsf@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4YGHCC0pywz9sr2

Hi Vasily,

On 2024-12-14 at 21:34:56 -0800, Vasily Khoruzhick <anarsoul@gmail.com> wro=
te:
> Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in =
TCON0 mux"),
> TCON0 clock parent is always set to PLL_MIPI, but unfortunately it breaks
> video output on Pinebook.
>
> I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
> to the same clock rate and flipped the switch with devmem. Experiment cle=
arly
> showed that whenever PLL_MIPI is selected as TCON0 clock parent, the video
> output stops working.
>
> To fix the issue, I partially reverted mentioned commit and added explicit
> TCON0 clock parent assignment to device tree. By default, it will be
> PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
> override it in their dts.

I've successfully tested this series on my pinephone where it still
correctly selects PLL_MIPI.

Hence,
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on pinephone

I've also tested it on Ond=C5=99ej's downstream kernel (added him to cc),
where also the HDMI output continues to work.

Thank you and best regards,
  Frank

> Vasily Khoruzhick (3):
>   dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
>   arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
>   clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
>
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts  |  2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         |  2 ++
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c                 | 11 -----------
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.h                 |  2 --
>  include/dt-bindings/clock/sun50i-a64-ccu.h            |  2 ++
>  6 files changed, 8 insertions(+), 13 deletions(-)
