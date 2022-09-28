Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D98C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 12:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232196AbiI1M7f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 08:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbiI1M7L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 08:59:11 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A3C9E8BB
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 05:59:09 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F400284A20;
        Wed, 28 Sep 2022 14:59:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664369948;
        bh=KraFiIK61vIp7P0/srM/pwO0PGMcXc7fDi85Ar1H3qw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lvf59BRqtuRlUwliAch2Xmhu3ZKCKdad01Q9s/ixYA/+CjaD0JfmMb1q2J1vs+Vj9
         LviwbtD4fyB2Slg8k8aCuozWn15Z7zXfHI8P+bgqeg38arv1nguGkYDv1dLwAqeHqm
         b1jvCyJGwAlt37ESjd8dY1i1d/JKzZIF3YAcoA7GCfEFwK3VugJZNj/VZyWVDQVyWK
         0jrzB3Z197KBaA357ObPXmSUzZGZCAjcWj3Oy/NzUVM3cXIIjkHZhtCOnhB1rpV9CE
         OhEBuHOl2FKhjc4UOqNJRAb5rLpdU3foxg0Cx+TXhreADhl8B/af+Vz8O477UrmuHa
         Lz0hYypvnUBjw==
Message-ID: <bb942700-af09-e510-8b56-236a6ec8e43c@denx.de>
Date:   Wed, 28 Sep 2022 14:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] clk: rs9: Fix I2C accessors
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220927214415.418140-1-marex@denx.de>
 <3198374.44csPzL39Z@steina-w>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <3198374.44csPzL39Z@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/28/22 09:35, Alexander Stein wrote:
> Hi Marek,

Hi,

> thanks for the update.

Thanks for the reviews.

> Am Dienstag, 27. September 2022, 23:44:14 CEST schrieb Marek Vasut:
>> Add custom I2C accessors to this driver, since the regular I2C regmap ones
>> do not generate the exact I2C transfers required by the chip. On I2C write,
>> it is mandatory to send transfer length first, on read the chip returns the
>> transfer length in first byte. Instead of always reading back 8 bytes, which
>> is the default and also the size of the entire register file, set BCP
>> register to 1 to read out 1 byte which is less wasteful.
>>
>> Fixes: 892e0ddea1aa6 ("clk: rs9: Add Renesas 9-series PCIe clock generator
>> driver") Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> V2: Fix endianness handling in rs9_regmap_i2c_read() i2c_transfer
>> V3: - Disable regcache, the driver does a couple of I2C writes on boot
>>        and that is all, so it only adds complexity
>>      - Set regmap max_register to RS9_REG_BCP which is the correct one
>> ---
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@kernel.org>
>> ---
>>   drivers/clk/clk-renesas-pcie.c | 60 ++++++++++++++++++++++++++++++++--
>>   1 file changed, 57 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
>> index 4f5df1fc74b46..138aaab05fc8a 100644
>> --- a/drivers/clk/clk-renesas-pcie.c
>> +++ b/drivers/clk/clk-renesas-pcie.c
>> @@ -90,13 +90,61 @@ static const struct regmap_access_table
>> rs9_writeable_table = { .n_yes_ranges = ARRAY_SIZE(rs9_writeable_ranges),
>>   };
>>
>> +static int rs9_regmap_i2c_write(void *context,
>> +				unsigned int reg, unsigned int
> val)
>> +{
>> +	struct i2c_client *i2c = context;
>> +	const u8 data[3] = { reg, 1, val };
>> +	const int count = ARRAY_SIZE(data);
>> +	int ret;
>> +
>> +	ret = i2c_master_send(i2c, data, count);
>> +	if (ret == count)
>> +		return 0;
>> +	else if (ret < 0)
>> +		return ret;
>> +	else
>> +		return -EIO;
>> +}
>> +
>> +static int rs9_regmap_i2c_read(void *context,
>> +			       unsigned int reg, unsigned int *val)
>> +{
>> +	struct i2c_client *i2c = context;
>> +	struct i2c_msg xfer[2];
>> +	u8 txdata = reg;
>> +	u8 rxdata[2];
>> +	int ret;
>> +
>> +	xfer[0].addr = i2c->addr;
>> +	xfer[0].flags = 0;
>> +	xfer[0].len = 1;
>> +	xfer[0].buf = (void *)&txdata;
>> +
>> +	xfer[1].addr = i2c->addr;
>> +	xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
>> +	xfer[1].len = 1;
> 
> I'm still in favor of removing I2C_M_RECV_LEN and setting len=2. This
> currently works only, because there is no read access between
> devm_regmap_init() call and regmap_write() to RS9_REG_BCP.
> Enabling cache later on again this will corrupt the stack.

The device does send you the amount of data in first byte of I2C READ, 
so I think I2C_M_RECV_LEN is the right flag here.

I had a look into the above topic too before sending V3, and I think you 
can use regcache_cache_bypass(..., true) right after devm_regmap_init() 
and then again regcache_cache_bypass(..., false) close to the end of 
probe() callback to deal with the problem you're describing.

Would that work ?
