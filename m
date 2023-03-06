Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BC4C61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 15:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjCFPum (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 10:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjCFPul (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 10:50:41 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA28327998
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 07:50:39 -0800 (PST)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N14xe-1qagZl2w0I-012WWt; Mon, 06 Mar 2023 16:50:19 +0100
Message-ID: <a1646cc8-0830-5add-2957-b9bdbb094b23@i2se.com>
Date:   Mon, 6 Mar 2023 16:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: imx6ul: Recent enet refclock changes breaks custom i.mx6ull board
Content-Language: en-US
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
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230306140207.GA11936@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FLUv7cjIn5jveb71t2XzbyWjVKFeytZDnhsXE+yf83Qwwu1nqzu
 qA5cVm2ouJ63meHUukgaXeHLVMuaWWz+Bzcw86cHuYKNWEM2bERyt/6jZMkiEqAvczy1coR
 3q+vqrQGMqt65+BXVyZxYXquvn7DGxFO8Dg51j0j1p7fQP9PlQ8hxfg02Vi2Bd8OwLGLiSw
 A5OV/GvvQlioHwRQkjhPw==
UI-OutboundReport: notjunk:1;M01:P0:13TQjyyw97M=;NAxZft78UCMdOwA+hkiRqfjs31H
 dcJivgbiIB65WZ6lx1GgrEGKCrsj7oVk7lIAOqKDPfFfRJ930Q7dv4Q8Y7AM2eWgMgx8Q2Ae8
 AI2W/tIHfwo29vEE9vY/4AogJFsMi7XWuP9BsJ6MRFid3HC8tctwB4vjKqHLfPz0Snl+oPgew
 Y2o8tc3P+g33RZuqpXQJVs6HWo4HGQh3CvEW+a8PE8btyL6AGxlWkOX7IXmAZoBNdGfY97uK8
 OZzW8+7uSgyRRwiu1usHvpmLoUF0YlPedXbzrsI6n0FsFuKga2sjrOY27aH8wnbvYDRfErM39
 pTjsLzF2xWLG7mSY4U22eFhMWPbK7kdOYpxIYV6JBv4qS4jaCfqFtx/DkL/vgu4v/n+N5aFBG
 t8oYKvmzAboi0nKiZ8xTUjYW1FTQEfT3z0COumMn3vD/BbQhv1o5jZX1MQ6alJao6F6lH8fUQ
 6TxKAVfQOHZT7XB3P3MFlkx9KuimK3RzZNV8NJR3egV57JfW9F7F9KOe6Hh8u+QNvLq7Ftj7q
 LNahgG1t/AMV2oPX75Ued3kXZcFDKHFWxo8X7SCzm+SodnzEihhpiyQ6dBj1PcKFafrLPxo+V
 fscPCqvmSMyM570kisWW4KhTX29iBldXiYsbRh6hWqq+BUDbB48k2Wv/UAqLzWlX2teT0U7hv
 4o9372A05Y7/y/4gq/VSFiyz3OEFIuOjqdELOpRVUw==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Oleksij,

Am 06.03.23 um 15:02 schrieb Oleksij Rempel:
> On Mon, Mar 06, 2023 at 02:33:24PM +0100, Stefan Wahren wrote:
>> Hi Oleksij,
>>
>> Am 06.03.23 um 10:47 schrieb Oleksij Rempel:
>>> On Mon, Mar 06, 2023 at 10:13:57AM +0100, Stefan Wahren wrote:
>>>> Hi Oleksij,
>>>>
>>>> Am 06.03.23 um 06:25 schrieb Oleksij Rempel:
>>>>> Hi Stefan,
>>>>>
>>>>> On Sun, Mar 05, 2023 at 11:16:17PM +0100, Stefan Wahren wrote:
>>>>>> Hi,
>>>>>>
>>>>>> we planned to submit our custom i.MX6ULL board [1] to mainline after release
>>>>>> of Linux 6.3-rc1, but the recent enet refclock changes breaks our Ethernet
>>>>>> phy:
>>>>>>
>>>>>> [    0.000000] imx:clk-gpr-mux: failed to get parent (-EINVAL)
>>>>>>
>>>>>> ...
>>>>>>
>>>>>> [   18.574595] SMSC LAN8710/LAN8720 2188000.ethernet-1:00: phy_poll_reset
>>>>>> failed: -110
>>>>>> [   18.581064] fec 2188000.ethernet eth0: Unable to connect to phy
>>>>>>
>>>>>> I narrow down the PHY issue to this first bad commit:
>>>>>>
>>>>>> 5f82bfced611 ("clk: imx6ul: fix enet1 gate configuration")
>>>>>>
>>>>>> The clock issues seems to be cause by the following commit. If i revert
>>>>>> 5f82bfced611 and 4e197ee880c24 or use Linux 6.2 everything is fine.
>>>>> It looks like in your kernel version are some missing patches. Can you please
>>>>> rebase your patches on top of this branch:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/log/?h=for-next
>>>> thanks for your fast reply. But i rebased my patches against Linux v6.3-rc1
>>>> since this was released yesterday and should contain all patches from Shawn.
>>> No, it is not. Related DTS changes are not included in to v6.3-rc1.
>> Sorry, i didn't noticed that Shawn already rebased his for-next changes on
>> top of v6.3-rc1.
>>
>> So, the problem is that your clk changes has been applied for 6.3, but the
>> necessary arm changes will land in 6.4? :-(
> I hope it will go as fixes to 6.3-rcX. Shawn?
>
>>>> I also changed the clockref in my DTSI file:
>>>>
>>>> https://github.com/chargebyte/linux/commits/v6.3-tarragon-v3
>>>>
>>>> Now the PHY issue disappeared and ethernet is working, but the
>>>>
>>>> imx:clk-gpr-mux: failed to get parent (-EINVAL)
>>> I need to take a look at it. It should not be critical.
>> I prepared a patch [1] to improve the debugging here:
>>
>> [    0.000000] Entry 262144 != val 0
>> [    0.000000] Entry 16384 != val 0
>> [    0.000000] imx:clk-gpr-mux: val 0, num_parents 2
>> [    0.000000] imx:clk-gpr-mux: failed to get parent of enet2_ref_sel
>> (-EINVAL)
>>
>> It seems that val 0 is unexpected for the driver. Maybe it's worth to
>> mention that we use an older U-Boot [2]. But Linux should make any
>> assumptions here.
> There are two configuration bits per Ethernet interface:
> - BIT(17) ENET1_TX_CLK_DIR
> - BIT(13) ENET1_CLK_SEL

Did you noticed that the error is caused for enet2_ref_sel?

On our board variants master/slave/slaveXT only ENET1 is used, so ENET2 
is kept to the defaults (ENET2_TX_CLK_DIR = 0, ENET2_CLK_SEL = 0) and 
the bootloader won't touch those bits.

> With this bits we have following variants:
> 1. internal clock source with output on ENET1_TX_CLK
> 2. internal clock source without output on ENET1_TX_CLK. Are there any
>     use cases need to support this mode?
After reading the reference manual, this mode refers to ENET1_TX_CLK_DIR 
= 0, ENET1_CLK_SEL = 0. Is my understanding correct?
> 3. external clock source without output on ENET1_TX_CLK
> 4. external clock source with output on ENET1_TX_CLK, well ENET1_TX_CLK
>     is input it can't be out put on this case.
>
> Current kernel supports modes 1 and 3. For mode 2 I do not have a use
> case and mode 4 make no sense.
>
> In your case, the boot loader configures clocks to mode 2 which is not
> correct for this HW. It should be mode 1.
As written above the bootloader doesn't touch this. It's the reset 
default according to the reference manual. So i consider mode 2 as 
disabled clock, which is the right mode for boards without using this 
particular Ethernet interface. For EMC reasons we don't want to enable 
ENET1 and ENET2 clock output unconditionally.
> Probably, the way to go is do register dummy parents for not supported
> modes. It would silent the kernel. Other ideas?

Sorry, i don't have no idea how to properly achieve this.

Best regards

>
>>> Can you please confirm it? Revert yourdtsi back to IMX6UL_CLK_ENET_REF
>>> and include [1]?
>> I rebased all changes on top of Shawn's branch and reverted to
>> IMX6UL_CLK_ENET_REF [3]. So yes, i confirm that Ethernet works in this case.
> Thx! So, there should be no regressions if this patch will to as fix for
> 6.3-rcX. Except of kernel warning wrong parent configuration.
>
> Regards,
> Oleksij
