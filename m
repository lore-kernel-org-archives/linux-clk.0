Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5DF421EE7
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791109242; cv=none; b=FEBch3M2+fRr4WFZRfDUve77+s27OAA6bxIEiLoBLh/MK7KJqswqzlDaUnCJhbIHQyMjVrI2IKlhHwZb6o9ZUeVQTyCxndofdF0haAO+ueICqWNIXk0qXyEsG1PRjRFK+fOsSAXonu0JZvvIciq76pJZ4nc7gy4bxbMu/R8zvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791109242; c=relaxed/simple;
	bh=hXb1bMORajZ1VzBz9NyXP8raCs712bA7n+mRpfkPdh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUNhjJ1M/xi0UqmRnRqa6TUFUvsbSmTek6l4Wm0DQXaqaHpoaZoFf/3szKPhyk/D+QKad91hJ8wXWpixWR1gM4YWf+Kih3Jk6+N4UVMT9VD63cz4oFTHa2xacNDGcFgxV9y4gvJvWFyRdz40Nzoq98KpkdG2OMZfHQb4CDjAAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gqt4DRaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gqt4DRaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF771F008A3
	for <linux-clk@vger.kernel.org>; Sun,  4 Oct 2026 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791109236;
	bh=Vl53g7rpe8c2NvDVMufClYtHeiVeKNLfh36+hYUKK2Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=gqt4DRaVUlq3TTRXsfIWM+ZzYYHZ6izGC94e7qbADl0A3FjKHf+5f1eVeRUpRQrZc
	 5DY8JHzmgVqA6kEoot3HwdiD/d1WFwBb48n/s7/ChIUU74xfsCIdfNd36BBWVuQ4TW
	 LQtAiG06km7HbsGvLOX5c5DVettgRpizHcRL1V7iV4RSyAEJc/iV2dS94XP6IzmQcP
	 7R/2fRXXTipw20v9loYNPUVdUid+cxZeqqHzasSLqM0XNZOIdflqUZkikTG6RLt0Qd
	 q+OC4Mrc/1g93NatVhYQYpmDjlxeaHlxONdl6f5dbmUGMgalzDZYohMJ+5F9jXNQLG
	 aGKwPaUyOm5Dw==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a783ec301dso9188921fa.1
        for <linux-clk@vger.kernel.org>; Sun, 04 Oct 2026 03:20:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxuyNNQKcq+GH7ge7pmC02zbkxdQx7LBS397z467b+IO1i2y3piFpTlCqKxCgB00WL3iSGVDAvfIDA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8IWNtEfQ0s+OCCLZ/o0i3KOOMx0PXsCwwxf9lmg37ZYaae02b
	DgdAue824wMj3RuwlOAY1RbjRqxTknnF26fdb7s6fsUPTo6oxiGBDPlF64IO2mglepvTF53CRw8
	q7iOcpWKzP9Ay/Gh1V6OG4ky3fxyR4NI=
X-Received: by 2002:a05:651c:1505:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a8877ae1c5mr17889201fa.7.1791109234518; Sun, 04 Oct 2026
 03:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 12:20:22 +0200
X-Gmail-Original-Message-ID: <CAGb2v66YZtRW=1igjZogmO7qkzOggBDZs6jsE7qnSygrFR8XUw@mail.gmail.com>
X-Gm-Features: AclHuK8lO4-Xwk9IPWxNxJj8KXMJSBu0Tti5GLWoVOI0E89DZO986O0ZYPGFHF4
Message-ID: <CAGb2v66YZtRW=1igjZogmO7qkzOggBDZs6jsE7qnSygrFR8XUw@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] clk: sunxi-ng: a733: Add bus clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 7:28=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add the essential bus clocks in the Allwinner A733 CCU, including AHB,
> APB0, APB1, APB_UART, and MBUS. These buses are necessary for many other
> functional modules. Additional clocks such as trace and gic are also
> added as they fall within the register address range of the bus clocks,
> even though they are not strictly bus clocks.
>
> The MBUS clock is marked as critical to ensure the memory bus remains
> operational at all times. And the hardware requires an update bit
> (bit 27) to be set so that the configuration takes effect and the
> updated parameters can be correctly read back for the MBUS clock.
>
> The GIC clock is also marked as critical. The bootloader may leave the
> GIC running on a PLL parent, and disabling that PLL during
> clk_disable_unused would hang the interrupt controller and the system.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 105 +++++++++++++++++++++++++++=
++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 430a535919c6..eda4b347c540 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

I would prefer comments here for the skipped over CPU_PERI and NSI clocks.

Once added,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
