Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6D4C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 17:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCF71206B5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 17:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="dH17kSkP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF71206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbeIYXIY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:24 -0400
Received: from mail-eopbgr70075.outbound.protection.outlook.com ([40.107.7.75]:45688
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXIY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmrjpGZzSNuysmqG0Y6vdkoZxOK52GJWVWvQkRmVFNE=;
 b=dH17kSkPxFoR/ITJuAhBqm+R29mXaUi3biPS5whmtBjuL8JWeW/YQag0O1VW9TM4GCvRa3oOS6QCtsfMazj7r19jn2bDkwGxOVygJdynLSW2HddBQ7uN4NKdJ2FUmM0hRMVer+opatj7UxQFfoSORsr/iKuGaFgNJWoPoHG2pZM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:35 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 10/11] clk: imx: add imx_check_clk_hws helper function
Date:   Wed, 26 Sep 2018 00:43:56 +0800
Message-Id: <1537893837-31172-11-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
References: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:2f::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03e78e7-ba70-46ff-53ea-08d623084729
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:GlCzbXZintczKVHzxZ9caTAmE+N4s/BzpkI1t0LhvZTfhkEXyHINezYvp47g3VJuQZBergBjCmEXv+8RSgn4LvryIkZFektVCeyAZyPl4o0qA3jjDG7p1/VmiNN7qjqJCpYRL/EUNglhNYc7r7g8z5OftO7FEM+3hXemzp+k7vh2XvMNEKzdbPKXIdZMHY8lhtyweN3MIy8wsQ0NwglL2I+J08ZSrl4An+3dWDUa3z49Asbmu+BrgGH9nnlW1uD6;25:ME5MsaiGkripUAZWnQopSioJK4kULhQH09up96lHe2zHyeJAhJcX2XVGWUgU0yGxUOAZuG3DCKfC8EVZTw3Rf9v34VMqN4caL8WlJyTeOG0xLYsPiS0hWKnYDdzflMqUJDjN894MBLvr/nA7pe9BO1aZiSe3To0EGy7Kqk3U+BOZ8VcXevIPktyiLwCpK5Q5nwTghSbSZ5t8NcmFJxQRpg+dOM+rZUVuyv5q7nNqAsw0wTS5jZXRKEbOtIIy/Djskb95pcUMGJtKlFhPqXx0krsIP2gCQYZmgWbZkFICfl9JL+cjp0sG+F26ZYATwQliDFkQB2QZKbz/iNYRfhbwFQ==;31:hipH/1xyqMSAK3wG98o1aDDpoqWwepPTdsC8b6O8T3F3IMk0V6HIIZrVUj5adL/96i2cqsGo2od7UsvZ9CZlp1m9X4IYHWeb6usRNjR8t0uaMHbbsUc9mHlOmpjBJ6Blmc0ioV/fdjADZGIZXn+aeAH+aLyJ7asy7WbOZrcckP0P9tC+fsbzG4FygfzIySkvIS4qJQhPFoI3Wq6H4iOXsnQrisSpZV4ph/qiGtJWBlM=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:qqORAUlr/Y7XZs58F+Y21JybSIfV+N3uz1axAXlHy+EvqQvmI0bIbWN/+hXlcJ5WV3R/5Tk+9c5bXlCdXTqNbPv5e7xTGZePbOq/N1OhW5ltO17Ewg5g+NHuLHmCyh2419zt/gBrbsz78HlUm4qeKqT6XWkHyQyRsCw/BpGlZ73xTu7+VNBgtfhmJv+wDrZ0twShqf91PqMUFuuxTuU0L5ORY6DOJ2uD20TDjNNOKAgFD2PtAlkgwZt7kzcnsiTfaJenNw5JSw+8GtnjVmSJgFm+Dwy2V56w0qPeR+s5Ho0XjrwOHxTrSLMBfia+zXAPsKfs6DkdMuLZNjO+DweqvVkuSLl2OCjweJy79DKi099xsg10ij2S3HvTs9uKZlX2QAYrl9hriWAIBkSA7evNiACjaAK1xXtn1kmtnYRj/TvpBII2YeGrdjHTh3cDznz+ShsYR51jRX6mwxqIiwNNA7DfOyK35NmvtPjl+gD/xq0Pje2PQ5/6wUvTjOFJRzba;4:N93iFyNTe4FhUVGGP+ajWxnXkacidIMDmBFU+15r9GufTThEJR6vvqm5gitn74G+754W5T7p4rA4lC8v/3bHmkHMwkMe9bF0vn48PiEzLWXigOFK8KxWWk5z+Sdcs9PmqnpiqZqljzyXbJUkdSUv+t8L2P0nr9zAACiU2uKvbYOPM2rNZAQk26a9lwG4qo9nTowhsr2ifyx9E5wUr9iBx9EOWu2ITy1TePX8A+ZedDl/0pBPhaiCFvAx+yi7B+RsAFYNjKLCFLP3J+luSs8HcTOcNtF6rzJoVgj/foSnT7Z0xWvuud35eI7zwYT5eg2U
X-Microsoft-Antispam-PRVS: <AM0PR04MB42115674A8B65DDEBE48F5A280160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:722Tl/mAoaIRmTlbfwON7PLazh8AopegR03JPmNnM?=
 =?us-ascii?Q?lBSnuMDrpSmaH1kx9zKtI7dXs4jh+Ql8HHscLGQvHAJ7ZIsjk56V98I+w7bV?=
 =?us-ascii?Q?iOXkq3aYDzqFjuIhn+q16grjiQL9KLaE27m7hJ4Ymyn3dgfDMXIZ+iaJQ0bh?=
 =?us-ascii?Q?cMCKaF4vyPfpRa6tiJbxE4WIGtiGZ8gKsrdM/vyvCxvdya529gd5JPzj9AuI?=
 =?us-ascii?Q?3Tb95yb85/A8XdC9nuBQS1tILSMjLWBJMG/yVGcSC/mghJdzzJpQTt45SPsh?=
 =?us-ascii?Q?R+40q4y5twfAdrOmq0BbdDor6JUJoSnUjkRJrfKbvqSHTfwCdNVlxmAnwM6k?=
 =?us-ascii?Q?2UR/HOpNcFOIB8O1y4aOiI1z0CIypkdHFOnWsFBigg82LBjvBrkOjrPtsi5s?=
 =?us-ascii?Q?ctV6fyU8jmm9R4w/QZaXJyNz0i1mEbQFq1VSfecTeAXeKeLTDTd49HVxSTpL?=
 =?us-ascii?Q?0BVbE1vjNueGZFmnfqv/rdE/73DA20i2Ek/TZXsI1mOg09wFZlXHLW3UySnv?=
 =?us-ascii?Q?D7V7dBBpm853MWmv9bE53GURrpHx6TE5OPoYjgUDOASxZ4qRZ57Gl28ijGfp?=
 =?us-ascii?Q?sGexjLJe7nRsK76yNhnAzbg13eGu2bIIH6ZZ97yay7skRH7Wkt5gVEIp/EaZ?=
 =?us-ascii?Q?2zY064iRKLihsaLb8G78+bo1R6MutfMKMI49SYx1mwdzwW/TPSI6n2J94LgJ?=
 =?us-ascii?Q?IDUhbdh72oIUr4hdN3CfYKxvWIP+R8dPL7dCahZWiXeVYdJxXlmV5VeMOjSJ?=
 =?us-ascii?Q?4eH/TpiJtp7+SqO6zizFWuaw6jgpax4UbGBrc+fYCpY04utjT+7ZqL2QfgXm?=
 =?us-ascii?Q?fvTFi+x347hFSQtWRnnLobPje/iIxSsrjL+sCPWlyQVHzPT+L4gPOjW6eTqx?=
 =?us-ascii?Q?D0BZXNUcPNxgKXSeLHkApgce/DIqUA+nTfSRGPrP1fcB0raH1zO7o/BwBq2X?=
 =?us-ascii?Q?2Dv76bjYtkej5iMpsVVc3EuYkbxn2CGQOxJv3pbY9ipfLV/JHDbxgmjulgun?=
 =?us-ascii?Q?7sLWQmdoHkK9Kcv+xx7J8bQ4tfERJsAU6U1NUdiDbWcBuKJfaw2dXRHWx9Hd?=
 =?us-ascii?Q?E2TapMVFNzx6tjueD8bZE2AR3GBbviZblswJkp9dMRJaTx2D4VsBs6OtoswF?=
 =?us-ascii?Q?tbFsqDn8eUyWRNV7D821upH/RnPN1AhpDVWbtXb1bsbuXcM2wX4bkIUKjUfX?=
 =?us-ascii?Q?h/YMqxxnCENTY+kA6w0r7J/Z9e6Ijm5WJl0tAnzgDQmrwkkzuNkciBNQw=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: qfxTOaz0ePInNNiZfCVy9jpMkn/fw3KO2X5QmaIXKEw60Je9+q0wGerxI6pJSbuPk4U4yba5pBI+N09FTrRwJJ9PH1yKTcGSVT7g9uOXrF7vZ67ZdEr7yGjPZnD7Zr3ZocIJsAgzXp+zN1hL0+S1nF/HJAjIlavU79D+v5SbaOZmxMI5NTSunW2bKZlIEF7r/liuonYmY19cOfBeG+t9Sb1bFD763Q2h8R3gkJV9lnvMgcvazOv5oH01bE4z+siz7zjZ5s1FFMw39ZDcsh9DFZsQvaPoAwaoAgveRuXlCTlu0dUCFKW8l8VfeivEEzQCVGrmSOu3iClHaFkfPVwOpoBFzbDBW7yUXnf5mVBhzz0=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:Cv+FdooR/9Q5O8pmwOu1eYM3x/XfC6h9/k5eIjhubT3ZbCpz1E0O6vCUYFApoItwClOkG+TvUd08ZzoNscuMuQicv/1vk+d70SPI9dAvu/fmCalr3S0vbS3Z58VwWJiaQ/Z4BfpRai91PYb/8D8KTsahWYfUwAsWVrRY9ShhRY74yKRwkn/UFe9HU08QuePbOUGk8LvGsadWKN0X5XiehfZbpSUSTNHvk75ko8ozfO/4QrSfPQnJXlNOjo6V5bQ5wLmFtfiebSSLThuLz9jnvrfpANT3Hi7IVSiW5uyqh7hzD/nHbffy5m1zs4zPbabYj+eHPMM1SdOmOFpf8GxhRTTD78m9mafnSkpLHeSkBVHQVFG11lgkfI6yi/J30QGKbpg3vrVtv9/JQeF/wUbqYZlPSu1okEzU32ER4SqLKUoFp53DrF2dSHnmJwwBOuhsbPLsUfs5iAdRIOlk9sm9Bg==;5:vJMH/T4FuW3pZBijvCg4kRTLHQNd2STHRPweaVG7bqcFzO1no2HpaAS0Q+es/WBGLD9Rr+/f2fk7zUDGZJ/MEOoI619pZtmPBikVNBqRqu4Gmyoi8cyZNodrQ90SrMs+y3W6xq1OXzODOiQySqywnHNTn6Xr2XKgLBG/RBvl2LI=;7:dgWUC9LzGMyxaN0tHXXUbj8UcdqDQWVszaetthDmVhd2mv7iTiC07l0rWWlgw0HQplyPYzFIVK6PGxQ4JX5SqkUQBnSEZRTFOtVm96w/Gs8wZDodgyWLIYDQ0Cn/F8ucBlOabrZEqNCKgHer7l9LQT7mmHmAC8tty+6vOHBhlVXzxCfkNiWXr42wr4B/KVXyvCZnV90iyyRHBKptvF50nC3idN2zernzRYQBsWqe9Ox1KYgEVMF7qMqfI/DxELAP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:35.0886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03e78e7-ba70-46ff-53ea-08d623084729
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164356.9iabsoaN3oo1LGf-JA7Vzg8ckO6kaXxsJ6SUnP1KKHw@z>

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
@@ -13,4 +13,15 @@ static inline struct clk_hw *imx_clk_hw_fixed(const char *name, int rate)
 	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
 }
 
+static inline void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count)
+{
+	unsigned int i;
+
+	for (i = 0; i < count; i++) {
+		if (IS_ERR(clks[i]))
+			pr_err("i.MX clk %u: register failed with %ld\n",
+				i, PTR_ERR(clks[i]));
+	}
+}
+
 #endif /* __IMX_CLK_COMMON_H */
-- 
2.7.4

