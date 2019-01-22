Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21643C282C3
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 12:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEA7820879
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 12:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QWaHl8OJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfAVM6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 07:58:42 -0500
Received: from mail-eopbgr00085.outbound.protection.outlook.com ([40.107.0.85]:25504
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728205AbfAVM6m (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jan 2019 07:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYDtCDhhzS+K2yDQEaRzfyYL0h25XSOndp7cVR2FTdQ=;
 b=QWaHl8OJmD3Rb8uj6arOklj5J8n9jf4eFgnENHsvRlkcyzCljOlPUboqE3hPWmdpazi8Dow41UoY5IGSl1sJjlLXzv2kGFprm+P9fAJdz2KsH2d7qxSuSIE553bE7qbcETqJxA1VjA7aZCiUAp9FGRu4ZkkTYyczmJY/9AEWeVU=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB6002.eurprd04.prod.outlook.com (20.178.114.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Tue, 22 Jan 2019 12:58:39 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Tue, 22 Jan 2019
 12:58:39 +0000
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
Subject: RE: [PATCH RESEND v1 2/4] dt-bindings: fsl: scu: add imx8qm scu clock
 support
Thread-Topic: [PATCH RESEND v1 2/4] dt-bindings: fsl: scu: add imx8qm scu
 clock support
Thread-Index: AQHUqaSfloWwjzPfcU69BMY7ob8z+KW6bngAgADhf1A=
Date:   Tue, 22 Jan 2019 12:58:38 +0000
Message-ID: <AM0PR04MB421124D0E6031D97E6693E9680980@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-3-git-send-email-aisheng.dong@nxp.com>
 <20190121232730.GA22676@bogus>
In-Reply-To: <20190121232730.GA22676@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB6002;6:JqzWUi4TjF4JllNgK+bRKz8TJw3OUriq6kWmI8/ExOw6zfO6DtgPjOu/eIGqntbLK1pKmExxogQLiLI1XwDn4/JhiDYPGJ5iMTrGDRl1v5P5kY5+uHc3Yxmd/2tGjbnVrOqW19PY4xe8s9dHh3FAK3qpdDszK03VV440e5FkGE9vaO1QzxY/rkLbrwglK1UWLqmySnUKtm1MAH4wLdgBkpWV853u/fAHCijXZsxPXYGpkYGBHf+qRfuv0ElmcXLWtTFFxS43i2YOHwA3zKMnLBMLDWI76y8quKTnPimOaLbi6AALhipMQgHV9+Nzt1Rdsqi0i2doRgm0THxBHGUHw9lQx6O6esUiG1hU3i3JZs2wJ6wd2nz9YT+tM95JF2iVPpdFjIaClt6pvtFq67TRde1O7RNweOoRwmEhJoUYAmx1F+M0f/NaBaHFciL/C+HvPNruxE09sEEtC65lJ+IeTQ==;5:T9pX/Fot13J9IoY8jol36Cm/09cIdGOWAuyE+yOiV2OM+KGh7mCYaTqowydRxJP5uCka1mCbGenucH9cnvqhmNGIBoVFdKCbp84MVmGv7XvQp5lrjWfnkepWqyGgboGiex1fYc+UdxAL1eON+GRsNBIqNHQdK6Tg2iTjpPXcrDmdwCUtKSbvOWtxB25k99Exfh3oUDlCZ5CcASCm2CBU+g==;7:RVht28o6jQHvrVu7nzipW2gKy06VQaBM1/N9oSyIjnHJnMc1Jdf6ZNmjhhfh/yzD9I8wjNKBzMkYNb35Pna1ufcUJjw/zqSoh3GjBOYiOpAvua7OFgGSSjBPICzdzzgnsrerDccMvwhr7EBoSxD8fQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 1c58ba38-7ef5-4562-b25e-08d680695416
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB6002;
x-ms-traffictypediagnostic: AM0PR04MB6002:
x-microsoft-antispam-prvs: <AM0PR04MB6002E8A893F654A56ACD328A80980@AM0PR04MB6002.eurprd04.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(9686003)(97736004)(6916009)(478600001)(26005)(486006)(81166006)(81156014)(102836004)(86362001)(6506007)(316002)(54906003)(71200400001)(2906002)(71190400001)(6246003)(7696005)(99286004)(76176011)(53936002)(305945005)(186003)(14454004)(217873002)(7736002)(229853002)(446003)(11346002)(14444005)(256004)(4326008)(476003)(68736007)(6436002)(106356001)(4744005)(6116002)(8936002)(33656002)(105586002)(74316002)(44832011)(3846002)(66066001)(25786009)(8676002)(55016002)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6002;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p55AYilaI3YXWgSnmCcI7SRmueuRIoTcVpOLKi/xNsow4wdFBJ4wHWOAAvocPgHHbMUcP+GiqnQ4wtDWYvzVyGFVXpERbhKtEKLe4NARM2FeckZL2B/Eb3hdpz2wmSlOVWlPXh2jgNugL0WniLwpgD5HnipZJkH2yY/c3coTYL23YOj+FGps1aeOelR7htJ1rQu7pk4GfccpYzT28RMtgZvMkHkQ1hReTDeUD2YnJJOdjMUdpZO1tNO1eiaNx+/XgNen4rjJPQWYKnzHnSfWtUDcKSBl+eYPVft3hLpxWZk/mdHOBYwqfw94NY3E0qiUwbjoVwKsywP3Z3ctCcoz1ze8j4FzFZvg75veSrwzoSB4cLkH6KUh3xxyj71iZWwvcCy9iCJoGp+h75w3uUoizUfAFB6TjWTR+ZgiLdaXV9g=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c58ba38-7ef5-4562-b25e-08d680695416
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 12:58:38.9438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6002
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> >  Required properties:
> >  - compatible:		Should be one of:
> > -			  "fsl,imx8qxp-clock"
> > +			  "fsl,imx8qm-clock",
> > +			  "fsl,imx8qxp-clock".
>=20
> No need for the punctuation here. The whole point of one per line is to h=
ave 1
> line changes. Otherwise,
>=20

Got it, thanks.
I will update it later.

> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> >  			followed by "fsl,scu-clk"
> >  - #clock-cells:		Should be 1. Contains the Clock ID value.
> >  - clocks:		List of clock specifiers, must contain an entry for
> > --
> > 2.7.4
> >
