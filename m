Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795415339;
	b=MYLnG0bZeqNzmHNjxli3FVw59UQ1v0+z96rdK9qXHEDO1NiMSIo26TfqIT51TiozlAG/
	 EzXPmO+8zQFXo+h52mMdVUVkdBFv1VCRvJ57Tx9doXBTCPAL1rXV+rLOPdLNuuBB/EYQ/
	 vJJ+wn0/v+0QomuYq/xe05Q+sN94TjZQGmQ/i+FbPcz3vWkIY4JxzQ65rXNJCJu3x8pvN
	 2wUTAdzCqrfEDmYxgZy3di+H8lLfz6aWFmPmDxvQy6L2au2rCOOSS6Qvq48oA+nmfsvZM
	 Cr+wb84s/P1DTi51bilzhfx8CGPVVWLuSoeX44EyEYs+kyfMbIzkwpH+hiXPomoJGUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415339;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7OH/X/0dKkdBC+GZx67jQhRYFOlATTQ7OgI6LfisTiU=;
	b=f4yJSyEPZv+YTHPeEHaBSmvUpzGpIinS0n48PYqGUXgUw5fzL5AVZTLBYh386V1m801x
	 +ASRa79hEGoGIYdhCzveaqIIleAIwPlCo47SJx1PC2zyTL6pvh5qeUwnm4dKO/M0Wtkd2
	 pfB3oh6/euOmFS1c6CMXbPZ+UJP0hGlw7iMb33UT8Y9JuUPNDpzi4YViEnMLoKIk5YteQ
	 Xq2B+PTecYnVl/1RFUlv+Ja5VRkW9tWXtTcNIKzBgnAlNU77oXHwVcPIjjDOwSsjVzMOT
	 nuKuADtC+K4MTtUHN2b0NMRTRBYBU3eYI1bUuCtbCJiNqcbU/XVjV06EWn4prmgL2xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.101
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2101.outbound.protection.partner.outlook.cn [139.219.146.101])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03013606A31A;
	Mon, 23 Nov 2026 06:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03013606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4XsrTdgfDjD2DRVOWd3rrraZKar3H1LQKnao9n0b5aN7YJom5EonBRojCpAi5t950K9jUCcM2LxYFHyQpGWSUw7K45NvwFQkEPYekUSwg9QkSiXspx71dh6uI0I7PLMG1L9XGrfIHmvLzNPey3IeeSHq2S+SgWTfiIU1zFQ72lbKPdV/3Rv5/4Dwe5dZmgOjnFPwS8gGmq+V07VK5HNg5tfhN1PvxFb+XJLWWwV07lJCJ0tywSkPnwWDHA4jJQtEqC4ZWhNPjoB6IzHKVaE7iR0gg+SzSWnuFQiF2UcxfLNFtfuaH5dOGBGNBq83LxE9GSL+yxkIXdNXswudMCfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OH/X/0dKkdBC+GZx67jQhRYFOlATTQ7OgI6LfisTiU=;
 b=JObEzTCKQinMpH0xObGyU0Jd0r4mUGyFsOmHur98JFlDwG9ZRkQ6fxPlAj/LPlmIc3Y85d3GTbIci3kiwZItqvZBS1CYrFGG+qYePGHigj7hnS6pXJFWlx5hkDqCGwL/BjQ8xC7GZXODa+/+rBDEgSx5P+Z+hyWa78JSTyTAvis/qEIU/EwrF/4qUuBKK63KxWbE46brIfTlxY1za0D3SBRYrIuYVB2sChtAkiaiALH48q30jilo3pjyd2NO1fwba+Hchnyn1RJs8ia7r0dlPpmZ+KovtfSrzgMuRRyDIn8X0CryJxPsQ0vQofYE7pCsNmBOVy+n8FGInEcKe4yA7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 06:28:47 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 06:28:47 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney
	<bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner
 Berthing <kernel@esmil.dk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v6 01/15] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Thread-Topic: [PATCH v6 01/15] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Thread-Index: AQHdVyFFNPsaGiCKfEOycsVRdPWCg7c7eK1A
Date: Mon, 23 Nov 2026 06:28:47 +0000
Message-ID:
 <NT0PR01MB11027EC0BAA285160F92DC2CE6452@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008123338.11081-2-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1216:EE_
x-ms-office365-filtering-correlation-id: 0324972b-4276-4750-9868-08df492b07bf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|4143699003|18002099003|261009223027099003|22082099003|56012099006|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 CdUAYWSf8Ed7Q2aNISjC2Yy2JaFM3uOOUwphcjavtlevLfybjn8tnpQoO4IONSAowbapYh1rCA/nPVEwOVgTxkqHtFBgIkE+8WES3zMePTwUHBIA9BWH2XSNcz84eT8aV9h7TmVEABv3Gdn/YEHSSXcRX4wazgJajF1kerIq8vURxOouGY5IU+WGXev1KWFc3g2wF7Sgyci6q3hVPEWaIPg9Vkd2pXSlfE5lvsQGqBNsHgB3c9RK+N59r7eaBI+KBHgqJX15iI5RVxYxUNXm4a9lLX9/Pb6TkSnmaKYItaF0fhSnXndt9fZM9kq3OjGqA49S3QSJCqHW2vSWF+UNAiBiFP7EeRClojdOEMyxgAFdcDQMtdlrRAjABqIgWmrWivrOKWDeJ+IZ5xgm/yF7U04NlP/FIPVc0JdNmcRsyH5175HMR3Zm/KngrLkDZLnBCuRKtDGAw4ZdGQDecgR8bxI0+jXzoU3BBolluaQqQ6I5+p8L3r4IPCsgC0DHdTwp7yu07hKPlRfF4D7cCWXlEpZsDY1SuUU4wvbxK2g36KQwJX6DutQ86bi4lkD6D8+k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(4143699003)(18002099003)(261009223027099003)(22082099003)(56012099006)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xIFNBVgb3xxU4YxowW63sV+LMZKWYntgyVGP4tQtQRUOjwxuuV0Ci2YgrmAw?=
 =?us-ascii?Q?8EgixD0oa9ePaDjJu+FZwmbrd6fNz/UsCKmvqYzUhYgVRywxFXckys4DfQQh?=
 =?us-ascii?Q?M2pAT9wJGEwYrNzthDbfHRCf4TMBu/9icjmENsZNvD2qqhtKeQmlKK1sQT5C?=
 =?us-ascii?Q?KTkMQqyGrovqZs0Chr4ma4l5RmQtfjJvCbIOwPA1FIRC85ZI88n5BGCgK3x/?=
 =?us-ascii?Q?5RYugo2vxq8Ll/WvqkGWVvBCkZiAaSjLjTu3vB0I7S3h3X1jjeuiUrQ/nkfn?=
 =?us-ascii?Q?tc+J8LpDK+MDfIx1XhiA24C0nY4NafKC7lcCbBYg++AcwXS+sFQSumujuHt4?=
 =?us-ascii?Q?CRAMSptE73n0LpUG4NtxckEvudr9Lo1c4maafUJewRjC3dryDwC5rdbKzZZn?=
 =?us-ascii?Q?iHXl+AQS7S5sKWlywEjgBZqwx9lAAl1ydcgerQnhfm1jSbNXwUMwmEy0igcR?=
 =?us-ascii?Q?CqR/YMtBZyBrXDEFrqiW9icvJqJA+OIVWMfiwo5AQS05UMp4aevoxFYp128E?=
 =?us-ascii?Q?EwByuGuI9hUgiW92hR5U20bfC1YvXtex4BzLoIsdMqJRExKZAqO82p+OROZ2?=
 =?us-ascii?Q?DKBvq6f+F/NGVORkXAmq4ZZ27h2+gKYcrw4RCf+lW6mdRZS6fX6ATm5+xmLU?=
 =?us-ascii?Q?oRyFob4bb9vKWuzCbJB/CZHFPOq8fvk5+bg4Cn2D2ZBRpSetCvHsF1+Mb8iw?=
 =?us-ascii?Q?ubMj9LwKcv74DuocCUFLunPPs0unDNHJ+rYca4YIWzOGhkFYxu74TjzZE3QL?=
 =?us-ascii?Q?Uj6C8GEp24/4x5af007GKefHowiwiiANWQefHXNYs7rIfJO0sCDO6ov31A2b?=
 =?us-ascii?Q?tebW/RbQXMtTJoZDTKtqCC162LEb5MOcXWtE0U6mNC16DlPXmYdsBjKVxgN+?=
 =?us-ascii?Q?sadtQmAXiYLu3Nrf+LO4OuislFlhRe15jf9M2KM2M4kpfDkssI/yJ4JoMqNE?=
 =?us-ascii?Q?SqhOFHdlik6GatxzcfAmtYRPPJJc2uo5JKy4OMMzPG7eMX+FDXkjHLkX9wgm?=
 =?us-ascii?Q?pnuwJC+YxXJYux2MOmQl9RA7eCDUveW9x0Z+SIO+U8lhGP2HUN6XZGAJLeyB?=
 =?us-ascii?Q?QP+Oyu33W901NMw//UD2K7lrbxcT3IrVKHlbA52aIjMQ+mTYHW9w9XlsxGN9?=
 =?us-ascii?Q?6+ayjijTXR3KX/RqDdFJCpAsHynZlkOpfl01FaFxJKLBvOGV0ji0v9MA5U27?=
 =?us-ascii?Q?WTB/pITI+r5lvKGuyLHAQ19QyP8NE4ws5AMDuabyGjxnGJr2w9wUG+jkLTsv?=
 =?us-ascii?Q?cc7IlKmsKOOIK8hGqip6sfHgYNmK7VGET6m8CuxG58tdKBpE1kY/Qo4qZ8Ah?=
 =?us-ascii?Q?Bya/hBmqKGJ1eBqThFaRqxQx937xYOaaxnrqlkgg9e3hZ2+5g1u/+hDiH5Ds?=
 =?us-ascii?Q?G+9HP/rm6JBZezO64TsD44xE4muFkb4PWrm/9FJMSU4geZL3wbiqsMXXIC+w?=
 =?us-ascii?Q?X9/J6RLPHg2oOlvOr7mEQkOT5/Dpco++zgzka3efHgkxMePlheXHKlIUI0BB?=
 =?us-ascii?Q?8peATu0GAigy3Kh0kMmhhzzv41NjsteEz9f0I4sgDU/dCL2PlepUXE8kUwaD?=
 =?us-ascii?Q?+iHssq0UVaoJ5jH6VhzYkF9rtABRdQ3vbi4PWJ85XENJoRmKgUl1TWRYKTv3?=
 =?us-ascii?Q?QGootdVlYk4DkDX6FQHLsMT8HRSq9MERJSBEtpQHqvokACfcJAu/2hwqceyI?=
 =?us-ascii?Q?OPG0CMOzpFfu/htbSHLFkFswaJDaFA02BO32TJak7N6QlMTjmrDiacWpeXzz?=
 =?us-ascii?Q?c67C1eKovg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 0324972b-4276-4750-9868-08df492b07bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 06:28:47.1716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXo6tneZN+d6/P6RumMF6tK69VJc3QE33z9gNwFvuR4FvXZs1czoVI/PJ0uxNGbesZuYmqyig+9duj1RnSVDxDBH9LGz1H5KzJpBz27hxac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1216

> On 26.10.08 20:33, Changhuang Liang wrote:
> auxiliary_device_init() returns an error before device_initialize() is ca=
lled, so
> the release callback never runs on this path and the rdev allocated in
> jh7110_reset_controller_register() is leaked.
>=20
> Free rdev when auxiliary_device_init() fails.
>=20
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 847c0a39e5ab..1d460a03f936 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct
> jh71x0_clk_priv *priv,
>  	adev->id =3D adev_id;
>=20
>  	ret =3D auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		kfree(rdev);
>  		return ret;
> +	}
>=20
>  	ret =3D auxiliary_device_add(adev);
>  	if (ret) {

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal
