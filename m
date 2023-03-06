Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDCCC678D4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 09:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjCFJOc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 04:14:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjCFJOW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 04:14:22 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A647921A2D
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 01:14:19 -0800 (PST)
Received: from [192.168.1.141] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Macf4-1qAuRY07A2-00c624; Mon, 06 Mar 2023 10:13:58 +0100
Message-ID: <8a178040-ef52-d9ab-e704-69208d34f915@i2se.com>
Date:   Mon, 6 Mar 2023 10:13:57 +0100
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
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230306052531.GA30081@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v6UMNjBJ1FGTsQz/a26W/FdNJtKJ8IXY5AuqEDRKbsvujIhB55H
 5aBoHMdDl/zNzGX7R5NMrDIHUG8cYpj9deXWvzMEc4uKPNQYuCBpQmXYxxA2x33mxOHK3jq
 BQu4fndHKVrOy4eVzqA2uUuT+wSaKi4sUdQ+i+afOh0722UA/xTGJpdKWhJWcjWV6JZp+Vo
 3vvGUZ/QvOyqGshWkQ26A==
UI-OutboundReport: notjunk:1;M01:P0:XzQJOGQx7iA=;El/u2yAirY5ZayMwiyKgTFhuUL6
 Pi/wk1tPOPPhUhPeAu34aD1pYMLXvjMDs4+7MHwqNR+4VfW0GRIRax99Wg5jfpOjBocBAvUNS
 pgBBBQQWCEEjsVPt8FOTm4Og+tI62/UhokKdMWzKZzSUaybSx98VSFhmICD+BnH+2ks6Knegx
 gJWpa7bD6EdufNDPbNqMA3Zn4zYjXp6M6X9lZb83ROS//CBfYXqPW1wYtEzZfvj62ZvcSvY9G
 zCDM1yFEIykO6oyiTB9xPLL8gIwo0q9hA6cUbTu9PhSk35K5WMOjoeQCrQAMO1VucULEw9w3G
 UeXnuLSiYBqDk0Gt/twlkHlIn9QK8NAyUd9jU8SNj9VCI3bvEp4jfcqIlMTcbsAZoeBhYsH7z
 J/50tUwkvSU8TGZcYYU5x+NKIExo2lfzBc9WZqmHZDyDAFDX8lR0hKCufoHTT9H+w/IMhTOtI
 orXC9+8xVNbITrYyYdPN7nSRTMkCLa93892GIZkxX08RZFr3G0miW3UXUKZ0tHSstYUUxZF79
 GsTU5FfLQStmf+RUB0TSGViqBFYUgx2T8ZPw1Y3oiVUgpJjkeu6tdVYi3DWze3h3xNpxA2efL
 ow1zB23WqlEkOCTKqAoamPH1p/rOh1EuOQD59dq9jtuaJKenhbtV5qOdZq6P7ryLRh9549T5V
 DfxQ1wkgfpZ04YUWs5uErrPx0zuACSJYPY+m+kHwig==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Oleksij,

Am 06.03.23 um 06:25 schrieb Oleksij Rempel:
> Hi Stefan,
>
> On Sun, Mar 05, 2023 at 11:16:17PM +0100, Stefan Wahren wrote:
>> Hi,
>>
>> we planned to submit our custom i.MX6ULL board [1] to mainline after release
>> of Linux 6.3-rc1, but the recent enet refclock changes breaks our Ethernet
>> phy:
>>
>> [    0.000000] imx:clk-gpr-mux: failed to get parent (-EINVAL)
>>
>> ...
>>
>> [   18.574595] SMSC LAN8710/LAN8720 2188000.ethernet-1:00: phy_poll_reset
>> failed: -110
>> [   18.581064] fec 2188000.ethernet eth0: Unable to connect to phy
>>
>> I narrow down the PHY issue to this first bad commit:
>>
>> 5f82bfced611 ("clk: imx6ul: fix enet1 gate configuration")
>>
>> The clock issues seems to be cause by the following commit. If i revert
>> 5f82bfced611 and 4e197ee880c24 or use Linux 6.2 everything is fine.
> It looks like in your kernel version are some missing patches. Can you please
> rebase your patches on top of this branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/log/?h=for-next

thanks for your fast reply. But i rebased my patches against Linux 
v6.3-rc1 since this was released yesterday and should contain all 
patches from Shawn. I also changed the clockref in my DTSI file:

https://github.com/chargebyte/linux/commits/v6.3-tarragon-v3

Now the PHY issue disappeared and ethernet is working, but the

imx:clk-gpr-mux: failed to get parent (-EINVAL)

is still there.

> and please rename IMX6UL_CLK_ENET_REF to IMX6UL_CLK_ENET1_REF_SEL in
> your dtsi.

Yes, this seems to be the issue in my case.

Does this mean a Linux 6.3 kernel doesn't work with a i.MX6ULL Linux 6.2 
devicetree?
So there is no fallback?

What about these other dtsi in Linux 6.3rc-1?

$ grep IMX6UL_CLK_ENET_REF *
imx6ul-14x14-evk.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
..
imx6ul-kontron-bl-common.dtsi:            clocks = <&clks 
IMX6UL_CLK_ENET_REF>;
imx6ul-kontron-sl-common.dtsi:            clocks = <&clks 
IMX6UL_CLK_ENET_REF>;
imx6ull-dhcom-picoitx.dts:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
imx6ull-dhcom-som.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
imx6ull-jozacp.dts:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
imx6ull-myir-mys-6ulx.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;
imx6ul-phytec-phycore-som.dtsi:            clocks = <&clks 
IMX6UL_CLK_ENET_REF>;
mba6ulx.dtsi:            clocks = <&clks IMX6UL_CLK_ENET_REF>;

>
> Regards,
> Oleksij
