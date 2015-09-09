Return-Path: <romain.perier@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgxDo+0qN5GJdCNpQi4g_CdW67PvxsogMseRoAa5cuAbWk1wQ@mail.gmail.com>
References: <1440322357-2621-1-git-send-email-romain.perier@gmail.com>
	<CABgxDo+otZrYoqTNK-ea=L6Dsd5p_b_MFCi4H4XJZZ25PV_qnA@mail.gmail.com>
	<CABgxDoLgqfzO-Sb_rKHe=-GuMaKWMihHhktx6sDSM6M=Q+Koaw@mail.gmail.com>
	<20150904162402.GN15099@codeaurora.org>
	<CABgxDo+0qN5GJdCNpQi4g_CdW67PvxsogMseRoAa5cuAbWk1wQ@mail.gmail.com>
Date: Wed, 9 Sep 2015 19:58:48 +0200
Message-ID: <CABgxDoJRdF_k0EZLrEWXqpDrmj5LVRL24izGLJY4AmtUNOk7PQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rockchip: Add pclk_peri to critical clocks on RK3066/RK3188
From: Romain Perier <romain.perier@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

so, which of you does take the patch for -rc1 ?

Regards,
Romain

2015-09-05 18:12 GMT+02:00 Romain Perier <romain.perier@gmail.com>:
> Np,
>
> Yes it would be nice to take it for -rc1, because I think that 4.3
> won't boot without this fix
>
>
> Regards,
> Romain
>
> 2015-09-04 18:24 GMT+02:00 Stephen Boyd <sboyd@codeaurora.org>:
>> On 09/04, Romain Perier wrote:
>>> Hi all,
>>>
>>> just a reminder, I sent this patch two weeks ago, rk3xxx-based
>>> platforms still need it, it fixes a freeze during boot.
>>
>> Sorry I thought that Linus W was going to pick this up? If not,
>> we can take it through clk tree as a fix for -rc1.
>>
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
>> a Linux Foundation Collaborative Project
