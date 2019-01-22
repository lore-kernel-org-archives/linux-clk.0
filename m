Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C61C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 12:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B30F2084C
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 12:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="xHaBmU8A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbfAVM7L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 07:59:11 -0500
Received: from mail-eopbgr10059.outbound.protection.outlook.com ([40.107.1.59]:7572
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727936AbfAVM7L (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jan 2019 07:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLwFxAh+dQuCj7brMER9Gflb305wlSlW7UbDrYrf2CQ=;
 b=xHaBmU8A9MQDbDMglxje9IpjAupWIzG6awN8PVJdwBvjuyUzd3a+Mmd/YFsj9h2ReZi0o46NkpcKUo0gHagWps/eyXgPvHOBhU9/RzBmqZD/GvgVNzTw26VaTxjlFOptADpoPN13dD3MVpJkSzklLnM2TA086qrEImpxf7FBwWA=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5586.eurprd04.prod.outlook.com (20.178.117.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.31; Tue, 22 Jan 2019 12:59:07 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Tue, 22 Jan 2019
 12:59:07 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72
 clock id
Thread-Topic: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72
 clock id
Thread-Index: AQHUqaSkppDl39MTT0aJiP3Ffy/VUKW6emSAgADVzmA=
Date:   Tue, 22 Jan 2019 12:59:07 +0000
Message-ID: <AM0PR04MB4211003C959DCC89B169D39B80980@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-5-git-send-email-aisheng.dong@nxp.com>
 <20190122001011.GA15952@bogus>
In-Reply-To: <20190122001011.GA15952@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5586;6:bo/KfGmxVgQNDpKgVffIHBCj7rXTzogeMw06ES3gEpPsRw/AvwdkJbAHsjRtcT+Cv9pXTtlR95EAyTjL4tdGhPE7LMZFOo1cr5QDn1mDGiq4xgNGURac/SPsil45hOmxB+GTxtottiN5Y8sv+qZvHAjy7V3u2G3GlsTVQtv2jaBIrihi0yUIRLvfak6PXuIRqcE7S0pkycb3d+pkqh0sR191m8pRfMvJdFdQA06uU8O+Ko/yLx6E1yaPyQCtRHnLAz2Q0ATPQxTOOIAiYB5PlHo5F5788Xwitbj5BGGb6Vlol4jxC9waFlInbH9m6aQis0FBj//ZQDQU+sdmhb8OHOYFlyhPVuQHYkwpfl45HdmHeAXI/uUnckGEZLLy23J5UCeeAo+nEhyEpXbzbtT3meGsMC3T551aQ86Ovqpek+tR/JZVXjJ71/PAe+EewJgKzkRH/kBlMvUts9vShGs8mQ==;5:BThYMZjREDTRJ9n9T08h5zyl0LOkSJwxW5+Zy604sH8AQFsQFhy1xThWHu+H6kLy1HaoDsmQUaTcfik+aNyjYmjgBzZCHrTqYd0eFq2vFcny5FgnsBmNBTxt9T1/FKSxkQkO9Gk3YD7cgvT8acGMF+7eKjjTtb3zDEpMJ/ztgWZx91MPTdrlXB6quRdRhnTRA7BtLQ+2sqR5fXFiyYiCeQ==;7:Iu193nZSxZ211aI1XhPX1tWTHPde5nJHNkBYwC3JJF3qoR7gpN2eDNWA9pgZ/psFTFgnIDtA2dY9H7sHdQnTSe9/fNBnxiNfY0hSsyMIWvai/O8ml5DYRUF6qGm5rHGaeX3lwfEJSItVzKK72c5tZg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 0ab23428-2c39-4b60-4394-08d6806964ee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5586;
x-ms-traffictypediagnostic: AM0PR04MB5586:
x-microsoft-antispam-prvs: <AM0PR04MB558670BDAB694915170C6F9F80980@AM0PR04MB5586.eurprd04.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(189003)(478600001)(71190400001)(74316002)(102836004)(25786009)(6506007)(105586002)(14454004)(71200400001)(6246003)(26005)(2906002)(186003)(76176011)(4326008)(7696005)(217873002)(53936002)(3846002)(14444005)(256004)(106356001)(305945005)(66066001)(6116002)(55016002)(229853002)(486006)(6916009)(9686003)(7736002)(81156014)(8936002)(81166006)(11346002)(446003)(476003)(54906003)(86362001)(99286004)(316002)(8676002)(68736007)(97736004)(44832011)(6436002)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5586;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OQuNHtQu1WrjIW+806xAWUPm4gzSbS3TxC7zoQMeY2H7vyDiJpBurLyxmZq5Vlqk0wmZEH20eyv9HmDThNnS8unlLa0mPV7m84qpFuFfQPd7Zz0j89gn3vWwdeIhcQBkx/skvkdjozDyKEz1QqKVSdrbnd2vZG71blVFAphITdkNRYrF4jGilVFd+m9GYmgIkSWRoOsaE2ZW0XytosveYU0wX8/wghPK4JOcKiGAID97ZZWHRAWfuH6AY4h+hOdS9AoAb5CjchDnaaSQGgfpOE7UXaD3TVgdhQPWgS3CiCeIawC98rnqEL1xqWpLFBXja44mVDgc1d2WdEhlgPxVXM9rHyrxyVyeb9LiT/0ZTfwelgtQnsaHIolgF0QjvkbhYTBsmipxB3RdRo5xxT5EoST9sb+EbWZm+BSx1P01V/E=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab23428-2c39-4b60-4394-08d6806964ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 12:59:07.1791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5586
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Tuesday, January 22, 2019 8:10 AM
>=20
> On Fri, Jan 11, 2019 at 11:56:09AM +0000, Aisheng Dong wrote:
> > Add a53 and a72 clock id, as there's still no users, we update
> > IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock id to
> > be continued with a35 clk.
> >
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <kernel@pengutronix.de>
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/dt-bindings/clock/imx8-clock.h
> > b/include/dt-bindings/clock/imx8-clock.h
> > index 4236818..2f1aa2f 100644
> > --- a/include/dt-bindings/clock/imx8-clock.h
> > +++ b/include/dt-bindings/clock/imx8-clock.h
> > @@ -13,10 +13,12 @@
> >
> >  /* CPU */
> >  #define IMX_A35_CLK					1
> > +#define IMX_A53_CLK					2
> > +#define IMX_A72_CLK					3
>=20
> All 3 cores in one chip? If not maybe these should be split or define the=
m as
> cpu cluster x clocks.
>=20

Not in one chip.
Here are common clock IDs used for both MX8QXP and MX8QM.
You mean change to something like below?

#define IMX_CPU_CLUSTER_A53_CLK			2
#define IMX_CPU_CLUSTER_A72_CLK			3

Regards
Dong Aisheng

> >
> >  /* LSIO SS */
> > -#define IMX_LSIO_MEM_CLK				2
> > -#define IMX_LSIO_BUS_CLK				3
> > +#define IMX_LSIO_MEM_CLK				6
> > +#define IMX_LSIO_BUS_CLK				7
> >  #define IMX_LSIO_PWM0_CLK				10
> >  #define IMX_LSIO_PWM1_CLK				11
> >  #define IMX_LSIO_PWM2_CLK				12
> > --
> > 2.7.4
> >
