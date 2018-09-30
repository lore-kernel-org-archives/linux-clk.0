Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64B7C43143
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A333206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="wGvPiCuM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A333206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbeI3HmA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:00 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3Hl7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+NwdVvWl3WfAenMRNJbS2f9YrAxHFktS+dJbT5FO4k=;
 b=wGvPiCuMk6zCDtB8w8VBJ7ETz/ktgOPKwx4z6sofv9pa7M9PInFYMeZL2LpynR+toW4Z222c8oP4hia1+uTyQOFA48yEKy4Pe299uxGnchRxxpiOsUZ5EzbI60it/r8hXhwfNyQoZlWW7ytks6V4fnVpA5a6Y1d3jU0Umj3ZL/c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:10 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 00/11] clk: imx: add imx8qxp clock support
Date:   Sun, 30 Sep 2018 08:56:15 +0800
Message-Id: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To VI1PR04MB4221.eurprd04.prod.outlook.com
 (2603:10a6:803:3e::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4880f12-7cef-4c52-668b-08d626719d9b
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:YFZI84YgA/QCKm4STKFvffHwTNQd0vkmXWayZzhRHrZFw9pRVWnmFI5531RcZ6DOnpeF3c6OySuss56Vg7ERsVXgKaxjVyekwhUwqUIKpegzvO+KcI4MMGckkXZgiYuhBcc4X/fCBVrPAGJnYXU1C/u5G0UuERJZJ7uEMbG+irZGbhVGkIqkhC02sbXjZD1CRHLNhP+RJIPNOmjeXldf8jKWtPoe1rhxA/KNunBRRNMYw1C1Pr/V1nXLMvW7bo0t;25:KI+sVcWBWSiDHxBoOQCMpvu96AazprWiPIf1OBzVLa0VqmCEyfN1I68PXxMbBzYDJudSayebT9KMV5x2XhlF4o91HKLG7qMLwaWXcsAkVGKaiLnB6ZMnnaBL8a2EIY9d8OTFxkBtJvGZ2BzKAa6E1bp+fZT8x2AAO02+voDJVupxf0ri4XvjSzbCj424gCYAJpitYXEZ9vwODqJfyBzpUATqKzhocWrNnNPrPfFB4UWnP3wml3oAC5OO3xNVQZeaY16subd8YwZJWDUg7qKppuRfvUfGgJAeCh6gXlD1akmD14gfTFGCGrdLR/4W1C0MLqWGTuHedqZNzC0tw34MfA==;31:uFz4R3URz3Gzol6XCkgyK2GISa03MyG15GYX3KFfT6Wl7PT1M2ErNM45gpHptcg/B5DfGEmWBaN1G8Fzlt8tHjxJ0Qm1w0tQbL8MumoNrcDCvG21rlKZk77so50yJUuyShXCNBHp6oLeMxvBxNts4o+7HFt90HFo+pHFWG2aohHM0gn9j5tsUN7ic4rNhyibQ2muU73EpcBtJxXZPmR2EFlNJU55WaQ6Y3B/P43cubs=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:XcgUlj02/8ARrHvjlRcpcyKEYbJdNzGutMKKk5kWgfzL+gv6VE4l4bcZhhLB4JxnAiMPSL6maXdIMD1yq/aU/G5xhvnTXB/imC5IXIqEwcWPTWFC2c3FxZaOSXcmuUxWqUpn6Qk6tQuNzy7hgJVhfLM8/S4CwhwWb9Okxk260o542ks9n6d5Pn8mxTP61/7VNVzhnQm88nZxHZ4Pku0sf9Yj5DgJwAZBVwddKDh7HNm/3caGpRZIIRenLQJ2oto90fuc2DJicBg6Mj+lN/OvrAc+hWuzW/BXlI4pOQyk3M4les09Ibxr0g3uapKgHC8ABkl2biBu46DSZMnp+uk2DTZw+X7cTWFto84cS5ACCLdsNPzz7XOwGTRL37ROZ0g8Ms1Eidl7examweSm0sRxivrKPo8KsfYTgcVRlCM1wnQFPT2AV7Tm9kSgAPNkDUHugKZP4r8fP4IK/vPSWbGpWdVsZWF/weWPw+R7i/jUzWAnG32d1ZQz85vbpjlcr0ks;4:AL8oXd6j6ywe3dETcEUaYtAJo0shI8atzlMSDSkQ6g9h0caqo85cxjHEQbDMUQ1m0t5SiyCqhrRB8MpshQ05CeOqdiuiyHCnPNjXM37rtat+JJ2R7Y5XVj/cowBs6sJglwSQ+crELx8uScxr/zB0YkLTbr+RKSXLEWOXVSWvEKEfh/9TcbWMYiRXzTo53pqHEYMrJooLfVqRGSZvErjlCoejCei9/4SCVj97qriMNTEIa8KLVzGCFvGjW+4lF+djW/rIMwlj/bJ0EF/n5REFkg==
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221D76AE805625B2723E6F480EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(3846002)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001)(32563001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:patyGtuFbUt3YcW+SechGOQwvEeX1Wz35A+mSrUQs?=
 =?us-ascii?Q?gR6QOEc5qX28azOPEPfhxz6uXdzWJULwF4imxTOUY2T7AHU03Cr9f/GH14uy?=
 =?us-ascii?Q?0M8N3ku9lHvrPZHoZnTAkaC2YViaH4Nr/swooS9jS/eZItHKIylCoW0h7qH5?=
 =?us-ascii?Q?nBEOPxrs6aPvBHwg80O+Jkf4owjMc1YkhpJDaiKHhx9NOsX8xeLKj+xInT//?=
 =?us-ascii?Q?rhtLKaVHgKcddMODbCi4Fq0wNqynt4SrlIgk3jk/R6z3SgcXt9PtzS47BvgY?=
 =?us-ascii?Q?QB78fZ+kzT2dHo1q20orz/61fjydJzbZL7ovOkopMRAZ3wyW5364QAg9SgJO?=
 =?us-ascii?Q?I+MXBJG5T7ucPQGWk/Rn5Okt5mWMGUnAlL0dk1rY3YDs1IaAWlaKun5Mx1Lg?=
 =?us-ascii?Q?PbilHmoqnBdRKdgWJ8ROV8t+uF94/kMUObOjAYImsiYc2+tF7wkl8Eio5cZ3?=
 =?us-ascii?Q?WtcJmlFlAmPvq9idmIFCDvJd7GFuLO5rgunhIavPKtyyW8tZaG/nRz9WS9T/?=
 =?us-ascii?Q?oua7nDNO/1EXZ7JiPPq6tCOMNgBXHhDYq2Y9EDln+0aPcsQXbrPUiMfI1z2E?=
 =?us-ascii?Q?kmQDeeqALttAs3ItrVMTI+DiRVD3CurznP1GMEpBMTJU74XyZ8V2K2nbeic/?=
 =?us-ascii?Q?SSH68N08ecEUa2NTpe0IlpFIAXThmtw4/zVO/nU+3bY+6JltCFiQzihAK7HV?=
 =?us-ascii?Q?zLRutAqGzelm08YAqNhOT3yP5teEZwjuaUUJuBGgDsLXc84YBZnJkyG5Xi92?=
 =?us-ascii?Q?VBNh9A1eB6HybPeoVq6E+SoA9es8R9BAIEbzS8rIdqOAylxmKpXaO3oDtxeV?=
 =?us-ascii?Q?UeH5WAnZg0riuh8cV2tNrCdL8JScLbk87VUpuKQkCJ6NtLhp4IxlqycdmX+/?=
 =?us-ascii?Q?yoYHwGUbcE6aX/WbxLKqkCdAGGpZi4ehNYCVjQZbsAfcw4YEopSeS+ENUCxz?=
 =?us-ascii?Q?/N6QaQ7AihOshhxx0ylJiBAbqX7FcjwGBUPhQsaUCQa2hnAGo8AvNfUEimEO?=
 =?us-ascii?Q?yme8/HKcJW+cxQau7bD/1CBtp2dXdIcbx5aP07/1dwIvg/CLaYSH0bnt/cOE?=
 =?us-ascii?Q?3b3IRHDch2Br5JR6x9EvywEtdcEEuDsleWp0FFUhVCeE05rVRF+PcZUutVnR?=
 =?us-ascii?Q?cq0825lUVK9e4yYiq8WHlf7wQxdPhW46JcWjhHtfZEMBexf+nq7Ew/6TYFdN?=
 =?us-ascii?Q?WQFkj0vrDF+gfZuJHaxEEQYHWGHr3EHGOi6GwK+VT0hogkhr/o5UtzOAQ=3D?=
 =?us-ascii?Q?=3D?=
X-Microsoft-Antispam-Message-Info: 8hoLIFqpQDFBqIpVZq77aIZ6k9+xn0cfazrQNa4FJk6vrOUv944N3i1Sl2gfOByxu7FR+YQJpdfJhWCf6qentLhD9rh0UwknmZAyVIjduikaCUuD+pzatRPWH9HxEiajvjzVTZoxFiNY8nMHAsshVAvYRrYqp6BmYXzvsae7szo9dvb8VfyxXkCF+15lQfF9UmI2umGMxIOtsE6mjtH8K4wwduKfonhAs52pE8s8EKEhy9vxMTxvR6rdIjj09XhYzjYe1NyrHJkd8Xbdv+b/XzShyiDAc9l3j5eI005vz7MhugPZuM8wbjW35o7Ch0Xfya4oYyJY49yDOkLZLaYvAF92y209NbHh8F1SIvFWy3o=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:/MaWIE1RftxQQEN3GLWI4tDcdqDn5I6PjgtMrmhxLoncdz6bqJH4CYMaPhmnmX3Tt5cdjB3p98jWgwHmIE/BwaV4K3VbOaG1bxggalYJLIeTLfrgSk5jsqDtd1oEfyXnFablOweHB+B/q8mwVUj9THq2z1a9jRMyr5H2HIZcvvbOl41ooNSPpEzVVz3Eid+l1APRnbcncbzLWuUXw3Ch+gr7F1rBRAM0rTTNq1YMatHHEOvj1mqUvD//TBoeHWbLfEqJUvhX3iVE2hKsHbnYG4kEBaDMBMOQ3a0fvStyYfgsNgMFnd7e/jHvxozs8Ryc7eRjFwDTpj93Lq8dQ+0Z/BU8GT6zSLS1YxRINRIHDSb9eHYDPopPOUvI0TKUl+z3apjfQmIValoH0A4bQMARxuaqk7FYjWCP/Dp2U7m2lxs7/LfhDiYPL/jSK+KjkdzfdU3Rkfyvq7b1KDp8yi6rQA==;5:kTc7Ascb9T/8g7tGTk33KxPEjerYyW2HlGEkW/ok7cnDUNZY8saF5QU3C/wISuPIfQwlogxwqI6F8DhsUCx/vOOTDqg1WCRXukUeVgkWKwc8tYJ28yZhCmH+GhWZ2flfCx+ePNgLXmLn2XPx1fhbqUizhHEXl9CgQCNu6sBXb04=;7:w/omsrf7JuDD7IUwV78kMyW/SZGfCKE0OCHjxOZgMO7ifEPXLXXQRGxFrNjQTRE5RZqFiIdDrJrPnxNvVzFl1XTptjNPbxyAIfIIALO8M311aTIh0+y++MEG74Gd5wMv2cndqvHtcfXaiVpESrK+bWsZzxlh1Ofbv2I0aPo9DB5+oaBQCIYUaEkaJT3GPsrzYpY3GGP8XdRHiCeaNXiT2IaFnlphL455WPY6jQ3FSYjrFYqvkW6WhCD2uP5cRZtT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:10.9381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4880f12-7cef-4c52-668b-08d626719d9b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds i.MX8QXP clock support which is based
on the clock service provided by SCU firmware.
It depends on SCU driver.

ChangeLog:
v2->v3:
 * structure and enums name update
 * api usage update due to api change

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
 drivers/clk/imx/scu/clk-divider-gpr-scu.c | 130 +++++++++
 drivers/clk/imx/scu/clk-divider-scu.c     | 177 +++++++++++++
 drivers/clk/imx/scu/clk-gate-gpr-scu.c    |  88 ++++++
 drivers/clk/imx/scu/clk-gate-scu.c        | 223 ++++++++++++++++
 drivers/clk/imx/scu/clk-imx8qxp.c         | 426 ++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-mux-gpr-scu.c     |  91 +++++++
 drivers/clk/imx/scu/clk-mux-scu.c         | 131 +++++++++
 drivers/clk/imx/scu/clk-scu.c             |  17 ++
 drivers/clk/imx/scu/clk-scu.h             |  97 +++++++
 include/dt-bindings/clock/imx8qxp-clock.h | 362 +++++++++++++++++++++++++
 include/soc/imx/imx8qxp/lpcg.h            | 186 +++++++++++++
 18 files changed, 1994 insertions(+), 1 deletion(-)
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
 create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
 create mode 100644 include/soc/imx/imx8qxp/lpcg.h

-- 
2.7.4

