Return-Path: <SRS0=5HZW=M2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BBFC6787C
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBE3620835
	for <linux-clk@archiver.kernel.org>; Sun, 14 Oct 2018 08:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="nf2V3rtX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE3620835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbeJNPs1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Oct 2018 11:48:27 -0400
Received: from mail-eopbgr50053.outbound.protection.outlook.com ([40.107.5.53]:51200
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726362AbeJNPs1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 14 Oct 2018 11:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gx4LqPXlbBqpNw6wjqSDn7kTSbnzDCo2yHYBLzUCJ4=;
 b=nf2V3rtX44aMiIRXzcJaHWnef11S/ungXaN3z/aWZg4Z934alno3L/3EMUmGUNJSF2CjpSGFzlxT5PUc5Tbr0IaNkSjAgn+v8NhJ0Yr/Sig3Z/Y3AeoDexBPfZ716KQWUgeAGcBA/Dt8l1+9VUXj9RHhSfUw/rfQ/SwWrH8mxwY=
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com (52.134.126.21) by
 AM0PR04MB4724.eurprd04.prod.outlook.com (20.176.214.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.21; Sun, 14 Oct 2018 08:08:13 +0000
Received: from AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1]) by AM0PR04MB4211.eurprd04.prod.outlook.com
 ([fe80::25a0:3167:d718:91c1%3]) with mapi id 15.20.1228.027; Sun, 14 Oct 2018
 08:08:13 +0000
From:   "A.s. Dong" <aisheng.dong@nxp.com>
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>
Subject: [PATCH V4 10/11] clk: imx: add imx_check_clk_hws helper function
Thread-Topic: [PATCH V4 10/11] clk: imx: add imx_check_clk_hws helper function
Thread-Index: AQHUY5UNE4nlmZrVm0GZcSWfEp8yGQ==
Date:   Sun, 14 Oct 2018 08:08:13 +0000
Message-ID: <1539504194-28289-11-git-send-email-aisheng.dong@nxp.com>
References: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
In-Reply-To: <1539504194-28289-1-git-send-email-aisheng.dong@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: HK0PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:203:52::20) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM0PR04MB4724;6:GrWT2LdG0aj0l3gIfHWVLB1o3Mg5h/xR/4gaco2GwX7DDlipEn70yCW7WszGn1dkmiCaDDqWZwYdkSRkYZPd+Jva0HEo8TWj5R1u/KrXOVWJw5Bc1sVcWNBFWWmK0aH/WdK1D3CGuCHMcD+2NJ39hIMmq3Dg2sduJTrVmguVp2aWZcD7XPD9ChdHCD22CNa53JN9IhIBzHVqnVDNAiwnX97aBUwvJ3FbSIkXuzRfEuShIGoeuYNge83l6DqByIS015DsDmb33iBNq+4uYttc5GdK3iM7IcdMdPCxdbEfprke81JF50QmFmKpTAlYBpWXxXGeCkSGGAB8mJZ+d1x8LsSvnUHW55ci6bIDdPr/Y2yDsjOVdzjEANi5xSepuiVm0V30C5h39525740unRmkA86h5RauHX7P0ori6j4m//ZCDTYaAAL0xbDgWZ/wV3Ty8JhJs8PHNcYXEzaQVs3Org==;5:1RVGk0rtTJgJqAyWl3O99C/xtqdf3Ds5sh36egata3n+7nq73zOyD10SiL68Z0rkux13prTzVFKf+ANw4AnQNVmzZJOGerbHMw8W+aDfPiBlcltAyhzUNZt+BoTZc5qJ2eDJeq7ZM96ZVejyXz27xql5+AYv1OvmlhwjrwjXyFo=;7:6lHp+1MaK+g+yLXUZc44gitQTD2X2nIqnPuLs0XRAlrkEpDutEsOxSip7W9qmcnv0X8lO9J/v77MzZei1F4j2M+rm77VdwHRxHrgNukOD1Np95dyU0N7KQ9m0ykrhgk5fYMBoGiRBiLfKxBhQ3UCULlqnr35OXHXt3TGWN3L2VAyoc3RJUTxfrr+dfXfgOKweLQerzHoX9EccCY0YghXHyeHvrcVnlAV0jHlKqgvtmynzAFUZvBUSAZP6/UfsbbE
x-ms-office365-filtering-correlation-id: b8a66a1e-49eb-4e14-9335-08d631ac2fe7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4724;
x-ms-traffictypediagnostic: AM0PR04MB4724:
x-microsoft-antispam-prvs: <AM0PR04MB47240F8E4CA1166283F76C0380FC0@AM0PR04MB4724.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051);SRVR:AM0PR04MB4724;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4724;
x-forefront-prvs: 08252193F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39850400004)(366004)(136003)(396003)(376002)(199004)(189003)(25786009)(50226002)(54906003)(486006)(5660300001)(476003)(5250100002)(14454004)(2616005)(2501003)(3846002)(86362001)(6116002)(105586002)(316002)(186003)(478600001)(2900100001)(106356001)(97736004)(2351001)(256004)(4326008)(102836004)(81156014)(6512007)(52116002)(81166006)(99286004)(7736002)(5640700003)(36756003)(71200400001)(6436002)(71190400001)(6506007)(66066001)(6916009)(8676002)(76176011)(26005)(53936002)(2906002)(8936002)(305945005)(446003)(68736007)(386003)(6486002)(11346002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4724;H:AM0PR04MB4211.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: R6BxBKHGtHQ2Bik1jyvlK9BlNzGjT2nwr/mox4Cg1y1cBBZ3ZUzTo3PUarflxfRjIRtjsoa+Pjcn6ms3JueOtd0rGKc2B25+B1KxV33tfDLbDNDcqtdW+6U/eNhWAAevQMBljtJKr7u+PllX13HSxzQPvgv6qi7HtNEUtjf1a6kcaP7dnQ4YLjqtg61PqprhaVvuCgpqRtdCF5a7Y2ovLCuv7QTtrhGl3WReg8D8Z2XR69kTY8t/QetXWvQ12je83fpT+UkA0spCMABTzLzJ+rsXuYxsCYHqpkkfr2XIJEBE1jiObXAn6AfCfIZALS3VJO1a3UVUZYl4DU1++dqmEk4chif3cxaGOfYR+eiPFMQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a66a1e-49eb-4e14-9335-08d631ac2fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2018 08:08:13.1878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4724
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add imx_check_clk_hws helper function

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/imx/clk-common.h b/drivers/clk/imx/clk-common.h
index e3634a5..01550fd 100644
--- a/drivers/clk/imx/clk-common.h
+++ b/drivers/clk/imx/clk-common.h
@@ -13,4 +13,15 @@ static inline struct clk_hw *imx_clk_hw_fixed(const char=
 *name, int rate)
 	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
 }
=20
+static inline void imx_check_clk_hws(struct clk_hw *clks[], unsigned int c=
ount)
+{
+	unsigned int i;
+
+	for (i =3D 0; i < count; i++) {
+		if (IS_ERR(clks[i]))
+			pr_err("i.MX clk %u: register failed with %ld\n",
+				i, PTR_ERR(clks[i]));
+	}
+}
+
 #endif /* __IMX_CLK_COMMON_H */
--=20
2.7.4

