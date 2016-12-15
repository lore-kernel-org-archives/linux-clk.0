Return-Path: <dianders@google.com>
MIME-Version: 1.0
In-Reply-To: <1481710301-1454-3-git-send-email-zhengxing@rock-chips.com>
References: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com> <1481710301-1454-3-git-send-email-zhengxing@rock-chips.com>
From: Doug Anderson <dianders@google.com>
Date: Wed, 14 Dec 2016 16:28:05 -0800
Message-ID: <CAD=FV=XYH_7nFrOCmXXyb6JM4L4SrPcasOayDACZmhjs3tg-pQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: rockchip: rk3399: export 480M_SRC clocks id for usbphy0/usbphy1
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Wed, Dec 14, 2016 at 2:11 AM, Xing Zheng <zhengxing@rock-chips.com> wrote:
> This patch exports USBPHYx_480M_SRC clocks for usbphy.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
>  drivers/clk/rockchip/clk-rk3399.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

As mentioned in the dts patch, I don't think you need these since I'm
under the impression that nobody gets this clock.  I think the USB
Controller get the ungated version of this clock.

-Doug
