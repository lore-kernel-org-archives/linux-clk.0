Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA38C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02C0621855
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 13:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="em0o8QxP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfAXNWw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 08:22:52 -0500
Received: from mail-eopbgr140085.outbound.protection.outlook.com ([40.107.14.85]:20964
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727622AbfAXNWw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 08:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qebKJTDyXXzhbQIPyfxZ8fSbWE6NlUk74Ot9etjdq+A=;
 b=em0o8QxPToxJzO9LOz3ZgwI5KOctwRkDV9zPMCxoZ2nUH9p5rNeASnNfm9GJKhRRRYF0cnmV/v2ir0a+Wjuhkq816yIR7uR593E1P+M49AK8bggrb7VR3w9P4Usxh6CXqBHG9J1+XhuDG22hT7RxBKzxVvn3HBzSgeTvnoPBBaw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB6260.eurprd04.prod.outlook.com (20.179.35.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Thu, 24 Jan 2019 13:22:49 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 13:22:49 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH V3 5/5] clk: imx: scu: add fallback compatible string support
Thread-Topic: [PATCH V3 5/5] clk: imx: scu: add fallback compatible string
 support
Thread-Index: AQHUs+fmr9q1T9UkF0qCpEHsfoSQ+w==
Date:   Thu, 24 Jan 2019 13:22:49 +0000
Message-ID: <1548335800-6438-6-git-send-email-aisheng.dong@nxp.com>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0041.apcprd03.prod.outlook.com
 (2603:1096:203:2f::29) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB6260;6:mr6Vvx/An6VMGtVxO3bL7AT06gecCo2Oa5KzO9kdA37RQ2nVOTzRN0ISOnOhG1Yj6j4eaZ7lPHIA9Gve5OKuQeKpaQJeRGi/GOtRBXrGGibtNzv+N/es1zGtXNTxZp+h+f9auRuOklVqpWIkaiXwUBAX5Q2OXj43wcOsS23dB4YFrsYBxFlMWFnRd0/XF0IUZuwT3U7neMj3d4oZ/f/MEP1iQ2bHye1pdpz6UI3J2xw2vTFnmYOLENODTdTlfIML/Mn3BAROY31dOazqPY87SN8th70teyTysTv5hWE5IRCiTrNl+YByEhrKp5Ixy7CaefpcaqIRKiuq5P/dX0mF5i9FoIXuRSI1aE7xfFWUhDK1vZEZBEsYlq+1CmcKm22VR910mHzswkUKGZ+2RJ2rY46Hep1C3Mku2TeJSzyg//V15u3vC8wRwNcCIAxBBilSywx5FU7vfLeQaqOute+row==;5:Wa+olecvQZOHjYyjWMYnmDlVSnoK7S/pGlUd5llu6UVz/9d8NRrxk1f4OdAAXpbi9igZN0qVTA4JDRs2ZbBtmGP+rglHj3C/AMX9aKDLoLpIAMOJIlEH/TYMrxsE25YX+QBlr+jj89RxyMgWHHZaQaJLI/B/ATLFyXxhPmHRjINZmX5j9EmrwIPtuvWTqyzzcZgsqCBux+FuXYg8NxRs8w==;7:FaabpId83bJGo9qYug/vleaipY48p9q5Pl7kyfVtAT3CpZ7c8v/GtxTnsYH0Xkc7OtJLGZpAznqOJ8lrcy0pBUXOOErMUJUsmShmehZOeiIVHMyERh/rGn4c3AjleInNpodzop9cYvhiHfdG08iDOA==
x-ms-office365-filtering-correlation-id: 8130da67-6aba-4f3d-3293-08d681ff0910
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB6260;
x-ms-traffictypediagnostic: AM0PR04MB6260:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-microsoft-antispam-prvs: <AM0PR04MB626090786E33249F57197683809A0@AM0PR04MB6260.eurprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(39860400002)(376002)(366004)(136003)(189003)(199004)(8936002)(44832011)(486006)(53936002)(14454004)(6512007)(6916009)(7736002)(305945005)(50226002)(2501003)(81156014)(478600001)(68736007)(4326008)(66066001)(81166006)(97736004)(476003)(8676002)(2616005)(446003)(11346002)(54906003)(105586002)(86362001)(256004)(386003)(71190400001)(102836004)(76176011)(316002)(6506007)(25786009)(106356001)(26005)(6486002)(52116002)(99286004)(2351001)(5640700003)(71200400001)(186003)(36756003)(6436002)(2906002)(6116002)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB6260;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gkbjiVuPEc8sG9T7yITXrIijiVRmgq+fTSfUymTgayZneifMTdRy9sjEjO5BMgyBFBn6iB8v/pDstnEiFEDQsGXtETiuEp70u3CMQv0fTkiYCSIQhWNlPnPlcXah6tWLd6dGzj3skcM28aELuOV/XZHP0auqx8lo4dUnUCzxw0K6GxU/uzgRytK4ba+p3AJg6G/YSK2VDWSVnC7D4CIPkE5bKFKxVjzvvXsaQj0mAHB+aly0TLaAe89fpmlkSC0y7ISzNLpUFTykSI+CBtGCIHxtB4kOC9nJW/SGKkg6lxdqAc42aK1iPdw6AapB23kIzEYPquxLmb8ZesaP0vtv59pR/vDLEGJjxO4H04vOfc9AKd+zC0mqAlTJgLF2iHtm7CvthxItm9oaNb2/AEFcrQ3qC2FmHvm5CRoYEfhzCv4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8130da67-6aba-4f3d-3293-08d681ff0910
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 13:22:45.3399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6260
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
Make the driver support "fsl,scu-clk" fallback compatible string
to allow other SoCs to reuse the common part.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-imx8qxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
index 83e2ef9..5e2903e 100644
--- a/drivers/clk/imx/clk-imx8qxp.c
+++ b/drivers/clk/imx/clk-imx8qxp.c
@@ -138,6 +138,7 @@ static int imx8qxp_clk_probe(struct platform_device *pd=
ev)
 }
=20
 static const struct of_device_id imx8qxp_match[] =3D {
+	{ .compatible =3D "fsl,scu-clk", },
 	{ .compatible =3D "fsl,imx8qxp-clk", },
 	{ /* sentinel */ }
 };
--=20
2.7.4

