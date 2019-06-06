Return-Path: <SRS0=srpp=UF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA13C04AB5
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:15:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36EF22083E
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jun 2019 17:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="L42reirw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbfFFRPh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jun 2019 13:15:37 -0400
Received: from mail-eopbgr130079.outbound.protection.outlook.com ([40.107.13.79]:20822
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727522AbfFFRPg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 13:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BO6M7AjhOrmOxGslFzN/bgKqFe5z7habblc+oo3UMQ=;
 b=L42reirwGlm0+Qh/GXifKXk4cBWWg30qMfOVIkWVE+1ZxlalM951u9b2LZzRiEz4TE2vYt/HryxE3JSDZrhVZJJybpCc4lisNFJ0X3biBV7CI6e0yckc7mlOArQErPXkZoP5v5VT6wxVAPeK30u8QLE0XNQZEqUKlU7O/UP1r8U=
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com (20.177.50.140) by
 VI1PR04MB7008.eurprd04.prod.outlook.com (52.133.247.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 17:15:33 +0000
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1]) by VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1%7]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 17:15:33 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Fabio Estevam <festevam@gmail.com>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Thread-Topic: [PATCH] clk: imx8qxp: Use devm_platform_ioremap_resource()
Thread-Index: AQHVHIcxHWmfkvAr/EuXpTcQK96tVA==
Date:   Thu, 6 Jun 2019 17:15:32 +0000
Message-ID: <VI1PR04MB5055C4B288BC19F6E1EF9D65EE170@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <20190606164443.6991-1-festevam@gmail.com>
 <20190606165546.6675520693@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00ac89c4-8f8f-4e3a-aee0-08d6eaa2955a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB7008;
x-ms-traffictypediagnostic: VI1PR04MB7008:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <VI1PR04MB70087E116D750AA74D9485B4EE170@VI1PR04MB7008.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(486006)(66946007)(8936002)(14454004)(316002)(4326008)(66476007)(66556008)(64756008)(66446008)(73956011)(110136005)(7696005)(476003)(186003)(446003)(25786009)(76116006)(44832011)(54906003)(2906002)(966005)(86362001)(74316002)(99286004)(53546011)(8676002)(81166006)(66066001)(6246003)(81156014)(71200400001)(71190400001)(6506007)(229853002)(305945005)(6116002)(3846002)(478600001)(26005)(256004)(7736002)(6436002)(68736007)(53936002)(52536014)(5660300002)(33656002)(6306002)(9686003)(102836004)(76176011)(55016002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB7008;H:VI1PR04MB5055.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EyW915xf/KhJtxpsMxjuDtZ/w9McvgWWhHV5YnvPmvaB6Z3tmuo2JxeRWV66VcpdSt88Wg87nqp+QTeBcvd3Q+rwpXubdL1M/Lwf9/3T/oHtyffzmmwC/qGaOCLnhZ7fYo27F2XxHYCnSOZPYgKpm2Vaq9g3Ur5kO8i0EzQzd3lDThRULCeAXkS47Ow78csmEIhvaVWS0G+GElEy9Z03jLhT/cN37kgiDajoKtS8Q1vHTharOKFKgugKzUQLwofvKwQNtF1sV9+EOp6HCo9XRseP4Jyt/QfrkqBnqJsrpLczt0dm8AElmMwjyJQrGml5PhfByeDinjaZGsSyDupc4JOrTMBZpBbZE2X/OCyfMukvLXKPwUCoapZvI0f6sbY6WyPVOL3KPZfEwL+uWZFZMFHRfODipM4HnqojRRhvoOA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ac89c4-8f8f-4e3a-aee0-08d6eaa2955a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 17:15:32.9924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leonard.crestez@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7008
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06.06.2019 19:55, Stephen Boyd wrote:=0A=
> Quoting Fabio Estevam (2019-06-06 09:44:43)=0A=
>> Use devm_platform_ioremap_resource() to simplify the code a bit.=0A=
>>=0A=
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>=0A=
>> ---=0A=
> =0A=
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>=0A=
=0A=
An extremely similar patch was already submitted and then reverted =0A=
because it breaks boot:=0A=
=0A=
     https://patchwork.kernel.org/patch/10908807/=0A=
=0A=
I tested and this new patch also breaks boot.=0A=
=0A=
The current imx8 lpcg driver maps entire subsystems at once and if =0A=
devm_platform_ioremap_resource is used then devices inside the subsystem =
=0A=
will fail to probe, including lpuart!=0A=
=0A=
The hardware on imx8qxp and related parts (imx8qm) has multiple separate =
=0A=
LPCG blocks interspersed between devices. Some refactoring patches were =0A=
posted by Aisheng to split LPCG into multiple blocks but apparently got =0A=
stuck in review:=0A=
=0A=
     https://patchwork.kernel.org/cover/10924029/=0A=
     https://patchwork.kernel.org/cover/10824443/=0A=
     https://patchwork.kernel.org/cover/10824537/=0A=
=0A=
There were some disagreements regarding DT bindings for split imx8 =0A=
clocks, what would it take to move those patches forward?=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
