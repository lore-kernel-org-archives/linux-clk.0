Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB31FC43143
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A64FF206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="R86sTAV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A64FF206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbeI3Hms (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:48 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3Hms (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmrjpGZzSNuysmqG0Y6vdkoZxOK52GJWVWvQkRmVFNE=;
 b=R86sTAV+DEgfGSUkfOKQ8fLfnQOOEi5QSxxNqvJ22E978YiWPd5g4b8YH44UtXGwxUjDw3lCDKGXCRNnJO5rZ7WNX3HKuhpK7g9vktR1dZJwQ85PViZClYhFtBpCfiHfJWd8P4uu06jNg7nAUdA5nYPao3vCsiEm2650o4HMoeY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:44 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 10/11] clk: imx: add imx_check_clk_hws helper function
Date:   Sun, 30 Sep 2018 08:56:25 +0800
Message-Id: <1538268986-24890-11-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
References: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To VI1PR04MB4221.eurprd04.prod.outlook.com
 (2603:10a6:803:3e::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f504f64-e0ab-42b0-fbcf-08d62671b1f9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:ovDbQOnbK4tA+emBBBjjlJdTxBuz54KInNt6dbE1pjjrDt2sDFR60WmqjDnCz/jUQRlt7lwBb9+HlLVFNcb8XR3dw/1dKPzg9xERoAKSpo6Ef5YZHDpTwryZbnAdSDpi0PEXxxGJorqmHnbmDZGFwwfKXkOSErDovZ4/dLAQy+i7q2t5LP7/WifqYb0FjCBj5euTZtyaZi0kw7dDPjOKOcETsO/eVvFhZPzsiTvPZgynKgXDoLNYGePas3Wo0EVk;25:8reWSwDCiVyYyFFPLqUFVhHgYYxOva8BI0qQnGh/Z8ATdNt3NTMO1NNImAOROyL1/P7yP5jN/ayQkX2dxyLjwSUalRpiJTOrmKW1ug4PlUVj3vZNZD9VVqMgqwKRU2bytL0Tkw25belaMd6+trcMgQ5EDGU4r094km2v8PEjdroabhJJhmnft+DnxaFnPfxPgoAC2HTW1XF1RqZlBvdW3tuvuoRNwaIp78/KqAL7nFDKCKyCvjXJ74cTNJ9Rc7XFXWg6OrAVqCvkVjIr9Byut2qBTvDxto0h4+yDO33zaZzp8C32wqSf0IQa4UbqaFYlOK7awQGmoTS896xlwZ+u2w==;31:GpZUEGokMsHHp8FhstpLgZjn88EqgYRnSfNeyhcyvgYYOwn5Z5YjfonbSOZjpp82+hlR5lagNngPJEn+mJsAuZOMhsBPnOkMqTi9c6KyxxY6TmsSIXn5T8T1JiiZ3+SdsDDc6ZDvArcxgPWWTKXtXeGfiAZlrfbFWZEFvrsL0Npj3sEyL5fxnPprG94ZlxSCi/UY6DsXGNcYFco7HJXk6BzaYi7AYhAdxHOwkey4x6Q=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:DDJ/5tm7uSLG5X7bfNp0K82ff/rDILvS3Dco6TP783UuudY7eeB5YezL5sCxRZqDrxaltgfbumKThe/CApOQaIasMigeDaIWW6u/XnijDdkuaC6K8a2qmb/bf94ENDpdthrnGhRWdboe5tS6xANQEio4j5GX5ETjcBT8mRjRLvaMVViO+7K+U9NjekJBSchIMcmNu7wOcbV3Jey7Vc6Xre9OqD6cQCBM/4JIqIKCrcZZsx0Cqk1fqg1gaHK+F5R9BVi5aum2xQDjhnHSX4fbKQw266UX0k7s0Fpia/jeGmxySsUaYNkoVUWhgR33CYAfACOE0udVOOuJwmUleLrASWJ2WMn+jked8uMeMCAj4wka2WCKoTx1mS9YHRU1uSct42Ymwf/74HAkAzJsRoMgJqtfE2hKgq9SFcyTzaUFrLB6XQIvXK3DcR/E6Cghd/SN6LliwlFOBCtZtiFoDSEjC6dClY3Qh3rx7VTW6WCahT1wFlCucQ7FyoDZkXDZ1SVM;4:WOLpOpV3elEPHSaLFvMhxmfU/3/8I+I3r5jT3taELNJFshYNtw6poCiBqXHbMTkcBndULRKQWkAvcm51zMKMfAsGKZPQAXPy3Hg5kbgUOkNFNfszw7faoo5AeUz74QpZCFqkt7p4W9yP4eJ/CQwlxoJ8f+BVW0OoJVfLI2QRHaUV75jzExU9HtDoN590lNRuj4L35nZKDbtmcOJKXj5nllUMPhOk1V1mGF0LKd0NYsZjfyKxz1eOhPB61Is9lBLAa3o5ks3pMqk6j/smvfS1QOGEZxHvouhh0uLvD5zTa49+HPaxaL9KvPjY7b6ZpI+u
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221DBC62576013B9F715D0580EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:D3Ncly/XFRUfBvqHI1yGnrl9JMBGpguIOmdRScTL6?=
 =?us-ascii?Q?MRFLWBQxjV01AbdvKAvWOWmmQN9s3xUyfaj8k81sjnUHeRQAi69MeW8xxpcu?=
 =?us-ascii?Q?a1FRHHeabm/VcxBd0ulAZe16h3fihugZYeSRPYzPfINkribjSHmbAbPpyy/j?=
 =?us-ascii?Q?B/uBd+W+kv8lAvJ4Leg66EN57YjUayVJpGxGP7xGUQuQeoYmCgdfcCB02MMD?=
 =?us-ascii?Q?LtiY4WRAsrGd89sJ9Z/GtcEEtfCO8pSzuAPJUy0FzrUp4kkfPUlYJ4zbM2yp?=
 =?us-ascii?Q?fzyUhuG1iVNx6PlQLqbWwTLCLMoHnQyrU1eMLFUk2ON2oyA+VlUgzJHNrXlD?=
 =?us-ascii?Q?lxPSVn6AKRryupdtfHI7bcyAutyLQSW2uXOKQEyOIDzEUfofP7Kqnw0oIoU0?=
 =?us-ascii?Q?pqtlpz6oV+n78L+tnHo36ZYMfm0xGNV84ZO5tcKkNnCuyvmu2WeEj2gkdEJ8?=
 =?us-ascii?Q?fISFZzbqiOWJnTye6SCQLVuPk+F6amhmXO7TDknLAvg/6SJH7iLa2w/oBNS1?=
 =?us-ascii?Q?sJtx7+wSnx9FaKfY3lZUMbSjozF62RB/NZxdqGQOOxhk8mPXHNvaa3swOEgl?=
 =?us-ascii?Q?yKlM2d6c76ifBnLgrZkAVz9r3vm5pJeVHZIhOz7NU4Ilq5PLA17WqW14xM/H?=
 =?us-ascii?Q?+jyd3ew2OGTTSfWxJFEshqn9ZtT9rScHrYafGrOn2ER8r+XTASBP2qlBqMnb?=
 =?us-ascii?Q?nDRa1A9AYO7osJXmJrksl0EfoXSC5JlcFmnVq6ZZPSdLzHAEpRudll4p2OOp?=
 =?us-ascii?Q?k31D3wInloEwthkVElrDveIbGIGogj9WI4/yylVoSuBEL8+cKdj/KDxqc+p7?=
 =?us-ascii?Q?G71lz0ylCRwE9CoHdmSA671HK9JQKPOPQ9bwAImzklhoUp62dyGnLKVwxAxN?=
 =?us-ascii?Q?lIgciYfL52JdZLVXrcFErWzY192wEXvb5JV6rkjGco+laj5MnpwCC3j0wJnC?=
 =?us-ascii?Q?RPDqrPy1oluKFWt4dNa7I0ylRBbU6JmCLMzkskP0X1G5kvjyvVIWyBeF3Q/6?=
 =?us-ascii?Q?MdN5YmMpd7e/GeUMnUd/EsrYcsRHSYGFtnymTw6YpWxNAivYuxYGiB1L7qgu?=
 =?us-ascii?Q?Dr5w3G9NEUJbx4+AgmyG2bxTvq4WAsOaO1WEqdw5WBFZGX1UeOKH7poqAWS6?=
 =?us-ascii?Q?onEK/AILS0IFkIk6Cad4FLgUjmMWQZukAi2/T0ASnbzOTCRJ47N63Jfsqqwx?=
 =?us-ascii?Q?thygw+Cs3MF66dXZJi9dPhMxFFR2KbATou6Ll5yneTJLOTQ5f727K8QbA=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: dNfdrglRK4c4aydHVprK++TteI7d+vbmwsIA6/TNjh3FhEUp4j9+US2g5JQWJjt0mdCDo8C+PGnCOXRZ9JqhuzZ5KXe2Nqxz8p9B03tRfB9mRxdIxUwvdLXR8/0zCsd9qz7JcqvMNt0eVAZzH/ryUP41xw6KeCGltiJYIW330VSLIer29CC+BTFlb5HGurJvxwso4SJWjltdbTOC6PNDq8A2tevfFWMoobPBRdh38jw/oK4+kg9st4wFUfp06eGhOLvwv9X5eOj6nI010yYjTi4q6OhU88nf641sYbGOv7ay17OZYgb/d/Cb8n9WNlpdm/ggujUi6nwvQzyCggYB1nGzGJI7h4IIUnEAHkqofOA=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:mwVcHFvVFMcSDtZlTMvGbolvHVFoNJyzUAEL+Kfp/lsP0HkW++xQpqymx924/+2jMm8A9u7OFGe5Fs3eUlPmRoT9fIGClKGXOKfcAX0EpyDRQIegV8EvRVHE3nr6Om1sk5ztH/LrtjmIS6JWbfPXSp1sL+cYgeqEAoGT9s8fxQ4WKAeaAgzb7GW3t0L8bHav42/4rnsPzJQ60W21DqUCYQ4cr4InVPkeX0VZ5ZQJvlFuo5y0kiIw7f98nkpEQnNQOWiZUTLc/cF8X3wgJ6ys7hqJjwi0QCJ97nnFOWnlh7umM9q32eFSdvAHn0ufgtM1XHYH4QcSdQ5hx+yklMKMP7EGwzQ8RmDucouFyCPrrdirYby+2T7C9YDZJ3O8HNnytwiPOokK0Y4l5DOKyvzKicIAXObMs707XP8nDRPqBk1DRYKx2Al/vCyP1M/EWfoEaFJjS/535gMAbiBWzRm6Ng==;5:e+tsE8oRNRZRwc4aTuDL7+3ihr7+Bgcp78oNIiIMfaEL+WAM6d5EnUv36/aMTS3cQFQ/HMvLY01NAMo8iY3og+kmuR9oqfAZLvSeua9Z5/tO06Pg2yRSyz0/i/ZE5hhcpCc3DjzXGLLX4VkWMe9jqA/A21X5qIdnumnU8/LAkr4=;7:X3GbPCM6jY/U/fhmv87yArxSnuuHfHlWX/vWiNhltWW3UT2kNyu+YcF+gVQ12mVy4So2dpXm/u5ysvzngBjxK8p7pBz7vXHGKDnjjYSx/wPW8WsbpiO+de18turjY+BcTO6R1ahi6p1B+SC8esMdiE0wpbrrzBy3ErIItfTMe1y3O7gE7fZg1sZoC0ba6hDYv46eQFIo12jyg4F9+fq7oKrhErxS1q0iFh0Sy/Ozyd8GzeZ+4d9d0NpvDHObXw6/
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:44.9303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f504f64-e0ab-42b0-fbcf-08d62671b1f9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
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

