Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022129.outbound.protection.outlook.com [52.101.66.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E03AD52D;
	Tue, 21 Apr 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770074; cv=fail; b=nXq50QMdUmrfPqRhcJygDuFpo3pGwF1iCM2HrKhNP7lwGk21WwUb9wJdcA8FwDIJ6AKo2lzDQJ8MyfIhzVr9vYlL7E8NkPaO7354jvWVvmVQEfuD8oTxu9wZuUsFf4oYqXd9C3IUZ1XzIBirc/TrjdpIRXHvhLc0XyaQZSPTm0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770074; c=relaxed/simple;
	bh=SEUY892PHn1upfDCtrp6r5aNNaBwI2Palquay4oKgCA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MvOybAFNrI2l1Yb7TMtDU2yuYXkIomQ6WgBJgml3L1kvMPEpPFTaFS0XamDdZeE8Nxl90Zs7tHNZCNIsIvXfcpuQXjOPpjUSEX5hvFj1WVKQujvWZX1DzUaMWQmEAh2z8K4cCuAHsm8LI61S1BYv3DhXoZmxAkKb5n1ReZ3+DXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=hpuMNxFj; arc=fail smtp.client-ip=52.101.66.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="hpuMNxFj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jq9n3BucuMzLGEREATEq9lHjjOUvHLYDBLLc/nNn2bXQqDiXcFCoBbrFeXhhhEXfBF5aYxKz7HW/vtv42TyAGrxupnSDF3GL9jJPjvhSlknDIoju4kY7cXiKLmsk7vCIPioOtuOCqnNBZDdLD0cJxRYzdrapQemoqlJaUoBComBBhEWMZK2sqA8dUQCvbiIpfcZu9yVVOmvUIOi275ut4/y1FWJurxW4rgXIY81iCmzBMwIQcAbzGpr6ajmfldtQYIl5IU73mzNnr1Y5rehuPzbqzNBmFJJEKo65lunAoULASyh7XNQM8UB7ArNoozXeodB11my6RWxVR7zhpIuYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEUY892PHn1upfDCtrp6r5aNNaBwI2Palquay4oKgCA=;
 b=yLtQIX4VKza76DZv/u3iJW/3LUBFDrgQ2s87WL8+hpPvcbXtzqxjg7rwrApIxNjlPyQ0k00i+fvPno3F+qYxp5E9H4csPaJt7i5AzlNntD9ZfEhW5yWCojntqD0yqKip04ME8+K/QFtnQaxjfvDbXP2rfBk1k9uZC3unA8sNC7RMcFRGl1cZjHjg/iZ9IT7bdzXNfA4p32lT5Z1gwvpyD0sQT+kM9ezdnrBQUcNL2wGu+aKwQKnN9FQE+ImTYat9o6YalRz3c3FldnrAWQ31dYCJFTC0z+gO7lyoEsjYWrnmDdsWxf3eQZZYM8OtnPlBqHKIZkuaRFreiT7+7TKl8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEUY892PHn1upfDCtrp6r5aNNaBwI2Palquay4oKgCA=;
 b=hpuMNxFjd1eHPrVBhxyKaukIZJU9nAPji/xqzaPnniVhii4lOqvJrdBxjVnsFHxOnfC54ergkaqdmRnzlLSddIZbd+w4bcoSpbKuX5Me7YBcFk1Y7IqFt2+lfgqglAbMtkxektX454k7sVM65NMYHzcaX81ioVBzcEzbsN9mdO8=
Received: from GVXPR02MB10968.eurprd02.prod.outlook.com
 (2603:10a6:150:215::17) by AS4PR02MB8430.eurprd02.prod.outlook.com
 (2603:10a6:20b:575::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 11:14:27 +0000
Received: from GVXPR02MB10968.eurprd02.prod.outlook.com
 ([fe80::8e51:5ecd:e517:94c6]) by GVXPR02MB10968.eurprd02.prod.outlook.com
 ([fe80::8e51:5ecd:e517:94c6%4]) with mapi id 15.20.9818.033; Tue, 21 Apr 2026
 11:14:27 +0000
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: "abelvesa@kernel.org" <abelvesa@kernel.org>, "peng.fan@nxp.com"
	<peng.fan@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Martijn de Gouw
	<martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Thread-Topic: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Thread-Index: AQHcx0BZshCSHbJ2F0KbyTY8AjuDcLXWwimAgBKscHE=
Date: Tue, 21 Apr 2026 11:14:27 +0000
Message-ID:
 <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
 <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
In-Reply-To: <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
Accept-Language: en-NL, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR02MB10968:EE_|AS4PR02MB8430:EE_
x-ms-office365-filtering-correlation-id: 789a7150-354f-4cb9-070d-08de9f9726e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|18002099003|18096099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 d4L/iK0JiaY1vCOBSSy2FPh2Qlohwnb1JNXn0ZB7IDygSegj3VjTx2aY77SiOU9dQUn7Nx95useJRI4o23nfs5oOa4zXAHVDNv+FOXkrkMQf4eCG6DMGxg8z6wydBprXDccQxIh23qozbbh63oMTUu3LDlX8aWNQYRWBTkCa9HFnW0pyoZEJoKI0rycst2qsmkhWLXaW0b3zQjPK6Cg6ZuwYWG55/ejrg7od9nUswP6dbD8F6y4EbeE3qlb34JPudP81NwXMSWnUc8C+tGSz1L5uNMhgYMtd9VvjYxT6b4D1cqT+AdTAo0rWYn1254T7i0ZWwLQ6Df24Skxo7fKS0Lz9UOYX/sronpZlSX/e5llgDR0VjucmA880GnnOtOZQBI9Dm/k2ppkLxsdAc1fT1u2fFRc3YPJZr6GsqJQk5nnI/5++5muyOrI0cVusJzTQZva2GCTe4aC4+Kp28kn4Kf1luDGLa6Mc57Zi4Zc5G2sthmxuRfmoBNE7ANp0xAnYf4UJxfcwN4HvyXvpLjtOEkTpf/qXyTOA8WSlYczQtUeY4v+BEwILHh0GR9jK/hmNYkztz3jk3Ywu5duBkoftwClo6VKgGKcR1CzcsTUy6a52zyF9rx+VKkLVtrwP2ujbS2NMuBGIV9RL3uJPnzTwj2UutUivchhSySNjs1EpeqRXRWzeWlcv56mWCLzX9xSywmgm2ghLzdvhPxWnWOJ+AwiHSp0PPl6NA6bcAx+yhSOfoISa/CCfF85L8nsr9e5krh2vV8O5Hq9PkICN+1641sPanN1VnEriSMGWwbvpM3c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR02MB10968.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(18002099003)(18096099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?r0UC+tRqT43XL7om0leRLcyhqhGqE9j3wmR/3S+fPpsyzzdQFpUzo7zmANjt?=
 =?us-ascii?Q?uiJVhKBWhgWC5/SxQnBfJI95y1Zdno4+Xg4UkmTCWaVEhlpHQDra0SGIZGxD?=
 =?us-ascii?Q?7LGEahHx1dechd0qXuLBQ8jSDKgzptVjnNKa7qnd6GgdsRBMLtrjEFUoSSNl?=
 =?us-ascii?Q?YXUaVscPRtAIH+xitSAHdD+dHeXEi34t50kkX3PecH69qwbhR8KKF41T2eCn?=
 =?us-ascii?Q?YIedTPnmaHU4mzrzd03ni9nubKysIdV8fR4Q5BAsgFWxqM3XeWsKYaqBxFdE?=
 =?us-ascii?Q?JkzVxyrJYKgQOEEHtI9nuK4vCB0dNAB9da7/x3jHDXWT8PQ4z6yMzfaiZsvo?=
 =?us-ascii?Q?lRU4I6/JHROI6VNZQFNv9tV25ourrKrif3L+D+BuCj32T98EFijVcqtBV6qB?=
 =?us-ascii?Q?gfT3QkgwscuiJIwOlpUhJpOsAks87tNgkP35ol5vFpKzxmksfOesAEbNS4VA?=
 =?us-ascii?Q?MwAlfFKATtzeyhnX5nYU9Zxpg8f8vsx+zDMGhS8+dcEumVQsPkrMpINBq24t?=
 =?us-ascii?Q?Yp34CkeALJtCoeSKIM4F4t3lV96VDzpz8/UZCUWkjS+y3+8PG1jK3Ap7pU5U?=
 =?us-ascii?Q?QxsJf2KOtzbz9A7KfEwubbcPsIQ54+DHekpVn7ipOvno7+2lF68wsQ/04RqN?=
 =?us-ascii?Q?Y21/ZiqP36zDiJxm5y+Kuz1kjceu9ED5/AkEyhUgGykd2w/0rB0bmxzTtuSs?=
 =?us-ascii?Q?sQvHB/Q+4k0LfDZxcHo3OoBrb7Pjtd89N26sXZlYm6RZiTCS0bOehm1YVlMm?=
 =?us-ascii?Q?sr+NHbQc73SWspjIQsbsW0rRdDeA6VPFjPeOdh7PL75wxtqggPhTjnbRs5C4?=
 =?us-ascii?Q?uFnD/BHHOS6D6f/S7E2Wv5rvtk/peFfhoQaUDH9R+rnIhWeZqa16NaCpwTr2?=
 =?us-ascii?Q?OM40Ej2mvjV5c35IKBsRaPvcmqOTTWjAYWR8gqRRygKiNlDGmUs9ls99VlvQ?=
 =?us-ascii?Q?wMKgNUTVlQb6aTYiyvtePnlRt6q+SQkY1oBfg7uL5DnBFYi4UCdDvkLnaXIo?=
 =?us-ascii?Q?bXivB4VYD4654126gn7p1DuC8HfZ7Q/K1fIzpHCKs1JGPARuxx1SEEs3I5r6?=
 =?us-ascii?Q?6fYWiGzlzIbSZXhuJJ/X31ZYuJs4KSEZ7pH9f3vAlI9tevvsbbOH8DGhGirI?=
 =?us-ascii?Q?AuLU715FPHwsBL4AI1K6Z4oDlEI1SUzqYx4l9dvALc8PHU27TW6uK/5rwlGr?=
 =?us-ascii?Q?ma7HvTEozngKtF3IwIQjkqaOOG077qOvyMArFm8ywf6rDGaxtoTYphSbK80A?=
 =?us-ascii?Q?V4dtUaKgyuMJ+Af/zeRHohdWX1+cRtBkDNn8CAuQeJpeS608AKhm874XktL+?=
 =?us-ascii?Q?etUnY7u5wxDTIE0XMnLW5NqV1bJn3HeRKrc8XoWyjbUgiLKkaSf1Kr7rFQPM?=
 =?us-ascii?Q?jiOK7KVa07Rbx5bKpnzcBZFCpr9y4+DrOBVRNcO0ZqI3Ci2DC3LPxVZrjErK?=
 =?us-ascii?Q?mBUfEYmHSgxR23wMkPtvftwZ1JnoO3PLTDvNmXWYiyCs3SAnoP4uVxuCVk0B?=
 =?us-ascii?Q?FoY2dNZAyiX2hify42VqqD8mIH6OBlm4PluYOjoPQL1UfQlRNzWokqogMrlf?=
 =?us-ascii?Q?kB3c5eiz98H3X+eh5fIjR9OFVwvAA4eOlPwTZy4wjUQK5UFWTGkOJg58K9Df?=
 =?us-ascii?Q?cYpVLM4JKimVQue68wTGFSfo/04Q+1XUSB0owD4BQXw22EKPCRYLjB7GLlB7?=
 =?us-ascii?Q?3McmFFU0Myohx9AetKZVAb8CZlIIDXIwgf1cDPEsGUNdQt1Nkljk7dGBMiSt?=
 =?us-ascii?Q?ztHrhWwf1qAZpdTi5/2TsKvcE29opqA=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 789a7150-354f-4cb9-070d-08de9f9726e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 11:14:27.4599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44oF33xkYADx0P7s6t1RahjT+vd8xJ7+S5gmVZD6xqu8jzd0MnkpMq/G1Vw6lzcxCr6wiGSFhEAu6fx2Z9Ht3KMLMQg9QQ6QHh4352T9sTFDBSnRJllzrQM1GISOfxF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8430

> On 26-04-08 12:13:13, Paul Geurts wrote:=0A=
>> The i.MX8MM clock driver is implemented as module_platform_driver();,=0A=
>> which makes it initialize in device_initcall(). This means that all=0A=
>> drivers referencing the clock driver nodes in the device tree are=0A=
>> deferred by fw_devlink, which are most of the i.MX8M platform drivers.=
=0A=
>>=0A=
>> Explicitly initialize the clock driver in arch_initcall(), to make sure=
=0A=
>> the clock driver is ready when the rest of the drivers are probed.=0A=
>>=0A=
>> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")=0A=
>> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>=0A=
> =0A=
> Nack.=0A=
> =0A=
> Nothing wrong with probe deferring. It is there to ensure the order=0A=
> the drivers probe in is correct.=0A=
> =0A=
> Plus, moving it to arch_initcall won't solve anything.=0A=
I disagree, as it solves a _lot_ on my setup. But I think the next section=
=0A=
explains it better.=0A=
=0A=
> =0A=
> fw_devlink will not stop the driver from probing if there is no provider=
=0A=
> that this driver is waiting for. And if there is a provider that is=0A=
> needed by this clock controller, moving it to arch_initcall won't=0A=
> magically skip waiting for the provider anyway.=0A=
I think you have the issue backwards. There is no provider that is needed=
=0A=
by the clock controller. The clock controller is needed by everything else.=
=0A=
So the clock controller is not deferred. All other things are deferred beca=
use=0A=
of the clock controller.=0A=
=0A=
I understand that probe deferring is not there for nothing. But I would als=
o=0A=
argue that the initcall levels are also not there for nothing. IMO a chip=
=0A=
clock controller is an architecture driver, and belongs in arch_. Whether t=
his=0A=
is the correct way to do it, or whether this driver should be able to be=0A=
compiled as a module is a separate discussion. =0A=
=0A=
br, Paul=0A=
=0A=
