Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <0261c4b4-7398-fe15-5e26-f92bfbe79f3c@rock-chips.com>
References: <1463076197-15900-1-git-send-email-dianders@chromium.org>
	<1463076197-15900-2-git-send-email-dianders@chromium.org>
	<20160512231023.GA63308@google.com>
	<84673e7c-dd64-b2ca-5c7c-5c7f34d239d8@rock-chips.com>
	<CAD=FV=WEAOwhDDBHBtuzSz35i0XRZw4LbFEnFCFYd-4NVH5d-g@mail.gmail.com>
	<0261c4b4-7398-fe15-5e26-f92bfbe79f3c@rock-chips.com>
Date: Fri, 13 May 2016 09:38:16 -0700
Message-ID: <CAD=FV=UNVHrGeKj0N_1WQvL+PNBTrPTj1xmk-63F4hJhPuvkug@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: rockchip: fix the rk3399 sdmmc sample shift
From: Doug Anderson <dianders@chromium.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Xing Zheng <zhengxing@rock-chips.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Shawn,

On Fri, May 13, 2016 at 12:46 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>> This should be possible to verify in one of two ways.  If the TRM has
>> a typo and things truly _do_ start at 0 instead of 1, then:
>>
>> 1. There will be roughly mirrors of valid ranges.
>> 2. Things won't match up if we change tuning to use 180 course offsets
>> and the rest fine offsets.
>>
>> It would be ideal if you could confirm with the chip guys, but if you
>
>
> I have checked it before Xing upstreamed the code, but as your question on
> the TRM, I check it with the  chip guys again.
>
> So the answer is that drv/sample stuff should refer to  Mobile Strorage
> Host Controller section, and it will fit the future Socs from now on.

OK, awesome.  I also did more quick tests by forcing dw_mmc to give me
extra details about the tuning.  These tests agree with you.

Please consider this patch abandoned.  Note that the previous patch
(1/2) is still good as far as I know, so just this patch (2/2) should
be abandoned.

Thanks!  :)

-Doug
