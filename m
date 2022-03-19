Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A481C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 08:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242514AbiCSI3G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 04:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242508AbiCSI3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 04:29:05 -0400
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 69A0927CE37
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=0xAiT
        SqefcTWjP029Zs0dHVgqEFNTR7V4yu5qOTzPEM=; b=BFor+vmApdXWNHGAJzj89
        J+ISLq0SrhNXwNsk0wAREUdcwms5Ea2uO1dM/7pZnpTZA2IER8Xy/EDi41plk+eB
        RgwYC8xwEdi/RR4BbWufZRIGHIfdN625aVuDquYQUi5EdMVNTx+Mlhg9K6LGWNFD
        fjElJ9KqPq0vWREtnqZYNE=
Received: from [192.168.31.30] (unknown [59.39.244.74])
        by smtp9 (Coremail) with SMTP id DcCowADHM6PdkzVizMY0Bw--.14648S2;
        Sat, 19 Mar 2022 16:27:09 +0800 (CST)
Message-ID: <38393b5d-e2ed-4964-ecfe-398875c4bba1@163.com>
Date:   Sat, 19 Mar 2022 16:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] clk: bcm: rpi: Fix slab-out-of-bounds during
 raspberrypi_discover_clocks.
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, nsaenz@kernel.org,
        f.fainelli@gmail.com, linux-clk@vger.kernel.org
References: <20220312154244.557841-1-logic_wei@163.com>
 <20220318151603.d2ru63w4iydprjjv@houat>
From:   Peng Wei <logic_wei@163.com>
In-Reply-To: <20220318151603.d2ru63w4iydprjjv@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: DcCowADHM6PdkzVizMY0Bw--.14648S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur47Jry7Gw4kCFy5Gw4rKrg_yoW5Gr47pF
        W8ta45CFyjqr40ga1aq3Wq9F1F93yavFW8Wr1xZ3WSvayUGF95tFW8Krn3Ar95Wr4kK3Z3
        tFW5Aa98uF1UXFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07USNtsUUUUU=
X-Originating-IP: [59.39.244.74]
X-CM-SenderInfo: 5orjxupbzhxqqrwthudrp/1tbiJwDIul5vA6o25wAAsc
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2022/3/18 23:16, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Mar 12, 2022 at 11:42:44PM +0800, logic_wei@163.com wrote:
>> From: Peng Wei <logic_wei@163.com>
>>
>> There's no way to break the loop until any error is returned. It causes
>> overflow bug when accessing the clks.
>>
>> The KASAN warning:
>>
>> BUG: KASAN: slab-out-of-bounds in raspberrypi_clk_probe+0x1d8/0x2f8
>>
>> Read of size 4 at addr ffffff8040bd8704 by task swapper/0/1
>>
>> Call trace:
>>   ...
>>   __asan_load4+0x94/0xd0
>>   raspberrypi_clk_probe+0x1d8/0x2f8
>>   platform_probe+0x94/0x110
>>   ...
>>
>> v2:
>>   - Improve the comments
>>   - Change to for loop
>>   - Add fixes tag
>>   - Remove the modification about enum rpi_firmware_clk_id
>>
>> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
>> Signed-off-by: Peng Wei <logic_wei@163.com>
>> ---
>>   drivers/clk/bcm/clk-raspberrypi.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
>> index dd3b71eafabf..5f963254d4eb 100644
>> --- a/drivers/clk/bcm/clk-raspberrypi.c
>> +++ b/drivers/clk/bcm/clk-raspberrypi.c
>> @@ -250,6 +250,7 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
>>   {
>>   	struct rpi_firmware_get_clocks_response *clks;
>>   	int ret;
>> +	int i;
>>   
>>   	clks = devm_kcalloc(rpi->dev,
>>   			    sizeof(*clks), RPI_FIRMWARE_NUM_CLK_ID,
>> @@ -263,26 +264,25 @@ static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
>>   	if (ret)
>>   		return ret;
>>   
>> -	while (clks->id) {
This line triggers the KASAN warning.
>> +	for (i = 0; i < RPI_FIRMWARE_NUM_CLK_ID; i++) {
>>   		struct clk_hw *hw;
>>   
>> -		switch (clks->id) {
>> +		switch (clks[i].id) {
>>   		case RPI_FIRMWARE_ARM_CLK_ID:
>>   		case RPI_FIRMWARE_CORE_CLK_ID:
>>   		case RPI_FIRMWARE_M2MC_CLK_ID:
>>   		case RPI_FIRMWARE_V3D_CLK_ID:
>>   		case RPI_FIRMWARE_PIXEL_BVB_CLK_ID:
>> -			hw = raspberrypi_clk_register(rpi, clks->parent,
>> -						      clks->id);
>> +			hw = raspberrypi_clk_register(rpi, clks[i].parent,
>> +						      clks[i].id);
>>   			if (IS_ERR(hw))
>>   				return PTR_ERR(hw);
>>   
>> -			data->hws[clks->id] = hw;
>> -			data->num = clks->id + 1;
>> +			data->hws[clks[i].id] = hw;
>> +			data->num = clks[i].id + 1;
>>   			fallthrough;
> 
> This will conflict with:
> https://lore.kernel.org/linux-clk/20220316083741.5hvuli2cvxlqr2ji@houat/T/#m3fc26816f7de420d74e4aa853eb92017b0b28fff
> 
> which should also fix the out-of-bound access?
> 
> maxime
Yes it is.

