Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB063E49CE;
	Thu, 23 Jul 2026 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803505; cv=fail; b=NP1tsl9UnPW+Zdsm0KQJC8IvQlfiASAwO75wrSuV509XI6T1Pc95pDQC27NUhNS3AACO6e+sH83lAab3Wa82gVFmTVSoqB/OnYmdHS3CsvnsQ45G8bUM5eeTL+gtJxWPEwd+qCbTU9j0sEGmaZVyDKvIpaTkND6PNApRCb8ffcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803505; c=relaxed/simple;
	bh=05uol2gufp1zMlnC4CUhMMda/ZM3xWob6OvlP44rays=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PUyYEGSid0gw/JYupKMamR2I+cErGaP41ik0rrntk+SZV/jUGaNJ+BSrannQJlRIhZO9aWVLYq3NCp/xAbdlg0JyEo0243vUWcahhgyKVLK+2rFBFwWYB9RJ1dp4zYEEb72RvnNS3sz4mrvRc+ounWgh9rs18PCIvniIDY++W6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=mzLFNLIB; arc=fail smtp.client-ip=52.101.70.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="mzLFNLIB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlUrzkRY7iTmjsw1XdrMq3fImvd0QvtSzFDhtuJMaCxtCxAs5m3eVcjDcsK/Y5jNZinsBfRQjzkTygCsMAxeL7qhJ1DHCRoQrlBdb9EQdePsCFGZzuXPYaXpk3br+l/SbNmciCLDI2Ep/N+QKPmyC1ZaqqDTLgSljdSrGARgHSAvpMJJhXOppf4MIfPv9qtyI3afVTzsiQrRhC7H8pFKelL67I2SKyNbhifVjcoY3B/VfmJU0g7yoOZXNs6qTZbObe3EMdQK8bjqHbQD9tNEuEf3NGYg5jdDc/FtM4xGvobZkfBsvaYZQKU5Hz9pICadAU0kHZNwA6ppT/RMnbQ0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJHxbqFpi9VyfbAAKfS5b47j0CbIMhJ7zosl0CJJCDs=;
 b=XRv3fCGK/EuIfQlEU87RRLTcKjiF3iDx6u/zdmVITSgAugk8lP4iZpB46owCwaeg2/5wosFXjc6+hxJWTwNSN4SiNWMFEKOW9cjm5fbiBPLBbSRYVNI6lyi+OTHfQavia8nIGO85SCzhF5KfTnjrBTBpxTutqJOl6a81ra5RTbgww/YX/BF9RZli0Jl1wj/7Sp10wLcDz45cadj9WnHmC7HYow8eIOqaQidK/7F1VjvJUOFwqIqJRYGx/mvBrXggj50uMlZlrIUWYvHoH3SKREFYKTzvZRLZOKzHaGL+/MPx/UyLBvCIEWfMRI1+duAPnJHw1eGiIUCdmj/YIKVxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJHxbqFpi9VyfbAAKfS5b47j0CbIMhJ7zosl0CJJCDs=;
 b=mzLFNLIBOG93//KTNyS7ok02NyT0ea69qWs1O5+8si8v9mpTONi3ESlgy/00KBH6B8zT86KDIECZ8RXeS7fe7LeE3PzX2MH1FZewYFftlIfZ1cruPkdvJlE+V/davN5OxzgClTEDG28byAzJzcPRUtePP/pgqWxlJSRZBdfN+rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by VE1PR04MB7486.eurprd04.prod.outlook.com (2603:10a6:800:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 10:44:57 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 10:44:57 +0000
Message-ID: <fecf49e0-e13c-41e6-92eb-ef56c9afa0be@cherry.de>
Date: Thu, 23 Jul 2026 12:44:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: rockchip: pll: Fix the fractional part
 denominator on RK3588/RK3576
To: Chaoyi Chen <kernel@airkyi.com>, Alexey Charkov <alchark@flipper.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
 <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
 <5676B227B50EB88B+ff62bc9e-5175-481a-93f8-c1de7f68eba2@airkyi.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <5676B227B50EB88B+ff62bc9e-5175-481a-93f8-c1de7f68eba2@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|VE1PR04MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b3e547-757e-4ec9-3d62-08dee8a77043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|3023799007|10067099003|4143699003|11063799006|56012099006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YC9lyUmI/TnGt9RhkWBvcYKgXP6IXpaUCEu8SgTWtoewX3jlzv0w8SdpqGNR/Xh0HFSZ7/bUnVxnkdW2vPF7ipQX9Nnrbqh1RGTDm59VMyvdnwP0AiZPfC3eHWT0U/7U0KrurYxAuWIIHAn+0PLKNwgtZY5U97qOfyUcIrwk2na1589T2byaSriBu58XvZtVUhnn9HKhUnEfUr9xVJTNPfYdAHWAn1itmCnKLL12keJhg9BRqLMmQB+XutIyQqI+2IjZxq9bSMUqpVTDsLV630fNlcnDtldsNtuDHSwMbxhC1492BsX7FphrZ/GT61KoOUfQ4WmzV6fGqaQCbLjQ82jUbd9tn/zGysuj9Ne5lI67hVgFCKaxqfNdq821Dp2oX5KY7znbnyTgFLziw6QI1r1V1RXeXc2aR4Q6uq4RSVx4RZlZ17CJuOITlk+sdd12RUXY564TH6quO2ctcQ8tP+UGhd+xcoKu4iyjQ7C5bjFW60EcPyDNPJ1ounRE7aN8LbNrsepZ94c60bSEFhgmB1uOEQVNKMMEOQ8V08G1WK+xdy27nXyjBsgegyWwg9DEv9oDgJfeB4la0dXQ5rPBDuPSymE2Avb/3CC99eOnFl9vSFFlSAL3f7yHqObMLTW4HVwz1REq/18wvA4Ves7Wbr5pJTttzi6J/OSPRB9Yx+j0JIJNrkpH4WDUnjRjQ27A55yzolDtsqJPlh/yCE2rsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRIVGlnZ1Q4bEVNVnE1TUxXTitMVm9wVG42MWZWTjBnRm8yQmlkdC9yVWJm?=
 =?utf-8?B?eCtSdmtBb3h0c2tyTUNEWkl4NStCZXNTTTdhWURlVnliTit6TXIxV0dVeE52?=
 =?utf-8?B?MU54NFRiNFJvU0JxdVhTZno0SjFONFJGL2dBeDhLVDdTRVJSeGlRMVdFb2d1?=
 =?utf-8?B?cTVMVzJFY0F3QVNZQ3lIRXZuYWIrUkthaXUzRFFwWlpybjZRYWpZa2F2cG91?=
 =?utf-8?B?Z0VQMXFtK0tZYW9zQzFnQkpTaDVySDBwL3dmcUJIM1lFbXhJQjE0VEJLeWRH?=
 =?utf-8?B?eXhIM3FBTU1EQ0ltbHJhaGpuMDlVTjZBS0pnMk84RThnWk85QUpRZGwzS3dt?=
 =?utf-8?B?eCt2N2o1bWtkU25KQ1lSaW9BcFpaUjNTdVBhYzc4YVpRd2VsaFpiUGdaNGl0?=
 =?utf-8?B?VzExMnpSU3hiaVRSNVphOWtLTWhZcEJtSlhhVGlrT2NGd1pXU21wWU5SWkpN?=
 =?utf-8?B?ekcvMzlNQ2pDU0JNUU53NVRBbUdBMEJnOVZNcCsrU200Q2U4amd2aCtoOXVi?=
 =?utf-8?B?cnc4cEM1V3RhdFlKRXFsWDB5bDJhV0tyWThtcUh0aXR5UjBkQ0IwaG95Wno3?=
 =?utf-8?B?UGQ1MmZEdVIwZTVDeStCcU9lakhLUE1DaEIvUThPYW02QWU0YUZuY0JTVFlX?=
 =?utf-8?B?bnBkKzJJT0hzenRKaFRXVFN4YVI4ek9lbGJROE0vR3cyRUwxRTBVdjFucHZt?=
 =?utf-8?B?VTBnN0xlRUs3TnBQUjN6bENqTG5lc0dRc3hLaENxMW5lOTB5MDI4alVSWkE3?=
 =?utf-8?B?R21JaTJMR2RBNFhSNTZLcUk0WWZjY1g5cGxJMkV4bCtPOS9FeURvcURFYloz?=
 =?utf-8?B?SktVTjVic1FwajIvbmc4SlN3dnpkZGUvS2NyQjFJd3I1R2RhUjlTbFdyMVhh?=
 =?utf-8?B?SGlTTjFxZFZGM1ZiV1dEUjVGcm9NQnJZazl1SzlLbTNlK2toT2JJeElaM0V6?=
 =?utf-8?B?NU1kNEJneEFiR3NZSmFYajIvUVZyRHN2VEdzYnpGKzJINk5XeTJLRGVTRjkx?=
 =?utf-8?B?SDJiUnBmMGZ2elA0UmR6S2RWa3dwWGtTTlg4anIycUdaVU9scGlKdE0yUmRJ?=
 =?utf-8?B?MmZyR1JmUGpHdU9JUFpTYktWQXp4RWJicEpJSnNBQ3NaaU9IVE5nZGxqZW4z?=
 =?utf-8?B?SzFMeDJDaDl0UGZZbXZ1czQ2UFlWY0RaVGl5cUJMdXdzK2hkQS9qOWxsY3dR?=
 =?utf-8?B?c2FMczhtUnZHakh5N3hodjI0S1ZNNnlqOFRJOTNJT1JNVHpueGRCMW5UMURu?=
 =?utf-8?B?aitGNjdXcHlJdFJRZHR5V2tDaFZLVTlQakZRa1QreDJ1dU5oaU5QZmVUV0N1?=
 =?utf-8?B?dGtuZytkR0toMlZvYkRwRFE4bkRqbGtzR3BFT3U0ZE5IUHFJcUYwSTJ6Nmd2?=
 =?utf-8?B?K2x1Wnd4Q3QxY1dVYXJ1ZFIxMDB3enRJS3prbkhyS2FRTVBqZlB3MW5qL0t4?=
 =?utf-8?B?Z2ZISXRIKzFKemZIRWhtTkFQaXlNZ1RySkxTZmJzNGRIdEJVZTFQVUdLcmdj?=
 =?utf-8?B?SzQ1Skh0eEl1OE1MTGtka01yWXFxUFEycW1KM0RvVXJrc3BFTWtqanlSUHpU?=
 =?utf-8?B?UGpjb0dpUUVkM1cydE82dEpYWmtJNFc1RlN5SU9JTUVaS2tKT3ZCL1RuV2Vj?=
 =?utf-8?B?aTdBWElDVHBjQm1YZS9qWkFmZ0Nxb1F6QlZDNjVpSEd2UitHWllQazFZcFBT?=
 =?utf-8?B?Ty9XUlIzcUpqYnFBRU1nN1Q1cU80L09Oeml0Y3MvTzA2VmJEdVFpMHJWMk5i?=
 =?utf-8?B?TnVXZjdUYWJuSlNhMmE3UXJabFpGOUFITnpQS3pSMHdINTlTZ1k3aWpVRXdG?=
 =?utf-8?B?SnJJV1dtS2xBTDh4TkVRcmRlVnpjYU8vVDhxckp5N1hKSWgzSi9oOTVqQmdV?=
 =?utf-8?B?NEpidTRwaUhIUkM0eDFraTR2Rnl6THNIYk5lSEZ2THRVSHFjWDZ6aXRmRHM0?=
 =?utf-8?B?Y3ZHdlRCSHh4VktWSmlPRlh5bGxYMGF3NDNHMmdqeENDckloVDN4Vm5DMWRX?=
 =?utf-8?B?UHVhbVlLOEpwcTNtMTlyTzBWRW4vemltSzJGWHd5UGUvSlRWU1ZwMWhDZTdn?=
 =?utf-8?B?dU9COUFSWEpGSlFGdmFLWTE5MHNBd2t1UVAxTlJwNi82TXBvbVVwazRrZHJ2?=
 =?utf-8?B?czZLUU1yMlQvZ0NjTmRkS3pDNG5UV041WXE3YjVkc2NMVnpTK0swYSttRFkv?=
 =?utf-8?B?RmJNblNhVVBVTWl1TmdnU0F0aG1PSkx1WEkxVmdrS2kzbThJcGJhTThZdUFt?=
 =?utf-8?B?R3pIUWZWQ1FoNFBqSE9TK3FtSkFhdExRZGlLU0pMUzVkNHNMa0N0S2VPcWxu?=
 =?utf-8?B?RnpJOGRMTFVJelJrUlNlNFJpU2RhL1BQTHAwZENwZGNkRXZKdDBRUT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b3e547-757e-4ec9-3d62-08dee8a77043
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:44:57.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSAysmoQvX4kRomyhrQjUjJCHXWWSx3Ls7DsG68OFAVdSqd/PDcEyUDdwrhDE+t4LKWW8iWwKVbxfN323Keqc3ThQV8MFKGIwZLKu9LGfPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7486

Hi Chaoyi,

On 7/23/26 12:32 PM, Chaoyi Chen wrote:
> Hello Alexey,
> 
> On 7/23/2026 6:21 PM, Alexey Charkov wrote:
>> According to the TRM, the fractional PLL coefficient should be divided by
>> 65536 rather than 65535 to obtain the output rate.
>>
>> Fix the denominator and add a comment with the TRM provided clock formulae
>> for future reference.
>>
>> See RK3576 TRM Part 1 V1.2 section 2.13.1.4 Setting Guide on P, M, S and K
>> or equivalently RK3588 TRM part 1 V1.0 section 2.17.1.4 Setting Guide on P,
>> M, S and K.
>>
>> Fractional PLL rates don't seem to be used by any current mainline
>> consumers, so this is purely a correctness fix. It will also be important
>> to properly support DisplayPort output going forward, as the video output
>> controller derives its pixel clock from system PLLs with no dedicated PHY
>> PLL option for DP unlike HDMI, and some display modes are only achievable
>> with fractional PLL rates.
>>
>> Fixes: 8f6594494b1c ("clk: rockchip: add pll type for RK3588")
>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>> ---
>>   drivers/clk/rockchip/clk-pll.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
>> index 6b853800cb6b..bf8acf7cee0d 100644
>> --- a/drivers/clk/rockchip/clk-pll.c
>> +++ b/drivers/clk/rockchip/clk-pll.c
>> @@ -900,6 +900,13 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
>>   	rate->k = ((pllcon >> RK3588_PLLCON2_K_SHIFT) & RK3588_PLLCON2_K_MASK);
>>   }
>>   
>> +/*
>> + * 2250 MHz <= Fvco <= 4500 MHz
>> + * For Fvco > 3 GHz: period jitter +-1% frac PLL, +-0.75% int PLL
>> + * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
>> + * Fvco = ((m + k / 65536) * Fin) / p
>> + * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
>> + */
>>   static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
>>   {
>>   	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
>> @@ -915,7 +922,7 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
>>   		/* fractional mode */
>>   		u64 frac_rate64 = prate * cur.k;
>>   
>> -		postdiv = cur.p * 65535;
>> +		postdiv = cur.p * 65536;
> 
> 
> How about using 65536ULL? Will the multiplication here overflow?
> 

cur.p is an unsigned int. p comes from the HW register directly and it's 
masked with 0x3f so it can be max 63 * 65536 which is well below 
UINT_MAX and also below U64_MAX so should be fine. It could overflow if 
it's set wrong in the static table we have in the driver, but then in 
any case we would write something that cannot work in registers (as it's 
masked when being written and wouldn't match the value set in the table).

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
