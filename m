Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996350;
	b=AW3pcWglyEqnzoMrw0zmyGM8k5sOFALZmekr4TWr4Noh8rxsgJmMXqWUrUkAuTJw+7Kn
	 Dk7NZyaXdkALHSG/3CYJLqJcIfdFuN+N/sJbq8VOQJxEJJqgcFsnVEQXybDMT1D36mQHt
	 eTkz7Vb6ruNpVpw37EYtQ+kYUzP4HmkD6AHx2yV+yv7UPZ4m+ZTJKlMRbM3GeBe6INlyc
	 PQm+uaXo/wejJOtEcmOLQdsPO0qzV0cZJm/pub7MD6oOew85cnDnMoZIhHXcqWfyj8QWB
	 r3rlK7vXuq3Ub/Ib3M9xdHU9pLpJIvPn6lWjN5wTd5A32SuZIA/md8nu4z9YAuNkHYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996350;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3E+l0VMjk1dmDX77i1luz8mT77LxTDhnbh4Oz58299k=;
	b=oOQ1TUihYWAPsG77QebafKL/BPN1VmyuI80P+h9ZI2DJatOEeqF5k/cVcPaMA42TOEjl
	 V04EF6bDwq3MhQtGsKc7pUAogifhXlav+XYsh1RXEhTtH7Aakeb6k3Qh7FfzoqchFaX3i
	 rQRMUnSKvrwlfJiYqidDX0/nJTSJ/Q/ZJ4EAi8jn5zirUa/UEo+sX+HuU+5vB74rHBN7i
	 E1LgIGlrVWWuyojhtb0vXqJjglh3Ph9faTmboB2/VvBD3OaDn8Y9b5DFPQf68Wi/qYOGM
	 z1PXLRbpvonRMb9uRL7jfG6WDJf3ZhRMDA/Z+P+ctYvwsuoEnJVMW6YVhwva0sfXHwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.111
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C42606A332;
	Wed, 18 Nov 2026 10:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C42606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQPzzrPQJgCFBucU2TW19rmrYSwo4EVhIARObm+wX8AQf8pg9V7wyMcqBOxUNjhXekvR8n5W4WmLw0se8tk9kbNy0jGACkAieyOsKzp5vxDA8sEyDjQ1g83DL4HkJ2h9PxGDjhKie4FGpIlxyWAV7qgZHLnptJUvNkzd+kPeC3rkjDX84KHvoInnqMkEyHa4jMYGIIiOZq+2IokWF1jY+vIs3DOKIGU+ANrk/UTWWmnoawPRSdwTjo0sSq5kb8ob6+mlZ4oaa/QYRbdcCFPOENJSQiFA0+x9nSYK4/QMgpyrbV2NqGwNdnH0hCo2JAruzIaaPSxajmIuONsZK+9r/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3E+l0VMjk1dmDX77i1luz8mT77LxTDhnbh4Oz58299k=;
 b=aAbZh0yzosD8F18ekWB77Z4YIeiIBXa+D+TX7jAE9P0GUvTH3xRh+kbv3uB0Xfdoo4bhsnV9bqge4u1fBNacuR3WR31gCChdbeWuawqflqXmNwSJmAs1n0sWJ/Q21RywOuX0PAYDdNbRF4D44+mz04jWXjcOGf3Ci5TcIC9RjUTLpw7j4ndzwF0T/1tgFkXE3NXAOMov8+7wMqb3gk+qNwrzJjd/DPyXlAV7xsOhcp4bw017ahou3/3Au0Kp275oT1xpNHJHzYtOGAc+4nXP6S+2wMOf/AK8MhFUxTKnSBarT14rzS2LAOVCs7qk2zDDRVhp+arU1DdIFePShGx/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:38 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:38 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 2/6] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
Date: Wed, 18 Nov 2026 02:05:19 -0800
Message-Id: <20261118100523.11395-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2ffcf2-0046-4649-14cd-08df455b7eed
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|260925022911599003|10067099003|260925021911599003|260925021311599003|261021121427099003|56012099006|261022105027099003|261102123227099003|261021123027099003|261028144727099003|261102130727099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8XBsNcCGj6JcwBXzI1dKOESCOkwNadcQ+pAv0pOFC3CDrhyJp7tgqyM3oy1Uk19KrWtjWTT3s1ZvYLNRVDG6Afzzi05sWAHqtf3mdQhDmjF+XSnHdp2QtCmy9FwZSkCDkxnYa6nQE6opxGpZgHYZ5c7qvCd0szcZi3OhMjBIL2iIcGmmx/D8MIuFkwFDVy5otYysNZVZWFPvRBSxMaVW9IdZiNE3d1LJ9E3FMdlgcHD+IDaE18LPSZV0BQ/ZsQkrohO2l7AqFgtAXbz3vd9HrSHspD8vw2pbbm3WCMZLoH8yZasB9iUXQHmLS0UC0QDK1Y3mLi8LIsBD/BMdzuu1mVv5bm1FzTXO4GnP7GJ+p5bzEhyVAxUU/5V4QhdwEhriwq4CaEoRzDhX6aAXRYEIeZ3wHJOYv1WpNC40OJW1cJAMt/FBdbiVSu7sUf+wj1W7yyF8PCd3o4cQrpSfItqvRxxquLh+yKUmPGYbriWUTvLsovED6dcnHqJNiEhIB0Gfl5Xw3pgTCW9Fp5Uk8wAQQpPgilwDMFSxG75tf2s32mP6oa0cemBlVIR4OJTkO0/Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(260925022911599003)(10067099003)(260925021911599003)(260925021311599003)(261021121427099003)(56012099006)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261102130727099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HtE8m6D7i85vjN+hoEnWpaVxkIFfKCricexEYloO2d1CISwOeHsxo4uSEv31?=
 =?us-ascii?Q?WJtgC0Zc4am7/p2tCwHl+BEGCZRZfJgHn81QuI2+xZkU6b+q5fNfhunR2/CT?=
 =?us-ascii?Q?d5P+RUz+DP96EjSDI4G6HYBmVJPTkDf2KRzQp5P507mkXW3ZIAG4OtnoLNMw?=
 =?us-ascii?Q?BTUFc81K2f9A7hDtQ7sTaRlJYMuMeiAoqhFl7UNk8sHiyDlMZkegfSlqa2M2?=
 =?us-ascii?Q?6tri8kNR62vrpiv9mwyOKRrfnMcJpLjFd8DSeXEKgfGErLPUY7Pr7zk2u5MQ?=
 =?us-ascii?Q?X3cZNY9bAtTawji9iJ1xAFOiWhe6cyTomFU/hFs4iwuEydq6dcLD11v8kMV5?=
 =?us-ascii?Q?tbSCknMWKAMKo7vNlRcnoWEN9qewgvfmpRb/zKKCcLPGsGsBKoyPm5ZMqW/5?=
 =?us-ascii?Q?8YVZSUN2r4BtemRi+rYgU7eAVGPMleOrKr9k8qbbU0uyVBmJ0oms5DLN4pEd?=
 =?us-ascii?Q?euBhafvl1gHxNQvrwYzojcacLvLTwAoJB2XrFmk7q47gJbWz8ZXrpqdN+Fzr?=
 =?us-ascii?Q?/q4Q1uhDKCgrE56fj5zMqibp+t+WmxQ9wxeIhYmQjG788JyaYB5imOpe72nA?=
 =?us-ascii?Q?PBtseewUnfjcYftWFPOUA16NvM08DTOUJ5LZvOjoRXaP411VZzIbdwvadtan?=
 =?us-ascii?Q?7X+HIWtlBckUlrb3IGhCLHQJCijbeAXTVJR6dn0Co/8fSfBba8H9YuNS073u?=
 =?us-ascii?Q?gdAHBwUP+5StdVG3J0fITXLn8GMGY1k9/lFBBa9uWoL1mW8SWtNMDznAyvDq?=
 =?us-ascii?Q?03zmp3Qh1yniOGNp8p/bjymmNVpjlDLWxTqddF16y+za9f4Ko5NjKDKStwdU?=
 =?us-ascii?Q?SQy3HlLmD8Xxazj5LKl3zenSLaZMeoIW5mcW5HiWbAth3azEJIgqbXZLwh1W?=
 =?us-ascii?Q?oNLyEy04h6oZLf226krKEHJM10gkksIvHQKAkHHnPoXxNBFnTsDhBrvCJHUt?=
 =?us-ascii?Q?6tGtthF2vN9UOPQ1aEXCmHcQFFQbgWykrvWVeFkuNaIggJIpLi3lHlwZV07J?=
 =?us-ascii?Q?VoB5LTWsoZiVbQLQ1FFsCbu/7ebQkU84vBrIh78L6Y2tnyyUV/dcCSufWXBF?=
 =?us-ascii?Q?sGydjp++/3z8TzA8l+heTPxJLkT3PfJE2knlb43peA8JWTEKFXX4I23RCxUF?=
 =?us-ascii?Q?MG1oUnIRJzVbuFZT3nbWAjr374ygcnF/vztiRoGmIVMlfOn0g5r56nG908r+?=
 =?us-ascii?Q?dQuEt8cekCpmcxbv4/XGYGgtcOLnLhNnjdMg+RlUd81dEVsyINW9Kv/mx4BW?=
 =?us-ascii?Q?uBYgoOW8bS1B8IjZddL3wlnGz3lKRRyur8Zitw9fytfz/6IsyKt6GPnqmlq4?=
 =?us-ascii?Q?23H8OGSSmr4VSBBocNA6dopnJtSDpriDgg+vidM/r8bMsnwGDEjw1ls6mWcd?=
 =?us-ascii?Q?jLeOMuc1aYpWLXXxBWec2BEMcXzuGKDtJedCaP5id/P4XjexJV/Hh6Cy780l?=
 =?us-ascii?Q?GJgeXKZxFO6oH/U3GUDzSIdIcdt7aTgiY/L66UVhoSTD4bZpPPmEiPMYtJoz?=
 =?us-ascii?Q?WeM/IDZwLQkXTmcEeGuHaSrPHzG6F3Bp1mVj2ofAVApMWdcTIb5coFCf74MB?=
 =?us-ascii?Q?DWqdNVSRprqH6gTwGVI4uVxyn+rpBsMuGYaEOTSHf7xhNnuNCyyBhtTjG3C3?=
 =?us-ascii?Q?aWGkkY88g38hCnbXGzEgbXw6+2PC/p6Km4Aw43iePK47CQkVi8BoHMuCNM10?=
 =?us-ascii?Q?E5In0oNXKKtMqt9w49wfnuzc7geqYARkNMP1TmaLDNxuNTV0wgI9pw9bHnn5?=
 =?us-ascii?Q?HMSvjp1Qi50DpSBd1N+aMUDltEbt3cw9GAXA3+2a/o5XUf+r9c53?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2ffcf2-0046-4649-14cd-08df455b7eed
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:38.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjprhOPQK0AmxclygvY8wY9PDPVXNP4/wbUrqjkPHhJTM29fnKdQ0d/qYs65Mdnd7uDhkI4IDoYvXYVel1+H86JWNb0BmdxjoFwQvi/5U2Fn2VY/uIdAKlfuMz1jRhGC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

jh7110_reset_controller_register() is only tied to the JH7110 system
clock driver by its location. Its logic is generic: hand the CRG
register base to the reset driver through an auxiliary device.

Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
so that the clock drivers of other StarFive SoCs can reuse it, and make
CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.

While at it, replace the open-coded auxiliary device allocation, init,
add and release handling with devm_auxiliary_device_create(), which
already implements all of it. The register base is now passed to the
reset driver as platform data of the auxiliary device, so the embedded
auxiliary device and to_jh71x0_reset_adev() go away. As the structure
no longer contains an auxiliary device, rename struct jh71x0_reset_adev
to struct jh71x0_reset_platform_data.

The auxiliary device ID is dropped: every CRG already uses a distinct
auxiliary device name, so the ID is not needed to keep the device names
unique, and it is always 0 now.

Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
device names are prefixed with "clk_starfive_jh71x0" instead of
"clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
JH7110 reset driver in the same patch to keep the tree bisectable.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/starfive/Kconfig                  |  2 +-
 .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
 .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
 .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
 include/soc/starfive/reset-starfive-jh71x0.h  | 12 ++--
 11 files changed, 46 insertions(+), 84 deletions(-)

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index bd29358ffeec..51716655554f 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -2,6 +2,7 @@
 
 config CLK_STARFIVE_JH71X0
 	bool
+	select AUXILIARY_BUS
 
 config CLK_STARFIVE_JH7100
 	bool "StarFive JH7100 clock support"
@@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL
 config CLK_STARFIVE_JH7110_SYS
 	bool "StarFive JH7110 system clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
-	select AUXILIARY_BUS
 	select CLK_STARFIVE_JH71X0
 	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
 	select CLK_STARFIVE_JH7110_PLL
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-aon.c b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
index fc8a4e78d5d9..107a81f602a5 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-aon.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-aon.c
@@ -119,7 +119,7 @@ static int jh7110_aoncrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-aon", 1);
+	return jh71x0_reset_controller_register(priv, "rst-aon");
 }
 
 static const struct of_device_id jh7110_aoncrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index d39ce4a2a8e9..ffc28c466d9b 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -178,7 +178,7 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_exit;
 
-	ret = jh7110_reset_controller_register(priv, "rst-isp", 3);
+	ret = jh71x0_reset_controller_register(priv, "rst-isp");
 	if (ret)
 		goto err_exit;
 
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
index 1c11966203ad..5c2638833242 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-stg.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
@@ -138,7 +138,7 @@ static int jh7110_stgcrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-stg", 2);
+	return jh71x0_reset_controller_register(priv, "rst-stg");
 }
 
 static const struct of_device_id jh7110_stgcrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index c938c62a863a..611d58cb6d88 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -6,15 +6,11 @@
  * Copyright (C) 2022 StarFive Technology Co., Ltd.
  */
 
-#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
 
@@ -323,59 +319,6 @@ static const struct jh71x0_clk_data jh7110_sysclk_data[] __initconst = {
 		    JH7110_SYSCLK_OSC),
 };
 
-static void jh7110_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void jh7110_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
-
-	kfree(rdev);
-}
-
-int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
-				     const char *adev_name,
-				     u32 adev_id)
-{
-	struct jh71x0_reset_adev *rdev;
-	struct auxiliary_device *adev;
-	int ret;
-
-	rdev = kzalloc_obj(*rdev);
-	if (!rdev)
-		return -ENOMEM;
-
-	rdev->base = priv->base;
-
-	adev = &rdev->adev;
-	adev->name = adev_name;
-	adev->dev.parent = priv->dev;
-	adev->dev.release = jh7110_reset_adev_release;
-	adev->id = adev_id;
-
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(rdev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(priv->dev,
-					jh7110_reset_unregister_adev, adev);
-}
-EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
-
 /*
  * This clock notifier is called when the rate of PLL0 clock is to be changed.
  * The cpu_root clock should save the current parent clock and switch its parent
@@ -523,7 +466,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return jh7110_reset_controller_register(priv, "rst-sys", 0);
+	return jh71x0_reset_controller_register(priv, "rst-sys");
 }
 
 static const struct of_device_id jh7110_syscrg_match[] = {
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
index d4181cce9c15..c3acf3f4cb46 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-vout.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
@@ -187,7 +187,7 @@ static int jh7110_voutcrg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_exit;
 
-	ret = jh7110_reset_controller_register(priv, "rst-vo", 4);
+	ret = jh71x0_reset_controller_register(priv, "rst-vo");
 	if (ret)
 		goto err_exit;
 
diff --git a/drivers/clk/starfive/clk-starfive-jh7110.h b/drivers/clk/starfive/clk-starfive-jh7110.h
index 0659adae4d76..55374ee24d4d 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110.h
+++ b/drivers/clk/starfive/clk-starfive-jh7110.h
@@ -10,8 +10,4 @@ struct jh7110_top_sysclk {
 	int top_clks_num;
 };
 
-int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
-				     const char *adev_name,
-				     u32 adev_id);
-
 #endif
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
index 2d1713c1693b..db8c3571ea5e 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.c
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
@@ -5,10 +5,12 @@
  * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include "clk-starfive-jh71x0.h"
 
@@ -337,3 +339,25 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
 	return ERR_PTR(-EINVAL);
 }
 EXPORT_SYMBOL_GPL(jh71x0_clk_get);
+
+int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
+				     const char *adev_name)
+{
+	struct jh71x0_reset_platform_data *pdata;
+	struct auxiliary_device *adev;
+
+	pdata = devm_kzalloc_obj(priv->dev, *pdata);
+	if (!pdata)
+		return -ENOMEM;
+
+	pdata->base = priv->base;
+
+	adev = devm_auxiliary_device_create(priv->dev, adev_name, pdata);
+	if (!adev)
+		return dev_err_probe(priv->dev, -ENODEV,
+				     "failed to create auxiliary device %s\n",
+				     adev_name);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
index 9d5dec1d5cd1..322a05157faf 100644
--- a/drivers/clk/starfive/clk-starfive-jh71x0.h
+++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
@@ -123,5 +123,7 @@ struct jh71x0_clk_priv {
 
 const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
 struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data);
+int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
+				     const char *adev_name);
 
 #endif
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..a4e733432766 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -53,15 +53,14 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
 	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
-	void __iomem *base = rdev->base;
+	struct jh71x0_reset_platform_data *pdata = dev_get_platdata(&adev->dev);
 
-	if (!info || !base)
+	if (!info || !pdata || !pdata->base)
 		return -ENODEV;
 
 	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
-					      base + info->assert_offset,
-					      base + info->status_offset,
+					      pdata->base + info->assert_offset,
+					      pdata->base + info->status_offset,
 					      NULL,
 					      info->nr_resets,
 					      NULL);
@@ -69,23 +68,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 
 static const struct auxiliary_device_id jh7110_reset_ids[] = {
 	{
-		.name = "clk_starfive_jh7110_sys.rst-sys",
+		.name = "clk_starfive_jh71x0.rst-sys",
 		.driver_data = (kernel_ulong_t)&jh7110_sys_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-aon",
+		.name = "clk_starfive_jh71x0.rst-aon",
 		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-stg",
+		.name = "clk_starfive_jh71x0.rst-stg",
 		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-isp",
+		.name = "clk_starfive_jh71x0.rst-isp",
 		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-vo",
+		.name = "clk_starfive_jh71x0.rst-vo",
 		.driver_data = (kernel_ulong_t)&jh7110_vout_info,
 	},
 	{ /* sentinel */ }
diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-jh71x0.h
index 47b486ececc5..59ebe57eb5e8 100644
--- a/include/soc/starfive/reset-starfive-jh71x0.h
+++ b/include/soc/starfive/reset-starfive-jh71x0.h
@@ -2,16 +2,14 @@
 #ifndef __SOC_STARFIVE_RESET_JH71X0_H
 #define __SOC_STARFIVE_RESET_JH71X0_H
 
-#include <linux/auxiliary_bus.h>
 #include <linux/compiler_types.h>
-#include <linux/container_of.h>
 
-struct jh71x0_reset_adev {
+/*
+ * Platform data handed to the reset auxiliary device created by the
+ * StarFive JH71X0 clock drivers.
+ */
+struct jh71x0_reset_platform_data {
 	void __iomem *base;
-	struct auxiliary_device adev;
 };
 
-#define to_jh71x0_reset_adev(_adev) \
-	container_of((_adev), struct jh71x0_reset_adev, adev)
-
 #endif
-- 
2.25.1

