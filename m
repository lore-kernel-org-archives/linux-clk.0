Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414072367DF;
	Mon, 21 Sep 2026 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960646; cv=fail; b=KdoccT8vKtwP4MDz+tlm79Lqq+82fBTKRY0xTygIR3D7NJ90mA57SmMIy4UGhSToejr5QwlZpsNIVELAznwXPV/75Z5c2o0zyloD0MQob6ccG+U9CS+Jot/NB3L3FWdt45eWSOGJwsuIkwSTdN6mbiTxTbTrBEvKh3KEonpOVcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960646; c=relaxed/simple;
	bh=BiAqFf27KFi6TpvLUa+pT6XYYO0YNI2/rDbnkGQlY9w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TKL3W4FuznNkLfFyNQdRbY5ScG4Pzylr7bTYoSWzPkx1p98j6vT6Cq6AVvxTK8ONAFj7khwkpo7s2vZ0kgvcbAVpl/3JEAVRZ6rCFnBTxwLjWro1hJ1ztjwhOpIaGWQkG7+QctstG8tcaYAHFmXZYV7IONq5e7CqPRrT66nMWEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=fvFJ0WEn; arc=fail smtp.client-ip=52.101.48.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="fvFJ0WEn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbj9B+USDejwlg3oac0m/IgnR5s3cTwrfoctyy2mxnRJpobR6FR+Zl3gIKKxDCMDqjsF9kjFCwUHEz+lxuADvlTe3YbOk6wtK9ivE9RmlWUwdYdX0fY+IvfkC9xhV5H7Z6kz8JXb9XBMcQmfRmsJBhWnEgL0dAYDZvfA+wU9z9ym5iPpErNLLvYaOFHCCnsN2IpmCy223KgN9aA/N92fu9cqIQl1EJX4Gt7xCCOqk/E9JezxKnhvtkZhGHhiof++XyqxkRPVksf9OBg/EYF+4upjkS/A3+7L1XaQVNl5dZC5+2Z0X7TzR9SeboJ++Hdk6By3QvMbR6Jq9Ya7M/3w+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I2OdFVVJZ/HKIoJoTnRvkenExmPloZQpBzs6TmCuos=;
 b=G7Y5ZnOTtLMbxvD3GJY7h1QNnsLSErJxWafo3FCaNZCoBuFaZAHegIPrT1mSmBkGkSknAtRpeag2RIkw5USAZYuMoiXdFky+TdcT1d1GmSmw1RphVlBeLXthztnlMn5rmm0ZIbNzr5pYuO95SKW9LNSmqGCH5TSXlLI5UDS/JuRfWFZl/28fqyLyvBs6XLnSR25EfM9VYARZ84Zdh4go3sOpwEM8GZuAXKftECXKOQiU7dhk1Zlew37F6OkytohvN+IOl9Q8NO/vdkRSshyXl1lRdXUwmSBfaQF9vghvY99wKjXyZ28+VRj/jlWM9Fbl/4fnLiPv+Gsbr6lkXaeo+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I2OdFVVJZ/HKIoJoTnRvkenExmPloZQpBzs6TmCuos=;
 b=fvFJ0WEn+xM1I5KVboaAqIZ2RQrmwa0VUZHSuTJ9NZXPMfOMdXMnzgUMF9iz82FaCKvJmiig7cW1XVRlnQf2b4OnfmvrRlQyn6SgRZTTLD56/+FgoNYcMDqbWqkhzoG9Q1UxeA9V0QkioUxxt5jtw86qLAnbP/e5JRhZK2FzHKL/sgVvJJ+AaAsKF3gSD8Ln/Uniw/qqTJknRPD69tYo32VoLuN61X1Dz4YQCC6l12qTOT/CL2bwVn/PTBXstHGUwtIpfQXYAuREliw6ueqkD9xxdYDdsfAknGPsVb7HAkXlEqp9wytsvXfsqYOuSeIqHLDGxGRzdLL37b5LCjnIsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by SA0PR03MB5419.namprd03.prod.outlook.com (2603:10b6:806:be::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 03:17:19 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.014; Mon, 21 Sep 2026
 03:17:19 +0000
Message-ID: <1abffb74-3b9d-494d-a414-ea21d537ed74@altera.com>
Date: Mon, 21 Sep 2026 11:17:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: socfpga: agilex: convert to CLK_OF_DECLARE()
To: Brian Masney <bmasney@redhat.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1789096458.git.adrian.ho.yin.ng@altera.com>
 <c7006ac0c353640f52902580564a85d6d23c57e5.1789096458.git.adrian.ho.yin.ng@altera.com>
 <aq2-Ysy2wbLeBWd1@redhat.com>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <aq2-Ysy2wbLeBWd1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|SA0PR03MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: c3928c88-4cfb-42b3-4bb6-08df178ed858
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|5023799004|18002099003|55112099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	pApvsUcDkUP9nUIxYOY1mH9/dbRvuk1zmOxxxEDO0LcH3ka4v+TeBCzMLixK3MCCdzmRFSjd68otgykaCdTvQGeUvNCybDERtq/FbJOH1qM3oJZ2Kju8L2/TFRjygmKLIb5k33ZvBWTOLxQmQ+Gi5rXkiCFHD7V1qZVEsue27oDb93QVKpe3soxbQSqFpR+KKLZJRWACxV6aZWTEQdnG575NQjKPwr3XTGxCOMix5u64sDCDR+QIq0Ib8jq3FTYUNsx1APmUcVF6hspiVNjgsG95eT0okH8SB/wNTjGJhFolkHORSDsvmVeJBHr6J8sbnM3Gr3JjADZN6InyDTTGkbXvBgjAHH41j/l0Wb4iOHgfxCFh3ia69xDJq2NiG9XKvBiRSU9ALjQq/hHGH/41LqK/BmE7TeObZ1SwDuDbqrqKwo/TAlEFlHLUaUSpe+5J9j1Pnpx2lNWUtj149XZ3jp8N4BpEJgA0czsFWqkxqJuTFWvrs55vVDAEP6A00W4/xU3U3hu5bwLLiikXynqYMqn9pu1pJ1dcE7xdwXnpYkwvon50SiWI13OIEQZq0+DTIVEf5Pcn9GUcdhW86+sQZZM3cYmnXotpsXq6pgUC0/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(5023799004)(18002099003)(55112099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmttVHpZdjZhVjdCR05yOHpSUTBMZzVBS3haMjNPWnkvZ2R4SUVNcVEwVnFT?=
 =?utf-8?B?UFhjSFlCeGg2TlI2ZitOeDlySnVYWWlGd21qSm9RWmpmdERXNWdCcmxCQW1X?=
 =?utf-8?B?Q3M0UlE0R1ltVEYvWjAxZUxiQXVqVlAweVBKWnY4TXYvSldzVzAyYmQxWXlv?=
 =?utf-8?B?ZWRvVFJtYUdZMGhnSnRRVVpGeWdxMEFHeForTkNBTDVWRkpTRHhiQUVwbkF5?=
 =?utf-8?B?NXN0NjZUdmhmd1RGNlk4eml6U2JEcjBEK3BUM2xta3diNlNrSm04cGdmRTE5?=
 =?utf-8?B?dVdGMlRCTVpPZnI3empsdUpnV1ZoczlSK1hMNkkvOXUrOUl4V2hJMGd0Z3V2?=
 =?utf-8?B?N0pjNlJwVWhvWW5jcmlWVmlDMGRjN1F6dlVQcXhRQXplYlN5UEUwZk1qbXBT?=
 =?utf-8?B?MDNSWmFvbk5kQUF6Mzk2VlJSR0NiWFJaaFY4dW15MWlEYnJUc28yTkNBQ1dC?=
 =?utf-8?B?TzlISWNwcHZyR29FK1hhNmY0eUxVcENwbFpQN2Nab2FESjFXYzUzQlJHTk5z?=
 =?utf-8?B?T2cyQmEwRVE0TEFBeE41Y3hoYzQ0VUtpUmpzQXd3RmdBYyswc29FSDl1MEhn?=
 =?utf-8?B?RklpNHRUZHFWak94Tm9HcWxTUnhyb1ptTmFkTlNGbWdGU0dIbUFYUUFJZFJ5?=
 =?utf-8?B?R3FDeFhPcTI5YmlVY1JxTE1HRWpKV0FVanZYNlhQZGZYKzRYeXVCbmFnQnVZ?=
 =?utf-8?B?MEozQnJKc000NllteUNUT05ZVGhOdS9nSDUycExodjdUTFBneGtST0xJZC9J?=
 =?utf-8?B?czNleElGbkNPZGFOdUVIRnAvbzBQMnArU05rWSt4S0pSeHFvLytLOGVDYzRC?=
 =?utf-8?B?QmhHUG9UOS85RHV5cExUeVg3TGVEd3VPRjZ6U2ptME1TNFNSTzhwQ0JjU1ls?=
 =?utf-8?B?Ync2R3U3UUdqc2Q2YTRsM0xUcU8wNHJ5WEQ3Sy9yM1dZNjJTeWtVUWZtMzl5?=
 =?utf-8?B?UU1xVndzVGNLd2N1d0FPK2dtSFQxQTN1WUlHanR2SGFQV3VJS05sSENCMy9D?=
 =?utf-8?B?dXJvbGFaU0VVVnF2cURmS3laUkwxb3E1R3Fyd3QzSTdBNjloUG1CaENOT0t2?=
 =?utf-8?B?SmFDL3RjK01NQkZTODc1ZEtWWXdxRzJJRDZGbFFmQU9VaTRWOGFERmhQR3hq?=
 =?utf-8?B?WHBUTElZRFJuekFnYU5MZFBzNGFZR2JLcVpRVGdyUWVWMDdKd2s1SDd5aXIx?=
 =?utf-8?B?eUlRbHIvamtCeTJqVGJzcjdBN2wxbDZydkVDSUZLR2U1MkVjMGl4OWNYZGYv?=
 =?utf-8?B?VU00YlhlbGtmWklUY29nUyt2cUptM0VzNlB1T1RNNWVVckZ4d0hWdWhhRXVO?=
 =?utf-8?B?dlFlY2xBOHI1YlA3Y2FGWjR5aFVNZ2crMEdOS0hvbDBUMkRsNk5DUFMvVExr?=
 =?utf-8?B?QjFjTVl3b1NBQkZUbzdiOXp0V1hzbnZDdmFKSTJDZ1h1bHV5VklNTEdFOFEr?=
 =?utf-8?B?bGVWWUpzalprRHlzZzZQSmMwR1I1UVBXOGw5bXBPU291dnk5bVhXZ1ZuNm44?=
 =?utf-8?B?SFFudFZjd1lvdFc4OWt0QnI1bVRONVBvZnhqUHBDYjJHdDEzZG5HdFNNSkp0?=
 =?utf-8?B?R2daQ3NOaFlsWGxiKzZTM3F4VG45aUNwS0kxUmtMSVZDVllqWGJCbERwd3da?=
 =?utf-8?B?T2YrZ0pDMzd2NDVod2N1K2IrMFpsR2pkZG1VTjRjR3dFaGpuUDR2MkhDMHc2?=
 =?utf-8?B?aW54QjhvemNTVjBXbm9uZFFPZndWQVZQZnBWRnh4bCtLUysvUm9LdFcyZU9Z?=
 =?utf-8?B?dGRUMkcwNUZrSXVyWjVuUUhWbkM4WFN2SGhma0d3a1dNUi8zTVBhSEVIZ3VD?=
 =?utf-8?B?Q1V0MUVwZmpnSlZJaU0vcFBFUU5YR2ZOMGV6NkN0cFdzc1pOclhzK0FaMVEv?=
 =?utf-8?B?R1JNa1ZFRncwQ0paeHNzWE04QWMyNDVJQ1JGM3ozYy9UNGY3Y1czOG56NXlk?=
 =?utf-8?B?VFQ5R0Q4Mm0vYXJjd2FRcEFuTUVSZ1RsemJQb3VXUm1aR3N3WjFHQnE1aTcx?=
 =?utf-8?B?RVFlaEFoUStOVTI4L3c2bms2KzJUOXZBSGdiQkkva1Awdm5iTWxkYnVqZlFC?=
 =?utf-8?B?Mk1BYWs2S3RxZ1BKNmdaekE4MWFxeGdEUGYyd3FoVU15RUlocHlzUjNLbHVh?=
 =?utf-8?B?eGZSallvaUp1NnZHTWNvb0NoMzZLYVNHMFNHY2tNcjdkRWhudlpNSzFkMVhv?=
 =?utf-8?B?NTFmVjB4anNBZTRLK3BPcUUyWVRUbmZzaXdYMExCSEVITklKeDg5Q2lTYklV?=
 =?utf-8?B?eENPd2xQNU5SWU1IOWJieGc5TUkyVm81ZiszSWtWV0NrcW5yY3MyRFlLVThR?=
 =?utf-8?B?dzZPSFdkUCtNL3pESEUrWC85Qm1yNGVaaUtGS2lSTUFPajgvc1lVWUlZWkNp?=
 =?utf-8?Q?fKDWtic3NAtmqwJU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3928c88-4cfb-42b3-4bb6-08df178ed858
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 03:17:19.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYJhtbIofkRc3eCffCYVQD3Icx9ToUrpC9/O9sv4BJ+qmSvWxWduRkVCvSW/hio1i1oK9u6Rug8KgjWXkhVHC8K0knHPCPS/xtQyoruCTIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5419

On 9/19/2026 6:42 AM, Brian Masney wrote:
> Hi Adrian,
> 
> On Fri, Sep 11, 2026 at 03:01:18PM +0800, adrian.ho.yin.ng@altera.com wrote:
>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>>
>> Register Agilex and eASIC N5X clocks at of_clk_init() so they are
>> available before platform devices probe.
>>
>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>> ---
>>   drivers/clk/socfpga/clk-agilex.c | 83 +++++++++++---------------------
>>   1 file changed, 28 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
>> index 2bdea1997b5e..64a20c727d16 100644
>> --- a/drivers/clk/socfpga/clk-agilex.c
>> +++ b/drivers/clk/socfpga/clk-agilex.c
>> @@ -4,8 +4,9 @@
>>    */
>>   #include <linux/slab.h>
>>   #include <linux/clk-provider.h>
>> +#include <linux/io.h>
>>   #include <linux/of.h>
>> -#include <linux/platform_device.h>
>> +#include <linux/of_address.h>
>>   
>>   #include <dt-bindings/clock/agilex-clock.h>
>>   
>> @@ -454,24 +455,26 @@ static int n5x_clk_register_pll(const struct stratix10_pll_clock *clks,
>>   	return 0;
>>   }
>>   
>> -static int agilex_clkmgr_init(struct platform_device *pdev)
>> +static void __init agilex_clkmgr_init(struct device_node *np)
>>   {
>> -	struct device_node *np = pdev->dev.of_node;
>> -	struct device *dev = &pdev->dev;
>>   	struct stratix10_clock_data *clk_data;
>>   	void __iomem *base;
>>   	int i, num_clks;
>>   
>> -	base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(base))
>> -		return PTR_ERR(base);
>> +	base = of_iomap(np, 0);
>> +	if (!base) {
>> +		pr_err("%s: failed to map clock registers\n", __func__);
>> +		return;
>> +	}
>>   
>>   	num_clks = AGILEX_NUM_CLKS;
>>   
>> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
>> -				num_clks), GFP_KERNEL);
>> -	if (!clk_data)
>> -		return -ENOMEM;
>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
>> +			   GFP_KERNEL);
>> +	if (!clk_data) {
>> +		iounmap(base);
>> +		return;
>> +	}
>>   
>>   	clk_data->clk_data.num = num_clks;
>>   	clk_data->base = base;
>> @@ -491,27 +494,28 @@ static int agilex_clkmgr_init(struct platform_device *pdev)
>>   	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>>   			      clk_data);
>>   	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>> -	return 0;
>>   }
>>   
>> -static int n5x_clkmgr_init(struct platform_device *pdev)
>> +static void __init n5x_clkmgr_init(struct device_node *np)
>>   {
>> -	struct device_node *np = pdev->dev.of_node;
>> -	struct device *dev = &pdev->dev;
>>   	struct stratix10_clock_data *clk_data;
>>   	void __iomem *base;
>>   	int i, num_clks;
>>   
>> -	base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(base))
>> -		return PTR_ERR(base);
>> +	base = of_iomap(np, 0);
>> +	if (!base) {
>> +		pr_err("%s: failed to map clock registers\n", __func__);
>> +		return;
>> +	}
>>   
>>   	num_clks = AGILEX_NUM_CLKS;
>>   
>> -	clk_data = devm_kzalloc(dev, struct_size(clk_data, clk_data.hws,
>> -				num_clks), GFP_KERNEL);
>> -	if (!clk_data)
>> -		return -ENOMEM;
>> +	clk_data = kzalloc(struct_size(clk_data, clk_data.hws, num_clks),
>> +			   GFP_KERNEL);
>> +	if (!clk_data) {
>> +		iounmap(base);
>> +		return;
>> +	}
>>   
>>   	clk_data->base = base;
>>   	clk_data->clk_data.num = num_clks;
>> @@ -531,38 +535,7 @@ static int n5x_clkmgr_init(struct platform_device *pdev)
>>   	agilex_clk_register_gate(agilex_gate_clks, ARRAY_SIZE(agilex_gate_clks),
>>   			      clk_data);
>>   	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data->clk_data);
>> -	return 0;
>> -}
>> -
>> -static int agilex_clkmgr_probe(struct platform_device *pdev)
>> -{
>> -	int (*probe_func)(struct platform_device *init_func);
>> -
>> -	probe_func = of_device_get_match_data(&pdev->dev);
>> -	if (!probe_func)
>> -		return -ENODEV;
>> -	return	probe_func(pdev);
>>   }
>>   
>> -static const struct of_device_id agilex_clkmgr_match_table[] = {
>> -	{ .compatible = "intel,agilex-clkmgr",
>> -	  .data = agilex_clkmgr_init },
>> -	{ .compatible = "intel,easic-n5x-clkmgr",
>> -	  .data = n5x_clkmgr_init },
>> -	{ }
>> -};
>> -
>> -static struct platform_driver agilex_clkmgr_driver = {
>> -	.probe		= agilex_clkmgr_probe,
>> -	.driver		= {
>> -		.name	= "agilex-clkmgr",
>> -		.suppress_bind_attrs = true,
>> -		.of_match_table = agilex_clkmgr_match_table,
>> -	},
>> -};
>> -
>> -static int __init agilex_clk_init(void)
>> -{
>> -	return platform_driver_register(&agilex_clkmgr_driver);
>> -}
>> -core_initcall(agilex_clk_init);
>> +CLK_OF_DECLARE(agilex_clkmgr, "intel,agilex-clkmgr", agilex_clkmgr_init);
>> +CLK_OF_DECLARE(n5x_clkmgr, "intel,easic-n5x-clkmgr", n5x_clkmgr_init);
> 
> Why do all of these clk providers need to be registered so early?
> CLK_OF_DECLARE is abused quite a bit today and the majority of the clk
> drivers that use it don't actually need it.
> 
Hi Brian,

Thanks for the review.

subsys_initcall() / subsys_platform_driver() would not fix the failure 
we are hitting. Both still run after time_init(), while the DW APB timer 
is registered via TIMER_OF_DECLARE from timer_probe().

So moving from core_initcall() to subsys_initcall() changes nothing for
this consumer: the timer cannot defer, clk_get() still fails, and the 
timer is never brought up. That is why these patches use 
CLK_OF_DECLARE(): the provider must be registered from of_clk_init() so 
clocks exist before TIMER_OF_DECLARE runs.

On the broader point about CLK_OF_DECLARE abuse: I agree it should not 
be used merely to beat platform device probe. If the preferred approach 
is to keep the clkmgr as a platform driver (subsys_platform_driver()) 
and give the DW APB timer nodes a fixed clock-frequency instead of a 
clocks phandle, I can respin that way. Please let me know which you prefer.

Thank You
Adrian
> core_initcall() is pretty early as well. Can you use subsys_initcall
> instead so that it's available by time the platform devices probe?
> 
> I recently introduced a subsys_platform_driver() macro to simplify the
> code that should do what you need.
> 
> https://lore.kernel.org/linux-clk/20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com/
> 
> Brian

