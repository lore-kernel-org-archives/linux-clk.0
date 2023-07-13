Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6844C001B0
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 21:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjGMV7S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 17:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjGMV7S (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 17:59:18 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::61f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E902C2694
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 14:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3PqyvlUg0lrYOX1b1ZPma7LafkyV3x9uwxiFdry6buR02+3Guhmn37VKEK4Aonztu+BT9NQGt9CFeqVsr2vBIoh2h3v1y9IqmF10SvpIsJqYAjTNiBzuoAyqx/Ev9PYjPQ2xGh2C2zWwlmEK2UceJYFtv5pk4MaO0TxtIh/5/MmQaprfzYir0LRnK3OAO/Rv9IbfqLGBYgStdUNLa/wmlOq2aCbtbffovkPZmd0v4ypeG/xOeuZ0/vUANL5kig1Y1+ccJjTuY0r87T3C7aSxwC2es1lLjUIuxo8uM+Vc+DUykd5XmKEO4mPhoopKqOPRiSSIxRgypsmJULpf8fV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwXgwp02ZsNhRB/qHDqxIKNJ+sLTsSYVwsnsGWOULHA=;
 b=hCJNc71UH4vBqyeM2CPzIVhocB2XRY8He4ZQOwiIsy25dzt/zpYs+QY+x3dnZ3mEVWhROFr3srXIu/tJz/rUYACaMy/AHUdvy6scD2V/XHtS0mfikvj2xg6V7lxBK/XaB18PpBTynDWYW7KX/jTo1laUGqYHDQiVgVEJ57llFZPjTNCpXxgx2cPvu0TJce44dZNvFzelWcsBsne4DuOpWrxX75ijUDR5Fqv0fONs+Ve7RNQcVE1lUN6M8n/GTFSWZuN97UrFS6E8pajMNxCF642OscpD+h8nXeO7DMvYFZhb7Mr0ZEOm6ImXdtEBXNrEnPptLr/GVtGtksnba4bB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwXgwp02ZsNhRB/qHDqxIKNJ+sLTsSYVwsnsGWOULHA=;
 b=ZvCZbbxMh3f/V4pykG1F8r5PABZWDbzbYg63QEvzNetykshNpikkbF/Dua7pzusHGpWqu8jIjHQXrN7uohUTgqZIH3bhLzRxm6gBbCNJrv/DS7ALqueW/f2gVJHcYoospRbg8+GYj1eSrlgafTpsMiJ68+oYEBlqDvmgoJGNIFE=
Received: from DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17)
 by AM7PR04MB6776.eurprd04.prod.outlook.com (2603:10a6:20b:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 21:59:12 +0000
Received: from DB9PR04MB8282.eurprd04.prod.outlook.com
 ([fe80::a5fa:3691:ebc6:b3f8]) by DB9PR04MB8282.eurprd04.prod.outlook.com
 ([fe80::a5fa:3691:ebc6:b3f8%4]) with mapi id 15.20.6588.025; Thu, 13 Jul 2023
 21:59:11 +0000
From:   Adrian Alonso <adrian.alonso@nxp.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "bli@bang-olufsen.dk" <bli@bang-olufsen.dk>
CC:     Abel Vesa <abelvesa@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: bounds of pdiv in clk-pll14xx.c
Thread-Topic: [EXT] Re: bounds of pdiv in clk-pll14xx.c
Thread-Index: AQHZtbMcOa4zc5uDz02Tl9NiwtWwha+4HZxQ
Date:   Thu, 13 Jul 2023 21:59:11 +0000
Message-ID: <DB9PR04MB828202F64FB4F4724B23564FFC37A@DB9PR04MB8282.eurprd04.prod.outlook.com>
References: <ca6b0f0b-3f0d-8e4d-c857-8c6515250782@prevas.dk>
 <20230713175435.z66efhro7mvnk5gg@pengutronix.de>
In-Reply-To: <20230713175435.z66efhro7mvnk5gg@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8282:EE_|AM7PR04MB6776:EE_
x-ms-office365-filtering-correlation-id: 0e8e50e0-8f5f-4ede-e9c9-08db83ec6427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Gf1XADZ1GfkWIZLu0TqtePmEm57aTb/tca/i4n8j/ubby7YBrgpsIArupp0Rlw+8dTPfyh43+JGuCfNWoFelZfbeWK0Cz0Y7Oq2IqUFEiydp/WH6MdRFAFc8Jg+OEPML4EG3xGYTh1WQJQ/i+m+s+TkqOaVDG2C6r9tGEWH8vgEnLG71j7RY5nXY0O7yQNgaFBnyBDIfyS+oma+wwrLZtPP54glSLPGeMLPD7H6SA6Md2qKHYkMFpg89DEUAlcuhS4fUSKSpY/gf2L7ICzvG5uojXJaYXA6JhUzVYd0WXeBct3BeN39ndttyX5eYsC5NIyDZA5tvDYcpuhpRzlfyhhZ43GRXtut0o/uDBvS0JbWx8MiEbQ3UsvbYkztqtCvQNbnTBlFhwnt7y+GgIpnY25zoKybkVKaPaicgkRPU/PXsvqZUj4CIJ0qIzonZQuX+kU56d72C1VJvfwggZLF84xK8Zjo4SZiRvJr7vaH1n/CefD0EIhpENKu4uSiMyUHEhuiqNhrnTOHLAFW12pYCqhd89p7JBquxW6c7eZNo9l4kvMlvbxwRFqYTMzQ5eeI6q+Xlw4a8xtgfgjZ8hDRSq0CNrTq5gIyXXB488G38MDuO/T6YNI5XnmzR9FbPUIa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8282.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(38070700005)(76116006)(66946007)(66446008)(64756008)(4326008)(66476007)(66556008)(55016003)(478600001)(110136005)(54906003)(186003)(26005)(86362001)(53546011)(6506007)(9686003)(7696005)(33656002)(71200400001)(83380400001)(122000001)(38100700002)(41300700001)(8676002)(8936002)(44832011)(52536014)(316002)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nHqnDprWaKP5AMHU3TTeIlGXxNdG38eMYgD+nlxnsgdc/1nVhzMIfFdX7cZ8?=
 =?us-ascii?Q?hfGzaahjgt+/1bPaT3ciR/6A9zAQ960dvEwgSS3MnkH0uqDm1fdIKbI+Xa7M?=
 =?us-ascii?Q?j0smKbJYMloxK4BmJjrHPSc1tLMMZR0n/SYZohscxJPXY7N0uvWh8Cb93Dn5?=
 =?us-ascii?Q?mU7baAY7uwjsrtIUox/e5yJ7Qr0NOIJTLT0JdBhY2E2QvVBknR/w8/HMYqlP?=
 =?us-ascii?Q?PO6MvVnrXUuDvQ7wfrqZ6foLLEx1EOTJ0VMj6PcQoDMByJr6K7qF6e3b1RYE?=
 =?us-ascii?Q?JhpEgYBZs4SZuzHRqBBrzJZz0h+eCb1UMw8/HI7Pe0D2tRwrnpvaTqBmDWCp?=
 =?us-ascii?Q?/lm5I/7UJnwurclfRjGgk31XZQL7sE3fCn9sHI1LkTUmS1dMHLyxBBQxkXjf?=
 =?us-ascii?Q?YloXg05B1gYbjBixHXHU3GMELTA/usGyc0UUw2gDNQmBejtiNUgTViYyB5Ov?=
 =?us-ascii?Q?fy0Dfa18SK9RCUPyBZzNGTsM1lKmkyJOZUlhd77ohEqCzw98Ue429TMO48Or?=
 =?us-ascii?Q?aBeQ7Unp8E2mav0tMFblTJlvg37ztiZVyGOhP58GxPnxLYWW9J8bqbUMbUBf?=
 =?us-ascii?Q?Wke071E5RJBwYjxCX4dU0hcGZKtwOGe6IJ42gJNsR3ToFWH5BgU9FRx4EzHc?=
 =?us-ascii?Q?neNb2o69yWYKUBNZXdSZvwI7sTonTitu9yHQyGYhuvBQ93ypOSGTsxjOYbgI?=
 =?us-ascii?Q?27On2/OGeTknUyjbyN+t3SChJoyj32skv+8/96hcebk0pGej9qDUlfiMfraz?=
 =?us-ascii?Q?XTSkmPcYLiBVaS4Xt5REF2t/tfxTddm+tvxzE0nNDozZ869QHZgx/aOiisjn?=
 =?us-ascii?Q?hpup4/XAN5NYtGyeY5Nx9RKFE96mc3As1a48ts7aftLSwlRdcQjWRQZCDvO/?=
 =?us-ascii?Q?rEMfxCXUuXd4o4obKgug94YiUin4sL/4mHV/21JAyaccS82WvjjWMlwayV2N?=
 =?us-ascii?Q?q3sE11AOhqK3lnzgcuQ+Qo4gJcdvwNcQwj9gYiBwPNpYbpvWeD4oULz72x5t?=
 =?us-ascii?Q?GQGKbwFjQENnRv6ssmngEOx1eeHKjhqAlo5U1OeZTzLaJrYbi6Rk0WEjHJGc?=
 =?us-ascii?Q?jB55NdVCEPOa/B7ZmTWbVLvbUWWiSW+FLgf9XhS5tNmtkOjuiZZgY3vu6ppA?=
 =?us-ascii?Q?8GTpGgD3yWfglbbJhpAzC5XXnOBGABmVD9pFRQtl0ZnUtgaiKUQ+6kjU/QVs?=
 =?us-ascii?Q?7iaQbgNg1HnrWaD3CFybE7sL4GfgUXYWcYoKcf7ciVvyFw7KK9XMt86toCaU?=
 =?us-ascii?Q?omA0UrMviFqxyHV5/Fxz5Sxgn9ips4PIVTIX/rmnSpqvi9fiKFNlQ1H+J9iS?=
 =?us-ascii?Q?jXeLxSjlMKc3gq5v5wKPG8J7ZJNEgbJszLtAOTBsr+nF+mHsKwG/8gR2SLLC?=
 =?us-ascii?Q?WoxAMhTHE/Mp54atJY+J3V8hbbonLvJcfG44nk99PtEbEjLuovIJ80d8CA8f?=
 =?us-ascii?Q?aweaC16SPYVP4rvHzDkgoxHGNkNZuxuY53de/yIVe2d+EgS0zcp6nF2dxrkI?=
 =?us-ascii?Q?S5XIN+kIpst1qEIDNpM/8v9ZQEBUQKobVPFpSKLtC7CDK41kuCI7Ho2c0YiD?=
 =?us-ascii?Q?fszYY2tMWpgXjWeoJjO3q5ZyYxPtBSHYwL+FGIn/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8282.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8e50e0-8f5f-4ede-e9c9-08db83ec6427
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 21:59:11.8321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdVJqhWCOGdntuIMfqeum/TRIs3OzaSZ1iuyj3jql8GRdfCVOpnKHI7/t+g1Sn7GHXwt/Buw6Sq7SwjNR1HzuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6776
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

+Bligaard

FRef for Audio/Video PLLs are usually 24Mhz/25Mhz;

But most common use case for dynamic reconf is for Audio PLL
Where prate =3D 2 4Mhz (FRef) could derive 44.1khz/44khz sample rates

b) 1 <=3D p <=3D 63; (1 <=3D p <=3D 4 if prate =3D 24MHz);

Found out this old commit log:

clk: imx: dynamic audio pll rate settings

Add support for dynamic audio pll rate settings
Calculate optimal dividers close to required user freq request
Fractional PLL constrains:
 a). 6MHz <=3D Fref <=3D 25MHz;
 b). 1 <=3D p <=3D 63; if Fref is external cristal Fref =3D 24Mhz
     1 <=3D p <=3D 4;
 c). 64 <=3D m <=3D 1023;
 d). 0 <=3D s <=3D 6;
 e). -32768 <=3D k <=3D 32767;

Usage example:
------------------------------------------------------------
cat /sys/devices/platform/30030000.sai/pll1
722534400
echo 589824000 > /sys/devices/platform/30030000.sai/pll1
------------------------------------------------------------

clk_int_pll1443x_recalc_rate: 589823982:393:1:4:14155
mdiv =3D 393; pdiv =3D 1; sdiv =3D 4; kdiv =3D 14155;
Audio PLL rate =3D 589823982 Hz

cat /sys/kernel/debug/clk/clk_summary
------------------------------------------------------------
 audio_pll2_ref_sel  0            0    24000000 0 0
  audio_pll2         0            0   589823982 0 0
   audio_pll2_bypass 0            0   589823982 0 0
    audio_pll2_out   0            0   589823982 0 0

Regards
Adrian

-----Original Message-----
From: Marco Felsch <m.felsch@pengutronix.de>=20
Sent: Thursday, July 13, 2023 12:55 PM
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>; Adrian Alonso <adrian.al=
onso@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;=
 linux-clk <linux-clk@vger.kernel.org>; Pengutronix Kernel Team <kernel@pen=
gutronix.de>; dl-linux-imx <linux-imx@nxp.com>
Subject: [EXT] Re: bounds of pdiv in clk-pll14xx.c

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


Hi,

+To Adrian since Sascha mentioned him in his commit.

On 23-06-21, Rasmus Villemoes wrote:
> I'm a bit confused by the range of pdiv used in=20
> imx_pll14xx_calc_settings(), introduced in commit b09c68dc57c9 (clk:
> imx: pll14xx: Support dynamic rates).
>
> We have this comment
>
>         /*
>          * Fractional PLL constrains:
>          *
>          * a) 6MHz <=3D prate <=3D 25MHz
>          * b) 1 <=3D p <=3D 63 (1 <=3D p <=3D 4 prate =3D 24MHz)
>          * c) 64 <=3D m <=3D 1023
>          * d) 0 <=3D s <=3D 6
>          * e) -32768 <=3D k <=3D 32767
>
> and those values match what I can find in the reference manuals for=20
> the imx8mm, imx8mn and imx8mp SOCs. But the code then only loops over=20
> 1 <=3D p <=3D 7. I also don't really understand what the parenthesis
>
>    (1 <=3D p <=3D 4 prate =3D 24MHz)
>
> is supposed to mean. Is p restricted to <=3D 4 when the parent rate is=20
> 24MHz? That doesn't seem to make any sense, and in any case the loop=20
> does go up to p=3D=3D7.

I have the exact same question since the '1 <=3D 7' restriction stops me fr=
om getting the most precise video-pll frequency. If I set the restiction ac=
cording the reference manual I get an exact match.

With the following diff I be able to get an exact match:

8<---------------------------------------------------------------
diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c =
index 7150c59bbfc95..d1d0d25fea2ce 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -186,7 +186,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14x=
x *pll, unsigned long rat
        }

        /* Finally calculate best values */
-       for (pdiv =3D 1; pdiv <=3D 7; pdiv++) {
+       for (pdiv =3D 1; pdiv <=3D 63; pdiv++) {
                for (sdiv =3D 0; sdiv <=3D 6; sdiv++) {
                        /* calc mdiv =3D round(rate * pdiv * 2^sdiv) / prat=
e) */
                        mdiv =3D DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), p=
rate);
8<---------------------------------------------------------------

Regards,
  Marco
