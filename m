Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013021.outbound.protection.outlook.com [52.101.72.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEBA37700D;
	Fri, 12 Jun 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253812; cv=fail; b=FgtCkmI+hQE2P5M3lRxxgUn7IsdrG7TelJhV53l2SIus3cMPdIO4UYQHojpTDeAu3bV0sB160Bro0U6iBsxHjxHDbFAozM4XFFu6NT/LtzVGNC9JEmJA1BYt7+AlJDL1QqPKP+doweWePK39151labKL3EIeri7HjS8bvRgT1gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253812; c=relaxed/simple;
	bh=/44ih6xD+C2FXEPqNH55yD5Lr0HFKAFMu8CWx3hYuxs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sMWBdX1R2qi6fOxPsiqNWErreeGK02wjTUpa2Oq/yEnqq1tHkIMDQd9fJrrTMF79pyPGNaedpTJkItRZUVUzCTupuQuLpvWmvFv1nPfKefS+kuawdUaqTWqeISNSjNcGQfYnqMywfd/HjHv9eUpOYg51Ykz+fvmYWTO/frnuixw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ft77+K/5; arc=fail smtp.client-ip=52.101.72.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ft77+K/5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FB+KTf4b7oIgxB68di1D1agHOtfcu3F4JPRW+BOXOfA1W5+GdZLy/DFrawMwvJFXduYOFDw0gg4wn6gngRaWEDCepTKv33HQVSidm9kPI1Ni9PFTYB1XSUfMsNQrrfS1LebCaEcXB9FEXnWVFcENfMDj0aSaImFfwbUuymVBYW4M/m1K9JPZuu3J8zjWcLCvz2Sdq2HzpaCQ4m22fZkHeshyOh27QgNEmbNmXGkmfPpbsKlq7G2lMEXyT7BU/dUyX8Sg3QwnG1PpFnJa0XvezXor0J0/pP3y+c0NJyhzaJDkSt1slXwkA4jwbfazxtNMa+KU01W0Unvvx31gu8gAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxwi8CA7EbuDp0eohPDdnrkQtv3Kmw7GTbPdUMZuy7Q=;
 b=BjOOcyLXgOV9H8BRkdNIZJAGhp6cQzR9vI6dZyRO9/kt1mJM7FEqbgf1EQRuWNwm7A8H7wVqydQ12kFHQqD/yK1UrUfCaKP+QhvMXg8MnvQOv8OFHY9tFehtVvjZ4cdt8KptJa8npGAIfU4BaO1A1ls0dkKOZ9xFLYwEE7Vd8767R+8XwELqIrtr9dwieoiKvGAYeL6BFpAdd0oYylT/vcUbSXMy/WC34BWdBdNky94sA4+E71ClygHOho5lpsIzznV6JvXJHjzmfSOaz0izjF8cGu0j84EK9jhpiCzp9z4EI0N6Rl6xmNfZkqUANOirqrWXuhKY9xyZa7LMAQ+RAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxwi8CA7EbuDp0eohPDdnrkQtv3Kmw7GTbPdUMZuy7Q=;
 b=Ft77+K/5Os3BRtA5HDsed8arNyt/7pfRrohHq0SNYN7DOmJ5VJW3Eh5bNQlIr5+H7GBDNAY3yW48/WMa9yrzTq0Iqn997Qi4BHwwhPMQQBrsRS8aTkcsKTuyseNuymEw81d3V8DGtj37tLVnIAXPvYg85VYMSlScFnc8fC9O2pjjaOE8O9AA4NSmjvckFDcpkYuhu+xBVdkbFBtK2hV4V4wYHdO6lGaJlvcOEz+WVUaZKhfqu9f1Vq/WjyPMP/SQbNmiW/2zR7+4QA/5pgTs/dIXSacWRHkn67py2uR64wPZpB4Zq5sWtBAundoBW9bQLOCTE7DCjmthSOit6zg16A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jun 2026 16:46:24 +0800
Subject: [PATCH v10 2/6] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-clk-v10-v10-2-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
In-Reply-To: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
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
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: a31fff98-110e-49c3-e761-08dec85eabb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	nijXI5iBp6jYawq5x/RlghTf8HXZ6gZbh/O9KwMyDbs6TPnx6fGPOGw4c6RolkZ1wajUtxjjHNUYURQBn14iHnr6hT7FI4h/k0lJEaY6rcn1lGiy5VsAKzJCNTOOVFHxYLOsdGBg1HFjXVoL2m15AvLZk5gln2ehfw2m3eUyIuzcYjN7yk/3M7ln0tXp9/N8HuBh0SG/b5i2tA9eCqfX7F+RW57PoCjLuzt0lq04F2o2+JFrWF27/vPfzlA8chRcVWMc1RQwc9gkvWgaXoPONt9dZePPxNhjFaF0EsLdamrdjW51oz4AOF57IkQ1dN36jwkTkmOXDYr0Cx7OztUfQZE3wFmaDF1tj9xovRjCEWZuvmDzLBtNt9AiBnNLht98gcs6KBZOBfM57bgO9aHbZb0Xfz5Emprc5G3gXPwj1cApTlJSC5YPOG06WXAtjUFKafjfQnehJ2NPW2yc23gNjfMbjGdEpGmrljvumIR/LoNS7nPzmx2rXXcigS81f72gkmU2dkv5Qo9+PxdwaAPan5Qp9O+XI9wvW9q/wUw8lUHdolyYyyGOLIksdl116Qp1xxia+ialthAUOjygdtW52GXrQdgDUKCdQOGj81CyfrTbl5rybxSc/l4eG6iqU7oF57KEBZPl8dPisHXpC9SMwfPzd2PtfeLh/xaForyyR094VQQW0Jzhj5UJcpfNllzw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUlKbkJxMVZsUTRsRUVUM01rWDA4dmRPbG9KNEp3N3A5NnBmY3liUWk1aStl?=
 =?utf-8?B?MzloaW1UVFBoY0sxVDRCRUVhdXlLVU0wQm1KU0ZrTmJUbDBiODExaHh5S1g3?=
 =?utf-8?B?SnYwaHFRNjBFTzE1d3pvVFZhQldUdndKR2ZwUkpIRzJ6TjV1WkF6SVNYVHBP?=
 =?utf-8?B?M2RCRmp3L3VOeEhCWnY2RlR1TmRDUzZmZ1JxS0NQNEJvKzh5UW1KOVZSWXFD?=
 =?utf-8?B?TUp4R3M1RjRWVEI5Z08wRTRSR2lmQmFERzZ2S1JsVnhNWkxJa0FHcWNCUUpP?=
 =?utf-8?B?YmRyTjZIT0lwQythd2prMnNIb2lyeG5jTkRVaUVEL2w0Q0pJelNSc21mTVQ0?=
 =?utf-8?B?STg5c0svVGZ6NlVzY3YrbEpuUXYwemhtOUZEZWtHQmh2R2Z4QkdKQVlKbFVU?=
 =?utf-8?B?S2pPVHNuZlBkRE8yZlVCeUgwVFJLZ1U2R0pCNmd2eDFJcFZXZXBUMCtheVRp?=
 =?utf-8?B?eFJucFUxK1M0Z1ZYMFJwQVZPUUhyVGFQZW9iemplRzRLUmtRM0pOYXpWVmlW?=
 =?utf-8?B?R0ZlQURvbnRENUR1bmJDbFBYNkU3WWs4NEtBSXhMd1Jrd3A4OWU3MnFqOWtZ?=
 =?utf-8?B?WTVGNXJFZFZKYTA5T1hvUTA1c3JSUERZUWtOTENUQVVpL0xQNmF2OXB0QnRW?=
 =?utf-8?B?WUVIZzdwT0o4aW01M0s0SkY1cVQ5N1hPK0NJZDNTOEhMV3JOMTZUZUpYQzQz?=
 =?utf-8?B?dnRXYy9tZlN0K0hRMTZ6cGJWZFFzRmVqZVFRTXFqejFmTVlPaDNqVVVra0tB?=
 =?utf-8?B?aFRKb0UyWjliK2FnSllBMzJtS3FjVTdlQy9kR1F3NVNHRGI5dmJnbnVwR3ZR?=
 =?utf-8?B?TjlINmZmaUVuTmhDWnpUSUdvV1lwRHJYd2NoQWFjelUxeHd0Q2VCZXlVVkJn?=
 =?utf-8?B?azhoVDcwT00zQWdZTXFwNkNCYjg0RDdwcVc1TUpvcVhSeEJtZ25ESjhkaDJo?=
 =?utf-8?B?U1FMbFRrWHdWc3dwQ3hQYkozWUZaN1lycnJMcldLdnIwYi84ZDZieGFuVWJ4?=
 =?utf-8?B?YVl6OXR6bmN1RnJrYjFMUVdqcE5WWXVISUdTazhNamlmbFIza3oweFVhQlNC?=
 =?utf-8?B?eVBrc0g2WXhPRHk2c1A0ZTFzTDF0b3AzWi91UWpBTXZtWHVWK1RtYkpQbUI4?=
 =?utf-8?B?MzhhV3doYktHekpwdmVFL1c2dDF2bW9XaThSaTZ6US9PbTJnclR2U1dZWno0?=
 =?utf-8?B?WndHNXpvbUdMelhZV00rNDhRZ0pEUi9qL01VQ04xL0VCalczVVY4djJwc3Ar?=
 =?utf-8?B?M1crNk5oazFHNWZOLzcxT3Y0WFhTK1g0QVlGYkpoLzNFUTRDbmpQRmhuaGlE?=
 =?utf-8?B?bWgxVlRuSUhTeUsyY2toYWJ5QzhzVzhiSlBTa091TXl3cEoxRzh0SjdwWlo0?=
 =?utf-8?B?UFJKcUw4OThvQXdEWmNULzRDZi9UWTQzN3d2b0JTY0pVSTdvVG8zRktZUHpQ?=
 =?utf-8?B?b25BdlFrZldNU1dheXpYRjBCNHQ5bVovVk1SM0JOYXFoU2xWYlB3WlZ4QmRV?=
 =?utf-8?B?M0doekFXQVNEVDl2Y0JhT2UrRlYrbWN4eDZESFRILzR2ajV4Mmh0T3FrM3JG?=
 =?utf-8?B?TWwrZTl1WTV1M0FLMXFqUXMxSXdONXZUTVlRckxra2h2ZlVHNFJ6c1lzV1hr?=
 =?utf-8?B?a01rM1JnSHJ5c3poTzRLWEc4UjVUSndWTWxNMkdsbzIxOHdKcHV0cXl5RUlX?=
 =?utf-8?B?dXgwS0g1QXRubXl1VmtkNGI0d2dRcDIwNXNaTGo4SzlPNEd1WlJENS8xNnky?=
 =?utf-8?B?Z3hwcWkwTUtLK1Fqa3pseG9sc3VZODd0RTZCbnNBVkwxTEFHaStpUGkwYWZT?=
 =?utf-8?B?a0dSQ2FZMGN2M0NDOUtCVkttZkg2c09iK2FiaTRHd2c2ei9wbWkvaUtSRzJW?=
 =?utf-8?B?MzNOd3FwUnZ2WHFLdzZjdTZ2dzJBRW9naURGMDNKTkJoVW1Cc1BkWlhSc253?=
 =?utf-8?B?b2ttS3FXZVFlN015NVplaGh1VXBxYTVVczVrenZSTVRuUkZ1VkFOMEpZRlJC?=
 =?utf-8?B?MVY3QXFXTUdRT2dSVnUvZnkvNk9RQjU0ajVNZzA5OGJPRzBzaHF2ZUd2SUp1?=
 =?utf-8?B?WFdTTXlBYUZDL2Jkc1NMU3MyMmQySTNqVHpOUjJzdStpcHRra3lrRWNOd2pk?=
 =?utf-8?B?YVlCWGtJYW9jVkhjUXFsak5oVktjMTZiMWkreFJBR2dVNmpDR3ZsWEtsWDRU?=
 =?utf-8?B?cnU4b2hYd3JBbXhWWGNNL2kyRmFuREdYcmNnY3Z2aUVqNHVLZndTWmN2TURa?=
 =?utf-8?B?RnQ0RGhBYzFiUGpaZnJETWJVVkZJdmVsWFM4RVIvaVJhTmVsa1h1SGNQWlIw?=
 =?utf-8?B?MnhhSjY1dDdIU0lsWHlSYW5pMW04VUR4SG00RWRadnNFcXRVSUVUbUc0RlVS?=
 =?utf-8?Q?oVe1jCvKoY/P7CG1cFzpIXV0g3AB93QnrY/wL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31fff98-110e-49c3-e761-08dec85eabb3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:26.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsjoeIc23Fuu5Ijg5yMLP71em9V6Cb73m1ESp02wkYXTaO9qSfWY2rGmMFxWwQ7cyFHje8IREmreoxJ6Y1Xx1dVpyNI9GarRuKY8QXb2rOqNOgw/HXI48m4fMgioPef6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

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
index b01a38fef8cf2..7d3747378739c 100644
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
@@ -1436,6 +1465,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw,
+			       const struct clk_spread_spectrum *ss_conf);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.34.1

