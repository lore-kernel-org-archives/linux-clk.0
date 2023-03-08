Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6852EC678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 15:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjCHPLs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 10:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbjCHPLi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 10:11:38 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CFFCB658
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 07:11:30 -0800 (PST)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MVubb-1q1jCu2EDN-00RsKD; Wed, 08 Mar 2023 16:11:05 +0100
Message-ID: <e13c83f7-cb74-4353-9243-3ecd70be0fbf@i2se.com>
Date:   Wed, 8 Mar 2023 16:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: imx6ul: Recent enet refclock changes breaks custom i.mx6ull board
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
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230307060628.GC11936@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Gsvg3rlDRaNmK3+wFDMMSdcl7AhSV1i3kwm3q7Zi3MDO+4zlGYz
 XI3fExCr+8i3xbjD3eHcwKhluR8tNWAHPLqN+x7HgYAheZhxlzcKK5WxTAxdzizhm9nUS7d
 0ZD1SpKy2Uw9le2c1OkvsKKEV5zo7l/C4OKgCraXGxcfVDXZEXb7WiAsp4e6998nSUybaem
 zzdBt06N87GrELDLo9eWg==
UI-OutboundReport: notjunk:1;M01:P0:aP+0FELXgf4=;2yUOlnCEqjlVP1hh9Lv4t0XWgt4
 lVq1u3TiA8DDDPcmGPbdhUa9MkJH/w3D8SdN6wsHsNrFfDANPbxWYk3KYcmLQ7aXc0R959Hos
 Srurz11iaE9VsPCmZslPnOVZaKOtMasmdsvGlnX+ULJOCjXP19Pyo7l4h4tdFw+VlSjkQ9nUB
 dwcUPf6jqeDCnWqEI+NiK86bbyjscWOXdwDGQTB96J8DKTdzOUtuF959iKzUaiC8JTKMpk3r5
 rFS7h0/g0WGGkDSSqsdyzyrwEwY5LlUxaWoj5HOdNI1afk9kBTFuupo7RTh11oN4EQsljCd4x
 pwLrmEK0aj1nhdFQWVNij+IXoW2NLi3VcRYJff27QMf5aXu17RZxhDK9wWtp3QbXy6q8+6Wfh
 yponJ5uPuWpeu+G9XI72d1l6S3MkxhRvMj9/XMCEYMjsGVFHzlMjJ6yoWf4LC/i/QHN3igbiw
 2cYnJGL59KXWZmBX9clWKu8ZR6LcfmjSqA6/Q/bwwmU1wnzpMG04p5vZbTz2l1wLsDdTsIQ0D
 xI7UeiOteSsBE8mKvtadqPhuk0Qzk3RBd0lAgUKmALW1IkbUsM+4de/SGkZYNSHXtdk5CzYX+
 NPr+lYpfqat7oRDYjOQOEwEY6jMEGnjoWAt8syG8Bw0axjEE+KCHSf3Qd4pbhsxZLkb17a+yi
 yQIVzB2UxlinlrYG89RQklbWhFYF3CSbKNJwLT0JEg==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Oleksij,

Am 07.03.23 um 07:06 schrieb Oleksij Rempel:
> Hi Stefan,
>
> On Mon, Mar 06, 2023 at 04:50:18PM +0100, Stefan Wahren wrote:
>> Did you noticed that the error is caused for enet2_ref_sel?
>>
>> On our board variants master/slave/slaveXT only ENET1 is used, so ENET2 is
>> kept to the defaults (ENET2_TX_CLK_DIR = 0, ENET2_CLK_SEL = 0) and the
>> bootloader won't touch those bits.
> Ok, i see. It makes sense.
>
>>> With this bits we have following variants:
>>> 1. internal clock source with output on ENET1_TX_CLK
>>> 2. internal clock source without output on ENET1_TX_CLK. Are there any
>>>      use cases need to support this mode?
>> After reading the reference manual, this mode refers to ENET1_TX_CLK_DIR =
>> 0, ENET1_CLK_SEL = 0. Is my understanding correct?
>>> 3. external clock source without output on ENET1_TX_CLK
>>> 4. external clock source with output on ENET1_TX_CLK, well ENET1_TX_CLK
>>>      is input it can't be out put on this case.
>>>
>>> Current kernel supports modes 1 and 3. For mode 2 I do not have a use
>>> case and mode 4 make no sense.
>>>
>>> In your case, the boot loader configures clocks to mode 2 which is not
>>> correct for this HW. It should be mode 1.
>> As written above the bootloader doesn't touch this. It's the reset default
>> according to the reference manual. So i consider mode 2 as disabled clock,
>> which is the right mode for boards without using this particular Ethernet
>> interface. For EMC reasons we don't want to enable ENET1 and ENET2 clock
>> output unconditionally.
>>> Probably, the way to go is do register dummy parents for not supported
>>> modes. It would silent the kernel. Other ideas?
>> Sorry, i don't have no idea how to properly achieve this.
> can you please test this patch:
>
> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> index 2836adb817b7..e3696a88b5a3 100644
> --- a/drivers/clk/imx/clk-imx6ul.c
> +++ b/drivers/clk/imx/clk-imx6ul.c
> @@ -95,14 +95,16 @@ static const struct clk_div_table video_div_table[] = {
>   	{ }
>   };
>   
> -static const char * enet1_ref_sels[] = { "enet1_ref_125m", "enet1_ref_pad", };
> +static const char * enet1_ref_sels[] = { "enet1_ref_125m", "enet1_ref_pad", "dummy", "dummy"};
>   static const u32 enet1_ref_sels_table[] = { IMX6UL_GPR1_ENET1_TX_CLK_DIR,
> -					    IMX6UL_GPR1_ENET1_CLK_SEL };
> +					    IMX6UL_GPR1_ENET1_CLK_SEL, 0,
> +					    IMX6UL_GPR1_ENET1_TX_CLK_DIR | IMX6UL_GPR1_ENET1_CLK_SEL };
>   static const u32 enet1_ref_sels_table_mask = IMX6UL_GPR1_ENET1_TX_CLK_DIR |
>   					     IMX6UL_GPR1_ENET1_CLK_SEL;
> -static const char * enet2_ref_sels[] = { "enet2_ref_125m", "enet2_ref_pad", };
> +static const char * enet2_ref_sels[] = { "enet2_ref_125m", "enet2_ref_pad", "dummy", "dummy"};
>   static const u32 enet2_ref_sels_table[] = { IMX6UL_GPR1_ENET2_TX_CLK_DIR,
> -					    IMX6UL_GPR1_ENET2_CLK_SEL };
> +					    IMX6UL_GPR1_ENET2_CLK_SEL, 0,
> +					    IMX6UL_GPR1_ENET2_TX_CLK_DIR | IMX6UL_GPR1_ENET2_CLK_SEL };
>   static const u32 enet2_ref_sels_table_mask = IMX6UL_GPR1_ENET2_TX_CLK_DIR |
>   					     IMX6UL_GPR1_ENET2_CLK_SEL;

i successful tested this patch on top of Shawn's for-next branch. The 
error message went away.

Just 2 ideas for a proper patch:

- short explaining comment in clk-imx6ul about the dummies

- instead of "dummy" for both interfaces, i suggest something like 
"enet1_ref_dummy" which makes investigation at 
/sys/kernel/debug/clk/clk_summary easier

Thanks
Stefan

>   
> Regards,
> Oleksij
