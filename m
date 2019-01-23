Return-Path: <SRS0=4/Ea=P7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF537C282C0
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:17:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A090F21726
	for <linux-clk@archiver.kernel.org>; Wed, 23 Jan 2019 08:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="H1ywkHD4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfAWIRX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Jan 2019 03:17:23 -0500
Received: from mail-eopbgr60059.outbound.protection.outlook.com ([40.107.6.59]:52480
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726000AbfAWIRX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 23 Jan 2019 03:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qebKJTDyXXzhbQIPyfxZ8fSbWE6NlUk74Ot9etjdq+A=;
 b=H1ywkHD4mym1+KUs6DECT+U6eRdgMNh4wR+6Ha15hLX3esxfcwGNIFvX6/Uw7U+MDKuxZqItL1vVldXjIiEbI0vlJ4lV7sLB4JvWy4Zuce63eDJWrM6Px4j/GeEHWCccBqbVdf974PxxqNI2/yAwPh2wPge1mX5ebAkWjIr2+Bw=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB5954.eurprd04.prod.outlook.com (20.178.112.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Wed, 23 Jan 2019 08:17:01 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::c4d2:7dfd:4576:bdd5%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 08:17:01 +0000
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
Subject: [PATCH V2 5/5] clk: imx: scu: add fallback compatible string support
Thread-Topic: [PATCH V2 5/5] clk: imx: scu: add fallback compatible string
 support
Thread-Index: AQHUsvQEtEwzWKIV8UiGxSMTJVn5Uw==
Date:   Wed, 23 Jan 2019 08:17:01 +0000
Message-ID: <1548231044-4344-6-git-send-email-aisheng.dong@nxp.com>
References: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1548231044-4344-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB5954;6:VqCSkS4oOBso+o2yJt8dJjKu7rtWB+58Ubi3gNiTcsYCDp9F5UUdL23y7vmE8+oV2n6126rkNI0fSUofb26lTA+Yz5k4IFy6cNsKaV5PmHQX47svYpZYaf7j/Bb12r8xiedjQPDO1UQfHh+kYge9DpGlx5+wANkCLVn6wLVNwpWjl+rLpaqJ6qgQizm/wpXFcZlhUeIadPjsutvT9XoXyhGy0gOJii7dRqQ010fuTEDseKLg/DOoS8qdVa4Ql/ga/KlMSZbO/MTc9Et8rDRauWVGDv1w5GUXiLoCuWouOa1o8QVvhfHsKskmUluynlkgsWK+jW70rWeTQptqZqQ1Eeh7TnydjC+0QwCw46K7F6nANa1bFjLKPra6+2w0LzKWJtsJu7tUQV0WgfWOYrjpCJKeQPZZG7iuATP39q/VYoRS4bsY6nMSzEAEOrr06WOzyb+Zck/mmgYnKzQmwiGpgA==;5:ih1fwBnGoLMvc6ZUopFaUgs3dxuvuB4hzxX7wv2ja31VEdPM5geVS6bu0aoKbreHrMKYve2qtA2WXmD+LfN7Eau4Q1+5bGIl9qgaxqbb3/slLhc1K20z8WBwcFYRA61MpK/g+YrY/suRI59gUHaYBWoZk1mcwm2tvLzOWRERAri581m2RD7WaMHi3ivR3t68aK4o+UtpZY39At1Nr4DVSQ==;7:nOKmXCOWYknF71cqhaDbScZFWj1n/4TGpICRm8D8pwjEiqqFOhuvNRo24SCfu8wp5yQ7UnmImStmhrheR/0warPAjO++zBEYtb/Sy3YtqKifJzoic1ibpKxvK0H9EgoFHkv0PkIFU8wc5b1q1QKAjw==
x-ms-office365-filtering-correlation-id: 3ab81a97-41ed-4e03-1d52-08d6810b26aa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB5954;
x-ms-traffictypediagnostic: AM0PR04MB5954:
x-microsoft-antispam-prvs: <AM0PR04MB59543A905EC84BE1169DE65280990@AM0PR04MB5954.eurprd04.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(376002)(39860400002)(346002)(366004)(136003)(396003)(189003)(199004)(446003)(11346002)(97736004)(6916009)(256004)(2501003)(7736002)(26005)(3846002)(6116002)(476003)(6512007)(486006)(53936002)(4326008)(2616005)(186003)(68736007)(71190400001)(86362001)(71200400001)(52116002)(66066001)(6486002)(36756003)(106356001)(102836004)(76176011)(2351001)(105586002)(6506007)(386003)(5640700003)(6436002)(14454004)(478600001)(4744005)(25786009)(44832011)(305945005)(2906002)(81156014)(81166006)(316002)(54906003)(8936002)(99286004)(50226002)(8676002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5954;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iFqQXbqI9CyK3COSncPfxtceLiFJWRsmIyn05LTcVZv2L1AB3mSiLV69t7a46+aKEDh3QWfTgEQxT1XSp56LLiOFFm0UAvMtdKxdVftCLVgYxnc0cVeO2rq25nB4RutB4Ty8GJ0U03UzgKY3Lx9Vh7znwAe7XElJ8SNVbLk4SQEiiLc2qp1RighqqaPD9QD6/VbsTTy69T57BIlgKEk7SOsi7j4P1kZm/JhZbEG0jVcm5dvRgofPmfI6sxiikD8TH0Xi5uAVanRU8slKkAkYHu8TPOVYI/prXuBPBfUTbLczE7+vPqZVktBIe4xxn5XXD+J+71RAyF3pqJLkomeRabwYFjhPzzznAprE+NHoTIeL1fzoIcCch5SovDoxPxDUl3CH/Op5avQVquD5Ci5iBzmD9SZ++8FO/+9sq8JYmWo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab81a97-41ed-4e03-1d52-08d6810b26aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 08:16:57.4372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5954
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

