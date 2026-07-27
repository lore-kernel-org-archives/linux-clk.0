Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285773F1ADB;
	Mon, 27 Jul 2026 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145854; cv=fail; b=qHB5L7VvZFh4W9vrQT2mEo4f/KqEDrrUgXo+vHUg+7yL09l/W0eV3RNYqz7lw9zYorRcsaQAFj4oaafltFPeTkYrPRNZrnjWDInzlYudDXmkO52/2M8XI0nETVGVHmzIVxmE/Ze7otBCmV84QKIbA/JIdP8YFzAIYpaAlrzIx2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145854; c=relaxed/simple;
	bh=eV7a8R3bA4BFzEsN1hDsL4yYX/tBkrRM39ehWrrOsTE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lIhpwSk68sirZN2z/11OOhCSRSNa7ewGhfck9N+6k8TEldxRNSXu4y4UtJKWrJm3k6JR73Pdvi01crsUXYJzgeJRmwj+lItjJaYvsO0H2H0QBS02l/wZv+GLf5Be/bA8eKHURoa8SwBikaVnJGTl96bK+dh6DbsrdnCDzPXv35I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=naXVSwXC; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="naXVSwXC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/eOwuDMRgdB6om4NnjloT9badweh/cjQprTphQMHGub1uOrcPtAfSNP1+S1o3MFzKXFaLx4BQ65OXENkaE7IBLL8kaGGdrnM8VUq73UIO1Hph843CEDh04w/tzzNOVrIqnfcAOdb9MfHwi6CBBLq3vuHe0R3BDlkEOm197qFCIxHWGMtd03cZpjN/blBLlciw6mFAG1Yegx7bCBECsiK+RlmhhGPcmxt+KjkDy+gr21ba/HCVYHqy0DJSTP+1Bn6h6YxzqWgyUnTUTk0NbJTg4hXUDomf4HdGyoLbqUezJj7J3fTWTLUpDeAf0xc0GcKN/pV4z7TXOjT+utKfb9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWypBh/YZ0l1i58bXe9RbSgpLjw9ENU7NCgZTadkKUo=;
 b=f7w2U7kQt5yIrmRKBGX8IAjVb0kGDe9ZVcw/ofrEGvDbAnSNb1IXL/ltcoA1sc9rucsrchLlDGoPSKFphQTa4W4vGXSqP2eVd1gaubveQ2rQL8ILKinF2y9sg07thqx3sjBUGLgVFqyI0HgJv/XZIb94X9ukLOsQUjvlmoRPJk1ngqCsug/hTGUVcSZxUoICj9CZd5Hac1qJLyFBD/Qc+H/5fUT0yk5xc0PQaRzlHcd6xkdP3tRp3nzDYaLuozNSp4ixjpR7zrue3sb3vP99+hCA5q84SJPqQAOMQ2lQ2b+dfRf+KJ9UA5uWPNWgvTg0evPHuQ0mMJAoTil3qjZq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWypBh/YZ0l1i58bXe9RbSgpLjw9ENU7NCgZTadkKUo=;
 b=naXVSwXCdt6uU5U8dbF/Zg9LjwyPcPoPQy0gODXGJKubQrgJN8T7R7A2+DHYDAZAigZUhuz89DrLEtaP4dE7uEC83HbZVw3oXTUTCUa913T3PMM2alxcyie8oFXCB86wmhyChM8tgk8qP7SNgZJlljr1e//EqbqHJ7EKlPL+qmxP4YrrgqJcU8pXkt3AFCmklKIFGtly4joV2H9cy+6UE8GG+/zGbD8wGbOWFWGNmzLCWp9XaUbzJc1YIzlqOcAOIcALh6ZI9JHL/s//nChL5ioNa4AKSBJZa+oAsTZSoRwhEsC8DGIJi7IzYl/tXT5+INq3ckBZuA/kURNR8Qp8hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by PH0PR03MB5751.namprd03.prod.outlook.com (2603:10b6:510:37::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:50:34 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:50:34 +0000
From: genevieve.chan@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux driver reviews <linux-drivers-review@altera.com>
Subject: [PATCH] dt-bindings: clock: agilex: mark mpu_l2ram_clk deprecated
Date: Mon, 27 Jul 2026 17:49:26 +0800
Message-Id: <20260727094926.1124-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|PH0PR03MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea54bfd-7e15-4217-b9d7-08deebc480d5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|18002099003|10067099003|56012099006|55112099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	AgG8h5zGq8a1MWHbvJ7WDAH/CJFJpiKEGFSGBRqdYjpc4QavykVfj5nmdIM+HWEgPP2yFgIwNig/dJuLkRtjD9OAzfK+O5nj1f4tiH1BWTkr6n7W4gCxir091mEHuHVt8tAfHhdJsX5h383VAykHyZd5pxXaX6H0tQOeBhudjcNVnWe0/wVit9IAHCMYF4el0UV259gwLOziotb108wo7yzyCxcYIwZYA+Gp+9o6+U14N6v6yPOup9jgKML+TnwzspPA1CqoKbWxsakt+PAI/97FHFmZ3T/ffsdoshvoxLN0FFnUEZ9VNik10mcYoMczeH5LpSR6czeN4SHVpXZLDy7bq86KzBzFSsrzbSV1aaG0JdrCTgMbr0f2YKypF9B4teb3ollYNomvFJ2T65S8q3SWb0HMxbMrqLeHirYb+UgxeHZS44aSZZ4RaqgsO8UWXLDWQ3/hOxBBLhjUBi/yKCC0UyVdRBIIF84jeIj2hNziWahCOPCSpC6L4tuw28xZNvrPdLgWhpvDA8W8eVoZDtwugX5jh72suoWwlIqJ1jvvj+dBs19ccheNgwZX04i8c0v5KMJb9rjrHwaS3wPlA3uwsdrYnsAVHrnuiWrdoH4UDAN8n+BDXEhmodXq24XtlRojOdn0ivKpNE4JhFX2XJebLZqkimw0xVqCsQ+qRw9VNzyPAv9/PnZPDOmDZFGXRjnuBQBiYQjSODZpWxphaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(18002099003)(10067099003)(56012099006)(55112099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UhrCNkgPo1vg2Vabw8douQrOYpAiK3AltaagT5s8qw8d0A1b2XCF3DyxKVCD?=
 =?us-ascii?Q?CKrAyzG1ZE1ZLtSEiDmDLsK657dwBjwasP9/+moDtsgaGR4e8vudgWGg/k8c?=
 =?us-ascii?Q?UAIoY1XvNh7p3U77vTdqsHY6MYKxn47kY6GTO/1jcKL85/8SYL4BranBFwyG?=
 =?us-ascii?Q?IqBjAOMyq6SpNfCKWWV/Pptpyrd1ogh+8wOcjcdkFmRRp06sqj87oWzXto2q?=
 =?us-ascii?Q?8ymDR6yi51lSOlc81+qWztra146SIpVskMg/MOyMF2TOw8iCe4lX60IhjVx9?=
 =?us-ascii?Q?rxgeWQWqQW2sgmETkOxI/8i1Ee2ZR0++rqx7ENvB8/DPJEMrff3KR92J/2Uo?=
 =?us-ascii?Q?8RGAK/iETbqkzbHZ78zvUxHvAlwsJQYL3F3xxBzYyhZmsNISk0Z24SQxcC+U?=
 =?us-ascii?Q?z+Q6WQDJYuAVfa4cQlY+8UK8a8uliLUgUs4LIy0k1SBBjdDI5A2MpLrV5969?=
 =?us-ascii?Q?5j5+q3UC37gkWAkgVt3xC3AJwCPWTA/un+hKEJntV2Pq4DJnmpR59gPozAZI?=
 =?us-ascii?Q?MGZt87Kd4Lzzj7d9tM8heEMi65zxkZo5c4Wo25fFRwgu5HBYU75QOOVl79lP?=
 =?us-ascii?Q?BNL6KeYxKO2vK1UF+4C/jrrwReO2V3dAwGDltgiYqjFihUE7+YsVF71WxBQr?=
 =?us-ascii?Q?ioCRYdRlKCca9Zt6tROJS+3JQGld68JYv4KFGiH4+dAxKZhuJuQDqrmu/L6l?=
 =?us-ascii?Q?OwuiBf8vyiE4Trv+jbM5cmy3TX2haaBYBxBRlzzCkFsb+XyFeha2iDhDCyOE?=
 =?us-ascii?Q?NuEcestr+d5mXyHu0GOaEY8o8vKXJwy3mOEy7LmUljq9Vug9tViOj+SOVHHs?=
 =?us-ascii?Q?hkvBOUkv3nH6NQ18PlwVIS7UpprYf4gBiI6chzEG1UWLX2nT3RbKJPboNJ1V?=
 =?us-ascii?Q?Aji5Cw1J+jliWyJYSLhtsUIWdOnZMMyAdmO9i8XTmbdPHnOnZrYawjdCjV3p?=
 =?us-ascii?Q?Q44b50dcb9OHjZdZPrQIk2V3mDyQMuDz+LHtDkX2ETXrrIXGOolW2yW9529J?=
 =?us-ascii?Q?EtH3iR2PwBLUEz4ElcsaRsbhnBNefGSKfwuCGmCuvWxJ9Y9CLfeqwzwDvWEu?=
 =?us-ascii?Q?EMf5Hl9HzVFsfsAgnmyhvyS7WAIh3GqKLw68Sve8mg2fo4IVckFIu6zaODT0?=
 =?us-ascii?Q?c3xNAJMqLgMkDb54yJTe0EhtVV4MOPo+spYbQzO+eWXGet07NbTC0L7Qk8n7?=
 =?us-ascii?Q?y0+fsNIhw3TJyBqeyqLEWpyiDviDqTPN1ud8uAw+ZOMx0vHk1Me0eMByBlLz?=
 =?us-ascii?Q?6CHx8JXR65ObDMHcGlzFWyXfpTz7m0zC1djJ++kjpSFwFOCD6nKG7Yvvo6zW?=
 =?us-ascii?Q?doWlWm66oM46y8I0jKEtMNp/9/T8LeYcD5meuJAdiSUhmKhf3IFg5LmI/LH5?=
 =?us-ascii?Q?VvQYXqfoMRflqJyVpu0OGKZe1CWPHK5xEP9jmioHnkIqc3Ycic6O8IjBBPDv?=
 =?us-ascii?Q?SwyLX2EhFzqsvpX0H9HJy4ZE2ZpkxgCv+xKeQo/Gjbk3cbLSbP9i1oAM5ixU?=
 =?us-ascii?Q?YdzxeXCIVLWdRizGRhg0FH5TY/ufnw1DslUqzvZvwpmX7cAfEiXotPRjrK5z?=
 =?us-ascii?Q?K1JZMGeAuVSk2FJ/GAT2vTgwNRS+av+sg1RkLL/Ac/nmcwfsVxoBn1UymCKi?=
 =?us-ascii?Q?LXwu7ayPWPJrgxYdtHFfn6d+KDDj8QiJigE+iRM38UteOP9ervtbT3zJjcl9?=
 =?us-ascii?Q?km/TWnbTZwn33hIIg6xTRNkViE85CQO5cPZCEBJr8m63vg0gOCY+hU4VqdQi?=
 =?us-ascii?Q?CuvWKmiq1QQdTdXqpqqg1Ldl4lz+Z1Y=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea54bfd-7e15-4217-b9d7-08deebc480d5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:50:34.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxStOmh8+REeKm8ZHYlTGGsSlN5WvRPtsWLEH1THo7D0JOrOabgk5ZmqG7ZANhYnCaC9FkD4mK66qNynAk8ivGSB4ewQ3r3/z74z/8A340w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5751

From: Genevieve Chan <genevieve.chan@altera.com>

Preliminary documentation referred to mpu_l2ram_clk, but that clock is
now mpu_ccu_clk and is already represented by AGILEX_MPU_CCU_CLK.
Keep AGILEX_MPU_L2RAM_CLK as a legacy ABI-preserved ID (do not use in
new DTs) and mark clock ID 42 as reserved/unused so it is not reused,
keeping all existing clock IDs stable for DT ABI compatibility.

Fixes: 6b3c59780ed3 ("dt-bindings: documentation: add clock bindings information for Agilex")
Cc: stable@vger.kernel.org # 5.8+
Signed-off-by: Genevieve Chan <genevieve.chan@altera.com>
---
 include/dt-bindings/clock/agilex-clock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/agilex-clock.h b/include/dt-bindings/clock/agilex-clock.h
index 06feca07e08e..de7a58a06651 100644
--- a/include/dt-bindings/clock/agilex-clock.h
+++ b/include/dt-bindings/clock/agilex-clock.h
@@ -44,6 +44,7 @@
 
 /* Gate clocks */
 #define AGILEX_MPU_CLK			30
+/* Legacy ABI ID; do not use in new DTs, use AGILEX_MPU_CCU_CLK */
 #define AGILEX_MPU_L2RAM_CLK		31
 #define AGILEX_MPU_PERIPH_CLK		32
 #define AGILEX_L4_MAIN_CLK		33
@@ -55,6 +56,7 @@
 #define AGILEX_CS_TIMER_CLK		39
 #define AGILEX_S2F_USER0_CLK		40
 #define AGILEX_EMAC0_CLK		41
+/* 42 - reserved/unused */
 #define AGILEX_EMAC1_CLK		43
 #define AGILEX_EMAC2_CLK		44
 #define AGILEX_EMAC_PTP_CLK		45
-- 
2.43.7

