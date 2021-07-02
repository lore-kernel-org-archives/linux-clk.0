Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB44EC11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 14:12:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD2516142E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 14:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhGBOPC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 10:15:02 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46438 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232834AbhGBOPC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 10:15:02 -0400
Received: from [151.57.67.62] (port=43386 helo=[192.168.1.114])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lzJu9-0007i4-0z; Fri, 02 Jul 2021 16:12:29 +0200
Subject: Re: [PATCH v4 3/3] clk: vc5: Add properties for configuring SD/OE
 behavior
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>
References: <20210701182012.3421679-1-sean.anderson@seco.com>
 <20210701182012.3421679-3-sean.anderson@seco.com>
 <CAMuHMdWJc_b=3jAnsG_uXjzP-GT9L3YrB=vWO8G1dnQOeiBMRg@mail.gmail.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2786fbf7-e993-b7bb-e3c7-6cdf540cdf1a@lucaceresoli.net>
Date:   Fri, 2 Jul 2021 16:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWJc_b=3jAnsG_uXjzP-GT9L3YrB=vWO8G1dnQOeiBMRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On 02/07/21 09:29, Geert Uytterhoeven wrote:
>  Hi Sean,
> 
> On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
>> The SD/OE pin may be configured to enable output when high or low, and
>> to shutdown the device when high. This behavior is controller by the SH
>> and SP bits of the Primary Source and Shutdown Register (and to a lesser
>> extent the OS and OE bits). By default, both bits are 0 (unless set by
>> OTP memory), but they may need to be configured differently, depending
>> on the external circuitry controlling the SD/OE pin.
>>
>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/clk-versaclock5.c
>> +++ b/drivers/clk/clk-versaclock5.c
>> @@ -886,6 +886,8 @@ static const struct of_device_id clk_vc5_of_match[];
>>
>>  static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>  {
>> +       bool oe_high, oe_low, sh_enable, sh_disable;
>> +       unsigned int sp_mask, sh_mask, sp_val, sh_val;
>>         struct vc5_driver_data *vc5;
>>         struct clk_init_data init;
>>         const char *parent_names[2];
>> @@ -913,6 +915,25 @@ static int vc5_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>                 return dev_err_probe(&client->dev, PTR_ERR(vc5->regmap),
>>                                      "failed to allocate register map\n");
>>
>> +       oe_high = of_property_read_bool(client->dev.of_node,
>> +                                       "idt,output-enable-active-high");
>> +       oe_low = of_property_read_bool(client->dev.of_node,
>> +                                       "idt,output-enable-active-low");
>> +       sh_enable = of_property_read_bool(client->dev.of_node,
>> +                                         "idt,enable-shutdown");
>> +       sh_disable = of_property_read_bool(client->dev.of_node,
>> +                                          "idt,disable-shutdown");
>> +       if ((oe_high && oe_low) || (sh_enable && sh_disable))
>> +               return dev_err_probe(&client->dev, -EINVAL,
>> +                                    "conflicting properties for SD/OE pin\n");
>> +
>> +       sp_mask = (oe_high || oe_low) ? VC5_PRIM_SRC_SHDN_SP : 0;
>> +       sh_mask = (sh_enable || sh_disable) ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
>> +       sp_val = oe_high ? VC5_PRIM_SRC_SHDN_SP : 0;
>> +       sh_val = sh_enable ? VC5_PRIM_SRC_SHDN_EN_GBL_SHDN : 0;
> 
> I'm not so fond of ternary operators where one branch uses zero, so
> I would write this (with pre-initialization of mask/val to zero):
> 
>     if (oe_high || oe_low)
>             mask |= VC5_PRIM_SRC_SHDN_SP;
>     if (oe_high)
>             val |= VC5_PRIM_SRC_SHDN_SP;
> 
> which also has the benefit you need only one mask and val.
> But that's purely my personal preference.

Both styles are fine for me, so with either version:

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
