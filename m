Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180808171952.17263-1-icenowy@aosc.io>
References: <20180808171952.17263-1-icenowy@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 11 Aug 2018 00:46:33 +0800
Message-ID: <CAGb2v64fPkngWR3bxUja5d50fkZcnXAisTsNgaYJ3=D=CkS9YA@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix H6 bus clocks divider position
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Aug 9, 2018 at 1:19 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
> The bus clocks (AHB/APB) on Allwinner H6 have their second divider start
> at bit 8, according to the user manual and the BSP code. However,
> currently the divider is wrongly set to 16, thus the divider is not
> correctly read and the clock frequency is not correctly calculated.
>
> Fix this bit offset on all affected bus clocks in ccu-sun50i-h6.
>
> Cc: stable@vger.kernel.org # v4.17.y
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

APB1 seems to be the only affected bus. Since there aren't any users ATM,
I've queued this up for 4.20, with a few minor tweaks to the commit log:

  - s/wrongly/incorrectly/
  - subject changed to "clk: sunxi-ng: h6: fix bus clocks' divider position"
  - third line: currently the divider _offset_ is ...

ChenYu
