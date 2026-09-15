Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741153CB8F1;
	Tue, 15 Sep 2026 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439274; cv=fail; b=cnQv/gMY5V9/J7y/z17yyO3YGHZeXLcSy8tzwzLYhfW1qhpoIr/EmgJ1QEgxSSMtAuTg02rybEBqaz4zBP18S0vRkmCtJ7c9YV8J3DuqnYS6leVE8ZVpHl8hOu6ILy7jw8UDay0kUl+vCaRUK5Tz2xzOrb+91WUZqw/8loIzt10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439274; c=relaxed/simple;
	bh=XZeWr3UUlgaTs6wZz8mdBLeRF8h32OTCzJ13MFk8Q/o=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=jDUCEsa2q73+PtRCaoIvwG6Hiift7b+v3uykKPounARTtIY3eG1lUcpc4G1Qz4NbZEPbBEe4ZmlDlSQRCJ9+ahKim4GoDkLWZDBn/ij/VLvhsQ/7sX+MLL41K6t2PGNOOxl/IPlha0guCgopAeK6JgTbhAspEbD3tEkK2noz/5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KE46Zs5N; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KE46Zs5N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRIizNKVjG3zV/PdgpFR3OtXIBr5A/vxlbGdrZv4lMpKGtm3XdFiVwc0JWDIAg2v+YMKq9qkM3atW+q2iydVFrLPIH1PoYQYyMekzsL+t79d0kzn3o+SF75L04rBRTLW+PZbSP2TdV6TLRMlZ4i6bUeILnCvlQRVleTUX3H1X2Xj1uFzCOd+xK2t5QqedKqQHi/l1qSRZ2Okm9V8Kp6cDQd+/bkEN5dUdpY7aJ4zbids1VbK4K4IlKU95O/Yp5bvZKgm2hbonXwKKO4Lug59LGqoYQuNTTUcKquhLOm+6cHRzy5P5nyzaJ9cmDcXzkP1morEnoVUERYgKwnXYg/Mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoF1oorvlLpIeRI2I3YkXfzFqZvmc2fhrqm3kh/Tar0=;
 b=aMkXFZU36fIr4zVKXJkwZVIqPaRVHk6rgb2NFxc05fUz3U1tRz4wcin7ajQhi2DgqGbXg6pCtwEHhexhm6d/pcP8IGI4D3e3okH7oSprYDtkmYJGGLXocCqkwMEVXtdnjkCcRwPlC+A+vhc6Ar5ksJsZVe8g9Wyw33YJcuvyWBBPgS7ljMzVEF3rRaxzmTxP2Q5mXnKIxhtG6gHiRk5aBBmt9+Vo4Gva5hCwcegcMnFtxWuRwqzppFGSiKfsiLSrQ1Oh5+1yY7kCIadFBPAKeB0KtizbiuG9SqMoF8UG9e/x6cECYUnF79p5d9PqGY2MUjJHG94K7H7fIuKENcjdgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoF1oorvlLpIeRI2I3YkXfzFqZvmc2fhrqm3kh/Tar0=;
 b=KE46Zs5NLlqZlyV8tpKBhERui0J1hs5W4kUzpn4YISA7aajQcLAR4itJx/xmxx23Yuu1U+JxIBcK9qCnMcFf1Kougb6/NPO2VTx4SWePKGB5fKRYPnLr+qXtCtvXDH8Lfdh+KXwTfXTnhoU8p21voreajXWuGayJDRoCLo5nOsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB15713.jpnprd01.prod.outlook.com
 (2603:1096:604:3cb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 02:27:50 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:27:50 +0000
Message-ID: <87cxufs0yi.wl-kuninori.morimoto.gx@renesas.com>
To: Brian Masney <bmasney+clk@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Anh Nguyen <anh.nguyen.pv@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] clk: renesas: r8a779g0: Add ZG clocks
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Sep 2026 02:27:49 +0000
X-ClientProxiedBy: TY4P286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::11) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB15713:EE_
X-MS-Office365-Filtering-Correlation-Id: 392f80de-c094-4979-627c-08df12d0eff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	SNMlG3is59VE3TkV+UROJEnOGIvRMHSvKe0J+1AdLtW4SAXnRRgcYWeM6ZYdyXzJWKTnM2HA2wax8b8sBuwt4VTnaAaYj9ZTkjghhWdWPNYINNKtojAtVa8T0zWQ/K7rBxsM3jWndU6tgYtp8k9bmx15uGB/GVxaTGc7XCkcTn7YFcpWEBQFMviF6S3vs10Z03h2mMFXAgqqWNN3m81LAGLz1/s5TJArtR5ZVxf/IkL0u2xVcofq2OxGytWWEujFspXmz98DIobBZye3etABMOrDUhSmQqOW5fdVcQ4ycUzeDBRiSrkSG7mey8W2x4xf9TPGVjYP9j40WIA7y/zu6b/Wm5Nj7eeldf66rFRYvA3PnDrkD7R7X0NEXQYyqn2TCDfyXjSLz7+37JrEt8ZiA9wKGaYCdLhhj6JMY5gg73EEXLCqTVCtj5X2d9lygTiby/PvBVkmn0s4roaPDTzk2+6XffV7ot0sSEg6xdqH80HgvuNxEszEmd+o7n52isvrCV918UqKMU2WYZtSIGM7cV0mmlZ/3OD5EX/d9oBpyWouNL10cvRGHrhOFl6hbcG/eOEGcTGCPmGpva5zEK0DKjZMRyXpJ2x2sXmZjlrru7z4E+dljhaS+yNL3vMzPZNjQ/zvEIfY+X+54WBr3fA/G4SLY74dPwR8KuvXQboOGw6uM65TSyO4DplsNAzwSrGWWiNvATizy517x/XsdD0Z+hbxsm9nqScdREBI8OaHs7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ketRiKC3BKRBvhN9tO5+eHmUp0OkHMtay437bs8bEGb2lOdrF8Gz1EzEqPO?=
 =?us-ascii?Q?kOE4oVpyBP3spMEUnEa5+f1ZmGuqSa+0p9WkM8+OiiHAcueV1/nhrI6vP58e?=
 =?us-ascii?Q?283NATmtxw+jNgR13pdhurTuA7Tv3TVRPIoAqIAfSX/LZghbUuQ62BQqnjxD?=
 =?us-ascii?Q?uF/iU089WYD9kSVxvqBVyPk/h4doF8jD7rhVnO8uXQSx5XcdPwCKQTYo1fN7?=
 =?us-ascii?Q?8mToW9im0dWD37RAvUVsmxhn7WHeu1PWom0PKnehx4qSL69B8bfpPejmlVKQ?=
 =?us-ascii?Q?2jK9jrqXLq+7H5mEX7z7zOL34Q6k113Q4LQgxlngD2hs2ar6BSuDPTC5vuiP?=
 =?us-ascii?Q?wC6ym0xwnO3ZlEkinmxCZLK309zAwfIyFSAurJPTCDW7+EmEQnVYYlriCSVs?=
 =?us-ascii?Q?dBRUxHMlJB2jrDj8sM6Hv6oo9LFGO0xqoI7X9tE8frgQ41aQTJr1TgiOTqpF?=
 =?us-ascii?Q?eW17Q/TqHqgduSwGTkKIxdu8b7r0/AXAHEJxG5HBQvnqhWb/63nwwynG5wc+?=
 =?us-ascii?Q?SnbcnJJV5547ZDz1FsF99zmai6keSBQocaNtdnX7XhWhWXEPnW3fafDtRtWc?=
 =?us-ascii?Q?SXzA1FpxRF4sSAB9ILv9SjywZp8msqhAl4CIf0Ri8z+CH/JnNyWXb3gyA4XS?=
 =?us-ascii?Q?rgCe9uy/2/dg7oL0XQ2wUe6gSnYKnzRUu8/aa45oZcFMALPKNjIHCbaIgEh7?=
 =?us-ascii?Q?02MKVJxNdqDmp9us8dYGLigDxwZV+mSXcSzx1ooDkoaKBfso5W/qpcDpTGaf?=
 =?us-ascii?Q?PCcuSw+ot03Amw3YpYZQlBdG29zMyuEwrNe4SNiJyJLLpHGzMltactSiEeBn?=
 =?us-ascii?Q?x6dKMsS03XPzuSycAUMinQR26EYrQVEo1Hjp9snfwzgylGOVO5GqDOFV6p6A?=
 =?us-ascii?Q?o8iVLjpJbwCkMhito7CgEdQZrmOxHRIh6qpwZbgaARlKTEOe0/mzXWAYVb5X?=
 =?us-ascii?Q?46pTDoSEwCyadRIcYPjE73AHSHPXuqXaru1gDx7Slq21oiRfVX/D6NybPKAG?=
 =?us-ascii?Q?9PfYn7E3GZZ17EVly17lnskOxfdx07/0rNnxsqXnLVrx2RNkj5RWQ1QG8Ajw?=
 =?us-ascii?Q?wQLKNQhdkK0TDXdKclUSxUB2gacVL2UnG6YvahIUECNNjuvwqLfvVv62viR0?=
 =?us-ascii?Q?0xDDhScxcY48Z6DmdKT1FpxNE81dBQMHk4C8uomqASZ7VkS4Rrnhqkc3W48l?=
 =?us-ascii?Q?okw73i8fLZBwvo1SnitlnG51+AB1eM8Cb3HT8y4+uXAPJKBK4l/pB87dE1PW?=
 =?us-ascii?Q?kmZf6luqTr5o4djdW5wEpKi8elrKCDjQZzx0l/2gc2WOrapZ9acRHuCwKeUa?=
 =?us-ascii?Q?Bmu+q2YN4ctkQAZqminMtZtoCT6Nme7JyX/R+BQn8zr9BROyuFgt4Ikx5y7U?=
 =?us-ascii?Q?8P6XL73GwNhnYEpOyPTOCKWEMqAWSbVK2GxQ24Rr9nu27j2BuuOF0GrUbzpq?=
 =?us-ascii?Q?aK/ckMkIOp2fPxsFjFXyB3vXrHyxiaRby+yIr24kVS63dHv6vqj8mWpm3zEK?=
 =?us-ascii?Q?NhGEm/ldNq4GKvWJDFJWI331ADYEurOMak4oh2n1xSLABveN+d8tb0WRkqUB?=
 =?us-ascii?Q?YsWeNO7mVsfdRYWTPjrSUBDsTzt5sRxHTxgpLKfxK+DJYyZZSlMG3d2x+/6/?=
 =?us-ascii?Q?QCQrspuWeKXoUqlcnP6L+cUUkGgqrF/Kd79P7GDoSVhw2iO+3YM86SdwO8qw?=
 =?us-ascii?Q?fHqAwxfKeI0hkoqn7tzejfRzbn3Icwu+/en0InBzYiv+VWUp/u7Mo60v2E5d?=
 =?us-ascii?Q?W0QdTYGa/o1u1/NkorqMaVd6LDHFb8JnBReDFTNZpOjUlSakwElA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392f80de-c094-4979-627c-08df12d0eff1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:27:49.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXzQToOF+j/wOthR7R+HrYoW5wiAb0VQSCmn3rbGYeVqRZvIoUeetRzL+6DZW8j+l0ztbkPyRiCeQRpYJLLXKShcQ9JLud4JYsBb4y4mtlUwuppgTN++KPlqY/JI3+Xa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15713


Hi Geert

This patch tidyp DEF_GEN4_Z(), and adds ZG clocks for r8a779g0

Kuninori Morimoto (2):
  clk: renesas: tidyup DEF_GEN4_Z()
  clk: renesas: r8a779g0: Add ZG clocks

 drivers/clk/renesas/r8a779a0-cpg-mssr.c |  6 +++---
 drivers/clk/renesas/r8a779f0-cpg-mssr.c |  4 ++--
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  4 +++-
 drivers/clk/renesas/r8a779h0-cpg-mssr.c |  8 ++++----
 drivers/clk/renesas/rcar-gen4-cpg.c     | 25 +++++++++++--------------
 drivers/clk/renesas/rcar-gen4-cpg.h     | 13 +++++++++++--
 6 files changed, 34 insertions(+), 26 deletions(-)

-- 
2.53.0

