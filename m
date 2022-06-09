Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53BEC43334
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jun 2022 12:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236158AbiFIMY4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jun 2022 08:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244894AbiFIMYy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jun 2022 08:24:54 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B573D636B;
        Thu,  9 Jun 2022 05:24:52 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2598K4FB014220;
        Thu, 9 Jun 2022 14:24:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VREcSesifFSN1yiZWIH0d5fpy/k7b0uyvIO+qFoqtBY=;
 b=RHJBYJiHJ75j97eFYaEavFkBhAWlnGlv3S0OnHpOwNVFyep7pIJSpVO7l7lUJYlj4yTQ
 PX1Nak/ZHzFmXOYA/SW0CmqeLjf1yuMghajkF+DsyOwF0PGTYdV+yaE6Dby9m0VWXS4h
 KFgsWhE/4iAqzLauQFUYSM28x+7j9bFaEq9dIEN6RGE7836G/5BYjJG/RcMpPM3hHYe7
 tTcM+ekEzarvlaYAelLqpERs4el6gOxI+sKd1s+/El4O8zcmUrP54v69zN2YSRjLo+SS
 ADcJr7FsUIRc1bN/cEj9OuNfiv4U8Bg79jeA1PFKYx0Cc91OnWzj46Ahl5kiAxRnsmsF pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gj3cu0ktq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jun 2022 14:24:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82E58100038;
        Thu,  9 Jun 2022 14:24:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72417217B65;
        Thu,  9 Jun 2022 14:24:19 +0200 (CEST)
Received: from [10.201.22.79] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 9 Jun
 2022 14:24:19 +0200
Message-ID: <030460c1-7563-baaa-7ac8-def75ee5ac74@foss.st.com>
Date:   Thu, 9 Jun 2022 14:24:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH -next] clk: stm32: rcc_reset: Fix missing spin_lock_init()
Content-Language: en-US
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     <linux-clk@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
References: <20220608021154.990347-1-weiyongjun1@huawei.com>
From:   Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20220608021154.990347-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_09,2022-06-09_01,2022-02-23_01
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Wei Yongjun,

Thank's,

you can add tested-by and reviewed-by Gabriel Fernandez 
<gabriel.fernandez@foss.st.com>

Best Regards

Gabriel Fernandez


On 6/8/22 04:11, Wei Yongjun wrote:
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
>
> Fixes: 637cee5ffc71 ("clk: stm32: Introduce STM32MP13 RCC drivers (Reset Clock Controller)")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/clk/stm32/reset-stm32.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/stm32/reset-stm32.c b/drivers/clk/stm32/reset-stm32.c
> index 040870130e4b..e89381528af9 100644
> --- a/drivers/clk/stm32/reset-stm32.c
> +++ b/drivers/clk/stm32/reset-stm32.c
> @@ -111,6 +111,7 @@ int stm32_rcc_reset_init(struct device *dev, const struct of_device_id *match,
>   	if (!reset_data)
>   		return -ENOMEM;
>   
> +	spin_lock_init(&reset_data->lock);
>   	reset_data->membase = base;
>   	reset_data->rcdev.owner = THIS_MODULE;
>   	reset_data->rcdev.ops = &stm32_reset_ops;
>
