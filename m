Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85003D171B;
	Mon, 20 Jul 2026 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538258; cv=fail; b=MmmfPi807UN/hRXt6Xe3gWfJF6fIuauanaCYPv0Ozp01y7pjs+8zOeKXXxTC67QkOLO+9YlSBYJ+SyrEbOUz3dsY4IRgo0aIZ9LJCiA8wTsmGLXaSWliuHHN7nxM7FAxEhRA3r+mm2c5/qgGGnBsAmM/5PH+VEvV/kH8FavjRH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538258; c=relaxed/simple;
	bh=Y2OUxFPhtjKpgppAT7gq9o8oq3KL/MwOPhezM6nT8cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQbyi0fjWtR7uSKvx0MEjpL4fOswGATmpTE7H3+dAZvvNKAZBpmOjr7tUXnTiSMXbwPqHMouPUyKNvr/XaaBvh7cRgKj6NCSDXLFs7DwIsDRS+siMcR6TfhmED3DvfwgCPgOyX+BiIg7HduiWS9czZNgCsmF0bj/N4J3v8hJ/MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jjdejGgb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LmCdZpLL; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jjdejGgb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LmCdZpLL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K5UQgh3686163;
	Mon, 20 Jul 2026 04:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qSTeG9uP6gZPrjS2qXtxxZuKrO5YYvEX6YECRI2Rb1c=; b=
	jjdejGgb0gPUBqo9t9Qj4wZOFsA4jbK5T1UGr40G2n95n9tIiAYsClVf17weZFjc
	ilb47qk2GSw4jLJgueFo84l9zl8EbRdhyeQKF/LaJU+JwdjPSjH434yVr4sn5TA8
	zWNFcMCSavExqWV9lXO+BdXWFEELltuBp8BHMzGvaszvwKA00ZZdtUw2zswvFT2/
	2sPh0YZ9EiIr/YtEg6E+JPAELco3lBEsJLgv5/D8jyfEQs+/atBf3CHaylAswyy0
	S3tIGg7veb8IqJNLOJODYj/dPbhPvcZiZB2LZtnQPvDJZdaIaMAkqY1FGj0s1Hug
	khZh0v9OjsR3XH+c2OIfSQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022083.outbound.protection.outlook.com [52.101.43.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fg6vyj6ur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 04:03:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDtSgliAUQ/6xSfJvGDH/ZhXR8FTZaKeuTAah/4MPmyaiRYo0rYoG78e4+dgFP8PLwKgFX4y0Zvgx9LZKfk9TA5Pk/kUS4hRY1Xs1Iqwh16z5NjeyKpx/YrZEwO7swevHaIhYXgTfavPp6pTBva2oto8jAYmBnSFQvUx7O/TpzP0GHMaKEXX+A7KbfzbUsdKQV6P/aCdl2rl1B1gHcHX5+6+/MHB+FsNgk/yOguRkSA//yzDwYZWW0bJLDTfjn5n9YrbMbwgJRcpoJTvHlxYrQYoC4uoyR4q7cR94a3KLmGTP0hXdwALm2Qgb8zIPcJD4lzKEzc3yrDcOxlTOZF67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSTeG9uP6gZPrjS2qXtxxZuKrO5YYvEX6YECRI2Rb1c=;
 b=A3bweAg6d1nV7TEcrA27UC3+1sr8WOgTXqfXP2xpqSKxKg2PvYGfTBGUn7ggrT8vHbuxuw+RijVm8kdbi1mYp7Zwv0ByZUW515pQ5QC1D1O3vnqIU3t/2mMTzIjYx28t7pjKeQO6GNWu1P6j3JnoRhGeEajShsSHflM0ugXFrFjy1y7HpT/YkK4SZlvN3x/MNwerGCYQB6tMWc/YDmcSUoC1vNAEPnCw8PI71DwPmm6vlpeOdnuBw6zKLQpjgAue0V/H1JwoiEnwq1kOQreVxVkeq0sIn3u5EX5oulxuVvztdLAmBdSn2lTN2l2jfr43M2R372oEX0o0rQTo/FUcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSTeG9uP6gZPrjS2qXtxxZuKrO5YYvEX6YECRI2Rb1c=;
 b=LmCdZpLLtnShPioXjSQ/zbQAaEzaJxJ+y++/T/ylxyn5bqYpigcKxunr4oiNnd77gP/FKq1X9YvDgGx0dMxVYbzD8H15mfiS9r6xezUPipiW7ZXGjHXisXVrb023hYKxMWenzKQQ1F5vs9BaRpD9AstETPZ2rUonbJ5EHWB0svI=
Received: from MN2PR14CA0010.namprd14.prod.outlook.com (2603:10b6:208:23e::15)
 by BN5PR19MB8965.namprd19.prod.outlook.com (2603:10b6:408:2a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 09:03:51 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::6c) by MN2PR14CA0010.outlook.office365.com
 (2603:10b6:208:23e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 09:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 09:03:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3B6C1406541;
	Mon, 20 Jul 2026 09:03:49 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2B95C820244;
	Mon, 20 Jul 2026 09:03:49 +0000 (UTC)
Message-ID: <49ad7c68-0d5a-4ccb-b769-9bf3af611518@opensource.cirrus.com>
Date: Mon, 20 Jul 2026 10:03:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] clk: cs2600: Add Fractional-N clock driver
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-3-rf@opensource.cirrus.com>
 <ak0iEAJsZJOkvkX1@redhat.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <ak0iEAJsZJOkvkX1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|BN5PR19MB8965:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f4656c-257c-48bc-9d7f-08dee63dd111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|23010399003|11063799006|4143699003|3023799007|13003099007|56012099006|16102099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	XXg/hvl8xsFmykGgWVOoKdugot92pwmF69L6Ux6Yoa0txSUQaj/GHJ1t3yfBqsoMSNcfhQ93lValCCdbQ3oVyFru+kAkq/UG0ekwhML0IYY4wYosogTc57I1To1P7WzTo5cfQ5BBOiIs9gYu8gdYqF3oQWh+aELEMzDF25Sm3dgObYCbP/S+q5GTK4xFMEfMt0RMdhnaPbuMqfXtd3FvWEn7g7EhXSsspmeOWLXz5ir/DW7pVhFFwt1P8Sasmo+hjP3K7OCnOYOpX6g3keiGveP9GZ6k05QbW6TZxP92y/CQ3xAqKkUhPN47ut2jnU9hm3H9bF/AZ6Etl3A34syW+ijaZIsSD15fCoWPpX+QSI/ZI4BUq1/JJL+a1VCQVeH8Sa3EbXvvr4oIPJajA1Tt/oh410aDAVpX2jqXICIm6z/53ADFdtd/e2aTnU2cM6teG/fBVY55HI1hvA5PqIrpc6qg9+H3Fa/7jsz4l91qyeRO5wb0kjxSZowK7sWzHcC1YfcGVCNkt/i3oftddWdvGxsYpfVgGKDt1KpOH3kKchDtmu38eTYPPqde/SRIaYg2TzuvB3c/jXmJGbxRwj8mJrNjTMtiTCOC13c6bjmA6gjlv2aJz2Em5qe4q4xvynceTbB2QvMRoYAj8WEKv+OxBw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(23010399003)(11063799006)(4143699003)(3023799007)(13003099007)(56012099006)(16102099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yA0X0msMqGitsq87SXFNIN8oePEZwmoxjBr1RxzMPSlVrA1uixKbTKWI7eO3jQFP2+BlKjhc5lWAZqUHi584Ms9slw1XWuuAQbft72nXjNW66+Ctw543YFMbtmOwr+beYi4OizV39RAYoSoa28DEcksbwoBAzGpCM0oMpLpPVNiF8S0jA8TQqfepfnzzcGIvrTBUf3G/botbgSa9cUqV6wn0QDUXXzd5Jzc1KB0I4HIVinw24LOOH1k12AMtbiVMpgE3Ge8eDGqBILCBX56+w8WklvjFilrietdq0oGaiOeS2FWElg7GAfJLgUFchOIw4290v67JuKtkw4Ap7Rzm54/aXCdktasEolyfmTQqg4GT9og20SiOBLEcaAH3nuW+iHvX+kfho8DH2nHpbV7s0s3lVQwa2rdrCL5a1Qn2PzoxtPO7Br6+AX3eAoXUQROd
X-Exchange-RoutingPolicyChecked:
	LP0o71yqj7tHYt1695kOhTrKf8zESm2a7mcQQLCy1p+Xbv3kigVzReBLTSubAabBzCCwmtZElrCg2mhH0+duUxRNYNdbScJ2KWOJShCySxRXsT0DzNaxi/bSsJdvT6brkT0YQMmVjEkGAr03+jBZbm1tLUYyp4DiYIZPhojJYxzrTUmKmTv5XeQm0A7vF5cru1RpQlRVaoGuA1JH7ghk0+7xImMv+g6I1MIZZ+dwYPwOdcy8R6rWlR39bfl575SieQbGJPfvy+5nYb5VVht95pbNKTtcSPlqlXApBzs5UkGtQEs3pclqzIvWaXwvSx26Cs/nIDHa1lEAQyqzGhQAoQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:03:50.6073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f4656c-257c-48bc-9d7f-08dee63dd111
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8965
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX9OIloMqcu3oF
 BVrW52Oe1H+HwWcYFxyFlVFqYo69nlolp+l1ORvoKmoNjH74c2wL0gnXS0bTYb+pb0gMOlyIrWQ
 BtakrfYkqmdg7fdqnWuk/ooaIDdDE2M=
X-Authority-Analysis: v=2.4 cv=f5l4wuyM c=1 sm=1 tr=0 ts=6a5de47b cx=c_pps
 a=z4sgpIVFmn7gf/JJ24wZvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=c92rfblmAAAA:8 a=jQSlpJarQq59TtaJQS0A:9
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfXy6Fddn5fC+DH
 P3sqBR0naMTbvwrRRjCZfDLlw2xLkY3JD83uEmLcpTsso5t2zzChncRWUC8oJno/AQg5bcHzCgK
 5amqCDXEwH55hQJdzNlw71IHO04cXZzhPOL+5dJhdKUwI1fxjmoPJBKGBqg75MP1YRlOYitgqmW
 HlM+wgVs3Xfx04jXZcMG9RU8JZQbd4rKtaaJNKIs9Z6ixUPd7dETH0Jzv5UhkuiElvKXN5kTtJk
 /dou34MKKTnldhaBJJEgT9wAYSgGJUzypioFd6tDjBS1s0qYO8Jv3hwLmUaiHW/+NxtBS/mjlAb
 ywlNMw0Pcz7aOOvxsQszV1aL4aTgFq12EXNz21A/suvVwL0UbFmJPaN3oyKfu9K7ctKeNNuaO3H
 V0R6DnmV+vPMKBYfK/5cq79YsZYx1uHMQvQY06vaHKqV1CZ6FN1sINO7MkRWDRZrcpILqmadUuO
 8qvA4+6ltk9Fg6NBlKw==
X-Proofpoint-ORIG-GUID: rUDjR7Md59Mugr0kYe9f04rt9SvMCLFd
X-Proofpoint-GUID: rUDjR7Md59Mugr0kYe9f04rt9SvMCLFd
X-Proofpoint-Spam-Reason: safe

On 07/07/2026 4:58 pm, Brian Masney wrote:
> Hi Richard,
> 
> Thanks for the patch.
> 
> On Tue, Jun 30, 2026 at 04:55:48PM +0100, Richard Fitzgerald wrote:
>> From: Paul Handrigan <paulha@opensource.cirrus.com>
>>
>> Add driver for the Cirrus Logic CS2600 fractional-N clock synthesizer
>> and multiplier.
>>

<SNIP>

>> +
>> +DEFINE_GUARD(cs2600_unfreeze, struct cs2600 *,
>> +	     cs2600_clear_freeze(_T), cs2600_set_freeze(_T))
> 
> Can you go through the Sashiko output for this series?

I sent an email responding to those, but it was reply-all to the Sashiko
bot email and I didn't notice that Sashiko had stripped a lot of the
original email recipients.

My responses to Sashiko are here:
https://lore.kernel.org/all/dc5a1c0c-8c6b-4f4b-90f1-e9c83a8b91b8@opensource.cirrus.com/


> https://sashiko.dev/#/message/20260630161121.020FB1F000E9%40smtp.kernel.org
> 
> The clear/set inverted looks questionable to me. If this is expected,
> then a comment clarifying why should be added.

I'll add a comment in the next version explaining the order.

> [snip]
> 
>> +static int cs2600_clk_register(struct cs2600 *cs2600)
>> +{
>> +	static const char *parent_names[2];
> 
> I wouldn't worry too about about Sashiko asking about multiple driver
> instances for this section, unless you think it will eventually be used
> in that way.

Trivial to fix though. That 'static' shouldn't be there.

>> +	const struct clk_hw *out_clocks_parent;
>> +	struct clk_init_data init[ARRAY_SIZE(cs2600->hw)] = { };
>> +	int ret, i, n, input_num = 0;
>> +	const char *names[ARRAY_SIZE(cs2600_clks)];
> 
> Reverse Christmas tree order.

Will do.

> I can do a more thorough review once you go through the Sashiko results.
> 
> Brian
> 

