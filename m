Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B9A3D667B;
	Wed, 11 Mar 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241788; cv=fail; b=VsrNGsBY21aAFMDa6kNlQB6zRU0ZXFF8K4NutG2iBxas3A8hzgL651A6+GL4zm31BgYnCz5UG9PSTCsodqNL85hAG9oPvn1S/J8XSeEMKoQoUyfvPpVdM9Kog6E/w91gSSafGV5mgPlK6Zu5TCwmtUHLfFW3SVhk7cVpyq4ChT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241788; c=relaxed/simple;
	bh=429+xeosw3k2knbfBt9kPy1OTD//5upvZ/f3ZSI3Zmw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NEb9F8ZzAzInRJxFEf1WYi+Aw9kPR/cle7u5BehHtTVD47f3zl1MJT0QlKoI1CwUZlPGmeoz067p3sqRDwrQi50iNZveuGs/vAAjN9wHlVQmmHiiPk5G7xRSTfyWucFsRhnJYBi/zQsPQx/eucogVN/yCPTpvXYrOBjqCh/0MOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bhDZrcD5; arc=fail smtp.client-ip=52.101.84.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bhDZrcD5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IB09rrf1SL+GmrMKY9XemCxFRLSBD1C5K0V16hHE1LozSm40t7K3IFhgkkn7NKCiOuSB0942LFg2ZSJWmWLznNvYAD06/wLngKox0gwOZVkpd1mDaFtx2wLr/E+lvebt/JcO01Vs1nbZQ83tfl0GVO5sqKHJ7972mCfFghd3JEP/y4la5KRt+pwowZZ347mGEL9z0+2zjFpY/8SaVTzfJeOcauAUYYD1ggBHU4Azeux46AT1Ls7UbrFGXGbqEF7LeFNlf2ZIQdj8PywKi5UOACk0HpGSINcmtzrK0WlKVrRkHehM4Y65E5VkH24QcWJx0ChHV80sS45ScWa2CFB8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEAjLgZjuT2y0Yf3of3fLR5VJKJ37c0cpY88aHNxj4c=;
 b=Xt+obTyjVNcNdmaYoVn9DsdsMQSfkTQKQoxt8N+utLiXsKuUg9dDT7qAa3xNf6tLHu+j61483LJIQ8Ef+LmxXih7N8XLhf97Zw0Fd4Q517A+Yg2Ipl/vqYBGmcv4eaI3yPuPhhPexDmlwmphvsjBTI/kqFjHr/sjdk08INyxO+t4ElZmCdQIMAszbYltw9/RAwvNd/mGbA6jTSsQNt4zR9qaLNDdaUrlYj4Wa/aEFjzcgm3wi/Ffodr/MZ7z9+GAkOB69LwxK6gk7YdKYk0Qp92jBV0+xuI1W9DIMRL6GhL2iZC54fM+DXn6ppKvA4ti8WJjmMSuUfswD0Y9I/HL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEAjLgZjuT2y0Yf3of3fLR5VJKJ37c0cpY88aHNxj4c=;
 b=bhDZrcD514xKRjEh24EpWCREtLdJt6Uur/bdYhR9oYCSrMh3HPYOp+BEvN33clA5lMefv4tjH0hoJ9l1TaGbkIyOt3JG4Pfy7z6GKxQ78FzaT71/dEbKre0G5XNnLK9XwSgtmLxTqJSTxl5O90j0peLSP2PI/RBFSXFkAjgxLSyRfBgDlRMrORwtVu3hTmGSCfTNBc+h2qgcKdf+E6/vLXi6kYpv0odRJ66u5wSW5zfUNnOZZGH/m3PJimtL3r2S9A7+OWZHZmnF00XEiwGiyNjhhN21BLN+rRtFVfw3CoW1T2Xxb2t6I1kto9jiPrI5SQVYYdZEjgic2MhPsIU58g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GVXPR04MB9976.eurprd04.prod.outlook.com (2603:10a6:150:117::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 15:09:37 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 15:09:35 +0000
Message-ID: <b07c325c-8476-4bdd-992e-86848b1f87d5@oss.nxp.com>
Date: Wed, 11 Mar 2026 17:12:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba91xxca: Add LVDS
 display overlay
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com, linux-clk@vger.kernel.org
References: <20260311143217.1700704-1-alexander.stein@ew.tq-group.com>
 <20260311143217.1700704-5-alexander.stein@ew.tq-group.com>
 <1ba940f3-6ff8-43b4-98c3-a8ce23e2b0fa@oss.nxp.com>
 <7489551.DvuYhMxLoT@steina-w>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <7489551.DvuYhMxLoT@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GVXPR04MB9976:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f0ea7b-d761-4b9a-668d-08de7f8034e1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QxVwJdSKJcRITfk17Ou6sFXikxnvW1T1ZQKSep04APxJWtjLRZBPBXZz/88ihjTfslCkOpzdIx17MPC+L9aza+BsXiespQvcuXphmC3kipGXpDkT1frznSv50ifuhhZrRuoItEJtslqRNPSYQ9ZgdXuStpBs+4oPO2wHHMjcxIaR463folJ5eBBW2DbVOctuGj7P8aNFa9Kq+ghDgq4G2I5EKw9aljWWZSkkWm6TwkwvVaU+Hq/z9taVj1TXSk83/Bswi5nwx1FDtcf3hjkwyX7molVFszCtksZwUy8nUJlLwBeJ+C/FdUv1Sps5FCwvqXE4vrbzsd8YMwhlqU65CvYfP3BYPvCaECwEwXTHAGkAljITstQhOY5YDLMm5i7KeuMEeUW39oaE5fRqie7sQi6yXlED3dWrS8EoFuO9dFXFutip1jfT9bOjrsKFo6Fed3zDZQU46hNfioWL4Fb6SCwOjAAnGxqAA9VBw4bh9LB/Ug+ndgo1/Uze6SEGXZotlI8lgqL5vGtbdUfIi7YpBe2clPEdIM/3+ZNzpBKd3Vh8seLvsNSgqDQCKnfqr1tA03eEINLWBB9C7dufVtyYRGFCXPmJ1sv2owL2qRdZUlv3/aQXFRG/WQ8dhtefDmPS3f+/kYkQnPvY/bS5O+xYuV+YK7vKUkPLKQSWbceac7m56HBa73yR6S4R4JFT2MONdDFwz3XBzR000pHCNvBhiXVbZPzLMIvZLbPEslpejLjUubVvijG8vLHUX96b2KfGoHYiZ5KZgNgItphUc19CpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTRvUWJnZmZlQVArRW9sd3FRWStTK3lWR2RUYyttVzE5dUJFVVd6ZXBwRWZM?=
 =?utf-8?B?MGJmVnpPL2RPZ3M4UnAraU1HSzFOK2Z4ZXB5bzk3VjlZaEN5NEtEV3JqV2F5?=
 =?utf-8?B?OFhOdmJnTzUzei8rajRNdXlsa3AvR3JSRFpqcktwNUpuUE9zQXZqaktIWmU1?=
 =?utf-8?B?bWoxcTFNSHdoT1VaSVdIUExuS3BaUHdWWTIxdmluUmMrZXZTMUdVbG9MYW1z?=
 =?utf-8?B?WXoxdUkxQVN0eDlmNXUzZHlvdGpoZUw5ZTlzUUN6MXBlUGtJbkxQa3ErN0F4?=
 =?utf-8?B?bkxaQUd6WXlkNnVPYU9tN1MrWkVsd0hXalVOQm1Sb1NDNG1ldXdPMjdSNkVo?=
 =?utf-8?B?RmJGb1UxbjFaMWoxR21FTUxCKzhsaU9XdEdrNkx6MElIcDRlUXJpeGgyRm14?=
 =?utf-8?B?ODJVcVZySHBNZjdjZkNURlZRS3Z0OG9vZ2E1bGV2OFpCRXlGYkhtL20wYXhl?=
 =?utf-8?B?dlJhdWN3dnMzbitUUytBM1V3NUIraUgzeFR2MU16eWxWMXdVcldyNGVRUDRw?=
 =?utf-8?B?YkRwampUazNnemtvMUYxdDIvVkNTUnI1T1NNVFpZSFRKajg2VzFobmdjd3RU?=
 =?utf-8?B?Ym9BSTlobnl0ZXRqb3RKbnhERkJmekgyb2FkeGJjSGI2ZzZyOFVURDdtNWVM?=
 =?utf-8?B?TlB3UGVpM1pSSDN4S2tRa0FWTWt5ZmwzaXdnUmtGbmFBQnFHSU5tZUNvR0tT?=
 =?utf-8?B?cmFNVTM0QlU1b3M4TkxneHVqdStScXdJZHVBVGdQalBuWkJmRTBlellueHBQ?=
 =?utf-8?B?ZWpUK0FFc3JtcUF5dDdaY2Y5MU52ZlVDVXc0ZE45Umg3aUMwRTM5dFJ4T2VS?=
 =?utf-8?B?bzAxZUhhaFoxRnI0WklBdVNIaVk3eDdtRnkvV0RjaEN6VUFrNXI2YkpXTUl6?=
 =?utf-8?B?R3NzZmhXMFdKMVVPR3FlWndWbEhaNlNab1dBNE04amhaRFJtTGVtL0s5dGxT?=
 =?utf-8?B?UUFJN3pJMWZLMUFsSmFOWmU4U1hDOTJocjk3dFBKUitCY2lYSHFZZjJpRDd6?=
 =?utf-8?B?bCsxRlR3Sm05ZGFQYmdnb0ZUN1M2c3BZSjU0MkhtdVFZZlpPVldoY1ZEeU5E?=
 =?utf-8?B?SndOYyt2d2RPUFdZQjlSay9PbGpVUXlsWDJWYUVzRStkVzdNaVArREFVaWxW?=
 =?utf-8?B?eUxYRzUyNTdPd3NnaXdxZnZTUVQ1b2phZ0xVWEthSGhqTS9zT3R5VllURkNK?=
 =?utf-8?B?YWdmd1BUVW5IT0RRQWkzZldPVFlBcG1CMUMxTGw2bzBsekJXZFozdDRJelZM?=
 =?utf-8?B?YjZPek5IV1dKeDE1bTZEajRDZDRlbHpja04xQ1A5NUszZ3czdFRDaVBJOElo?=
 =?utf-8?B?Rkc4R0xYVlVPL3lia2lDaVdUeThhcFpOZFc1SFdackFSR2ZYdS90OG1vV3lr?=
 =?utf-8?B?VjczUFZWVHZObHFsWFgyenBwRmpxZGprUTB2bUJHb2NCdCtZTXJQWDhjNXpL?=
 =?utf-8?B?cmd6M3FOalRwVU1sNWRBNVBaUjI5WGY3SnRhaUFKeHVEK2NJdUE4QU8yd2Vh?=
 =?utf-8?B?aUdkdG03c04vdXFMN3pLZ2pnV3E0TDFtczJZYVNKSGFxdlMraE1PeEk3TEVZ?=
 =?utf-8?B?RTVSYVdRZVc5TDJNTytWSEpPNWJYMWhZZGllZExUZXk1NGJTQTRuWmMwMFUr?=
 =?utf-8?B?SDRiaUFQZzltK3F4aDMwVTVOVmFCY0F3M0tuYjZNSTFkNHNKSU1GZHhBdW1C?=
 =?utf-8?B?RTVreWprNmRiMk9keDFvK2w1RmxhcFphUXc5ZWQwbXVDVDYxeU90bW0xcmFl?=
 =?utf-8?B?QXIvcVFlK3UwM3JpOTJUWkR0ZUVVSlk5MUh5a3JoeGptR0llcTNKTUh2LzJ6?=
 =?utf-8?B?RHdDZXlaYlFsQUxBdzNMWkZoWjYvNm5WcThKZ1lOa0QrSkM1SDk0enBoZmhX?=
 =?utf-8?B?ZUNPZGFya1lZdm1qQlVQSEF4UmVJemcxZVhWc0R3VVBjc25aMG5sYWYrM2xw?=
 =?utf-8?B?NEo4eXBDeitaeFRZOFNwWkRJMmtvdlA5ZEdjK3ZrcnNLazhRMTQrdnZxYWtq?=
 =?utf-8?B?M2RYYnhrVk5lUEFZZlpHVVBUMVJNRWlTeTN2R1lsQkg5ZkVhRCtYZm50YnFq?=
 =?utf-8?B?WUpUMktZVUEwOTR2RUl6YVNiUDNGQjQ4RzRZZTFteEMzbFhvREZmRFhnakQ5?=
 =?utf-8?B?aUEva3JUU1FsVXdBT2QzSGhrSE5NdllLdDdVMVhtaXBEVXZhcnQvcnd2eDNZ?=
 =?utf-8?B?MzNjaUJZd2tqd0FFZUd3ZEZ2cDZCZEVIRkpCR1U1bkE0OWFKOHQzZnNnOWx6?=
 =?utf-8?B?Wjd1b0x3VzhPN04rK1Z5eTJnWEM3OUFZdThjMzFaaWUwaVZsUFEwZmJRN0N4?=
 =?utf-8?B?VmUza29Dcjg4ZUF6NnBZdXJSUVBtRWNNYllwNFFnck5lM291K1pQQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f0ea7b-d761-4b9a-668d-08de7f8034e1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 15:09:35.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhX1fEYw4P2U3UMr7nqUQy21PsxpGQ1D8K30owdM01wo1elxYwjvbH7cnVmSwVwD9/cewx/B5s8ghWhW9fw6sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9976

On 3/11/26 16:50, Alexander Stein wrote:
> Hi Daniel,
>
> Am Mittwoch, 11. März 2026, 15:48:04 CET schrieb Daniel Baluta:
>> On 3/11/26 16:32, Alexander Stein wrote:
>>> +
>>> +&panel_in {
>>> +	remote-endpoint = <&lvds_encoder_output>;
>>> +};
>>> +
>>> +&dpi_bridge {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&pinctrl_rgbdisp>;
>>> +	status = "okay";
>>> +};
>> Hi Alexander,
>>
>> Any reason for dpi_bridge breaking the alphabetical order?
> Nice catch. Thanks. I'll update in v2, same for PATCH 3.

Great. Please mind that same needs to be fixed in patch 3/6. 
