Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91750C74A5B
	for <linux-clk@archiver.kernel.org>; Thu, 30 Mar 2023 02:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjC3CZY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Mar 2023 22:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjC3CZX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 22:25:23 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2057.outbound.protection.outlook.com [40.107.241.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 534274C2D;
        Wed, 29 Mar 2023 19:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Psd+6k8oMXATDfC61/LLNomgtWo7xTGv21bG8wK/RmflyfZp1c/U8Zbydesadm9PoWyLrE9AnywDC8CEYbMqGWhfwqXwl4tfAQMyS1VIjE6/W1Yg+x/z1aixJWZ/ed1WnlMqcU9HgUTXJUCrATx1ljnQBauEaqq3/0sRi+JdUBtDEYgmgb8OrJGnkAk19ArhnXfk6g8qQ3Ynm10zLM157J+7p4qUKlixR3QkjkN9Fsoq+wZulJVG4f7pvBd4WwAOttjPxAu2o4+0Cj2n+8UWMSrnu/iEcKzXIT6sJZfgyPJM/MC8OamViVN1sxWJHDgcVe5HOlLHbxFiUXIRFggTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QDZGVWzd2ttaBI6huPDWAK1FmzDoPOMp0yCZyebQsk=;
 b=QYVO+PwJW6Y5c2j3DtLrZRuAxlmbWTblRmP9Tl8rG257f/q0NAKPkEindcSNAcSOrVoZecbhciCSNvXJJGN8DTPL3vPRhct7myPFdbnd4iHMXq/iS6p02UdHS4kzgiRkifF/hlzjkB2OZFuwDAHG25q81YXydHV2URCNeCgELn8AyIk5vXSYGWHhbBPEw/MsgxuYDXgW3a+Du2Wl4rmcSglsXHfVzPxKZht56bhK6enQ5r7F1qmPFnRaLNITceXQID+MDgE0hprdJPp0HpRhzUiK9H9Emd8YSUO7psf5dGrhITAjujIMi8jjMOXPIWa+fNB7d08WxA6O+FKYGmj6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QDZGVWzd2ttaBI6huPDWAK1FmzDoPOMp0yCZyebQsk=;
 b=j8aGWK4G6Wb/9KVxR4zoFMvB5R67uS3qwY7LrU4tf5Xaq85DyZOdDMdaeY2pfoUl+0iVjEaLDsU6BT3z7qzy2oJr3zQ8T03HBvr9u9Ebosu+2aU+RcdIMt5YbAor6NsyS9U5JBJyvzTo6BoevWOmkDg5auLUdaodyMbl3XN3b38=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBAPR04MB7333.eurprd04.prod.outlook.com (2603:10a6:10:1b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 02:25:17 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::778e:19d0:cba0:5cc0]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::778e:19d0:cba0:5cc0%4]) with mapi id 15.20.6222.028; Thu, 30 Mar 2023
 02:25:17 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
CC:     Fabio Estevam <festevam@gmail.com>, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v7 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
Thread-Topic: [PATCH v7 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
Thread-Index: AQHZTFuDOjsU0hITYEO8EJu7jf2WGK8SxIVw
Date:   Thu, 30 Mar 2023 02:25:17 +0000
Message-ID: <DU0PR04MB94178E878150BBB23D2B8995888E9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20230301163257.49005-1-marex@denx.de>
In-Reply-To: <20230301163257.49005-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DBAPR04MB7333:EE_
x-ms-office365-filtering-correlation-id: 3f34591a-760a-4dd7-9cde-08db30c60073
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHwriOK9uYCGL/eEO4up04cf5v0sWx1Lzt7JqBW3q8mMmtyLbl+P15w3SFOdQx2b8PW9fzK7hrLpTSBjaMDp/B9dDBMufyaZCfiPVQANuOUK9ydld27XCv208Xtq2jnXkv6qfwf3p35ihrEsqLiGIz3aF33cNZ4Qq+oDYPY/43ttCLtgpXAHPzmiJT6EBHAH+S3yJNkLIkad/kuBlj4jkCMV7786kuTWHO+bCV1OCduo1AKoRemKMjc+rxsBlrJvvyv8JQEp+uxKloWqOXomqsm/cSwzbba1tut3z/LpsFh5Q+0JwEgzi2fJzCyfzMPG240aMYGlKJIt0Rcs5gwJo6PivXGT5b8GCctkOmJPd6Ei9w//8ixQpDHp81jDNPe52GOaZ3Qb8VyGzIvnNDVutRxnJ2EjIjsQKBXdcMdTtMS9gFHARY+qlaMQgM4RyUSHSvckts9v3GSsndIt4VQ+dgMWWZ8c1FLoisi2+8+bMFCYjd3pNJeHDv9USZXmyPHywx5zApstOmmGHaLP+VIfgB36duBN7zQJsHRIgOCEUT1TKj75o7ne6aXk4Pb9SkQnsDNq0vGz6Ej4FZZ6xajX6EWsNRd2Ny6cAJoadaR8N50c+C0BOAWLvoQEduAzPfLi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(55016003)(66476007)(8676002)(66446008)(66556008)(76116006)(66946007)(110136005)(316002)(38100700002)(5660300002)(8936002)(7416002)(41300700001)(122000001)(52536014)(64756008)(54906003)(9686003)(186003)(83380400001)(71200400001)(7696005)(478600001)(6506007)(26005)(4326008)(86362001)(33656002)(2906002)(44832011)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eZnvs0gQ6wKY1TWqRHiy/fMbaEAPrwGNivb+0wtfllG0AiCBDq2/QurvvRJf?=
 =?us-ascii?Q?D/naTJ9EgrwrEH4WaTWjgZBI8And/H8p6rMyPnzMHnjSONsCzXpFjBZPMUY6?=
 =?us-ascii?Q?1q7ZTBkU3nFmXT7QkXvy2X1Ea60SBgfAnr29cjnB5Qr/e7qp9FHHKlTZmI3t?=
 =?us-ascii?Q?3uG+7pTrjTSlusEEvCFxANLtkzPBla2hICuhpX0HRfIch35QoENrePfa1SMt?=
 =?us-ascii?Q?snOQ2Qwsl4fg7Y06tPbfY6tUqplXKERRm59IyV/pyJ7WvJ65KnMABob3z557?=
 =?us-ascii?Q?9M/DMFMTOk3kvO/hYw2sMJsotvgOmcMJ2jONy/IppfrpRGKZQMKME6iSqzyc?=
 =?us-ascii?Q?wPgHlRuD4q+tzSUvmsnbtMVnA7ewdntIRfBqBUVokXtMliGFJJP3hO/UpC8Z?=
 =?us-ascii?Q?KfdxfgrNmXpzWLFSO7kmyzB8LZbMvh+yw/ipvwfR1mtRxntszssUtMDR71Qy?=
 =?us-ascii?Q?pNwwkvkQaZFjGBvPMW1ZAJbHmchEpBsUeuVW/ttzreoyZaUCw5ti7ZnHrFG3?=
 =?us-ascii?Q?rF/zlT/mrVIWTGPRUM8sKPYDp73amI54IoUtVJlSWfw9UcumxrV/RPL+Qwax?=
 =?us-ascii?Q?0hyqTMBq/sFMfTB3A8hxwJ7QX/5tqYkjTUKdZth5YCF5cJLznS2JZSyDk/zF?=
 =?us-ascii?Q?6Sg5fLcacS433I7sszna/C3StneP4YgW4MTxLGF3AwOfWi6kLl2/ZKN1fgrG?=
 =?us-ascii?Q?u+XwZL4zeME3jBYt/9/cYVc62XEGOKCLurX3jkLL1Js5LW/574vQwAUIJDrX?=
 =?us-ascii?Q?D2jZvwVUdoLWxHHxVXaeFvy2k1qrdWqSTXMV+nKuhf6bLHHzDgPRP42NHqJe?=
 =?us-ascii?Q?9clQ61sDgEM4608pjtOSp0IKOe5mqQsxl+RLDlnpyA4S41uju7406r1+crzY?=
 =?us-ascii?Q?7DjGUfWznvzOI1EbzUCYq2ibWjtvGxsjnqP8hRhHAxAni1Agc89tcAyQBU6d?=
 =?us-ascii?Q?7MgouR7ssrg9pc43oxhXwizD1Az1nPa/YPz1eLlMGgoXYD9HLUZYQwrGPXUz?=
 =?us-ascii?Q?xTO51378RWaNX+OKVZO5TI60UCc5zsxaI4w23AhvBcmoJum6U7FKoO0MmuPi?=
 =?us-ascii?Q?Q/uvkwFxP16eIQ/LH0CTg07zbbjaXCPSUThjXH/ay5ioi5nVqZPjvS5CR5fl?=
 =?us-ascii?Q?lREfe7IyzyoP825kXZBsE4L8Ct8WfFuGi9NrCIYOSt+pMl17OLTiQ+fwL2eH?=
 =?us-ascii?Q?FDdv7sA1979Ixmn+pVoMNv1OamjgBN8k2dRcrtGgf2symsBhs7XP4ME00/u5?=
 =?us-ascii?Q?E438PlpTi7cL1J7rDxyNJ3m2SkN/ZTYyr5QF2O0p+8+ODSQM8JiiCD2w+wCB?=
 =?us-ascii?Q?NNrcGSaSIWvfeXCYmY/7SgxgDro+kjQzjc8XH6pEsGVJt99ZJXYFS0o7nrhZ?=
 =?us-ascii?Q?qs9nOkRzswjBysWKt/9vY7rj4wj+d2pYRPvRLci4qTkERbegPJM9GZADuf3p?=
 =?us-ascii?Q?C+cbMtC7Ypk5uvl56xaWgUB2z0DbqspsZSGUf3E087kJYC+DgECYe71SkCoy?=
 =?us-ascii?Q?TyLc7o8QEvUK8Mp9KLenRk0m5J0FLsvw78cU/VkGYt+FVARKsI+LJrkHeyOj?=
 =?us-ascii?Q?WKRIghqsIzXuOL9kip0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f34591a-760a-4dd7-9cde-08db30c60073
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 02:25:17.1875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GU8f18kKb7PhWce2LoQRreg8vnCz0FiIYvfgJoN9L/jH+ZVt5QBwmfglDhhxI6dVCmgP1a9MMZIBfD4gOHBvJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7333
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen, Abel

Would you merge this patchset from Marek for next tree?

Thanks,
Peng.

> Subject: [PATCH v7 1/5] clk: Introduce
> devm_clk_hw_register_gate_parent_data()
>=20
> Add an API for clock gate that uses parent_data for the parent instead of=
 a
> string parent_name.
>=20
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V3: New patch
> V4: - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> V6: Add RB from Fabio
> V7: Add RB from Peng
> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h =
index
> 842e72a5348fa..92b7c794c6272 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -608,6 +608,25 @@ struct clk *clk_register_gate(struct device *dev,
> const char *name,
>  	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name),
> NULL, \
>  			       NULL, (flags), (reg), (bit_idx),		      \
>  			       (clk_gate_flags), (lock))
> +
> +/**
> + * devm_clk_hw_register_gate - register a gate clock with the clock
> +framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_data: parent clk data
> + * @flags: framework-specific flags for this clock
> + * @reg: register address to control gating of this clock
> + * @bit_idx: which bit in the register controls gating of this clock
> + * @clk_gate_flags: gate-specific flags for this clock
> + * @lock: shared register lock for this clock  */ #define
> +devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
> +					      reg, bit_idx, clk_gate_flags,   \
> +					      lock)			      \
> +	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,
> 	      \
> +				    (parent_data), (flags), (reg), (bit_idx), \
> +				    (clk_gate_flags), (lock))
> +
>  void clk_unregister_gate(struct clk *clk);  void
> clk_hw_unregister_gate(struct clk_hw *hw);  int clk_gate_is_enabled(struc=
t
> clk_hw *hw);
> --
> 2.39.2

