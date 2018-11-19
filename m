Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3ADC43441
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 08:57:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B398D20823
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 08:57:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Mf26HcsH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B398D20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726914AbeKSTUz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Nov 2018 14:20:55 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:9394
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726289AbeKSTUy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Nov 2018 14:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKhc06QfRqCbXIzHAaD7KIqBoRt94NUpUAyNCTjIQoo=;
 b=Mf26HcsHRnGBAEPWXmq+9nHZ/7DguYlBDi+P+0e/ekYPV7kvUa4nrNZEVdZ+lbSXikn8lF0MamdeZQ8mUwnQfOjtq4ieFcBe736094nmzQO5fMdfGSk2h4bZNTbCmUK1GgIN00J8DWaXv8p4dr2PuMJp8qQM9Khh4R0GOMDK0oE=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB2328.jpnprd01.prod.outlook.com (52.134.252.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Mon, 19 Nov 2018 08:57:48 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130%2]) with mapi id 15.20.1294.048; Mon, 19 Nov 2018
 08:57:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
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
Thread-Index: AQHUdsB7Gubstzkg+U+v4TwD1Y24U6VPFiwggAATsACAAA2fQIAAD6sAgAFK9ACAAD9hAIAGBD7Q
Date:   Mon, 19 Nov 2018 08:57:45 +0000
Message-ID: <OSBPR01MB2293302E77DDCC330ABE3927D8D80@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2328;20:tAd00poQm2LD/pjUAgZrjhpJ6GECJzrxztJmMmndoK4p+6PE8oPQ3qVMJ48ak4xNGVTjz1R3Vw8rOQ7GbWHvixI8pdwwMiGaRreEdcWEQOtLK0BGKC4Vo0eYRQCmo87AcpMhEEdMxZ6flxhd3mKQZg0FwWqVuAXbTCeo8ynHqnI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(366004)(396003)(346002)(136003)(376002)(39860400002)(54094003)(199004)(189003)(71200400001)(71190400001)(106356001)(256004)(110136005)(14444005)(105586002)(11346002)(486006)(476003)(6436002)(2900100001)(81156014)(9686003)(86362001)(99286004)(6306002)(97736004)(316002)(93886005)(446003)(55016002)(54906003)(186003)(53936002)(6246003)(102836004)(66066001)(25786009)(33656002)(966005)(5660300001)(14454004)(7696005)(478600001)(26005)(6116002)(2906002)(4326008)(8936002)(7736002)(229853002)(68736007)(3846002)(305945005)(8676002)(74316002)(6506007)(81166006)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2328;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 32f69778-3e33-4c0c-6e83-08d64dfd12ec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2328;
x-ms-traffictypediagnostic: OSBPR01MB2328:
x-microsoft-antispam-prvs: <OSBPR01MB23284D118305538F8BC60CEDD8D80@OSBPR01MB2328.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB2328;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB2328;
x-forefront-prvs: 08617F610C
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: kFrevsL35fT5JuKkF+Q6TUvpcoKQD7nprxEpJ+WyDEBH48bJ4i5azoTnTOwvuvTgykvM8ZasmDGciC4vVNaJu9CfUEhEkvsShdJQatjSDN5vWKcnDckR6uQW2I6t6WbNJ1LUidcoW4upPWQk2XDRXTAG/DEqZ9IMua6yPvrfK5nhJSPsgoJ2Kfm3c2lsrLyV7j724mwEmAQYXvxXtFS9hxqswpBY6nrhNyw66OjGBAeQfA9X3zjGSQ4gJZrpwtvvtckvSqhaBk8fOC3mQhd/jhviHOfxhtyoFLfr3vHmH12e6SN1JWPhX4Eh1XxXfMsdDoWAgeYFPrn1b5NbkIaKLOmEfmdQlQEFsIS/1P3L0O8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f69778-3e33-4c0c-6e83-08d64dfd12ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2018 08:57:45.7432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2328
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris-san,

> From: Chris Brandt, Sent: Thursday, November 15, 2018 9:34 PM
>=20
> Hi Shimoda=1B$B$5$s=1B(B
>=20
> > From: Yoshihiro Shimoda
> > Sent: Thursday, November 15, 2018 4:20 AM
>=20
> > > Host does NOT work:
> > > 	//else
> > > 	//	/* No otg, so default to host mode */
> > > 	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);
> >
> > I got it. However, I have a concern how to set the mode to peripheral o=
n
> > RZ/A2
> > if we applied this code. If someone would like to use the USB as
> > peripheral
> > on his board, this code is not suitable.
>=20
> But USB peripheral is a different driver. So, this code will not run. So
> USB2_COMMCTRL will keep the default value 0x80000000.
>=20
> Correct?

Ah, this is you're correct. R-Car Gen3 code (drivers/usb/renesas_usbhs/rcar=
3.c) doesn't
have phy control for now.

> > So, I have an idea to set the default mode by using "dr_mode" property,
> > instead of hardcoded. Since the driver already has such a function,
> > we can reuse rcar_gen3_device_recognition() to set the default value.
> > To achieve that, we need to modify the following though.
> >  - Don't enable "is_otg_channel".
> >  - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
> >    because RZ/A2 doesn't have it.
> >  - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 registe=
r
> >    because RZ/A2 doesn't seem to need the setting on host mode.
> >
> > What do you think?
>=20
> If a board is designed for USB peripheral, why would they enable a EHCI
> host driver for the same USB channel?
> I am confused.

I meant that USB peripheral of RZ/A2 need the phy driver, not a EHCI host d=
river.
And I read Figure 32.1 of the RZ/A2 documentation and I wonder if we need t=
o release
USBCTR.PLL_RST even if we use USB peripheral mode.

# Since the documentations doesn't mention the PHY area exactly, it's confu=
sable for us though.
# But, the phy driver assumed the driver handled "AHB Bridge", "Core" and "=
UCOM" registers.

> > > > (In other words, if we use the port as peripheral with the reset va=
lue
> > > > 0x80000000, does it work?)
> > >
> > > We have not been able to get USB peripheral working on RZ/A2 yet.
> > > For peripheral, RZ/A2 has HS-USB.
> > > After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D
> > "0110").
> > > It should go to Configured state (DVSQ =3D "0011")
> >
> > I guess we need to modify ./drivers/usb/renesas_usbhs/rza.c for RZ/A2
> > because RZ/A2's HS-USB has SYSCFG.CNEN, but doesn't have SYSCFG.UPLLE?
>=20
> Today for RZ/A1, we tell people to use USB0 first in their board design,
> then use USB1 if they need a second USB channel. USB pins are dedicated
> (no other function) so there should be no design conflicts.
>=20
> If only USB1 is used, USB0 must also be enabled in DT as a dummy driver
> (so SYSCFG.UPLLE can get set for USB1).

Oh, I heard RZ/G1C also has such a hardware register [1].

[1] https://patchwork.kernel.org/patch/10655855/
RZ/G1C channel 0 only has UGCTRL register, but need to set for channel 1.

Best regards,
Yoshihiro Shimoda

> > > According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000
> > when
> > > using HS-USB.
> > >
> > > There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)
> >
> > I got it. So, I guess someone wants to use 1 host and 1 peripheral :)
>=20
> Yes.
>=20
> Chris

