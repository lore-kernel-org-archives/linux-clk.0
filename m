Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2103.outbound.protection.partner.outlook.cn [139.219.146.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A94D9FB;
	Tue, 24 Dec 2024 08:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030363; cv=fail; b=qphp2dfoiJiPsnVcu4zxE82SVwEKbnBl7EEweTKaeCp5t+OGH+XssqIEybMAEHoo+VTCOGpc0Bh2VejHJJgBNphYcopeJazN+sO5ly0Xvc5wtKDWYB354cWMQnSo66WCubswjag4qrEoN/Yd+Zae16gfNAqb6pfPVkVSfNH+C/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030363; c=relaxed/simple;
	bh=phW2lASlbBbbnO2mpjkAx3FUDZ2WxQIBadjYJrT32Cw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uyk9JdcPAryxtDwTWLwEtd8v8DscgufuO9HqLtQHvOgoegeoRw22J8yuNvBfanYKxzmORfKPLgdQTdCbf7BVZxtT6UXOr2IZUtWkbphkb/UrSaX3A+8E+VNBJm0Bi+mB3Xnl9bXv6nB/JT5/mKho1iSa1zJAllknaqOjdIDNTGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdgyNZpsAaW1DVapOc2g8nCHpRu1C0yKX0TxL8OrPJlqOf6cIIqnnvYoieLznUj/wkw4jQyuYJfSUFs6roxE1WeaMD7684fwGiOWxMsgDa9LFXYeKH8NqIu9AApUqRRPQQUTk/sLPXKCGRKKhq6Rmdrrf3INwN42qRKOvXPgSIhqUszBq4FeJY4BM0ZrzZRKAe3S/575huQ/khEOWhv2bthpWqL/mbUhaezxp+eGNsVDN7vTLysL887V6VOa3NinVKs4b6hQZKRcONqU60B9i5QhdB20Iodgat8dp5QTMSCGj7gQMOM7SVc+ekW9Z6qfpMSvCh7TUjGm1IzTPZFMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iXtpBzoVE51QLSnNO7bGwygKtDa4BYngmOCAsrSqG8=;
 b=Eme73kKzQ2s4ZZ4mX038vrORezH7TqqIXJZlfHJ4mE4qSYhLgWISjbmOUtKfH52ZQRjBpuv/vdAiyRQ1qbYV7yLPiWLTdXQVBHZ0ewO0CUNlRejTfA8bbS/Ti4ay6DTWcofrJbj38T9p+PYtNaFjDbLgvTyZELQFmBdf1PoOBUmMZ59hF0R3E3MiBooUR5jR2baxVL2GFCoS+bk/mEtBcu2lgzUqzeHevnANTGXq99M7U71crwORqQ1yDfcTmGieVtm+dEMACzKNOr7/mQLxSAd6XCe6MMSb6BIm/sWf6/rOh7rFCD3yXqFkDptt1MvHMQVXGvn6z5dtD+6PzIUG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:f::12) by ZQZPR01MB0994.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.12; Tue, 24 Dec
 2024 06:21:04 +0000
Received: from ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn
 ([fe80::617c:34a2:c5bf:8095]) by
 ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn ([fe80::617c:34a2:c5bf:8095%6])
 with mapi id 15.20.8137.030; Tue, 24 Dec 2024 06:21:04 +0000
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
Subject: RE: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI clock
 service group
Thread-Topic: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI clock
 service group
Thread-Index: AQHbT5d4yMq+F4RklEWTShHpW18dE7L07hkA
Date: Tue, 24 Dec 2024 06:21:03 +0000
Message-ID:
 <ZQZPR01MB0979D745074A662620993C668A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-9-apatel@ventanamicro.com>
In-Reply-To: <20241216084817.373131-9-apatel@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQZPR01MB0979:EE_|ZQZPR01MB0994:EE_
x-ms-office365-filtering-correlation-id: 1170bc6c-8565-42e5-8aa9-08dd23e324e7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 sKuLVb9hiXRqZovGtKu36ZhQIMHlEaBBVnE1VA2mGTKM54I4NTZWKgX0dO2JrwRT8RpneaDyWnBFrxavYd2MxzqngGHumiySdsH9NdLMtPTzIaTBdzWzwFqNrpIEH9jKfgThwBYhmE1suAFVlahSQ0lvAd18nqfNIwpFsHtNv0uWSJdt07ddmgLWNcyECwnzbU/BKhoBugVUFnTYqknZmKooOQBBVffffssV45BlXzLCyiU/eivvMZ0wYvhHIsMkkdHwg6GNJX44XO9spaVg9mAXFsCg82VXwSyZEsllw7pIEq+1Rad6D3MJT3SQuI0EqzABFSZS3WZjykpzu4F/3x68M1s+R3MpdwVU95XYIxNKNXZI9ieVUQlhMu4DdhRQuls6aV5W3k7sMTS/1fPxXcNL/iN4CkJQIPBOj/9FTfP7BKE7tfSPEoI1y/kYPFeHUUEBcmgjmjkPgq2TFg5N/CyY0YvMVTNDE/1criYkWNKZFew6nnOayBOSX+XMp9BhJwzPdaIcIQqEnHf/d6v7PdTXx1vg1ctsIl+k6gp/2TvrfJWVMtanhTu28c141ZReJjmEFucfWAcqC06J+F9DnJvRwP70TGW2gFGEO/wWa0U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WfSQjnOoJBeBNtk0s6Z1XCGj4SlNvJ/lHHbOcLNc7p65xSdylVwhoTStzu99?=
 =?us-ascii?Q?z5QMAoc0zHhrmH/25NNOFqH4HmwSCRwIgBHkhFPTjdnZXHn/PKil2oq347uo?=
 =?us-ascii?Q?Tw0DIlFoBRa6EFtcBC6RooW2zBvCV2Mf1xhcYzbt8Kh5UUOwYbLx1OxjOXHQ?=
 =?us-ascii?Q?5dsSx82EztXS5OesLR5a0iE6+VvJYE3HisPhcrvAG+m8CD0rDW4ww7HRZeaI?=
 =?us-ascii?Q?BGjnng5UP47WxutfDDWHCj/Y9o1I9aVtFxAz9FNgTkPo5Knq5UmVwjnFjibw?=
 =?us-ascii?Q?VG0/UnNwl0nRX52UFf6FB3vZZpbeiKaI4OBHChEf2atIe01njXUDNAsQz8ID?=
 =?us-ascii?Q?0KxfkXumyxnSmpAUI8WxOdLWL+LXY6EJHpxJaaSqIb9gKPPkDEV5WLywruea?=
 =?us-ascii?Q?OVZzGZE/+xXC/aFnxg51E2pv2e8fLF0qZi15aPQPIuso0nUBaXumysIVc9C6?=
 =?us-ascii?Q?Gd1Fcm26d37opZBRM+lk2I1G7uor7OB+7Ym3X5fIJyL7yVhzpcnleYzm9CWH?=
 =?us-ascii?Q?TbJsPXe4tLqklReD8+JTaSNI4ZbVZHLF7JFRqf4qRIuzdDTDxadLOsZIQAF9?=
 =?us-ascii?Q?kqmx8tgABsCcFLDsD6Lqg7W/ou2g9BJz0slSqbKxKbdihCqeD9WJJdylknKJ?=
 =?us-ascii?Q?6ksXIcfMpIaXLuBF836jxsgJWBs5IU7oZ/JofLGmgkuqo8pcJnnFlbqiT3Lr?=
 =?us-ascii?Q?GmYE+zoVAFp/QIa7YsZaLipSIEfAvdhgp5zI82DTNTrBLbr1UhWjcyQevjJX?=
 =?us-ascii?Q?VigUXDzYzavaP1aqC6ILzaXFUus7WeRnoUH2x38TpOtCb2Xv7R1k7GpJkdJu?=
 =?us-ascii?Q?NPXzGwcwJ78XqFeeRu4BZx45++DmOztF4G7QsgWhrefL/3i6cReHEeWRVgD1?=
 =?us-ascii?Q?2rfGjb7luHMtZVVHvp0BZheUgSeYGcoTb4yIQCOB7uT3Y7wBMd6F8C4OrRgM?=
 =?us-ascii?Q?hZ4OqszuNntA1GnXfP32VHe9KL4pSDYrFsMGLvWVBPAYJYHxq09vs9GVAatY?=
 =?us-ascii?Q?1/lSdYTdxmb1bkkrnqcrTNZpfqLqZq1NCrvilqflbK44D5jOuJH22MTMCuFu?=
 =?us-ascii?Q?kY2w1Q1ORnvyUfGDOTyJBujwdXXWd601/X15Hqdw+FjQ7edkLJbfL11IoTew?=
 =?us-ascii?Q?u1FqhsQFbRx6AOYz8or5/uEn8dLcSPuOOo1wNWRyO0sh4adh2kCOcsTlhaKE?=
 =?us-ascii?Q?5TccNyPWzfvYajq+dnmmjU06jZ8RDVHDfyY/4EZvlbCt4rC30dHgdt3JVpjG?=
 =?us-ascii?Q?ZkFqP6JMZQqKc9as9bVm6iizro/2kfC0ZyqhBvZdAKyURhkMao7Bft4MoPAO?=
 =?us-ascii?Q?Z4oYEIQ0h/3FRkanLriRzfYPjL/a53Wn1jOJVJSNopO/FjkjJhAzo0JTvSv5?=
 =?us-ascii?Q?yNszWXXroGMHgHXZyC2PJOgbi0qGzmNLLuq5RbMxTJvx82sBhm4F/M7ss06S?=
 =?us-ascii?Q?Q4G4iG/W3o7RVo/eDzK95KUSNwQyt9+8e6rO455WFN9tfmrmOe5xCDl3L37n?=
 =?us-ascii?Q?oiyzj7a62bMV4OkQUHKdOzOyjJ23rlZY06rlqzutOfp5N3H1KSbElSLEZmio?=
 =?us-ascii?Q?j9bENgXFTKWWRf2FT2qYaUUi4+s72ikkG8YBZlhXLTADiUxSmqJi8hf2CyWD?=
 =?us-ascii?Q?NQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1170bc6c-8565-42e5-8aa9-08dd23e324e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 06:21:03.9659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zxcVahhkHNonxvCRsamb9vMxV4k9vU5XqTbWtv2RshNVGfc54czJ/1paCsLNn+xfEWNG7Vff0PK0wSLF+u6eW9IWbTNF1Sk+VxgHAnaJso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQZPR01MB0994



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
> Subject: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI clock
> service group
>=20
> From: Rahul Pathak <rpathak@ventanamicro.com>
>=20
> The RPMI specification defines a clock service group which can be accesse=
d via
> SBI MPXY extension or dedicated S-mode RPMI transport.
>=20
> Add mailbox client based clock driver for the RISC-V RPMI clock service g=
roup.
>=20
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---


>  obj-y					+=3D actions/
> diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c new file mod=
e
> 100644 index 000000000000..ed8e32527d3d
> --- /dev/null
> +++ b/drivers/clk/clk-rpmi.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V MPXY Based Clock Driver
> + *
> + * Copyright (C) 2024 Ventana Micro Systems Ltd.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/mm.h>
> +#include <linux/of.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/clk-provider.h>

Sorting header files in alphabetical order.

> +
> +#define RPMI_CLK_MAX_NUM_RATES		16
This macro only used for discrete clocks, so suggest change to RPMI_CLK_MAX=
_DISCRETE_NUM_RATES.
Is 16 too few?

> +#define RPMI_CLK_NAME_LEN		16
> +
> +#define GET_RATE_LO_U32(rate_u64)	((u32)rate_u64)
> +#define GET_RATE_HI_U32(rate_u64)	((u32)((u64)(rate_u64) >> 32))
> +#define GET_RATE_U64(hi_u32, lo_u32)	((u64)(hi_u32) << 32 |
> (lo_u32))
> +
> +enum rpmi_clk_config {
> +	RPMI_CLK_DISABLE =3D 0,
> +	RPMI_CLK_ENABLE =3D 1,
> +};
> +

[...]

> +static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk
> +*rpmi_clk) {
> +	struct rpmi_clk_context *context =3D rpmi_clk->context;
> +	struct rpmi_get_supp_rates_tx tx;
> +	struct rpmi_get_supp_rates_rx rx;
> +	struct rpmi_mbox_message msg;
> +	size_t clk_rate_idx =3D 0;
> +	int ret, rateidx, j;
> +
> +	tx.clkid =3D cpu_to_le32(clkid);
> +	tx.clk_rate_idx =3D 0;
> +
> +	rpmi_mbox_init_send_with_response(&msg,
> RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +	if (!rx.returned)
> +		return -EINVAL;
> +
> +	if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE) {
> +		for (rateidx =3D 0; rateidx < rx.returned; rateidx++) {

Need to check RPMI_CLK_MAX_NUM_RATES limit as well.

> +			rpmi_clk->rates->discrete[rateidx] =3D
> +
> 	GET_RATE_U64(rx.rates.discrete[rateidx].hi,
> +
> rx.rates.discrete[rateidx].lo);
> +		}
> +
> +		while (rx.remaining) {
> +			clk_rate_idx +=3D rx.returned;
> +			tx.clk_rate_idx =3D clk_rate_idx;
> +
> +			rpmi_mbox_init_send_with_response(&msg,
> +
> RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> +							  &tx, sizeof(tx), &rx,
> sizeof(rx));
> +			ret =3D rpmi_mbox_send_message(context->chan,
> &msg);
> +			if (ret)
> +				return ret;

Need check if (rx.status) here?

> +
> +			for (j =3D 0; j < rx.returned; j++) {
Same here, check RPMI_CLK_MAX_NUM_RATES.

> +				if (rateidx >=3D (clk_rate_idx + rx.returned))
> +					break;
> +				rpmi_clk->rates->discrete[rateidx++] =3D
> +					GET_RATE_U64(rx.rates.discrete[j].hi,
> +						     rx.rates.discrete[j].lo);
> +			}
> +		}
> +	} else if (rpmi_clk->type =3D=3D RPMI_CLK_LINEAR) {
> +		rpmi_clk->rates->linear.min =3D
> +				GET_RATE_U64(rx.rates.linear.min_hi,
> +					     rx.rates.linear.min_lo);
> +		rpmi_clk->rates->linear.max =3D
> +				GET_RATE_U64(rx.rates.linear.max_hi,
> +					     rx.rates.linear.max_lo);
> +		rpmi_clk->rates->linear.step =3D
> +				GET_RATE_U64(rx.rates.linear.step_hi,
> +					     rx.rates.linear.step_lo);
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long rpmi_clk_recalc_rate(struct clk_hw *hw,
> +					  unsigned long parent_rate)
> +{
> +	struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> +	struct rpmi_clk_context *context =3D rpmi_clk->context;
> +	struct rpmi_mbox_message msg;
> +	struct rpmi_get_rate_tx tx;
> +	struct rpmi_get_rate_rx rx;
> +	int ret;
> +
> +	tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> +
> +	rpmi_mbox_init_send_with_response(&msg,
> RPMI_CLK_SRV_GET_RATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rx.status;
> +
> +	return GET_RATE_U64(rx.hi, rx.lo);
> +}
> +
> +static long rpmi_clk_round_rate(struct clk_hw *hw,
> +				unsigned long rate,
> +				unsigned long *parent_rate)
> +{
> +	struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> +	u64 fmin, fmax, ftmp;
> +
> +	if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE)
> +		return rate;
> +
> +	fmin =3D rpmi_clk->rates->linear.min;
> +	fmax =3D rpmi_clk->rates->linear.max;
> +
> +	if (rate <=3D fmin)
> +		return fmin;
> +	else if (rate >=3D  fmax)
> +		return fmax;
> +
> +	ftmp =3D rate - fmin;
> +	ftmp +=3D rpmi_clk->rates->linear.step - 1;
> +	do_div(ftmp, rpmi_clk->rates->linear.step);
> +
> +	return ftmp * rpmi_clk->rates->linear.step + fmin; }
> +
> +static int rpmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> +	struct rpmi_clk_context *context =3D rpmi_clk->context;
> +	struct rpmi_mbox_message msg;
> +	struct rpmi_set_rate_tx tx;
> +	struct rpmi_set_rate_rx rx;
> +	int ret;
> +
> +	tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> +	tx.lo =3D cpu_to_le32(GET_RATE_LO_U32(rate));
> +	tx.hi =3D cpu_to_le32(GET_RATE_HI_U32(rate));
> +
> +	rpmi_mbox_init_send_with_response(&msg,
> RPMI_CLK_SRV_SET_RATE,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +
> +	return 0;
> +}
> +
> +static int rpmi_clk_enable(struct clk_hw *hw) {
> +	struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> +	struct rpmi_clk_context *context =3D rpmi_clk->context;
> +	struct rpmi_mbox_message msg;
> +	struct rpmi_set_config_tx tx;
> +	struct rpmi_set_config_rx rx;
> +	int ret;
> +
> +	tx.config =3D cpu_to_le32(RPMI_CLK_ENABLE);
> +	tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> +
> +	rpmi_mbox_init_send_with_response(&msg,
> RPMI_CLK_SRV_SET_CONFIG,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret)
> +		return ret;
> +	if (rx.status)
> +		return rpmi_to_linux_error(rx.status);
> +
> +	return 0;
> +}
> +
> +static void rpmi_clk_disable(struct clk_hw *hw) {
> +	struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> +	struct rpmi_clk_context *context =3D rpmi_clk->context;
> +	struct rpmi_mbox_message msg;
> +	struct rpmi_set_config_tx tx;
> +	struct rpmi_set_config_rx rx;
> +	int ret;
> +
> +	tx.config =3D cpu_to_le32(RPMI_CLK_DISABLE);
> +	tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> +
> +	rpmi_mbox_init_send_with_response(&msg,
> RPMI_CLK_SRV_SET_CONFIG,
> +					  &tx, sizeof(tx), &rx, sizeof(rx));
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret || rx.status)
> +		pr_err("Failed to disable clk-%u\n", rpmi_clk->id); }
> +
> +static const struct clk_ops rpmi_clk_ops =3D {
> +	.recalc_rate =3D rpmi_clk_recalc_rate,
> +	.round_rate =3D rpmi_clk_round_rate,
> +	.set_rate =3D rpmi_clk_set_rate,
> +	.prepare =3D rpmi_clk_enable,
> +	.unprepare =3D rpmi_clk_disable,
> +};
> +
> +static struct clk_hw *rpmi_clk_enumerate(struct rpmi_clk_context
> +*context, u32 clkid) {
> +	struct device *dev =3D context->dev;
> +	unsigned long min_rate, max_rate;
> +	union rpmi_clk_rates *rates;
> +	struct rpmi_clk *rpmi_clk;
> +	struct clk_init_data init;
> +	struct clk_hw *clk_hw;
> +	int ret;
> +
> +	rates =3D devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_KERNEL);
> +	if (!rates)
> +		return ERR_PTR(-ENOMEM);
> +
> +	rpmi_clk =3D devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KERNEL);
> +	if (!rpmi_clk)
> +		return ERR_PTR(-ENOMEM);
> +	rpmi_clk->context =3D context;
> +	rpmi_clk->rates =3D rates;
> +
> +	ret =3D rpmi_clk_get_attrs(clkid, rpmi_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to get clk-%u attributes\n", clkid);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret =3D rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> +	if (ret) {
> +		dev_err(dev, "Get supported rates failed for clk-%u, %d\n",
> +			clkid, ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	init.flags =3D CLK_GET_RATE_NOCACHE;
> +	init.num_parents =3D 0;
> +	init.ops =3D &rpmi_clk_ops;
> +	init.name =3D rpmi_clk->name;
> +	clk_hw =3D &rpmi_clk->hw;
> +	clk_hw->init =3D &init;
> +
> +	ret =3D devm_clk_hw_register(dev, clk_hw);
> +	if (ret) {
> +		dev_err(dev, "Unable to register clk-%u\n", clkid);
> +		return ERR_PTR(ret);
> +	}
> +
> +	if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE) {
> +		min_rate =3D rpmi_clk->rates->discrete[0];
> +		max_rate =3D rpmi_clk->rates->discrete[rpmi_clk->num_rates -
> 1];
> +	} else {
> +		min_rate =3D rpmi_clk->rates->linear.min;
> +		max_rate =3D rpmi_clk->rates->linear.max;
> +	}
> +
> +	clk_hw_set_rate_range(clk_hw, min_rate, max_rate);
> +
> +	return NULL;
> +}
> +
> +static void rpmi_clk_receive_message(struct mbox_client *cl, void *msg)
> +{
> +	/* Nothing to do here. */
> +}
> +
> +static int rpmi_clk_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct rpmi_clk_context *context;
> +	struct rpmi_mbox_message msg;
> +	int ret, num_clocks, i;
> +	struct clk_hw *hw_ptr;
> +
> +	/* Allocate RPMI clock context */
> +	context =3D devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
> +	if (!context)
> +		return -ENOMEM;
> +	context->dev =3D dev;
> +	platform_set_drvdata(pdev, context);
> +
> +	/* Setup mailbox client */
> +	context->client.dev		=3D context->dev;
> +	context->client.rx_callback	=3D rpmi_clk_receive_message;
> +	context->client.tx_block	=3D false;
> +	context->client.knows_txdone	=3D true;
> +	context->client.tx_tout		=3D 0;
> +
> +	/* Request mailbox channel */
> +	context->chan =3D mbox_request_channel(&context->client, 0);
> +	if (IS_ERR(context->chan))
> +		return PTR_ERR(context->chan);
> +
> +	/* Validate RPMI specification version */
> +	rpmi_mbox_init_get_attribute(&msg,
> RPMI_MBOX_ATTR_SPEC_VERSION);
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		dev_err(dev, "Failed to get spec version\n");
> +		goto fail_free_channel;
> +	}
> +	if (msg.attr.value < RPMI_MKVER(1, 0)) {
> +		dev_err(dev,
> +			"msg protocol version mismatch, expected 0x%x,
> found 0x%x\n",
> +			RPMI_MKVER(1, 0), msg.attr.value);
> +		ret =3D -EINVAL;
> +		goto fail_free_channel;
> +	}
> +
> +	/* Validate clock service group ID */
> +	rpmi_mbox_init_get_attribute(&msg,
> RPMI_MBOX_ATTR_SERVICEGROUP_ID);
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		dev_err(dev, "Failed to get service group ID\n");
> +		goto fail_free_channel;
> +	}
> +	if (msg.attr.value !=3D RPMI_SRVGRP_CLOCK) {
> +		dev_err(dev,
> +			"service group match failed, expected 0x%x, found
> 0x%x\n",
> +			RPMI_SRVGRP_CLOCK, msg.attr.value);
> +		ret =3D -EINVAL;
> +		goto fail_free_channel;
> +	}
> +
> +	/* Validate clock service group version */
> +	rpmi_mbox_init_get_attribute(&msg,
> RPMI_MBOX_ATTR_SERVICEGROUP_VERSION);
> +	ret =3D rpmi_mbox_send_message(context->chan, &msg);
> +	if (ret) {
> +		dev_err(dev, "Failed to get service group version\n");
> +		goto fail_free_channel;
> +	}
> +	if (msg.attr.value < RPMI_MKVER(1, 0)) {
> +		dev_err(dev,
> +			"service group version failed, expected 0x%x, found
> 0x%x\n",
> +			RPMI_MKVER(1, 0), msg.attr.value);
> +		ret =3D -EINVAL;
> +		goto fail_free_channel;
> +	}
> +
> +	/* Find-out number of clocks */
> +	num_clocks =3D rpmi_clk_get_num_clocks(context);
> +	if (!num_clocks) {
> +		dev_err(dev, "No clocks found\n");
> +		ret =3D -ENODEV;
> +		goto fail_free_channel;
> +	}
> +
> +	/* Allocate clock data */
> +	clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, num_clocks),
> +				GFP_KERNEL);
> +	if (!clk_data) {
> +		ret =3D -ENOMEM;
> +		goto fail_free_channel;
> +	}
> +	clk_data->num =3D num_clocks;
> +
> +	/* Setup clock data */
> +	for (i =3D 0; i < clk_data->num; i++) {
> +		hw_ptr =3D rpmi_clk_enumerate(context, i);
> +		if (IS_ERR(hw_ptr)) {
> +			dev_err(dev, "failed to register clk-%d\n", i);
> +			ret =3D PTR_ERR(hw_ptr);
> +			goto fail_free_channel;
> +		}
> +		clk_data->hws[i] =3D hw_ptr;
> +	}
> +
> +	/* Register clock HW provider */
> +	ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> clk_data);
> +	if (ret) {
> +		dev_err(dev, "failed to register clock HW provider\n");
> +		goto fail_free_channel;
> +	}
> +
> +	dev_info(dev, "clk HW provider registered with %d clocks\n",
> +		 num_clocks);
> +	return 0;
> +
> +fail_free_channel:
> +	mbox_free_channel(context->chan);
> +	return ret;
> +}
> +
> +static void rpmi_clk_remove(struct platform_device *pdev) {
> +	struct rpmi_clk_context *context =3D platform_get_drvdata(pdev);
> +
> +	mbox_free_channel(context->chan);
> +}
> +
> +static const struct of_device_id rpmi_clk_of_match[] =3D {
> +	{ .compatible =3D "riscv,rpmi-clock" },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, rpmi_clk_of_match);
> +
> +static struct platform_driver rpmi_clk_driver =3D {
> +	.driver =3D {
> +		.name =3D "riscv-rpmi-clock",
> +		.of_match_table =3D rpmi_clk_of_match,
> +	},
> +	.probe =3D rpmi_clk_probe,
> +	.remove =3D rpmi_clk_remove,
> +};
> +module_platform_driver(rpmi_clk_driver);
> +
> +MODULE_AUTHOR("Rahul Pathak <rpathak@ventanamicro.com>");
> +MODULE_DESCRIPTION("Clock Driver based on RPMI message protocol");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mailbox/riscv-rpmi-message.h
> b/include/linux/mailbox/riscv-rpmi-message.h
> index 8f4b3a0edbce..4e9478c4c0a3 100644
> --- a/include/linux/mailbox/riscv-rpmi-message.h
> +++ b/include/linux/mailbox/riscv-rpmi-message.h
> @@ -89,6 +89,22 @@ static inline int rpmi_to_linux_error(int rpmi_error)
>  	}
>  }
>=20
> +/** RPMI service group IDs */
> +#define RPMI_SRVGRP_CLOCK		0x00007
> +
> +/** RPMI clock service IDs */
> +enum rpmi_clock_service_id {
> +	RPMI_CLK_SRV_ENABLE_NOTIFICATION =3D 0x01,
> +	RPMI_CLK_SRV_GET_NUM_CLOCKS =3D 0x02,
> +	RPMI_CLK_SRV_GET_ATTRIBUTES =3D 0x03,
> +	RPMI_CLK_SRV_GET_SUPPORTED_RATES =3D 0x04,
> +	RPMI_CLK_SRV_SET_CONFIG =3D 0x05,
> +	RPMI_CLK_SRV_GET_CONFIG =3D 0x06,
> +	RPMI_CLK_SRV_SET_RATE =3D 0x07,
> +	RPMI_CLK_SRV_GET_RATE =3D 0x08,
> +	RPMI_CLK_SRV_ID_MAX_COUNT,
> +};
> +
>  /** RPMI linux mailbox attribute IDs */  enum rpmi_mbox_attribute_id {
>  	RPMI_MBOX_ATTR_SPEC_VERSION =3D 0,
> --
> 2.43.0

