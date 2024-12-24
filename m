Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2112.outbound.protection.partner.outlook.cn [139.219.146.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223EA47;
	Tue, 24 Dec 2024 03:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735011372; cv=fail; b=HrlD2L8u8yv1248A3eBvyj6PfJucHYQ5NjgDpOm1Qc3HdTKs7ZkQDB6k33OcFjpQa7eJejA7H3rUaYLWD9PfpPRI2sIQPpWCWVuJgwL8KKSLh065WG+kouGCXOqkGC+5C2M1uSririSyrx3TYV3BQVTFwRooTbmYlai0wKPJnk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735011372; c=relaxed/simple;
	bh=+xdDuc/GMPrE5rfppGAeeCjhy7/36c8DK4p4pelAT8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VTMRKTvCDE3K0sa6GA2g0y6m7VVudha6eJVYcQAq6rvynTYACYRTrSkBv9UnY0pmr3Ved860Vp0G1SccKUV+F4r+39oxCDcWs8YaODUXx2ih5zk3J6Q3Cf3TAZNxJXo2kJyuSfK1MfzMVWHeVvTi0M1FHpiPF9XIUsDWXBsW28U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlJ1l2Da3wkk+eC1nshFGyLyrDCpALYjXm18eC5jLM84gfxABq00L6QFEdSe0/XUmPMTw+HnCUafstNe/3hyrqHwKO4nsW3AEYM6oJAV6VHLf76TEzNUWFEbx/70nOThiDmFSIy2Uh7tJq7G0c9xXNxjKNTzaMXMbLI2Y6F88YM/ed2hYubz3zia1iBK7t6jyLPHH35SAxwfs4gEmCgVsOCjYSANLhll8+YQzt0TD5pVTOftUuMz2GpzRDgP86ZRKhNq2NyaDiCH3K+9to3wgzjUhro1Izeph1ESyNxOpBijjy8N+Q9F/YnVM4h3pOrAq4s2QV8j6IQ6+Y1+C2EZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4IkmCG/qv/vQVCqhg+YuJNP2BNgvUcL5loUMbuIoQI=;
 b=R6C7ordsjn2j5cGSztycx1MADrxTalhWnJcJ7uglKvUktn/YNBcohkDQ0jM4MhifyR2ku+p0i7fglIX6cmLJHu5n9tNT/5mFWAa93tvvjy5hMsVdepDsFkJwS5IwkPu1V7yxoOhwLgZZaRK0Oep6nA3gPIS3K/DxYUUvA/D+xh2FcGcMfstSoYlT9JH7thrqLD7/GFfW2Vc4bkz5ZdGOdpk9C1Hz7EDj/ZOlD+lVTGILLnYy5D3r62tIqTTCREp+edH7gJRAw4lE1s2JIjnrUdcSIg1zOo7+uDLBXs0DexLh7pghMHE9ld2ebOFfgZbi5QU7reZAOS6pc4+Zn0nmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB0964.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Tue, 24 Dec
 2024 03:21:08 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::617c:34a2:c5bf:8095]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::617c:34a2:c5bf:8095%6])
 with mapi id 15.20.8137.030; Tue, 24 Dec 2024 03:21:08 +0000
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Sunil V L <sunilvl@ventanamicro.com>, Rahul
 Pathak <rpathak@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 6/8] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Thread-Topic: [RFC PATCH 6/8] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Thread-Index: AQHbT5dxu/OqLWhH40y9wWQoYkVsiLL0uNNA
Date: Tue, 24 Dec 2024 03:21:07 +0000
Message-ID:
 <ZQZPR01MB097909421AF1E0415795D2028A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-7-apatel@ventanamicro.com>
In-Reply-To: <20241216084817.373131-7-apatel@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQZPR01MB0979:EE_|ZQZPR01MB0964:EE_
x-ms-office365-filtering-correlation-id: 606ead4c-8a91-4d47-193a-08dd23ca01fc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 JTc74pyv0ZpakmyggMCWHBl18dMZL37WI4lBctfHDXQqNfftdLIaHtAyNPG/kaUuPij9CIS4tUym77dmBDwkdhr7+/YiAmRvWMxjrLWZr/coa3re1rNthUAR/8cBUJ5NNOsYPVdimemeREkVemUom/gaz5odnYZfSQcoA3qWT5UHT3UhcLB2oaCBKpJWlHoCEu+df1ynuIgu08v7lj5CL0xd/ROJXn6TztvmeJBd1aT7n74dY0weaUTSu1Ydf/Fs6BnHqMbEXnvFYOvNXtA/c55xEFpb4klLrKE67qWawWjjvNOfBCMCg1s2+RfSj9T60IOEiQeF4fJBwOzJGubKfckIZo8LumBL0yRo+v8hsGxuzG6C7YST8zXklw0q2YOQ09OiS8bQjfjA6eDK0GR0j3rHVHxeY3pMFQfXP5XmGJyuFsarT6FOvUUYWAYhJW8kcUJy+6BqH92OJ5yH9XcYcYaioIsziUxj9uCauPegnePQiJz/8+MzTwHb4Y0X8Tr91nwNj6wn+9SzOyX1ocxNAemUmq/ZkuRp6TzEk/wBYzxJfStxMvlddd3gcSzozJXIRFTXL1g/5Dwq1pp7AxWTV/bc+Np3NkXwbLGT+33uGvU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m0Sd6B8d2UsLaeKtawz8hqSY772GL/1EGz0fI+5ILHirpEt/+kiRWQ5Xi/e9?=
 =?us-ascii?Q?3Kpayzli33WO5yOGyjEfG0gPEvElIM0fa3noKeDnC5RG8V7DHYcUoRdBlbUa?=
 =?us-ascii?Q?VlL5hhrfeKGNf05ql2Z41N1Z2Jy6E15KyKpQ25n4USSqr2sxmNg9ciM0CwGw?=
 =?us-ascii?Q?QPHuMyVmkfDkfFMLttKNbCNrbAgVORTDr7ysBw2bpbl/KTVyyzKcx+KX1ht6?=
 =?us-ascii?Q?Y3BYYHFKv4RCYov7nqj5jq/lI65bR7vuefLImbqPwFbl2MIM8+6ixwfOpRTf?=
 =?us-ascii?Q?mLsvhB3UVuL46v6jDwWy3Z3TwbV19f8yn+Kw9C/L7K0xVZxkzjlXERhuAyKo?=
 =?us-ascii?Q?SyrYaegRILJqHTqRYFJqnH7qqN17oh2ZxmIf/NEC0T9pO3y0rqShDjGTqymt?=
 =?us-ascii?Q?D6jnUS7yzS44gJpQ5mlr0xyNSoiLWQpIg+miUxbfolIkbNuoSZL9DGsiLu7s?=
 =?us-ascii?Q?Ed59fDBEXE/PpJLS0m4oTzNIgJuEegZqQZ3hh0rjm8+e+4If84/fN7fStl81?=
 =?us-ascii?Q?r4FF/+kuYh2bvTiU6188EB5Fg13HETbtJhjtn3qDc2fsO0cAOKD4kL9GokM1?=
 =?us-ascii?Q?JAiTYC48KMtpoO8k+MIFcYjE9pG2T36UXtMwaROKvf4VNsqq9Eei5/KX8wRk?=
 =?us-ascii?Q?OoSVywdsyXnFa7UUO6QWXbCRHzTSorTrCj3fk6WtPLQtJPb1y0xVCPb7UleD?=
 =?us-ascii?Q?Xz3Lf9FfXkTGv1PzK9ybFMIM3Z5ZwzI3L/i4rkvjuqQ1mW0+zLku3mHvc4CL?=
 =?us-ascii?Q?Vos1K5tC4HlXPw/WMYQ756StOQTOeo4dtFN3olD9OxpwVjpgQzChkSuHb3+t?=
 =?us-ascii?Q?J1TYzhTrEHI+h5pKnu0BvpDorI+NDiRJOEQ5LiYRTR/vALZg3f0cE/3MTgpM?=
 =?us-ascii?Q?5oUt8/w281qPOznfdsc794LSERfEMhVv0R6uNdGC/fI7wHMX9dGvLRqt6qQf?=
 =?us-ascii?Q?fD1gLKeJThtil/Bpp+7mhSqy7MWLrUYrChUMLW7XvNPd6m1JnyJJXPFnbWMB?=
 =?us-ascii?Q?9g+id1tN3ZCS8a6BUoHUo316G0KOw3qfD+d7eHL2klaTF/eb7db47xUPLZ3+?=
 =?us-ascii?Q?D5O+/9kS5HKjct40wyMsLU3bpdZucU9XE8/LwNHJYFWOoTMp3E9j/uJbsRXD?=
 =?us-ascii?Q?EcZZCDV247O4QgLe05BhW0YpySVs/VkPegPcbFKeVmQiK8HUxRZPxl4X3Ith?=
 =?us-ascii?Q?YzypmzH4ljxGml/sjhVRlCo8KRczdhsAZiEtmUd0Ov0nRbSsjWudBDzh6fy/?=
 =?us-ascii?Q?h4Zxb54pSGCHfdPyschiPN9+BL9DQ7XoWdvpwATDjUVaAdqRSgUCzPVJ2P/n?=
 =?us-ascii?Q?KMvEiJ5WtolDsBSZayOpHkW0Qi1FX1eB6Tn45EH0PP3k7Kc+qppDkUEs3hr1?=
 =?us-ascii?Q?334otQ24hx6De3E6Ji6mMD34WBsoZOYhj+rBi0b0A2MY+saKUMODo8N9Weir?=
 =?us-ascii?Q?6tJf85ZIADJMoyDKfh8jKgP9Uw7YnSYIrZY9NbDfb8qmPeXobNE/LLhoYo46?=
 =?us-ascii?Q?wPW99f23Yx+TzRtpuEpiUe1Z33O6vQUnSHxmAI6kKJio9YHFhAZpg1oR44LV?=
 =?us-ascii?Q?fvJHjH8L6PywJ5dRc/yQK0b0yLymrZ6Xx5auiuAS38IOsJqH0KzUkCwOmCKK?=
 =?us-ascii?Q?ZQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 606ead4c-8a91-4d47-193a-08dd23ca01fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 03:21:07.9978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VIIwGNDHWpGhKIENeirYjNhSwx8+MJTgo20cuQxo9dnekNpX2DK+6mhvPtesa3PIKuD4/jHd/I3lHZsdr5b3KIHNWw3R6U2ZAOqhIOOn/NE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB0964



> -----Original Message-----
> From: Anup Patel <apatel@ventanamicro.com>
> Sent: Monday, December 16, 2024 4:48 PM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jassi Brar
> <jassisinghbrar@gmail.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>; Paul Walmsley
> <paul.walmsley@sifive.com>; Sunil V L <sunilvl@ventanamicro.com>; Rahul
> Pathak <rpathak@ventanamicro.com>; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>; Atish Patra <atishp@atishpatra.org>;
> Andrew Jones <ajones@ventanamicro.com>; Anup Patel
> <anup@brainfault.org>; linux-clk@vger.kernel.org;
> devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Anup Patel <apatel@ventanamicro.com>
> Subject: [RFC PATCH 6/8] mailbox: Add RISC-V SBI message proxy (MPXY)
> based mailbox driver
>=20
> Add a mailbox controller driver for the new SBI message proxy extension
> which is part of the SBI v3.0 specification.
>=20
> Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/mailbox/Kconfig               |  11 +
>  drivers/mailbox/Makefile              |   2 +
>  drivers/mailbox/riscv-sbi-mpxy-mbox.c | 979
> ++++++++++++++++++++++++++
>  3 files changed, 992 insertions(+)
>  create mode 100644 drivers/mailbox/riscv-sbi-mpxy-mbox.c
>=20

[...]

> sbi-mpxy-mbox.c
> new file mode 100644
> index 000000000000..0592df3028f9
> --- /dev/null
> +++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
> @@ -0,0 +1,979 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V SBI Message Proxy (MPXY) mailbox controller driver
> + *
> + * Copyright (C) 2024 Ventana Micro Systems Inc.
> + */
> +
> +#include <asm/sbi.h>
> +#include <linux/cpu.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/jump_label.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>

> +#include <linux/mm.h>
> +#include <linux/msi.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
Sorting include header files based on alphanumeric.

> +#include <linux/percpu.h>
> +#include <linux/platform_device.h>
> +#include <linux/smp.h>
> +
> +/* =3D=3D=3D=3D=3D=3D SBI MPXY extension data structures =3D=3D=3D=3D=3D=
=3D */
> +
> +/* SBI MPXY MSI related channel attributes */ struct sbi_mpxy_msi_info
> +{
> +	/* Lower 32-bits of the MSI target address */
> +	u32 msi_addr_lo;
> +	/* Upper 32-bits of the MSI target address */
> +	u32 msi_addr_hi;
> +	/* MSI data value */
> +	u32 msi_data;
> +};
> +
> +/*
> + * SBI MPXY standard channel attributes.
> + *
> + * NOTE: The sequence of attribute fields are as-per the
> + * defined sequence in the attribute table in spec (or
> + * as-per the enum sbi_mpxy_attribute_id).
> + */
> +struct sbi_mpxy_channel_attrs {
> +	/* Message protocol ID */
> +	u32 msg_proto_id;
> +	/* Message protocol Version */
Don't need capital letter for "version" .

> +	u32 msg_proto_version;
> +	/* Message protocol maximum message length */
> +	u32 msg_max_len;
> +	/* Message protocol message send timeout in microseconds */
> +	u32 msg_send_timeout;
> +	/* Message protocol message completion timeout in microseconds */
> +	u32 msg_completion_timeout;
> +	/* Bit array for channel capabilities */
> +	u32 capability;
> +	/* SSE Event Id */
Same for 'event'.
> +	u32 sse_event_id;
> +	/* MSI enable/disable control knob */
> +	u32 msi_control;
> +	/* Channel MSI info */
> +	struct sbi_mpxy_msi_info msi_info;
> +	/* Events State Control */
Same here

> +	u32 events_state_ctrl;
> +};
> +
> +/*


[...]

> +
> +static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
> +				       void *tx, unsigned long tx_len,
> +				       void *rx, unsigned long max_rx_len,
> +				       unsigned long *rx_len)
> +{
> +	struct mpxy_local *mpxy =3D this_cpu_ptr(&mpxy_local);
> +	unsigned long rx_bytes;
> +	struct sbiret sret;
> +
> +	if (!mpxy->shmem_active)
> +		return -ENODEV;
> +	if (!tx && tx_len)
> +		return -EINVAL;
> +
> +	get_cpu();
> +
> +	/* Message protocols allowed to have no data in messages */
> +	if (tx_len)
> +		memcpy(mpxy->shmem, tx, tx_len);
> +
> +	sret =3D sbi_ecall(SBI_EXT_MPXY,
> SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
> +			 channel_id, msg_id, tx_len, 0, 0, 0);
> +	if (rx && !sret.error) {
> +		rx_bytes =3D sret.value;
> +		rx_bytes =3D min(max_rx_len, rx_bytes);

Caller should know if the rx_bytes is larger than max_rx_len?

> +		memcpy(rx, mpxy->shmem, rx_bytes);
> +		if (rx_len)
> +			*rx_len =3D rx_bytes;
> +	}
> +
> +	put_cpu();
> +	return sbi_err_map_linux_errno(sret.error);
> +}
> +

[...]

> +
> +static int mpxy_mbox_setup_msi(struct mbox_chan *chan,
> +			       struct mpxy_mbox_channel *mchan) {
> +	struct device *dev =3D mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if MSI not supported */
> +	if (mchan->msi_irq =3D=3D U32_MAX)
> +		return 0;
> +
> +	/* Request channel MSI handler */
> +	rc =3D request_threaded_irq(mchan->msi_irq,
> +				  mpxy_mbox_irq_event,
> +				  mpxy_mbox_irq_thread,
> +				  0, dev_name(dev), chan);
> +	if (rc) {
> +		dev_err(dev, "failed to request MPXY channel 0x%x IRQ\n",
> +			mchan->channel_id);
> +		return rc;
> +	}
> +
> +	/* Enable channel MSI control */
> +	mchan->attrs.msi_control =3D 1;
> +	rc =3D mpxy_write_attrs(mchan->channel_id,
> SBI_MPXY_ATTR_MSI_CONTROL,
> +			      1, &mchan->attrs.msi_control);
> +	if (rc) {
> +		dev_err(dev, "enable MSI control failed for MPXY channel
> 0x%x\n",
> +			mchan->channel_id);
> +		free_irq(mchan->msi_irq, chan);

Set mchan->attrs.msi_control =3D 0 if failed?

> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mpxy_mbox_cleanup_msi(struct mbox_chan *chan,
> +				  struct mpxy_mbox_channel *mchan)
> +{
> +	struct device *dev =3D mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if MSI not supported */
> +	if (mchan->msi_irq =3D=3D U32_MAX)


Should check if(!mchan->attrs.msi_control) instead of mchan->msi_irq?


> +		return;
> +
> +	/* Disable channel MSI control */
> +	mchan->attrs.msi_control =3D 0;
> +	rc =3D mpxy_write_attrs(mchan->channel_id,
> SBI_MPXY_ATTR_MSI_CONTROL,
> +			      1, &mchan->attrs.msi_control);
> +	if (rc) {
> +		dev_err(dev, "disable MSI control failed for MPXY channel
> 0x%x\n",
> +			mchan->channel_id);
> +	}
> +
> +	/* Free channel MSI handler */
> +	free_irq(mchan->msi_irq, chan);
> +}
> +
> +static int mpxy_mbox_setup_events(struct mpxy_mbox_channel *mchan) {
> +	struct device *dev =3D mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if events state not supported */
> +	if (!mchan->have_events_state)
> +		return 0;
> +
> +	/* Enable channel events state */
> +	mchan->attrs.events_state_ctrl =3D 1;
> +	rc =3D mpxy_write_attrs(mchan->channel_id,
> SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
> +			      1, &mchan->attrs.events_state_ctrl);
> +	if (rc) {
> +		dev_err(dev, "enable events state failed for MPXY channel
> 0x%x\n",
> +			mchan->channel_id);

Should set mchan->attrs.events_state_ctrl =3D 0; ?

> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mpxy_mbox_cleanup_events(struct mpxy_mbox_channel
> *mchan) {
> +	struct device *dev =3D mchan->mbox->dev;
> +	int rc;
> +
> +	/* Do nothing if events state not supported */
> +	if (!mchan->have_events_state)
Check also if (!mchan->attrs.events_state_ctrl)?

> +		return;
> +
> +	/* Disable channel events state */
> +	mchan->attrs.events_state_ctrl =3D 0;
> +	rc =3D mpxy_write_attrs(mchan->channel_id,
> SBI_MPXY_ATTR_EVENTS_STATE_CONTROL,
> +			      1, &mchan->attrs.events_state_ctrl);
> +	if (rc) {
> +		dev_err(dev, "disbable events state failed for MPXY channel

Typo ' disbable'.

> 0x%x\n",
> +			mchan->channel_id);
> +	}
> +}
> +


[...]


> +
> +static int mpxy_mbox_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct mpxy_mbox_channel *mchan;
> +	struct mpxy_mbox *mbox;
> +	int i, msi_idx, rc;
> +	u32 *channel_ids;
> +
> +	/*
> +	 * Initialize MPXY shared memory only once. This also ensures
> +	 * that SBI MPXY mailbox is probed only once.
> +	 */
> +	if (mpxy_shmem_init_done) {
> +		dev_err(dev, "SBI MPXY mailbox already initialized\n");
> +		return -EALREADY;
> +	}
> +
> +	/* Probe for SBI MPXY extension */
> +	if (sbi_spec_version < sbi_mk_version(1, 0) ||
> +	    sbi_probe_extension(SBI_EXT_MPXY) <=3D 0) {
> +		dev_info(dev, "SBI MPXY extension not available\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Setup cpuhp notifier for per-CPU MPXY shared memory */
> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sbi-mpxy-
> shmem",
> +			  mpxy_setup_shmem, mpxy_cleanup_shmem);
> +
> +	/* Mark as MPXY shared memory initialization done */
> +	mpxy_shmem_init_done =3D true;
> +
> +	/* Allocate mailbox instance */
> +	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +	mbox->dev =3D dev;
> +	platform_set_drvdata(pdev, mbox);
> +
> +	/* Find-out of number of channels */
> +	rc =3D mpxy_get_channel_count(&mbox->channel_count);
> +	if (rc) {
> +		dev_err(dev, "failed to get number of MPXY channels\n");
Suggest print 'rc' value when error. Same for other error messages below.

> +		return rc;
> +	}
> +	if (!mbox->channel_count) {
> +		dev_err(dev, "no MPXY channels available\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Allocate and fetch all channel IDs */
> +	channel_ids =3D devm_kcalloc(dev, mbox->channel_count,
> +				   sizeof(*channel_ids), GFP_KERNEL);
> +	if (!channel_ids)
> +		return -ENOMEM;
> +	rc =3D mpxy_get_channel_ids(mbox->channel_count, channel_ids);
> +	if (rc) {
> +		dev_err(dev, "failed to get number of MPXY channels\n");
> +		return rc;
> +	}
> +

[...]

Regards
Ley Foon
