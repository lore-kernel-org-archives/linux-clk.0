Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023126.outbound.protection.outlook.com [52.101.127.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCEF3438B5;
	Wed, 20 May 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266832; cv=fail; b=QvRc+HjsVMKuE0hmd7eI7isB5CCijKD+1D/XVjP812IqxGlVHsS32L0TIj5yyIA2+KWCVNcIT9kmsoS3SAlHC4g74+eiuZS6Pw11gxTfyD6xgHCe8ekbPqjcNjzArxrdSMPMxcyIn49rQidGv5LsvF6wYGIUiaGnQltmm+Cm/IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266832; c=relaxed/simple;
	bh=vYPYalPh9ktMpYk4ds2bm99dujca/USzz8nM3lCJr1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XS8xUgVPfYw21GI+2yKzWqYnDq/sDdX9yDYRNTe9fQk5NyBcOnxk6uIQf4rh8DkOSXGwMKcMtwVJaUzqm3zd1RtkKsU6IbswtNZvJLukDrHvjXjTHFcIkGfxF7HWHbFdENYEB4didmCRidVi5NKlJF8JSBMLti48BjBuZ8h6NEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=WpbDPoM6; arc=fail smtp.client-ip=52.101.127.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="WpbDPoM6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gje6xpFR8lS5tAOJDZBpKR+jb7NdnOs4cINocehqa6BqH3MAj841iMCtwhNTPNgpiTjznFlGha2QyNA6AOd8jyMp4U8VEBPipM1wu4tTEOJFSZw/xgtE+x75KAFRF8ZSPFFzbHx7fs71hsnfX6qADtVkXIrwa+IBwcd8yfjM1VjNUzPEzZrZpGM0xmT3Mk3azJ+eqLrwiQMRQp41cjG5MVP8J/wk5NQdTYHRi8xUO6vjTIHM7wEAiNmUsH/4OgKTsu/ic91m+7Ive5+ExLbKPPa3F1cAZDeX0uqyxg3RJUBcVk81zU2IUK89d5OkCdp7rtPnPupoKNHcQUE4fexGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dV55hNI6EFsCh0TJuXeJvYgBE3bNmnFm/eqFrRlpVIA=;
 b=F4xLrJ0mfeD7RH638iRJNstd/+zR2ileIdrcLHZCWNfl/UzOL4fCc7cGK8XLt5zo2UInLqvj8GGVq04bmiQ04/XILs2XO/qv/NomVaSJAYFYGOV8mnl6gNquESWpU3WhwzGM2rgE1p9pI3j70pcHxkJ4dSecEPkEAVpdgA1EFEP4808CTCsPFsgLATdcbOOHJ8P5uL3b1joO8gBJc1qPkJUlrIvLjjZo+e0iuxC+RYoLlgWBuar4V/8xelUtKT6lfAMk1VoRxVjamf5zx6yycrIiUi6egCS7NAaClU5Sgi9MtzQPxCFwT8tcythH8pBzXhPDwictEpn1Np8m3d9ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV55hNI6EFsCh0TJuXeJvYgBE3bNmnFm/eqFrRlpVIA=;
 b=WpbDPoM620iy1YWQMweEAvdLnerHrck/s1hEy5MHLT9yykRMNm7FBnvkGvArxfn/uZQ+VJ8r2lq/NFE5uWpfq4n6VsILmKRZKu+fMJdf/VlvBg1h/nAr71Q+yVZUq3YNYIBSUs+TPcAEpGs13DlWscClDv+WqfTsI8+vOW4Cq9DLXditVB1QtdXhd9DSGd13y0SRzLRGDv8hYr8v6ZDcg6EO1WQ+l3VJHJ8hMrpBgaPKwgyk14Fr+gX274lc0C4KG2TT6bcAJBm/hTFhDycw1aBuqaSgpfLOSay7PQL+aweakBh2ghhpdgMMwVnWaEoDxkBQnXX804l9dscdPpsTsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by SEZPR03MB7034.apcprd03.prod.outlook.com (2603:1096:101:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 08:47:05 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 08:47:02 +0000
Message-ID: <1bea1b19-635a-49ba-9859-3074607eefad@amlogic.com>
Date: Wed, 20 May 2026 16:46:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
 <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
 <d023303e-e785-4b60-85cd-c83cc3f890e4@amlogic.com>
 <1jwlwy5ysj.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jwlwy5ysj.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0014.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::9) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|SEZPR03MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e656081-f206-4fb3-54b5-08deb64c5d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|18002099003|22082099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5KZqxxclDi4Teb+T7w/f6JaDizYcdA0sEhFCPSZYJu6xOwRFN6TX881TNSiGYTd2H0PG0D+uTMcbZIyuYXA2Gt8imqHQnGwdFF+t9nQtpy3Yami/lG0M8INkpCxuhkfL4nL8EefkI5TDbMOV9TgDngAlqpKt6QkBAsCDArqGibTjCs3E0/vK24X6AdVShUMnOjyaNzpb51Q2zVxz1TuPJGOputn2KHr81VZNUhaIhczoCaWfA1+KVm0S+V1AUHdZgeuKdPq5mE0C3bM6jE2ATLE/QEXl3pF0NkT/XRz4F67Om/C1pPNUppajEzdVSMJc9tBi5cb44n3eFtDMTGHaJabu8YIsUAenkk2W6a3tf2s/qRZ4MMomUEf6+QkQ2u/423Y2QflZliKVm//2mZVxmTHkI7ZnVu9P92o2LvWl4vPWF+dom/4wgBW6giWhT+x2JfK+JGEvaihccvEVNmV3jZX8eiOO+k8QK2eIkqy6RC+1k3KMK2hkazlIqgnPHya+vDLcaktY6Rad6OUHdmfEuUe9VfR3oBOKu0fGKEirV5FDRLvBJ2aMIOpxCG1V6XxizaXFnuFMbn9yUZ7X9IBh0np+kM88HmVuLJThc2sqnX1Y4wsopzyd0cDgJjMmxi7GwRTfeddp7b0VI5SeMOtB7C4bjMeSgfSj9FEn5Su9CSs3BG35s33fTwi2JddGPfdQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2JsWnkrTVVlc01QQXNQS2lPenR4ZXE4RkE3cjlwbDg5VXJGZUJQajJQeVVp?=
 =?utf-8?B?SytyNkF0QjBOVXNhaU1aTTFRdHdmZzZIWmduSW11RDF6YmtQS1drdDUvRHJl?=
 =?utf-8?B?TXpGdU9DdWRvTkNGQzgvNUxtM0RhbjJlSmw5dXo5V2p5M09vbkIwUDFPcHE0?=
 =?utf-8?B?N2R3TWtUaU1DN01hN1ZUOGFiYTM2UGNKZjdQcTFZNlRzcm1tWHRNWWRSTmZI?=
 =?utf-8?B?eExWRk10MTcraFBzRVdtMWtFSTJQT2l6OXY0bUwzdmpWVU0wMk5LanFuS0la?=
 =?utf-8?B?dzNkSkY1bWdXRnVVVkc0bWFqTEdveTFGeUd1bjZOZkVGZVVESUNYME9RSklk?=
 =?utf-8?B?VEZVZFU2UTRuQXFETEl6ZXdWVndmbkpKSW84dzhOd20rNXB0SWtVR1JNSmY1?=
 =?utf-8?B?TC9UVmpjKzE2ZklzQ1VndXVkOEt0UWZmNG43Znl3ckdYYXlCMDdHcVhyeXFO?=
 =?utf-8?B?Nlk3UTgwdGExL3lmSFFHSkplNEZ0bitjZmE1ZDZUQVVzK3Nzb2VkS21LMmZL?=
 =?utf-8?B?cTNWSVl0V0huUENjQXhSS1JrczZrOWszWEY1OFpzSlVEVEVBbnRzdWJWMEJz?=
 =?utf-8?B?MFVENFRjOEE5Y2xyZFZHVnZ2TlVtVWRob2RYcmJ1dk1hMktkSlpON3F1RjB4?=
 =?utf-8?B?WnU3aTBBU0QwK1pxZGp3cWRlWG12aUFUeUZzOTlNRW96QjArZWxPWXJlbVVo?=
 =?utf-8?B?cVhQcW00bVhCNXdqUUhOa0QrTloxRmg3Q1hQSzhWRE9MakMrV2ZTVG9mZ2k5?=
 =?utf-8?B?SS9penRSaTRpOFRTRk9OOTFFL3R6YitTa01LTVJodXJxeExmRVVhak56bXJP?=
 =?utf-8?B?UG5nNXdaempweUVBVWljckp5a1VuZkY2aEpNeC9WUlZLYXJCSjdKU3JzSElE?=
 =?utf-8?B?Q2FBTnk5RlJHL0FhYVJHY3RWZHBLdTE4eTJCK0EvTGhhUmEwNXBJY1ZYMGZQ?=
 =?utf-8?B?d0o4cldxeDZhdFFaL1hYRmtvb3FRMVg4ckZ5eUo3K25lSGZ4ajJ3LzNtTHNE?=
 =?utf-8?B?Rkh0NW9CU1AyWTVXVmFtLzJrVFpWQThWdkhqTmhMY2ljeGdKcEhoUis3bVBS?=
 =?utf-8?B?Z3E0UW1paUUwZVdEL25nRklJMEcrU3hScUhIWkptRjg5YUp0ZHRodFdKNEM5?=
 =?utf-8?B?VjZGOFc2SVZiN2g2c0RJeXR2WmZDSkI1YUh2cVdCTWs1VkJ3ZEFIQ2NUdm11?=
 =?utf-8?B?cUFxeXJNa0c5T1FQZ0t3NzFDSHB5MDJCYlVrSGJORWJ6OVV2YklJZ3RkWG1S?=
 =?utf-8?B?S1JicC9CbzhmTVhtMEJTZ0ZjM2pxT3k2ZCsyTXUzM0l2UHpURHFaSCtSSUIw?=
 =?utf-8?B?d1JrY0RDUkZndTFlOGxDL2tjbnp5dTVlRHFaeTFmWDdWUjJ4Mm1LSSt2OTd6?=
 =?utf-8?B?UEw4SHFSK2hGY3UxZ3QwaGxzK1k5a0RSY1MyYmEwTmdMOCtjV3JFTW1jSThk?=
 =?utf-8?B?SkUwQ296YTF6NHZFbEdjNlA0OFhjdEtSdHlOSDBGWlpBUkc2VjRTalA4RERo?=
 =?utf-8?B?R1ZRaUhJUUVEWEZhUmN5bmR1ZGJNZTViSHIvWmE0OGYyL2hSYUcvWE9qcDE1?=
 =?utf-8?B?YTVZQ1J5SEFVYm1qeE4xY24yOGpIV1lwY1JHc0Q3U3NVS3Yva1kzWGtBcDVT?=
 =?utf-8?B?K2oyeG1BaEoya1pvZkZwbFdWZFdxWGxEMEQ3TUhmQU9sMEtCcmhIUU00NzNE?=
 =?utf-8?B?cG5sLy90Y0JXVm1BYzRDeE13bFVITEpOZlhMOHhXdEw0VkthUVRpckZPMTM3?=
 =?utf-8?B?VWJHa24zZ0RFZy94SW9oTVcwb2hua2tiMVp1NTJkajZYc2poczJtbi9KUTdl?=
 =?utf-8?B?aG9kNGlQM0ZpVGtwUUdNdjVMdXVZQXZJYmE0R0JZc1g3QVhTbGszTWtpcEc4?=
 =?utf-8?B?SjBiait5bkhtZU44VVhPdm9Wbmt5Rjl2VEpaeE9kL3RjYkNMZ1NVWkdYNmFT?=
 =?utf-8?B?SU5LQlVCYnlSVDEwN0U3bklvamdVQjBWb0NTY2RhSEV0cG1SMHJDTTNVMnVh?=
 =?utf-8?B?N1YzRDc5WUFGR3lkREVYUGkyeWNNbjFJcFJYSEtxREREVXhjVmZ0L1BtUTUw?=
 =?utf-8?B?YzNRRXNaQ1ExRWhZNHd6OC8vdTYxZFRmQW5XbkNQTnlJRXM5c2FNRDBuM1E1?=
 =?utf-8?B?RU9RQm1ldFpQQXZRaGRPblhKRTU2N3JGWmhXYng3R3k4ekhRTjRpSHF2T3hW?=
 =?utf-8?B?MmhqZUllS2F2U0QwcFB3Z0lLa3dUQnNjZVBFUHJOR3FNSXFxQnBDUDNQTHRh?=
 =?utf-8?B?dUcvS2tITlovR1lQNDZlUkRnTlhvVlROUEZCRnN5M3hra0gvZUIzWVYyeDYr?=
 =?utf-8?B?bk5vL2JsKytXTHhSblBybzNXUnovQmhKamdaRGFsUHo3Y29SUFlZUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e656081-f206-4fb3-54b5-08deb64c5d05
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:47:02.9082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IyuDU7I91wJiQPWnsEc4xU9A/3e6BmXoQBQn/Dv782TKI4XAKLRf1cglXTgimyoduub5X5lKBmuxAlQiBzNd8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7034

On 5/20/2026 3:24 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On mer. 20 mai 2026 at 11:25, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> On 5/14/2026 11:13 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:
>>>
>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>
>>>> l_detect controls the enable/disable of the PLL lock-detect module.
>>>>
>>>> For A9, the l_detect signal is active-high:
>>>> 0 -> Disable lock-detect module;
>>>> 1 -> Enable lock-detect module.
>>>>
>>>> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
>>>> like A9, where the signal is active-high.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> ---
>>>>    drivers/clk/meson/clk-pll.c | 9 +++++++--
>>>>    drivers/clk/meson/clk-pll.h | 2 ++
>>>>    2 files changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>>> index 1ea6579a760f..5a0bd75f85a9 100644
>>>> --- a/drivers/clk/meson/clk-pll.c
>>>> +++ b/drivers/clk/meson/clk-pll.c
>>>> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>>>>         }
>>>>
>>>>         if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>>> -             meson_parm_write(clk->map, &pll->l_detect, 1);
>>>> -             meson_parm_write(clk->map, &pll->l_detect, 0);
>>>> +             if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
>>>> +                     meson_parm_write(clk->map, &pll->l_detect, 0);
>>>> +                     meson_parm_write(clk->map, &pll->l_detect, 1);
>>>> +             } else {
>>>> +                     meson_parm_write(clk->map, &pll->l_detect, 1);
>>>> +                     meson_parm_write(clk->map, &pll->l_detect, 0);
>>>> +             }
>>> I'm not a fan of this code duplication.
>>> Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
>>> first value, then flip the bit.
>>
>> Ok, I will update this in the next version.
>>
>> Here is the updated code:
>>
>>          if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>>                          meson_parm_write(clk->map, &pll->l_detect,
>>                          !(pll->flags &
>> CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH));
>>                          meson_parm_write(clk->map, &pll->l_detect,
>>                          !!(pll->flags &
>> CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH));
> Please use a variable. Make it clean


Ok, I will use a variable for it.

>>          }
>>
>>>>         }
>>>>
>>>>         if (meson_clk_pll_wait_lock(hw))
>>>> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
>>>> index 949157fb7bf5..97b7c70376a3 100644
>>>> --- a/drivers/clk/meson/clk-pll.h
>>>> +++ b/drivers/clk/meson/clk-pll.h
>>>> @@ -29,6 +29,8 @@ struct pll_mult_range {
>>>>
>>>>    #define CLK_MESON_PLL_ROUND_CLOSEST  BIT(0)
>>>>    #define CLK_MESON_PLL_NOINIT_ENABLED BIT(1)
>>>> +/* l_detect signal is active-high */
>>>> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH   BIT(2)
>>>>
>>>>    struct meson_clk_pll_data {
>>>>         struct parm en;
>>> --
>>> Jerome
>> Best regards,
>>
>> Jian
> --
> Jerome
Best regards,

Jian
