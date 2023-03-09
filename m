Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA78CC64EC4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Mar 2023 17:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjCIRJ0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Mar 2023 12:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjCIRJE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Mar 2023 12:09:04 -0500
X-Greylist: delayed 80339 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 09 Mar 2023 09:05:44 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0307125AE
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 09:05:44 -0800 (PST)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M5fQq-1pbxWB2bVK-007Dqj; Thu, 09 Mar 2023 17:59:49 +0100
Message-ID: <6235dd03-ba27-08b9-369b-64dc31f74de4@i2se.com>
Date:   Thu, 9 Mar 2023 17:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: imx6ul: Recent enet refclock changes breaks custom i.mx6ull board
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michael Heimpold <mhei@heimpold.de>,
        Arnd Bergmann <arnd@arndb.de>
References: <3ceda169-de1b-2c1f-9ee8-bc8fdb547433@i2se.com>
 <20230306052531.GA30081@pengutronix.de>
 <8a178040-ef52-d9ab-e704-69208d34f915@i2se.com>
 <20230306094737.GA11506@pengutronix.de>
 <953ee705-47a7-3f6b-408e-9d74f3bc30b4@i2se.com>
 <20230306140207.GA11936@pengutronix.de>
 <a1646cc8-0830-5add-2957-b9bdbb094b23@i2se.com>
 <20230307060628.GC11936@pengutronix.de>
 <e13c83f7-cb74-4353-9243-3ecd70be0fbf@i2se.com>
Content-Language: en-US
In-Reply-To: <e13c83f7-cb74-4353-9243-3ecd70be0fbf@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:W19JukOS9nJ4Y12aiexOk7jVEu1pInsLs0KCTOsSbaq5n1NKBvK
 PNTCi+9XUAT6/jiy52eKygQFw3j8wVU3I4NFvalc+FPR8uGVvB0bAb8FpXC2vN48N3GjB3p
 1gCAsROgefJ4BecvIMqvGLmhTvkY546LgjHPlAptCrsCfYb+GaO/9WkesjLuWWhqiTvuUb2
 4c/GcyvzfmgjkBGev2zcg==
UI-OutboundReport: notjunk:1;M01:P0:rh+6+ZHCvf0=;I2eDvHuEDeUJ2aSJcgld2QQnGTW
 70nQBxj4G5k174wrf1xGWZJWJHzF7XE9q+4VSiNX69BOXarTaFbjOCg0fL7lVp+0hRJ3EvgL6
 xHP8Lsk8MOvZG7i2aGhlFUCBl9xfzlanblWoo1/QW9BhxnYmyc8c11FKOhtXauhx4PCNoPmfT
 W4+wwfydR3qBluVgLcyrqK4N4IiObtB+2WEqe2Jd8gEyOGcCph2WCPNXTo1iEHt8E0iIyFXT1
 2WjBKwq87VNyhJEDKeDc4hJk+X5b4PYO9X/0xlLXOBYo1WqF9yBioPqTwTHvdxx6PLNREa6m4
 SGFokiwSt8qA6mXWo0cDmF4aHGekdlR/oASq3/GqXSAhHqDdfJ2fyHnCCJlKoDty4dZK6N/sf
 mNVW5Zvi3H0P+LdLucFarBIbbT++EcI5D5bx94fX2pMlr3z7vSuKDsAvmitzXHx13fOu/YCct
 t982tfq416waqrvX47KcvMKaSPcpTVwcIOxyCqBbky4oZh2hNWHwgd5f/1aDaNxPG2rp+vF5M
 Eg6ZY+QmyCoh9quK6gtNonXm9slJLl6lxbVILtpWY4tHWL0Id/x++wBxvw+VHfQXJWkPJhQ2G
 yKvivdKjc0ckicCBDgh88f88cPPPJ3g0tP4jRrQHOIVFxqrR1Rn9CL3AEMSIYYepkV9PVEOty
 e/uAfishQbaQvlBZ8B+as2DNAchjfMH39kqgS85gDA==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am 08.03.23 um 16:11 schrieb Stefan Wahren:
> Hi Oleksij,
>
> Am 07.03.23 um 07:06 schrieb Oleksij Rempel:
>> Hi Stefan,
>>
>> On Mon, Mar 06, 2023 at 04:50:18PM +0100, Stefan Wahren wrote:
>>> Did you noticed that the error is caused for enet2_ref_sel?
>>>
>>> On our board variants master/slave/slaveXT only ENET1 is used, so 
>>> ENET2 is
>>> kept to the defaults (ENET2_TX_CLK_DIR = 0, ENET2_CLK_SEL = 0) and the
>>> bootloader won't touch those bits.
>> Ok, i see. It makes sense.
>>
>>>> With this bits we have following variants:
>>>> 1. internal clock source with output on ENET1_TX_CLK
>>>> 2. internal clock source without output on ENET1_TX_CLK. Are there any
>>>>      use cases need to support this mode?
>>> After reading the reference manual, this mode refers to 
>>> ENET1_TX_CLK_DIR =
>>> 0, ENET1_CLK_SEL = 0. Is my understanding correct?
>>>> 3. external clock source without output on ENET1_TX_CLK
>>>> 4. external clock source with output on ENET1_TX_CLK, well 
>>>> ENET1_TX_CLK
>>>>      is input it can't be out put on this case.
>>>>
>>>> Current kernel supports modes 1 and 3. For mode 2 I do not have a use
>>>> case and mode 4 make no sense.
>>>>
>>>> In your case, the boot loader configures clocks to mode 2 which is not
>>>> correct for this HW. It should be mode 1.
>>> As written above the bootloader doesn't touch this. It's the reset 
>>> default
>>> according to the reference manual. So i consider mode 2 as disabled 
>>> clock,
>>> which is the right mode for boards without using this particular 
>>> Ethernet
>>> interface. For EMC reasons we don't want to enable ENET1 and ENET2 
>>> clock
>>> output unconditionally.
>>>> Probably, the way to go is do register dummy parents for not supported
>>>> modes. It would silent the kernel. Other ideas?
>>> Sorry, i don't have no idea how to properly achieve this.
>> can you please test this patch:
>>
>> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
>> index 2836adb817b7..e3696a88b5a3 100644
>> --- a/drivers/clk/imx/clk-imx6ul.c
>> +++ b/drivers/clk/imx/clk-imx6ul.c
>> @@ -95,14 +95,16 @@ static const struct clk_div_table 
>> video_div_table[] = {
>>       { }
>>   };
>>   -static const char * enet1_ref_sels[] = { "enet1_ref_125m", 
>> "enet1_ref_pad", };
>> +static const char * enet1_ref_sels[] = { "enet1_ref_125m", 
>> "enet1_ref_pad", "dummy", "dummy"};
>>   static const u32 enet1_ref_sels_table[] = { 
>> IMX6UL_GPR1_ENET1_TX_CLK_DIR,
>> -                        IMX6UL_GPR1_ENET1_CLK_SEL };
>> +                        IMX6UL_GPR1_ENET1_CLK_SEL, 0,
>> +                        IMX6UL_GPR1_ENET1_TX_CLK_DIR | 
>> IMX6UL_GPR1_ENET1_CLK_SEL };
>>   static const u32 enet1_ref_sels_table_mask = 
>> IMX6UL_GPR1_ENET1_TX_CLK_DIR |
>>                            IMX6UL_GPR1_ENET1_CLK_SEL;
>> -static const char * enet2_ref_sels[] = { "enet2_ref_125m", 
>> "enet2_ref_pad", };
>> +static const char * enet2_ref_sels[] = { "enet2_ref_125m", 
>> "enet2_ref_pad", "dummy", "dummy"};
>>   static const u32 enet2_ref_sels_table[] = { 
>> IMX6UL_GPR1_ENET2_TX_CLK_DIR,
>> -                        IMX6UL_GPR1_ENET2_CLK_SEL };
>> +                        IMX6UL_GPR1_ENET2_CLK_SEL, 0,
>> +                        IMX6UL_GPR1_ENET2_TX_CLK_DIR | 
>> IMX6UL_GPR1_ENET2_CLK_SEL };
>>   static const u32 enet2_ref_sels_table_mask = 
>> IMX6UL_GPR1_ENET2_TX_CLK_DIR |
>>                            IMX6UL_GPR1_ENET2_CLK_SEL;
>
> i successful tested this patch on top of Shawn's for-next branch. The 
> error message went away.
>
> Just 2 ideas for a proper patch:
>
> - short explaining comment in clk-imx6ul about the dummies
>
> - instead of "dummy" for both interfaces, i suggest something like 
> "enet1_ref_dummy" which makes investigation at 
> /sys/kernel/debug/clk/clk_summary easier
please ignore the second point, because all the other clocks already 
uses "dummy"
> Thanks
> Stefan
>
>>   Regards,
>> Oleksij
