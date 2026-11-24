Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795516206;
	b=fkNI+XTWfB2VCxi9/dowDnX8Rx2QUNXm6a/YOsvZdSX3kXaQIA7fd+vhWOOa8GiHx8eg
	 4F1ScCVkkUeHKNGJaBwiq+GC7HJ6CK3D0rkv6bbaY7pNwbH+rwjU4budWpFvOvq+j20RW
	 4kbO3fob2BR6fT2KU+MAKSoCV4c+sDvcRvwi0u/M3gC/qxPB7TJWO+4jkxGeWEGztbQF6
	 WVcO2jYqMCACsLw0Rl3RaS6O+1R5lSu/jX1+mUtIm7DDX7lvij3yMa33SIFqgd91Va6eP
	 xUfes0Yv2VhgrB8bOVLiNVTQ+nLvqqhm3AceaosAa4Di63v3r6KbjNSiDZwC2NJo4Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516206;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=fvqpUaYvk9f/z+mIcVPsgnzKNqUqRWXkIX6uqXRqLX0=;
	b=XOmsGpBVvafIGRVLHS702JIT/Vw2gq7yalDU9W2qVOfBv2QIUbtVeUNFG0WUXUYeMAZg
	 EvcmxIZAc+O6jUiDsiZ20FmgUwLr+9Z9AidlrB2yOeBvMw+CNwxBCnoDPPwjcgv/y3sdL
	 QQMhMcZ4uF2hTRHcaWekd/ZBpg+Eo4KA1glekZ5s/goHlKCAqcraF0cgopZkJuQKKeDZK
	 sWszr3kA0orX65+D8Yde2Y4Z2gU/esfdA8X9cjEStTba8PFySjP/M25tu/x5ll2ILDIU2
	 unDgAJDH5Mq2kHDCaQDIs+VACLnX8AMEdlBGDFxTOikvi1nTZrtym3gPAjLcjTNtIcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=dM+gS99d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F9606A32C;
	Tue, 24 Nov 2026 10:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=dM+gS99d
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C3907201A7B;
	Tue, 24 Nov 2026 11:30:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795516203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fvqpUaYvk9f/z+mIcVPsgnzKNqUqRWXkIX6uqXRqLX0=;
	b=dM+gS99ddtlsxQ9OWhdpqVKfvJ6lVY0i0TGS5Ku27GmC+9NEpdrBpVek7eOepa06Zs7yUc
	quqXm++aWfafJghFV1DGy9fRgjmgEsNm68jdK3mXRKQvlnIOeMuUgVNINzo71yTLpgZksF
	MKqa/q7mXFNQNjvHLilVga52wvW23hBnmsygusgz64dNVcsfPzgZdsdCEygOgbJlb67cuy
	2uSXgGLSSQJLZ3jLCm15hfuqSkW3PXVT8HdiYk3Md111G+aSOCy9bmxW/WOuz6dtv+lEd9
	GbH0kGXZFf1oRoXS+uTx6w5dZ78a7VPhvzcnmUgLnSUVDAM3IPj/pKlKywFLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795516203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fvqpUaYvk9f/z+mIcVPsgnzKNqUqRWXkIX6uqXRqLX0=;
	b=TezWTQBF9YWVTLhcboUvlTc1tLXItyidILp5AJw+CU928bjTPxFFrNmxN5frevjCdXSEIY
	xHMEcIIBzrlM5/UJT7/LDYtcewblE8YVWwNE3loNLQT377Xe8gyjfs+6P0u91k6GPeDJbQ
	KvhpHVYN7PTvEAGkEulbBe3m0NiN2Xs3RB48cIELG2czSy8rVmDLbWbZiAOr5snc7793Hv
	pXiEVXG2kEfO/kIpWEbN1qaUc/MaakHh9EZaCe5krrcbvpyRvJVnqC+AmUVoxiBRfrdSfM
	WWgY6Oollfh/qj96OZ5YFNuVHWB5yf4LkpwJE6D3HA83Hk37CKhlFRfhxNJsvA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795516203; a=rsa-sha256;
	cv=none;
	b=fkEK7slnqgbBO+XuN6cijAGgy2vmQ/NG+qiy8DcOy0w0ENS9IqB7fgct3Wa+CvZR3tS/0x
	2x0jAvQMY2KUQYuWUelLCN9E/R3vfq6Es7FcB3mt2D5cLPsdME9OptyeQPG5ULTF9cfiPA
	ea2wobXE9yqmPFXEsPeYbCbY5xNZIaKNtspyxazP1Dxklx0PwUmeIpRAY67zLM0FwFmPLm
	fLRY5j5QGLs0Yq/VUcPd7DvpJnnYbo9gnPZ5d5zdm8CD+n11NQU2N9zDVr1zyW8hsxPkQR
	i8nzC8wsIhM/pbgvYhH1XtAL6Vn8d4XYqjAjEZ30FUIjQFoCwUTnJf9dNtsLZQ==
Message-ID: <bfa7cff359bf346981be355d0429f4743a58dbc4.camel@pengutronix.de>
Subject: Re: [PATCH v5 6/6] reset: Add Siflower SF19A2890 peripheral reset
 driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>,  Chuanhong Guo <gch981213@gmail.com>, Yao Zi
 <me@ziyao.cc>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 11:30:03 +0100
In-Reply-To: <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
	 <20261123-sf19a2890-sysm-v5-6-4ba44a0db17d@telaak.dev>
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

On Mo, 2026-11-23 at 23:41 -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> Add a driver for the resets of the Siflower SF19A2890 peripheral clock
> and reset managers. It binds to the auxiliary device that their clock
> driver creates and uses the registers that driver has mapped. Where an
> IP has a reset line for each of its clock domains, as the PL011 UARTs
> and the PL022 SPI controller do, one reset drives all of them, since
> they have to be asserted together.
>=20
> Based on the reset part of the driver in Chuanhong Guo's SF19A2890
> branch.
>=20
> Link: https://github.com/981213/linux/commit/37c81bebaf54
> Co-developed-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  MAINTAINERS                               |   1 +
>  drivers/reset/Kconfig                     |  11 ++
>  drivers/reset/Makefile                    |   1 +
>  drivers/reset/reset-sf19a2890-periphcrm.c | 194 ++++++++++++++++++++++++=
++++++
>  4 files changed, 207 insertions(+)
>=20
[...]
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 489fafd6bbe3..d4b707505c3d 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.=
o
>  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
>  obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2phy.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
> +obj-$(CONFIG_RESET_SF19A2890_PERIPHCRM) +=3D reset-sf19a2890-periphcrm.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SKY1) +=3D reset-sky1.o
>  obj-$(CONFIG_RESET_SKY1_AUDSS) +=3D reset-sky1-audss.o
> diff --git a/drivers/reset/reset-sf19a2890-periphcrm.c b/drivers/reset/re=
set-sf19a2890-periphcrm.c
> new file mode 100644
> index 000000000000..54b476237bd4
> --- /dev/null
> +++ b/drivers/reset/reset-sf19a2890-periphcrm.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Siflower SF19A2890 peripheral reset driver
> + *
> + * The peripheral clock and reset managers keep their resets in the firs=
t
> + * register of the block. Their clock driver creates an auxiliary device=
 for
> + * them and passes the mapped registers in its platform data.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/clock/siflower,sf19a2890-periph-crm.h>
> +
> +#define REG_RESET	0x0
> +
> +struct sf19a2890_periphrst_data {
> +	const u32 *masks;
> +	unsigned int num_resets;
> +};
> +
> +struct sf19a2890_periphrst {
> +	struct reset_controller_dev rcdev;
> +	void __iomem *base;
> +	spinlock_t lock;	/* serializes reset register updates */
> +	const u32 *masks;
> +};
> +
> +static inline struct sf19a2890_periphrst *
> +rcdev_to_periphrst(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct sf19a2890_periphrst, rcdev);
> +}
> +
> +static int sf19a2890_periphrst_update(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id, bool assert)
> +{
> +	struct sf19a2890_periphrst *rst =3D rcdev_to_periphrst(rcdev);
> +	u32 reg;
> +
> +	guard(spinlock_irqsave)(&rst->lock);
> +	reg =3D readl(rst->base + REG_RESET);
> +	if (assert)
> +		reg |=3D rst->masks[id];
> +	else
> +		reg &=3D ~rst->masks[id];
> +	writel(reg, rst->base + REG_RESET);
> +	return 0;
> +}
> +
> +static int sf19a2890_periphrst_assert(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	return sf19a2890_periphrst_update(rcdev, id, true);
> +}
> +
> +static int sf19a2890_periphrst_deassert(struct reset_controller_dev *rcd=
ev,
> +					unsigned long id)
> +{
> +	return sf19a2890_periphrst_update(rcdev, id, false);
> +}
> +
> +static int sf19a2890_periphrst_status(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	struct sf19a2890_periphrst *rst =3D rcdev_to_periphrst(rcdev);
> +
> +	return !!(readl(rst->base + REG_RESET) & rst->masks[id]);
> +}
> +
> +static const struct reset_control_ops sf19a2890_periphrst_ops =3D {
> +	.assert =3D sf19a2890_periphrst_assert,
> +	.deassert =3D sf19a2890_periphrst_deassert,
> +	.status =3D sf19a2890_periphrst_status,
> +};
> +
> +#define RST_DATA(_name)							\
> +	static const struct sf19a2890_periphrst_data sf19a2890_##_name##_rst =
=3D { \
> +		.masks =3D sf19a2890_##_name##_masks,			\
> +		.num_resets =3D ARRAY_SIZE(sf19a2890_##_name##_masks),	\
> +	}
> +
> +/*
> + * A reset that covers several bits drives the reset lines of all the cl=
ock
> + * domains of one IP, which have to be asserted together.
> + */

This comment seems misplaced. I suggest you move it up to the masks
field in the sf19a2890_periphrst_data definition or down to where
multiple bits are actually set. Also, s/reset/reset mask/ ?

> +static const u32 sf19a2890_single_masks[] =3D { BIT(0) };
> +
> +RST_DATA(single);
> +
> +/* The two sides of an asynchronous AXI bridge */
> +static const u32 sf19a2890_gmac_masks[] =3D { [RST_GMAC] =3D GENMASK(1, =
0) };
> +
> +RST_DATA(gmac);
[...]
> +static int sf19a2890_periphrst_probe(struct auxiliary_device *adev,
> +				     const struct auxiliary_device_id *id)
> +{
> +	const struct sf19a2890_periphrst_data *data;
> +	struct device *dev =3D &adev->dev;
> +	const struct of_device_id *match;
> +	struct sf19a2890_periphrst *rst;
> +
> +	/* The OF node is the parent's, so device_get_match_data() cannot be us=
ed */
> +	match =3D of_match_node(sf19a2890_periphrst_ids, dev->of_node);
> +	if (!match)
> +		return -ENODEV;
> +	data =3D match->data;
> +
> +	rst =3D devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);

devm_kzalloc_obj()

regards
Philipp
