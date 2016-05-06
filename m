Return-Path: <dianders@google.com>
MIME-Version: 1.0
In-Reply-To: <4828628.D4nfByUg7D@diego>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de>
	<572B4AF8.6070509@collabora.com>
	<4828628.D4nfByUg7D@diego>
Date: Thu, 5 May 2016 17:46:59 -0700
Message-ID: <CAD=FV=XFGHqB8RY1TwMBPds_kLjjxwMHiAAf-Mnzf6NCOvVCHg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] clk: attempt to keep requested rate on parent changes
From: Doug Anderson <dianders@google.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Xing Zheng <zhengxing@rock-chips.com>,
	zhangqing <zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Thu, May 5, 2016 at 8:07 AM, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>> Besides that, do you know already if it would solve the conflicts
>> described by Doug in the thread below?
>>
>> http://thread.gmane.org/gmane.linux.kernel/1820653/focus=3D3298
>
> I think the big issue on the rk3288 is, who is actually in charge of
> controlling the npll frequency.
>
> On the rk3399 the vpll is supplied unmodified to the hdmiphy, while as a
> dclk_vop source it goes through a divider first. So it's pretty clear tha=
t the
> hdmiphy will control the core frequency while other users need to adapt t=
o
> what they get.
>
> On the rk3288 the npll is a possible source to both the hdmi- as well as =
the
> edp-clock (and some others as well), so when it gets adapted dynamically,=
 wo
> is going to be in charge and who needs to adapt ... and how do we set thi=
s
> hierarchy.

Yeah, I don't think it fully solves the rk3288 problem, though
probably you'd end up in a better shape than today.

Specifically:

1. It assumes that the last requester of the rate is the one who gets
to specify it.  That's fine in the master-slave relationship that
Heiko describes for rk3399, but not so great for the peer-peer
relationship of NPLL uses on rk3288.  Said another way: on rk3399 it's
clear that HDMI decides the rate and the VOP has to deal with it, but
on rk3288 you've got two equals both wanting their own rate.

2. It's unclear exactly how well the different users of the VOP would
be able to cope with arbitrary rate changes since it really depends on
what's connected on the other end.


In general it seems like the rule for two peers should be that the
first requester should keep its rate and the 2nd requester should just
have to deal with it, unless the first requester added special code to
validate that the new rate was OK.

-Doug
