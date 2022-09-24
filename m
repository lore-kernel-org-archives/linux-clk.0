Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1251C07E9D
	for <linux-clk@archiver.kernel.org>; Sat, 24 Sep 2022 16:46:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbiIXQqs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Sep 2022 12:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiIXQqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Sep 2022 12:46:46 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014893A157
        for <linux-clk@vger.kernel.org>; Sat, 24 Sep 2022 09:46:45 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 17DEC849CD;
        Sat, 24 Sep 2022 18:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664038003;
        bh=teo+KzI3HLk8FzoTd+Zx1xys+qs6Vls7e2QmHmSIvWc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ka2y/USke5a4a8wb/bYwVOzsIdcKVBhMGXZUcmqmfE21TZG6xjO8ez16yIf0/cbai
         ya+hcygvQDEu5NsLZ2Xrbst/Y9Q/oIN5E+qoWd0fz3EklbxUmU9SWcAh0pvn4HAG7U
         zV0+W/EKA7/94eUb9KTrS9VYSpQy31G4Jh+yQdn+O4aiO59hPqPjy2lOcrpKivARnF
         OvTSV+YfRPxv3HlLKwhzwTEGWV8OK+biowBeCBDN5XRj2Z80Fx1jwnJ8SpzmL9lZ0A
         5b2aUVRxp+NExorxDngExvcx0DwncPWIxdQjy5NN8SGJmDWRPMzZMFvVDuSrIu1A/4
         J23MPnhIPcR8A==
Message-ID: <841e78ae-3ca0-af8f-d5ae-af4ec5d682e8@denx.de>
Date:   Sat, 24 Sep 2022 18:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] clk: rs9: Fix I2C accessors
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
References: <20220910232015.216329-1-marex@denx.de>
 <12053354.O9o76ZdvQC@steina-w>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <12053354.O9o76ZdvQC@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 9/12/22 08:46, Alexander Stein wrote:

Hi,

[...]

>> +static int rs9_regmap_i2c_read(void *context,
>> +			       unsigned int reg, unsigned int *val)
>> +{
>> +	struct i2c_client *i2c = context;
>> +	struct i2c_msg xfer[2];
>> +	u8 data[2];
>> +	int ret;
>> +
>> +	xfer[0].addr = i2c->addr;
>> +	xfer[0].flags = 0;
>> +	xfer[0].len = 1;
>> +	xfer[0].buf = (void *)&reg;
> 
> This does work only for little-endian machines, right?

Ah, right, fixed in V2.

>> +	xfer[1].addr = i2c->addr;
>> +	xfer[1].flags = I2C_M_RD | I2C_M_RECV_LEN;
>> +	xfer[1].len = 1;
>> +	xfer[1].buf = (void *)data;
>> +
>> +	ret = i2c_transfer(i2c->adapter, xfer, 2);
>> +	if (ret == 2)
>> +		return 0;
> 
> You are missing setting 'val' here.

Fixed in V2

>> +	else if (ret < 0)
>> +		return ret;
>> +	else
>> +		return -EIO;
>> +}
>> +
>>   static const struct regmap_config rs9_regmap_config = {
>>   	.reg_bits = 8,
>>   	.val_bits = 8,
>> @@ -97,6 +140,8 @@ static const struct regmap_config rs9_regmap_config = {
>>   	.max_register = 0x8,
>>   	.rd_table = &rs9_readable_table,
>>   	.wr_table = &rs9_writeable_table,
>> +	.reg_write = rs9_regmap_i2c_write,
>> +	.reg_read = rs9_regmap_i2c_read,
>>   };
>>
>>   static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx)
>> @@ -242,11 +287,17 @@ static int rs9_probe(struct i2c_client *client)
>>   			return ret;
>>   	}
>>
>> -	rs9->regmap = devm_regmap_init_i2c(client, &rs9_regmap_config);
>> +	rs9->regmap = devm_regmap_init(&client->dev, NULL,
>> +				       client,
> &rs9_regmap_config);
>>   	if (IS_ERR(rs9->regmap))
>>   		return dev_err_probe(&client->dev, PTR_ERR(rs9->regmap),
>>   				     "Failed to allocate register
> map\n");
>>
>> +	/* Always read back 1 Byte via I2C */
>> +	ret = regmap_write(rs9->regmap, RS9_REG_BCP, 1);
>> +	if (ret < 0)
>> +		return ret;
>> +
>>   	/* Register clock */
>>   	for (i = 0; i < rs9->chip_info->num_clks; i++) {
>>   		snprintf(name, 5, "DIF%d", i);
> 
> 
> For some reason this doesn't work with cache being enabled. No idea why this
> happens though.

What does this part mean , what does not work with which cache being 
enabled ?
