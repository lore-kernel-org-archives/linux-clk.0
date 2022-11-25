Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B94C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Nov 2022 10:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiKYKzl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Nov 2022 05:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbiKYKzk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Nov 2022 05:55:40 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3544824F0D;
        Fri, 25 Nov 2022 02:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGd8OFCOUUR3dd2/vMqVpuAn0aIldPYi3E5aGmOEX6kH5940R28UlVbpO5kwgjprQ+Mdgn1VdTTKHp8kP4tmWf9xj7uj6/pBQc4P95uEAA5LI+i3KHSDcVEQrhouRSa+ixutC6FcOaGzCceHNkMWclyi1c1Aj2kL5VW4t3WDFx2d43JNu5ij7Wsm3AYHVrPPHsO60CrD1Mfll9yAMzJytDVgJxwT+zRW2jje8wqwF2oeS5Cjn9lV9hZRbO8CQdnF6RDhjuerLt0lMiPpl7Wix2onUJjRCHTo9IIkwUpeno54sYMAIdNTIE5ehPV8CJlkYbCFq+24vU1AnDxmi96p2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilygNa2vEz1VU+uJNpEBLn3CTeiJNOgcsTP7hR+6nnU=;
 b=nm9T7u4YLPRJvSiLxGBfA1WmlO7uh1qvBflgtUk6GV+N386NcEmQUoq9Tgig6JUxZvM8b45MWXR/xgX1nHkcg9t4ErDe7Y8OXGSyU1NIFa7n2ofHnx2QXsL9rZU8TNYW1DVbnaJBbozAesvRXdBl8UJU5zHNtlTRZpynuLRhB6vfcaPxsjEIUythFc7pmqlpZZJcEDkJgPEDLM76dyv1jenIH1UasfLekbmMIZnl0hOf3rbVNLRNdZUuAShHSIHO0bUqk8svYK3c+oThsG48fz3Rr9llOYcROiYW5rbqHCHJ8kDjA38S0JtIwBeOTR/OB4XnCZS3UP8D63UI33layw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilygNa2vEz1VU+uJNpEBLn3CTeiJNOgcsTP7hR+6nnU=;
 b=ZXdAu6x3v6MKThpET0nUfQ4kjuCybRHSWY4vDG/X9mUgYpDgtdOwlWc2PYWvO4EU8OLBolCqXXfc/f5TJqFG6HtJ0s6NTPaEgCPmKuZZfEDza1L4S+cegJdOexAUnd/ZhauAzUezWdt85v5LOEXQ9503BmwyOaaTmY595EefGJw=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by VE1PR04MB7486.eurprd04.prod.outlook.com (2603:10a6:800:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 25 Nov
 2022 10:55:33 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::cc4:c5c2:db97:1313%9]) with mapi id 15.20.5834.015; Fri, 25 Nov 2022
 10:55:33 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Abel Vesa <abel.vesa@linaro.org>
CC:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
 suspend clock
Thread-Topic: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
 suspend clock
Thread-Index: AQHY1N87VFVHcKgzlUuO8+c59c4Yca5J2fEAgAXzemA=
Date:   Fri, 25 Nov 2022 10:55:33 +0000
Message-ID: <PA4PR04MB964010FFDD808E0078913C1F890E9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <Y3ufuH1UAT+rsjl7@linaro.org>
In-Reply-To: <Y3ufuH1UAT+rsjl7@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|VE1PR04MB7486:EE_
x-ms-office365-filtering-correlation-id: 23c1ad6f-113a-4a0f-5545-08daced393b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8fHTHcc3AcKD6tLP2qycXubgaUVhlERIiW9usYf1435aXsWe/YR7EOVG8qjFqYWOdGq792QF0FlbcNU6t3qXY+xPUmijMj3GQZRAGPflCNb3T2d8jHT1LhcBGyxdN9ePBAIoLg/eFPdMg30KxlGmBqY6pknz0cr2eS2hjH4aRF7AHPxGH/tZ10gfYNi1tyBQZmgfxqT/zltAu3ZMrJO5pmOxEOlzXIGXzRRW2bR9vnNisz494TCrwYJxB/BGRtVMiTdOqFmiRyTwUyLS4FQ7kH3Z3vTrylKe6knoHtjZlaprhr+TGzO/C8Xmg4rj2gHhLhZW+FOvBOoDlhFIAuZ2oxgb68llKe7B5JJLGb8sxKdO4hsrZWxY0CA2fPOMyUQXjJc3ZRoUGlg2BtFeZ8g25x1c/bf2M3kW8Xh8YDexLMak3vSO1riVll3RrZy3zWFBj/VCulu108k6Wx2TsMCPNKm1O4yQzX5vwO6eEwoUJHCRTV8XCj3ziYlobBgyK08cZ0+X4sl4ZfYIL2/IE4csY8q966FqEMcx+tNnUMVdI2zAKYSNFigEdVW4cQ5Az8GtCpOOAvUiclTcygxYdKL6iZnfZG7xDJHf7jAfznt4nszsffaT5OrtjF0RyvFprL61rncrPABSGMMDs5clabGl7ptDtgc51KgD1dotybAzetl3SKQcI6azRYRU3saRq4rOY2G7u3EAaWBVhiLu1PhBLmaYgvMZGoDtvg/+MUO36tc/tpf6ifF8MBZyURjOIw89i7RYgpNa3hdALWXEc3c3o47fT+LR/qNxmyEm/wHOK/M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(38070700005)(38100700002)(55016003)(44832011)(15650500001)(2906002)(122000001)(5660300002)(52536014)(6506007)(8936002)(7416002)(71200400001)(966005)(41300700001)(33656002)(9686003)(53546011)(26005)(66556008)(66446008)(66476007)(64756008)(4326008)(76116006)(66946007)(8676002)(186003)(7696005)(478600001)(86362001)(6916009)(83380400001)(54906003)(316002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kRuQDERNghKhAw3eQ2Etv3UvVBFAO3mOsIQjMC5tjHikeKzJBg6RMijlMyNu?=
 =?us-ascii?Q?avpoIsG3M8RGx6cVEACWpaBqDd5kKaGn5Ru2aXAreFMBqIMDMqm+hUzpWH06?=
 =?us-ascii?Q?VTo2e+P9xhSwy18ZeKm2cOSQjLY3mvGn0gt9rohvqI7YdMDKXk0AGAVzENc+?=
 =?us-ascii?Q?GLiG7S3h8yGsNz5zEiZd84kUvlpFUOIj+Bss1jYYznPeA/5oyKcTrNnV2Yxi?=
 =?us-ascii?Q?/oqv/mseBJtPafU8i6eOJnyGJdXmE7e+9gE8LyidH9JitCtK3OvWinaCz6dr?=
 =?us-ascii?Q?POxrJMx+9j5VJ/0hl28hEG3hjaYSqV9FxX4S1dIoE98ukG+1fueDAz27tgoi?=
 =?us-ascii?Q?SL9HoGVYitWY3xsuWmzY2TSpJ0W7+Q9bx9xGNncQQ0MXjPD+LMjs5xsvQc5W?=
 =?us-ascii?Q?yekTIuNiiCNJx8NgXWJAs71LYzMqLREMmCkuZQbjKz8h1ngk5fStDsVoCEaW?=
 =?us-ascii?Q?aP5KPaCRvr0xBbKOl30b+aFcwzSBcrlHoB8WvsKvbppRh8n6ImzSavty7+vR?=
 =?us-ascii?Q?+HS+gYar378sUPx3Z8NEUE4Rgcz4LWuKr8V2sqCGcVMfvnLbGv70rsms/L5A?=
 =?us-ascii?Q?yjAPhot0WObMLoWMyext1PQuFn4sfPaEEYWKejuxikiX/ZubeZd36m7+BTTU?=
 =?us-ascii?Q?cnWGOm/tReErc8Bolm9Z+ygOTYzNCoOn8Y0Jz6j1r+l/zIi/uudxt4pJAqTU?=
 =?us-ascii?Q?7PSoxwK5cgvBmf7hIpg5Sfv/5bqCskZ3T45irk+PlgjZvNY71V+uyoou9+co?=
 =?us-ascii?Q?iIv1ytgQmBwIUZ81gq80WHYHuxCTNkuBM7HlI+VaxkyjTKyTWdyHH28A4rzk?=
 =?us-ascii?Q?sB56I7oipThWGhSlxJlSkTPI2xZMDUP/WAUmdZXUvGlIbSv3kD32yMiVZRpq?=
 =?us-ascii?Q?cpIWuCMjh+TlikMq3DfDJR9mlnlRN7iIUfWPqgCE/QXjsdRWQ8B7LTb2Hlbt?=
 =?us-ascii?Q?h6SvV/ACNzCpeJie6jvYZsKH9yUQaIrLd2bP+tAC9LIy4x6PB1xIEr2S6z84?=
 =?us-ascii?Q?ch9M49E0dYbVahRHksGABFpnclks3lzThmZx74b3TSDacaOrD9WxhqSRXDGy?=
 =?us-ascii?Q?z2vxXMdrQoUI0ksDQPbscx4kxE2ALM2GxVWTKvyoR8O1W3Y6F56q6n/i2VB8?=
 =?us-ascii?Q?hnVC7XIxgr75NOZRO9ilb7CPhvFMKjgNwfMMzklSlYpAOPxNJTBo5th4DnTc?=
 =?us-ascii?Q?V7uM5oFmaNIXeI9vixTaI1ut//4jNF7L+4kWkKh4q5CserXU5/iXdwTaOr7G?=
 =?us-ascii?Q?HmDUWXoO7BrQgEgSDHXBomQSMnnA4nEiEaBrfK2gdTWygyvwK9qBBqmVa54/?=
 =?us-ascii?Q?0h9Ib80hfUoCZHX5Qm5qXkXWiJHq2hWk2zyy2bOxeNKN1jNVN/ffWrEXNS86?=
 =?us-ascii?Q?FegbM0xTTs6VPzOYYT4bKAVhs7Hzv0caJIiunaWPZpnvJfYwcT3zn6Pxa+z7?=
 =?us-ascii?Q?Grf9sZclvlm6KmRvgoesMEP0foWfAdCAt7/nOvXw+lo/iPqAqN1DbunYWJBu?=
 =?us-ascii?Q?X8aRa4P/eTzJ3Tn+4b6cCca0iZVSxaU4asQgY1eo3PZGNSWF5t8QtL2ppO56?=
 =?us-ascii?Q?7aHpPwjVFoJzabfxs9Y=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c1ad6f-113a-4a0f-5545-08daced393b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 10:55:33.7106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w31lU5pPn9CGQTVMLJ4yemfV6cZmuVVr6hA3dMlmUEWcNQw1Od05+isEODhJsNJv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7486
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



> -----Original Message-----
> From: Abel Vesa <abel.vesa@linaro.org>
> Sent: Monday, November 21, 2022 11:57 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: sboyd@kernel.org; abelvesa@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; mturquette@baylibre.com;
> l.stach@pengutronix.de; Peng Fan <peng.fan@nxp.com>;
> alexander.stein@ew.tq-group.com; gregkh@linuxfoundation.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-clk@vger.kernel.org
> Subject: Re: [PATCH v4 1/3] dt-bindings: clocks: imx8mp: Add ID for usb
> suspend clock
>=20
> On 22-09-30 22:54:21, Li Jun wrote:
> > usb suspend clock has a gate shared with usb_root_clk.
> >
> > Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> > Cc: stable@vger.kernel.org # v5.19+
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Signed-off-by: Li Jun <jun.li@nxp.com>
>=20
> Applied all. Thanks.

Hi Abel,

Could you please also take the dts patch[1] in this series?
As the dts patch has a build dependency on the clk patches,
So Shawn suggested you take the dts patch too [2].

[1] https://www.spinics.net/lists/linux-clk/msg75904.html
[2] https://www.spinics.net/lists/arm-kernel/msg1013220.html

Thanks
Li Jun

>=20
> > ---
> >  include/dt-bindings/clock/imx8mp-clock.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/clock/imx8mp-clock.h
> b/include/dt-bindings/clock/imx8mp-clock.h
> > index 9d5cc2ddde89..1417b7b1b7df 100644
> > --- a/include/dt-bindings/clock/imx8mp-clock.h
> > +++ b/include/dt-bindings/clock/imx8mp-clock.h
> > @@ -324,8 +324,9 @@
> >  #define IMX8MP_CLK_CLKOUT2_SEL			317
> >  #define IMX8MP_CLK_CLKOUT2_DIV			318
> >  #define IMX8MP_CLK_CLKOUT2			319
> > +#define IMX8MP_CLK_USB_SUSP			320
> >
> > -#define IMX8MP_CLK_END				320
> > +#define IMX8MP_CLK_END				321
> >
> >  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
> >  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> > --
> > 2.34.1
> >
