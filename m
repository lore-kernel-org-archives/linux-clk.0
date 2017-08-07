Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1501495822-21503-1-git-send-email-andy.yan@rock-chips.com>
References: <1501495449-21290-1-git-send-email-andy.yan@rock-chips.com> <1501495822-21503-1-git-send-email-andy.yan@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2017 10:49:38 +0200
Message-ID: <CACRpkdZQqtPnJ-OzixxwDzQg1oWZ7swO32YTRK1BiP0BaBbV0Q@mail.gmail.com>
Subject: Re: [PATCH 03/14] pinctrl: rockchip: add input schmitt support for rv1108
To: Andy Yan <andy.yan@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jul 31, 2017 at 12:10 PM, Andy Yan <andy.yan@rock-chips.com> wrote:

> Some pins like i2c SCL/SDA need the schmitt input function
> to avoid crosstalk problems.
>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Patch applied with Heiko's review tag.

Yours,
Linus Walleij
