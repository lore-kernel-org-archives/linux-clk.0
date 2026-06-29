Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021075.outbound.protection.outlook.com [52.101.62.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373F73A9D9B;
	Mon, 29 Jun 2026 20:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766439; cv=fail; b=sLtKfn1GQNSUOupKKJQzq38izKxkeQ2NRLTtsIoujN/t1bvKEiuPUm/Og8XPFwxXyq61p9nQ5Q06AIwVXNqdLomxQDtIunUj9X4OTTeC3GzKRvZqvSgCtdju25Cd3oZAJ/gxy65Cwh6Rl8/fdP3rl+t9IJIk1av99WaqrcgOUfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766439; c=relaxed/simple;
	bh=DIux0CaVlrF0FA+FCPIfV3AdfdLSYQXo23Ujk8fcRCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VVJpvWvObyPB0DiJtRAIpMwKkgZrettBtNctrSVYm9XkYmQ4uDTxzGBVJE4AZcllLJhAF2TwhW7S8/HBi34MCJm4c6KwvFveFpclp8tlKbcp4AJHXoSbCtUg7JIz0e+uxnAMERSu2GWLIpE6M5c3KSkcAnAEcgtHnGgdjY5edio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=K9jpuO8Z; arc=fail smtp.client-ip=52.101.62.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="K9jpuO8Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzJgvLE3K/QrN4bozhLp926zYqPhWdMgKuziTe+z4prAqrWga8B5OTneCUEy/CI4ZGKqzOTADaNvhQ8aEFwmsmu0IR10aMmmGhTXSnv8yjAhZkw+Lr++T7DiqU5gB1kzGULkBnjbW5ZZqYaRp4h4NYPxySJIlDqe/zTlVEtPHrUBjeTWTNXaEzx7pSav1X09KOcEdm46U8+JOEzSD18UMZ5ESMM1be7QHimNj+z966qVPH18fI5GTpIgck7KJ8IbJTo/LafmFKsPhNF1+QljZdYZY8xM2+dfkRwBAFXegYAdCCv2If88DztnIF1c7jbtfvjS6lBFTSu2+k85ZvJtbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvUemmIDJu4RTh8sTckIOTe9PHQR4W57RxU32jwA8N4=;
 b=MIYcaAbSxPFTVuiYyfresQkXMVEbFay58jso7WqereW2avKYf0TLPhQ8k0dCNR6FbI7qrF28FZJPuTRpumGX2zxlXwDoSYdkbARJSlCPWa8d250XQNGDQX/NHo0UhBbNRyBvKd75/Yur+/OWazzx7K8AG3rvsHUZQTykCxIszCLR3ciSG9rd5wm5aX8enK3q53qrPssHzFgjSP5rVbatgYd2O9Kgzk+JfBPoE9O8vesKSYcQP1gNHiv/gK4iaZuV9SO+JfQvA4aXAJK3qQQ0yfpgIBHGLlprAZ5THGaXo6hYhCaoG/7azt3zLz0WCHu6Osw93wWxHE8O0tEodX1VYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvUemmIDJu4RTh8sTckIOTe9PHQR4W57RxU32jwA8N4=;
 b=K9jpuO8ZoUL83Pt9P6DEI/6Mh7N4SkYDb6WWghFREjQSYDSmx8V1j0TCoWTdEyeiIDQJEwLqwVo0K6+umaQrC3JH3ftJrveze13zsIj1nhTA7jW//A90y/73DWt8DUhCGyPidlnqDVi6fPgUnE0YN5m8ldkoLc0bRK50UUY7LSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 20:53:55 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 20:53:55 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Brian Masney <bmasney@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH_v2 3/3] clk: clocking-wizard: remove 20kHz restriction
Date: Mon, 29 Jun 2026 15:53:46 -0500
Message-ID: <20260629205346.3228886-4-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629205346.3228886-1-colin.foster@in-advantage.com>
References: <20260629205346.3228886-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:408:f6::22) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 55afa4e2-77d0-479c-c5fa-08ded62088b6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|3023799007|11063799006|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jtK0WIyxk6PVQ88iPZwWry2+yRcUYOBvMkEyGXYnGBpaSIaKCpw6Vd63c6b1AnFrzUU+r3WS3Z30ib/WVWPpx9Zv9okbYfvVL1WgEyEI5bqINxZT/3jhIIgVy5Ysz+7A/U0w5fJGbPVtq0U0C4kKCMb9zsMW5BsSpXa8pDnTUcdxbHBT4Zj6AiW5iK4Bu/haSwIL9SrR2s9cpypuDpsRf5cTwn6FgmWYm7yOhzU8Ag+dp3wn9Mmh5mMe0gdN1s3P3JHIQpx9Tewjs7aZn9L93f135rOgYuuVDG37yR+SHORzR+QufRdSBN6+Y86rn7awa0U9WimltOxyG4htc0EKV3EPr32XQ9XaRwDPL2mZCDoeuPIrW25d450O4Np7EPmdtZoaYFrugnQYCjpLpUJT90GM40PHRS+WAH4rSn32DwoN93BgTXdkR/LdWTswreIMtt/rLT7InTyOyUf7dmAylBxYKfG17lgIVm6x62+HRNVf+v1WNDr9hPSOn4TfzvuBq/sqS+Khj/p4zuqEFkiTj8aene5ErSFcavnBWCem4MitpT2gYc3pb9raCYe3Ph0o0jlPWRwmmtdesi9xQ1rQvFTwAd28z0SFoUY8iXwlIsTu0SVZ5NYer2J+gETnebc/xK43MM1lP7Mt4bb6w91qnlviBJXxOoGRLFxLiGfenlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(3023799007)(11063799006)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tys4RFKLVU9i0uump+nmcTjyDf7kq/P4wnzxE3jHiCmdRufKkyvtUNkiGHX5?=
 =?us-ascii?Q?yqN4uVDZj6GGRFNIFVaSDKUvewdzbjT42IO+STa2fzdXSPNZ8/r0/EWXHWrE?=
 =?us-ascii?Q?P/28aPvkI7UmrQgqItTZZiWYlgy/rUIg3gprrzPVZ/mh5Nwy6P/XN1WdJEVv?=
 =?us-ascii?Q?RJTIRCjTGkN5LhyumQNf/A7eG7Kmq0CWGg/5qEbkYVaSPEFNNBw9Bqa2wvKf?=
 =?us-ascii?Q?I1ssg2ewU5faLnOjq3mP+a6J3WhsqOP6Fo7zcUfnPL7d5I034Yo3YCM70Ksf?=
 =?us-ascii?Q?fnuC1geePAmr7t0yaafxvbUpGWru4wHe8k1/BzlObUo5Uq0LDt71DWYt4VWs?=
 =?us-ascii?Q?sEzobR6v8ZQuVIHXHE1A8OHaMXN2nUz5VvvHc7+dc1w86dbx7eSq9OFC6GF4?=
 =?us-ascii?Q?B2PeKtwzLGjnEPATagORBTKyS5VnSd3Gesj+JewX+cbt7leekrCdAuOsF6Rn?=
 =?us-ascii?Q?TqtSXA/sbw/qvVPXgGWqsyC772hIHs1tX6Wwh+6ERPodL+Hutn58CF4rwtlI?=
 =?us-ascii?Q?z9izMIi4Tpqrk+9TZ7yD45odGx3QDG5+Pq9xQBHW5ZBB8R+ZzxSHCkbOgTHG?=
 =?us-ascii?Q?45wBBT9WKaXR3wGfe7YxpLsXK6ft/kK0+tDBFrrDmUCuGAHqCzMQZGksPupy?=
 =?us-ascii?Q?xJglsIc4KX83yeZH8NTuZakbf7Xa/kbG+x4TaaEskZIr4GwiDcNN2hpV2dDJ?=
 =?us-ascii?Q?27myujmnmH8shTk3LR6RLZi1yDp+7qwNriMEohTBdHP216ZpdOiwGEirZ8IR?=
 =?us-ascii?Q?XbcdjmNznAbVC1ngK+7S43+7cwlfNo9NBaO8iifdjoQZRkRLACTG8UxzJJOT?=
 =?us-ascii?Q?GR6w/FvsQpz6qJWsZw5A1rEOYmOxCa30PN4UG2JMhoms5bvpbYtNOEnzHDGP?=
 =?us-ascii?Q?FACnZlVr+qpOzltSlJd6TchRphXSNbGXMzrnPru5Qcip4lQM6LGkRN1aKcRq?=
 =?us-ascii?Q?G/BGMmnkrM31qo5OnLM6rj+NEAS+GVtCZ9woGDBKS+ocFOCOcxM7KcQqOc7w?=
 =?us-ascii?Q?pZ7khHsGnsXbpRHKJftl3Izd8Pbhwpeo2n0fPLZgK4o9trWBLWPRL6Kb/LV9?=
 =?us-ascii?Q?Y/mlhe+9Srt0aLQf6cGKH5nm0ABXhskswp33MZg3rA8zx/M1qJ06ysINuaFS?=
 =?us-ascii?Q?UBc4D42+FMMgMU2pP2HZvp0aHd2xYZUEllnprZwTy1CkYxlOdf1yASbBZZyI?=
 =?us-ascii?Q?PYnsD7BgRnMnQTPJHxDXl1BH3K7PI25sMro7gjmpaIseInWqfRWez53vvjHN?=
 =?us-ascii?Q?VDYjhZrGqW7rv2v+4Xy57MWkAHRMHmHdxatYrqSVBdX0L0+fvDXvoJw/1HlF?=
 =?us-ascii?Q?dmlIzJ7Vqp/73nVmgrUt23L78/P4d298NmLgaBq19FOow1HeHObxSXOzUzek?=
 =?us-ascii?Q?zWgi29Nz3pfik8oAQ5lt8YdsTmBe9wSJJxNpouQRRM3sFIiC5VagxQiYJOu2?=
 =?us-ascii?Q?IV1dLeblB49zbMORyrqgRSPpFqKl/zXA1D8sK7c4hukTsEBolRnGQ6rNu6i0?=
 =?us-ascii?Q?fCflkisKq4y/01Ha/T87e8e0emYe1czABPpHmucnBsqFTyfkbZ1IC2receCS?=
 =?us-ascii?Q?d7Z6pfNwVYShuVaUlm0LohCeGQOYPVwcFri98nAKhCOJ2pNZ0Yzg4OLo8vbN?=
 =?us-ascii?Q?Q6fJuH9Biv+lL+dTBJvPI/t5ekn2LaLp6Otl6SB8lI3l2+mhkNyLBkbjaEe7?=
 =?us-ascii?Q?2fn/HjG39EaGCxmbYz9ztcX6Y2AV5YUMSZr0zl6aJaB8q74RasrkkeN7OXF8?=
 =?us-ascii?Q?G+2baPtGrBwuMGLJmqwwMe8fY7l9UFY=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55afa4e2-77d0-479c-c5fa-08ded62088b6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:53:55.5646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcsPPvIjb4IeBxqrQeaLvPBK9vfEsSDhWP9j27hHAoDaJkfri4OGfzWJsmNo0fwFjiSRqal1ImFUXfsj2cNRMvTbScR2YRXraYGS7P+VV2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749

There is a 20KHz minimum target for clock difference that was baked into
the driver. This is unnecessary, and causes target clock frequencies to
be rejected that should otherwise succeed.

The discrepancy existed in versal drivers as well, but was removed as
part of 'commit e0a94c6bb5b4 ("clk: xilinx: Optimize divisor search in
clk_wzrd_get_divisors_ver()")'

Apply the change to allow differences >= 20kHz.

Before the change:

8<--------
clk-wizard-test: requesting 133312000 Hz on output 0 (clock NOT enabled)
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
clk-wizard-test: clk_set_rate(133312000) failed: -22
8<--------

After the change:

8<--------
clk-wizard-test: requesting 133312000 Hz on output 0 (clock NOT enabled)
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
*** Clock wizard - Matching for rate 133312000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1302038
m = 36, d = 1, o = 27, freq = 133332000, diff = 20000
*** Clock wizard - Matching for rate 133332000 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1333320
m = 35, d = 1, o = 26, freq = 134614038, diff = 1282038
m = 36, d = 1, o = 27, freq = 133332000, diff = 0
clk-wizard-test: success -- actual rate: 133332000 Hz (requested 133312000 Hz, error 20000 Hz)
8<--------

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index c7e8010afae52..a8decb3ec40f4 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -105,7 +105,6 @@
 #define VER_WZRD_VCO_MAX		4320000000ULL
 #define VER_WZRD_O_MIN			2
 #define VER_WZRD_O_MAX			511
-#define WZRD_MIN_ERR			20000
 #define WZRD_FRAC_POINTS		1000
 
 /* Get the mask from width */
@@ -420,7 +419,7 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 			}
 		}
 	}
-	return best_diff < WZRD_MIN_ERR ? 0 : -EBUSY;
+	return best_diff != -1ULL ? 0 : -EBUSY;
 }
 
 static int clk_wzrd_reconfig(struct clk_wzrd_divider *divider, void __iomem *div_addr)
-- 
2.43.0

