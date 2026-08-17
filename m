Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D33F9F4C;
	Mon, 17 Aug 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964167; cv=fail; b=sDm0gUo3xUI8kYH0jpKm4OTAGnLXN1O6E6A1xL5YYGJv47GigfkldCV9L1CQzR1B3rkpqi0QFRrnT/1sEkh4Cu+ySBrnH7nLWlIT/GCD5b7qQxthIrpKj5kRxQ1mIJLbnmMF+7T9EMWiMWr65WbkQmKPr/UiWrJlkSHmXbdAzUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964167; c=relaxed/simple;
	bh=Tuxkkg5IuPJj4DUuwYSVnd8/Ntmi+TwaAPBv6Id1NkE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a0AMEBXaUcNvkpcS3+iTJiCJ4iFi1R7DOnPi1HkN+gjk0NSKtOyMpe5tYfYwaJ6gCunti7GegNwlqQQrNIYd2GTZmIXJYk4CvnJvRpPVoGDuzpO/ilY4wVVAD0u6paUyA9FNoPaibCb676N3x5aItF90M8Bpm3stlt72QYom5Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m6Vscrhl; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m6Vscrhl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbqD/lYcLbV+JEaEqgyfiNf/ol7s8slzRNB3SAHgYyVixoTcg5ibcasOKlCUsmvQA2pma5sH8PiWW7lr/njx8gPONDhRrX9mnBAYwC8XpL3K0bF1AjlLwBdnYjsbdum5ttpud2a5djelWe6jne91efpToqBShMruftPGemA2nM8zvy30te+5uPqD3nPMpSnB5oDlRpyC/v6wvC4zZHTSRYbQO/C/8TKsjW9hbJl+x0LfvCGHhGsJYXhUmth2GdRLH7xJ1OHcb62DK4g70KcczifPsnsGqutdrFcSZpj+FdnpCffwHZGwglAEac63vMejPXGCuj85458DxoDk5ASNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK3TcodsKCtXkhtkpAvnGXwGzZSHHw6XfhLXSzl59E4=;
 b=efONFT3ZtQl+nM3v6F3naetL/pgvJ0YwQGQrk4rh+SagSnTLrzmtiFbblUR65U0tAwXA2mxvQulDHEb4KhQM44y2bXABKWR2fdNJd4haHDf3ScyJdBnwFEC1GWwowSJ6PTVMxbUd4rMFemV0aV1dPhKdFWPWKejGIWHjB4ZKDZx03Pce0jd82n/YJ9okdP2lVHlq3GRKzDsl32ShzsT3wX2boxhfEgd2NLu/OrzoVVwjzmSIDrU9wX4DBLHLt9+izqbuKB9c6vY1ydUkKwqTfmAPILYPKQIDjr3BLd+WRiLBIA09S5LgW328/OSnUsErtjukBCEpVUh55VmMxnGPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IK3TcodsKCtXkhtkpAvnGXwGzZSHHw6XfhLXSzl59E4=;
 b=m6VscrhlXdz93cnWOI5sEy9Xd7WGkDd9UG6xfSUCkUE8AhN5aF4sgFNH2gAREauLF60aE86bOxEK9rM90wiSoJBRJtDDzbV/IQ7q0TKgSL7FZPHGw4hFbj+T11/mzHid+5iAo6psIFMNZ5AlCQvfMsF9ctrMGiXQJNgxkz8wJLh+uiizPCs0ho7xfXHUTRevUxBLsBqQliCl461l3Xffl/39934NM9HsEET1bo3fQiK1KtQVYeyGSme/WBZfUlf/YDsrvLIyjdWeBl8Hp7JZ4uP1ONh0O+iW0yxoF0WdRbY/HNLxs3UXMlE2AXe7/Ooo7E32U9yLwddyde3qgosBDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:55:54 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:55:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 18:59:33 +0800
Subject: [PATCH v11 2/6] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-clk-v11-v11-2-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
In-Reply-To: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: 306ae3d9-4d91-4ce9-cde1-08defc4e1bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	76KKXVLWVGml51Y59Q/4uDs/EZp9YbhIenkdYYnMgjUss/mMa3AL4V2nqYWHYY+jx/yMrj2SMJqgx5VNEGyOnZkeLD6czauFTw75kZwquI+U7BRRUC/L9kG1gj/ascC7Ifok+nPU5xI9NWH7yWuvcTfNo1h4yg2MwsBYBtzr6h783HYOTy5IxERorOQXoxV4Lo17douz3OvbLAOhr7/cZqjYaUFVUFglGjZPeaTA/oEjt3D2oqRWdCnS64LK4Pm+j9CNfLqjmD0qgfDPJhdmcMCdGk5InLZe2PiwGd9VHVqvZStMomZ8bKhj6IEONp7UDH8gsxMFTTa9nEgLyafjXy7sP/5NaHKgSriEPnl8nSHYc3dCa1ihySrJQL1K0UFWLQpKyG1EbdY2iRRTtHV6u1weWiRYB+1fM1PERTEl59dCtTprlbWOduFg1jJoTozc+VI2CeTXJdPLwJ0qhydVdPW5v9fu2YxoyVsLAMwXSfs7kOUUAF84TbdhAu3cTcGJQmIZU1L8K/x6xdYthHWRMfrXqP8DFP7y8DbmMkjLO2yeka8Ydwdfm5/uONWLRHCHT7Ivn/cO1sUGQP1GnJOEssfC7MMhlorrb0/bZKJSnmDNjWO3R+VeYZDDBF3viT2LT95JAwgX96TnbQYpRjeTbHxUcVlz8GjCL6EYIANArbc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ExRHY2TFQvZnBTc1kvWnZDZDFGdVVzUGpuaWo4UWEyOEFnN1lURy9wdVlk?=
 =?utf-8?B?d1g4VUg0Znk2bXA5elNoS25oa0Q5S1FCbDRhcUs1VnAyNkRIeitTeHBXS0Iv?=
 =?utf-8?B?dXZWOW1XRmdOSnl5ZzhmRzFPdXcwcnJzRGVUQW1LN3o4a092clVvTnBDc2M1?=
 =?utf-8?B?ZVdQaWRrbHhkR25rNXRNU3p6dENTSkptQTU5czk2bFM1LzZ6Nytic1FZRnVP?=
 =?utf-8?B?dUFBRHBTNW10Z1h1ZXp6L1JkZExFSCt2NW5IbVI3WVVoZUd2WUpVYjBtOXRo?=
 =?utf-8?B?bG96UWVPU3hFeCtzWURYbUhWdW85V1JlOHREak1hMDRTUWhFNm15UlJGN3Bo?=
 =?utf-8?B?WWRJSGpqSWVmSFdMUUxqY0tURjNUYjBTbmFTM0RkaUU3cXRVUVRPaDgyQzI3?=
 =?utf-8?B?NUFHWjdPS2pJd3M4ZjMvSklFMk13WVM3eDF6bGErdUxJVWFMWURwSXhwNnRS?=
 =?utf-8?B?bnNJWU8vMVU3clhoZlhROE1mMlRQMWhWTVZpK0JwdFFHNGgrcVVvTnJDV015?=
 =?utf-8?B?NENtS1k5QmlzMkIyZkUrVjkvZlVaMlFaMFN1VGo2TUFBMWc0bTA3Z0pvdEwz?=
 =?utf-8?B?OTJpZnpuMzBQWkRoZkc2a2ZrbDIza3dWNitNUkRVTjVNNlJ1OWdIT21Cb1hw?=
 =?utf-8?B?Tnl6QWpSaURISExpQVlMd0p5WVZLYzdSQkMrdEFKZFJEUmJCd0RzL2tPK3Iy?=
 =?utf-8?B?NUp0WkhVK2wrRmtwbm9Fdk1tS2Jod2JmNlZ6Y0d1VXFQV290YlE4eEVDRk5O?=
 =?utf-8?B?OElkRXYrZ096b093MU91WWd3bUNwb0tkSWFuamRMeS9RRGFEY3VLVjhzcTFX?=
 =?utf-8?B?ZWh1bjRoY0xKeUtqS0N4d0UyRzQzTWF0SVJGc0pPaDdxQXVkbE42czlmMEdL?=
 =?utf-8?B?T2VGUlI4YzRscW9pbjFUNlBpdDR2VUJKZXYvRlhOd254VTdHaXR6MSs3d1Rn?=
 =?utf-8?B?cllFOElKdWJ3YWpqVkZKbWxhOTEyM2kvejNFRlVKNS9zR0NWQjhyaUJhUGZn?=
 =?utf-8?B?Tk1lSUNQTStHdzlZb3lNcmFQc05QMGROREpxd0Vka2NWVkJUYkFGbXNPcVov?=
 =?utf-8?B?KzdGRzBZQVJaZ2lkdUpuWGt5L2xwY0Zxb3Z4VytyOXBtVnRKcXpWRGFMVWhm?=
 =?utf-8?B?VGU2NDQ5VnhidnNZSExIYTBPdVhwUGlJdk8yeStuT25pcU1QT2djdndRVEhF?=
 =?utf-8?B?UTFOZWF6RVVKRlpjVTlWd0JNSWNESWlYdXN2SlhtcXpnd0p5ay9BL3FVWERE?=
 =?utf-8?B?V3h0RGk5L1RZYmNHb3RhTkRCUWtoWWZkaExSSmkvUFpyZ3RGeTI4M3ZXd244?=
 =?utf-8?B?dEhtRFZrd1ZSdWNnQ3cydU5JcitYN0I5WXcwT1p4aUFVTUZ4dlpYZEx6aThi?=
 =?utf-8?B?aWdGWHpWS2V5Zk9vaEtLVTdESDR0ZWQ4c1hMZWRVL3lxYUcyaEh4WlFvWjJB?=
 =?utf-8?B?T05SbWJlRjJwTTh3NUw3ayt2cGFhaWY0ZXNOdVd5WUtQeExHTkpYVXFsak9F?=
 =?utf-8?B?elZCek9LL3RjeEkwOTJENHlwYzlyeVZYSmZPenRrMFVUZ3JjT3BhemdSSHNV?=
 =?utf-8?B?STV2ZHZ5UWY0SmtSS2hmU1BuYW92NEdhQjUxZXNRK29lZE5zYXhFMjdsaEw5?=
 =?utf-8?B?clJpeEVFQ3FSc2tuWmxZUkd2V2haZVVtSTIvY05sOUE0bENZZjNrSW1HT3A3?=
 =?utf-8?B?VUk2TXF0MFBNNU5sNE1QcFRJWmpUaDRQcmxsVzliRHduNnlKa3BlcTE5Ti9k?=
 =?utf-8?B?c08vcTdrQlZpOVVKZ0NyS0JiUDl3YU1yeUw2ckdjckI4ZnpUejM0OERtR0Fl?=
 =?utf-8?B?VENBZU91VG05d1ZrZERkS1hrVEpzbDJwQ2ZVSy9zV0VHM3hLTytCcEpuTWxX?=
 =?utf-8?B?RVJiWlE2R2RNd1R4RWpwRUdHeFJ5MGV4NG9oNVZJa0xIUm1QZjR3L0c5Tlgz?=
 =?utf-8?B?dzBLTisyaUZSZHk1TGRqYm9LbE5XRE1mTU4wOVBqZ0NMUHlqMHBhSmdTenIr?=
 =?utf-8?B?TTFCdVBScEg5MWtlb2hzZGFZWkMxRWlnSTA0QkcrV1NkOWVyOWFhckdaZGlT?=
 =?utf-8?B?NElNM2FJdUVpWTlVNlQwOFlYN21JTm1VT3o1ZmpkU2lDRTFOMyt4TG1tWDZP?=
 =?utf-8?B?bXZXNWZVYUhEV2c3K1hibTlmS1Qrb040M1QyTG9tWnpQc05kWDBGdDZBOW5P?=
 =?utf-8?B?MlpKSm01bFNUdi9MTEJnd1JueFo0ME9oRUJ5RGFZN1ZSc0tjbFdnQzdnOHh0?=
 =?utf-8?B?VEc0ZmpjT1o5a0tyNkFEWGc5ZXdTa1J6NGlpb0hHVVVaNzBxb1c0UXJDbE5s?=
 =?utf-8?B?cGF0SnlnN2EzSFV3N0tVUGx4N3VIQ1g5U3pFa3prYkxjSnVzYVkvWDJMWmd4?=
 =?utf-8?Q?3Y9T/q8pYrPQHUe/Z75PFqR0PxVpS/9Fs/tKj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306ae3d9-4d91-4ce9-cde1-08defc4e1bef
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:55:54.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9nhRWojrLSX1Mia/vu28+K0rjt5QlZJfJMF9EZsVt444ul+N/nJqvKmDB+i8v/GNTa62bl4LRQZPOSdNDOmpRyV7kqyQjw7dOgqz6v1YGq/aKOI6V3ChXnZhqja2nRw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072

From: Peng Fan <peng.fan@nxp.com>

Add clk_hw_set_spread_spectrum to configure a clock to enable spread
spectrum feature. set_spread_spectrum ops is added for clk drivers to
have their own hardware specific implementation.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk.c            | 27 +++++++++++++++++++++++++++
 include/linux/clk-provider.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 048adfa86a5d0..8c78621cde253 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2774,6 +2774,33 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_core *core;
+	int ret;
+
+	if (!hw)
+		return 0;
+
+	core = hw->core;
+
+	clk_prepare_lock();
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto fail;
+
+	if (core->ops->set_spread_spectrum)
+		ret = core->ops->set_spread_spectrum(hw, ss_conf);
+
+	clk_pm_runtime_put(core);
+
+fail:
+	clk_prepare_unlock();
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_spread_spectrum);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index aba71f5dcc216..ad57bd18b536e 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
@@ -84,6 +85,26 @@ struct clk_duty {
 	unsigned int den;
 };
 
+enum clk_ssc_method {
+	CLK_SPREAD_NO		= CLK_SSC_NO_SPREAD,
+	CLK_SPREAD_CENTER	= CLK_SSC_CENTER_SPREAD,
+	CLK_SPREAD_UP		= CLK_SSC_UP_SPREAD,
+	CLK_SPREAD_DOWN		= CLK_SSC_DOWN_SPREAD,
+};
+
+/**
+ * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
+ *
+ * @modfreq_hz:		Modulation frequency
+ * @spread_bp:		Modulation percent in permyriad
+ * @method:		Modulation method
+ */
+struct clk_spread_spectrum {
+	u32 modfreq_hz;
+	u32 spread_bp;
+	enum clk_ssc_method method;
+};
+
 /**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
@@ -174,6 +195,12 @@ struct clk_duty {
  *		separately via calls to .set_parent and .set_rate.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @set_spread_spectrum: Optional callback used to configure the spread
+ *		spectrum modulation frequency, percentage, and method
+ *		to reduce EMI by spreading the clock frequency over a
+ *		wider range.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
  * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
  *		is expressed in ppb (parts per billion). The parent accuracy is
  *		an input parameter.
@@ -249,6 +276,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       const struct clk_spread_spectrum *ss_conf);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -1468,6 +1497,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw,
+			       const struct clk_spread_spectrum *ss_conf);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.34.1

