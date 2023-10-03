Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8809CE7543E
	for <linux-clk@archiver.kernel.org>; Tue,  3 Oct 2023 09:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbjJCJuC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Oct 2023 05:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjJCJuB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 05:50:01 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2054.outbound.protection.outlook.com [40.107.6.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B8A9E;
        Tue,  3 Oct 2023 02:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1CvKh3+ARTNPCzvRo5sfOKZJYt/NWdF/xOTFLCP4T0GWYVroq3VzKAUaNjmQyaTwESr0pEAMzz+P3ZZm7SY+GYuhS+rkNLKJO9UkJT7yfcSgu6hAQ6VO1puTLgHXuUizrZeCRq/Y2r0qpZsZBVCeHrMaZq+7mfSs1U0ZAgp+GdKzgUZlngDwGZODAXnhgTSSXWoQWlRHP3wPIbuJVIJn/D8jciAdWQhWxOXon9M6o+PDdFkDk+NndwG7O3bE0cHDFw1TE2h53nNv1SYDP1iZ8jvYJsV2TcVWaYmxOVfjaS8mOYPNpy1klBn1jiOoqB/f+9796OTzPtYIddM8AabvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsRIbwJINvNkoBTaXNZxVaRB2hmHzxGA7qLiT7OlAKI=;
 b=NSOM0L2wcq1OQBhud+Nnp/38iv2fALNhyBGU1kHM9EXnuXtZtjC33vgrvb9xMIPLQIl+bXiwNbGvEw4tZtB62tZC8vVecJp7oOgJQEHtNoSwws+sb076Y9S47l9jklZVO+6K43VxM+ks36IDfDHizKDVPwYHZJ+mDfYSaQjWowDPJukoFGaSG4W8xuUSGaw7FWQkJygK267hcdQRNYmK3JYgpBopo+rQI9+9x7+aORRSkyea07IwWveSxrH2qtkN3R8vzVlBaJF+wy5nMpjyQT7cpvm/VFyPVvNYVh6mmEgdAfQDAquGthzrYUteTgF/eAXrpRsm22gMGAtbtQhRkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsRIbwJINvNkoBTaXNZxVaRB2hmHzxGA7qLiT7OlAKI=;
 b=ZMJXiRP/IgVABYrK2uu6uuQ6+QPRkAFWdp+b9xM1aefXfVlcRd9WZ9J7azulCotu6h/YJYV5rIvRngO/dPERrae1aL3/f8FxeHCDRGHoWNjw6WoxMuC+6bp3/HJBidcdW3HPx7ZgiYo7y0zKybdIJBCU7CYXhxQOh4zaafU1COE=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Tue, 3 Oct
 2023 09:49:56 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2b3:d8de:95c8:b28b]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2b3:d8de:95c8:b28b%3]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 09:49:56 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        "S.J. Wang" <shengjiu.wang@nxp.com>
CC:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 1/2] clk: imx: imx8: Fix an IS_ERR() vs NULL check in
 clk_imx_acm_attach_pm_domains()
Thread-Topic: [PATCH 1/2] clk: imx: imx8: Fix an IS_ERR() vs NULL check in
 clk_imx_acm_attach_pm_domains()
Thread-Index: AQHZ9P5W8WrJAfrSkk6C0nD89nKDabA309yQ
Date:   Tue, 3 Oct 2023 09:49:56 +0000
Message-ID: <DU0PR04MB9417CD110048E038EE848B3488C4A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
In-Reply-To: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8128:EE_
x-ms-office365-filtering-correlation-id: 10d92b70-d349-41e0-200a-08dbc3f6199e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sOG6sk0+xiyHJVrDQiD662PPBoHn50eP+lMQRSKcrJzA/Kb4UpKNNwgWVod00pArPfwuaKfirDCt+KUC3blMkXJyelTGYpJcT9YuFDJrA2n4VaD+jjVm59qRF8I6y3NcMkMA2A8znRBsCAIPYuDj4vRXj4QXw0Ptir/KO2lf5uorZS7JVQx9kBuhErD5jFQp31Wb0Z8+sMPMCPvAyPC85vQTDqAXsu6dPRihpq+CNBcOatBfC1tz+EOo0tfZXsPAcVJiozMntdLqonsnUw1XqmtqIIBwHfv9uzDbrF8LLaIQsEb2KUtEtXo1avaQnHPNAB1AQbgLlzy9MhIsL0JWRRLWRARpZoyjqOuw8D0l/1zw0/irX8tFTytb0rRsXbrLwPVL+NUi5zaC0YB4Bgptrv4+OdEYjYw2vIVqaOTEFPUKV/4sRUOnGZadjtX9rrgMIkqtsBBZ+WjPjg+ShTq4wfFj5rKX9oK+3d3v/7p8kM6URy9NQc8T/10oHXDesUDCvJ1WIafp5ZDrePpKgBjIknfUdCSx6Kj1oRt0F7UUXZinHxmmYZYuDBINLr3LWvRKYvQrzofNdTC+otWt/RSKPYRtqOI8AIQZatZWTAszYqX0TqSttgWUNZdYgGHd+aOq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(9686003)(64756008)(66446008)(76116006)(66476007)(66556008)(66946007)(6636002)(54906003)(8936002)(4326008)(26005)(41300700001)(8676002)(316002)(478600001)(83380400001)(71200400001)(7696005)(6506007)(122000001)(38070700005)(38100700002)(86362001)(33656002)(110136005)(2906002)(55016003)(7416002)(5660300002)(52536014)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IJOLDxI+htrJlrrUQrkbqHjUdoh1M5P5KkJO7gczeepAu8+wACd61+1Xb+SV?=
 =?us-ascii?Q?MOtyxgPVAsZG5ODBt2WueMePV+bbP+ZZEatly0ds1mInaBXZwTvtei2ONS6j?=
 =?us-ascii?Q?+fhqhkQrS6hOVW07yT8Gi997MPd5ZwGO8hFDWEURlm6fbPBr1h0p/vshOUmu?=
 =?us-ascii?Q?hKklkOPFXEA1Pue2YSGETsNSqeOohPwuTmMqkoG7RolaroJ6S4hnNV1prA9/?=
 =?us-ascii?Q?UldgGpd8doOBM+sZmXeI9ZophZHHyNhA44ZgBrTNbA/MS2unFnpyzBnMU9tT?=
 =?us-ascii?Q?jBJ020NGZbeo/oTUmHDffn0sItYFOWlYVt5qS9ly167TkZnCec8rUWcTi49u?=
 =?us-ascii?Q?wxQqyS2eLHk5WskpPbIt3u7Hw3WITEGAWAhb8Mx1EDcVCgx7M4bSmSll0fML?=
 =?us-ascii?Q?mXoM6ai8zfGCRJPLHrzQnigvQSDQ7rswLXcnqvM6iA1Agnb9fP7WgkDLKOvi?=
 =?us-ascii?Q?QSs+NWsu0y3YBMyQ1gCJgy/TeGhkmj+soOdQzey3e+CsHj0zqVZm7MkzYjoO?=
 =?us-ascii?Q?oF+ldaHV13MLcyByhX4WCBlmLDR6GhJ82gHpXMWetd5NBvS8naXm1ECnjNob?=
 =?us-ascii?Q?avOYg0D6AE/T0p9X4+toWnxI4UV/rAsVjeCAfSzlE5/ecAs9rAFa682rzl+w?=
 =?us-ascii?Q?NqNhctwMJZK1vTEeRMN/pblePB8PP9v7e0nXqUPbcpnk7vEO0Q6LlGwp1dmm?=
 =?us-ascii?Q?2uXfQ+ASQfoL8XVrfT6pQZhR8jSneQ8N1H7LYx3nDmlwqnPymkBKEy/VgCZr?=
 =?us-ascii?Q?MhghjPSYpJw0tEivqpgFMQ59EpchvXJ5cZCUPgLKzQChQGCOvhszG2suhFc9?=
 =?us-ascii?Q?kwbewv76a9w0yhz+IemyasDOs6Kx9NVL45lu88gvU4YMWcais+bk6DONtH8d?=
 =?us-ascii?Q?1g6t7NXJaf0NnWgwIV8Qh0T9oog63ZMFYBrI+wayqlGdfbCdfANtffbKRU7L?=
 =?us-ascii?Q?Boxuzsvu5PTaE/lcoZ2ulqIXA2hR3Frz+VGqsO/zOKSpCJBq9M5DdLhUv7il?=
 =?us-ascii?Q?dEFWHYGwl6gPuR9p9Q9t55MDraOaQXIDpZFRXEITwx8Jbr4aMhh3GgXhuh7z?=
 =?us-ascii?Q?gDAzf0mIltiiy2hivQIhg4ta+4v1cCILnHUY+nMDXp9BK4a/1R2++ceafEzi?=
 =?us-ascii?Q?XocoNtdtAWitwMcqTju8+peKgi3S+ieiMtlgx+eveuG11g8PwnhOIqID4eBw?=
 =?us-ascii?Q?21n5EQ4+XccPC7ohxCIzbNnf+2bHttATGglbL4VcOVgyR3L2BKYAMhH1qt3q?=
 =?us-ascii?Q?WR+VppAATFqZBv0vSvT8GX+xbbBXPkeJh82R9h3tAIINqV7d50VZp1x39KNw?=
 =?us-ascii?Q?/RR2Enbm2kV3AY87Cvp31dUkLm9ssMOd3VdO1XEWudyiyZc98TxBH4jLUnV9?=
 =?us-ascii?Q?3g7zd4fMLz0qLTbAi2QEBHNWKWlKKhiWevlxfCLboalBhwkyi0uBaEqvVZoz?=
 =?us-ascii?Q?p+4xnWC/21aoF5if+OF8xHbkVbxuYelsWY/MKwgfW9AjosvyWOZnoaEAga7C?=
 =?us-ascii?Q?qZsJf0i/sKDBUTu8WLvY3hp40dHfV1eOr76JG5B6k1D2sNKbsdMIfUja4A0R?=
 =?us-ascii?Q?6vMRbFWExV2oThAbukg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d92b70-d349-41e0-200a-08dbc3f6199e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 09:49:56.1962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCyFUjW9As5L09Cg/U/3U3cO/SkTb5Ixx4+V4iYG6ONZzivoamWSGJsBHR+yOAiZJ+rtq6gefL6RgKxK4ZndyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Subject: [PATCH 1/2] clk: imx: imx8: Fix an IS_ERR() vs NULL check in
> clk_imx_acm_attach_pm_domains()
>=20
> The device_link_add() function returns NULL on error.  It doesn't return =
error
> pointers.  Fix the check accordingly.
>=20
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8-acm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-ac=
m.c
> index 1e82f72b75c6..83019b986622 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -287,9 +287,9 @@ static int clk_imx_acm_attach_pm_domains(struct
> device *dev,
>=20
> DL_FLAG_STATELESS |
>=20
> DL_FLAG_PM_RUNTIME |
>=20
> DL_FLAG_RPM_ACTIVE);
> -		if (IS_ERR(dev_pm->pd_dev_link[i])) {
> +		if (!dev_pm->pd_dev_link[i]) {
>  			dev_pm_domain_detach(dev_pm->pd_dev[i], false);
> -			ret =3D PTR_ERR(dev_pm->pd_dev_link[i]);
> +			ret =3D -EINVAL;
>  			goto detach_pm;
>  		}
>  	}
> --
> 2.39.2

