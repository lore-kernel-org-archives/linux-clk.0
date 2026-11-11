Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391016;
	b=uVLUvEdOhpB/Wp0ao/y3uftuKZJTxk6luljTrlPzW4Xif+hS6JckWOEUCP8leuxvxCPT
	 9+RY/cfhO7jgM/GA2bhdiRyqckr5AaYkjoHmQLwUkNH7L/bM4xBFnrLHRw2OulJ6EILFn
	 yG2ihruEYLg4k0JfAlihaXfwqbcAGAvi+h6VGHcWTp+3oV+GByg+DGsFD80sp0Lvq1QVz
	 4wrKySBs1mlE+fzlVNm0+ExuqSHUfHZUh50ZOjhuj2K41S9tuwJM/ZaOf/Tlnf4yDfj13
	 Bhs/xljeSMrSJKbZAbou2kYHHJTso1P2a1S5Hu/0UPQvXXGxEZ/4FczCgplMRSwJTVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391016;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=6yHenUJhGZAe3PKizh9M58G+KHfnu4we1gIlsuIpIDI=;
	b=HoReiYKqrvfuiiJNi3DG6Lvzkz18ZamsKqKlWEdxYo7433mJrecwQ44TSByh0eBlAooY
	 c4Ac3wXHO1buIjs0rAtXTt3wwWJVaVGi4toQqafsYodS/o5YQvLE8mq52B0oRfkrGRqu7
	 fK4ruxm/zPDF13VXt46WAvYLKq7CYGJBX+myaRfGH6uxUh4eufDGi1wNRAOYnP+hOCYVL
	 D4SRlcFqIiPqUL0Tf+EQyMC4wl0McSsYLudpYm3V18SYlLRY/NE/11XdAg4+IU+HkR2Ey
	 DV86zJhx0S851haz6Qv+K1tD3vGmApuhbkSnDP2gexlKvheArYamTAc47t7gtAykHCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WXvFk3F+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CEF606A321;
	Wed, 11 Nov 2026 09:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WXvFk3F+
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 05B202006B6;
	Wed, 11 Nov 2026 10:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794391008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yHenUJhGZAe3PKizh9M58G+KHfnu4we1gIlsuIpIDI=;
	b=WXvFk3F+61CU54Ym7trObxW9xYz/mbrKKuC2r8tnN5yObEoZn+GStCbJ3SxHmHfJlEqZH+
	iEafUMV4dET7aYMWAhAZdy/v+ERrP2aoIO59PWV1ZmXCyvQYNLQPKlzNoWgB3O6KJpPdut
	USk57Q3O+4o3E7s4k1WW0uYGgQPa/nNAFNtBEZt/LrBgxoDud7FYMjKhIuMLgsniyjWdrI
	7u3hA0f6vGVmWGr8fxTB2BN0kBM0mhwijH8rmnwnLbb4CRK/vNrusJYIEN8s5JjZtbyDQC
	4RhU5qixZszwEec8zqiOwNFeuJEz/WNQ0yhLFmhBY9IvoqBs24bNhFY/2ptu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794391008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yHenUJhGZAe3PKizh9M58G+KHfnu4we1gIlsuIpIDI=;
	b=QgnlPgyqEheFYwtRSP9gnS8v+A1gb91KJExubPo4sC1u2Q59fzAT6snSHH98reLplTAyXL
	GnEqaTn3bKEc0Ja2NoH7gTytDShJs30YMd+Sym9ghxE5RQgUxHLuujQFqYm8dMwqYtfccX
	lQN98LPe96ziiMGKaOiGLisboWt79zX4B9q+e2p30BtGEvA/Ls55ccR3T1GVPTfHmafh9v
	soQOPLNOoHNLB7diCmv+FgwX9wRRwc6m8IWgyj4KYBGrJw66GeSkJ9mhgoa7TWAcBtyrl5
	7mEwOu2Cqu65zxNT9eguHuBAiXeFAKYLzfntX12mrbWZMkAtzhkaSKaLtwFZIA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794391008; a=rsa-sha256;
	cv=none;
	b=dTZhwMwmm5sSQ8oWQl2hPy5f7RGIxlq92RYKdJvCOuRoJkfv7x+LWIP/6o8uuWiEneQ+Ll
	znOFaOKU8xd4J6vUNxH+CTrV2/cUyHK96BKltF5SX0vQL2+gk/6BdUCZSRfhGjBFNKLPyV
	RqZgWFPOxvla7hyT26rUuUnwbY5KwhvsF5LjyY7js9jssEhv6TQXyH0/I42h/jJbLtKhjy
	yUw6PdG5RX16XEDR/3iApQhm8RYEq+51D7eLvEigbrc1vEcIQEZ9qca5Me6DCLgJZoRYM8
	TTL81xIMXQmY8LhTxtLQsNx+llWEIvxljT8m8+BmtZPOn9nYm+jmEh/Zujh0MQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <d59f52d1466c515f574be1e9eb127ca3e43d155b.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/4] clk: siflower: Add SF19A2890 peripheral clock
 and reset manager driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <u.kleine-koenig@baylibre.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 11 Nov 2026 10:56:47 +0100
In-Reply-To: <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev>
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
	 <20261111-sf19a2890-sysm-v2-4-d2fcb723e4f1@telaak.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-11 at 03:19 -0500, Joseph Telaak via B4 Relay wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
>=20
> Each CRM block manages a group of APB peripherals through three registers=
:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
>=20
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
>=20
> Some peripherals have more than one reset line, one for each clock
> domain of the same IP, like the separate UART and APB resets of a
> PL011. The driver exposes each such group as one reset, because the
> lines have to be asserted together: the GMAC's two lines are the two
> sides of an asynchronous AXI bridge, and asserting one alone locks up
> the bus.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from Chuanhong's siflower-7.1 branch
>   - one compatible per block, with its gate bits, critical gates and
>     reset masks in tables in the driver instead of the
>     siflower,valid-gates, siflower,critical-gates,
>     siflower,reset-masks and siflower,num-resets properties
>   - parent gate N to input clock N by index, not by global name
>   - update the gates under the spinlock too
>   - drop the separator comments
>   - Kconfig dependencies and help, subject]
> Co-developed-by: Joseph Telaak <joseph@telaak.dev>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  MAINTAINERS                                    |   1 +
>  drivers/clk/siflower/Kconfig                   |  11 +
>  drivers/clk/siflower/Makefile                  |   1 +
>  drivers/clk/siflower/clk-sf19a2890-periphcrm.c | 368 +++++++++++++++++++=
++++++
>  4 files changed, 381 insertions(+)
>=20
[...]
> diff --git a/drivers/clk/siflower/clk-sf19a2890-periphcrm.c b/drivers/clk=
/siflower/clk-sf19a2890-periphcrm.c
> new file mode 100644
> index 000000000000..349e0d7ce0c3
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
> @@ -0,0 +1,368 @@
[...]
> +static inline struct sf19a2890_periphcrm *
> +rcdev_to_periphcrm(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct sf19a2890_periphcrm, rcdev);
> +}
> +
> +static int sf19a2890_periphcrm_reset_update(struct reset_controller_dev =
*rcdev,
> +					    unsigned long id, bool assert)
> +{
> +	struct sf19a2890_periphcrm *crm =3D rcdev_to_periphcrm(rcdev);
> +	unsigned long flags;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&crm->lock, flags);

Could be simplified with guard(spinlock)(&crm->lock);

> +	reg =3D readl(crm->base + REG_RESET);
> +	if (assert)
> +		reg |=3D crm->reset_masks[id];
> +	else
> +		reg &=3D ~crm->reset_masks[id];
> +	writel(reg, crm->base + REG_RESET);
> +	spin_unlock_irqrestore(&crm->lock, flags);
> +	return 0;
> +}
> +
[...]
> +static const u32 sf19a2890_usb_resets[] =3D {
> +	[RST_USB] =3D GENMASK(2, 0),

Do these three bits control separate reset lines?
Does the hardware require them to be changed together?

> +	[RST_USB_PHY_POR] =3D BIT(3),
> +	[RST_USB_PHY] =3D BIT(4),
> +};
[...]
> +static const u32 sf19a2890_uart_resets[] =3D {
> +	[RST_UART0] =3D BIT(0) | BIT(4),
> +	[RST_UART1] =3D BIT(1) | BIT(5),
> +	[RST_UART2] =3D BIT(2) | BIT(6),

Same question as above.

regards
Philipp
