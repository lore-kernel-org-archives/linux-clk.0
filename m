Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E43A8755;
	Tue, 13 Oct 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887255; cv=fail; b=JnlLbb2u4IPx8dZ8BXomDBVrtK6nG2G8AN8ujl3cHX5G8d8bzJ+nVAskegRCWNghowKH/iAmB5Bg9gSVxlB86DefJr8Wfn/5r10qz706Ov/yVC/skhKRollYPZRqaLDYKHooHTYFybrhKcrifuGF5JGyZWon4LS2mEsXIs/i7dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887255; c=relaxed/simple;
	bh=wJm0CpKO2W1ij55pAeEvPibXrvHFIYzDASysi7dBZOs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hmjy5vpRh7OVw3HxCEg8zdcyyo2VRRLaGfxX+TzS4rj4XtX6nKRMb/RQaTubUk2xXt1Sipzp35iXf6q4+kgpVSL6IdcG4OS2CNpQGvJMDwgDR93kk9PUeeeeOk82plrXRgamHmVcNGrgyiFT+qxw0z9B1TsTY1G7hQ6XcYCrfWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Za4R1FAsIsz20WJAX07QT3UFIDPosKN5i0NyPV9+KSPM+70SqNUUugaB1/ypKonNdUKXzLYnqiI9DibQkTbmGhEghYPB81XNpxqvN8lWs/zcB0EUTl3tEK59qZBYtBIdp1s9ZVp091wth59SLWtAlZReb3ZfJvh1zXldO5qy7rpwGkzsDqqXYDll1rBXvLJMfzi1ce5t0HvQgZL24g8+Ui7jsImqMFqIsLavfugtAWlkXmhodjfkW9Bf08QTwIEvke9HhK2UKd1aHf+5wbu9NSGX75Qt0DgBiQRwn6JZDbPwBmOHpu2pW13EbcTAEzgcmQSYKHb//dYikw99oYKkyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQIPvsbKGQxUYlcAp36Z2gSHg+SVC1yjFsikHouhcKo=;
 b=nZdmqSgObDZdSPJ31E2pzpgFV67TTDpkbHaoazhqhANj0Q5tJ3gM9Q2JjOkCqnwQEcYw/euPG1uq3yCbHAEojiAPCl1zqgoySS56bXAu3raHD4CbF9RPDnHvGKOpHeyowkaJ3VDDSWkFGZOGiOwfwMqWxK3A2x6TEIH7o3x7LfdscOBn4kfboW/wYqFA3/LBxgNofNrNyOcJsyrr24UuzusZxkWTt8dzxOuQ1NqV+kQcATi3mYfmDFBZf9Nt1IcOEIRc8jnNAM3HB6gVKI4L9ExX0Fl4mYX+sVslDy0QFSy3UtSMJhgXXMV16X1Au2DPRk5GK4o8ZSDI3RkrJaxCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:19 +0000
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
Subject: [PATCH v1 0/6] Add System-0 CRG for JHB100 SoC
Date: Tue, 13 Oct 2026 03:27:01 -0700
Message-Id: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f0d121-cff3-489c-c3de-08df29148f6e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wekWk80oejuH0UNt44F+7Fkn0n4oLH3CO9x6S1o/NXgJxbfXkDt/ZmqMJtkxhPKsBbSx8Q357kbjSPw/lYERdj9k0p4mr/hSPNgqvz05hiVYXrmmyx2cy3t2f4BVwr1dTey1dx1mZEDL7tN4FlCCf2owDivYeBEQ6Wvx8f9KzWO18ajUvhiCq2HeHe6fGMeyuKEfW/ooO8/xctoCoF842CfZBcp25WNvYeS2PdE6+aDFYbU6cxoGAxIsBr4h/ZCfiRIrXS0O+A+gbH6uWdfzUoQDDeZVPL4WZvoEP/5rUDHMXtFtjyR/RvUUoClk5gAglfADvnjgHNtDLs0bijWF/4/YgUds3r2jkIscQNxr/BRugCpRRtEcTnqTNW2qsInviYjG+THNUHco8GU2rLLtEGKqPuugc/B9bgpA2nQAwlTkD+D3n3B80CbOs1BLxE8Jhuy+ylj/ABWQaOuxSDc8PkObRHW6CKfVRoUBIXMjB7R2HmaNR8TsITuzKZM4VdzkcjmdvGcuVa8Q1URWv5PUsZLIGvoZ+ALdQtFec/aTZ39UfDO0Fh46+8I6CDw5iBZj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MxeENwJ4InbooZBBV75rhD+YIVdI6RPpwwMfbqS+L9jEW+k68JYnQhj22t7F?=
 =?us-ascii?Q?c9qG8bWCk6TWujZHscR73ZAoMVsyBFS6fJG6K4YL9VhxF/POXTTjAAZ3J8RB?=
 =?us-ascii?Q?JY7OILI/dl2gZIkkYQYfGUlK9x7LcsEc7xVJBBBLbCCaPDSpvfn+OdZgz0Ln?=
 =?us-ascii?Q?bopVWxuu8j4NlSCtKAVudtBeZ3tktZ3TZ2lrYJlGuzWOEGDyMTzmokWh+nxt?=
 =?us-ascii?Q?fbVgt+3llU7CDkW6WvA4LN56PTLzrsZJQLjr5Pqt/p1Jz0J/Gn+4j/kCZEjd?=
 =?us-ascii?Q?LZhmmx0l2mBsPU6EliQcz6GNo273JKboDANgBUhN1LX5JGKlI8gTVnT02nHg?=
 =?us-ascii?Q?KN4JSmgABZSvaAneAnxrpaA/j+I/EYDBQXE7CjrlDEDrmhDPFEp98iRgnwBc?=
 =?us-ascii?Q?yzFbJHxxbRDkT6PW7/8/Av20i9oZZpoHo6BFbkpgH1pMsPV3NByJruw2ef0S?=
 =?us-ascii?Q?RBkJgd7J014yaOO5TpOARvTcxMESwJz47L3N3JcNvn9WYQIdeHLcH6ux9yfC?=
 =?us-ascii?Q?b91E6wOtW4zYShLSfttljC7A6b1zMBf6hCj5w2E2h1M7lxkK7FWhNmQFyl7L?=
 =?us-ascii?Q?7ZFhh7PGvmQ/Ta+TEa5DUn4/VV1i9AkV2IQS97hRX/xyXypAimGQi90rpO0U?=
 =?us-ascii?Q?cpW22MCik3PteSRHhOugv1+1ldaIjR3APgewmJL1+F2571FU5kk/fhsCKj8t?=
 =?us-ascii?Q?8+4Jj9WesJAQDQhaixOLhs+3uyyJxsqe7cuA2aRZksOBGlDhGF9W6KsyVqvL?=
 =?us-ascii?Q?Wvj3h51t9fMLLklAMgyAk+uvNVVBrsMXcqJzXIRibpboWcugPl5pR9Ew7Y2E?=
 =?us-ascii?Q?a3g5EhuXfYefa3jQNXPPhaHGG5rHMMEX59WPfdlj9bawNb352gPn6oMKj+k9?=
 =?us-ascii?Q?KQb9uPBgtXu/tA1FGi8PNhFYlsvmQ7NIV3XFkJLD172NUkoX4fGVlyQKDLsX?=
 =?us-ascii?Q?DE1oQhej8rX+6AlK/n41QvuOi+EIB1yPJVbhHjBG5QYy/V1yshNeNBTXjNKD?=
 =?us-ascii?Q?FEqSni5Qq8rAuh4P24SpQlPDFQ27cpSslfWz/yw2CslY5qPzCkIO+jkZTSCP?=
 =?us-ascii?Q?7mZZHqnUHQPHgntfYyGY3UJiNVvIn+evPYC8kEWslH3y2OHRNXBFDQEev/Pe?=
 =?us-ascii?Q?EW7wKP+dJZnqwo7pWPNyR2JR/LeNTXfMb8D1MzT/qh7U6w+b8vnBPawbhisK?=
 =?us-ascii?Q?2+EKcDFCabJAUw1R9Z6JRwPjbe+kyNhrN5hFfuRTh0/JG9ogG2QxX+WFFTdO?=
 =?us-ascii?Q?jP9/+AdlW6BcbjjSJGhJn3djpsPu0TZySklq5sdJEJiUBxfO6MJNvIbr1JG+?=
 =?us-ascii?Q?xeWwCHhZmCvVAX3cyAj1Wk3OzNn32D2a7XdaxbYaYbZ5ZQeZe/+wq3cj9+xk?=
 =?us-ascii?Q?9hx6e1zsr3er8EA7L6JAbHg6agX5gG/nR03KAGodEs+lYi6yz04HWAAHdWUl?=
 =?us-ascii?Q?KRNCewmSYgSyLqDhQZvzgyFTClcidsdF1GIJ7W9CiRudDn7JZdR4i49N+/yT?=
 =?us-ascii?Q?aW6tJeVqw7MH7bnY6AAxIycuHBGnC6IcWF4HFJ2PbT3l1XQcK0qG/olvAdQO?=
 =?us-ascii?Q?dicnNrebBjLBOy8NzagzO7Ykl+2chDFoF4ldUwry7yi29QwlC+SF2h1drIbX?=
 =?us-ascii?Q?0ZqxzO0gOLjkhGo7heCoVfI7bviSD72DShgC/nsrk7MyaBi5NPgKAnAR74B5?=
 =?us-ascii?Q?VUWmztZRtTOqoRXGhQLcR5ctllrp1NaehyhfPiZ3t0Dg/cYCc5wUMgtJSqrX?=
 =?us-ascii?Q?ReiTbVonNMsKFoZ0u5T8UBOJ8pGhAaMBwesBfcaVzpsIa6wiH71L?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f0d121-cff3-489c-c3de-08df29148f6e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:19.4272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWxGVzuWf42hBTNVun9j3IzgfkeVprOZDm0WTLVup7swdpNSbTM2oiPUdWic5DQ88vrbmL4lQ6WDn2LClgafJnKOcpsiRWufPaRBHc1XhP+M62V2pSL9OKmTybRJun1r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
subsystems:

The JHB100 SoC is divided into multiple subsystems, and basically
each subsystem includes a CRG(Clock and Reset Generator):
 - sys0crg/sys1crg/sys2crg/
 - per0crg/per1crg/per2crg/per3crg/
 - voutcrg
 - vcecrg
 - gpu0crg/gpu1crg
 - cpucrg
 - usbcrg
 - host0crg/host1crg
 - pcierpcrg
 - husb0crg/husb1crg
 - husbcmncrg
 - husbd0crg/husbd1crg
 - npucrg

[1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

This is a split of the previously sent large series [1].
The original series had too many patches, and there was a lot of
similar logic among the patches. To reduce the burden of repeating
similar comments and reviews, the original series of patches was
split up and a new series was established.

This series is based on the clk-next branch.

Changes since previous submission:
- Change RESET_STARFIVE_JHB100 from select to imply.
- Fix the external clock index to JH71X0_EXT_CLK_FLAG, and add
  JH71X0_EXT_CLK(_n) to define the external clock index.
- Remove CLK_IS_CRITICAL usage in sys0.
- Add a static_assert to check at compile time whether the internal
  clock and the external clock overlap in sys0.
- Remove 'power_domain" from 'struct jh71x0_crg_domain_info'.
- Register the reset device using devm_auxiliary_device_create().
- Obtain 'struct jh71x0_reset_adev *' via dev_get_platdata().
- Streamline the reset patch, keeping only the sys0 part.

Changhuang Liang (6):
  clk: starfive: jh7110-sys: Fix memory leak in reset controller
    register
  clk: starfive: jh71x0: Move reset controller registration to jh71x0
    common code
  clk: starfive: jh71x0: Add generic CRG probe helper
  clk: starfive: Add JHB100 System-0 clock generator driver
  reset: starfive: jh71x0: Support discontiguous reset IDs
  reset: starfive: Add StarFive JHB100 System-0 reset driver

 MAINTAINERS                                   |  13 ++
 drivers/clk/starfive/Kconfig                  |  12 +-
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jh7110-aon.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-stg.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  57 +------
 .../clk/starfive/clk-starfive-jh7110-vout.c   |   2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |   4 -
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 120 +++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  23 +++
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 148 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   9 ++
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jh7110.c    |  19 ++-
 .../reset/starfive/reset-starfive-jh71x0.c    |  99 ++++++++++--
 .../reset/starfive/reset-starfive-jh71x0.h    |  19 +++
 .../reset/starfive/reset-starfive-jhb100.c    |  75 +++++++++
 include/soc/starfive/reset-starfive-jh71x0.h  |  10 +-
 19 files changed, 524 insertions(+), 95 deletions(-)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

--
2.25.1
