Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18523E7172;
	Mon,  2 Mar 2026 15:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463602; cv=fail; b=JZi1n6oNkV4Ouzy/SwJXIwFdO7grinWFA4GlsbwDEUlHmZHUxSbFE8jyQFsXNsNv+35sqYdDRz+rAIeRqNtEppvrr5ZVeIR4OJZPgpeuodHVZlrYwd5UFojk/iFbipZSbjYsDwMDFZyVV0XPdS1US2TuYM4ghUWrjyP3qYQVE6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463602; c=relaxed/simple;
	bh=C/xvqBForQ9M7yQs/Rlj78I3S3NA9JZfmzorGZOmgRo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AVJ3qGTPHn7OVK6wBG6sri/RMG+uqbAhf/KBuyeLN0v5i4lYnwWOtmv2N0MKPGdFT7/IyKAELlN+YBzI0lBzf4s1rTvAELfhFJOrgtm3h0TXK/j388MQU3LYtG4mT0mU72vozCzAj7BFBxDlAyf7t5/WTZ6V3TBqEQjznrbM46s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SmSm/Oja; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SmSm/Oja"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=epgbFu2NLH9daDoIMTCdJhNC6R6oA0423h9f0uqxpvu3r+iwA7PTTwJq0h9dR3fgsAhUIeNxjBqOGTBRUT2/6UN0AwAy1LbEqlo7BbTjycL/y9RaaIFvaKJYwbPL2lGBtJCXw15QogLHzDvPiQRR107loMzmWB2T/sSXQAocjdz9VMQdrDZ8h56I8FAcO1SQRnFmiN0Ppcm4lT2m18tIFblHJZrgtFCnlkbooy52PvSHAblLn5EOAr3s1Ay3ofSASIEodLdJAozgv8ZfD7u8PiudojSIIAFC3QdrFT/ePETtJeO2zW6d+mrYhe2aS8SHTE4KXr8SsX34rHrA1nvFwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCtuE+UCAQjSInpef+rs5kwlWw6wbPSZJ85LhAy5n3M=;
 b=N/ZsDLsRfUeKVimIzJDXAiHRj6I0EkuDQIY0/jzlC4aBt/jryUvxMvGX/hQbCf7PloR/wv94ZZgBYJZDXXs9XsXT+Hmnf+S42soDxRt6QYHhtvTGFaWIjynTXR3y5/N39MXsOMB5hTTB3ghAxGAyB5va3yKrcId8bqEOtKMq2hlS7LQP1So0RHpHXUbi/xmPaJ+U5lISsIjMg27X1QliY+MiTaSwb1Hl/f1c0sTZctesued0ovvrcAyyvn/fZL0J+achoKXGE05aAUaQYXjNPmYEu2iZK3xQZ6MfyB0EGy7kbkuKoq6fqb/cMMUNCIUFPH1NlVG9U5UlFj0s2XqgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCtuE+UCAQjSInpef+rs5kwlWw6wbPSZJ85LhAy5n3M=;
 b=SmSm/OjacsNxwD3QQdDQd6H0Grw6rRTLr4+vITcofoGv731zEc+c63v6o9Pm6ggn/XAsaaoPe5LjRo2Z94sW/NfWnNiQ7daAyVXjNzvYFlgy80DVe0lscGkKPvKQ2O6xSmTuc92/XIz8U1AjoJRHuPS/VTYvtIwV+3TFePsID3QXr7K2CZO4bn8kQlSOKs4IK13lw7F3OtDGTH5+EzOPaZ1BQdFiiEv1jO1x7lEtt65NtQHdYC7xZryljVfIj7JOX3BCDhirIW1XtjntSTHZiZZ6V2idne5E8iwqgDZVXUL0eiE4KMCMRi9YmpFGvdcGHMIYj4mUJNyFS/mpS9+HzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB12255.eurprd04.prod.outlook.com (2603:10a6:800:304::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 14:59:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 14:59:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:01:16 +0800
Subject: [PATCH v8 2/6] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-clk-ssc-v7-1-v8-2-2356443a7e4c@nxp.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
In-Reply-To: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB12255:EE_
X-MS-Office365-Filtering-Correlation-Id: bac5c06c-37ea-4021-9834-08de786c5e73
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	3HlG9XlqvuPrVJo1OnRgVqBw85jHHXrxeYfWnjjI2AaSXjXJ+pj9OMI4JtAez+7uDa8EdUR2t6/v+cmrGrIUUeZhxdkiOtKY+YWYAUzQ+5AAxWfUlQ73pv47ryqf6z8FRwq9NIiLY239ArTPrvrIZbRCj1yV/z+H8jn9edCiUjTDgR2tG/hjamo4mbZ3dnyf9omqLyuZy8qLaVNgVRXo80pm9vHrMvp+1k3cl+FgIHXcF1RTB6wXFdLA48Cwb0UbCanHSaKabSbe/Lrw0mRaLuf3Wkzx6ctbMkJ/Hy5SPiUopTwpDWtGW2MThTrfHCpMQP6Cfb97hBuIZGqxHsG2z9NrYoQNQBXPaOEd1FsWgEPEgzHuC5WTNrcqC0UKHYxesCmfH2LyJpL4bdlFgozDpKcgzvenxdwiv30Qk2nAuXevjw/wNt9fFEu0wyO9hFNt96E64fSUl6haOF+XfXzsmkI9CotD6Zlcx/HXoF8xmyjCWWof+RKSTs/b7qdxZTyFBxoq19tDeGTKOMbf3NzuRBgjofqsGXxNJfFzn5Qw78bEZWqSqTNAzp44rtT+CgeUMpbBIyCDEg8l3G+nTbACDVWBl3XO6Z9wSoF7suc+L3ok7rDJoztLtXu1ylKZtMJHGK/VryloMeVIEnHYEG1vJdDGf3n2TwmM4Ui7deIA63mk6Zbhxun4hMgc78Idb0Tz/oUiuoJrUrpVSh8YCix6KRYZMYMpDK3YyX9QIO3VgXDYw2V554Lx61zjZ7OsGuP9b2UxtXPx7YAplHxsbN98QOzcDIwLtQdiMycyHczX2Uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVN2Z2YveFRIVXhsMUJZY1dENVdSSTJtZkxHYTk1ckRGVmJVZTFxSWYybzRo?=
 =?utf-8?B?SGdVRXN6NzR3Ris2NTNuQjlxekN4RTBQcThXK0poZ0s2Vkp4dXQwV3lobFFw?=
 =?utf-8?B?dHJsb0cvM09Oc3ZwdEJ4bi9TTktiY21SKzJ0U2V5ZDg0RXova2ZhbE9PbnJO?=
 =?utf-8?B?WTRNRCthT1RUWFB1MzB1a09pM3BndDZyVVkxdHJ5TTRPZkNyS0pzUWk2Ti9I?=
 =?utf-8?B?bzJ5Z2xzcWtHQTdkNWJjRVdXbmw5VXdCU005eWROZloxdEo4L1RkTWVFdWQw?=
 =?utf-8?B?R0VIRFBjZ1NXV0djRU80ajNiUllWNjRaeG9kNUxxdEVyT3VjQmd0K0VFYmNk?=
 =?utf-8?B?QW1OQkduUmY4Zm11THZZUkN3QmpsSXBZSXR2OWhPR214UHhDbExDeXdWK3ZG?=
 =?utf-8?B?WDZtd1VUcWFFK3U3cGRZV20xekJDa1d5MWNhck1nNDdUeS9acUdNOEVIOGVl?=
 =?utf-8?B?K3dqZ2ZnUnArRjdDdS9wSGd4Qjc2YlBIajZnMGtCdzVXV1pSbEpqZ3RhNXN0?=
 =?utf-8?B?bTZiTy9CREJWMk9uNS9ETTRyMXlJQ2NxYVkrc1haZ2l3b2RxOHBBYVRlS3NW?=
 =?utf-8?B?TjFITmVQWEhNZ0NZNHF4RkY3aWpvVjlITFY3QkxFWEJ1Qml4NDI2bDJReE9m?=
 =?utf-8?B?U0w1ZXdGREt1MzF6QktIUmlnTElQeUt5d0Q5ajlqb051aFFKeDhOcVU3NHV2?=
 =?utf-8?B?czFyZkZWbm1yUjlwVHVKdSt4dCsrazJlWTlJbktuWDExaGtzV0hKN3hrdU1p?=
 =?utf-8?B?Sll2RlVtaDIyazZsbTdZcitxQldya0dJUGFXNWpjeTZmcFFDTVVqdHNhUUVq?=
 =?utf-8?B?ZEdJc0VEb3hiS2w2VjFLQ1lWVzRmdTJMRXJTcGdsSVlxazlYWm9LK1JUYTRh?=
 =?utf-8?B?RXZ0Vkw5cUFIcXpBWHF1OEFqN3c4d0R2cGFveENtVTJFNjlrQXRFTUg3SXRh?=
 =?utf-8?B?VmJmV3NZenhTM2piUmtiT1VXTnRqZ25pZGJOejliY1VRY1FlWGp6cWFzNWpu?=
 =?utf-8?B?SkZGa0h0Rk0wL3lCWkhGKzR6REVpclNpV3UrU0RNZGxMNWRtc3A5RXIwdnJD?=
 =?utf-8?B?R251QjdzZUZMT0lUQkV3b016MHU3Tm5BVEhDU1BHUFl3c2FRSG1ydENmTzVp?=
 =?utf-8?B?bDg4YndaOVlyOEpXbWxJcC9xeEl2cVlIU3hqM3pWOGZMNzNMbTUrZ1ArZmhq?=
 =?utf-8?B?dlFwaTRzVU00c0tleTliMUoxYlMrdXBTUDV1VFJ1aFZFWlJMalA1WHZmOVV5?=
 =?utf-8?B?SU5SS0tZeTBRTmJoaG1yZjRMVk13bmlBTEZTdnVmVVN2SWRndzRkaUwwRmlK?=
 =?utf-8?B?ejI5S05rOEFBM1B3WG4zMmZxZSsvamd6OUZ1OXVRT28ydUVlV3RIRS9tamcy?=
 =?utf-8?B?Sjk5eHZ6UVZ0UnpPczNSc1dsTVF3TnRqaHI1U1dReXJlb01nMXFudjZRMU9m?=
 =?utf-8?B?RmhWdm5OU3hWa1ltcXlJY0dtVFFFYWtBVytLQWZ5S0xNMERWY3dJZ3d2Zlls?=
 =?utf-8?B?cUo1TVpJb093TmM4Q2NOQit1VEZxeTd6czRYc0RLdlIxMUpSd3dhWm5JaTBO?=
 =?utf-8?B?dVJUcEFxZlRCVXVBY3RadDUwaVVtY1N4d25mZ3EwZUdjcWhNcEgrSENXTVBE?=
 =?utf-8?B?Y0MrYngwRGdGV0xtUW4zZnF5UE41Rk1KR1ZDQ3ZJZ1RXbDZWcFhMKzl0S1pm?=
 =?utf-8?B?V2lCeXZ0c2hRWFYydE8veGFWK1FyZFNiUVRDdW51L0h6OEFyRE5ybnJiMS9y?=
 =?utf-8?B?TG1ZNktVZCtNem5XaTVWdXRXU3N6MkNwUmFrbWM2MTQ4Z1BUZjc1M2R5cnAr?=
 =?utf-8?B?MEFzeEtnQjlub1NUdkczd0k2ZjB4TFBERGFxTkxpODdCdDkvQk1kTWdyVmpZ?=
 =?utf-8?B?WVBsbDRVWVZXSUROVEVnSVhOQVNOazQrcFg0SWNoNDN0M3pYR0NZTzNpQnYy?=
 =?utf-8?B?OSs4dVNpb0tUbDdlQ21CU3JuVDFTTVh6VUVQOW9HSHNTYTAvR0RJQXZndmdZ?=
 =?utf-8?B?MURwZ0ZacTEwbU9PQnRvWTQ1RDdyT1BIWXo5Vm4rTlVKcVlNd0lhT2xDTEhS?=
 =?utf-8?B?VUZCYXcvb3lQUlZxVUZOOG9yV0NWYmFWL3Zqa25hUHdOL24zdWgxV3gxc2pt?=
 =?utf-8?B?dXRKdGtMQVA1R3FTaUxiMndNWjdGcWYxMVEyRnJTOFZQSFQxbFQvZEh6TmYz?=
 =?utf-8?B?Yks3alFNcndLMnBSeHdmcnIyeHlkTHV4dU5XY20wSmNCcXdIQXJBT1dxVFJM?=
 =?utf-8?B?Nk8wbHRnTGluVlVVdXZNZEJJSWlxVHcxVkU2cWJNWkUybXJnYXlIMndER1NN?=
 =?utf-8?B?dWx5Y3N2cTROZnhoV0EvYVErbm1NTWNaVjl4a3o5eWJRa0M1cXZ6QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bac5c06c-37ea-4021-9834-08de786c5e73
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:59:57.0834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bc8xx8CmQR63Apj0OTxLH1F/XW9SSGuBy7Tz2fYnPvzKdAhs4FG4nNuHj0nHms+fpU0l1mGEjR8ZJS+OyD4Whw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12255

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
index 47093cda9df32223c1120c3710261296027c4cd3..3d9b2e2f7a5b269e1f07bdcd4101799ff6839441 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2784,6 +2784,33 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
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
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..9ec25bbccd613eafd77aca080dd7f51b1bfdadc1 100644
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
@@ -178,6 +199,12 @@ struct clk_duty {
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
@@ -255,6 +282,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       const struct clk_spread_spectrum *ss_conf);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -1430,6 +1459,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw,
+			       const struct clk_spread_spectrum *ss_conf);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.37.1

