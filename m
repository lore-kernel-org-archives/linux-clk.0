Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ACCC43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 977E720676
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OdNxqpOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 977E720676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbeIYXHd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:07:33 -0400
Received: from mail-eopbgr70048.outbound.protection.outlook.com ([40.107.7.48]:58664
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726322AbeIYXHd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0ZdmevMHupoBR2Z8tXV+fzs/FQ2InGLT2J9g7F/l+M=;
 b=OdNxqpOhNze5K2QgwKeobyraaBnKs+h79UhDlse/dNapNrtf6hKyJthc+J2v7wVQSE1kkIaGGWdTYZfnUGvBez0sbKRdxF0dppe8oBrW3XNEtVeyZIbX0JjLD2WksAPYVRYXmfGq3mseDoEG6kfqRk/P/nSMaSmFe2Rz8F6ZzBI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:02 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 01/11] clk: imx: add configuration option for mmio clks
Date:   Wed, 26 Sep 2018 00:43:47 +0800
Message-Id: <1537893837-31172-2-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0b46f7ea-c5bd-4407-08d7-08d623083391
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:2mKbGZkrGEWzZ0Y567ZR7JV9FfY0E5Hp32qFgDkmQgzQFvhnAIJp5+Znsc5k9Gl+V31XLUTt/8BZNY1GahZsTsNVIJzwcuzngIMoGUNOmBm23dCopqcYIdu6BMyUcD+SY7Lg0jwLTsvLPDsOIOFeeTUlG9hO8j+HWB/mv4Qvwl19/TPOi9Y79ScX3oasvMsV1HoTTu0evIPyKFUIcTgtkiDkpV41qP1JEeDQZhHmc2rZF6xJygKldmZStQLxp47e;25:FaEI/pFqoNeYFR7lGGzIxeMEfSAIJfkCLkwB+jxfSetXoBPsMfXMxIjbuHSy6jAU7kUth1XK0md71y3xqd2zDzGgDNYg1usA2ayycgvAUNWStQ/wChF/vAom7t2nH+VM94Abn2N+A8wkDO71cgihB4A8k0pI0UGyXe/1kmkh5ubQvFQSTrbqxqm+tcTgerM0Mt/zeZWpk6H9j8E44eLqSSFjIaR6ucRRyCzy+H2+LBQ4xPxEnqCuymu0H6euKDbrPiakHFxb/qI0JjeYQPIzudMoXkexWXLs3k1Z7gcsJFw4OmwtHsdo1jrh9ENwB0LfaDnQxkxUIlCF75XX9W5dVg==;31:qnt0cDtovaVVEJFTTKUjrWgmQ8u26r84l8h64cOIZGFthg+ngH7vYN6gv6U5tdqT6vyMImtvHEvi54G8fj2uOrIxEG1jjaNwwPyI/1eiqcjmhRDpoyJ4+eIDujWNEE/EMgRjgPqfLBfXVsIfPAgMdofW+mn/qLeiia77Qj9+CYdOaElJ/yFN+AyD8fspues+tAiM9lWrX+Mb4XXFDuT15uKOIWI4fM0Eg+yn22QMOWQ=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:wnvdTivgYkYdVEBqpdPIWsPNbkWCMG5dFWq6anb7JuuZwCVAjUlkoYZKSqhTmp6j/F9CO2YGZcDuhh2yQjzIND/wFiC2tzjOWw4WgMD+VwgugCaLbYkaji2l5MQi/TF0mEwJc5cp7JqE0AMmZlqPckNfaHMjs46SGQ1mQ37Fml4vF4OtiGZnuHdIrlFhifFxIqL8qhY+dKadCoNHvu96poWIpwUHs1AJMYVFZm4AM5QyQvasHsEYU9IRdpg8nUAEh6kKeYfurz6QfOup226fzTcv5z1K6JxrEZv1z30ShRfOXsPY2poIAujQUHf/gJBsV41KvRv27v9BOqyOuVEKeLCtja7U8YN/U+QORUi657dXRIN/1s3GnV/730la3YPr7jl5gcUc8Sh8EbDboJBcfwjYVIRCM/dwACLHFrTKvFnp8J1qKk8dvfsFZ1u3vACCAvUz1Yd0eURu7fdr2eDe8q0MYuwOMacr3dtNdCBvZtE44y7cyIHF/3lN3LC/yJit;4:5e10743twBG1VHhflF6JOlkEwVrhGXCucRHAhK2GUe6lPu3TzkP2ZKCgIfWiy1ktOFOpSGgyvtrYGgdG8BRwUztaTh3rsVEafUvyfN040Ll6yElBbyPrVj29PEWAyiejnNAjrS2S/JZTMs0fSdZMk33VvmyevvTIjqOshelNIo0ue6l94ZQcL5yh6Fs014/Hh3wbi1DGr2ZBo+iYOp9iCgENJLTtUz3gCUZQuW6fiowsNHEEcW09hvf7es9mEpZ4VjRc0rKUZPuaT97fz/GU0FRq6TiDlkf+slq0BCfp7XMa/pOSqk4eEguCuWJAkPvV
X-Microsoft-Antispam-PRVS: <AM0PR04MB42112284BEAA305FD2C0FE0680160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:3wAzLNfgAll1RzAwlO6xAVuyd50vRYiBur8ldQPTY?=
 =?us-ascii?Q?gA4cBY/X0ntQ4XzE50Hjw9hI3L/1moOm+UtEnLSRdt4IfgDBuI3tOKrz9vaU?=
 =?us-ascii?Q?Amdg6T3a3OOFkP/HGam2cE1rvCOxtnzUBrForqLJ6E7W6/nYYj1+xOdMeX55?=
 =?us-ascii?Q?n2KoMNWjAS4xKLjvKuzALVld/cHDTYLiATk9FHHV4daXd5IuipGbulBxDIhG?=
 =?us-ascii?Q?z72bW1b3ehnHvQxgjd+kJ70vHtcVEY83jCwze6P68JxRIb6P4yLTKD/UvEW1?=
 =?us-ascii?Q?IawkuUbwu+OFwQ2UWiT27cPmDqUVaMVvpDyw+I0i9YE/UV/AWXdKA4qtPQGo?=
 =?us-ascii?Q?+2i8O3HeVc1WEZWsu5l0hsyD8nDAqCYL0yUUvvA61iheHMOjxgmsD1aYhKdG?=
 =?us-ascii?Q?CXn5r63RHwZJwzprk15514WnH0RDL/Up5Fx13C9AFiJh1d7KPi3Aip7cEMhX?=
 =?us-ascii?Q?EtOaH1aIxS66AeDIYZ8cZ5bolNZkThjQVXQJ+pNS8hpLz3qle10r0ETWPZVZ?=
 =?us-ascii?Q?zNyX5L+LWd4XNH1w7bzn33OumhW+Tm8bAq19jIADBGC3WXezXDEhfi1pXfbJ?=
 =?us-ascii?Q?9rtlo6UUpCVfuU4zO0bVABQpLNDG3q3uM32AiZJatN5L5U3M9MifE1ZBygJC?=
 =?us-ascii?Q?uDLfOnMw0cBK6rKc4arm47fMR4REjeLXV2yqoSbQP02GRu2t9YFJF1ywAhUU?=
 =?us-ascii?Q?VxRJ0WsL+PJZq4v6h46uVrRNPZn1KIxSRMiveybfU3qoBmv4llWZJUDu9SNa?=
 =?us-ascii?Q?ZeSJjHxMK+s2rcb56BupjY8+3tuTu2oARgfz5MqSJbgKG26MsVxik0HHnb0j?=
 =?us-ascii?Q?CZy+/40jae16ZUrjw+D/nQXIiMRI+mG8QkM20sTvpU3/4l/RYCxz+8kUrd0M?=
 =?us-ascii?Q?l6qq+ejyCbG1kH6QYV7swduMLucXxHKGGGuTNDnTuiSUIiFea68qIJwqRc2y?=
 =?us-ascii?Q?qIWVCDW1i54cJhV/Vz1xdaENTw2pxVnayF7Ma7YD9LaiADlsV252Jt1tvQ4X?=
 =?us-ascii?Q?bWxdG+jS15U97JgnntckB46aXc5TQz0en/PXTcOfr2Fi02UXojdqoP5RmUub?=
 =?us-ascii?Q?R+cA9GE+MKUlGhvn9OSPUqoVANS4lqnmhzEVf59E03m6hLtFAkbqxg6Gq1SM?=
 =?us-ascii?Q?v22l+y4hMbK/CSTYQRrqcenoixd4S94yiob2vWfHD3GzCSpWg4iPHiYOk9Vr?=
 =?us-ascii?Q?fuqRv60kuO8O3HhlxpKoo9Z6833kZSJ0ynEpeCMCc2Ahg+2gxd2icKSuGsF6?=
 =?us-ascii?Q?IsV4Y2blbbXqPip10o=3D?=
X-Microsoft-Antispam-Message-Info: Be3PhbvK2fi1Xao5/fwk+FHZjPfAyqoCGAZ6quWyHyv0MbQa1dC1jl4vgm9MzfRCqt13P4DMJe8Dsnzc29qC4UrTU2ZcJwh7cHcivwYwJbrRnnJ4UHMbOf6A17OjHKPX8CZF9Qm2vkzM53kXqjlRPe3cu57JFXlSAoH5V/pM1Pq1X1yqM7mb25vQie6IN6PeRT3cVlGfUXesMq7Q0+rh7TryHDwCZu2dH16TsE0W/8LJqtGYEw7zNHHDkdSM1Aau7EQcenww1evC40tn08DMkpmLD1Qv7vYybzfAWf8Cmn7+pWWL/aNazOfl5c7y646QKEY5qpI5adrxagKNUPRsayfhgKy3OY6MXwcL7JV82W4=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:LJq3saTS4lgWAiHrr3paHyfIgXMrb5+6EiTOArCBdxaCcDWdFZpqP6KpacIx9tXZk+EbuqRESPMvEdii3paClbC6j/q48MCGu96jzsS2/L4bmLmv9NdB5JhJFA9rxNkdMfz4Dx+JPTfpyvfTaPMkXG3zY6l2JgWf8PpB3vyW7mdJKZW0SYMAntK++Cz63w8RBRi+VowfUlDKyNtTG8uR1MJDOfOoldxUDAevMec2lT6rmeNjGN6eqHSZ/LDQR8YhidsxhxoSLZCJdKIBDo0ruTuNDG2h9LXFIrW9En5wNGkqAXLR88le0EaHFePoQe9yMWUk+qGE2qfgMKYJKbCuIbRWIko3/Z8+y47lIPRxTri+rGd6DDHObHOemWVCX/DDF/Lcachpe7kxyIXoTozkhtPZwIQgxfhaFmN7gWR/9w8+ZbmGvpK/szvGs8mGsAWYnHfB46XV9Vq8f+CLgJqn1A==;5:KtjPYStPJbjTV/4DZ8Q3OIo6kKACIDphRPEyLB4LatBllwAUiqd2HWmgNVrATp0XRXhiXbOcN17+suObsfCVRaFFFTGjbTegGGZ+gmRu5+5putskARXklc9Cq81wvSDo63WdiQhtRGMFpFOeahWDerfQiIOO191Syqxw4u1g/YM=;7:mziIUIE1UbU5+AQM29CGokfT6foRDE83RpmhSq+vdHOQsSvrfu6AoXgRC1yUKr+NSWLuVDxgAlr8UWQT2Q9KBNLppVEZXIyN1aAIltbpRr9pvTpbQHUyCVF2Ef0fKS1s6P4IKEslKahF457VbkCLSVZ07+6tKhvVbSlAK/zlGyMRNHBJwS3jRbjJFofWo0TpXQRItka0JMLDl9PMs5lZPf23Ln7MW/zvp4VjvQhcPFbkHJOJsfDbChQ5VP5iYEuV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:02.2138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b46f7ea-c5bd-4407-08d7-08d623083391
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164347._PfNRshQvTjjNe8bDFNpA3oxXOJ4dsad37U8eXzUowk@z>

The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
this is required to compile legacy MMIO clock conditionally when adding
SCU based clocks for MX8 platforms later.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 arch/arm/mach-imx/Kconfig | 11 +++++++++++
 drivers/clk/Kconfig       |  1 +
 drivers/clk/imx/Kconfig   |  5 +++++
 drivers/clk/imx/Makefile  |  2 +-
 4 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/Kconfig

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index abc3371..11a9661 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -57,23 +57,27 @@ config SOC_IMX21
 	select CPU_ARM926T
 	select IMX_HAVE_IOMUX_V1
 	select MXC_AVIC
+	select MXC_CLK
 
 config SOC_IMX27
 	bool
 	select CPU_ARM926T
 	select IMX_HAVE_IOMUX_V1
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX27
 
 config SOC_IMX31
 	bool
 	select CPU_V6
 	select MXC_AVIC
+	select MXC_CLK
 
 config SOC_IMX35
 	bool
 	select ARCH_MXC_IOMUX_V3
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX35
 
 if ARCH_MULTI_V5
@@ -417,6 +421,7 @@ config SOC_IMX1
 	bool "i.MX1 support"
 	select CPU_ARM920T
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX1
 	help
 	  This enables support for Freescale i.MX1 processor
@@ -430,6 +435,7 @@ config SOC_IMX25
 	select ARCH_MXC_IOMUX_V3
 	select CPU_ARM926T
 	select MXC_AVIC
+	select MXC_CLK
 	select PINCTRL_IMX25
 	help
 	  This enables support for Freescale i.MX25 processor
@@ -442,6 +448,7 @@ comment "Cortex-A platforms"
 config SOC_IMX5
 	bool
 	select HAVE_IMX_SRC
+	select MXC_CLK
 	select MXC_TZIC
 
 config	SOC_IMX50
@@ -478,6 +485,7 @@ config SOC_IMX6
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
 	select MFD_SYSCON
+	select MXC_CLK
 	select PL310_ERRATA_769419 if CACHE_L2X0
 
 config SOC_IMX6Q
@@ -545,10 +553,12 @@ config SOC_IMX7D_CA7
 	select HAVE_IMX_MMDC
 	select HAVE_IMX_SRC
 	select IMX_GPCV2
+	select MXC_CLK
 
 config SOC_IMX7D_CM4
 	bool
 	select ARMV7M_SYSTICK
+	select MXC_CLK
 
 config SOC_IMX7D
 	bool "i.MX7 Dual support"
@@ -561,6 +571,7 @@ config SOC_IMX7D
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
+	select MXC_CLK
 	select PINCTRL_VF610
 
 	help
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 721572a..c4886be 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -281,6 +281,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
+source "drivers/clk/imx/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
new file mode 100644
index 0000000..43a3ecc
--- /dev/null
+++ b/drivers/clk/imx/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# common clock support for NXP i.MX SoC family.
+config MXC_CLK
+	bool
+	depends on ARCH_MXC
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 8c3baa7..d447f8c 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-y += \
+obj-$(CONFIG_MXC_CLK) += \
 	clk.o \
 	clk-busy.o \
 	clk-cpu.o \
-- 
2.7.4

