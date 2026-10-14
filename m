Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazhn15010009.outbound.protection.outlook.com [52.102.161.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFE4F4D1B;
	Wed, 14 Oct 2026 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.161.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970748; cv=fail; b=ja6Q4Ei814nBkGXA0sElVujRdK1SITNi8Kct+ZOQxAa93KshnWVFp2NJXcOYq21YYvawxDU3chHQTfgxFYFq0LjEo61LprGNrBO4BnZe8YjEV6zn0gItf/WuOuCMsQQXb2IRu1rVBGcGwXcibwQrkAAV+jixRDV3fQw3S5Du6fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970748; c=relaxed/simple;
	bh=zjnQbJC+ymonYdIMPjWVX7ZZzUAJrAidznZEGAS+lcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hAdcLkR5SyeThNlzQ3NHnXScVcdjWEyCMc1bu8TxBNJqVJzpykPtk61aaEdi4Wr6GPxcPgiHwVONLiI0+CqjS44ys/5Vax5VLUfTJhgbrqIT4nK2Cf72ShdVbN2pv822Vl+o3Q1KWzb/QMch5i1IU+KozzjWToSluksL53zv9yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JnYICs1L; arc=fail smtp.client-ip=52.102.161.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JnYICs1L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUdTt4titaddqBVqrwYPa5QPi/FzeVVcHt6cMGNdae+hT+5ZeLHkzSz6TNKAKCNi3Sut4ymvnRfnGq8IjJIkrFMbZXTTrYyNB8dhkZT2DO6HP127DGQqt8U27FNEk1Ba6JOEhRYb3mJuPbuAgGkwB++I9hz7eCya/yjzPh3Kchnab0auzZJkfVUwCel8mioky0T8p/fxoGNlb0NzCWm6JqUXr9JfTAE9b6u7COP50LICU6fdfrmzvHzDJsf0hSgfBVCNBTSppYuOs9U3gotEgusP98Eu/IfCZnx/AaSLBrJ0RJ4SGVcaPsM9aip5ZfPcIPVQHSoLXhN6zE8vbRxBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=583Eau0el8ObjKBmmxFa4KzkKfDIxLiATIurJEgZ/HE=;
 b=LIdXXEYWaiiU/M7lEVC4POZLQvpZxdScfME4Dz6//WpMtav69iTPdIRxTbYqE/Z09gAFecylvVm/BUD1vVV8EGAarobU9zXTr2gC3rBtwhj1MnWzT23YDZi6bLCRLC1jlUKP6/3wiPcVDck45RsTXXdneffEILOqpr2IdGG40VQYGJzmVEpwRAZTrKPfPC9Sd60vwRI6I99bD6EeYfA/1hti/8K2N/LGWz3pfhvUWpaTU8TmZf8qIezxvei+9xOTJIDMOKjGbPi/4fw6nC6m8MtQBRwqeGdmBT8LOUywmsM/aytTaoYLpCrDJRNfa3NDmDbtdE372/Cg8JdemEkWPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=583Eau0el8ObjKBmmxFa4KzkKfDIxLiATIurJEgZ/HE=;
 b=JnYICs1LZqnfEfMMKEJGPb2rF8CPDcDgWca7NTuHBud7Na8md7BOcM5OvtR1VViQd4X8lJbhRKVcE14zXygE0p5UyPpx+XWZshAqPHosfe9cv4Ac6QGPtRCeIFEp3QZw8AcobfeKYJiR8BpK6HLnyeCOj1nuZuaRsVqcZH3FsGNb1Xonw7JxUvRW1sAi7+UiafQweyKM6iIz5z5xfLumN7jM2nPe9MdcR1G9c+nOFfAoP7rVxp42/ZMvAX7LnYVvHSSFv9WItXsNdHQ2m5Nhys17jOS3E5WYXoPR8tChZbmo4d1QQiMKIKAlPHr8O08WHzqYPd4TxSNCt/Ll0fphyA==
Received: from PA7P264CA0209.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36d::8)
 by AS2PR10MB7904.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:648::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 09:39:02 +0000
Received: from MAD0EPF000008BC.eurprd04.prod.outlook.com
 (2603:10a6:102:36d:cafe::9a) by PA7P264CA0209.outlook.office365.com
 (2603:10a6:102:36d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:39:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008BC.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 09:39:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 14 Oct
 2026 11:39:16 +0200
Received: from [10.48.87.14] (10.48.87.14) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 14 Oct
 2026 11:39:00 +0200
Message-ID: <4be10243-3937-4412-a8e2-92ea9fa098ff@foss.st.com>
Date: Wed, 14 Oct 2026 11:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: stm32: add support for reset_control_reset()
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261013-ups_reset_control_reset-v1-1-f8a6c7f6cc3c@foss.st.com>
 <f6ebd774c7e65410c70074c94eab966418d7ac9a.camel@pengutronix.de>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <f6ebd774c7e65410c70074c94eab966418d7ac9a.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BC:EE_|AS2PR10MB7904:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b66ea5c-5882-4402-c535-08df29d6fadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|34020700016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|4143699003|261009223027099003|56012099006|12100799066;
X-Microsoft-Antispam-Message-Info:
	b8FG/QIhlneMgNDdPlZcvge62PH3LMfAGFNt0HMAzbyejvjo4qCvY65oZq9rsV8qczCR6TL9PMZim8g6mOGvOBDNLuE2maga8kLJOUKEMCOHVt2BJIRTpIoHtU4hXvCN9YVZn29KponKyDCCzo3TDf4KwZSQSJTjUdXdoQXj/EvOzGT9AK1NY+cu/19IblBgr89LYKTl6OsHqQbH7/u1AQwwAqCIDHIgDO/7NIwFeOh3IMkYuvV6Q5d2tH+LBE1RqHjEnYKnydnSzwhonJIwWJka4ZTN2GoYvZkfc2uZJpjAEG6UERiW+fbyIJDHsu8EK+bgl1yuDBNmgaTOVHVwfRPAO5YdN+5AfqfAclR8QnVbOp59XHSuuiNoMqrrg8W5y9QRYUB4+oPsS6fc5ZksixH6bbVfbvRcCYuGx0ZGGGFp8X3AMpHmcE6SgLAVEhdj1ijysnn/YW/umQvp6HuYWgrrnM2XhsjVvEg1gSKFyH3PunxvAom3RlnuBEvr91agDE2J56k3mPYGwO5D6UeYX0Vjtttwef52qaeZCvGhlFzsLw7aylW3m15IRce4AeCu1b9nAnDBUE6RQZbse/ef7Nyrp5hglrLURTvHLpvKip+ZBF9vY3i7x1+eTTyHhSwrltjSuz4aRMQy4rAFbkutUoY/39+BqqxMfaXe8gDqI4u4He/MeqEWe+QVq8i8a7BgTFoPVYvC5j+Q/vr7hqYxyw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(34020700016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(261009223027099003)(56012099006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T0XAaeFV8+LMWJ51KQho6+Uqv7cv72RF33t3tT0ku3VduNfzrR52zk0cGeYpZ5dwWan5gxq/127iKOnn+3ZOsLzMOMOCvMNr+yf1B/BoLp0fScgbmG0NPd5odyKmIw9yecbu1f0bNRsOiOzDlhWIA14KONbZ1ZcIxmoXMrMBQQj95726anBi+PE7eWhf/YRp1fODoU5XKWQt8uZczEUymDk4e9HKAkXL82V+PtMYVJMehB8xtE0+CqlXtpZgfoVxvHG7mv6c3YE6lmACiLssHBRPCiUOTMULWdOpMC7HbVxYm6U6s1d3FX/TeSLS4uGuXhfyrst6fSsstcuPoqzwJermC0r7+OYlPBvnSe/CsA1YBT/9jHbh2yl67tb1G1BRt6xuh0aqjJdM6x2sNNy1wnTHBN5e9ZtVlZK0MRkuWH+jDP19CsAcS9Nlf9kFZeyK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:39:01.7208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b66ea5c-5882-4402-c535-08df29d6fadb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7904

Hi Philipp,

Thanks for the review.

On 10/13/26 17:38, Philipp Zabel wrote:
> On Di, 2026-10-13 at 16:52 +0200, Gabriel Fernandez wrote:
>> The STM32 RCC reset controller currently implements only .assert(),
>> .deassert(), and .status().
>> As a result, reset_control_reset() returns -ENOTSUPP, forcing consumers
>> to open-code the assert / delay / deassert sequence.
> Do you have specific consumer drivers in mind?
Yes. stm32-dma3 calls reset_control_reset() at probe time and the

STM32MP25 hantro glue (stm32mp25_venc_reset()) does as well. Today both

get -ENOTSUPP from the RCC, so the reset is silently skipped.


>
>> Implement .reset() to provide the standard reset operation and avoid
>> duplicating this logic in consumers.
> The (documented) purpose of the .reset callback is to allow handling
> self-deasserting resets, not convenience. I try pushing back on
> unnecessary .reset implementations in reset controller drivers.
>
> There are a few drivers with direct level control that implement .reset
> like this, but those are mostly for the benefit of consumer drivers
> that can be paired with different reset controllers, some of which are
> self-deasserting.

OK, I see. We do have some IPs, such as the GPU, that use a self-deasserting

reset. The corresponding driver has not been upstreamed yet.



>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> ---
>>   drivers/clk/stm32/reset-stm32.c | 45 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>
>> diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
>> index fc237fccae68..9b853417e9c5 100644
>> --- a/drivers/clk/stm32/reset-stm32.c
>> +++ b/drivers/clk/stm32/reset-stm32.c
>> @@ -4,6 +4,8 @@
>>    * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
>>    */
>>   
>> +#include <linux/delay.h>
>> +#include <linux/iopoll.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>> @@ -13,6 +15,13 @@
>>   
>>   #include "reset-stm32.h"
>>   
>> +/* Hold time between reset assertion and deassertion */
>> +#define STM32_RESET_ASSERT_DELAY_US		2
> Is this delay enough for all possible consumers, on all platforms that
> reset-stm32 supports?

Yes, you are right. Even if 2 us should cover a good part of the IPs,

I'll re-checkagainst STM32MP13/MP15/MP25 and use a conservative value in v2.

>
>> +
>> +/* Polling of the reset status bit after deassertion */
>> +#define STM32_RESET_DEASSERT_POLL_US		10
>> +#define STM32_RESET_DEASSERT_TIMEOUT_US		(10 * USEC_PER_MSEC)
>> +
>>   struct stm32_reset_data {
>>   	/* reset lock */
>>   	spinlock_t			lock;
>> @@ -119,9 +128,45 @@ static int stm32_reset_status(struct reset_controller_dev *rcdev,
>>   	return !!(reg & BIT(ptr_line->bit_idx));
>>   }
>>   
>> +static int stm32_check_deassert(struct reset_controller_dev *rcdev,
>> +				unsigned long id)
>> +{
>> +	struct stm32_reset_data *data = to_stm32_reset_data(rcdev);
>> +	struct stm32_reset_cfg line_reset;
>> +	const struct stm32_reset_cfg *ptr_line;
>> +	u32 reg;
>> +
>> +	ptr_line = stm32_get_reset_line(rcdev, id, &line_reset);
>> +	if (!ptr_line)
>> +		return -EPERM;
>> +
>> +	return readl_poll_timeout(data->membase + ptr_line->offset, reg,
>> +				  !(reg & BIT(ptr_line->bit_idx)),
>> +				  STM32_RESET_DEASSERT_POLL_US,
>> +				  STM32_RESET_DEASSERT_TIMEOUT_US);
>> +}
>> +
>> +static int stm32_reset(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	int ret;
>> +
>> +	ret = stm32_reset_assert(rcdev, id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fsleep(STM32_RESET_ASSERT_DELAY_US);
>> +
>> +	ret = stm32_reset_deassert(rcdev, id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return stm32_check_deassert(rcdev, id);
> If polling is necessary after deassertion, doesn't this be have to be
> moved into stm32_reset_deassert()?
Right, waiting for the line to be released is part of deassert, not of

reset. I'll move it there in v2.

Best regards,

Gabriel


> regards
> Philipp
