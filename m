Return-Path: <SRS0=aDlN=Q5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D97C10F00
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 12:01:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 878882081B
	for <linux-clk@archiver.kernel.org>; Fri, 22 Feb 2019 12:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Mvtuhq0R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbfBVMB1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Feb 2019 07:01:27 -0500
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:45120
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725926AbfBVMB0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Feb 2019 07:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaqohsvpOQ7J6GtgPBATAxNoNXiLvwB0Mr0ZpGIFUjc=;
 b=Mvtuhq0RxTkq70pPb/7ufUWHT2JMECrCKkSlncYIC+eE9Xp4eZv0pIVNgjNbXh9Mt4V5mgV9J8bwqgammuByb/kI05l0lDm2mjQSKx9JUJY1kDfrAME1i7OWD+Ma4o5LM4YgUdYLdYNj/r6h6xVriBcMduolXnhLDLU62OBA+cQ=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB4526.jpnprd01.prod.outlook.com (20.179.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.14; Fri, 22 Feb 2019 12:01:21 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5%5]) with mapi id 15.20.1643.016; Fri, 22 Feb 2019
 12:01:21 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Thread-Topic: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
Thread-Index: AQHUyqYgFogPqRgTYUadFexE8DmDZqXrtzZA
Date:   Fri, 22 Feb 2019 12:01:21 +0000
Message-ID: <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3edf53a-bd35-48d3-0f93-08d698bd75e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB4526;
x-ms-traffictypediagnostic: TYAPR01MB4526:
x-microsoft-exchange-diagnostics: 1;TYAPR01MB4526;20:i+jG+tH0xkCgFJrfP41Jl1UhuNTCvywpE9/Kk+5QR4aPhdpk8tw3mhJO2u9TvA5I1Tvtwb3aIcSOskB2OqqUXE1eGqHcnLwoTFAAAn+I9E989jYomySNXmJJj1PcZ3nPVnJewc9R4HuNMb7g/PRt/G3fGBZ7oDqzjrResnlLVKQ=
x-microsoft-antispam-prvs: <TYAPR01MB452642D0FEA6AEA45D120AA6B77F0@TYAPR01MB4526.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09565527D6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(396003)(346002)(136003)(376002)(199004)(189003)(74316002)(6506007)(102836004)(7696005)(105586002)(2906002)(7736002)(76176011)(106356001)(446003)(71190400001)(26005)(54906003)(110136005)(53936002)(5660300002)(99286004)(476003)(86362001)(72206003)(71200400001)(316002)(305945005)(3846002)(6436002)(486006)(256004)(55016002)(8676002)(6116002)(4326008)(478600001)(81166006)(8936002)(14444005)(6246003)(4744005)(186003)(68736007)(107886003)(66066001)(9686003)(11346002)(33656002)(229853002)(97736004)(25786009)(14454004)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4526;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 38vbBYKKOCGDm8JrIgxfQKebtGtNE/eLIMtYIkIsnfhdEtqc4JooIXjgOtGgurFH34cTHRYvU/wb9YkVp5od21zTc3Z61IJ4s1YDkf2zLdMNXPm/MAToAPH52srikiNIp581tRIwT0lydshM6it/mfUHLeEutu3TKI4XZ13Hr02i+lyXlMnRtTWRDhDf92VkjDpwq5fypEnY/m5gaxxmTXKmURw1Sut9BO4RiZOhDaq/FAE1w3LkgbO3vF2fNMEPk5LIhintcG71uVudSrCsi7b4VYfvNhaf1/SgX6QKdVQgTpmduuj/FMrgl3JHmSma3jshUHixtqDnc77dB7jb0VXKeKpg02eftt3eBlkSke0KW5ePQeLQ3zSMOIp6Bwx+6JExXa4hV0P3WOX2jjd77f5te6WlYTJ3QInt+hzHwUw=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3edf53a-bd35-48d3-0f93-08d698bd75e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2019 12:01:21.2611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4526
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 22 February 2019 12:00
>=20
> Enum LAST_DT_CORE_CLK needs updating as R8A774A1_CLK_CANFD
> was recently added and it's the core clock with the highest
> index.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

> ---
>  drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> index 5fcd6c5..8e7bb43 100644
> --- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
> @@ -21,7 +21,7 @@
>=20
>  enum clk_ids {
>  	/* Core Clock Outputs exported to DT */
> -	LAST_DT_CORE_CLK =3D R8A774A1_CLK_OSC,
> +	LAST_DT_CORE_CLK =3D R8A774A1_CLK_CANFD,
>=20
>  	/* External Input Clocks */
>  	CLK_EXTAL,
> --
> 2.7.4

