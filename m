Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EF83B1ED0;
	Thu,  8 Oct 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463763; cv=fail; b=YqjOYSzqJM0Eyh+XUF5Q79wOJW8Zty5snylsY0fPM/afo3nLxgAGb0jZ74Ph1YpSwLen0fCJ7oP36e8fTZK8OD38Jr4Xr0DojTWSGn23dtlODUYRf5QsYAvZVVQILzEegJi4biMi6YwHmvXYpKmv6E/yDD4ulvGFQQskAoaciiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463763; c=relaxed/simple;
	bh=EyZxmdT7NOs/xTaiTkvT7CvnkQhbE/2wfsorruLDGR4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kHXIEDgvlNXu6daByhOX+q0nfKQG1QZFsaDsEeTsmcCmXOmlyiEQVskq6yJg9EretwRZUgogq6Z5uPM/zCATYVNia9skclowcqefIFUni425+9UU9AVrYryuC3vsjuAP4sINVAqlWlvuc+BuYV7AWhZ7PUAfBKmKaGJyxo8klsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2cS75h9vlIS2W1/SSV4tsGezHW2LKutRBsJiSdz+KD1OIRuOTFK2KWIkwUL9ezcogaOUSzOfeWp0CxBAb+lITtY72YihsYa2C9TkgNN4Xsi2JknCOPxMS7r9o2IX2qU26hv9U/4xT08kMgek7rP0eu6CERXdLWtYWccM9Znq25K+uaR8tfbkx/48JtMN9iFSK43yxF5+FUiq2ZhC5a8KXePef/kVZxZUsoQ9QYa8bzxDx3zro7hp1jv3knlwQ2JJsIrMj+mLa7KG7RYez0SJm57pvR7bYu8+aLKmlf1ZgZY6DwtRZZpSbJFxdrkXeoE3qIFAAJ9km4JQP8rKD1dJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLbxfpYupajMhBufpCqBFGDs++TnkUlUrP8v49AlYJU=;
 b=GqJO4sc5G4qmPyJIDwh6v6s8DHwwuDeyEbOTaP+8Pv6SOBqHNG4/fVyjc2kc0zsFHxSIoXpv+Ctlh2G8WIRu6QWEArztIPyCXYu/QTm0QPGhucWiRUkqDfskLuTCvCfyUSfCMBix7jHMKrLq/MvZzIK5tgSJEejUH9VADb8rLleYDEGw3xrLjs34sK6NFcnJ3pAd/Z+fSHV4z6YT3PeaU6E36MUhXYiCNawGTgiKbolSGlagdYIMz9OFLLl6vfTcSut3oqpNj0Hql5rPe6A35FOS7t4FL7TyUo2Xy4bEaeZRZHLOK/Y9r1wv3o2Y2h5c0tGfc0G4BFFKtTAeYAv2sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:48 +0000
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
Subject: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
Date: Thu,  8 Oct 2026 05:33:23 -0700
Message-Id: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: e442cfc4-b2f5-43bb-6694-08df253866f7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	IMQKbOQozyTtQQs9eV5e4eE/GsRMAlfEDZV1GRipxNtpgtWHCzC3ujpN15k+z1GiS1KzB6l5SsBTQqPAw7LRqGNHv5KNRNW8Q7oB1hAB1syvqDmTtkjXrz9Gs63iESWi5583kvxQpUWl9r8DLHK63+ZuDZBkrRWRI1L77EqgI5onQhIJaGf5iw9+6OWI8RGRyt3c+xgZtMREQoBfr9gFrZ9WC/WbIT9T5WjHYv8x3P/OB0hi/zOp/6vOtyeSbl5yVbZR/ZNg6Ioy2FQlLxGWn5cbp77MNPOEGmFAOQDSudstlLHf7A00BxXC1fYkK0PeGamrQsFlZ/ut3Bq7kBok7i2Pqq52o+HRirWaIt2sVdfjqJqjXhgkGaU9MbrRcii2hh2aQLGc+8gkPzE2K/2MD8w9SCF94D/QAUNJ8wYlIZ91XpUeflBgnv/oZXqblrlp1eq6foklZ7lV2ihp7m4BVj8/Aew4YbVU6HwHrSlL+CMPOOuCdTFKigHl/dxLxWRqb3UBAJe4lwZ1ltI85vK+w+0CbmrQmK0vgidaBu8nnwwHHv073zfMRB/WGv5nT2vo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Azqx8E5nvWvulxm06Lhs/4x1cupQnChPovwqZiY2zwVfqw6ar550aXoBK0A?=
 =?us-ascii?Q?Lcpc/XEkChJn/23G19PSL6VBNv1RC3OixqMFXOk+yPJi327vLJKY+7o+GGwM?=
 =?us-ascii?Q?eyHVauOJC0V5ZwdOZZ0ImTjZ/iJZ7AdACDUjROUIShixOby37PWwZh7wf7rd?=
 =?us-ascii?Q?+V05Zoxjuqo+/XffQKMJFWOdAtaoFrenMbtb5/TsYpuqShBKQvbtEdXJvIMR?=
 =?us-ascii?Q?RIeD15uytYGU1nPOkVThvyzcZ06T2y5KtJO+ccrYqUH4Vsja1nskdlY4kyEg?=
 =?us-ascii?Q?zGV0GQyiXhlrh119WZElKfNmqMyVliLLN5dZN4muk5G24k+5FLdGHd1aWlc1?=
 =?us-ascii?Q?xNOCR5KrQuGY4gRwUch1T8eFJx7zjW2OKWyKTkK7TeOMPNlGc/7efbcgLAhv?=
 =?us-ascii?Q?tqd3QBiBVGHecX5J+xqYLp2zA7/o+XlRiJRyWzR0JT7zGlD5N1xDAPXCSPlo?=
 =?us-ascii?Q?KiKzIrScESUI3OxMFjnlFgOsIjcCnAYsNsqtA5Dd3RtawDQ/X9bRzFal3XXM?=
 =?us-ascii?Q?DMEjjrjEPo3kO5BZBFYTUp/ja+JsUOHVeh/ydn+OcJK036c+ik7Xxh125OnU?=
 =?us-ascii?Q?TOarz6nga+hB64XoWbmEOc3zxgpUja2BQWDksua/TQaxd1+ZwMNWvRs8kitm?=
 =?us-ascii?Q?If21zKaJcTCGBbHyFd5s/DUipey3H6068wAwPgkuCxwADZPJHKtT5cDK7AHp?=
 =?us-ascii?Q?KiAAOWF8uP07QWD0RdDFXK8WZ5e0ZR2EOQ4uSB6Qkb3VXQGH2AvdYMES4l5g?=
 =?us-ascii?Q?OEDnTZJlJ/991D6fzJjv50ODW3gIo847CztgRtkvB2bxLZTu0yPWMKfK5HsJ?=
 =?us-ascii?Q?WrG/EANAZgJmibmiwIO3wU4VnPmXoXJldwZMMAYJHyppOWMwdfjdtl1Bz5Vh?=
 =?us-ascii?Q?qaEt38VgCymMoens/HPCOf0q81U89XF7k9WOptTODw3lIy1pfsSEGh2BMGks?=
 =?us-ascii?Q?F0Fs3vHkR3rBWj3aiZ+2tRFNbTn9sBBNDALyUL2ZwhZ/+pI2ckg+ubeC2rEd?=
 =?us-ascii?Q?RyE6yQ2hnyvXaLgsLj2zVnL2ZBKOZzihSF9uhHR2+YDsB8t9Spr0jxnGKEve?=
 =?us-ascii?Q?Tn3+DKYzm0e94m/6GmE5iykGrHDK5WQqfuHyGLtDgwjmvs3e1X/e/2TLgHRV?=
 =?us-ascii?Q?10bw3acyb91Oi4MvdgjDawIOiq3TJypDfzMaHSof9wm2qAuZ5am9w56w6+SM?=
 =?us-ascii?Q?UcIb8f6KOWeANThnqO4YrmtPYATXVc2ZgEuet18xS6dq28KB4yulgK6G8tXb?=
 =?us-ascii?Q?bwVHV+AqQvrGEUcuC3eiw9zuWrR92SxkeT0tPS+UI+WmY/VNBy/8xCSQknK8?=
 =?us-ascii?Q?2oH2LRTAGhCmnyUOLjnN5shRUPrxMrAER5St6rOmvHHE3YroXnNzPWIKyzRW?=
 =?us-ascii?Q?gdroumM7+tVdrNV3z6oV5eWIKjsgHqiM2Q2k0mK3nqmT87/+5wyONh1thIWZ?=
 =?us-ascii?Q?MwUGvVX9Z0S6sJFHN+pDLkQOx/HprNiLvhuwHUkkQV8Um/YbTiICqsr8guRv?=
 =?us-ascii?Q?n9S5NHmqpgFosPAcm7g+0vOs+OQFKaxuloFKOYoLO/mmrKua9M5zQsDFUizQ?=
 =?us-ascii?Q?25IbR4Ss3wtT3JMrCNwn3/+i3+XpGCUlPcmYvrM5bxxFQ1YNEbrYKX1kvMvR?=
 =?us-ascii?Q?HTQP86ujMjZd6+Ssjs4MRUesBoEnmUhibILvD3TyHMCqXkmpw5Gq2f90k6Ef?=
 =?us-ascii?Q?P5J+S56/3nf+XRenQtFUdD8MMqdeXpXB8N2T5NPkPgc8WmLrCnYamYTMQzMK?=
 =?us-ascii?Q?GWWwzWGR3IgWP2KQ3QihL/2mdXRctkTJ0lTemfJfmnOAB+34DsP/?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e442cfc4-b2f5-43bb-6694-08df253866f7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:48.8013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lexziX2Pm/QbNmAoUFiKzs1kdXhElxGw56sENzBjfQHZWTQ0vuC8Ymefj0iX4hJ9Y8NUsT/IpYEHFj4FXNrMU6SQvH2PEm6Xy62ZhYSHfF+PKLRxU4YZfJAJcNDFU8+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

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

In the current series, we will only add the following CRG:
 - sys0crg/sys1crg/sys2crg/
 - per0crg/per1crg/per2crg/per3crg/

The remaining CRG will be implemented in future series.

changes since v5:
- Remove the bindings related patch.

patch 4 (in v6):
- jh71x0_crg_probe(): report invalid parent indices with
  dev_err_probe() instead of returning a bare -EINVAL, so the failing
  clock name and index are visible in the log.
- Add #include <linux/property.h>.

patch 8 (in v6):
- Change the JH71X0_CLK_FRAC_MAX condition check to an else if.

patch 5/6/7/10/11/12/13 (in v6):
- Document the CLK_IS_CRITICAL and CLK_IGNORE_UNUSED policies.

v5: https://lore.kernel.org/all/20260930124317.5648-1-changhuang.liang@starfivetech.com/
v4: https://lore.kernel.org/all/20260920120044.194901-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260807112923.191627-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260402105523.447523-1-changhuang.liang@starfivetech.com/

Changhuang Liang (15):
  clk: starfive: jh7110-sys: Fix memory leak in reset controller
    register
  clk: starfive: jh71x0: Move reset controller registration to jh71x0
    common code
  reset: starfive: jh7110: Match auxiliary device names to jh71x0 clk
    driver
  clk: starfive: jh71x0: Add generic CRG probe helper
  clk: starfive: Add JHB100 System-0 clock generator driver
  clk: starfive: Add JHB100 System-1 clock generator driver
  clk: starfive: Add JHB100 System-2 clock generator driver
  clk: starfive: Introduce idiv ops for inverted divider clocks
  clk: starfive: Expand the storage of clock parent index
  clk: starfive: Add StarFive JHB100 Peripheral-0 clock driver
  clk: starfive: Add StarFive JHB100 Peripheral-1 clock driver
  clk: starfive: Add StarFive JHB100 Peripheral-2 clock driver
  clk: starfive: Add StarFive JHB100 Peripheral-3 clock driver
  reset: starfive: jh71x0: Support discontiguous reset IDs
  reset: starfive: Add StarFive JHB100 reset driver

 MAINTAINERS                                   |  13 +
 drivers/clk/starfive/Kconfig                  |  72 +-
 drivers/clk/starfive/Makefile                 |   8 +
 .../clk/starfive/clk-starfive-jh7110-aon.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-stg.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  57 +-
 .../clk/starfive/clk-starfive-jh7110-vout.c   |   2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |   4 -
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 165 ++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  24 +-
 .../clk/starfive/clk-starfive-jhb100-per0.c   | 617 ++++++++++++++++++
 .../clk/starfive/clk-starfive-jhb100-per1.c   | 162 +++++
 .../clk/starfive/clk-starfive-jhb100-per2.c   | 182 ++++++
 .../clk/starfive/clk-starfive-jhb100-per3.c   | 140 ++++
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 +++++
 .../clk/starfive/clk-starfive-jhb100-sys1.c   | 118 ++++
 .../clk/starfive/clk-starfive-jhb100-sys2.c   | 135 ++++
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jh7110.c    |  10 +-
 .../reset/starfive/reset-starfive-jh71x0.c    |  99 ++-
 .../reset/starfive/reset-starfive-jh71x0.h    |  19 +
 .../reset/starfive/reset-starfive-jhb100.c    | 303 +++++++++
 24 files changed, 2216 insertions(+), 86 deletions(-)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per0.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per1.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per2.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per3.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys2.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

--
2.25.1
