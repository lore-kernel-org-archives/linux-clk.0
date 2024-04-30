Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2049.outbound.protection.outlook.com [40.107.22.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B98BF0
	for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714440712; cv=fail; b=NpLMRYx9NVrjwIAb1+4aZ0ClVO/bDWX73/pkDnTroz1nEnXvbEk48pCmDNRZI8ruGDrRN+NsN4q1VdOCAemWDjvV0ZgmGhEvjkyJFRwSEtr+tpG9LHKVZ0ls/sjs4teyV/uUOwxBZt4SHnnpAQz44Y1dKYJfOPaGCCeHLbTFaRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714440712; c=relaxed/simple;
	bh=HvaJuoIzuFkvdYfd8HsNewDL/70w/VeQQxQc6lGi0jo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l4vHQjgyitoDoRFxAJoHDhDQG22W4zYOsfA6LSyavmivY7mwSXpvud6a5OQ8JE6xemZlcDCwS5T0IgqBo8q/CsRV2ugl1UOKiQVRvGpQiIC0PGoxX0qRIVOq8Wk1jdqYa3BrCH8su1M7cv0A4YncAn4KlaCvBmEp0VfaBM8jteU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=GWmyglkX; arc=fail smtp.client-ip=40.107.22.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GWmyglkX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkU1Jxq45AbjEdftx8Uid4Xzb5mDUiryZRbqPyrpFWJPwj4YCASojmTBnBsROPVkmoKamimiZ4vEZYzzWYmyyNHWRchndGMIwPUGQCWhQHefaEC0J4TcTktStIDa+l0Yl6tCRzzIuZ2oqZyUYXRFgHwmZhPK7ZB9nz47xprH9meXZWy7kgva10v6NYqqcs5Phs+hZLzpQYuV4/9amPzZRvtXqpURxHYpn5ZbzUxlPMidB27zMvClltyzJz9TdVhUHqHCIxh5SnKLAXiCXfDRhLOXBBFqYr99Lk6jbJp8AVlLw1kZnD4WI8dYDfJ3/oAM+UZrB3kO6NS1uamB6uSEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSSPUtpeAUqHLr3QsA818slKgDT3YOzzCfOLMgWWvFw=;
 b=fnvBBzvD4YEUafbDkav4PyAgIHZi+bprrvWUY72BkKOyu4FuFZ3mqdFMYXv0xkdC6HMw27NPvePrPuyMA6/4GGIlOdofXmzBMy8cv8gOCQPOsytrFLOijbLGcIbhv7a3vNxjpy0HktcTS7e8FT6aXS3P5Cg/t+892RvzyS3iWWmy1YmRtkcfcwU0yqcjnHq87P8aT33WJzHRnT59XWDKwk9uWV+kE6RXXeQucYWyNBvfgUDs2D33JqcSPtshJhRrSWpqpDEBXyO3g6O+OmuPrFei2XKZMqRwD8HmPeKzZHgf2DF+PEUn5WQWiDDiaKhBiBLGTqZ4UGrQf8xhoAZSkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSSPUtpeAUqHLr3QsA818slKgDT3YOzzCfOLMgWWvFw=;
 b=GWmyglkX8Bkob5lfvjd8pTVp3K7PMVMtXPICLRUAmVN8o2ckipX7VUzHFiDgVDC/UzrEHua5ljlWwKwOXJlBCgv9c8WEzlE7qKdMctF0oXW8K2AM/EZ6FsivFJZdUVpkaR4fONqn5jaFZKmnNirQBbDD7f4BEpyUjpk2aOLFoDE=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 01:31:45 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 01:31:45 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "abelvesa@kernel.org"
	<abelvesa@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, "S.J. Wang"
	<shengjiu.wang@nxp.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "naresh.kamboju@linaro.org"
	<naresh.kamboju@linaro.org>, Fabio Estevam <festevam@denx.de>
Subject: RE: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
Thread-Topic: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
Thread-Index: AQHamn6HTjppM+lsLEiVk3FrfxcDq7GABzYw
Date: Tue, 30 Apr 2024 01:31:45 +0000
Message-ID:
 <DU0PR04MB9417EB95F074196351881782881A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240429214502.1363592-1-festevam@gmail.com>
In-Reply-To: <20240429214502.1363592-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DB9PR04MB9233:EE_
x-ms-office365-filtering-correlation-id: c21c6690-2ba1-49d6-ecfe-08dc68b54c36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?E2i1xAU7mjMy4o8P3+Tz0VzwlFIwpZyOIB7HpwR6LfZyrExPavUbVEItnuyf?=
 =?us-ascii?Q?Si0BozCDDAYrtq29O1Yio9HGxtjP6x7WzdiCLoCZpoNbjF2iGS872o56eSaZ?=
 =?us-ascii?Q?n6mWR8ZjW2Wi5aFIXpZvDkH257QpYdkZYsth4UwwgTTtNMI18tNxcoNcKGUw?=
 =?us-ascii?Q?ZMOkHR9r5em1pk1xGJoM+T6LwEnmyf5t14xcKY2DTFvDuUjgunNPGIZCfxUS?=
 =?us-ascii?Q?AOEyhQcym5YNdKj3JR7JTXIo16DF6LXPfEE1FC3q6BZImiZF234GscJuqyZT?=
 =?us-ascii?Q?8rhlaIaMUbKRF+D1+YbmCeO8ifBBY4e0aXmDM6XiV1f5UY4NLKNbRvfLyxWM?=
 =?us-ascii?Q?/OUzelLgvh9M/EdSoOcS5LD9ps6fAFx6IIBKFWbfH/vlE+hcX5Itxc5OlutG?=
 =?us-ascii?Q?mbQzWdENIjC2DJGd3UykrRFUkEQZHrs/hvgnmKQSEdDPrSmOLI4SI5BBZ97v?=
 =?us-ascii?Q?nkFUroA9OcpUMV4aDpO5Jlw7IhVi/n81uQ3Y3/YRYQe+YWfahMZHgmbShmsb?=
 =?us-ascii?Q?RI/KwHpcKqdViMFuMRPKb+0laoGI3k5MCcf+j67gdIo8Rp0bV8oAqxl+0kk+?=
 =?us-ascii?Q?j7c8D7AFJdlA5uuogA9kI5hI3/DTkiKUs8UpCTXBfw2E54TsMd2rXPQvtT0Y?=
 =?us-ascii?Q?TVmiXvm7CbdMIh4yRR2g47zXLry1fpwV0dfk1Oh8mwaTTl6EqH9cahf2BHbf?=
 =?us-ascii?Q?e2OthWCjv31uOGb34XcTdggQaEKdC573xn+xsEX4LWQ2tjHnCS8Rangb7mO8?=
 =?us-ascii?Q?KBoGFHQ6HKWueTd+6AG2K37z+RM011dhUXAtVXeQy1s/XzXhoLzOln/nfu+J?=
 =?us-ascii?Q?uM38yjz/R8+DnV3Sq6onGYKoh/BAtdOJ4bnGM50xIls7WTsJwX6zjpqraT10?=
 =?us-ascii?Q?iCPQmiCPHtgEK10SxLGPgclB11l8oZXvg6xr6hWCdPVsxSmPG/a47QlWDg2N?=
 =?us-ascii?Q?OD/zL7UjW6AOCam1fiVDEDwNkdfz+yNPfb6EIu8+oP8YB3JYLG6fUL8/lH2k?=
 =?us-ascii?Q?TQnU5aCKnVgdD54C+wXN1WxpKY3DrytpQEBndIAHKu9ME3QWfqm0P9kE0xg5?=
 =?us-ascii?Q?ZJtlc5VZB+SVv6UmikzKEqh90ikbsRgzkH3FzXu9EpyvdC4RjJzvM/yUyXyV?=
 =?us-ascii?Q?vyPgN2WFQ5V1gJmoZV3yoa3hQL4u/ZhfO/XkGs1w0rutjakraOzX0R+VrX+s?=
 =?us-ascii?Q?4C+hQdrahC2lTnLFcjzkJpR2lvsN+cE51EsxWoXVaGKy5/EbJgjqYsKC6IzM?=
 =?us-ascii?Q?CHHkjCK9fC4dwbMtz4RJB2ZpBuROxLjRGkAg6DCOng=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3OjRmqDnsB8zRthMMfHfW/QyM7NhDLC4rKOJTdVwGpcCowG272noa1y7yEG8?=
 =?us-ascii?Q?Wld4Ut8su4MlNaxpycjbQFsJlJjkDMM6xbL95AiM/eUcCNp1RWp+kmUl2WPa?=
 =?us-ascii?Q?pO2dYfjUo2r3Te9AYRHkQ/l/BKjT31x/qr4r1/MvgTbP5J9cHByJepD6KGM5?=
 =?us-ascii?Q?i6nMG4TzT4dx1nUaIeYXymr3TKHYbBjJCh/IVG/i2qomLALE1iHj+At0B5z6?=
 =?us-ascii?Q?0vfUZJYZn7WR08lAcguyHdjReJKAwnLfmoYVBks2ZalODGEFgg5ukJd2iWiV?=
 =?us-ascii?Q?aBaHKhwOhynahGofD1UTk2AfTUvLpwkHJ8QIHcHmzdZY+YYJD6LFCmZvKrMB?=
 =?us-ascii?Q?ffGnmqoxwjrr75gs3+Ow5nFapo6wMhgUyvDL7PGOUZimV9NYWnqS/4qHy5A9?=
 =?us-ascii?Q?5Z+LQES/qKpPPz/lLbDaBK6KwuJ5Yl4/sarpbdCYcqmlswG75/HFBi5jEJ7X?=
 =?us-ascii?Q?BUzqc8fIZzB3aqFjJg0znS+JaJv3nMUDpvMq/Jzibu0vNNVpeyJ2pJsYgXsH?=
 =?us-ascii?Q?grbloNmiP1ehYPv8ZJpvvnGjDlpei8BJxodOjDMdOSg4BeD99LzihcYPCZzl?=
 =?us-ascii?Q?lvS23C5yJn8c+B8ortQqcyGRB5eLFiXdeXxcjzWc8ZNwiZAWbwSbKHEz9K0i?=
 =?us-ascii?Q?RdP2psJ8Gkd0NBvVqrRhr5qxig4IdUz1FDCmpLJZ8WSRyzjRhIIkG6DcYaES?=
 =?us-ascii?Q?pUEO6FDRkZqNPY15zNZCtK4m1Kuq10kHfY4spGDeZpa9AGQmpqyM2djkTSm9?=
 =?us-ascii?Q?mEohiM0tTi9im9129znKWYbgvB+N8PiM0UmSJzzQo+4zfDzydsE59riLLaQ1?=
 =?us-ascii?Q?mZYJcS7duPqOodjf3uPtiMcoFsQqu4dZJqa/FlB4k8jIzU+zcg8PmFa1XMeZ?=
 =?us-ascii?Q?Tg/GNsUsYUGEWMayk4cpilFtH1nuQfyqV1M9DiXlq21Y6SDMtoIZxvBkoFKG?=
 =?us-ascii?Q?EEIQf59F0irVDK1oDzaf4SDyc4l2POqJqTzmB1I3p5bG2+Q7ZE99vdSnEAdP?=
 =?us-ascii?Q?+gtt0LVbft8jhfeedF83dhXfUuzcFkd2Iw2KOxOg2ES4SBExRL/7sX8zflSX?=
 =?us-ascii?Q?VaSRmlh7nDUeoq0RygDdAFnhZJ7TsdDcG5fGGcCrlcXOUTDj7AUIvuAdHGtr?=
 =?us-ascii?Q?kcNXkwR2EXeCSfUQOeTEJLuBXXyW5aI8O9TEwpNuICP/tMv0Iui5KrtqR2cV?=
 =?us-ascii?Q?dwQR/d0fjt6AeZKn/y6Do+LJ131+3VvNOJV0qFGI/n6qbcJc8y17m79LLzhj?=
 =?us-ascii?Q?i4l45ovaTNh0tAUVq3BpC6QEU9v/xTuuLNUA5Z60qS1/XMRcuZeYbl65xuPE?=
 =?us-ascii?Q?6HEg29/+Hq/2WoZYxVu+Siydej9f2QrpkME+GTXo9E88GzSIfAWSCLfyb18m?=
 =?us-ascii?Q?jdWWZAAgm9BGOxa0inlibcHkN6kXTFJYWstqh4/82vqHb48djFImvBSul+Ef?=
 =?us-ascii?Q?OwXpdesZy+5LX+mdEntPxMIsWNx+bro0xLOFjhIyGwJ9X0WuwdM1K01kQNij?=
 =?us-ascii?Q?EuVzmoZEqvL+crFQdXEp56wyuZRx0wJVVzhY7Mnedrf53vqY1KfqT1hkASYH?=
 =?us-ascii?Q?zte9DuW/+QOY0+QC5vs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21c6690-2ba1-49d6-ecfe-08dc68b54c36
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 01:31:45.6389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTGymNfzJVdDJjNpV7X2LbOY8J3DLZOrmfN6QAu7fCKRaP3c7236PVqk2tvF6/JI/G+6VZlWl2MqbPxWJMJIeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

> Subject: [PATCH] clk: imx: imx8mp: Switch to RUNTIME_PM_OPS()
>
> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_RUNTIME_PM_OPS() with its modern alternative
> RUNTIME_PM_OPS().
>
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the suspend/resume() functions are used at buid t=
ime
> or are simply dead code.
>
> This fixes the following s390 allmodconfig build errors:
>
> drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: error:
> 'clk_imx8mp_audiomix_runtime_resume' defined but not used [-
> Werror=3Dunused-function]
>   363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: error:
> 'clk_imx8mp_audiomix_runtime_suspend' defined but not used [-
> Werror=3Dunused-function]
>   356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev=
)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes:
> https://lore.ke/
> rnel.org%2Flinux-
> clk%2FCA%2BG9fYuP7S%2Ba89Ep5g5_Ad69EMwRkJ8nM%2BMMTzbEcP%2B
> 6H2oMXQ%40mail.gmail.com%2FT%2F%23u&data=3D05%7C02%7Cpeng.fan%
> 40nxp.com%7C9d12d569610c457011aa08dc6895a8e2%7C686ea1d3bc2b4c
> 6fa92cd99c5c301635%7C0%7C0%7C638500239186820103%7CUnknown%7
> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
> LCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DEcUHmggtxNEkO3DFCbInsDhnk
> MErp58G6wG4PGJ0lws%3D&reserved=3D0
> Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for
> power saving")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mp-audiomix.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-
> imx8mp-audiomix.c
> index 574a032309c1..6a9b48b20cd6 100644
> --- a/drivers/clk/imx/clk-imx8mp-audiomix.c
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -368,8 +368,8 @@ static int
> clk_imx8mp_audiomix_runtime_resume(struct device *dev)  }
>
>  static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops =3D {
> -     SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> -                        clk_imx8mp_audiomix_runtime_resume, NULL)
> +     RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
> +                    clk_imx8mp_audiomix_runtime_resume, NULL)
>       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                     pm_runtime_force_resume)
>  };
> @@ -386,7 +386,7 @@ static struct platform_driver
> clk_imx8mp_audiomix_driver =3D {
>       .driver =3D {
>               .name =3D "imx8mp-audio-blk-ctrl",
>               .of_match_table =3D clk_imx8mp_audiomix_of_match,
> -             .pm =3D &clk_imx8mp_audiomix_pm_ops,
> +             .pm =3D pm_ptr(&clk_imx8mp_audiomix_pm_ops),
>       },
>  };
>
> --
> 2.34.1
>

