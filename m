Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795432878;
	b=kyzRG7NQZaaY6muGXxWJacCJ6gEI7yFxpEeJeOoiesw+zzk295X+3vojJyEnPWJx3RbU
	 c4oSRyKimBsMp0byDjx0hVY8AX0nIwfDi3cnuxMhZrwyRGc0xwamlpRZFG0yhSMKkjwDb
	 zXFv3IG52lq/1O6UWaGgpOJoMwZ2JXxUBhkR1ILNSc8Y2K/t2HibK+9wJXxtFAStBgEaW
	 yiK0LIZ5OkCf6KSienPT8y+th8yi7LsRwdJ6bOOLTAyc7uzI4C31gatZSEUZeCTz/2xsX
	 kZKaEF9YOzlX22HQs6qHSICYvP2PRA7v8j3BvY8iKbG2BzmCJWzTjz13rIcXWVCt4kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432878;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Of0s7r/MNUWuRA9Wsnbejb4z8ch2gGOjwsiQjSIVkE4=;
	b=FpjizQJWGy4o3xzOkzLQTvgZBZlkPiYD9NkEsDVKagjGZQtORa1qlgVyEEbMcCDUb0LR
	 YLs+uLgTJZ1WlURIvfxAgJCRYFRYKqDpAHIaZ1gxvJ70zT63Fo9VnKzpac0sQKyQ2FC90
	 eI0FiUq2tbe88P49b7Y1dEwu9TDIguQnyd0RyluaToNikkQ/f3Ya8jIVGHHq04c4YwMnk
	 q8Zkm0geIICQKwmxQ5DX7oahH8pdWIrWOIWYk8D478lD14mqELaa6cl7JY/jD/0MnC01T
	 +dWF1v2xa4bS1J5Y1HSZor96IM6TFEC03ZUem7Y9cjwweDhBP3SE5zCRNJ45LZLFdWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.113
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C78606A31A;
	Mon, 23 Nov 2026 11:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnQQH6kGHZ6cSZScD5v9vklLDr5vcYNuuCQ5TDukUtJZDkw5kSSrFB2XHLKqnk5uK2qsr+DCf/AoDxQjdX8a8jNj3all82W10yZ8BEW3WBV6wm46TXbFKv/pQs6xl5mBwRw1MPxmb/XNfnQnOrWPUhPE1CqV9ocyqdYA4llQmALxiahffuIskL8F0N1Lqi6wSQGT1+aUWmhgwDer/I6lv4SAgJ/B/wroJVMVTYv2MtUi9dNDPeVEX6p7llO2H+s5b5TX0vhu1K6XDqOaeJ44j2Ugh1kV1/Xe6huQirYplxxbFHhaFy7MvvdjTlh5zyIyMrJPbL67g6fpxWYIAp83Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of0s7r/MNUWuRA9Wsnbejb4z8ch2gGOjwsiQjSIVkE4=;
 b=H47d4/+jV2xNZg+684cDHm15rlPrPzznnyaVXnlfkE2h2EPQccyFl1fZq7HrxvGKO5EuS9+WSNcMb51RNK+TjRYisksH+68qcovy1wLldTmOFCU20wiPG4Rz4qrTu+o0YwmmZvOuzNR4ZYol7AROXfPAIsAv26O1dtridq/q+iRRIqtsxJ2iVAJ8fl62OE88DCM3EOMlMWUH//HFxkDyjCIjkbpTnaHN4XFiBFk9G146mYhj4sOVQzWLFB1/hQDSgY1vDzxp1aS5d8baI1qwKarcBOrI7qlc7IFn2arJ9BCxDG77aZ6K8/1DaaRAvdU2oz5AoysLSykaS1KqCHMfHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:04 +0000
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
Subject: [PATCH v3 0/6] Add System-0 CRG for JHB100 SoC
Date: Mon, 23 Nov 2026 03:20:47 -0800
Message-Id: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::13) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: f1795166-3fff-400c-7b2d-08df4953dca2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IfemFLzu8WeSHIJqBnrZYXuTEnvsrhjXOXAO1X3vnFZo5pLPqLL1yo0FlDs7avEp2f49Se4LPQiAPXuHDeCRsQKpADaCOh15rMq8lLYBnXChrscKyuNIxdwK2AUabxn4u3lvyHGvunKCayrYz6Eb9TaWTvo/ijKn+X/vhCx8wbgdPyQQk0GOvOywDnPvVZyoHcfYbxDy0TF06C3oGtHUunr/brrqPNKZ0yV6o38q5LoW39HfQ+2ieBtZHF/YYKv0M5vvOc/9wvMKfmEtvo5Jp7ixeWGRni3FQ5nq8hGv6lE5sJmSTm4FUsPrh4GgdVTrfpMXuUxl25BFOFE8LdL0WSyRPRIun4Sa41QqhiEzQxS3cKmCv3VfYgPlOAXBNwDsm8NMBBrR+w+pqidePMKoitLCESnYGROcjyx/ZuMOZHUgqb2ppyjewEEa909znLTpKKCQy1H8G5JNf1vywSTLwU8Dmr1kxxEl9qLzKjEBZDxL778JTrg8p1FeOeeGLjUaLCJCVp4KZygFuYTF+5qc69dQThTtnmw3WK1Q9axEwVy5ugLBYAF0VynWbgIkxMC5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kgvaE5HXe/PJQixZ9ME3m/dwcOsAkRZSx8EQLxv6pQhJlO62jFikNYbePo+v?=
 =?us-ascii?Q?tCrTUWrIHZHia+x8iqD6xz+yGDhEJjX7rb2eCqR20amRIoEwKRffCkiJ54VQ?=
 =?us-ascii?Q?LgkqCDll+x2n17RRs7wUj/qxQV16e4PjgDY4jQh6N7gQDGx1cm3YY5F/AxDa?=
 =?us-ascii?Q?67VdzbFecXhqKNau4uJqXT/xMi9RDs8HqhG0ZCvZkaCxsZM6VUcFpHCsZDhe?=
 =?us-ascii?Q?fI10GkoMdIHgofBV1OEQl5sHqxvVVWJh6fpiGd681YZaXFFog1RH21ujorjD?=
 =?us-ascii?Q?SCcabotVOjoxhNRh7SkHARxPhS9WV8x/TmhuSxIATn1yp8CBFnXXnV+W9ftQ?=
 =?us-ascii?Q?D54aQNYgkevxgtS34G0tRHo4M3/S1eErLgH06viUzEgjD7CjwCuyHPSt7TkC?=
 =?us-ascii?Q?tQuRHtZwbQAMmThDjvQ9MqadtLFdOJjLndma3FOgigdyXcxq2fRwKz/WKdG8?=
 =?us-ascii?Q?4QEkvJAyj+BGcvWUM1/z3eqwV1YjZkrZZX7W4YhwLEQMka1TGcAaBsaij5nS?=
 =?us-ascii?Q?V2z9WG4J3vISs4PfwlUJPmAL9Gt8GizEqxwWzID2pblMPWLU79YE2F3i0OYM?=
 =?us-ascii?Q?JqBU5rOyp3syt8U0PkC4L6ykG6yaLGZvusSJ6AC1a1TnGse85X9Kokj5Hdg4?=
 =?us-ascii?Q?B7twrYRy3645xs6DJ7q2Y9M6hx6EFAlhYj7pcr0yy3C7kk8YkSU9+Imzticc?=
 =?us-ascii?Q?1TkY7B3JAM3NBBvHMC7ng/Q4UJpMXd77dPgNjcC+7jQ40XCUKu2JrVOddQMK?=
 =?us-ascii?Q?efGWBApUrHd6YF7bwHcwk/plEZoaNNcvgNLWaaXE7I0SlLnIeloopWOPeniY?=
 =?us-ascii?Q?Y3ydGQymBpIQr9CM5z6Sjkl87DBfL0KbT+tAFNK6QDhGYb6vX8Yf3m3QJzp/?=
 =?us-ascii?Q?XC1dVuSpsWIwY+ZV1wv0XQX8Z98t3OHAQywYshIuFkkcQ73DwCpSE5ma6a5B?=
 =?us-ascii?Q?/2qKvMNrVDI1odfUHGfQuvgTNAoqa110Vq+0Iw3AisnQpUQ/yIEFxLcHn/uQ?=
 =?us-ascii?Q?wRgLmKXKhqGiLbvB1twyU3XhXdXXeismUKnchWv/a0MjZ11P/zGN8G24k3aU?=
 =?us-ascii?Q?EErqiBETFmfV+GHU9FoWFc4JGS5oh06JY2njOYiBlg9BsXB/0RlJi9WUjqX0?=
 =?us-ascii?Q?bK/u9pdWCBfY2XEmrfbkPpQb1FswJsTSIHiTx1DY2Jw213nV1gE8CWZqftiM?=
 =?us-ascii?Q?htr22vL1ZheifOyKBVDxUc7/GNIlqksi/fpZ4Ws0z/tJTMaNFUg44OPTMhMs?=
 =?us-ascii?Q?4oNf1l2bCtEfZ56NbnQf/PtJA6ewgTi/hsl1r4K1XP1I20GMDHJcToPICaSK?=
 =?us-ascii?Q?UBaU+D+7Bgb1edZd2lvezBwWLC9uZQTayRv0k6TU193Ws7gvVFghxQjOcGbW?=
 =?us-ascii?Q?TGrz0JAssV9jefvbMMZUN/liYdhqC1OJcoaIbqQbOT242tUodyw2ETe2UqG8?=
 =?us-ascii?Q?bZYk4vmhKpYBeBaQhw13bkbA7pNihsFrxagZq1Pk2SLPDTpB3vExqaARmXig?=
 =?us-ascii?Q?iPSvTbF130Rn7bIBgkv8406lLNqy45TJT9pR13I3ItXbkz/EuKiCYoTvBoD0?=
 =?us-ascii?Q?jyXGvG+2fCqk/uSME4zsFeY3c2i3ublCvMhsO4yXQO42kEqlhyTnllCh4O2A?=
 =?us-ascii?Q?6gFcD/lK/fa7WX+4MwflaGEQhgZuD0ZW3VGG0PF+TY6OfjBWoIkJXs6ozAyq?=
 =?us-ascii?Q?GZHo93xa2OpXpb/uRTb+Adbpd8jDrN7vwtFUGTT6uMUC0ZkzPVSkn+ZrXU4S?=
 =?us-ascii?Q?N6084wfnhsz+YidgedVCq6EauvowYcFRB4yDfH3JabZPZwCdA8DW?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1795166-3fff-400c-7b2d-08df4953dca2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:04.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IRPmy+VUt97Aibryx4uHSuOJuPAx5n1t0KscDMfvy6id2Zq3uZoS7NsH5Y5O7j9eOjO6iso2kA0aZxdpl4IMWRZRIE8dB2cKc1dD/INQV13/7r9vKlW3nkhbSAdvYCJy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219

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

changes since v2:

Patch 1:
- Update fixes tag's target commit.
- Add Hal's Acked-by tag.

Patch 2/3/4:
- Add Hal's Acked-by tag.

Patch 5:
- Delete the redundant dev_info.
- Add Philipp's Reviewed-by and Acked-by tags.
- Add Hal's Acked-by tag.

Patch 6:
- Add Philipp's Reviewed-by and Acked-by tags.
- Add Hal's Acked-by tag.

v2: https://lore.kernel.org/all/20261118100523.11395-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20261013102707.9207-1-changhuang.liang@starfivetech.com/

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
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  57 +-------
 .../clk/starfive/clk-starfive-jh7110-vout.c   |   2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |   4 -
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 116 ++++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  36 +++++
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 137 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   8 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jh7110.c    |  19 ++-
 .../reset/starfive/reset-starfive-jh71x0.c    |  58 ++++++++
 .../reset/starfive/reset-starfive-jh71x0.h    |  24 +++
 .../reset/starfive/reset-starfive-jhb100.c    |  74 ++++++++++
 include/soc/starfive/reset-starfive-jh71x0.h  |  12 +-
 19 files changed, 496 insertions(+), 85 deletions(-)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c


base-commit: fd21b9ae59febb9b0d2dfb096a02f316321e5c8b
--
2.25.1
