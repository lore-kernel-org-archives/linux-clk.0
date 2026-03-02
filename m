Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F52765E2;
	Mon,  2 Mar 2026 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440951; cv=fail; b=a4FRhf9hiM5QIi3f5tBbGUuuqhjnwhnrWf8RTjAFkLrkCrJ9+JJKt4pwPWXUiyxuOshvV3z41W6BioDP19Jhnq8xHUQt2PSoOnh5hB1mpQiacwJ+F31BtIW1f83eQMfim8CtjUA46W3tjcQJtaYk8TvN6nRIeZaXUSdM2WxcVzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440951; c=relaxed/simple;
	bh=lMH1S35g33dtIyNCHFMrSqKX9vlUXxKAQzrWND7Bu5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ic6RWuk55uhhCMriwlZW/K6YX0YqYg42VRKJ64QWxwr1OCP5euZa/XY49I/98LeeIAhYLs/zIoWoSg4VUPl2s3y7Pt2y0I4ChR/DkrB2xw23uiAbAOlI9G006vWjEhx0CaiMAkQdnr0MQx1EatAOSN+BcdPYPiBU9kdtIyLkVb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TEnLcVqh; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TEnLcVqh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOjyCl4EIpxAZiIxQr6DRpGGqfHvBbKgBACYhrXf2Tz0UxN5LBlWGvu6csQzpGGP1qBNoPvWBbZtKDKsKv9Wjn2CCZkQ5WPu5u68bGG8ITIPcD9V0QNLtzTfKd7c8+bIHcxusnihQ70xwFT8hdBnoWs+iCQd9YbmFdKV98wAslawlq3n2+DdwnCM+7E4v1PZvwWUrZJk+1zq5HupHASXg8tZ4RJJpRlp9b7SQYpUK2/2WXHkWJhARupaPT2hmekH3n8+cuVYY9cXEY1gBiDQs4VlQxzBivKmUb4RxO4IMjOom1wIve6UfIkBV1+PMFdT3IBNF2e9CSYQJcJ0UCVPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7B6E7k51Xq185j9LrcM+nzga3IaR7/VAV8IpRhu9oY=;
 b=Z8y4OrjSxw+e6sGwUHGZp28Ue3Xng//x81oSGcH/f9eFEZr4lh59Y+zlbmkX9rXpb568kfBSy0rCCBBaxV3MTzk67YZZxR78HyRIk55VURNOd01D661xk1KSc/OJm2ptI6DA7EyuOKd84qMGosnfYx+kDH+cjoHNNDcBB3wOsAKie6BSHeOEJQp9VxgqGDSSlZRGy8gSEIn8JOeNcga7CoqUrHgyektycaUW1/SZXUYBu5qNmv5iOkocu6zzwGr5hs2qp56lYZpjTQr3Gp0t6yeYYFQHWMT1gPWOOHbe9OKpm0jUVItDt01Y5pMJISwZclvbmgN6q6DEJGLRNY+Unw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7B6E7k51Xq185j9LrcM+nzga3IaR7/VAV8IpRhu9oY=;
 b=TEnLcVqh04U/XrsrRLgJ4mviTPRfGlnuowX8YEYatJnbDSDJGMLHaf+6dM6sTB9O+C3H2K7jRkHMkUI4DmFOhjMvqymFd6GFZIAKCeOU0c7tikN1VkuAv4bUsSVYiEsMeVUAs0LwujDJpNNoghfB8wpYSNn/JdGfyL+ADYA9oGPLtTIP10xBkImS/Tlm5IRCNvfNE08Cn9U0XLcjByBBIrOP1x5SlO/azS0Ld3PfVdWrhx+gLOqW/uHcyLAoU0zYus7wrPISCQg6z1m84pW2tWv6v0U7B32rijOzQg1uV5MsAflIPjiNmmm03Zxn4BegEozkHmRxu5jb6rz8b95JLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9378.eurprd04.prod.outlook.com (2603:10a6:10:36a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:42:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 08:42:25 +0000
Date: Mon, 2 Mar 2026 16:44:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Message-ID: <aaVN5lr3JBi6LwYX@shlinux89>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
 <20251231-clk-ssc-v7-1-v7-6-380e8b58f9e3@nxp.com>
 <aaK9HOMWNCb0wzq_@pluto>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaK9HOMWNCb0wzq_@pluto>
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9378:EE_
X-MS-Office365-Filtering-Correlation-Id: 638e52f0-c290-4f75-53fa-08de7837a129
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	C+oJFUH7mYU1kw8Cre54GDQ35OoBjksjuwcoxM5ZHzlzs9/WHaLITxCNF/wj5dRfXCB7CXTVRYR3P4eH18GcsAgKq+lX342kUBfAOxtPiCOT2IhqFHR9m8KZN53K8xl6yI2vmq4u6VqQovLwqWVvd/BN6UxRtV8iNk1xPKtra0yZnup/M8zB3iaVa262p3Lcq8Wuru6x5arrJ5n0Sa/Y5Ku3xEykqNv89egI5RJUytbU8Bhv6B+XOXUB47gLFympy/4C0QiVgDPoDd0bCO76DuygP/oJqIlS0p4qNGJoN1nnf1quF6DFOgg3ZshGO3URDVLl/wtsh7DrT2NfaYDe9EX+z/HYIr2Sxm1R10eiA7XBfZGAW4z4/F7zU2Spv3uM1Xv7TOwFuQTcdw+n0uGOrw5snegzrbylU+X6E88LIRswsVpB1RQXwpMctTEFmRhpOJBpzmBQ2sKcDJYgDaVSltKYcBsvWDPFYPlSxvFgxPg+opOJaJ2Hfl2YOHahqd5JImWjjiGNAilXXbmkXppwghDMFDgccZ5YO9U5lff7GR9OtTkT16q3DxuXyg2vAULsOhRRE65DUdGa0FAES2JiaseNGFCgSC8uIuskYZesQzBDZPdHP9UqXnWEB9Do94tZ488AzXXj6NboemC5shoFVcOZ8k5Qixv+5KmswDKvuxFhlQzXSWxruoGaMvV8am/lWXdoG0bxsxatt38tAfKLcnDdj+jx9kRBRk8UtgoZ2zNWRAq6iBPmLSmaLRIZaxx7x4+UCfZPjsMjDJi6zyQkDzYmVxY/UrJ9dfRkmJgcJ94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHNVM2wyQXZwQzkrUGY2UE9QaHJLMUFTSHZlb0xJUWFucWtmZUxCNFdNSFZa?=
 =?utf-8?B?ZXUwdGxPeUxjU1ZmNnpFNVZuaS9MWUJsQU52a29ERzVNcmRvOVN1SXMraGhI?=
 =?utf-8?B?U3NRQ0FNWmxHaWtobDdsblFaSy92UmZHWi81bXdTTUtHT1NtSDRkVFNFWEZE?=
 =?utf-8?B?Q2pUN2pNaVdnOEtqUDQrQ3BBS1VBMFRnY3dnSU5JRXQ1MElodlpHODQvWEE0?=
 =?utf-8?B?a2FraHBnUWwrbXpibDUyeUdQblgwaVlLL25XKzNFdEJISXU2MlpRdTJoWmVB?=
 =?utf-8?B?RUllNWhKbWprdFJReUM0Q1BKU2RqckNiUEFBVlozTGNpNUhYMFRJc1h6U2tJ?=
 =?utf-8?B?d1ZHaFFNbG52bFFzSU9NNWJqL2tHcmIwb0FsNUo5bDk5UnM2bUJvUnZwTHB2?=
 =?utf-8?B?WHBjSmhzRUZsb1BFbGZZZnFVeDlFNW1hcTY0NTNRbUFaaDVndUlvekx1NG9X?=
 =?utf-8?B?amZmak9MdEdvT0JjUlpKTHQxZzVrKzJSbWxpczlIQjVmUDdPcHBoZ2wzVTRh?=
 =?utf-8?B?RGNCa3MrbjRwaUpBWnZUaFhjMzlVQVppS1dFLzhmd3ppM1FCdzVsQThJNW1K?=
 =?utf-8?B?S1FPaGpwWTA0cjR6dnRpUGRubURRcHBmUThMYmRySFRMTkIrSmtEckZ1UUtL?=
 =?utf-8?B?eVN2bGxac1VKNjBsZVBFMDdDUnYvRXdBQXdENm1wWnpXYkVhWVJYNEtJS1gy?=
 =?utf-8?B?SE04cFVZcTRxKzVGN3RmZ2IyZGpkdlp3TlFNN1o0T2dZdmhVdEJQS0lpQ0NE?=
 =?utf-8?B?ZkZXeStqeFlxbGRYenUzdG91RTlrZi94YzhpMXFOSU95SXhzYVdva01ZaE9J?=
 =?utf-8?B?djhmRVpoMVpVNmxWTzRuLzNKc1JCYVNkOWFtcjlxY2haakMySnhOL1M3emUz?=
 =?utf-8?B?ZWZQMks5QVNVclJBZFo2SUU1TCtVck5ZdTc0cG8vTVZ3bzBTYnhjSzZyc2c3?=
 =?utf-8?B?djJFaWZQQXluRzY4YllDdzMwQStrUjl6ZnRBU1U3RFNjNVRSVzdFc3JHbEg1?=
 =?utf-8?B?NHFGY2ZVMEdSV08xWWIvSUM3T2J1WGNKc0pSOVgxcjR4MjVTMHBDaTlGUmZ1?=
 =?utf-8?B?UTJwU29NNVVjbmZ4YkUvVXJ6dkpQakcxRmJ2akJuYWpnR3lhSzFld0FRLysr?=
 =?utf-8?B?VnZnQUxQbzNxTUxYekhSUS9xbUxmRWd3MFNTSW8wVXlqUk9qanVKOXpLcFZI?=
 =?utf-8?B?RDhhL3dLNWJzTTdkZlM5dEhKajBQbENhbHZ5d1FldkdBS0Y0anErK0pOeVZt?=
 =?utf-8?B?aldLVW16OTRSSXJGbDRvckNHeDArbFFOTnFZbjcrdzlaV0M3VlpVV1BoSWpq?=
 =?utf-8?B?bFJXd1RvcklFTFBpWmhwYjZ0L1ZMUWlEZmJhZ2dyS0JvVjlHVFhBNCtkWEEy?=
 =?utf-8?B?ckpLdVE4ODFWTnFSVHFrY2ovZW5iMjJkMWdVYmgwTjBRdmUrUWFBV0sreU9p?=
 =?utf-8?B?T0IrK3dFRXJ3VFpUdXdQbkRlcW13OUVOQWJuMm9KTW9MMUFDVWhRcHQ5VFhR?=
 =?utf-8?B?eXpLMzNCUkNLSmw3ZFp6bmFOYUVHQmp3Ukh6T0NZWVp5TXFXMkJ6QUJjNld3?=
 =?utf-8?B?QUJ3bmNibDR5RzF1ZkRwTU9WMElXdjVUU2Z1MngxSE14dlliMWpOTHYzb0Fk?=
 =?utf-8?B?a1JaTXQ4ZkZ4N3JDYXlWODRoclFzdGs4dDhBQkQ4K2RhZ1c2MVFWYkZmOG1w?=
 =?utf-8?B?OER0K0dtZ0JURmFlTVdDOFlDVUpjN2phcWlsQ1hlRGtZWmZaaWlhOERUNzR2?=
 =?utf-8?B?VkJmL0ZBRnh1QWU0VzBuYllyRjhIblB1V1cwMm9mQ1ppYjRoZERpSTVmSS94?=
 =?utf-8?B?N1N1bHNFS0x1cCtGZEZoODNURElZSFdoT0k1NjRWcW5HQVV6T0QxMldFSVAw?=
 =?utf-8?B?emtvZE5OVjN4Z3dKb1RUSnlPTmNLa001Z0RmOFVwUG1uUHVSbmRFZXFZMlZV?=
 =?utf-8?B?ZmtBT0cybDdzSmMrOXlGMzRHMzdKbE5RT2dhSiswMkFpWVErc3pRTzN5ZnBa?=
 =?utf-8?B?M25WMlhIYnozUTVOMnp1RGxqTVlFb1pMSHZHYUZBMFc0dFhPQ1gzV3ZWdWdI?=
 =?utf-8?B?ZzNZNWx4bmViaE5kc1Q1QWhxZ3RzbkZKeUhrZ0R5dzBkbmIvcHhtR1lMay82?=
 =?utf-8?B?TlZQbjc0Y09TM21ob0tVb0E4M05ZRit3dlBRSXFYUnVqV2VhVktHV2JGSVNo?=
 =?utf-8?B?TkdJRS9qNXAzVHF5aXY4bTVXL0YwaXc0elFTbVFKcFZpdHp4QkdnSWpieXQ4?=
 =?utf-8?B?cTdtL0kxeDZWUVZFV0Z1dkhMZzdsWnY4cXJuVC81NkNmQWJrSi8xUm9sNGxP?=
 =?utf-8?B?MjNxVVRzT2p5a0tNKy9TNUdpa0ZTamdDTFErcU9ud3NpbUNNaFFWZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638e52f0-c290-4f75-53fa-08de7837a129
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:42:25.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TpOyIqN6W/c8SOKbG67Z2apyoO8aWMsFrmfSKi7pulvMX4Wf9Flc8vjTcyqsxp4H6VP0dWcq8PHmAul9tv4nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9378

Hi Cristian,

Thanks for reviewing!

On Sat, Feb 28, 2026 at 10:02:04AM +0000, Cristian Marussi wrote:
>On Wed, Dec 31, 2025 at 06:12:53PM +0800, Peng Fan (OSS) wrote:
>> +
>> +struct scmi_clk_oem_info {
>> +	char *vendor_id;
>> +	char *sub_vendor_id;
>> +	char *compatible;
>
>I suppose different OEM per impl_ver is overkill...and maybe better
>to be trated as a bug if it happens leveraging the Quirk framework..

Hope I not get you wrong. impl_ver is not used here.
compatible is machine compatible string.

The OEM matching introduced in this patch is strictly based
on SCMI vendor_id and sub_vendor_id as reported by the firmware. There is no
dependency on impl_ver, nor do we intend to distinguish OEM behavior based on
implementation version.

If in the future any firmware shows inconsistent behavior across different
impl_ver, we agree that this should be treated as a firmware bug and
handled through the existing SCMI quirk framework.

I could add a comment for the structure in next version:
/*
 * Selection is based on SCMI vendor_id/sub_vendor_id and optional machine
 * comaptible string, without involving impl_ver. impl_ver‑specific behavior
 * should be handled via the SCMI Quirk framework
 */

>
>> +	const void *data;
>> +};
>> +
>> +static int
>> +scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
>> +const struct scmi_clk_oem_info info[] = {
>
>Any reason why this cannot be made static too ?
>Given that you just embed it with set_drvdata and then get_drvdata
>back from the main clk driver...

Fix in next version.

Thanks,
Peng

>
>> +	{ SCMI_IMX_VENDOR, SCMI_IMX_SUBVENDOR, NULL, &scmi_clk_oem_imx },
>> +};
>> +
>> +int scmi_clk_oem_init(struct scmi_device *sdev)
>> +{
>> +	const struct scmi_handle *handle = sdev->handle;
>> +	int i, size = ARRAY_SIZE(info);
>> +
>> +	for (i = 0; i < size; i++) {
>> +		if (strcmp(handle->version->vendor_id, info[i].vendor_id) ||
>> +		    strcmp(handle->version->sub_vendor_id, info[i].sub_vendor_id))
>> +			continue;
>> +		if (info[i].compatible &&
>> +		    !of_machine_is_compatible(info[i].compatible))
>> +			continue;
>> +
>> +		break;
>> +	}
>> +
>> +	if (i < size)
>> +		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>> index bf85924d61985eb9e596419349eb883e3817de73..1ed2091e3d4a951c8662db4c94dee4b9c98b8326 100644
>> --- a/drivers/clk/clk-scmi.c
>> +++ b/drivers/clk/clk-scmi.c
>> @@ -14,6 +14,8 @@
>>  #include <linux/scmi_protocol.h>
>>  #include <asm/div64.h>
>>  
>> +#include "clk-scmi.h"
>> +
>>  const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
>>  
>>  static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
>> @@ -242,6 +244,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
>>  static const struct clk_ops *
>>  scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>>  {
>> +	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
>>  	struct clk_ops *ops;
>>  
>>  	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
>> @@ -288,11 +291,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>>  		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
>>  	}
>>  
>> +	if (oem_data && (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED)))
>> +		ops->set_spread_spectrum = oem_data->set_spread_spectrum;
>> +
>>  	return ops;
>>  }
>>  
>>  /**
>>   * scmi_clk_ops_select() - Select a proper set of clock operations
>> + * @sdev: pointer to the SCMI device
>>   * @sclk: A reference to an SCMI clock descriptor
>>   * @atomic_capable: A flag to indicate if atomic mode is supported by the
>>   *		    transport
>> @@ -317,8 +324,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
>>   *	   NULL otherwise.
>>   */
>>  static const struct clk_ops *
>> -scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>> -		    unsigned int atomic_threshold_us,
>> +scmi_clk_ops_select(struct scmi_device *sdev, struct scmi_clk *sclk,
>> +		    bool atomic_capable, unsigned int atomic_threshold_us,
>>  		    const struct clk_ops **clk_ops_db, size_t db_size)
>>  {
>>  	int ret;
>> @@ -326,6 +333,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>>  	const struct scmi_clock_info *ci = sclk->info;
>>  	unsigned int feats_key = 0;
>>  	const struct clk_ops *ops;
>> +	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
>>  
>>  	/*
>>  	 * Note that when transport is atomic but SCMI protocol did not
>> @@ -350,6 +358,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
>>  						 &val, NULL, false);
>>  		if (!ret)
>>  			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
>> +
>> +		if (oem_data && oem_data->query_ext_oem_feats)
>> +			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
>>  	}
>>  
>>  	if (WARN_ON(feats_key >= db_size))
>> @@ -407,6 +418,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>>  	clk_data->num = count;
>>  	hws = clk_data->hws;
>>  
>> +	scmi_clk_oem_init(sdev);
>> +
>>  	transport_is_atomic = handle->is_transport_atomic(handle,
>>  							  &atomic_threshold_us);
>>  
>> @@ -438,7 +451,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
>>  		 * to avoid sharing the devm_ allocated clk_ops between multiple
>>  		 * SCMI clk driver instances.
>>  		 */
>> -		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
>> +		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
>>  					       atomic_threshold_us,
>>  					       scmi_clk_ops_db,
>>  					       ARRAY_SIZE(scmi_clk_ops_db));
>> diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
>> index 6ef6adc77c836dc2d599ff852cdc941f217ee388..d7f63f36c56d155f728325efd6bcf7fe2585b170 100644
>> --- a/drivers/clk/clk-scmi.h
>> +++ b/drivers/clk/clk-scmi.h
>> @@ -7,6 +7,7 @@
>>  #define __SCMI_CLK_H
>>  
>>  #include <linux/bits.h>
>> +#include <linux/clk-provider.h>
>>  #include <linux/scmi_protocol.h>
>>  #include <linux/types.h>
>>  
>> @@ -19,6 +20,7 @@ enum scmi_clk_feats {
>>  	SCMI_CLK_RATE_CTRL_SUPPORTED,
>>  	SCMI_CLK_PARENT_CTRL_SUPPORTED,
>>  	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
>> +	SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
>>  	SCMI_CLK_FEATS_COUNT
>>  };
>>  
>> @@ -37,4 +39,13 @@ struct scmi_clk {
>>  
>>  extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
>>  
>> +struct scmi_clk_oem {
>> +	int (*query_ext_oem_feats)(const struct scmi_protocol_handle *ph,
>> +				   u32 id, unsigned int *feats_key);
>> +	int (*set_spread_spectrum)(struct clk_hw *hw,
>> +				   const struct clk_spread_spectrum *ss_conf);
>> +};
>> +
>> +int scmi_clk_oem_init(struct scmi_device *dev);
>> +
>>  #endif
>>
>
>Other than the above, LGTM.
>
>Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>
>Thanks,
>Cristian
