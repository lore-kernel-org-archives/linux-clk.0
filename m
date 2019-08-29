Return-Path: <SRS0=zV46=WZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0066EC3A59F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Aug 2019 10:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE3B22339E
	for <linux-clk@archiver.kernel.org>; Thu, 29 Aug 2019 10:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=KoCoConnector.onmicrosoft.com header.i=@KoCoConnector.onmicrosoft.com header.b="LxwRc3V+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfH2KBv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Aug 2019 06:01:51 -0400
Received: from mail-eopbgr130041.outbound.protection.outlook.com ([40.107.13.41]:1346
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725990AbfH2KBv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 29 Aug 2019 06:01:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3GXfLbVmI8QxffjjpvywKpGEP1wZYQyg+e1p3QvU8ONuSZNLfqR+sal41UlRP6mcET28ZRUL87leegjxSP2BBkTG3wwhym9CwILWIr296sVvNjdL4RPzCa2Gjh5E5FDFriLUXUVjOdtFD/H647hU/oNuqWtySRRfrTKXwDq896SRuh4E3RnQfikeFRksz9vgsbG0hzAZkhyjaczJ4UZKUXmMF1Bxxsy0D6dV0IiaFuJil6Bl3l1CJ3ivP2WCvoz4juY6jsF/dsBz0mQbX3e5ZTiYpp6n0OAnM9MiigIRF1/maZK7IVezWESDaTImQkoy12PownxshdE7v2LJjf7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHF5o7WCLXio8EuF9KeFSuDJPE1eGkDeWnl5zHc2QQo=;
 b=m/+u+xRhhHMVxDSqiTGzG3puExKn2U8LSpwLrOndw936BIcolnDZiceacIL6AECCwKA8vPh2XR0RpF5C4fIqGFHw2tdXcJ69tt1eP75pT129L/r/46MrKLWHDQEizrS6l1SuzHtjDYmM45l5tFcYMlbPKV/eQQeiqgcyespgTQlUPyyGvGIRkoP0zcGlnJIcZ3G0AvKuHwj5BcOXoRIjLBBDpUtK4O9iv0pHOuTIVGytimw4Lz1cPS4P7iyrJNZn/p0iyZnpT64ZMSQMQktUaBtcmWu3wce/aExoSswbxvplgLmfLXN6tk1V96Sn7WApo1aiHZrfe/8V1C9ruL9dkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHF5o7WCLXio8EuF9KeFSuDJPE1eGkDeWnl5zHc2QQo=;
 b=LxwRc3V+Ch7q/J12dpzgU3p9W8hyOVeDZN6MWtFg/aHeSWRg4qtYvVi9gu4W0wJfJ2fS0hHzFmk6pbLAtE+Py1CyAMRkv/ZFXH7Z597rKuKaSdo2+1FRKoSHpP8Jd4ymYBzoJaPwDU4cHL1Nfdziu02VwnPUEftmAPpB/qRt7KI=
Received: from HE1PR0902MB2075.eurprd09.prod.outlook.com (10.170.255.17) by
 HE1PR0902MB1753.eurprd09.prod.outlook.com (10.171.97.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Thu, 29 Aug 2019 10:01:46 +0000
Received: from HE1PR0902MB2075.eurprd09.prod.outlook.com
 ([fe80::3914:9799:b8a4:e891]) by HE1PR0902MB2075.eurprd09.prod.outlook.com
 ([fe80::3914:9799:b8a4:e891%3]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 10:01:45 +0000
From:   Oliver Graute <oliver.graute@kococonnector.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Topic: [PATCH v3 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Thread-Index: AQHVXlDCj1UcA2HR9UqRNdBbxYJSJg==
Date:   Thu, 29 Aug 2019 10:01:45 +0000
Message-ID: <20190829094624.GC18928@optiplex>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-2-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1563289265-10977-2-git-send-email-aisheng.dong@nxp.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::14) To HE1PR0902MB2075.eurprd09.prod.outlook.com
 (2603:10a6:7:1e::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oliver.graute@kococonnector.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.161.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f72a3e2-98de-4798-3790-08d72c67e516
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:HE1PR0902MB1753;
x-ms-traffictypediagnostic: HE1PR0902MB1753:
x-microsoft-antispam-prvs: <HE1PR0902MB1753D3CAE60521DC2AF94438EBA20@HE1PR0902MB1753.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(136003)(346002)(376002)(366004)(39830400003)(396003)(199004)(189003)(81156014)(81166006)(6512007)(9686003)(476003)(11346002)(76176011)(386003)(6506007)(102836004)(25786009)(53936002)(6246003)(4326008)(3846002)(6116002)(486006)(256004)(14444005)(44832011)(446003)(99286004)(2906002)(6436002)(7416002)(508600001)(6916009)(8676002)(7736002)(1076003)(305945005)(33656002)(316002)(86362001)(33716001)(54906003)(66446008)(64756008)(66556008)(66476007)(66946007)(71200400001)(71190400001)(186003)(52116002)(26005)(5660300002)(6486002)(229853002)(14454004)(66066001)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0902MB1753;H:HE1PR0902MB2075.eurprd09.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: kococonnector.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2q/8hHroWZNlW3iDxxccm0y7qv6y77mQTfMkSyWqVMB/HS6oJNOgUNTUNtCp4nflNLby9fpEJC6NgJbZF3nArA1+2zUM9er3ciau1TE3kJ8dv36bNh26G1RZq1Gp/oMZMwvwcrTB59Ok8L8yGj+y5KGK+ldIIgt+ZAi8KCnQoLdh+RuiDvRUqxygYhQXxioesT+Ob+jBj84WRJpMkn84I84jX2MJ5PIW+D8c/uvgbQm4Rb5cewhwmqeFJLktKyu3G1SEDjmnVsow56Kog/QruzFPOtsWRilHw/SO13UFsmnmO5dM4k65uaR5WV1grQgMX2EbI7hFa+oi5G3ORAqm77t/tyzMxlUatCF4qXxgUS4ToBkekC/jCDp5xXS34evR60fBeU3i53sWA6zBVU9+GL4+lqkEmtpOu6hPRO8cYGE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <701C1D21AA60824F951B836EAA177A09@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f72a3e2-98de-4798-3790-08d72c67e516
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 10:01:45.4114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+xMs3mxOUeU9MOUsnjv3tZTnUl6j/h+m5bDMy7dbh8fPkFWHNLtAV/fzAYzkoePT40gUBVUf6wdPTtTpKWnE1TovBo+qEW2B0sspVR/Ncs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0902MB1753
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/07/19, Dong Aisheng wrote:
> There's a few limitations on the original one cell clock binding
> (#clock-cells =3D <1>) that we have to define some SW clock IDs for devic=
e
> tree to reference. This may cause troubles if we want to use common
> clock IDs for multi platforms support when the clock of those platforms
> are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix.
>=20
> However the device may reside in different SS across CPUs, that means the
> SS prefix may not valid anymore for a new SoC. Furthermore, the device
> availability of those clocks may also vary a bit.
>=20
> For such situation, we want to eliminate the using of SW Clock IDs and
> change to use a more close to HW one instead.
> For SCU clocks usage, only two params required: Resource id + Clock Type.
> Both parameters are platform independent. So we could use two cells bindi=
ng
> to pass those parameters,
>=20
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This Patch series (v3) is running fine for some weeks on my iMX8QM Board.

So feel free to use my Tag:

Tested-by: Oliver Graute <oliver.graute@kococonnector.com>
