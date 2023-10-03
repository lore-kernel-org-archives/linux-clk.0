Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E379E7543D
	for <linux-clk@archiver.kernel.org>; Tue,  3 Oct 2023 09:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjJCJtP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Oct 2023 05:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbjJCJtO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 05:49:14 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B23291;
        Tue,  3 Oct 2023 02:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KX7/eQ35PUOtDcMLLHPL8+Czgp55Z0rBRIIth7+4iki0KKjhC0koD4Eodz2SFtq6govohlUQi38uBSi3lY3Oq6FcwzvQF8VWSokqXTK3kPdmslQVVa5s+TScN5gD9QA9k77INKgtxB71D+o+M9ipozf/MhnswP5s+zFpLq77LcvVKVA7XDoymBF71MtI76MWDNqHaYtPJxVfI4tJaRB0MZ+GNHl24ptvMNiDPJV5juYRcXR6AjIjo2sigRUVwUhrZSFuuFV+HgH0pEcCPNx19wJCD1Y8fkjcv3Z6RrVgP9vXEQxI0LMd2WhQsYKFMlR8j9rkuwyTduykdpM2F/itHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MG2pWYLKNPeW4OIAInOH4sqr5P6TmKJ5nVrprThocgg=;
 b=AJ/+4hmyBpCF1Yn0+/XUX9NMrMmG4bhLeRT3pwPkBalB97CSnu66fUyNhp0zsWcPw0DmN2ooWtWGobJhwoiUvCVoPkm9FCTlqvgi5DGUB96HxHtOOW7W8uLFodYeZ4Db5dSR5N5ZWweVuUvS9uPgtgDHXuWlNSkDcFYyPOYBq/TYpAVLBvNqbha1JN/ehhn7+rg64RPok728OxJtemL/87CbGCReH32lgxgpIe9+IdyrHB0Pl+6pWj5Ky1Tiek0bUv5vo1lDYm3FYy22vxihTUnVvCxq9CJ3SHOyKckH42mTFxPYMy8P6UV6SChWh1/nGjLtd6y70AWed9hsqnfAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MG2pWYLKNPeW4OIAInOH4sqr5P6TmKJ5nVrprThocgg=;
 b=X0Ra0AIbGSIHqpRgLGkh/oHhMrBeQq86xNmdUOxHAhjx7i2u93TONPIazZcawt9SWb4rdh6Vj472HX9WCLQ1wmKWtczkZMtxTl4+aR94VkddoI/VoHAVZoTy+U0kc8q5fyWBnegX1Pfd8RYxuy+Qd28F//6mBF+vzW+LIEozhI4=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB7685.eurprd04.prod.outlook.com (2603:10a6:20b:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 09:49:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2b3:d8de:95c8:b28b]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::2b3:d8de:95c8:b28b%3]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 09:49:08 +0000
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
Subject: RE: [PATCH 2/2] clk: imx: imx8: Fix error code in probe
Thread-Topic: [PATCH 2/2] clk: imx: imx8: Fix error code in probe
Thread-Index: AQHZ9P6B/0wDnwCJb06URTKw/U+MarA305tg
Date:   Tue, 3 Oct 2023 09:49:08 +0000
Message-ID: <DU0PR04MB94171B246D54CBA1C1B4C09788C4A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <44bacaba-848b-4e62-908c-16538330d4dd@moroto.mountain>
 <06727485-a142-4ebb-b764-49841537d44b@moroto.mountain>
In-Reply-To: <06727485-a142-4ebb-b764-49841537d44b@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB7685:EE_
x-ms-office365-filtering-correlation-id: a379a948-8955-423a-fde5-08dbc3f5fd07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uyGLuWHS4Vnz1Yq0wcqeFOqoLDpVhteg+WreNst228uHRS98KjEMTXysRSP5DV+InTbd4h11aA6t/MZdo+1EjASnT0lc7Q2uIXdWcUt1o72amfP7heQgPcSL2tH8n7sbgalPo/uQ+8S++n20ZD7+u1G5E4ACliPBDc38A8SR3FoklKegQqGQIDqhlIP5i2HKdPzD3HozLLES4kiSrzU/35UIPHHGuNh3ZhyS81/tHVjDOKtX/qOHP2MsE5c1GQ45JwFQI74DV52WhMmI+9pps5IykjT/+X3qwIqUq2a1s9c4OL8ekjm6PdqNJot1/FNXFFhJHZdkPFfg4UsN9bJfsjZm2KdtgEgTiE28J0wkMEx3pFjAr6fDp/qhbiD/RD1m5h4/o3Y16NMEEnna7kShr0T/sGm8j252aQEPZ/HfIFri0ogA48mdoRH2ppNK/8QNsMF+IjpyAJWcwIfGJnxzQy81N3A7eVbZCdwqflE1W+RhSkEb5dJwTbBxIWBUF/yVjd9BZq90lEQsVEARVwszIMoh6731wSkqXxRA2KpLUE12fALAybkGGxty5qayPSTp1C4kAzvgkH+yucYa9HI0fll1Csq/s7AGWbGXtUKg3BBYUdqwEOlMl0xEp/b9oNoU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(33656002)(86362001)(55016003)(71200400001)(6506007)(7696005)(66476007)(52536014)(64756008)(66446008)(4326008)(9686003)(110136005)(76116006)(478600001)(66556008)(66946007)(54906003)(6636002)(41300700001)(316002)(5660300002)(8676002)(26005)(8936002)(4744005)(2906002)(122000001)(38100700002)(44832011)(38070700005)(7416002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nsdqe9Ls5LJk9ARsl61rqvWrvXEasV7uW2fa8DdEMzs+tDQRZ5LpmVscWZBx?=
 =?us-ascii?Q?I89kHmTo+ocoUWEbONQrIvEEuf08SOlEYKB98Mz8RZjNJMvxITYWuTSQ0N3M?=
 =?us-ascii?Q?BT0ZfvYwF6TbXgKetaSY+pXBaNqAb2vLodwj1fnPDgNdkG03WazyNWw6Dfpq?=
 =?us-ascii?Q?AWRxXHENA9Zlp1LKWssp+pmCn7OO3iwdWisU9tJxyAZmTwB6WDSY6DeOxa5s?=
 =?us-ascii?Q?CSgffC1Ss5ZTa/3JDgeokz7EZQhlmkEJYCncpZnmVoWF/tT7bzVA3JflEaGY?=
 =?us-ascii?Q?wjWTHLLMPmOIMW++AL5DrO9U5T8+W5NN5x3T7ZTYo8p7BdsdWTHG7pKEyR2q?=
 =?us-ascii?Q?dMzMeJiJemqtYzKx4cQtJ+OroZ02Urucyp0YuKqrfwE2tPakSTxbWo0vM2YR?=
 =?us-ascii?Q?O+3Ma9JEs/PF0snujJlg9qcq/ffK9ZJeC5xisQWzPEPYwl3wyyKzizn/Lrn3?=
 =?us-ascii?Q?yGXqvDD1GU84/OaQY2X3EnPFfuzKDHjCnJ5sl7d/Nu5Mr5FcR/sTxL9tyfD3?=
 =?us-ascii?Q?dUJ6VoCT79Gc/hp8oelKeNCOQPBgXjUtlKCUb9EvJeSRlMeWBrb5ybq5ttuP?=
 =?us-ascii?Q?/u5GDNQiq6eQ931CbPtQeLjM+GfMeES9aYIu7rvJguckRPTEHx+HV15CVhR3?=
 =?us-ascii?Q?6Yt/d+i0Kl7FCpmPKQa7gas/BKl1qgFV+fvMi3krbGTxRQxnpgv72xQ7xBDK?=
 =?us-ascii?Q?N7wUY/vomJebj2G2yglPmbC42NDSRQYnYVnE03FVlBvH6iSoJwLsH8Ebej0o?=
 =?us-ascii?Q?fIssq+Nsshm7UoqUBf5zTwDLIDuGKAdyKfCW+wuCp8Kl1xc4aJ+3ARhOLIaj?=
 =?us-ascii?Q?rUB+phF9VRBsTqegY1vfCcycYSAaOM+TJlW0IVTSzChV5w22JrzdGGrH8Ctd?=
 =?us-ascii?Q?/QeG3+5jmyggAfl/6TzMuQVjx03eBgzMM1b+LUoYHvTIHvm10iMW4VHxnyX8?=
 =?us-ascii?Q?F+84JZkUm+fyOF924lHU3DqkOwPxpm3Hpkjup7/0Ye0a0SSFj6UlxnsUy1YJ?=
 =?us-ascii?Q?WuAlg9yU/dFxrip7GI905qGQPh9V1+dGc2xc84VbUFiMZlqsCbCmRDAjcOr8?=
 =?us-ascii?Q?hQUNhyRmF/QvujS8cTDqKeYaM0JP+o49cNjj4A00UOJtDmipc6MFQupAbEMb?=
 =?us-ascii?Q?JeSlkrOZcVZfBwD93bLtuIL583VDsbXtVPbGq+zreKfVBkmzipRNpUrFpJjZ?=
 =?us-ascii?Q?UC1Y9HC5xj44yFkEPzxuMsJ5jjdVEYl0ktlnZ6HO6vGTUQbBxeJW0QJ1bUg/?=
 =?us-ascii?Q?GHEhiWLvcuncsntEynYC1PrDadDg3etT6kZTVdN2A6/qm5yban6W0b4P9ih+?=
 =?us-ascii?Q?xydFzXnlFsuv2stn/yrSHKmiPTOA8/GkQgIsKjEcunu14fn95JG9jI7APk4l?=
 =?us-ascii?Q?+L5FjA3jGEccdyJqV/NURmTY3Kr6Hynlf9nWGH37yCpi2u1pOSiWsgcJiaZ+?=
 =?us-ascii?Q?HxlwP8xvDDRROEy+5T2V+NReDVaEC/F53QrRANVqotVdZhxgpCCAGzGPIncV?=
 =?us-ascii?Q?XstcUi1IOBMBn93SOvvA7777GcDXR1gh9KMDdC0c2Y/b92w9qbER5IICQ6NK?=
 =?us-ascii?Q?Ls92JDBXjaHrrfn0kB4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a379a948-8955-423a-fde5-08dbc3f5fd07
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 09:49:08.2115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oOqT9FIVpdli9DwUfvnSPq/dhW6XfSC84PKMS/IRcaB2ts1P4QrkjP9NW9M1qrvBwvrMkGu8y8Fs74K37phXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7685
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Subject: [PATCH 2/2] clk: imx: imx8: Fix error code in probe
>=20
> Preserve the error code from devm_clk_hw_register_mux_parent_data_table()
> instead of returning success.
>=20
> Fixes: d3a0946d7ac9 ("clk: imx: imx8: add audio clock mux driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8-acm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-imx8-ac=
m.c
> index 83019b986622..550ceac45ff2 100644
> --- a/drivers/clk/imx/clk-imx8-acm.c
> +++ b/drivers/clk/imx/clk-imx8-acm.c
> @@ -372,6 +372,7 @@ static int imx8_acm_clk_probe(struct
> platform_device *pdev)
>=20
> 	0, NULL, NULL);
>  		if (IS_ERR(hws[sels[i].clkid])) {
>  			pm_runtime_disable(&pdev->dev);
> +			ret =3D PTR_ERR(hws[sels[i].clkid]);
>  			goto err_clk_register;
>  		}
>  	}
> --
> 2.39.2

