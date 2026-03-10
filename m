Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF703C3BF4;
	Tue, 10 Mar 2026 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138407; cv=fail; b=SHxxg78J83NmZRwABKIWey+n21KdYqQy6nKwiAZUYhk/fouD7Iooy7PGOSuh2KiQCameRgUa7xvu/2J6Vu9OQJdkLMSiGCQ8IENvq8420d+RFrC4Qs6wOhvZQng9ZRCxMhj+VsODlZbetOMm8ZitkMhvS+Q6HVqwwNlTQ0/3HFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138407; c=relaxed/simple;
	bh=NONYQMhbLmncVbExosswVtK7y9p8Y54yICf7RPvz1K8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mma1lG+hG6u6KrmrO7VKlnXf4NwGxpMpoPBzFZRh3KblDBUdZcLENGuuy0cS8rIM0nwBubQALvSuIauwVHQhr9gXzH537bwHiTWBPSKBw3MltIjdGBPXK5tEc8iWYNXiM6fba4dagqhiU80I13t3Mhjet0fTD5Af3Hi7XFcCtFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=V2CZ3nbN; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="V2CZ3nbN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKV6Vq0WCp37tDrU4y4A279qWrjPgSmEdrLkmfmsVaGhm6cc4dhdNCEwdq8y9UpheLC1/ly15wKDqNq5eDLOBTECDrlSudwJX21e/Z87RK3q1acXBOYm4bC5luRV57m9IQM8Zi6g6d7oKejURPc4FUTWOgSo5WfrwL3uMhTruUInJWc7MlTbmqN7LHyJUDlKvNDDSG1ESjxfkvfUH9MW2m4vRcFJ8QDii2E556GAKOG2jqLrg+CXK25i7i5nYxE45ypWaDhQ93VHB9eriJ5x4rt9hkx6IJPTSX3LRuvkvAyrJbbpcXe5C7bZSiF9VOfOMXe6M5c0pZFdAUL8AC780w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhYmh9K23/uNapJfmCgqO6MCHGdzjFtZShb9vjLd9Pg=;
 b=AjuLMg/oX0goIzWTc8O6goQymgBf/5HX7WhzfqLH5+sJhwmO6n12LOfI0YPrK9J6Sa1VkhenHYxvXK1xnjrctCx299KH4P0xscMjFJ9LjlCBpy49xICuVf/aJs8YcHf9zoG8NW72OH8Bb9AJ2wUVZcB5PWM1qaFg1Gk/J6Kb/ftoyJd8v5TGg6ed4pJwn4j3hrnSYpClxDhlT2IdvQqTTNfEWY1jQDHs1jjNvTRKYHRg9J4dXgCU1Kz4UUd36J+XykrRDgioml3I1P/G6JzfKemZeU9a4AEmc3J2vgMCzU8eE/fKaODtL8hDBjq8tyEAlS/AMKEWrzlJl/TN93ITzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhYmh9K23/uNapJfmCgqO6MCHGdzjFtZShb9vjLd9Pg=;
 b=V2CZ3nbNSqAG4PHkuzOZHPeeMrgiI1lyzOrZ930N/xZoJTQLaQsLhfYJ9rUZlVMdMngE/dnvc4Fp88LoOG9zc/bjaJ3lX4hnhMwCzodmx/KFYFLt4Gmfk45DoZmNYFwKoqd+J8fWuJGCFdIYBKtS4WYz9EKVQYwshni2s4uYmgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM9PR04MB8067.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 10:26:40 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.023; Tue, 10 Mar 2026
 10:26:40 +0000
Message-ID: <3455884f-b6fa-44a2-bba3-cd6024e3edb7@cherry.de>
Date: Tue, 10 Mar 2026 11:26:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: rockchip: rk3588: Allow VP2 the same sourcing
 options as other VPs
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, zhangqing@rock-chips.com,
 sebastian.reichel@collabora.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andyshrk@163.com, macromorgan@hotmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260304121426.1184680-1-heiko@sntech.de>
 <20260304121426.1184680-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260304121426.1184680-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM9PR04MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 321695b7-0759-45c9-c97a-08de7e8f849a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	yB4CbA0GTl4aw2AnOtWDKwHuPOblxPmxgZFeVQJDrBVgs8slNs4GTMQ7lQpNMV55eIba+vsMiqGs9LulAgns6Do+RhxygN7J2+aHb7wMU9g6V8+FrM8Bf1S+Hv8ge2xI5y25EzTqBGRvNZWATOxenHG8ZEm82cj4LPyQBPwsCExskRD0l9mf2zMwo6YsXAMS+K3chQpC5+HQk8mXBcdGSTh2sFJk6Jy3vYYcCe6T/pAkuLo9VRj/c4Usx9Hwrl/GNuL7YE6ETGwn0XWb2nmG3iKpzv0pG3O3lYGhstyfamZ8MCP+s/L7yjBBuJOHULw4Pw2ALse8LXktmChKXkptTnpWNLU3gwXZy9UAzX9vKtszmg5XNY71pcMAAPYi2cydy64Y3YrfJnm+vKlv5rQgQbXlgP/YrbpEIAG1RNBeM/tiouAn1oUR63BH1tgdbzrDxvgp59ss6wA93haeIsTRobIOiGND/tuhO/qU1lRH9tRxELHWPcln5TnYfjCyg5sMJhVUWvQskMoO1ldhz1j31A5+/+ExTwqB03crlHjXciBN+DaW7LUwYUJWF+2c0uJwAjWlKO5treLEirV/ZCa93wau5FNok5yBCk4HmJoM4c7/s1KMPVUZhvuio6L5NmboHTB4Z19PrdMCzzhbtddio59G0hENeO/lbOLXLS5mUbbXTE5HQ9I/gNfjsuQgarmWn8FCEcfND0ReWqBTrJC1NBcgmRibjguO7CJxH1wjYDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnNEdEQvQVpsSkFlUHUvemRWVDR6ZXBablhmOUt4b0xaUmlHb0UzbEFyZkp1?=
 =?utf-8?B?dTg3VVg2a1E1aW9iKzlReU1hd0oxLzVmSUczajBVdU45MEltSjBrK1Y5M3ho?=
 =?utf-8?B?d2hPbytzcHdndktKVTRnUXF0Q3VYQ1V2YWJjMjZZZjdXRTZHTVBFOWJGcWlm?=
 =?utf-8?B?RXBCUXJTSVlzL043bnU4U1dUVE4yeDZjMDdaK2pjQjdOajdjcHl2b0doTmFS?=
 =?utf-8?B?dlVXZG5iNzNDUGxxdXFSV0wwVFBZZ0l3WUlrVGVmQ2x2K0M5UEcySytGRUpz?=
 =?utf-8?B?TXREMk9Fc0I0eWwvVUkxbjJ4Y2wveHlTUWR0djJuaWVxQXVYQ1VLZVFnbW42?=
 =?utf-8?B?bnZ1N092ZExmOWdjMW4vcU8ySFpJZzEwazVrMlJMOU0yVVZYdnJCTDY2V2Rn?=
 =?utf-8?B?dnRSK1hVL2haekVuTDEwQ3pWZXZyM1hTeHJGa0NiZStTYklNUTNsbFA1Y2Rv?=
 =?utf-8?B?SW96UTQ5cXJzejRtZU9xeHdGTnN0YU5BOVBhWnc4U3FwbzhpN1lTUlFkUDRS?=
 =?utf-8?B?bXMwNHI1U2hJeWwxRHJyM0xLQ1BrMlc5SlllZzlQVXlHclpFT25heWxOZ2h3?=
 =?utf-8?B?cGUzdkhkYTkvQWZ0TWpTNkFOdzN3ckZSMHJiaW83VVdBNWM4d1BIVGlxQlkx?=
 =?utf-8?B?czI2blJnM09HVDd5YXppK25TVjA4TERGV0g2STgvZm1vTHFTNjFtejJWKzFw?=
 =?utf-8?B?bWFaTFYwbHhIcGZOL1V1OExteEI0Z1ZaRllTZWY1M2doREM5OGc3REt2K2sw?=
 =?utf-8?B?UWp3K0ZzNFVsWnBpcjBDeGphQU9walM5MFE1cTJ4RmhXZmsrMmtpOHE1aU9F?=
 =?utf-8?B?K2ppbzFJQ3FwUWIvbjdheGlObW9GdkpuUUhCdUlMLzZZTEhjQTdyWkVMdE1l?=
 =?utf-8?B?YVNkK2NTOXNUQWZsSGZEc2o1bHphL3VBcU9nbmhwZS9HZUFSZ1VlamZjd3Ni?=
 =?utf-8?B?UVR4N1BYYmpteFRyWnJ1YjlQUTdwcmhENWcyZ21hTjkwekt1RzB4V2tqOFQv?=
 =?utf-8?B?VU9nbENvd2JJRDdod0ZUUmRTMjdTeFAvMGNXeW5lZ2UyeTM1dGp6TWhyZnQ0?=
 =?utf-8?B?VkJRb1F1OVpKR2libzFVWElwb2ZVRDhVUmphNDBEcWlEcTdEcjVpQ0l6dmZY?=
 =?utf-8?B?YUJFUjRTbmYwK1lIbHJiamF4LzlHQ29zd2ZYRUpjUWNNREdXcVkzMTJ3a2lu?=
 =?utf-8?B?UTNiSUZGZS9Qdi9DN3FadWJTVk1VMnN3aGEreWtXR0kvTnM3VnhKV1ArRDZH?=
 =?utf-8?B?MEsrcm5NODdUUHpPSTAzUTN3emY0Z1FzTjY2SzBBMGg1UkhWYzFOK244YUo1?=
 =?utf-8?B?SjVRbVg4bEc4TzBrTTA0UFJPekg2OXRrRU9jeThzV1NvN2xpQWtkUkE2Vklu?=
 =?utf-8?B?RGNyY29sQ3QyU2w1RE1FdlpqZmllOXFvNUk2NUtJOVlFY3I0cnhFeExmYmQv?=
 =?utf-8?B?S01DdWFmYVdMN3B5VytCSEd5a3JkalJIV0RsekxOKzljL1FuMUxnb0pDSEJa?=
 =?utf-8?B?UHVzRU5xVFg0ajhTOHgxQ1RKZ0tUM0FrckpPcjZYYmhWSDZ1K2Rjb09JdGJR?=
 =?utf-8?B?WnFQaFVNSUhmRU1ldmRnU2wzRHhwZFNmcXZOaXM1MDNxL2tXSENXVStad05h?=
 =?utf-8?B?R1dmenY3dE1yM2hPNFZXV2RuV0lEQlpkeWdyUGNpQ0E1MWJhWXBoaDlRRTlu?=
 =?utf-8?B?bG5qYkQ3YkNXOXduS3B4eTJBV2o1Um11dkt0OVdNMWVhdHVGVG1tbXRFWmw5?=
 =?utf-8?B?SnkyM012MnNVZmhkTFdEV2d3Nm1iU1NjWnNnV1JQRWlOZUsxc0l6dnREN0RZ?=
 =?utf-8?B?bUZvRjdJQ0EyT1haN1EwdUp6SktqL3pNdldlUDhmU3BXbm1QdUhUb3Y5QXND?=
 =?utf-8?B?MU5wRGFqMzhZc3J0eW85dWZSSUVPY05UQ2hzNHV5ck0zd0tyS0ZpZVpaK3Bi?=
 =?utf-8?B?ZGoxUGRDK1VuY1A4eTNWR3I5UHBNNnRoQU51TXM5dHB2YU5WSVY5bDh5YmtJ?=
 =?utf-8?B?L2FoZWhId1RVdGRZK2Jab0ZjMytyOE82VWVsM3NhUDFjRjNLeVhadWVLc0U4?=
 =?utf-8?B?NmpUUDFmOSsvZXc0ckxkWUh2OTZZeHU5YnJheHdXYitKdTF1bTFTUGlmVVRl?=
 =?utf-8?B?UFIwWndlY2szd3BQMDNQTDVaNmt1aGdCdUZiQjdHd0JlVk0wN0hkbGUyUm8w?=
 =?utf-8?B?RWphVDJtUmNCMWNBQjFuTHhmM3d3SHNhOHBNZ0k1SXhteERkVFNBYndjUmJi?=
 =?utf-8?B?S2wvRzZDNjlZWklpNVZHd2NFU29kN0pkOGkvQmlHU0Z5b2dUQlA2ekRXRW1E?=
 =?utf-8?B?NDB4Q1pGQzJmZ1J6MUkxL05mVlJyVENRdWh2S3RTTDVYLzNQbHlUZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 321695b7-0759-45c9-c97a-08de7e8f849a
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 10:26:40.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9Xk1xN7kx6v+RNI1hhkmQCSuNEBjxffYChz0F0K/lGeUSleoSTUoiViiCHvxMyx60054xip1ihNR5u+Uw1SLPJwivBIR0s4cuGD8N/um4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8067

Hi Heiko,

On 3/4/26 1:14 PM, Heiko Stuebner wrote:
 > From: Heiko Stuebner <heiko.stuebner@cherry.de>
 >
 > Right now dclk_vop2_src is not allowed to change its parent, while
 > the other two dclks are allowed to do this.

nitpick: the src dclk of the other 2 VOPs (there are other clocks named 
dclk and the dclk_vopX actually all (except dclk_vop3) have 
set_rate_parent and set_rate_no_reparent).

 >
 > All three VPs can drive non-static outputs (HDMI, DP, eDP) and even the
 > eDP can also support full DP connections (though no DP+).
 >
 > Therefore remove the CLK_SET_RATE_NO_REPARENT flag, to allow VP2 the same
 > flexibility in aquiring its clock rate.
 >

nitpick: s/aquiring/acquiring/

Reviewed-by: Quentin Schulz <quentin.schuz@cherry.de>

Thanks!
Quentin
