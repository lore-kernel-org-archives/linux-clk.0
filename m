Return-Path: <SRS0=/2Yr=RE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0339CC4360F
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 12:06:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC8D520851
	for <linux-clk@archiver.kernel.org>; Fri,  1 Mar 2019 12:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="JXtLWSby"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388087AbfCAMGc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Mar 2019 07:06:32 -0500
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:40274
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732687AbfCAMGc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 1 Mar 2019 07:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1wICsfZvkqL3eB+Pikqhufu684XxFcmnCAURWGBxDg=;
 b=JXtLWSby/iGVmlbXBfAkKxGQl+4cMbv/2FoAGoebcVtwgG+F7+OvxAZzyq4pfPFv5hY+siSSw+K7hNtHKK7DsFKd+IOusHN4NkEBlV2j3qtj3pFG+6b51YcK69ZjhygZUKa6qRCzqq3Ye4PJkWI0c9HFSQEtKxIBlm/q2sPIPLQ=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TYXPR01MB1535.jpnprd01.prod.outlook.com (52.133.166.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.20; Fri, 1 Mar 2019 12:06:26 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::88d2:545c:9212:c8cf]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::88d2:545c:9212:c8cf%5]) with mapi id 15.20.1665.015; Fri, 1 Mar 2019
 12:06:26 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Marc Kleine-Budde <mkl@pengutronix.de>
CC:     "David S. Miller" <davem@davemloft.net>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 3/3] dt-bindings: can: rcar_canfd: Document r8a774a1
 support
Thread-Topic: [PATCH 3/3] dt-bindings: can: rcar_canfd: Document r8a774a1
 support
Thread-Index: AQHUrnSUcDbl6zEXA0CIBhvMaZjM6qX28T9Q
Date:   Fri, 1 Mar 2019 12:06:26 +0000
Message-ID: <TYXPR01MB1775BCD55E8E4A66D1EBCADDC0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1547736856-16539-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547736856-16539-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1547736856-16539-4-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d4c858f-14e0-4852-6252-08d69e3e54d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1535;
x-ms-traffictypediagnostic: TYXPR01MB1535:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1535;20:XTaesiuj8WgTefTT4ao1ChHyTPWj1pWqUQQ2fsczuvLjh0b9OQ050A0CAiX+w7AyiasRTom7roeU6M/SqPPU7lVCNN8hMBowXl7sK1trOHQSeFGxB0JFjnkIcRoanh9lpLO59c8Tuy7KKqeclvbSWdpWdKtD41OFWJQjAoKsOPs=
x-microsoft-antispam-prvs: <TYXPR01MB15351879FB112C16206B40A9C0760@TYXPR01MB1535.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(106356001)(11346002)(446003)(52536013)(186003)(66066001)(7736002)(305945005)(8936002)(486006)(68736007)(476003)(44832011)(7416002)(74316002)(86362001)(25786009)(81156014)(81166006)(97736004)(256004)(8676002)(5660300002)(3846002)(6116002)(71200400001)(71190400001)(4326008)(53936002)(6306002)(102836004)(26005)(7696005)(76176011)(9686003)(229853002)(55016002)(316002)(54906003)(6436002)(6246003)(33656002)(99286004)(105586002)(6916009)(53546011)(6506007)(2906002)(14454004)(478600001)(966005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1535;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4Snt9gs306QCy2ELRWj7HLatsxqONVc4f4PTgbVFgEc40Vs+3EXa8QDjZ+5HYjn5g3cN+CDolZvZwVn2t7KvtG/xTVCZtCatbFvjpQABVssWPG5PHrQepy2k5X/wi8LIoc8h5EkIKynMyMjrXKyAALSCHYu03goDBZJofX8Q2d4etOtrVo0LagCRnhog23ykE78WfJCU84Fn+5VfTO011rK2el7YnJP/OFgPo2f4GVfhR9u2OuXBsLkVBKg8/tMdSkw0lHRS5AJDvXJaHgNJyGOxIjHg2kkGyVaY+7dKFurzEsthiXbL4tGE5kPIT6LW6f5ESF6PuBJUkTC6DhWcbZn6Bta+qvXfZOdAiobzWXJ9CswR6qeXKEJYy2mGoR0aGKLB6skFTOS+bziHCuVWh2BA7pslyDIT991vCRLQemI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4c858f-14e0-4852-6252-08d69e3e54d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 12:06:26.6196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1535
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Marc,

I am sorry to bother you.
Do you think you can take this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 17 January 2019 14:54
> Subject: [PATCH 3/3] dt-bindings: can: rcar_canfd: Document r8a774a1 supp=
ort
>=20
> Document support for rcar_canfd on R8A774A1 SoC devices.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> ---
> This patch depends on:
> https://patchwork.kernel.org/patch/10766781/
>=20
>  Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 15 ++++++++--=
-----
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> index 32f051f..fd353a9 100644
> --- a/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> +++ b/Documentation/devicetree/bindings/net/can/rcar_canfd.txt
> @@ -4,6 +4,7 @@ Renesas R-Car CAN FD controller Device Tree Bindings
>  Required properties:
>  - compatible: Must contain one or more of the following:
>    - "renesas,rcar-gen3-canfd" for R-Car Gen3 and RZ/G2 compatible contro=
llers.
> +  - "renesas,r8a774a1-canfd" for R8A774A1 (RZ/G2M) compatible controller=
.
>    - "renesas,r8a774c0-canfd" for R8A774C0 (RZ/G2E) compatible controller=
.
>    - "renesas,r8a7795-canfd" for R8A7795 (R-Car H3) compatible controller=
.
>    - "renesas,r8a7796-canfd" for R8A7796 (R-Car M3-W) compatible controll=
er.
> @@ -29,13 +30,13 @@ The name of the child nodes are "channel0" and "chann=
el1" respectively. Each
>  child node supports the "status" property only, which is used to
>  enable/disable the respective channel.
>=20
> -Required properties for "renesas,r8a774c0-canfd", "renesas,r8a7795-canfd=
",
> -"renesas,r8a7796-canfd", "renesas,r8a77965-canfd", and "renesas,r8a77990=
-canfd"
> -compatible:
> -In R8A774C0, R8A7795, R8A7796, R8A77965, and R8A77990 SoCs, canfd clock =
is a
> -div6 clock and can be used by both CAN and CAN FD controller at the same=
 time.
> -It needs to be scaled to maximum frequency if any of these controllers u=
se it.
> -This is done using the below properties:
> +Required properties for "renesas,r8a774a1-canfd", "renesas,r8a774c0-canf=
d",
> +"renesas,r8a7795-canfd", "renesas,r8a7796-canfd", "renesas,r8a77965-canf=
d", and
> +"renesas,r8a77990-canfd" compatible:
> +In R8A774A1, R8A774C0, R8A7795, R8A7796, R8A77965, and R8A77990 SoCs, ca=
nfd
> +clock is a div6 clock and can be used by both CAN and CAN FD controller =
at the
> +same time. It needs to be scaled to maximum frequency if any of these
> +controllers use it. This is done using the below properties:
>=20
>  - assigned-clocks: phandle of canfd clock.
>  - assigned-clock-rates: maximum frequency of this clock.
> --
> 2.7.4

