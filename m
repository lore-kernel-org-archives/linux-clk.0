Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CCB3630B7;
	Wed, 16 Sep 2026 01:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523637; cv=fail; b=FQ077r83DwtLZZgLYKMjBsyHE7KoQGYmEvEfNVFMg3XAa0sHB65g163JOoKDOcZ/Kspu87pX6HyA3t5/Mvcje+ixU2nnQrn/nhcxj4+vXmh+CSsMA4FcM7m9jwHR4oaLnBjLPujgFZ9A+4pGBpfLQtPvBcilL9BGTapSpO4NBw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523637; c=relaxed/simple;
	bh=kZuTRM8DHgZIm7mGnCt8/ZP/p9qxIcEi5OtHvNOQ35s=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=IczjonnbrUTTA7gnjjvMJBvYnXWfO7wYWEh0N/XWK+f3ovecNzOYTuI8ee6QcWIzATzcs7yuaG4ZkKfbKcZk7zd/vkig758x/v2xe5EOCEz/C/haqU9+WG6Y7OLWUtbBQLWOac+1tj0J12Fn+pbJZT6c1Q4EMLCKuSPNc3h/am4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T7WqlbY5; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T7WqlbY5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qW4/QAml/V/aeCIQ2ZOs1wXqM+MoG94T/mJAgjlWuUrst2pW1bhPoRJ9UY3MwDgC748LXfdMUOD7VIGql+IGejb98KXhNL3+aFrvpuHd2S4k3YhE8vC26+fV0YQ3Xg1V8LrtGAMbqAdnkcCiA//J4Um12gGurHul+l7/HMMP7jDJ+1OF9js90KZBgzOb0NwPXigHwDJp7erIpe64KITs5q3FhHCPXjDI3tDbBMS4oZUi246mlvXxEC/O4fbEcnu68EQJhMVb0dPSvqH3r71l+CnVhEI3+I2hYHCopqF0tGyV8RQok5jnGzkonUWXyxlAue3PW3aO2NrRX39PluO57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/a4dYRlgia8WNCk6whzqe1WGU51jTZe6o5H8TW6iyk=;
 b=gIoQWbMjjrt4HvZDmyujmT2U+GphJvU+vV1oikK/VqdiXESjWul1QXKnoVT3854p7e5zWO4i1wgs6NTomq4aRs8xeP8NeQgpOZ36GMoQOwla/z/4QogR7d0HFtK35Jo3Op9NRpUfrCAJDGaW3F1ShzQ5KC/ulJolrmVu1vkdhflhnJ2eT9jhUfw9l4GbAMgxknKtWQQ1bTXAqBflJnmovCX10YC6Ax2W6Xx8zdwvwYjTrzgVBw99U9hKbUcWcMjx/S7j2I6nbxyOrVSoamRTQ+faBg1EoBkqrqRLTs4JD4IBXIDYYwH++nsR9WotH4kboXh5cbwtQBq7dGjXug7iIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/a4dYRlgia8WNCk6whzqe1WGU51jTZe6o5H8TW6iyk=;
 b=T7WqlbY5GDvQ2GZMMCbSKxoQN0geq90to+4W56sT9nckDK8S/D6e1AXKmqqitFxLvrEhb55DWGwJ5nO3zEldvCaUZQa8lnp0a3nb6jsQ17zGtlKgbTeHLibzsnc94jiYPv/vvmuDoZIDWfoQUPOuTIZnblECC+/UMeJPcietP1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OS7PR01MB13701.jpnprd01.prod.outlook.com
 (2603:1096:604:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:53:38 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 01:53:38 +0000
Message-ID: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Brian Masney <bmasney+clk@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Anh Nguyen <anh.nguyen.pv@renesas.com>
Subject: [PATCH v2 0/2] clk: renesas: r8a779g0: Add ZG clocks
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Sep 2026 01:53:38 +0000
X-ClientProxiedBy: TYCPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::11) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OS7PR01MB13701:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f7a5265-4ddd-4e0a-9b6f-08df13955395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|376014|38350700014|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tc6qE2z8sEgPabvwUUYesJNHAzVcfPHNaj/PWbR7bzKBL4zhK46su6T7LCrUKl4lL1/HDDfG5BEIxsd/iiJ2QQ5I8fl2dN33wIvlQ9W+7j6eoGjkWbN5ad2qhCNewkLB83K5QVGMLKWhc6vBn4Aaww1LZP+OHqp4eJxKRd3v1NnZa1B0bWeQmSVZ9DOxxtPtViZcJSGkfSRE8KqnJWkfNqY5wzU6ik8FL0JU7B7le6Loqe/SlmnY473FLcWObcpbatMI1EBor2LTTOnswUqxLE5d04B8FdO3u+UajZSz4AyGv7DMzn5GXoHDBRhWxyuepIf0ZazIAdePL/FQAj5QGGUryeryiUMwYeJV6/rfZu0ZfAIRs1nmYyoBlMVG8AKSV2B6Tn7jh1oEC7ATpDYxDFgF7vSLzgPeBf2BpuizF9W7LB4MVWzXcDsCI8fD/OQoxFwqaY+gbhGdRHmyQD8wZPTw44uuHcOAVrhD7y7nh1x4W/bsZdtwxMF4gjxvjyZwZZGa1fNwiInbUfWC4CuTLnRrJ+GOWRK30cKuD60pKq9qG1+k73fp9p0u/isVPSx1ZDE3cKYrmWkHrKy478J8q7wYMdM92xwRYcxuEx42FxxzezkwgCZ2G9WBqu9Wfunh6XrObMZCZfF8lXrri0BzVG7xk08H4W6Hg+c2IpE/urFraOrXxYaKTZS4+R3JQ9Uc4CF+sRzng+N6gcqgEKc7H8+B7wv9MZxrD6shQAdpxVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(376014)(38350700014)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8PFEeCqraXwz2B9I0DgitQpTvT+JlGuIcLZYH7val7W8Y8KxFYW2FHQSPV37?=
 =?us-ascii?Q?UJaw71T/CqCs1H/Mnayk0uRluYGZle8PxGRzIWZLpouMb6MfeIMFoFyptAtF?=
 =?us-ascii?Q?yfvNT+JfS1ST5oJW9DZNAylkpe8EJNfXFkKxmFlzC2M97LernZd/1cMwGEv+?=
 =?us-ascii?Q?IfX7CXFiM9Uf57rtsqWkXvxOTahrU4lJZqGKMzTLlSD83kAAjdUVUXKdFGEg?=
 =?us-ascii?Q?e65HtlYNYNkK4NkUlG2to7Wa2kEmJGQgP7Y0Uf01vbEgOjtztuSdiNMxU+mt?=
 =?us-ascii?Q?VrJbOJtWNXFdXfCm1iIvxXJCyvo+WGF+xilJLxm0xszo3j39CNjA/RKlpUSI?=
 =?us-ascii?Q?Z6tGFWSwAWowTH7G0DJM0hAhbsCVYErtcQnQktoP4/m+KyhVrCcNz+q+hKbX?=
 =?us-ascii?Q?WrI5Nkt+7QQUpTcL/rD7LQmEEF4CK3P3Z2JtzWcmEhUvubCsQd5B42xmaZIC?=
 =?us-ascii?Q?uMswH/ej9ZiQX50BpaHBFGzaMMc+N1LfPUVLS2lqpCPOBNhcgk7dwDdUj8RV?=
 =?us-ascii?Q?O1WQnw2N2KxQHMZmPHmcmZ2oxX5PtcHtK59+UjLpdgqLABo+puwnrjjkEXhB?=
 =?us-ascii?Q?XxVz2yuXVy2JCbo71wIOQpOehGi+VxwmkxI1uoQhiHhQWGuTwyUc0Ax+IlEx?=
 =?us-ascii?Q?Zmfy6bHMGyfaQdZ+s4VTtf7fJDhj8u1/IVRNh8zbo+DZFG4h3MA9EEjRYBnl?=
 =?us-ascii?Q?MtPiblFHYSRrraxoAXM8t3uDhk2qOMD0tBU/HVCksjOtI0ew/ZjB/4roaeU9?=
 =?us-ascii?Q?JsMUPRrIeRD3U36S0Ixd2fQpkSzsybXEcRXf30UHGIfcB+AhqxC+8nmoBuoJ?=
 =?us-ascii?Q?S7dOC+LrXJxqZ0A5grzXwF/ox/XZI+ZNHfsp2YFf0cYgwm7kjeMLGh9O7M1P?=
 =?us-ascii?Q?YG+ZoyGwDEqslqofVdOHEK2Y3tWk3E4iRKQZJ7pjFSbSQQ1EgonLg5NAy7LQ?=
 =?us-ascii?Q?W6x9VmmQgEv8cMAmUDWLFbQbu7DmyrdXcLXOLdFXVLVFQg6AaHYiwX2sYK3r?=
 =?us-ascii?Q?XdZt+1Z+CRVh1YwJc8M0YmIedK1LtPK88i9XXDKwfuN6b9MvMwqXyjKgKIBK?=
 =?us-ascii?Q?2VAjLWLNaa367Ed32sziveA1SqLDq96SOVohssZF5gSvgOf3n6m/zBLcKvhl?=
 =?us-ascii?Q?s4owQwnaQl1aFVlfOSS9E5IxMh3xXAHBATS+sleEazRbmTjvsFpFT6ce/ICj?=
 =?us-ascii?Q?xmcdlgugzro/T8K73xhkWtuqJjzlRQJrU0o8/btRr5bx3GjM/mj8D0EFN4Eo?=
 =?us-ascii?Q?N298uqQI8x+yem73hGWy1XbsMvUTDfZtvUsgA4VQwhl8aHHhzuZK7mNYKMwN?=
 =?us-ascii?Q?d4NCGTAvSxyup9FoSeBqxYRGDz5lqcYxS+7TEmiFsa+gLdY8mcEchR7Bithk?=
 =?us-ascii?Q?tLkALVaJruPccStJ95iUFGoDRz8oTME49rPRL7rzTgSI5GEMOPqfqesp8nUx?=
 =?us-ascii?Q?1Ec+5IMWZaDgJAbmrUpXUr3lRYi7rKhGGV4/b2wxBWtW3om8E7KTvdgiMuYE?=
 =?us-ascii?Q?G/atKOVs6mgV4TZhxrFG4aeJVW6Dk5hjthJM0kNrAjmi3cTTyrWygYpAZWpx?=
 =?us-ascii?Q?hhLNGV+tBJQ8+7+AVtkJfGP6QVVQGNbuTvGlCLC8nTU3mq8hJshfDgHvd2AA?=
 =?us-ascii?Q?twxIr2cfJaNbr1JhYBEsI7AJy5A9hpTeRnQQZzjBozz++ZsuA5qad9fucnz3?=
 =?us-ascii?Q?K/N2K1n7LGTg2a9jXXmVlfxklNXOOQSk2egQak82L3BpwlncwR7hVvqxvZLY?=
 =?us-ascii?Q?akkjySeWz/bGAMxZo+a2FK0WTjXB+qkefl5eBOCqMjSXJM9yNIrR?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7a5265-4ddd-4e0a-9b6f-08df13955395
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:53:38.4521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRTlOSCb6zIh7WQ9+SfGJVJjKF+H+FLEMea+1CWWP98IAS0t5eqP8ODK42L7N/GaWlwZ2gRQzWdzmoUrHFJnhyunLRmouZ6VUWkUrTokzZtZI29axeDpmr2wwMGkICZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13701


Hi Geert

This patch tidyp DEF_GEN4_Z(), and adds ZG clocks for r8a779g0

v1 -> v2
	- use (reg) (pos) in DEF_GEN4_Z()
	- include CLK_TYPE_GEN4_Z in DEF_GEN4_Z()

Link: https://lore.kernel.org/r/87cxufs0yi.wl-kuninori.morimoto.gx@renesas.com

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

