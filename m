Return-Path: <SRS0=cs+B=Q3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DC3C43381
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 07:08:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0575E2087B
	for <linux-clk@archiver.kernel.org>; Wed, 20 Feb 2019 07:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qe8qOkfT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfBTHIa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Feb 2019 02:08:30 -0500
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:40296
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725869AbfBTHIa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Feb 2019 02:08:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUS9Tm2MnJFQ0poIg5km69VS69PHYdWWERGIuD5Ky6Y=;
 b=Qe8qOkfTzeO7XGjuCChyRtLIG/rjWzcODGH1lHj4kZ7Yx1gq8VZKyy0keEAHddP4wCnUa9gLDMmrdUSXA6RwgoIo1D5QZlwCK97y4CgOV5QOOIdAg37cpHEvkhvGXuonbtTVWR2TuqFHIZBJgxnwRfvcyge6/3Qn464XsuoSits=
Received: from AM6PR04MB4215.eurprd04.prod.outlook.com (52.135.168.141) by
 AM6PR04MB5829.eurprd04.prod.outlook.com (20.179.2.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Wed, 20 Feb 2019 07:07:46 +0000
Received: from AM6PR04MB4215.eurprd04.prod.outlook.com
 ([fe80::e944:6749:3ee6:4e08]) by AM6PR04MB4215.eurprd04.prod.outlook.com
 ([fe80::e944:6749:3ee6:4e08%5]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 07:07:46 +0000
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
Subject: RE: [PATCH V3 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Thread-Topic: [PATCH V3 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Thread-Index: AQHUs+fk5QuAi9LtjEObRRH5vLY3yaXebDoAgAn6f/A=
Date:   Wed, 20 Feb 2019 07:07:46 +0000
Message-ID: <AM6PR04MB4215A70B99715434A3770532807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-5-git-send-email-aisheng.dong@nxp.com>
 <20190213221818.GA13126@bogus>
In-Reply-To: <20190213221818.GA13126@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df3c786c-4206-47d1-59d7-08d697021da3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM6PR04MB5829;
x-ms-traffictypediagnostic: AM6PR04MB5829:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1;AM6PR04MB5829;23:ltSlqaYk2xdWTTJ+8J3/nniwVs9r2tinzbHtXi4VS?=
 =?us-ascii?Q?j0vCmQfWJsjlHDfOUDd2dGh1NAtj0/+a460QWjxqkOO+l/LI/qModq9uX7YU?=
 =?us-ascii?Q?SW6zxiEHyXk32SafKUg3nYU+ubIImvrLDUkNa74isNlWwkuIZefVgFKzMm7E?=
 =?us-ascii?Q?Y9nKxDneqUemJgMMHXkDZgvrMhs550olvpht4R2w7HsKjoROjKLxkYgAu3P5?=
 =?us-ascii?Q?SSgqlabNjr9WVzu+d9cVqb6gmQNhiqUcWuxq4s9UahpKx48Jpt4Mr9Zl6CJm?=
 =?us-ascii?Q?C35bR7XU2WihrDmQ4e7muCt34UAc4S9LmvaUATKSETsBPdVprL9Xm7EZG7pN?=
 =?us-ascii?Q?vKdJBNClMpUE9p/f0QL2Gt3CWY5Y6m4Nv9Ae1hOJLZc+zob2KhW/EOUy0RL7?=
 =?us-ascii?Q?ZyEY5iKZ3XFkqzbuRy3JQlUTFfDxo7xP3IGCHJdbMpJtiYprPRLIFkHPWOxj?=
 =?us-ascii?Q?yM2ugBkL93vWbITzY6sYP83D1fQOU8sWCLbbSF2Kdcf4uXaEB/1hSjI+lTGy?=
 =?us-ascii?Q?ubKoa9azf079pLInzV8REanThlDshS58pjlIZmYaA0sSRX7vEIoVYQEz36jg?=
 =?us-ascii?Q?XFn/OoqDND3a2DK+kDR0ahGrIojKfpGERc6stco/fc6YJrHL18ZQFzhbZeiN?=
 =?us-ascii?Q?TFT4huAOGUH36qE32rAhQgKiXxiM8hrx83HapGN8/GtPrfMF9qqNjHT85P03?=
 =?us-ascii?Q?3rNMdBH2rgvUZHTH9poZvCaGND0mklnrKlFu5UI0AoknnlG0idp0KxzYQbHz?=
 =?us-ascii?Q?ClxVBBH/Spa0FsJ7kf4ZZIuVyVwN71+LYtZWIYDkEGrn2zXNAZ8yyXKytPtF?=
 =?us-ascii?Q?kutIV2SCaR+hZrErYO0d0I4LyBUQreezdwYn0/NGZakosZDPVPs37PDVcsB3?=
 =?us-ascii?Q?zJVowIuuC41/acAU3NzzIqrvXhP1EFGWDxaM6jjSko3T3J0RcKDCCI74e32I?=
 =?us-ascii?Q?iJSX1bZhYNowEpUGnA1sZjhwbivp16mv2BLRTikkYVB3TK1fhCsCKD4nVdiO?=
 =?us-ascii?Q?JTN/zXwPtR1TKH+SBSwoQByTQCvL70buXc0h8WSn9bePKvjQMos97J3DREUo?=
 =?us-ascii?Q?X+NhcFsHkR1PBdMQIS5AY8Dt87VXdG49PrPagpJLzwDcHcE15DNqEs2DbpWf?=
 =?us-ascii?Q?c61hGgjIRP1bTNynh1B6sWiDnj0WSwyi36OcItWZnMPRU8caY44doMILKJNe?=
 =?us-ascii?Q?ZWRCktoCi6xmkaJp6NFOEliMVouEfIaflsws4oMQD0yH1uTTnKRm/zLjg=3D?=
 =?us-ascii?Q?=3D?=
x-microsoft-antispam-prvs: <AM6PR04MB582996FEF75DC5FD8BBDE3F8807D0@AM6PR04MB5829.eurprd04.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(396003)(366004)(136003)(346002)(189003)(199004)(476003)(97736004)(186003)(229853002)(54906003)(105586002)(44832011)(55016002)(8936002)(106356001)(68736007)(316002)(9686003)(486006)(7736002)(305945005)(2906002)(33656002)(6916009)(256004)(74316002)(86362001)(14444005)(26005)(102836004)(446003)(11346002)(6506007)(53936002)(71200400001)(14454004)(8676002)(71190400001)(99286004)(76176011)(6436002)(5660300002)(25786009)(3846002)(7696005)(478600001)(66066001)(6116002)(81156014)(4326008)(81166006)(6246003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR04MB5829;H:AM6PR04MB4215.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cQB90Gkxlq+xZCTvm60/6d+RASnmSQ2cwHN/ywj3jMk9QD+KzynRwj3TNN2vmTa+qQr5gCF/dya3aKoFAujL+TJaw2fn2VIV7j7vqNsx3yN048L0LiogBNneEynfm0K5TBOEPTqkNJlmwCFHk3AuUu1bWnaFuzkAcvpVox1FQCQ4vSiq8qv8MNyrZqBTfgfr5Z2Dg53GuS84BXCMBOdK493THBqBSvHb0AOBElzrdLr1R334qm3dI5qQJYXyXrBcD6d6P8p5qIzx6Ex8GKRQ+WsBV9fUNX0iWdEpSzkD+dvQB9yxTJoDraVaqfyGDDbgY+aM5iiid+opbrOVADKrkBvHJOQD4hsvGZp9pAqeeozPl0xV/DyyRT3yixAzqoEx5UTAFoczE5BSChAOdBiqv7OtHnzF7eEn0VzR6AsZYvw=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3c786c-4206-47d1-59d7-08d697021da3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 07:07:46.1526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5829
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, February 14, 2019 6:18 AM
> On Thu, Jan 24, 2019 at 01:22:45PM +0000, Aisheng Dong wrote:
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
> > v1->v2:
> >  * change cpu clock to cpu cluster clock per Rob's suggestion
> > ---
> >  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/dt-bindings/clock/imx8-clock.h
> > b/include/dt-bindings/clock/imx8-clock.h
> > index b149e63..dcce744 100644
> > --- a/include/dt-bindings/clock/imx8-clock.h
> > +++ b/include/dt-bindings/clock/imx8-clock.h
> > @@ -14,10 +14,12 @@
> >  /* CPU */
> >  #define IMX_A35_CLK					1
> >  #define IMX_CPU_CLUSTER_A35_CLK				1
> > +#define IMX_CPU_CLUSTER_A53_CLK				2
> > +#define IMX_CPU_CLUSTER_A72_CLK				3
>=20
> I still don't get this. How many clock outputs does the clock controller =
have for
> CPUs? If 3, then this is correct. If it's the same clock controller bits =
across
> different SoCs, then just name it something like IMX_CPU_CLUSTER_CLK and
> reuse the same ID.
>=20

For SCU firmware based platforms like mx8qxp/qm, the clocks are provided
by SCU firmware via SCU firmware call with unique IDs. So it's safe to use =
a common
Clock IDs file.

But please ignore patch 3 and 4 first because we still met a few limitation=
s with
current approach due to the device availability may vary a bit across CPUs =
and
Subsystems.

We formerly planned to add all new IDs for each SS and dynamically check av=
ailability
in driver. That can be done but that may involve a lot effort and may resul=
t in more
changes In driver. Also hard to upstream device tree code due to dependency=
 on Clock IDs.

To relief this situation, we want to move the clock definition into device =
tree which
can fully decouple the dependency of Clock ID definition from device tree.
And no frequent changes required in clock driver.

I will send a patch set to do it later.

Regards
Dong Aisheng

> >  /* LSIO SS */
> > -#define IMX_LSIO_MEM_CLK				2
> > -#define IMX_LSIO_BUS_CLK				3
> > +#define IMX_LSIO_MEM_CLK				6
> > +#define IMX_LSIO_BUS_CLK				7
>=20
> Changing numbering is not good, but I guess it's early for imx8.
>=20
> >  #define IMX_LSIO_PWM0_CLK				10
> >  #define IMX_LSIO_PWM1_CLK				11
> >  #define IMX_LSIO_PWM2_CLK				12
> > --
> > 2.7.4
> >
