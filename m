Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240967;
	b=cACWPku7GNI71ILPuIkKaG18AAdwMEfbtQfWiH7sCVYukBGxaR3mDJ6VzES5GVSQUCYX
	 QHSzEmxoM8I97bH407dJl9NkGT4ghbNQMYojrSZSH48NGNN2qyPuq6MTlUvqGdNEbPFy3
	 kWI1TnBqwDlz6wRs+r5DszoSWYUTQqe/AJXI4hKlZFzjlxUaiKUzUsHG9ODEvveVmV6CZ
	 gMRaCy7v7D4nprE7nHleMu27s37TOD+BUV/GQI9sXx4AzZ5R1MVphjm0N3gIBJpcIDerH
	 q66V+RpYu3RWBxYnsrcUyeLUK9ke8czegAVfbnYMAxCMig9huVrYi1sW9PC4TU/jLKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240967;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	b=LyjCyVDjrkUwQcDypgt9ssYQ74hH0pBgG15frQrZMqRzgp5xhjuCVivPHyEhTNUZZqPP
	 sNC8xGZG2P9N9rZehC9LmuF06dinT0Eq5Ja1z+YaSGKtDuGrm20GGaiuz4gl/V6iUNMGq
	 MI8WHc307zs+i/UNg5TvYyJa9kPW28HWDjYvX48DRYhKRu6uD6dIHRqu9oG+JkBhAuvLQ
	 hhlcEq/lGSIqPqDVnOr8+9Hp19PTYxaBxVBM1ZfHfMgDRd5LBO7VpHjqY4rBIoHh/Qs2S
	 S2/IUq1fGEjCLU2kfNnjdBBrxKA4iwf/nArImv+T/0pk7vlgqfdRfaYrg9WnfAWHSeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i6au/myG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328A606EE83
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6au/myG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6315A1F008A5
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240966;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i6au/myG9p4GsOKM3Vi2VV8GPL0M54b1Q0aP+nLEVBGLWzFiIIQL51O1MPCO+TJ4P
	 dOOlbWjxw1rDvIUfDn3HiHecyjD8xeH7auCSya7gDynZpsG6ifrwDgv2bj7GEdYFIS
	 6koTwc3GNJ3y4HxS5QqxvXa+YXh6iYr6A8T2PwO6HCn5shYGBESjwyGMR34m80I3S6
	 RwOdZ0texE0E8hg2AoMGmeS8P3ZBs66cKKylaV0qlfR4zBPdrX44gquG1jpaLHZqWu
	 iVi83j2JSgA+Ktlq/6aFAKZQLOSxJXn2dcRSQ5YbGFPhVhc6rBxkKvUFpemhYanYHR
	 PRqMUgFKiJXFQ==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f699fe49b3so705795b6e.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 08:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHE09e2AS4ex9atOMmj6966WGgegU3nu7ZWj2EF9N4lS9Xyno11m2ppCsZJUoOmyM2JPxmXA67NSlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5uV6I6ddCnrq3HOaoT4Xa5heqm/t+hIj2usut8Fa5MVOISpAu
	XoVhqAopOGfXyO0bN2irub/qgcDsoJUu134FWVVvavDS/dpxspKwXp+FRW7kAtzibjUP3+BgiNT
	E1YFWNqrZHfX61M3zESey+MwtBbdackU=
X-Received: by 2002:a05:6808:1209:b0:532:4867:8916 with SMTP id
 5614622812f47-5683c9e2ac2mr94540b6e.4.1794240965556; Mon, 09 Nov 2026
 08:16:05 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:15:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
X-Gm-Features: AclHuK8oi8fLMntRJV56LqbfIWbbWAJenIS4kljcKk7VrVTWKVxckSNOSzGxgTs
Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
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

On Wed, Sep 30, 2026 at 2:27=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add support for the Power Reset Clock Management (PRCM) module found in
> the Allwinner A733 SoC. This clock controller manages the clock control
> and reset functions for device modules within the CPUS domain.
>
> The PRCM module includes the management of three primary buses: r-ahb,
> r-apb0, and r-apb1. It also provides clocking for several key
> peripherals, such as R-UART, R-I2C, R-SPI, and the R-RISCV subsystem.
> Additionally, the reset lines for these modules are integrated.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
