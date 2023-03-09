Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0702AC678D5
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 01:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjCIBLA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 20:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjCIBK7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 20:10:59 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2041.outbound.protection.outlook.com [40.107.8.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5861BCC30C
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 17:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoTco1NsSf+NRn+W8StF6jizsgFV/UYuoT/6hBSbwi/v7XDLxzDapw3NkvDLREjwLY/QmfycHZ5MiSAAvBb+PSUL/GRrtF1mTVFv9Vt8k7ToQfKZ2fNtHJgVLBFBnAUYpHqOXQb7OHvK6BacBUqh0yeEiFFcqMoRpLkkzczcYF5k5Gy6dF6sl4H35g9vZQlV3T/qUgKdK1PLsC1edII3bWAB6nGhppTxJU8FANoOF3uo4YIoWgph57kCD4GyR5TBWbLvkgN03m80RKPOEQ5CKNDlnoXs3nv0dUr+QD8wj6hKHNn2SnizHt/Xg+pbHj8mmSZ+nrA8v8eEfP45FZfclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08JURW50ayZsFKoGL7LIX0QkoIzpewj3llykayWIzUo=;
 b=LzDKbE9ZyTNaQMdn0Zt2rH5Z0Z6cDEMH7Y30afI9DWlkreWJxK+85r2W5/YVIpCv19CxW0UGBMnrHJt71XQNeumO/Z+jCbsveep9tvTbOrvz0oPJ8QTVDYn2iquCQ33J/+J2n9jyw3HvAGQnudWFJXYzBtgHCP+1f4zZNrDi8cmmzl9g3nBtB6baG3CE6V39BM4005QeQxABHutqTP00LsPaUfAcuExpD1V8pm+50jf4/cKhbEmhBfUjDp0WxTivcb6F74QwfLQTInVzj0GkS4I5b/4oLFHxlFcM00JpWoDGnWOuM9m7UnaWPFb2CeTBSUdEMI/sj9Mcno5Xxewd3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08JURW50ayZsFKoGL7LIX0QkoIzpewj3llykayWIzUo=;
 b=W9UZehfX/nhyy8QuEbBfjrxKj6CyyfzCgCVuat/hRvua++FuvP6r92KuZvev1LINVOm3lMP3vpgijwQ8y+Kv6gGAvXndGydcpREN2fjzu5m1TegYfbfC+2JUsk2U2hPkzQNEntiTFHh0b+oV9JY9yxHLLlGXGoE4uu04idiB4HU=
Received: from PA4PR04MB9416.eurprd04.prod.outlook.com (2603:10a6:102:2ab::21)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 01:10:54 +0000
Received: from PA4PR04MB9416.eurprd04.prod.outlook.com
 ([fe80::7ebc:3d88:4dd1:ecbf]) by PA4PR04MB9416.eurprd04.prod.outlook.com
 ([fe80::7ebc:3d88:4dd1:ecbf%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 01:10:54 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
CC:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] clk: imx: clk-gpr-mux: Provide clock name in error
 message
Thread-Topic: [PATCH] clk: imx: clk-gpr-mux: Provide clock name in error
 message
Thread-Index: AQHZUe5NK4JD13pg9km0mUYoIS8uGK7xpAbA
Date:   Thu, 9 Mar 2023 01:10:54 +0000
Message-ID: <PA4PR04MB9416BDDF2D9558A8048D250A88B59@PA4PR04MB9416.eurprd04.prod.outlook.com>
References: <20230308184603.10049-1-stefan.wahren@i2se.com>
In-Reply-To: <20230308184603.10049-1-stefan.wahren@i2se.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9416:EE_|AM8PR04MB7746:EE_
x-ms-office365-filtering-correlation-id: f7dfccf5-995e-4995-e2b0-08db203b21b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4j/QOH6mWo+GSn2jAB5p3oRmo8IEcMfCTBg8NwBjEk5fjc3yOOT89VeudOzzThSVDdP4VZhA6g3Q0n8jQUSulxVSSL+9k10mhS1yfhiDPwbAxdxNz0l+14p8Giu7e4C/2EVnhVo7J4Mxnm1m4ZSifmK76wBKvYOXX6wswSrDsOTzSuC+jYCXJmEgOidoz73Cp2bZeSwRjRpRK88DdexdHonNgmO1MQOk9OWQl06ptJV1OwYf3lpVn0//5wNEuT390sXXL27VqKS3Pmxb37xSs8eh/pj6iZr9woCuxZ9DtEt+FjCjtt/Avm7PRDkUFMuAvF4Edct8W2+mRUUFtW87aPqp1Vt++KlOzFVVjQZvdj4yjBuhoyjqlqqcTSD740DrmhaaoRE0+IaQVMGEfOIUvZX1dBCJ7RQhOTPtpUV/f5BKtSsMO3U3deBl2r0URdMwOJacPbmG4OA7smG45IzyqPB3yT/kp2x49y7pYVf6DtxDrsXqj7iZZZB+47WX2ClbHfc8zJTKHfuj2731zfjPQdisqf/AdNWv0G/j9Uz9d0NjHpEUvDSoIdgEyM9ZgSQ8dp0SAA0+xsb32td/XoxWXCixQBbumryqWltQcw/Up1dhwqI+uwjhyD8WblCFdHPqYL4UzJX5W1GCBhbePw0zU7dW5eYSaTLPZAfzTVcJ9apP8km9uXn/vSu5lUa6ElRFeFgf9Eu2wwr2ymBQGyYsZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9416.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199018)(8936002)(52536014)(7416002)(5660300002)(6506007)(9686003)(38100700002)(122000001)(83380400001)(186003)(55016003)(54906003)(86362001)(316002)(41300700001)(66446008)(110136005)(8676002)(66476007)(4326008)(66556008)(64756008)(33656002)(66946007)(76116006)(71200400001)(7696005)(478600001)(38070700005)(15650500001)(2906002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E33WgAcbSryNA+m+nfoLuWr8PQUf6htOaebhlhUB0fJHtuo9QV+PhEP2Rham?=
 =?us-ascii?Q?35/5e+xX5+4RQUz0ARoLyWO9RYhaYx7/pj9a3+YUys+mjq0sOmBV22SFWRFr?=
 =?us-ascii?Q?/ZddSqmu9RyotRno3a/jeubU+uuZ0BDqjNw0kwnaS2oW2BxWRqLk8G17Icov?=
 =?us-ascii?Q?8VebaOElS3FFClyCuM9MWw1s6OMKAb2aWXbcRx3lA5VnzCGX43/EJr2V+u+d?=
 =?us-ascii?Q?ls/NQ3gDn0buF0a1zvTx20kjS9PAAiR5b/i35eqlljF1CZMmlP8wYJ9dcAGg?=
 =?us-ascii?Q?AyEmgzAgf8cQ8bpX4Mh51NQJyFstYzzydA/H+rSsYX45AwY0yXQnVisAhgkW?=
 =?us-ascii?Q?2T93xBfPWtCXZam6Ig6zaZCD1jo0rcV+414vCVnjHmLHSHhe6Xs7KyFmzlAO?=
 =?us-ascii?Q?XzYr/BUlOyMIub35IJs2VzuphbXZcSP2FIUOfmxPVtYLtBJsPUWiXSVN4tU7?=
 =?us-ascii?Q?0MioUKsjTU2208NYFKdrljPcvicmOwzBJ4LVZrrRQxNFlpoCWDq4kDtV9pyo?=
 =?us-ascii?Q?rfDuP4QGYcL6xc1dKKGgYZo+rWHDLTSKflCvTWxD8tLS4B34oOos3BVdSFhD?=
 =?us-ascii?Q?Vv/PiuUQzLkof5uN1YQmsWwOjdo6SH5nEpbLWa6wWOSfljIHU6hd1KEli3nk?=
 =?us-ascii?Q?uewUXZiEBiveY1I1Rzsf7/lQwtrgImBsjy+aia8zlKasZ22HcWhWOvKLHCek?=
 =?us-ascii?Q?mmQj2dedYQGcVHvLbGR7pUR4UDav/Iys1l/v6Nhq/If4ov3rK+BoOdRarZy7?=
 =?us-ascii?Q?ATPr2tlwkf3NXuzrAED9oK0mIGK/+C26uT3x2wIm7cDw7MN8NPIl3bY7SnVX?=
 =?us-ascii?Q?7Ma4PYZPySD2ObYzK130j96nSbdCzCwfRpZ2b91ztzgrqGPDJdegqoZVhECe?=
 =?us-ascii?Q?F32MV1QRi178CeSELb7Kgc5BVk91vqEhrqJQz4h0/JOD829XCmgO8Sbtt3Eq?=
 =?us-ascii?Q?iMgPaxv5tLccfIfaD+qx5EVpP9TnERPqNzb4nxqfnesvmiHSEU4plIVFaYrb?=
 =?us-ascii?Q?l+8w7akJMZuiSNIVWJcQyuL2f5PKpBl7pdK8adljs3rdRG2paSgjlpt4H4Eu?=
 =?us-ascii?Q?J+b17974Qqry5iNxmK4rRQDlswJIHVe+JmEQfcYrwklU8bXXgXH33BBrzf+h?=
 =?us-ascii?Q?6Cs4hpPg143PNzQafrPdkq/lEmFXE5swV1pYiuPvIfFCMK+vCb9BDOpCJKSV?=
 =?us-ascii?Q?mFnBA2kRTIYtclsJ0bg/ZuscEKvGyt/FS0yRQBgk6mgJz9BuntMFtyra3A3p?=
 =?us-ascii?Q?3aDY6xtLmvyuEXvuc1SZqD8VhtxoxZ2EXlHX9QTOZhN3equcDIrDPk/2n4qu?=
 =?us-ascii?Q?IsF9Mbcy4tVnvfpjzXtAawZmAaYDEN0gXrZUEAJyMvhIc8PeJNd+LyB063ee?=
 =?us-ascii?Q?d0m+4fBTR9IvvHo1fHTLNc6A2M7OVAsEJNgxE9vE5Lkkd3k1o1SsXD4eHfL8?=
 =?us-ascii?Q?VxVi2e0wWWGtkkk9+xQLGPTadNGRhXd4SLlw0ZWa5y4INLkeq2AngkC7wriL?=
 =?us-ascii?Q?1rRE6Yo/jiU5IGOKbq8/2P5eXbjxa9vVNpV1ckkBYBCgV4OKRxcEwNey4A?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9416.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7dfccf5-995e-4995-e2b0-08db203b21b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 01:10:54.3210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaSDKILT7GNXzUnRe92FRSiS2Uy3p4qyQDpfCxJUQKzITLkUaNOqKW6yntStvM1g+kJ4aEVm+sLH5tjJTwHXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Subject: [PATCH] clk: imx: clk-gpr-mux: Provide clock name in error messa=
ge
>=20
> In error case the error message doesn't provide much context:
>=20
> imx:clk-gpr-mux: failed to get parent (-EINVAL)
>=20
> So additionally provide the clock name in the message, in order to simpli=
fy
> the further analyze.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
[Peng Fan]=20

Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-gpr-mux.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-gpr-mux.c b/drivers/clk/imx/clk-gpr-mux.=
c
> index c8d6090f15d6..0b5a97698b47 100644
> --- a/drivers/clk/imx/clk-gpr-mux.c
> +++ b/drivers/clk/imx/clk-gpr-mux.c
> @@ -48,7 +48,8 @@ static u8 imx_clk_gpr_mux_get_parent(struct clk_hw
> *hw)
>  	return ret;
>=20
>  get_parent_err:
> -	pr_err("failed to get parent (%pe)\n", ERR_PTR(ret));
> +	pr_err("%s: failed to get parent (%pe)\n",
> +	       clk_hw_get_name(hw), ERR_PTR(ret));
>=20
>  	/* return some realistic non negative value. Potentially we could
>  	 * give index to some dummy error parent.
> --
> 2.34.1

