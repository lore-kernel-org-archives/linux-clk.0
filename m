Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047A2C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 12:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiDHMUH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 08:20:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiDHMUG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 08:20:06 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F581E5328
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 05:18:00 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220408121757euoutp0298e61e24ead98eae9a121384f8ed8c50~j6wDClV0k1186511865euoutp02l
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 12:17:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220408121757euoutp0298e61e24ead98eae9a121384f8ed8c50~j6wDClV0k1186511865euoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1649420277;
        bh=KNoDlojck1BbleDfchKOzn4aT5+3lTjBp0fNGhYr1Xk=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=KQrHPN7dWEa+qZ3jpFt2I1PR6e44k2jE+1Xz71datNBPhqof1nxh8byD9Qsi38eui
         p1pLub/3RBS9Sq9AgfitcrU6FNPVTtbDbOqorJeP+EemQxvjmNeoh+aiO7hPJGUoVJ
         b556Cw7eqCyaQ6e44Mf+TF3tbZQ0Mwt7sAXUPO08=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20220408121756eucas1p157b309beeea50ba9c4a5fd080bd4cf5b~j6wCkIzPJ3057230572eucas1p1U;
        Fri,  8 Apr 2022 12:17:56 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CE.7B.09887.4F720526; Fri,  8
        Apr 2022 13:17:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220408121755eucas1p15a867f100b29640db83bc5488c51e597~j6wBrIN_g0935009350eucas1p1D;
        Fri,  8 Apr 2022 12:17:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220408121755eusmtrp2cb043273c9311c13962564be0006ef10~j6wBqNEMS3126231262eusmtrp20;
        Fri,  8 Apr 2022 12:17:55 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-14-625027f4fc9c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FE.6F.09522.3F720526; Fri,  8
        Apr 2022 13:17:55 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220408121754eusmtip21daeb804de70a22ccda89729765c6d18~j6wBIapz_0592305923eusmtip2v;
        Fri,  8 Apr 2022 12:17:54 +0000 (GMT)
Message-ID: <351cfb4a-7457-d4e1-8317-9ebf2a3167f8@samsung.com>
Date:   Fri, 8 Apr 2022 14:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7djP87pf1AOSDKYfF7d4PWUtk8WbR0eY
        LT723GO1mPHjH6PFxVOuFrc+8Vsc6ou2+HdtI4vF/iteFlfXTWR34PL49nUSi8f7G63sHnfO
        nWfzeDHhH5PHplWdbB53ru1h8+hp28Tk8XmTXABHFJdNSmpOZllqkb5dAlfGpoMbWAu+ilfs
        +d3A2MD4RqiLkZNDQsBEontLBxOILSSwglHi+8K8LkYuIPsLo0TjnptsEM5nRomlx94zwnTs
        XDwDKrGcUWLxpKMsEM5HRoktZ/cCZTg4eAXsJG5sMwFpYBFQkfhw4wo7iM0rIChxcuYTFhBb
        VCBJYvX21WDlwgJeEiu+WICEmQXEJW49mc8EMlJEYCujxJr2J+wgDrPAXUaJK48ngDWzCRhK
        dL3tYgOxOQWsJXY+WcQG0S0vsf3tHGaQBgmBbk6JlvfzWUE2SAi4SEzelAPxgbDEq+Nb2CFs
        GYn/O0G2gZTkS/ydYQwRrpC49noNM4RtLXHn3C+wO5kFNCXW79KHCDtKtB+axwzRySdx460g
        xAF8EpO2TYcK80p0tEHDWU1i1vF1cDsPXrjEPIFRaRZSmMxC8vwsJK/MQti7gJFlFaN4amlx
        bnpqsVFearlecWJucWleul5yfu4mRmDCOv3v+JcdjMtffdQ7xMjEwXiIUYKDWUmEtyrXJ0mI
        NyWxsiq1KD++qDQntfgQozQHi5I4b3LmhkQhgfTEktTs1NSC1CKYLBMHp1QDk4ig/Mvo630e
        0z8kFTllnc/le73nyIEYvwln6rNd3A2rOPek8371fPFfSMDTUv7g5rsT4l8bn2+yuc13V0FI
        ZJPxxr2pjD/rdu1eW/NGZ/GUH8d6SnzWC2xo77KzSAmeN89y18Hip1N83A3++v38tHY2w0/P
        kzUT67glOx4d4JC8pK56k9vjywsNr+SS0OCq/VztT87pztpyiP/y572dHzuuRMw4fW9PUMYG
        kTWBdi/feJptzV4jYpKfsE7twx71Pb2yLxw+/ln0ZKpqGFfBjRXrLt3eMknkIff3GyeU6/9G
        KX7J3Vm4dOuUk59nV+z9m/grKDiTVdPy3adNG//aL/i/9MkGz298lw+tZ5wcnl+rxFKckWio
        xVxUnAgAf3hY9scDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xe7qf1QOSDDZsl7V4PWUtk8WbR0eY
        LT723GO1mPHjH6PFxVOuFrc+8Vsc6ou2+HdtI4vF/iteFlfXTWR34PL49nUSi8f7G63sHnfO
        nWfzeDHhH5PHplWdbB53ru1h8+hp28Tk8XmTXABHlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
        kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GpoMbWAu+ilfs+d3A2MD4RqiLkZNDQsBEYufi
        GWxdjFwcQgJLGSXWnznCCpGQkTg5rQHKFpb4c60Lqug9o8TUDwsZuxg5OHgF7CRubDMBqWER
        UJH4cOMKO4jNKyAocXLmExYQW1QgSeJSVztYubCAl8SKLxYgYWYBcYlbT+YzgYwUEdjKKHG6
        cQsriMMscJ9R4uG96YwQy94ySsx93MQM0sImYCjR9RbkCk4OTgFriZ1PFrFBjDKT6NraxQhh
        y0tsfzuHeQKj0Cwkh8xCsnEWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIzV
        bcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4q3J9koR4UxIrq1KL8uOLSnNSiw8xmgJDYyKzlGhy
        PjBZ5JXEG5oZmBqamFkamFqaGSuJ83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MO0xmPv0f2uZ
        WIdP+o5VH8TFE7PNTu/K3rNQfZrg+U/lyoL/HKXd/n51yH54LDSS//6ExLr39pbrbmtfVFfX
        v35glx+/3pKZ3eV+Lf1vb+3Z21yi/Pfpb824sGC9R2ZVVtOemoaeOjrdVcDYsXiV38dVBuz/
        Lvp07NHj13g2ZYHox2eb2qv+B8zzY1IwyBIxE27W6RRuuxrmq+L8zEYuhpvR65zvCgmnciVV
        BhPnB98e7WyT1d3tavby9sL/jGmznvoIVsUUyPAIzZo/pUJiS7bGjKBpPzZMf1Pck/nw43lx
        1qnVqS+3eVkHeX9+qpDhmRJm9l5onkiU857l7+8sPtYatF9fbuHylrd1D/IZlFiKMxINtZiL
        ihMB32g9pF4DAAA=
X-CMS-MailID: 20220408121755eucas1p15a867f100b29640db83bc5488c51e597
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925
References: <20220408091037.2041955-1-maxime@cerno.tech>
        <20220408091037.2041955-23-maxime@cerno.tech>
        <CGME20220408093618eucas1p27b1e9b34a7439020b052f18dcc178925@eucas1p2.samsung.com>
        <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi All,

On 08.04.2022 11:18, Jerome Brunet wrote:
> On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
>
>> A rate of 0 for a clock is considered an error, as evidenced by the
>> documentation of clk_get_rate() and the code of clk_get_rate() and
>> clk_core_get_rate_nolock().
>>
>> The main source of that error is if the clock is supposed to have a
>> parent but is orphan at the moment of the call. This is likely to be
>> transient and solved later in the life of the system as more clocks are
>> registered.
>>
>> The corollary is thus that if a clock is not an orphan, has a parent that
>> has a rate (so is not an orphan itself either) but returns a rate of 0,
>> something is wrong in the driver. Let's return an error in such a case.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>>   drivers/clk/clk.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 8bbb6adeeead..e8c55678da85 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
>>   		rate = 0;
>>   	core->rate = core->req_rate = rate;
>>   
>> +	/*
>> +	 * If we're not an orphan clock and our parent has a rate, then
>> +	 * if our rate is 0, something is badly broken in recalc_rate.
>> +	 */
>> +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
>> +		ret = -EINVAL;
>> +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
>> +		goto out;
>> +	}
>> +
> As hinted in the cover letter, I don't really agree with that.
>
> There are situations where we can't compute the rate. Getting invalid
> value in the register is one reason.
>
> You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - all
> SoCs would be affected):
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/meson/clk-pll.c#n82
> Yes, PLL that have not been previously used (by the ROMCode or the
> bootloader) tend to have the value of the divider set to 0 which in
> invalid as it would result in a division by zero.
>
> I don't think this is a bug. It is just what the HW is, an unlocked,
> uninitialized PLL. There is no problem here and the PLL can remain like
> that until it is needed.
>
> IMO, whenever possible we should not put default values in the clocks
> which is why I chose to leave it like that.
>
> The PLL being unlocked, it has no rate. It is not set to have any rate.
> IMO a returning a rate of 0 is valid here.

I agree that it should be possible to register so called unconfigured 
clock, which doesn't have any rate set yet. It might be used later by 
some drivers, which will do the whole initialization (set rate and or 
parents). I also wonder why the above patch triggers warning on the 
Amlogic Socs, while on Exynos I still have some unused clocks with 0 
rate registered properly.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

