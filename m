Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D0AC43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 13:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F351A22419
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 13:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="kyaYnRFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F351A22419
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732946AbeKNXGB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 18:06:01 -0500
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:35866
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732932AbeKNXGA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 18:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZKLiiYi3+Ton8LJoAymwkk11uNyxqljlahkEvogCH4=;
 b=kyaYnRFjumPdj5aEtRuz64LJ8GzQjMzzJwE8bdaHkupmuOgSZYdQsXAl3t1NutJjpQSMz/ViuGdDJcf9B8KpSXszglTr0IFSArXaOjYhfBYbp4URF3cOj1q1u+OlYZ016xL+ER0OaJsPQJA7ThNtEYstQqW7Dg0m60MYqMQQ3WE=
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com (52.134.230.20) by
 OSAPR01MB3585.jpnprd01.prod.outlook.com (20.178.101.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.25; Wed, 14 Nov 2018 13:02:43 +0000
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d]) by OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 13:02:42 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Thread-Topic: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for
 R7S9210
Thread-Index: AQHUdsB7qg8ABCzTikOe1KM5ASkq46VPIjAAgAAFLfCAABUXgIAABASA
Date:   Wed, 14 Nov 2018 13:02:42 +0000
Message-ID: <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB3585;20:VLrXvUyGvFQG0p4xem5PGqNszODj91Y5JbCgILY8OYQFjLwT2nHGI/bG4VtgI5vsg7fQ7aNimSwquUEcbhIyj1x8c7xmr+8Bmq3feHS0f00mF5TpopI5Vw8fC21yY+3O4gAzR41eHK3o66EzVX1QtygbuH6e64I3bmzFxIF7BAM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(14454004)(25786009)(106356001)(486006)(6116002)(476003)(229853002)(105586002)(86362001)(76176011)(72206003)(478600001)(6506007)(446003)(3846002)(11346002)(7696005)(2906002)(4326008)(55016002)(74316002)(93886005)(7736002)(14444005)(316002)(256004)(71190400001)(305945005)(68736007)(186003)(97736004)(102836004)(81156014)(8676002)(9686003)(53936002)(99286004)(6246003)(66066001)(2900100001)(33656002)(26005)(81166006)(71200400001)(54906003)(6436002)(5660300001)(110136005)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB3585;H:OSAPR01MB1553.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: ba6d5bf8-8240-406f-bfb6-08d64a3176d6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB3585;
x-ms-traffictypediagnostic: OSAPR01MB3585:
x-microsoft-antispam-prvs: <OSAPR01MB35857FC190A7C75EA9D6F2A38AC30@OSAPR01MB3585.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231410)(944501410)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB3585;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB3585;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: aac6Rz95Ah+mMwF/xHyHjwb+91zXbNwNU0BfXEmtBXR7D8di1czU+4kqchkzbvxqE2pMOFpR9ahQqHyEi/pp66WXj72J4+HQp0+5ePAdjxB9dwbL67kc57DkC/WibV1K2MPsb9ZBL5/3t9pOlx6HhFDy0bGfsNW2bmyvKm5SwIY+9xALpljqy/TOQ5eFZ/pyAWQAtcSWyA2VMAuY0+SJfto78aaMNf46RFpGQzd/HNQUDxxRHqftDggqT6VxPnNVxoRC3u9gxmoJ2UoWHi58/ZanO1mY3VDrm87IMhZWn48I1g7pGrcZVQzHNK/9KVtli5stgpwYjlKFTevZ213ynJqf5lQ0wuqtXinI0KlPNZU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6d5bf8-8240-406f-bfb6-08d64a3176d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 13:02:42.4640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3585
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shimoda-san,

> From: Yoshihiro Shimoda
> Sent: Wednesday, November 14, 2018 7:24 AM
> > > >  config PHY_RCAR_GEN3_USB2
> > > >  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
> > > >  	depends on ARCH_RENESAS
> > > > -	depends on EXTCON
> > > > +	depends on EXTCON || ARCH_R7S9210
> > >
> > > Does this mean that you don't want to use EXTCON if ARCH_R7S9210=3Dy?
> >
> > EXTCON is not required for RZ/A2. So, I want to be able to leave EXTCON
> > un-selected (save flash space).
>=20
> I got it.
> I added the depend on EXTCON, but R-Car Gen3 environment can build
> EXTCON=3Dn.
> However, I realized that build error happens if EXTCON=3Dm.
> So, I think we have to revise this line as following at first:
>=20
>  "depends on EXTCON || !EXTCON # if EXTCON=3Dm, this cannot be built-in"
> like drivers/phy/qualcomm/Kconfig.

OK. I will change it.

   (should this be a separate patch?)


> > Without this code, RZ/A2 will not work.
>=20
> I'd like to clarify this. Does this mean RZ/A2 will not work as host mode=
?

Correct. If I remove 'else' code, RZ/A2 host mode does not work.
I just tested again now.

Host works:
	else
		/* No otg, so default to host mode */
		writel(0x00000000, usb2_base + USB2_COMMCTRL);

Host does NOT work:
	//else
	//	/* No otg, so default to host mode */
	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);


> (In other words, if we use the port as peripheral with the reset value
> 0x80000000, does it work?)

We have not been able to get USB peripheral working on RZ/A2 yet.
For peripheral, RZ/A2 has HS-USB.
After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D "0110"=
).
It should go to Configured state (DVSQ =3D "0011")


According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000 when
using HS-USB.

There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)

Chris

