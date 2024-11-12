Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FE3217451
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731451334; cv=none; b=F8QH7YjD7YbPqtyXnZw7sw3niwUFc13y5fGeh/NBnwQfcKxCHiBTb1KjLTfAHurEXzj0oZYBSIPQjul7Bshp31i7u5Rgiv7rPFxEIOKlGo2V3lF+ynuyvkJd4lZ8+qcOEeA2ejBN84YWOoCPEZTSgimYS/6Zn0TCcSoSLOQfeJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731451334; c=relaxed/simple;
	bh=p4bNIOCWxann+dITwn0U5cyWEoibozwMHdKvNT5h2Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fG+V3BhC1tLNSSDL0+Qavxs0G/9IF6yQA5+MjoRsOpvAhXOsgO6MLLoGmS7Rv6p2WzygCzpOS0NfEyIQIji+FrdkWL2f7Srt3a3wuHoJyPMKzDB8+AXa/2QnoU9T0ERV82uvp2EnSp6LAYQDgfgzGLe8Y22kDRF0c1ZSEsuZJvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g1Yf5QN7; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g1Yf5QN7"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B4D1BF203;
	Tue, 12 Nov 2024 22:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731451329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmaF3NlubL54V5+IH9CvKXoD4K1OzTYmIrjW7EvYFc4=;
	b=g1Yf5QN7KzgUfBDkeE+lIR43of5g55rveEuBu5jG3b72qHRRuUgy56D7vqigFMz3WYgoSg
	DTA9HvjfHzSFlqGF+5LF8LIOSX4F0pWK/bZU/nBLBX1KEKo71mo7mQNkVdsopehW4K3BeV
	WkBpBVTAXTWKXT1ZUyKStlFoDhanRWNXSkaYbVD5S8GOnxOJktSpcODI0almPAz22CSpam
	uAyiydzOB5ZWokmaUFkclZ5OUAdMdl7kNeaPeREh84Xa3Do3XJa31gu3ehX6gILtBkt+tN
	WiIgeLW8E0xuMEIJzl4PtEPSOQ0VKITwBKo+sp/yUO0z7jocdyLx3jjZfYblJg==
Date: Tue, 12 Nov 2024 23:42:06 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, "Lukas F
 . Hartmann" <lukas@mntmn.com>, Michael Turquette <mturquette@baylibre.com>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-ID: <20241112234206.558d5d5e@booty>
In-Reply-To: <20240531202648.277078-1-marex@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Marek, Abel,

+Cc: Miqu=C3=A8l

On Fri, 31 May 2024 22:26:26 +0200
Marek Vasut <marex@denx.de> wrote:

> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

I'm afraid I just found this patch broke my previously working setup
with a panel connected on the LDB. As we are at 6.12-rc7, and this
patch got merged at 6.12-rc1, I'm reporting it immediately after a
quick preliminary analysis in order to hopefully find an appropriate
solution before 6.12.

Problem: with this patch, my LDB picture is horizontally shrunk by a
factor of about 7, measured empirically.

Configuration:
 - lcdif1 and lcdif3 disabled
 - a single-channel LVDS panel on lcdif2/ldb channel 2

So this problem looks like different from the one reported by Adam as
there a single panel and still it stops working.

The relevant rates in my case are as follows:

                            video_pll1   media_disp2_pix    media_ldb
                          ~~~~~~~~~~~~~  ~~~~~~~~~~~~~~~  ~~~~~~~~~~~~~
at boot, panel still off: 1.039.500.000    1.039.500.000  1.039.500.000
requested LDB clock:                                        503.300.000
before this patch:        1.039.500.000       74.250.000    519.750.000
after this patch:            71.900.000       71.900.000     71.900.000

Previously, the resulting media_ldb clock was not precise, but close
enough. Now the value is clearly too wrong to work. Also (but my memory
might be wrong here) there must be a ratio of 7 between media_ldb and
media_disp2_pix, which has become 1 after this patch, and this perhaps
explains the shrink factor of about 7.

I double checked the rate that fsl_ldb_atomic_enable() is requesting at
[0] and it is 503.3 MHz with and without the patch. This is proved by
the logged line, before and after the patch:

fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (519750000 Hz) do=
es not match requested LVDS clock: 503300000 Hz
fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (71900000 Hz) doe=
s not match requested LVDS clock: 503300000 Hz

My preliminary conclusions:

 * it looks like a bug leading to an incorrect computation of the
   video_pll1 rate when media_ldb is requesting its rate
 * the bug does not look like due to this patch, but exposed by it

I still have no idea how the video_pll1 gets configured to such a low
value when its child needs a 500+ MHz clock.

Any clues or ideas would be welcome.

Best regards,
Luca

[0] https://elixir.bootlin.com/linux/v6.12-rc7/source/drivers/gpu/drm/bridg=
e/fsl-ldb.c#L180

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
