Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5A8C38145
	for <linux-clk@archiver.kernel.org>; Wed,  7 Sep 2022 10:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiIGKy3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIGKy2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Sep 2022 06:54:28 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DECFD0;
        Wed,  7 Sep 2022 03:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxASkJFT0w9ue1ll+F4fKKKFS0NH7G7sUp+ku/7XWjPTO3kRtCSWlim6+Y5Opxcvm4KnZyNMkjIhHXKVt3d0QDIra5qImNqeqaC/w9VL7T8bup3io01LbOYsVqNGxsDGIBL/hwK9j84u9sxvhRHhJYD07SiATrRXcHoQZaWeGc4MDvzHrzsvl2H2D41VbVLNVq2O79AI3YhK4lZJTVJZAJfZSfd706btdGTa9pE45ZI4kuIRL7uJIAjsIZy66NaxdO9ckCrYrJ4+1IHnP67VJAr096IX84ygfg31VWxp2w/4Tu6hTLY9u/ovTV+Pq1ogIFMFlyCwTRJ5gqhDZCDI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Efa2v/thrSNPQ4GuQ/TOhJm865GukRZwgqjy/AorQww=;
 b=ASC46X+YNCu2u6BG/1lvH7FC03a7YJwlIPWq6KDeH1avpt7zO65OTzx2vWvC519ZFbDkrnMElLHrk/Z5KOKYZwEowiV5k0Xu54KoLhWpwvqFqcYvSYLxaKj3eyC3QKmSJnMgPazx4qzP6n4h91/5kstJuJP7hpQBSSbawCrtwAOY2gbuofrYmBpNH2FkEVq44uvvHL0MO40L1cWNmfs5x6j7e72G5ozQSSedG9KAAayca4KGl0nVMMb1ZUVweBtaJ+uQVTOSid+7WVsMhgpVAhIZUPkY5rH31C1qSraNwDnnU80u4nXndDEQmhXcUZqVLIrlCvqfACrok8Itb/fMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Efa2v/thrSNPQ4GuQ/TOhJm865GukRZwgqjy/AorQww=;
 b=ecfU/xe8ytQp4pjXWM63XDkdKOawXgN/BMf6lz7VnZ+nnYsFBm9o2pdG7PqJ8YBb40bB8Y/667tZLVC7GK8EqGgX1PSdKdO2MCS01uerbM2R4/FAnrm4wMbimUhExS+JS6m0Gd/ykLjNxMr/9iEbicRJ64l6uVW2v4tmh/h+Y+Y=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by VI1PR04MB3214.eurprd04.prod.outlook.com (2603:10a6:802:6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 10:54:22 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2%9]) with mapi id 15.20.5588.012; Wed, 7 Sep 2022
 10:54:22 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Abel Vesa <abel.vesa@linaro.org>
CC:     "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend
 clock
Thread-Topic: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend
 clock
Thread-Index: AQHYt5KR1XsmOlw21Eq3j+uA3frdca3Mgq0AgAdYj4CAAALlkA==
Date:   Wed, 7 Sep 2022 10:54:22 +0000
Message-ID: <PA4PR04MB96400DDECD242E858809AFA389419@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
 <YxJJ0IQ1Gu1lp02p@linaro.org> <YxhzV5pG6/ZMHZR7@linaro.org>
In-Reply-To: <YxhzV5pG6/ZMHZR7@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3e93465-5076-4a89-9232-08da90bf52be
x-ms-traffictypediagnostic: VI1PR04MB3214:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sKCmndhaT3n/TfGoERMLDUD6tQnUdThEZ+eARAZD5geUNCucpmuBS35Chc+sXg/wvo62D4I9pfnFyet4dPUM2+SaJ2cha0Y2mwYJKG2qBkvKnQgL5RzqWObvYM9EWZ2lrMvQTGzJlQq0dPBap27WgzI1O32i7hQmuXgfDf7L/HtkOtjZi+Im+Nec+wiiJHz1/gCpp3xq+QfxKSnM/EF+zovMKMv2E8olpLUG23To16f1jBk9pCZTIHfMJqoh1TYIGKVYT+dsJbFw1l8KfTuGZ697QA/Dszrz/GJGXl2OewpqJwSIE70SkqNVsmRlDYG8ZY2ieQj7/N/PeVfD12r5YULLhGp8BERdqXx5S5E59lrR9mVU+CTGVVrRas4+8duMEjh4Uk+b68G4G2iXh06axF5Z/wQ+/F4mRmdENln/oq8tecp+Gffmqqem37hFSuiP8JXUBBzP7GXGcwcY/tg3EwZh+q6KUKiOPHWvvgvkoh1XV/sc1sCW+azl/xtsgaMXDlnZDsp3pN7raiu5QshooJqI3optagLGYA6XXSSQMJ3Y8Jlr1wyM9eb2YuNe7/RZbJrJeux3aog3abA4aD1TabqUsVujcdSCpJjYoawYNwz4HQVai6XmnyuHJyW5WEUv9yIZa+0z8kv20+eCi68B71r14Rhr86moKYm2McBN2jmOeyWkqR0LDMu1IVYJ+IbLQBE+FRQYKqpLoOUdhTYAFniia5tWjFnEzMq9ozPVsrqxi7zZzlh+oD3z03f2lj9d2CVzG/o26Ux2J4pYGv0pziLdCviehPRXOGfptX28UZKcliWad+hHAsmBpju5xKTQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(316002)(122000001)(66556008)(76116006)(8676002)(64756008)(66476007)(4326008)(66946007)(38100700002)(186003)(66446008)(71200400001)(966005)(41300700001)(6506007)(7696005)(54906003)(53546011)(9686003)(6916009)(55016003)(83380400001)(45080400002)(26005)(44832011)(8936002)(478600001)(33656002)(86362001)(2906002)(5660300002)(7416002)(15650500001)(38070700005)(52536014)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TkYjTmIKVqN1Q7krQhhE0u6pKfAw8GXQGH+54pt2F9G6LgGByuK1rBVSg4JJ?=
 =?us-ascii?Q?SkF0p4XqQmABQ30BHu8l+XjJ/ws1pHPHMK/BXNw1VX0PnsoDhYPhk5ezisO5?=
 =?us-ascii?Q?54p2yi3Z9uX1Dxa67TW2k2q07g8c5nK0Dks+32lK80yfbveocZ7KA7pYG0Z3?=
 =?us-ascii?Q?79tPX6V9+cHfkqXheOlxibpAi5C4iZPTdwK4rnmOFxhbnM/ST2TbfIlIRONN?=
 =?us-ascii?Q?pcPNYWKUUKwbzachtmKqn/ltQQinEL3LvROzkNIihyIFDoOmt0A7taz+eUJ2?=
 =?us-ascii?Q?BPDbefZVlLcsoKQLbTSEv5ObXbNedM8nA1cDXeJVP4UoU8wLqL2GBdL+KgHs?=
 =?us-ascii?Q?xAI6vok5iUu6aEJyZDemav4TymjmPqxR152NFsYPa5eAclqvKwJ8fpbLRK8w?=
 =?us-ascii?Q?zN2/wTAFx+1ntdC2YDQ3+cLS/JlZIVRpwT664mlEoyfB0hfrg45Qh8MLBhhf?=
 =?us-ascii?Q?ZCgZJK2Gdvf+s0wR1XcXFXil172Ayed744/quAZYpMamzdpC7t6FS7CGQ2Xd?=
 =?us-ascii?Q?Bh3a8GRIU1wFtXOtU5q34i2qsOahhhEFuGZ0X4nEMijPOriqWFPMIl6tkOzK?=
 =?us-ascii?Q?mbegInJ7VWJYJI5QnY8KRi+Q/H1jIZAIEYUbeJOo1WMp7lj03WdDEIoO3I6y?=
 =?us-ascii?Q?unkVMuuTZyGg0DZ7VU7RyVIAeKBQT/4F3DxgAArExLh3YRk32eCUDaiow1DD?=
 =?us-ascii?Q?CGXcCzy0NZf/HRKJdg1+fwlm7c8culz5m9oB5k1knxGeM6+2kItX+ZYCI1Jb?=
 =?us-ascii?Q?BIrhLg8Xs7Ql1/lpF1YhhnIzetK7HvzR/pVYofZkKZ8NqXoVdIHBPFFoXpix?=
 =?us-ascii?Q?esTl0rDZadNi1jbyFoybmV/efugJTMVhLFLGV7nwmvOKSnmjYf606tJREyAj?=
 =?us-ascii?Q?t2GoO7KKMObkpgkiHtWLB3ME3YEmfTg26GH3+jgSad0C0F+QciQB0zm9CL4P?=
 =?us-ascii?Q?4t7CtstwbBHmWaF1VsLxKEUIyWlSYHNUxPRSHU0c+9TNS01LSm1umSKDL39p?=
 =?us-ascii?Q?VqgClNqTr2WCr7z+12ciXtUwx2ZMGiEYPNgYJjHmiWxkzlCXFKVH7J9vWjq4?=
 =?us-ascii?Q?gMyBIAUXbVGM4qKdrrHvvVvidFmm/JTEQdy825jmafctNQ+lpDfvETkcEOOx?=
 =?us-ascii?Q?tazpXKoNEAqu8ciwM8VrgDuFgWGz2ezlMDecBr9ROsE5E0hUWKrMOwO36DWA?=
 =?us-ascii?Q?x2MXaXMpAeOjNoK/nkheP2x8ACtSg+KKH9jMdRg+naq5GEzYXJZe8C2iGDNw?=
 =?us-ascii?Q?m72cZcFCBwISxTBsvBASD8Uczs+ay+Ni/uRR2ginkI18HwoI3qEAVOxTINgt?=
 =?us-ascii?Q?sFRR+VlNYGGkLRmGsSbaYs+bWQ7x3knfZSK1kDdvTNHGwUZaGMCKOvgZLnZx?=
 =?us-ascii?Q?fdeIY5JTS8QBSNpw0WoVtCXVLrsOJGjNzyw/EcTf25dMEBo9t7NJKMKUoJn3?=
 =?us-ascii?Q?2Ytvii9arIvdhEDymKh3Qh4VrcmhR+z2EJNbVJ1lvvKtZwjOSjh9df5uKc8D?=
 =?us-ascii?Q?Q48h9eJwo0eDjDP59iRQtzlIoIMIgSjm8LTn7Um4dfNEaxULGZk3P+e4AaPO?=
 =?us-ascii?Q?zWGVxmesykfNVSdLIpc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e93465-5076-4a89-9232-08da90bf52be
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 10:54:22.7564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RU58k5wGu96COGojg9QqnkEx3Qql3EIsw3EG+BaaR4YsIDRAls+kuxYkuCNE6HqK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3214
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Abel,

> -----Original Message-----
> From: Abel Vesa <abel.vesa@linaro.org>
> Sent: Wednesday, September 7, 2022 6:33 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: abelvesa@kernel.org; mturquette@baylibre.com; sboyd@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; linux-clk@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb susp=
end
> clock
>=20
> On 22-09-02 21:22:08, Abel Vesa wrote:
> > On 22-08-24 16:04:21, Li Jun wrote:
> > > usb suspend clock has a gate shared with usb_root_clk.
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> >
> > Applied both, thanks!
>=20
> As discussed in the thread [1], I dropped this patch from my tree for now=
.
> You need to send a new version wil Fixes tag.

Thanks, I will resend those 2 patches with fix tag.

Li Jun
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fall%2FYxhxSdDGXfO%252F%252Fbgc%40linaro.org%2F&amp;data=3D05
> %7C01%7Cjun.li%40nxp.com%7Cf62126a63a4442644c9308da90bc54ed%7C686ea1d3b
> c2b4c6fa92cd99c5c301635%7C0%7C0%7C637981435790610771%7CUnknown%7CTWFpbG
> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000%7C%7C%7C&amp;sdata=3DDRZzC7rKqNexnGN%2F%2FW5LXvhnhRwIN7CLC4KCu9z
> fTFA%3D&amp;reserved=3D0
> >
> > >
> > > diff --git a/include/dt-bindings/clock/imx8mp-clock.h
> > > b/include/dt-bindings/clock/imx8mp-clock.h
> > > index 9d5cc2ddde89..1417b7b1b7df 100644
> > > --- a/include/dt-bindings/clock/imx8mp-clock.h
> > > +++ b/include/dt-bindings/clock/imx8mp-clock.h
> > > @@ -324,8 +324,9 @@
> > >  #define IMX8MP_CLK_CLKOUT2_SEL			317
> > >  #define IMX8MP_CLK_CLKOUT2_DIV			318
> > >  #define IMX8MP_CLK_CLKOUT2			319
> > > +#define IMX8MP_CLK_USB_SUSP			320
> > >
> > > -#define IMX8MP_CLK_END				320
> > > +#define IMX8MP_CLK_END				321
> > >
> > >  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
> > >  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> > > --
> > > 2.34.1
> > >
