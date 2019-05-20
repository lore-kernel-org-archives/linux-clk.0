Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80CCC04AAC
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 11:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D5CF20645
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 11:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PLJ91YXS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbfETLpe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 May 2019 07:45:34 -0400
Received: from mail-eopbgr70048.outbound.protection.outlook.com ([40.107.7.48]:5129
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728719AbfETLpe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 07:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfA80TGvULLlPL07iN7Rc8pLxv5wrcP2TwaQn0zY7co=;
 b=PLJ91YXSI4UKqHl7kV35XM3/n2HwFeI7UoFSMNPxc5PCpLLa4gjqgdBkHZUlRDdPA1lom0BKKfQiIpxjoBMlxJ3VHAUrwwBmTpv1znxWocx9LKHDWaT9HAAa9aPYYwe1XX1RctI6tnWvVdslQpIyQt0M5cad1AQZZl82EAO3gUo=
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com (20.179.252.215) by
 AM0PR04MB4081.eurprd04.prod.outlook.com (52.134.93.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 11:45:29 +0000
Received: from AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec]) by AM0PR04MB6434.eurprd04.prod.outlook.com
 ([fe80::19be:75a:9fe:7cec%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 11:45:29 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Thread-Topic: [PATCH V2 2/2] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Thread-Index: AQHU/3scG8TUQr2pEky5UPAqffgQoQ==
Date:   Mon, 20 May 2019 11:45:29 +0000
Message-ID: <AM0PR04MB64342D68FBE19FFE3A5BC618EE060@AM0PR04MB6434.eurprd04.prod.outlook.com>
References: <1556645270-20648-1-git-send-email-aisheng.dong@nxp.com>
 <1556645270-20648-3-git-send-email-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be90ab91-34ae-4bcd-c11b-08d6dd18a87f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM0PR04MB4081;
x-ms-traffictypediagnostic: AM0PR04MB4081:
x-microsoft-antispam-prvs: <AM0PR04MB408172DBB8AE565A9103F367EE060@AM0PR04MB4081.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39860400002)(376002)(366004)(136003)(346002)(199004)(189003)(44832011)(486006)(66476007)(6436002)(66946007)(66556008)(64756008)(66446008)(186003)(76116006)(76176011)(476003)(305945005)(8936002)(66066001)(102836004)(68736007)(25786009)(316002)(91956017)(446003)(478600001)(5660300002)(86362001)(7736002)(7696005)(99286004)(2906002)(74316002)(73956011)(2501003)(14454004)(6246003)(54906003)(26005)(53546011)(9686003)(6506007)(110136005)(256004)(14444005)(53936002)(6116002)(3846002)(4326008)(52536014)(81166006)(81156014)(229853002)(33656002)(8676002)(71190400001)(71200400001)(55016002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4081;H:AM0PR04MB6434.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H1Z6YgyHbGiKEGt24jAizOa+QnPU77xIBUtc2inKN7ljP5P3GEU1rQpoxbThwi12SJS/Y0Ewhgqf5qCJ/4t3n0d13quGa7YS4rabPEZ6jZLgdC/gBBQ1SSwoozdFMNJm+p9/hYfUj4c+JAJnKJqpNhwaqls1mzbTEl7KQeWnwFOq0Jij6At0dOjr/upINRUpyiCN6kopn2+CsyGqjXNYzOxmVPRCZGkIBNMIV5GT5EtgfukeafdpXy62Vxo6VK+dv2eSEgLeLmnSeZQTSH5E74zXm9VpMoCcLQelj5G0AxL0f5FGlXFbNoxGl7YmkVc5TteVWVn6AOt0FF7ZXixY/z02ikZpsnHD12PbQUKE4LAX/+d9TnBG1+RVzOcx2KrZIWjMytbS8OhmRo6YIEGp676hC+b0lErlWF8NuGUFKyM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be90ab91-34ae-4bcd-c11b-08d6dd18a87f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 11:45:29.3933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4081
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30.04.2019 20:35, Aisheng Dong wrote:=0A=
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside=
=0A=
> in different subsystems across CPUs and also vary a bit on the availabili=
ty.=0A=
> =0A=
> Same as SCU clock, we want to move the clock definition into device tree=
=0A=
> which can fully decouple the dependency of Clock ID definition from devic=
e=0A=
> tree and make us be able to write a fully generic lpcg clock driver.=0A=
> =0A=
> And we can also use the existence of clock nodes in device tree to addres=
s=0A=
> the device and clock availability differences across different SoCs.=0A=
> =0A=
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/D=
ocumentation/devicetree/bindings/clock/imx8qxp-lpcg.txt=0A=
>   =0A=
>   Required properties:=0A=
> +- compatible:		Should be one of:=0A=
> +			  "fsl,imx8qxp-lpcg"=0A=
> +			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".=0A=
> +- reg:			Address and length of the register set.=0A=
> +- #clock-cells:		Should be 1. One LPCG supports multiple clocks.=0A=
> +- clocks:		Input parent clocks phandle array for each clock.=0A=
> +- bit-offset:		An integer array indicating the bit offset for each clock=
.=0A=
> +- hw-autogate:		Boolean array indicating whether supports HW autogate fo=
r=0A=
> +			each clock.=0A=
> +- clock-output-names:	Shall be the corresponding names of the outputs.=
=0A=
> +			NOTE this property must be specified in the same order=0A=
> +			as the clock bit-offset and hw-autogate property.=0A=
=0A=
Splitting the LPCG areas is good but describing "bit-offset" and similar =
=0A=
inside devicetree seems excessively generic.=0A=
=0A=
Perhaps we could have many smaller imx8qxp-lpcg-sdhc, imx8qxp-lpcg-enet =0A=
etc where the actual clks inside each node are still defined in driver code=
.=0A=
=0A=
>   usdhc1: mmc@5b010000 {=0A=
> @@ -44,8 +66,8 @@ usdhc1: mmc@5b010000 {=0A=
>   	interrupt-parent =3D <&gic>;=0A=
>   	interrupts =3D <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;=0A=
>   	reg =3D <0x5b010000 0x10000>;=0A=
> -	clocks =3D <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,=0A=
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,=0A=
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;=0A=
> +	clocks =3D <&sdhc0_lpcg 1>,=0A=
> +		 <&sdhc0_lpcg 0>,=0A=
> +		 <&sdhc0_lpcg 2>;=0A=
=0A=
This is less readable, can't we keep symbolic constants?=0A=
