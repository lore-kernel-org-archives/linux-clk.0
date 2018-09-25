Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B24C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CE4920676
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="pEO2dxcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CE4920676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbeIYXH2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:07:28 -0400
Received: from mail-eopbgr70044.outbound.protection.outlook.com ([40.107.7.44]:61984
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXH2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+dZzKEA3GrnLSrBOQWivTWqmE3jsLuEHR7qFPkOTUQ=;
 b=pEO2dxcdmiuchNbMjhWCmyMQpt2xU9eTpA3VXOBWEhAzlj18pahVqP0zigrC67Yt+wjEsEDXYhIIJu+Ed6+j3JcKy8clDcXksxebQat4aRABOGrPkawgxuhgC9WUc4H0EFylh3t2KlWZe7JheBHOzsNwDFX6F4TiNCwuRpZk5BE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:58:58 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 00/11] clk: imx: add imx8qxp clock support
Date:   Wed, 26 Sep 2018 00:43:46 +0800
Message-Id: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:2f::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b064f90-1cc5-4137-98a7-08d623083178
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:BPyzsiHuzDpDVryAsnGcjdwxRX7wxZF5vDK6mczHA0a8Y977ANas8KpPGN1uux+PwrGxMf4+YRLRxvTJD0b+rD070DSD0fhx7A8h9aaxQf+Q0YwZOO3Phf2KbkMiHN2ZUBW9oDHt5+apGsyXA1hUlIXkJq43p34mX5td3VJ5PN/s+Ffnj+5ohxkAZBQMnJVNkoghpsNFXpc6+SPsLbDOkiBq6s00b9b9qKY+0yNu6iOgSnnO7+1mFGsMo0A0FKg4;25:lPqldlnvJNO2HoXi81aEMk64koK7ObrM/6kvJrjw8PaexqfbclO84jAntpyogXatkokh8lzBMJ7c/CDIk5i/u2993C6nVGr7vzGJRMgW4NaVomecF7u4cibdiWaDqN7F68KOuP0BueoHRL55FK/rxjFuh3uDp0sw+oCRA1M4ovVYDrR0RBtZfwqVrUPMXfNUH9PAYT4e+sAijH/HWvZdoIXAkOUNJpgPNJqrI5Z6Z77mtsRAkkpZHN9iBTxQq3N0nwPZEKmwd0+iwhR9yO2675m3hX7zqaOGUI7l3YR+q8e2znPB5r2taGl+tERiqaAnxQOomultD8oJQtjrtbnVug==;31:OFf91Q50zrBdk5Eeno2bHVaeHRgZ5BlkUOI4EvwbjdxAoRZMEMQFZXDvinUb9b6qkzL67VI7811Rpvcu9paZceeUssDjxOaIn2Pu1ZQxeyO4+ciYaRw5ajAlYLl7EKJmkOwue7FEkIspk2sb5vhhND7sEYY76s69Qbtr/MyqFIETwZEkUqWKLCtht4B6fzeSmfd7aiZNyxrrKOLhjwTQDJDprkL1EnKmWN9odiF8XP8=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:yb1OFKghhooTFGHPImkge/bXdcEOsYmXzwNsRO5X+JHyEth5B/gLp1NtW0ql5Go4qDkwRPajUVJp12HwLsmXhIMAFtBKzCDIfOJzDU8S7mg7EMqBYrPofoTPZT5cotyO45H163oEGjrEo5RXvHGeJIQbkLPaYA4gFrxDFok1CxpQqy1DaWszcZ840qJ/UvqW/I4lpo78CEWpvWqQaQXVSes/N0Rn/fgair9zv5DnE75tpoX/swJ+VAtI6gMKMNb7IvojoYCqYwN/J+qVQW5L+YxuebhAq9WAnAtBeiQesPC8Gp5VjTQflbzv/pbqYHQL+8mcWj3b3V/5964JNnrfZTuWN8TF/2k+QXpKZagRYbbLI/KKeOrgniHWNfSm46RIwCFCOrX0xp0/l9ywoPATCsz+LHxHiuAiWT7uRBMotKIOHEK5+3XFR3nay79sed7TJ4zm65ZQ+JT+7aUXIWyKRbuSNLQv1GXmI1llIoNlxijnrpOhpkRGOBSIEFHlMkQt;4:1LfNCqSHaeN675ghfvB/IzUC6F8J3JGhwcFw5P302novIl02hZAfuScNMkrgAfEN2cMaIQZy2RIR4K29rrnTxalWf/2oM61+dSqEyhE3URWYAsqU9nmPlg2zOuZT9UpIu/ZMR99hyvilYtWBUy7kHhFV3CoWwBtuAJt7n0IB9bo/nDEshzacgCJP/uHKH4fV0ojI08CMY+RcUaXfriC2RQJunp2+IY+zOHmX2ujJBD54tEH3o1001POmKfnTK3E05V0koE/wZY5DMwwjKags0A==
X-Microsoft-Antispam-PRVS: <AM0PR04MB42115C0535C92AA69014659180160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(478600001)(6486002)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(51416003)(6506007)(8936002)(50466002)(81166006)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:Q5VT7fpNSp7fb8H1SrKHj/Pq/mDRvy47HRSlOPyJq?=
 =?us-ascii?Q?E0mOo5jONpLl8jxh6HvNnYfttj6okEVb9NcnjmLdqFyZ9vHo8Fs+LteJmqlH?=
 =?us-ascii?Q?LxKi2ayUzYvAO3aQRkCVDnmt6F5N2uwHHYkwdUAbCAfa8TlQAHVeRGeYO7I7?=
 =?us-ascii?Q?a/27/jnkoU11tVbPDZpJXIvlGG07bOet3uSOTO3AWOq/TjTT6dBQmJ5jIOHO?=
 =?us-ascii?Q?xPNpNd85dQiqfeSsLtgmJJ4eHO3Sg1A9UR8z3fpYEAKKq/jMO5QbyU/I2+d4?=
 =?us-ascii?Q?uhtVBf3GNVjV5e7gIdmTQ+RX9BI9052bjelWaYcjvIwEdV3c/eJdecnxEch9?=
 =?us-ascii?Q?O0nlzX55HzKxQxJ860EES+Y8odsjsnl9FkEZfLeVkkmSf258wHWUqBIpna8c?=
 =?us-ascii?Q?7G18jBdgCALfrO4lwsAKgZRhwBJEL5iugG8Fc9simOJ3Ku+dDLLzoqE4GaGM?=
 =?us-ascii?Q?45D1FribvSamOnBeseipG5r2bIxp2rMQ/5kgaUVaUVFP4SHvAqP9aCeTI8um?=
 =?us-ascii?Q?7OuuQvBhNe2lsrN7uzcMmycFpgvIsRkcnj8iSAcEIcHuCG4RWrtwoUPdMzEc?=
 =?us-ascii?Q?HJidm9PQBXcxX3rzIUHrnxy3ke0Kp8MBYmhZDZ2X8qiSLe9QUHeiJbO4wZ2X?=
 =?us-ascii?Q?AZx94i2IWQMMnoty2zH66ED6AYFaSG/hz2wAA6qktA5GJqKcPWfP7Yc+zam1?=
 =?us-ascii?Q?raE6hf7UOgnGJjfFqxUk0p+/om7wgj+SFc4NKnvYKqvjwjDu5qODpEjU7JNF?=
 =?us-ascii?Q?oMS9w2atVV/WTMz2c+zb01HWfPdLaZcx19aPqdgoB28JIkiUqNn5C7X5chBc?=
 =?us-ascii?Q?NWpqM4tkdAjJa9s/brhwbeiszA6Lw0+TztmrL1XGsuPVZEZiG7SRxReWrbVz?=
 =?us-ascii?Q?cL0iYvwSW13kiosfnLV60/1d8OhyK3bpIpiTzkxL1YmStpC79YFcz2EnBSVY?=
 =?us-ascii?Q?sz9uBjl99RfE2IY1/fA1b/BVS12YZCl5kToN2Df/88ybYo5Nr8xVQ9lslGMg?=
 =?us-ascii?Q?5y3GcVlwBUseQLvnMTD6tqH/2XXY923ytbJV5YD3VSDEqhptPB+mDEOpNwGP?=
 =?us-ascii?Q?DDPVtvQqoz6+B9sR1I4D0qRHr71mbd9qz3RR2N7jZt1UjNlVJUt8wZaHwFvC?=
 =?us-ascii?Q?jMZI8z0WyW06GYjFWdgE0N0f1BxWNxS3BTQnJNOgtonoETrGYa+iNfIOb0UZ?=
 =?us-ascii?Q?pQ3rLgHkrIZjXR3vqPWtwB6YqsE9KLro4rG?=
X-Microsoft-Antispam-Message-Info: KKEktbTlTmWeX1XfE5nuWMPOxmBgC1axLn4FHmbz5LRNoqzEyczPKDA2j29IJsqKOk07hN4LJWnSjhInGW9bmOh7DML44c9NDNgqKXbKWXux0GedSwXIJ6S9gKhZQWBqd5HbKgASYPh4ImenhYViEuTg3bQs/bHojqijAS+gwL8PdcZF/v8o1t3cxYYbUQyvkGDJgvHE42ey8Iy0hwAn2LsrUlIzvzJWIJtP/eS+VoiuepeiCQ8SjqvnSldXKMrjKGB5b/R2IYct2nni4FC6fzOzelnU5ZQPK4zo2LTV94WH3NpIovDez/Iv3/MAyg9Am0ZkRMJ4K4pOr0bOGIznTktCjJFqr9h+3QVVxuxL0F8=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:q2pOY189GEcxxfS3sFLVw7SMKtMApFoCZNezfOZ+y3zjPfx9fAUo74KNaCPUprycT9DMaUqpbfkJh/Vc/4X6OWKf/9OHUebfDDlgoVARPVEgUsBxUAekeI2fyW1l3sxl2F3iFKJ5IchVxT/OABBBajSwNL8MdnflgBBQYBmhiACqqaU49QLJvlimzfs/zsA/52XuHGfV9sv1b3O7dIbq9fu0CJqujjx+3BztVxHrU74b8SlLqLlBINjOG+KmMqrPqArnsm4UCx2oeHhudFGe1Zvs4SaCmKggLV9s7yryGRQ+p+0cq/2aTG8rCb1PGeW4mrvU48bpFx6YjCFx8JxWvVwZ2+YhuZEfAGJAV9eCH9y9lZM4YFkrgYvgH5/1V7ZVLegOJrvdUNMyZaFh+WOo13ZB4rK8g1CrGtwH3DtnoXpVSB90rESC01n6v3z4Zh5xgTqc2+rO/C3nnwNhpoZkoA==;5:BImBNeuIQGLHbrpWsaRgr8/L8L1pZ1jakdAalzEFPhdbOQDQk3uPaP5dSC1CJ3Px4LARAnJzSEM8mdb6GtqKfHhbcMW/548g0et7Y5KpxVE+w8PxcnedIR2xHjNtH084VMOukJbzEu54nSScmpXm2xb/ys1Pa7h+q6xmp6PAN4Q=;7:3Oek/wAepquU74M4VqtN3reskburfDyMhlBce35wm2x5SVj8WYihtc1km0QgFSFysm5FIYfKoGVgulc5MknQdMIqfDO1K+41CnRBO08kpZdNufeRYcun64IkmoqAgm3jJf9XcnfGL3WjjQQlemib3ljD59lBrA5398enOYxcskTReUzxuVCfu4Ih3wXMgc/hnAVI/aJzJhnmlh3RIfa94eKAahZzV7mPpCnUKEzXgtdZtRUV0WlKX5ZlWRj+PlaR
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:58:58.6670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b064f90-1cc5-4137-98a7-08d623083178
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164346.CU_UseUkikO8wuXZZY8TN3100vpBCq6k8orjzo3Rjpw@z>

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.
It depends on SCU driver.

Dong Aisheng (11):
  clk: imx: add configuration option for mmio clks
  clk: imx: scu: add scu clock common part
  clk: imx: scu: add scu clock divider
  clk: imx: scu: add scu clock gpr divider
  clk: imx: scu: add scu clock gate
  clk: imx: scu: add scu clock gpr gate
  clk: imx: scu: add scu clock mux
  clk: imx: scu: add scu clock gpr mux
  clk: imx: add common imx_clk_hw_fixed functions
  clk: imx: add imx_check_clk_hws helper function
  clk: imx: add imx8qxp clk driver

 arch/arm/mach-imx/Kconfig                 |  11 +
 drivers/clk/Kconfig                       |   1 +
 drivers/clk/imx/Kconfig                   |   7 +
 drivers/clk/imx/Makefile                  |   4 +-
 drivers/clk/imx/clk-common.h              |  27 ++
 drivers/clk/imx/scu/Kconfig               |   5 +
 drivers/clk/imx/scu/Makefile              |  12 +
 drivers/clk/imx/scu/clk-divider-gpr-scu.c | 131 +++++++++
 drivers/clk/imx/scu/clk-divider-scu.c     | 190 +++++++++++++
 drivers/clk/imx/scu/clk-gate-gpr-scu.c    |  84 ++++++
 drivers/clk/imx/scu/clk-gate-scu.c        | 230 ++++++++++++++++
 drivers/clk/imx/scu/clk-imx8qxp.c         | 426 ++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-mux-gpr-scu.c     |  90 +++++++
 drivers/clk/imx/scu/clk-mux-scu.c         | 142 ++++++++++
 drivers/clk/imx/scu/clk-scu.c             |  17 ++
 drivers/clk/imx/scu/clk-scu.h             |  97 +++++++
 include/soc/imx/imx8qxp/lpcg.h            | 186 +++++++++++++
 17 files changed, 1659 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/Kconfig
 create mode 100644 drivers/clk/imx/clk-common.h
 create mode 100644 drivers/clk/imx/scu/Kconfig
 create mode 100644 drivers/clk/imx/scu/Makefile
 create mode 100644 drivers/clk/imx/scu/clk-divider-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-gate-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-imx8qxp.c
 create mode 100644 drivers/clk/imx/scu/clk-mux-gpr-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.c
 create mode 100644 drivers/clk/imx/scu/clk-scu.h
 create mode 100644 include/soc/imx/imx8qxp/lpcg.h

-- 
2.7.4

