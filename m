Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr50045.outbound.protection.outlook.com ([40.107.5.45]:1952
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752449AbeF0DSv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Jun 2018 23:18:51 -0400
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] mailbox: Add support for i.MX7D messaging unit
Date: Wed, 27 Jun 2018 03:18:47 +0000
Message-ID: <AM0PR04MB4211DD477A8C8A1B2181D81A80480@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <20180615095107.24610-1-o.rempel@pengutronix.de>
 <20180615095107.24610-5-o.rempel@pengutronix.de>
 <AM0PR04MB4211BBB72255BDA36C5AFF9880490@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20180626132320.uvgfxff32p32ke6f@pengutronix.de>
In-Reply-To: <20180626132320.uvgfxff32p32ke6f@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Sascha Hauer [mailto:s.hauer@pengutronix.de]
> Sent: Tuesday, June 26, 2018 9:23 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Fabio Estevam <fabio.estevam@nxp.com>; Rob
> Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; linux-arm-
> kernel@lists.infradead.org; kernel@pengutronix.de; linux-
> clk@vger.kernel.org
> Subject: Re: [PATCH v2 4/4] mailbox: Add support for i.MX7D messaging uni=
t
>=20
> On Tue, Jun 26, 2018 at 10:09:14AM +0000, A.s. Dong wrote:
> > Since Sascha is requesting to write a generic MU mailbox driver for
> > both SCU MU and M4 case, the current way using virtual channels in
> > this patch only send one word a time obviously can't fit for SCU MU cli=
ents
> well.
> > Do you think if we can refer to TI case to design a generic data
> > transfer protocol to allow send multi words which is more close to SCU?
> > include/linux/soc/ti/ti-msgmgr.h
> > struct ti_msgmgr_message {
> >         size_t len;
> >         u8 *buf;
> > };
> >
> > Or we try to support both type transfer protocols in this driver?
> > That may introduce much complexities, personally I'm not quite like
> > that.
>=20
> To give you an idea what I am suggesting see the following patch.
> It implements SCU mode ontop of Oleksijs patch. Untested of course and as
> said, the mailbox framework lacks some way of synchronous receive, that
> would still have to be implemented and Jassi might have his own ideas how
> this could be done, but it doesn't add much complexity.
>=20

Thanks for this.
We did similar thing as I described in another mail.
The different is we use interrupt and hrtimer to polling for rx which is th=
e most
complicated part (Tx is quite simple). Be noted that for this demo code, we=
 do
not need enable RX interrupt if using synchronize polling.

If the mailbox framework can support synchronize polling, that would
be good and will be much the same as we did in library way. Then we
obviously can switch to mailbox way for SCU as well.

But as I repeat before, from your demo code, you can also see those bits ar=
e
much specific to SCU MU protocol which I don't think is quite suitable to b=
e
merged into a generic MU driver, except we can find a much common way for
handling both SCU MU and M4 case (e.g. change to TI style data transfer pro=
tocol).

But anyway, I will try it as you guys insist. Then we do not need stop at t=
his point
for the whole QXP upstream work.

Regards
Dong Aisheng

> Sascha
>=20
>=20
> ------------------------------8<--------------------------------
>=20
> From fad77078a1f1b5719fcc3c1ab789ce9cca4c9212 Mon Sep 17 00:00:00 2001
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Date: Tue, 26 Jun 2018 15:07:04 +0200
> Subject: [PATCH] mailbox: imx-mu: Implement SCU mode
>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mailbox/imx-mailbox.c        | 89 +++++++++++++++++++++++++++-
>  include/dt-bindings/mailbox/imx-mu.h | 10 ++++
>  2 files changed, 98 insertions(+), 1 deletion(-)  create mode 100644
> include/dt-bindings/mailbox/imx-mu.h
>=20
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index e3f621cb1d30..a4803d1eae1d 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -10,6 +10,8 @@
>  #include <linux/mailbox_controller.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/iopoll.h>
> +#include <dt-bindings/mailbox/imx-mu.h>
>=20
>  /* Transmit Register */
>  #define IMX_MU_xTRn(x)		(0x00 + 4 * (x))
> @@ -28,7 +30,7 @@
>  /* Receive Interrupt Enable */
>  #define IMX_MU_xCR_RIEn(x)	BIT(24 + (x))
>=20
> -#define IMX_MU_MAX_CHANS	4u
> +#define IMX_MU_MAX_CHANS	5u
>=20
>  struct imx_mu_priv;
>=20
> @@ -119,12 +121,80 @@ static bool imx_mu_last_tx_done(struct
> mbox_chan *chan)
>  	return (!!(val & IMX_MU_xSR_TEn(cp->bidx)));  }
>=20
> +// Take from some include file
> +struct sc_rpc_msg {
> +	uint8_t version;
> +	uint8_t size;
> +	uint8_t svc;
> +	uint8_t func;
> +};
> +
> +#define MU_DATA_TIME_OUT_US    (100 * USEC_PER_MSEC)
> +
> +static int imx_mu_scu_send_data(struct imx_mu_priv *priv, void *data) {
> +	struct sc_rpc_msg *msg =3D data;
> +	uint32_t *msg_raw =3D data;
> +	int i, ret;
> +
> +	for (i =3D 0; i < msg->size + 1; i++) {
> +		int index =3D i % 4;
> +		uint32_t asr;
> +
> +		/* Wait TX register to be empty. */
> +		ret =3D readl_poll_timeout_atomic(priv->base + IMX_MU_xSR,
> asr,
> +						asr & IMX_MU_xSR_TEn(4 -
> index),
> +						0,
> MU_DATA_TIME_OUT_US);
> +		if (ret)
> +			goto out;
> +
> +		writel(msg_raw[i], priv->base + IMX_MU_xTRn(4 - index));
> +	}
> +
> +	ret =3D 0;
> +out:
> +	mbox_chan_txdone(chan, ret);
> +	return ret;
> +}
> +
> +static int imx_mu_scu_receive_data(struct imx_mu_priv *priv, void
> +*data) {
> +	struct sc_rpc_msg *msg =3D data;
> +	uint32_t *msg_raw =3D data;
> +	int i, ret, size =3D 8;
> +
> +	for (i =3D 0; i < size; i++) {
> +		int index =3D i % 4;
> +		uint32_t asr;
> +
> +		/* Wait TX register to be empty. */
> +		ret =3D readl_poll_timeout_atomic(priv->base + IMX_MU_xSR,
> asr,
> +						asr & IMX_MU_xSR_RFn(4 -
> index),
> +						0,
> MU_DATA_TIME_OUT_US);
> +		if (ret)
> +			return ret;
> +
> +		msg_raw[i] =3D readl(priv->base + IMX_MU_xRRn(4 - index));
> +
> +		if (i =3D=3D 0) {
> +			size =3D msg->size;
> +			if (size > 7)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_mu_send_data(struct mbox_chan *chan, void *data)  {
>  	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>  	struct imx_mu_con_priv *cp =3D chan->con_priv;
>  	u32 *arg =3D data;
>=20
> +	if (cp->idx =3D=3D IMX_MU_CHANNEL_IMX8_SCU)
> +		return imx_mu_scu_send_data(priv, data);
> +
>  	if (!imx_mu_last_tx_done(chan))
>  		return -EBUSY;
>=20
> @@ -134,6 +204,17 @@ static int imx_mu_send_data(struct mbox_chan
> *chan, void *data)
>  	return 0;
>  }
>=20
> +static int imx_mu_receive_data(struct mbox_chan *chan, void *data) {
> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> +
> +	if (cp->idx =3D=3D IMX_MU_CHANNEL_IMX8_SCU)
> +		return imx_mu_scu_receive_data(priv, data);
> +
> +	return -EINVAL;
> +}
> +
>  static int imx_mu_startup(struct mbox_chan *chan)  {
>  	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox); @@ -
> 166,6 +247,12 @@ static void imx_mu_shutdown(struct mbox_chan *chan)
>=20
>  static const struct mbox_chan_ops imx_mu_ops =3D {
>  	.send_data =3D imx_mu_send_data,
> +	/*
> +	 * FIXME: This has to be implemented in the mailbox framework.
> +	 * Currently there is only support for asynchronous read using
> +	 * callbacks which is not suitable for the SCU usecase.
> +	 */
> +//	.synchronous_read =3D imx_mu_receive_data,
>  	.startup =3D imx_mu_startup,
>  	.shutdown =3D imx_mu_shutdown,
>  };
> diff --git a/include/dt-bindings/mailbox/imx-mu.h b/include/dt-
> bindings/mailbox/imx-mu.h
> new file mode 100644
> index 000000000000..4836266a7e57
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/imx-mu.h
> @@ -0,0 +1,10 @@
> +#ifndef __DT_BINDINGS_MAILBOX_IMX_MU_H
> +#define __DT_BINDINGS_MAILBOX_IMX_MU_H
> +
> +#define IMX_MU_CHANNEL0		0
> +#define IMX_MU_CHANNEL1		1
> +#define IMX_MU_CHANNEL2		2
> +#define IMX_MU_CHANNEL3		3
> +#define IMX_MU_CHANNEL_IMX8_SCU 4
> +
> +#endif /* __DT_BINDINGS_MAILBOX_IMX_MU_H */
> --
> 2.17.1
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww
> w.pengutronix.de%2F&data=3D02%7C01%7Caisheng.dong%40nxp.com%7C80f
> 356f57b1546baa07c08d5db67fe40%7C686ea1d3bc2b4c6fa92cd99c5c301635%7
> C0%7C0%7C636656162050199526&sdata=3DD0CE9mVcj8CakYwAET0aVUpGMe
> Ulz8thqzRfDgGlzkA%3D&reserved=3D0  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
