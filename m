Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023078.outbound.protection.outlook.com [40.107.159.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1DD317143;
	Tue, 21 Apr 2026 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776772851; cv=fail; b=AgEyHTD6xLFqJCLsPgLpxsDpUupdHsL99I9abIYKBPcN3i7hh/C3yLLri/LQ8/MWVvRsRXtCDt4knjD+D8O9ZpNaCJCYWacNLCoUq0dgt6W2v7xXzxtWpkioLs6vu2W9ttvzFDuM6hvOmsmiL3eEbPE7vm0i64Y0UKn7RjUI1jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776772851; c=relaxed/simple;
	bh=ccWSANgq+bosDEpg4XUyOiFDiebu9bwbAU6wcwshjR0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AO40Q0ViPcpsC76mozw+RplMqkb//k7F0/NvYg+LwopgkzhgdTC+PM0aCeOC+0emD3ToqsM9qtsCanihQqOfw0wEpP8wxGokubDwngCZqWxbP8m/1qBWQh9s5JkqyiFDOTFC22dOjz8hqlCskwZ3Srs1LLMs5VFQstlYm7lE9xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=CNA+dka/; arc=fail smtp.client-ip=40.107.159.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="CNA+dka/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkZmQgOwHalU+ibmAxM4yxW+Sq9sGJg6ZbscI2Q+qqsviR/ZRXNN+rcxA2EWhPA/p+MRhkaMFpEdZKA+pSGsJZ7XtG8AxlRIdnRlQ3occv5QD+pqHdBWUzpggRm6PIN8uQULwisQOyQ0YtOKHywSZ8ykvdq67RhXPJhD2VzlysF8ygC2yILCLPq5OelLjkLnGWL3rBRu2HyTvlObd6KSoMNSepsqu2CTBx8558GenUo+Kc+TXPxXJZHhLW6FEe+SKsrVGA+jIPrw+2sidyV81tm9yiirT8tVy1YLEJVEZfT3Vv3LKxuoDIY/E2MT1HRKqWRW3ddoLl8t0Rm63SFcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccWSANgq+bosDEpg4XUyOiFDiebu9bwbAU6wcwshjR0=;
 b=ltESjEu/YogDGU3RCzqY50q1BYgbN9sdeUMz+2s4KmxH/RBZOlsBqtyiBJPCb62kALVn3ER8vFjPTmDSh+bcyqwI22ofWRadAy+mwrmao5c9TQ4nSIBbUz63QKc8qa13glsnoUe5L6rES3x97XcgWPHiUpAb04liqPfI93+KQRjbdvuQTyZXTF4K3iFREVxyMuCiK68tD/wODB6FcwDHSgvpR8+AdneTVUGTikXxJooRNBUCJN6EuFkm+1Soay0v7ziPAmVF+hs63X6ix9r3/GVriH23JELozmztA84GGF+QBk4XKKafBtkSscKZeCSrcaClpysE0pTER0KZkQM4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccWSANgq+bosDEpg4XUyOiFDiebu9bwbAU6wcwshjR0=;
 b=CNA+dka/WSKHcucMz4z2theHlCQah8DGXM+LeE3toARQv0+yYBDaA7FJ3T8Wm7ym1pTpP25gsNKlsUlzbKensAgtLa0rQP8Rf5l9PH3bjUtSVyYya7v3bzN1ZTL+rP57PuMxNqRnLUv/oE1g+VHqnOipRs6QtJLY23vLOKKyC7A=
Received: from GVXPR02MB10968.eurprd02.prod.outlook.com
 (2603:10a6:150:215::17) by AS1PR02MB7822.eurprd02.prod.outlook.com
 (2603:10a6:20b:4ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 12:00:43 +0000
Received: from GVXPR02MB10968.eurprd02.prod.outlook.com
 ([fe80::8e51:5ecd:e517:94c6]) by GVXPR02MB10968.eurprd02.prod.outlook.com
 ([fe80::8e51:5ecd:e517:94c6%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 12:00:43 +0000
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>, Saravana
 Kannan <saravanak@google.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>,
	"peng.fan@nxp.com" <peng.fan@nxp.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Thread-Topic: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Thread-Index: AQHcx0BZshCSHbJ2F0KbyTY8AjuDcLXU9FUAgAGm1GiAEteMRQ==
Date: Tue, 21 Apr 2026 12:00:43 +0000
Message-ID:
 <GVXPR02MB109689E26A9BAE94C2BAA34FDBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
References: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
 <20260409091643.3787112-1-paul.geurts@prodrive-technologies.com>
 <95e718b9-c281-4336-9c1e-3bf8aff68457@pengutronix.de>
In-Reply-To: <95e718b9-c281-4336-9c1e-3bf8aff68457@pengutronix.de>
Accept-Language: en-NL, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR02MB10968:EE_|AS1PR02MB7822:EE_
x-ms-office365-filtering-correlation-id: f49ac141-b027-46c7-3f9d-08de9f9d9d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 LKgH8g2EeOGp7jZInF+MimJo0boq08Agc3qvYuA6iNywyXM1b1uLbFKBYPJmEvyev30NKXQOnGldobTHP3YQxyVHwzTUVlSn1KKKAUIcesObH4YgAoiXUkggYWPumwl+jhwWp1yjQRp1d8VulSeJOFOJtIFhaCQpccjp/AW7aOheMKsZECbs0G3crnTXQNBFFYMMJqVRowrN/FTBW+dfVAkImNPHtvInA2GxLnExDZJDKJ2dAJXFAICqzmONQda2HErEgYlWEidHfZ01cyNb/1fjHHQOmN/zvxI55iU60JnkC/tF2IlrGf/YnJmGmqoKyBoqkgRcvEzeUcDUGDxCVZOpBFAfly/hs2TV/s2wCwU27Y1NZL7Zd8z4TgoONrxCQRAFbLxgV/ghwWdripUSUE2qK7xwDiaqPGk+w4rUEx8QGIZ8C8V7Sxn8wzhAq/QrHhSYqb+x04EZU590s+n7NS/w4Gz89OPCEUvueNaAjXaRgpoaDiasyCM7T7ZoQFksgRDP1ZIvCCfTzM+0ry4LHYDHF9Irz/OtPDNfFG7+3P5QjM2txHOxmWdhUQl51ZQQlqUxXLlIieh/Eh4u0exj5g1PdbqPKqxmNNUTWxPbA9Ir6S3fcEnRMasxLPa3PhZ+2AHr99c1twljo2rXGbXcQL/HJGyoYMd07lDzDy0spwc/WjmEKbmzNYVfkQkFjlCXy91XgRAVZFXFwAzsUeqMuQNpGxYU6swmfso1REhYgLG/2d8M0NqFNC0+SEvI4AAHP4Xy3tZgCS5XmrrIKFD9At+uPWn2gFjW8HaW/SAh5Cs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR02MB10968.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fadYcTALJF5fUCe6WMOjGvntfMV4nFEZPylHwjaQ5pF+WOQKPxb752Sfnn?=
 =?iso-8859-1?Q?dHUt4XCS24bBiC9AXTIA3Fk7Gu+n2yVs6RgN3a8LxDW5KwTTE3BiCvr7Ht?=
 =?iso-8859-1?Q?WM3iKVHMIK8TnQPOdDJA+e6VJY8wgtnmZ4QHTbigY8tovFbkcNhNmYfZ+q?=
 =?iso-8859-1?Q?ZNFtK12HXuYYrtpdwDTst0NUhhebjBxwtbi6ViPzDmVpBTJeeKAwOGz0x1?=
 =?iso-8859-1?Q?CMdnSxuM5N1oXdWRQn1JnXauMNWnvXlx3HW+dq3aqXw31TrRzDU4l8SKXZ?=
 =?iso-8859-1?Q?DL2F2fdUI7qwwZc0/n3bx8Hr+Uu25BrYLGruTQJN5R9SebhPL/SavuQc2N?=
 =?iso-8859-1?Q?KZJ985jVH9IleejYY/SWXrFJA0vvmmFOesD5eb8dvELtNRY1UuHEktxc5R?=
 =?iso-8859-1?Q?5n8n4djnSRoC4vKj5bheWUkdiobunbMlVk9WnlA7LSaaDYAMCgQwsblbyy?=
 =?iso-8859-1?Q?Jc2OmjI0tSn+T5Pji3aHrKExuKr7XtUma6+Io+5co4fnZpXIEqKVM7XEmS?=
 =?iso-8859-1?Q?VpF87MHE99Yn75VufDyGbIhThthcl6Qeo9iFVhJPE903+IqOoAAnlSaAgR?=
 =?iso-8859-1?Q?LAm3j4t+cC44NGRM5tzdhzGbhpn1jD6WTwFTriSK0njeTRi15ABFB+rM8Z?=
 =?iso-8859-1?Q?bukLjfK3tLtM5IBFtxoIytLMusI+8VDSAyNIQUXNmgshGisH4VbG8goe0n?=
 =?iso-8859-1?Q?T3W4D1xlXDbZ8Mm699gnBlxHCnTsRQghsIKMCfxI6ciBT81SEega8DCPSq?=
 =?iso-8859-1?Q?bDXJyKvREQJPh5Vu8mdKplHTLLMGTQv+66V9hbAMyMPm51oyzuRItK5CV5?=
 =?iso-8859-1?Q?KaIlwKPN2GDjIDAupX/mmNP8RkuOpdF2BgQUP5atbK2/+B1PbMF4hQQYQd?=
 =?iso-8859-1?Q?pvX+UtuuZ2YTljpbtjWvcyLgRf0SOxspyP/Jr5uunmRQpa6vnvByZo4I/C?=
 =?iso-8859-1?Q?y03/046uSCNSdbZMz2ciEFW9QLv8QR2z9jygHdZGO+gSvgC3jDlxNVVT2l?=
 =?iso-8859-1?Q?WnfwdTmmX/Xv8IDqJCej64ePzr+gj+p+Ry/lmiOF2qplsiUckEkgQqfcg0?=
 =?iso-8859-1?Q?ujg+cAyiOplHBUwwZp6llQwvSUneJx0NyBnZ3IS9FskapEP0p9wz8/syNd?=
 =?iso-8859-1?Q?zXPQMWkXN9DKMyaX4kpu1dv2/G6+HucxXlUbFQSizVU1uoGwdWiiczToDH?=
 =?iso-8859-1?Q?XPL8+BNz5GolIT4jufhC0heAdLVrjMXg/j8j/9y3VYgcNIB0H6r7XkD9ar?=
 =?iso-8859-1?Q?lto+GBmyKLY45IgUOXEapM2Vj3+VqAevRv+QJLWxANKdxSqz/G3sDMo7jg?=
 =?iso-8859-1?Q?foiVMxdlSJKpQ5GIwmRLj0IoeEtW4DbrnZ0JcG0J7J4lJ60D5+W0twLM4G?=
 =?iso-8859-1?Q?hZrynWaJ+KXZC8lYu0IX3H75cV9J3PRxLaNRT6EdFHEMCpyf86zkn44WLW?=
 =?iso-8859-1?Q?XX4fi8rB7oYy4P/ayUs2D3GSxBaHs+e2GZ2dSg2wm2goqWJjEsNlueMfkU?=
 =?iso-8859-1?Q?WPhv3zP9UfHFkADiLnivBr52ldMVo241PNMH2SHvF69uuRujEF6H+i7jgk?=
 =?iso-8859-1?Q?6i6QbJuP0GpqcMI45w0zJZwuVCvbeo5Db/FlmOUwDiW4HDWn5mhfaQKeW+?=
 =?iso-8859-1?Q?BAK7zDqXAtj3KtrSVKhLdr6czjqtohUjE2hWzRpZ1aitqp3Xr925u3LPCX?=
 =?iso-8859-1?Q?MQtQQLI0zbUxeUSwdNSmMR2B/v1wrfVjS9vqH2GWW7wgEuMLaiKwPxmdu+?=
 =?iso-8859-1?Q?5J/NvgKHLoj1pAqV37qSJNfC365ciS977QtJUJ+HgVBtvLlCZSk4Jy72OK?=
 =?iso-8859-1?Q?82qkmrS2VEKLSm5QfNR+84Bdf4BXxEU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR02MB10968.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49ac141-b027-46c7-3f9d-08de9f9d9d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 12:00:43.4489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/+d9PYf/u0mUPdadSQyU7zwMTjiNm0oYdSXQABMXIIMFV0Ha7xLczHaoIAgHMCOksl5yMOsw223hsOmWR/0KNYcOmgCRXIiC2Hg47GuQduoIiMcahS3UiJr3CMdLpD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB7822

> Hello Paul,=0A=
> =0A=
> Cc +=3D Saravana=0A=
> =0A=
> On 4/9/26 11:16 AM, Paul Geurts wrote:=0A=
>>> Hello Paul,=0A=
>>>=0A=
>>> On 4/8/26 12:13 PM, Paul Geurts wrote:=0A=
>>>> The i.MX8MM clock driver is implemented as module_platform_driver();,=
=0A=
>>>> which makes it initialize in device_initcall(). This means that all=0A=
>>>> drivers referencing the clock driver nodes in the device tree are=0A=
>>>> deferred by fw_devlink, which are most of the i.MX8M platform drivers.=
=0A=
>>>>=0A=
>>>> Explicitly initialize the clock driver in arch_initcall(), to make sur=
e=0A=
>>>> the clock driver is ready when the rest of the drivers are probed.=0A=
>>>>=0A=
>>>> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")=0A=
>>>=0A=
>>> Your commit message doesn't explain why this was a problem for you.=0A=
>>> Does it delay your boot? What makes this patch a fix?=0A=
>>=0A=
>> Yes I could update that in the commit description. The problem is that b=
ecause=0A=
>> of this, _all_ hardware is initialized in late_initcall, as that is wher=
e=0A=
>> deferred probes are handled.=0A=
> =0A=
> There's no one initcall order that will make drivers across all systems=
=0A=
> equally happy. That's why there are probe deferrals in the first place.=
=0A=
=0A=
I understand. But this order makes all i.MX systems equally unhappy :-P.=0A=
=0A=
> =0A=
>> For embedded devices, some sign of life is=0A=
>> expected by most people during boot. Especially when an initrd needs to =
be=0A=
>> unpacked, this sign of life is going to take a very long time.=0A=
> =0A=
> Ok, so the problem is that the probes happen too late. Does the total=0A=
> boot time take considerably longer or are you just unhappy with the=0A=
> ordering?=0A=
=0A=
Both. It takes longer, and interfaces I would expect to be live "early" are=
 very late.=0A=
=0A=
> =0A=
>> Some display=0A=
>> controllers don't even get enough time to show the boot logo because of =
this.=0A=
>> I don't think the idea behind the initcall levels is that _everything_ i=
s=0A=
>> initialized in late.=0A=
> =0A=
> I suspect we could improve the situation with "post-init-providers"=0A=
> hints, but I haven't used it myself so far.=0A=
> Maybe Saravana could give some advice once the problem is better understo=
od?=0A=
=0A=
I could look into this, thanks!=0A=
=0A=
> =0A=
>>> What happens if you build the driver as module with your changes applie=
d?=0A=
>>=0A=
>> On module insertion, there is no initcall level, and initialization is=
=0A=
>> performed on insertion (AFAIK). Fact is that the system would probably=
=0A=
>> not boot when this is built as a module, as there are no peripheral cloc=
ks=0A=
>> without it.=0A=
> =0A=
> Ok, then this is patch is not acceptable. What's buildable as module=0A=
> should work as module. I don't personally build it as module either, but=
=0A=
> removing the possibility will break users relying on it for Android GKI,=
=0A=
> I presume.=0A=
=0A=
This patch doesn't change anything about whether the driver is usable as=0A=
a module. I think the original driver is already not useable as a module,=
=0A=
independent of this patch.=0A=
=0A=
> =0A=
> We thus need to find a different, better, way.=0A=
> =0A=
> Cheers,=0A=
> Ahmad=0A=
> =0A=
>>=0A=
>>>=0A=
>>> Cheers,=0A=
>>> Ahmad=0A=
>>>=0A=
>>>> +=0A=
>>>> +static void __exit imx8mm_clk_exit(void)=0A=
>>>> +{=0A=
>>>> +=A0=A0=A0=A0 platform_driver_unregister(&imx8mm_clk_driver);=0A=
>>>> +}=0A=
>>>> +module_exit(imx8mm_clk_exit);=0A=
>>>> +=0A=
>>>>=A0 module_param(mcore_booted, bool, S_IRUGO);=0A=
>>>>=A0 MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not"=
);=0A=
>>>>=0A=
>>=0A=
>> Thanks!=0A=
>> Paul=0A=
>>=0A=
>>=0A=
=0A=
Thanks!=0A=
Paul=0A=
=0A=
