Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D666EC678D4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 13:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjCFNjJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 08:39:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCFNjH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 08:39:07 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38D624CA7
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 05:39:05 -0800 (PST)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M9qYn-1pcDlx3J3d-005s3b; Mon, 06 Mar 2023 14:33:24 +0100
Message-ID: <953ee705-47a7-3f6b-408e-9d74f3bc30b4@i2se.com>
Date:   Mon, 6 Mar 2023 14:33:24 +0100
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
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230306094737.GA11506@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0W3sw1z7hR7zMY3nDxSeNqFIQs/DI1wASwfPSs9FgxoOG7qbZfL
 j4d0HAxGmqAw4os11f1Z5uvSYHLM7XpV96dnliRXZ0cpX2aY/RdXPwbxsBX7JAxbeeWcrvX
 GiyCkbSOBJ/mXM83HKQ2DY8x8aJLFDaB27G91YExh8rTdtNch9mUOoK6re1uLyN+3u5J7QD
 /UKbtKA3uK1l1OT8pZhxg==
UI-OutboundReport: notjunk:1;M01:P0:QB0qtwZxuLA=;PFWn/ffXLmW4UUXCQtLlhCZ0QJ2
 UWB1iSYaxjknR3bWPiZFL3ugo+M1VTikEKdsAPKk5Y0KGuGmlGQ31vN/EvBRP4iS/NTdyjA/U
 /VNkVfuCdwC9Sq7y7YEvs0DgfBjAFnF7NUZrVqMJnicChAr74y0J9/UPcjoycFwkZ36OGlVh5
 /owvU+pbzd/ncVyAzXszz7KNi5Cp0I76mBL47Ty4CX69KQiEc4OqrhvEraJZrPsV/yVSlhb1k
 MjUjxoCtsq4QxToH9fNAdZWTIBDsShlJPDNfdFIt6Q6b2gItn/vnb29h3BwILXgviQ4XOO67k
 B2s7uF3QjrSIBjTgOscRNKPBcl9AG1PmLhh/7yC+b6hLKiqmemTtE151Iqw5BTggFfKAz7l8q
 TK3xdl8LeonhoANX11jLHYH4R6wf9QTHLLFHUZuzCi6f5H85mrtMeR98L2HuNn6W+zFuo0I2u
 SYKkwoN9/ry5N9deVACdOaffQjQZDgL+7XBm9avHfciMa42FkIAIe4RX3x37C47fGSfzzr1+G
 AGv1+HV5oUPepKf7ayUh80Vg47dBFPz8vqoIdJbkU/tXjXXhsDhDDT8M+mPouQF/agh88RKDF
 VQIEYpkW9n3Dt/I/TUSnxj8tztxdVHfDKuuo35IpbeggMprUgSFwkPdWZUOv55LLGosQPjvwJ
 lNr+8Y/5pENPZd5RLO5TbHrnmghm1JosXQ8EDCRiFw==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Oleksij,

Am 06.03.23 um 10:47 schrieb Oleksij Rempel:
> On Mon, Mar 06, 2023 at 10:13:57AM +0100, Stefan Wahren wrote:
>> Hi Oleksij,
>>
>> Am 06.03.23 um 06:25 schrieb Oleksij Rempel:
>>> Hi Stefan,
>>>
>>> On Sun, Mar 05, 2023 at 11:16:17PM +0100, Stefan Wahren wrote:
>>>> Hi,
>>>>
>>>> we planned to submit our custom i.MX6ULL board [1] to mainline after release
>>>> of Linux 6.3-rc1, but the recent enet refclock changes breaks our Ethernet
>>>> phy:
>>>>
>>>> [    0.000000] imx:clk-gpr-mux: failed to get parent (-EINVAL)
>>>>
>>>> ...
>>>>
>>>> [   18.574595] SMSC LAN8710/LAN8720 2188000.ethernet-1:00: phy_poll_reset
>>>> failed: -110
>>>> [   18.581064] fec 2188000.ethernet eth0: Unable to connect to phy
>>>>
>>>> I narrow down the PHY issue to this first bad commit:
>>>>
>>>> 5f82bfced611 ("clk: imx6ul: fix enet1 gate configuration")
>>>>
>>>> The clock issues seems to be cause by the following commit. If i revert
>>>> 5f82bfced611 and 4e197ee880c24 or use Linux 6.2 everything is fine.
>>> It looks like in your kernel version are some missing patches. Can you please
>>> rebase your patches on top of this branch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/log/?h=for-next
>> thanks for your fast reply. But i rebased my patches against Linux v6.3-rc1
>> since this was released yesterday and should contain all patches from Shawn.
> No, it is not. Related DTS changes are not included in to v6.3-rc1.

Sorry, i didn't noticed that Shawn already rebased his for-next changes 
on top of v6.3-rc1.

So, the problem is that your clk changes has been applied for 6.3, but 
the necessary arm changes will land in 6.4? :-(

>
>> I also changed the clockref in my DTSI file:
>>
>> https://github.com/chargebyte/linux/commits/v6.3-tarragon-v3
>>
>> Now the PHY issue disappeared and ethernet is working, but the
>>
>> imx:clk-gpr-mux: failed to get parent (-EINVAL)
> I need to take a look at it. It should not be critical.

I prepared a patch [1] to improve the debugging here:

[    0.000000] Entry 262144 != val 0
[    0.000000] Entry 16384 != val 0
[    0.000000] imx:clk-gpr-mux: val 0, num_parents 2
[    0.000000] imx:clk-gpr-mux: failed to get parent of enet2_ref_sel 
(-EINVAL)

It seems that val 0 is unexpected for the driver. Maybe it's worth to 
mention that we use an older U-Boot [2]. But Linux should make any 
assumptions here.

>
>> is still there.
>>
>>> and please rename IMX6UL_CLK_ENET_REF to IMX6UL_CLK_ENET1_REF_SEL in
>>> your dtsi.
>> Yes, this seems to be the issue in my case.
>>
>> Does this mean a Linux 6.3 kernel doesn't work with a i.MX6ULL Linux 6.2
>> devicetree?
> If I see it correctly. Since you do not have patch [1] related clock is not
> enabled by the fec controller. Since this PHY is not addressable without
> running rmii clock, the PHY can't be probed.
>
>> So there is no fallback?
> With [1] it should not be needed.
Maybe this patch comes too late (Linux 6.4) for some boards.
>
>> What about these other dtsi in Linux 6.3rc-1?
>>
>> $ grep IMX6UL_CLK_ENET_REF *
>> imx6ul-14x14-evk.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
>> ..
>> imx6ul-kontron-bl-common.dtsi:            clocks = <&clks
>> IMX6UL_CLK_ENET_REF>;
>> imx6ul-kontron-sl-common.dtsi:            clocks = <&clks
>> IMX6UL_CLK_ENET_REF>;
>> imx6ull-dhcom-picoitx.dts:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
>> imx6ull-dhcom-som.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
>> imx6ull-jozacp.dts:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
>> imx6ull-myir-mys-6ulx.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
>> imx6ul-phytec-phycore-som.dtsi:            clocks = <&clks
>> IMX6UL_CLK_ENET_REF>;
>> mba6ulx.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
> It is nice to convert all of them to proper clock. But all of them are
> expected to work with [1].
>
> Can you please confirm it? Revert yourdtsi back to IMX6UL_CLK_ENET_REF
> and include [1]?

I rebased all changes on top of Shawn's branch and reverted to 
IMX6UL_CLK_ENET_REF [3]. So yes, i confirm that Ethernet works in this case.

Best regards

[1] - 
https://github.com/chargebyte/linux/commit/74a883d3ca4960a7d178d4a184daf9856600ca14
[2] - https://github.com/chargebyte/U-Boot/tree/v2020.04-in-tech
[3] - https://github.com/chargebyte/linux/tree/v6.4-shawnguo-tarragon

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?h=for-next&id=8940c105273fcde00a60023f68f8a5b75e1df0cc
>
> Regards,
> Oleksij
