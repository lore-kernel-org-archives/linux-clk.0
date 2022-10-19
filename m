Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D73C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 19 Oct 2022 10:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbiJSKEl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Oct 2022 06:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234582AbiJSKEM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2022 06:04:12 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::623])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A558D2CFB;
        Wed, 19 Oct 2022 02:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emm+jDNSAjBFOSZ2NOBR9CMSIstoI8hxNfljAoYpD2m7Ov5QiLZ2eAhI2QjKY21ac5jtCe1wq+Sr78h6e4ZhXvL3efTOxwWnpA9eEZrqus0TToxbzSek72adas0RYWqQHERt9GIrtpIHlbDCtgqJmlPj/+3L1OuLtSM70EX44sN5Ov7C2WXMbUc/sUTRdwTGf5EDNtcQ39YqpzTGSMP4G3yEviBYV+0NdmdQvMVpNxphFSzsBm6lYsFNlDfSy3mylHEz0+b/mZhlVUvy6UHe2OufUu2FYKLnjSXGntoZnwTesGZrueTO39NU07mnNHK3Rm2d3g9cAqj+L+/gJPAGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59sgFrPDR/lc2sRtJZ2iGWhYJL1MStDl3Dlm9usaw7Q=;
 b=YMOmDdjhfeAE4ib/vLO1cLOQeesN6zStiIcodVNDt+jYOasKALUtIf1EJGHCFXziuwiZI2/6mpI6UsLCjSBpZrRpLVgqMa0tHcN3Iaj0YHMDKI2Swqvvp4+SQy13l1fMS+NtfTSHLBIhBL3oBujwkRE2RvlLn/tY1oOhMQsLQPLkg0MLhkBTMsLXV+kQl082R8Uzdp4NusBqfxjtYA5TVDQRTCCY0u+Tb8UyhbSeZ7iSuldXQwk4GNkQJYlSXVV1QDD7yx7M0l07znI+zmczVVC3olyW41PptBjUaLK+RiNshnTIfR0urHQ/bRizYp7TTVpHkQnTWAsGi0DjQhZeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59sgFrPDR/lc2sRtJZ2iGWhYJL1MStDl3Dlm9usaw7Q=;
 b=GUs2ZS/XEEfkxQsLvzZlk6EFjR+wNkcstxYdstgRR4o2drwqVf/TBrSIX6t07ljcyN93gLx6JLpZ3u1aIiVJGe5G2iyyQdJc7zbITjClOor6fTpeGqGM9KRy82xjGBY3fHZ6p9bXyDq2mEYlRwfEiAWiQ69nyXds3Ma0lI1SSn8=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DU0PR04MB9493.eurprd04.prod.outlook.com (2603:10a6:10:350::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Wed, 19 Oct
 2022 09:26:01 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::89ef:2505:c50f:3607]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::89ef:2505:c50f:3607%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 09:26:01 +0000
From:   Jun Li <jun.li@nxp.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
Subject: RE: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Thread-Topic: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Thread-Index: AQHY1N8+3DslQb0H3EmVnh4V22Fjr64VjPbw
Date:   Wed, 19 Oct 2022 09:26:00 +0000
Message-ID: <PA4PR04MB964042A30D09FAF4A5C40227892B9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <1664549663-20364-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1664549663-20364-2-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|DU0PR04MB9493:EE_
x-ms-office365-filtering-correlation-id: c98a965a-1c07-4eb8-b3d7-08dab1b3effd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gFCyndxv2lHB9gq2SzlSvgSfe2f5OnX0dfalFhRPbdCE2CFblWE/adnp+t18n7qkEOcR9S97q4Jfu2r/7LTUu+Nrn96vFbjT2wJXlmxNcJL3K3GAeM+DDKw5q1Y30mEg+fVVA/8ptIBhTWPWUCfkyaIvvfphmbnNakUd/6Nfrq/WHyrAqqijNpVXh+w6W2Z3M6/5v5us/rV2ssmBDfS15JGx0rS4BjsYL/Yp/e0bA8K7UfRICIvrdglBWeUr/PtHhSHGIig+ceyKFPtlLK+atgARJrGHF0to86md7VFJfGNuw+uCEEL+r28vtQCcddWbJNOqInY0gjlR2y+ZZRTy4PS+W2AKrtTiXBxbAwB6NGj1Z5f2C5BpZHVrZHZoVGoSMd/Wb7H1RexbLAep/hXiUXIkH4wxcyQwiyk0ZiOnDPpSoOntlAXc8GeIUaayisjGMyrlhEtpe/5ltRClbn2Htn3hLUOSmnfzjgL/Pyf+rv7j07JJR7pL7TVxZyoVjci+vSdGZ9ogJWCyizYMxA7ZK8qJpK6SgyPEz7fzOhykyN70bqZExlmUaNbx2ZP8omkBsusnPdTtPSIWf6YAWcnR8jbSlmGCZ1v3OwKMQ8ZclFBiiIIzuWqNCC1QvZpZoKPead3KJctRWy32ya4/nfiAZOTWPq5aLEZ+tRbIhUn1X3YiIsAYsI2NrxvQsmspRCgxyb3+UXf2QXJmrBl93WccaFcgC2Yx9pJputOfqgqV0bJptXxufeo9aZKYvLlIrIgs6T9SIIQhONqCCxgBg9LvjD21OzCHUSFDJg4iBRAykV8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(2906002)(5660300002)(52536014)(66476007)(8936002)(7416002)(83380400001)(41300700001)(8676002)(4326008)(6506007)(66946007)(44832011)(66556008)(66446008)(64756008)(76116006)(15650500001)(33656002)(7696005)(186003)(478600001)(26005)(316002)(9686003)(110136005)(122000001)(54906003)(71200400001)(53546011)(38070700005)(55016003)(38100700002)(86362001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?01RqHP0O7JueZyXk8jKHzo1QFUtrd/q12V/hePsnDGFIl9LwcI0AapT2VRmu?=
 =?us-ascii?Q?pHamb7GPfDQevZMeKjTfIhjRf2PMw4vMA24vlHTReN0IY4k9iCUCyZKDY7Ah?=
 =?us-ascii?Q?sXWwRafSSQ1p5X6rgQSEGeo+LoeQnKDMLtanVebhjRPxVSybvdgTJt4aBSu8?=
 =?us-ascii?Q?N04rsis9edOOp7AbbA+SGKJHgnHb52MCqsB6BEAh4elOHBqUzR171RATR6KF?=
 =?us-ascii?Q?lIkhkG2Ihrq5cHib+YAfrKhxc21Uqgy5/10xwVgz53CTnmnMtlKG+u9kiPU1?=
 =?us-ascii?Q?vCuza3RU4YcqIOx453G0E3vVlMfDhWJaPIPtf5cjhaaUxFoTs7QMNF+USWs7?=
 =?us-ascii?Q?PWgxxluY1ZFRvgehQLjZ4AagrDD7ceM7NMDB9C5JPg04AGmIGkAue/GRNw+v?=
 =?us-ascii?Q?gtPpUmmK7s+IIgm2NghRdPJe5Bp7ksuSikhsYRIOeqsY+wlFuL++ts0rtL6F?=
 =?us-ascii?Q?E4Y1Y3qCwa+oyvjRFbonjSU6Byd+jVpY6eDGKGpfKorfIm11cATQsMmf5s0X?=
 =?us-ascii?Q?BZVMapx0/63mrzPcfM7cOIDw4mTT/lCGT3Dufts6IvyG3F1jyNTf9l/D+Qmf?=
 =?us-ascii?Q?O95crRAUkfPl6PN9+hwdEezMaj4C79/QfcDj5FRExu7yIJss428QOMaSZJWd?=
 =?us-ascii?Q?/amcmiNcwsueZCjGlRQArpTdzz7klNCBE2KgutLZE5FzhyDLbKhqoIwXZenR?=
 =?us-ascii?Q?bolUmefv2pDpGMOU03Eot2ldrh4Smgd3gwKPqhs3Td0gCW8GqnIFiaaG2J+c?=
 =?us-ascii?Q?jYG2TXh4mPj8VGDnnTiTfYmkZQD3MaLSr+P2fL70k4FmHY3jlGl44mW5wn/g?=
 =?us-ascii?Q?z0DyO5SGbC5b8PoUl2CGHbdwAgMLo9dSrzkqSAA5m9gGRVorvZksHFRBiP84?=
 =?us-ascii?Q?gvJb6KQV/Nq4Job83BXZ1lTNzUpDw5VTDxxZwVkUxDdArq0sIkf6DUK30GTk?=
 =?us-ascii?Q?arZevSewxb4pFGA6pCSSa+uiRPfG9ItNvhAmZ/rKFcUuEcvI4Ab321xuiSkK?=
 =?us-ascii?Q?kIsJHN79rGylsK5PI0RF0wdi2LZFnTtXHSj6y+Y37cPVeELiqNeFJS6dI7jP?=
 =?us-ascii?Q?BLheQf+gLRtvbpFy6hWMQKQwMt18Lu5bX5mwqOI/BAYvmfmfaMInAUWzA63F?=
 =?us-ascii?Q?g/5SqRYo6raKKX/9AuXrizzuRnVCVr3Syh3hr7KAXDhJFUIZPGGDcQXAk7Nu?=
 =?us-ascii?Q?jWh+Lf5q36eA/NbPKPU0I0fctOSD5KJBMcnnwDWw17sjxH+2sQmTr2J4kC8G?=
 =?us-ascii?Q?Oy/eVD1jso2io1/s7Gn3FRB6PqurrfjcVRaO2czzRke3ab+fT0pvh0Wxcuv1?=
 =?us-ascii?Q?D3T5TNn6CCJ+mVhrpsZlxzWB5we6vARSIQVAtLgAucBrD2SRFJfBitdqj9WA?=
 =?us-ascii?Q?vpND4faG8pzCT7Y8B6X2EC1BnkXPHpoMDKsiUT90e3yva5VItpxHiIFTrNfn?=
 =?us-ascii?Q?gpJw4fa24rG9YlXfV1+Ej6bZBYy4oVHgs1NwBbNcmy8rFRYxbIfRoWKaolTa?=
 =?us-ascii?Q?NFGeBDEH2kPQaEr63wxQ2AYa7KR/zyPSSFxuOowfGDfIOvyKeAnsiwawDkwT?=
 =?us-ascii?Q?BUoUF28h2BrCbWfq37Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98a965a-1c07-4eb8-b3d7-08dab1b3effd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 09:26:00.9677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZkWb7KI4Yl985CP2TQyc5Vw0HgYxJ+YsxhHLSJ7Ocmj9E7RNuFdLMPKy3DY8E5tc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9493
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Friday, September 30, 2022 10:54 PM
> To: sboyd@kernel.org; abelvesa@kernel.org
> Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>;
> mturquette@baylibre.com; l.stach@pengutronix.de; Peng Fan
> <peng.fan@nxp.com>; alexander.stein@ew.tq-group.com;
> gregkh@linuxfoundation.org; devicetree@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org
> Subject: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb sus=
pend
> clk
>=20
> 32K usb suspend clock gate is shared with usb_root_clk, this shared clock
> gate was initially defined only for usb suspend clock, usb suspend clk is
> kept on while system is active or system sleep with usb wakeup enabled, s=
o
> usb root clock is fine with this situation; with the commit cf7f3f4fa9e5
> ("clk: imx8mp: fix usb_root_clk parent"), this clock gate is changed to b=
e
> for usb root clock, but usb root clock will be off while usb is suspended=
,
> so usb suspend clock will be gated too, this cause some usb functionaliti=
es
> will not work, so define this clock to be a shared clock gate to conform
> with the real HW status.
>=20
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Is this version okay for you?=20

Thanks
Li Jun

> ---
> change for v4:
> - improve the commit log to explain why this is stable stuff.
>=20
>  drivers/clk/imx/clk-imx8mp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index e89db568f5a8..5b66514bdd0c 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -17,6 +17,7 @@
>=20
>  static u32 share_count_nand;
>  static u32 share_count_media;
> +static u32 share_count_usb;
>=20
>  static const char * const pll_ref_sels[] =3D { "osc_24m", "dummy", "dumm=
y",
> "dummy", };  static const char * const audio_pll1_bypass_sels[] =3D
> {"audio_pll1", "audio_pll1_ref_sel", }; @@ -673,7 +674,8 @@ static int
> imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_UART2_ROOT] =3D imx_clk_hw_gate4("uart2_root_clk",
> "uart2", ccm_base + 0x44a0, 0);
>  	hws[IMX8MP_CLK_UART3_ROOT] =3D imx_clk_hw_gate4("uart3_root_clk",
> "uart3", ccm_base + 0x44b0, 0);
>  	hws[IMX8MP_CLK_UART4_ROOT] =3D imx_clk_hw_gate4("uart4_root_clk",
> "uart4", ccm_base + 0x44c0, 0);
> -	hws[IMX8MP_CLK_USB_ROOT] =3D imx_clk_hw_gate4("usb_root_clk",
> "hsio_axi", ccm_base + 0x44d0, 0);
> +	hws[IMX8MP_CLK_USB_ROOT] =3D imx_clk_hw_gate2_shared2("usb_root_clk",
> "hsio_axi", ccm_base + 0x44d0, 0, &share_count_usb);
> +	hws[IMX8MP_CLK_USB_SUSP] =3D
> imx_clk_hw_gate2_shared2("usb_suspend_clk",
> +"osc_32k", ccm_base + 0x44d0, 0, &share_count_usb);
>  	hws[IMX8MP_CLK_USB_PHY_ROOT] =3D imx_clk_hw_gate4("usb_phy_root_clk",
> "usb_phy_ref", ccm_base + 0x44f0, 0);
>  	hws[IMX8MP_CLK_USDHC1_ROOT] =3D imx_clk_hw_gate4("usdhc1_root_clk",
> "usdhc1", ccm_base + 0x4510, 0);
>  	hws[IMX8MP_CLK_USDHC2_ROOT] =3D imx_clk_hw_gate4("usdhc2_root_clk",
> "usdhc2", ccm_base + 0x4520, 0);
> --
> 2.34.1

