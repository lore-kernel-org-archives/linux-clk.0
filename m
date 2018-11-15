Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A546FC43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 12:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63F142080D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 12:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="RshCyVGw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63F142080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbeKOWlw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 17:41:52 -0500
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:32326
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728950AbeKOWlv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 15 Nov 2018 17:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8BlfstXd5gcrQqA0RshygJkSMJYbztdidbjPu8juUs=;
 b=RshCyVGw3MXSo2/YKUm4JmkSw5QWtd4I4dc1kTkBgWyTMtWjWKQmNVIi+YYIU1nyaD3O7n4Hb6zWv4Z/7EuUWSvzMRpsAUe+A391SJ4Yta4GcgA300azjo2IWNKG9jFReOLHx2lViAsYzeTbY3Yrvh1TRX9s7VyUygZYjDt0B/Y=
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com (52.134.230.20) by
 OSAPR01MB4115.jpnprd01.prod.outlook.com (20.178.128.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.20; Thu, 15 Nov 2018 12:34:05 +0000
Received: from OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d]) by OSAPR01MB1553.jpnprd01.prod.outlook.com
 ([fe80::487c:e15e:88df:f04d%2]) with mapi id 15.20.1294.045; Thu, 15 Nov 2018
 12:34:04 +0000
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
Thread-Index: AQHUdsB7qg8ABCzTikOe1KM5ASkq46VPIjAAgAAFLfCAABUXgIAABASAgAFayYCAADKnsA==
Date:   Thu, 15 Nov 2018 12:34:04 +0000
Message-ID: <OSAPR01MB155323BF2746B075DA3E8F7D8ADC0@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-3-chris.brandt@renesas.com>
 <OSBPR01MB2293D01ACA9E7294DD803938D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15539BF29A15A03FFC890B848AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293489B7D5C98CB73CFE101D8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <OSAPR01MB15533265A0BEE499122EC95A8AC30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
 <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293DBE98E32D8621E5A6551D8DC0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSAPR01MB4115;20:M3ogt+bGYLDCJgCp4kGO/x8sHzsvmvUwhlHwPt+6CUw5DH1ikrnxZpPsItSyzGn51uUveHIG3felOOKTnONmGdyyD7Zh66R5C9XQr9B7HdJ4tcvtPyBNqZABZsR2UKQaZzemBEMU1O5/osEyb9hX69H5kqrxduGKcH55TYcLdXs=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(136003)(396003)(376002)(366004)(39860400002)(346002)(199004)(189003)(81156014)(68736007)(11346002)(4326008)(7696005)(186003)(8676002)(81166006)(102836004)(76176011)(71190400001)(71200400001)(229853002)(106356001)(6246003)(316002)(486006)(97736004)(478600001)(476003)(105586002)(53936002)(9686003)(110136005)(54906003)(25786009)(446003)(3846002)(66066001)(6436002)(72206003)(2906002)(74316002)(6506007)(305945005)(7736002)(93886005)(55016002)(8936002)(26005)(6116002)(14454004)(99286004)(5660300001)(86362001)(256004)(2900100001)(33656002)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB4115;H:OSAPR01MB1553.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: a6961006-c94f-44dd-f2b5-08d64af6a121
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:OSAPR01MB4115;
x-ms-traffictypediagnostic: OSAPR01MB4115:
x-microsoft-antispam-prvs: <OSAPR01MB41152E761BB1809103E385ED8ADC0@OSAPR01MB4115.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231415)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:OSAPR01MB4115;BCL:0;PCL:0;RULEID:;SRVR:OSAPR01MB4115;
x-forefront-prvs: 08572BD77F
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 34bd+Qx26xSyPhkKBLCC4teVc0QPrA+odTj0Cm58f8CGpfMFpLiPfK0fZNxdERMLtItVCwJzr+bSk3y0GDpB98mNsxgzayL9e/eR4uEIBnwc07PDfXaZw+nzNRUG18p4R9OJgn9b4PVIQ5gux1pYxgxiQLDWD5jJ9Qj6+QjNKvdqqYPZpeHwjzDOo1tWkX+4h3YcqN5AKYL2W3MwZqHxvACuwTjeZovB/kIoXoFBHmRjtQcj284j+CTbxwpl6M0QvcpSO3c8xc0osupYxW1K2zFYDsv6pj+kQE++bu3W49HpoY4FZGy1lgk6wdIMg107twL0JibF6Nfel4vpM9btLGKrdbMN0lxrZG/+uoHSQ4M=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6961006-c94f-44dd-f2b5-08d64af6a121
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2018 12:34:04.0447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4115
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shimoda=1B$B$5$s=1B(B

> From: Yoshihiro Shimoda
> Sent: Thursday, November 15, 2018 4:20 AM

> > Host does NOT work:
> > 	//else
> > 	//	/* No otg, so default to host mode */
> > 	//	writel(0x00000000, usb2_base + USB2_COMMCTRL);
>=20
> I got it. However, I have a concern how to set the mode to peripheral on
> RZ/A2
> if we applied this code. If someone would like to use the USB as
> peripheral
> on his board, this code is not suitable.

But USB peripheral is a different driver. So, this code will not run. So
USB2_COMMCTRL will keep the default value 0x80000000.

Correct?

> So, I have an idea to set the default mode by using "dr_mode" property,
> instead of hardcoded. Since the driver already has such a function,
> we can reuse rcar_gen3_device_recognition() to set the default value.
> To achieve that, we need to modify the following though.
>  - Don't enable "is_otg_channel".
>  - Don't call rcar_gen3_enable_vbus_ctrl() to avoid ADPCTRL register
>    because RZ/A2 doesn't have it.
>  - Don't need to call rcar_gen3_set_linectrl to avoid LINECTRL1 register
>    because RZ/A2 doesn't seem to need the setting on host mode.
>=20
> What do you think?

If a board is designed for USB peripheral, why would they enable a EHCI=20
host driver for the same USB channel?
I am confused.

> > > (In other words, if we use the port as peripheral with the reset valu=
e
> > > 0x80000000, does it work?)
> >
> > We have not been able to get USB peripheral working on RZ/A2 yet.
> > For peripheral, RZ/A2 has HS-USB.
> > After plugging into the PC, HS-USB goes to Suspended state (DVSQ =3D
> "0110").
> > It should go to Configured state (DVSQ =3D "0011")
>=20
> I guess we need to modify ./drivers/usb/renesas_usbhs/rza.c for RZ/A2
> because RZ/A2's HS-USB has SYSCFG.CNEN, but doesn't have SYSCFG.UPLLE?

Today for RZ/A1, we tell people to use USB0 first in their board design,
then use USB1 if they need a second USB channel. USB pins are dedicated
(no other function) so there should be no design conflicts.

If only USB1 is used, USB0 must also be enabled in DT as a dummy driver=20
(so SYSCFG.UPLLE can get set for USB1).


> > According to the RZ/A2 Hardware Manual, COMMCTRL should be 0x80000000
> when
> > using HS-USB.
> >
> > There are 2 channels of USB on RZ/A2 (host x 2, HS_USB x 2)
>=20
> I got it. So, I guess someone wants to use 1 host and 1 peripheral :)

Yes.

Chris

