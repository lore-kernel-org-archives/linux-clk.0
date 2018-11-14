Return-Path: <SRS0=4aIB=NZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2F3C43441
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 10:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 765192145D
	for <linux-clk@archiver.kernel.org>; Wed, 14 Nov 2018 10:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="VvRc75kt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765192145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbeKNU4N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Nov 2018 15:56:13 -0500
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:26208
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727816AbeKNU4N (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 14 Nov 2018 15:56:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGzvgZaye50EV265mHCHUXRl6rSl2Rwz3223Cx6HC00=;
 b=VvRc75ktQ1RZe90Xw+/pcCbpshqsjiO9IStstSEcPYFZzLu15DrGC+IkGwAvmBru4ErzOBDTEVIzOYrFJJP9dDZO8eu4xxMi6IEuEXrgcIFedEUej188qKhsvvgGyILkbHLVQWuyHz9+l0nfamGWjRPtVBD/7duR2fT6Atj29mM=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB3096.jpnprd01.prod.outlook.com (52.134.254.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Wed, 14 Nov 2018 10:53:25 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::70b9:d472:b61f:6130%2]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 10:53:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Thread-Topic: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Thread-Index: AQHUdsB8A8qnyoFwi0GXtHxvfBiuE6VPIjWw
Date:   Wed, 14 Nov 2018 10:53:24 +0000
Message-ID: <OSBPR01MB22933220D185AA39621849DED8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-4-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-4-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.131]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB3096;20:i8Ve9u6GmilTt2+8jK76W+0nv0AXU2ICIPy5yHLli+TDHWFu6pAudC7BZztipHYPBePkp82856T1U6s/4VNFZKHoQzxQf+xuDgt4BkwSFPzUq0hAWrDuwKYd7Hzyql+ieaRppxNr5sTKS+t5eje1U+CdHcuRY8njNq0d+ERu3rk=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(366004)(376002)(39860400002)(199004)(189003)(256004)(486006)(7736002)(305945005)(345774005)(476003)(74316002)(99286004)(14454004)(105586002)(11346002)(446003)(316002)(33656002)(54906003)(106356001)(110136005)(186003)(478600001)(97736004)(2900100001)(6436002)(55016002)(6246003)(9686003)(53936002)(8936002)(6506007)(76176011)(81156014)(81166006)(26005)(8676002)(68736007)(229853002)(86362001)(5660300001)(107886003)(7696005)(102836004)(3846002)(6116002)(4326008)(2906002)(71200400001)(71190400001)(25786009)(66066001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3096;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 13a8c7e3-8aa7-4a14-0fbe-08d64a1f66b2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB3096;
x-ms-traffictypediagnostic: OSBPR01MB3096:
x-microsoft-antispam-prvs: <OSBPR01MB30968214828D9E66F79EBA55D8C30@OSBPR01MB3096.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231410)(944501410)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB3096;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB3096;
x-forefront-prvs: 085634EFF4
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: iJTGtV+FJsOC+COZDZJq5LpwwIFyvWa5fbhSwaJRERY6Qdjccb0bTavSCXvq/onn+frDXUw2Pqz/c9159i8b0/tJVFVzEMcpy+I0Hh7A2RHL7Q2XgRMTy4ICUUQly+ZlQR1Eevdu+5BznJNZntthwK6SuoypOYVpjs8orhv0X3hVxl30TDxyZ170tl6UGsMoGX7yB0gAPL/hrNsRKrsfXnGtzLBMeB0T/j9jYBSBu8teOZlaeyK1BJZMLuY80SLxPRh0U1czsqVeEadiM4fP4h12QyQGIJvjwaNmr3KPQNcS6vWeAQkf0ZZPfq22CuuNByyNHune9Qw3p16wkDM/N0B4Z0kCwsn0XbziRmuDrow=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a8c7e3-8aa7-4a14-0fbe-08d64a1f66b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 10:53:24.3938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3096
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Thursday, November 8, 2018 2:36 AM
>=20
> Document RZ/A2 (R7S9210) SoC bindings.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++=
----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index de7b5393c163..b545daf8ccb3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -1,10 +1,12 @@
>  * Renesas R-Car generation 3 USB 2.0 PHY
>=20
>  This file provides information on what the device node for the R-Car gen=
eration
> -3 and RZ/G2 USB 2.0 PHY contain.
> +3, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
>=20
>  Required properties:
> -- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an =
R8A774A1
> +- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R=
7S9210
> +	      SoC.
> +	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A=
1
>  	      SoC.
>  	      "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>  	      SoC.
> @@ -16,8 +18,8 @@ Required properties:
>  	      R8A77990 SoC.
>  	      "renesas,usb2-phy-r8a77995" if the device is a part of an
>  	      R8A77995 SoC.
> -	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 or RZ/G2
> -	      compatible device.
> +	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
> +	      RZ/A2 compatible device.
>=20
>  	      When compatible with the generic version, nodes must list the
>  	      SoC-specific version corresponding to the platform first
> --
> 2.16.1

As I mentioned the PATCH 2/3, we should describe a new property "renesas,us=
es_usb_x1"
as optional properties here.

Best regards,
Yoshihiro Shimoda

