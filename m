Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0222C6FA8B
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 14:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiIIOQT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 10:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiIIOQN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 10:16:13 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839DD2CE0D;
        Fri,  9 Sep 2022 07:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5uquQPO72V/ZWjAhVIlQIdJeDHyFH+Q9Thpk6ZTn+XCsgaSWQvuHOx1dADg1VYuTUHD3YewaOPz12xNhvk1k0ObeqXLMbUj7oeQ75c8bbb6xRtn4BLBYRiRvKI+kiqrgGrfCPjABMSquM9WJPf8DVgNYNSlK5sq51I8OO6yTsQqxR9HOE4d4neCKdtQh3A8HmNG5HLEFSfFJw1i/yf+4DQz8K40OjgdouWY/64cWFUEFG+NakeBvoFZPQVtk0JxeplCnHwhZC92l0jadNCq0xL9y8Bcs12MeVIaC2fB0kGkRrzb6AWW+w2uSJluIfaumednEnd0TeFXnLtqpKDX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L90eleT3U7aLyiIIhIJODUdd98D0jy0j5DyvEaA8D0=;
 b=g/n3asVPh9j+xa8X+ZzC7NbkevY2J9W4WCWXS04iSUWwc6iqoHGZylBZeAYi15IN+/TqS7tyI5wV15o4VxDYJOQXR13x3xzseXt85pdJvee+e9DG4ZgmsIibNp7xqHQ2d8EbI7h49O+sI8hBNpbkvyypQxaNXU8NSUJv7T/BQ22gC44XcvI/60gg/vkfV++Spp7jxJqnRVNqSfxJlaR3YLLFpD5SDjOhsJOg/+DKmS4f/kX3M5RksBJQ99Hc3DZOg5sJr7EiyeazcH+I+97dCURqcTgjpPAHhRarvQYcG8WVP0zXC7h93XAfmC35A3xRFkQ546TXlNBXK3knV96iTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L90eleT3U7aLyiIIhIJODUdd98D0jy0j5DyvEaA8D0=;
 b=PPOMuwjnPE4Fuq1sdNK7Ysws80egVlAA9eOsdHMK+9pTdYe6STjt35240M2mfpjSTuvoQJk4sCp5Wm7E6rpclwOq7ilMoFAuVZ1gp1UOmtBu0O1ViLrNMeBqCQTbZQzmSbuleMjzDO6/XO/7r87zQ1cwbF2vKz0ez86YC5Bqozo=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DB7PR04MB4651.eurprd04.prod.outlook.com (2603:10a6:5:36::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Fri, 9 Sep
 2022 14:15:58 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::25b6:d7f1:c25e:24d2%9]) with mapi id 15.20.5588.012; Fri, 9 Sep 2022
 14:15:58 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Thread-Topic: [PATCH v2 2/2] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Thread-Index: AQHYwqhUAPB2UxzWfUynFl1ZmQSDwa3VvXqAgAFlyyA=
Date:   Fri, 9 Sep 2022 14:15:58 +0000
Message-ID: <PA4PR04MB9640A30BB8BD63F3678692ED89439@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1662547028-22279-1-git-send-email-jun.li@nxp.com>
 <1662547028-22279-2-git-send-email-jun.li@nxp.com>
 <20220908163817.GA2828563-robh@kernel.org>
In-Reply-To: <20220908163817.GA2828563-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4653c9e4-7729-4a40-56b8-08da926dd150
x-ms-traffictypediagnostic: DB7PR04MB4651:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XWrNFCz78kzVprG1vyXJP7QV+4P9UdrLaIiswPr1jcYtw0dSznfP3otNvlcfGwq5Qs+NK8Sim1u9k358T5yBZEa1JCSbz6gcCXU40svhCVFiZGzJE0P0a71NVEzs1K9eS9R4tlNtCx40MQhn0NjmmgVXt+BPC9JPLroJTziTAMC19/Nupn4Vs4drjXTtsdJvD6X8FsUI553P2jBVXZIndzBdBIiAmwbvbEumesGHJeF2qT9sXrcVXlxqSZffUwcpKlJiqtmlN/rsIMnTakdIUD5AlAWVdrrmkIoQcOJadBNRZktMevlKkXgcuasZBa2BIgLlgZYDlqwT2R98OPTn8h+dvPQkhQBUkdxvXxf9ACmc4WFvjoTXdTUO7FR8qCycKoxpUsEDhwT62LiKE9jpHTz31E3KpRSsxALY1NfLYM95xBx6ixXmfM9+hbPixmyD+VTYNZ0edzyAoI/pY4p7HKcoWpx4oGLONVnFWdVE7QsesB/QTRlyVf7qgy+8AL0ZB5hcmHNsBH6e8R+p4mnfjke32wbPxg2s2tqUdkFwIDoUKX+DKF6ZEBZUTAzM1LpwJzfovNZzUYW2HK3MPi6ARDckDrAC6W9Q9uW9LjfuktJya3DgUhL2eh6QyvODVUBpSWDSijwLFbir2WJYO26bpjWaRf2Rb2/E1tufrlH2gV3FwzpMZyLs1I/EmecyRRaQA72J7OcZVqt7Ebs3QcQMrfELw1IlYv7eby9O0qP/kVqhmyDQRKcwU2okYTHp+tZOf2jnwXxt7Brz+6uXgYI9wvQjjOYQ2/CIF11G9vjBR2INGaONrfWoLSbhTpodZsiF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(83380400001)(33656002)(186003)(71200400001)(54906003)(45080400002)(316002)(6916009)(966005)(15650500001)(7696005)(53546011)(9686003)(44832011)(2906002)(26005)(6506007)(55016003)(86362001)(38100700002)(38070700005)(122000001)(41300700001)(66556008)(66446008)(7416002)(76116006)(66946007)(4326008)(52536014)(64756008)(8936002)(66476007)(8676002)(478600001)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+km9z2Y3YeaoYPeqFsoVIkQ6ZPuDzQpfAraqiybMa3gpfgiPQBbQbft3nc6n?=
 =?us-ascii?Q?JYN8hZewL75fKEq4e8QdWcZEezRxjsNs1aT5JWDGk3nk+GHStgcLSFf+etYy?=
 =?us-ascii?Q?m8sXPCDAqs6s6Pj97W/suKg99c8OCv+OBlHP2UkIRkdn4oOYUCH2oImhaeT8?=
 =?us-ascii?Q?tU/Ssw2ol8dwO6N9MGLl2QBAbHl2lfJJzpmXki3W5QBjZ0Ynt6HpdZhuQsA3?=
 =?us-ascii?Q?5hzCNSIRUbtpnFiCos5siDXkUA4Wqaw3ry4Y1NW/lXKTWr+8pwCNc9JDqChp?=
 =?us-ascii?Q?3lIL3yE/+/74XQsyzHKtGx326M0DqeQ9b2UPk7ChUx9sZQDLxZMvmaWiBDpF?=
 =?us-ascii?Q?HKSw0UF1JMo4O4JD7SPtRwoRREiZ11xuGW5jFvw/4xiBuZe9CfBMKM1aroj7?=
 =?us-ascii?Q?ldNDOGSw0O3viUltqx2A8/+wbsd5ASJdJeI6UoWrGUQXg4slOBKJbD4V1VUC?=
 =?us-ascii?Q?Fen296qqLrLoWlTs+NzsQ3D7Os4pPMiBZygzix/8CHouJNIjITk8JBkZyBk9?=
 =?us-ascii?Q?ZnySWOEWmXPrfr2YyWJH4BuNkk1DrbqXmV0FwdBayImUQ/uPvto+TkyjCr04?=
 =?us-ascii?Q?dTVK2cir+x8Csya0W5k7dXa3xnWKFdZTxyZanaP+91vbBpg7Gpp3+E/TVLGP?=
 =?us-ascii?Q?lzQfyieK3SSyCEkcPjoswXc6gyEat3rPuewrvDDepKVN6g+rnIEcb/mOt8dv?=
 =?us-ascii?Q?Q7rIc54hdSlc+o13BsxUrlqOzwi7dMFP8znpYvtF+IvXi8frXlSyUlSnEmHS?=
 =?us-ascii?Q?+/xfP0B+0adLTlW2AdFQEN+02yzBfAmxYUPdUv1rOyNisCmXTo8RjX/qldP+?=
 =?us-ascii?Q?QMsmnN6Woh9XxRF8KY4Dyps86BLX8152gk7F1aifUhCoUiXkD2q413dvKox5?=
 =?us-ascii?Q?NjiXLVlrMWr5PqN2K28m6n2PAd1QPZ6M5dfw03Y8v3aXbaP+Kc+hbvNjyftk?=
 =?us-ascii?Q?0614tiA5VdaUZym2uSOOwqQPt/xF9rZA9VichrlqcW0nEpgxnhxQUub4vU6b?=
 =?us-ascii?Q?K/Yk6XdZ9jh6tvMqapC0AMjq9p+dPGkEa5alkqYZv/HzA8OCsur0K1xHp1mb?=
 =?us-ascii?Q?1Wmpu96Wie24ghtwoJ0Vs80fJ6pIXxOB7YdnfCtSeNXCGhqah+MEMmZsTrHG?=
 =?us-ascii?Q?MRcRd2/yemPlObhqdHJqvhPtyoUfheWg7gyaQE96El/J5Zar7mjdn9Edv8pc?=
 =?us-ascii?Q?OPjEyePr44qyA/l5Jwu+kfvLENaEavOH/wmWeJjrbts8He6TBz2UxCo1u6BS?=
 =?us-ascii?Q?w8m+ZGVCYeRuaGY0XUU3kJXv/P8IDribvWyp4ehid4nKKqaSjvg1ajyf8dOz?=
 =?us-ascii?Q?xvuxDnxDtws1UIOxC7oanofdI0egJNyBXVbkKHmpbcM697vkYJXKVkn/ykhf?=
 =?us-ascii?Q?tV4bvqpPv1Seay3mE76QBBEWSaT5QfjaFqWck8P3d4OTzwfNMljYE6GmROo1?=
 =?us-ascii?Q?icMfvJq4dGm8lMy5icLsvkjj9jkgh4jY8gKPGfeHizuQi2dq5HN8TO7riT3e?=
 =?us-ascii?Q?zScvWLLtQMXQ+GeP0M8sxTqx1G8YlKhyo+u3iN9bioMHA9q4SBtvOxWR+2LQ?=
 =?us-ascii?Q?U6/iTGK7OBnVNyeoQOE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4653c9e4-7729-4a40-56b8-08da926dd150
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 14:15:58.6515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qX62whAufUL9iG0s4rC54MFqJ0WYCaRmgiOWh+J1+3s44x7Af7iBTBsdJmkgBKl+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4651
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, September 9, 2022 12:38 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: abelvesa@kernel.org; mturquette@baylibre.com; sboyd@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>;
> krzysztof.kozlowski+dt@linaro.org; linux-clk@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] clk: imx: imx8mp: add shared clk gate for usb
> suspend clk
>=20
> On Wed, Sep 07, 2022 at 06:37:08PM +0800, Li Jun wrote:
> > 32K usb suspend clock gate is shared with usb_root_clk.
>=20
> So? What is the impact of not having this change? Why is it stable materi=
al?

The history is this clock gate initially was defined to be only for usb sus=
pend clk,
usb suspend clk is never off while system is active or system sleep with us=
b wakeup
enabled, so usb root clock is always fine.=20

On v5.19 a clock fix patch cf7f3f4fa9e5 ("clk: imx8mp: fix usb_root_clk par=
ent")
switched this clock gate to be only for usb root clock, this caused the pro=
blem,
as usb root clk may be off when there is no USB data transfer, this cause t=
he USB
wakeup cannot work because the usb suspend clock is also gated off.

> The commit message needs to answer those questions.

Okay, I will improve the commit message for this.

Li Jun

>=20
> >
> > Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock
> > driver")
> > Cc: stable@vger.kernel.org # v5.19+
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx8mp.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/imx/clk-imx8mp.c
> > b/drivers/clk/imx/clk-imx8mp.c index e89db568f5a8..5b66514bdd0c 100644
> > --- a/drivers/clk/imx/clk-imx8mp.c
> > +++ b/drivers/clk/imx/clk-imx8mp.c
> > @@ -17,6 +17,7 @@
> >
> >  static u32 share_count_nand;
> >  static u32 share_count_media;
> > +static u32 share_count_usb;
> >
> >  static const char * const pll_ref_sels[] =3D { "osc_24m", "dummy",
> > "dummy", "dummy", };  static const char * const
> > audio_pll1_bypass_sels[] =3D {"audio_pll1", "audio_pll1_ref_sel", }; @@
> -673,7 +674,8 @@ static int imx8mp_clocks_probe(struct platform_device
> *pdev)
> >  	hws[IMX8MP_CLK_UART2_ROOT] =3D imx_clk_hw_gate4("uart2_root_clk",
> "uart2", ccm_base + 0x44a0, 0);
> >  	hws[IMX8MP_CLK_UART3_ROOT] =3D imx_clk_hw_gate4("uart3_root_clk",
> "uart3", ccm_base + 0x44b0, 0);
> >  	hws[IMX8MP_CLK_UART4_ROOT] =3D imx_clk_hw_gate4("uart4_root_clk",
> "uart4", ccm_base + 0x44c0, 0);
> > -	hws[IMX8MP_CLK_USB_ROOT] =3D imx_clk_hw_gate4("usb_root_clk",
> "hsio_axi", ccm_base + 0x44d0, 0);
> > +	hws[IMX8MP_CLK_USB_ROOT] =3D imx_clk_hw_gate2_shared2("usb_root_clk",
> "hsio_axi", ccm_base + 0x44d0, 0, &share_count_usb);
> > +	hws[IMX8MP_CLK_USB_SUSP] =3D
> > +imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", ccm_base +
> > +0x44d0, 0, &share_count_usb);
> >  	hws[IMX8MP_CLK_USB_PHY_ROOT] =3D imx_clk_hw_gate4("usb_phy_root_clk",
> "usb_phy_ref", ccm_base + 0x44f0, 0);
> >  	hws[IMX8MP_CLK_USDHC1_ROOT] =3D imx_clk_hw_gate4("usdhc1_root_clk",
> "usdhc1", ccm_base + 0x4510, 0);
> >  	hws[IMX8MP_CLK_USDHC2_ROOT] =3D imx_clk_hw_gate4("usdhc2_root_clk",
> > "usdhc2", ccm_base + 0x4520, 0);
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists
> > .infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&amp;data=3D05%7C
> 0
> >
> 1%7Cjun.li%40nxp.com%7C0b734c6a464d48a1d5f208da91b88a61%7C686ea1d3bc2b
> >
> 4c6fa92cd99c5c301635%7C0%7C0%7C637982519075609799%7CUnknown%7CTWFpbGZs
> >
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
> > %7C3000%7C%7C%7C&amp;sdata=3DXT8llTcoNGJ3pHH4uDn9tOFfKbRyQSJTJEC6lqycE7
> o
> > %3D&amp;reserved=3D0
> >
