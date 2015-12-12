Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shunqian Zheng <zhengsq@rock-chips.com>
Cc: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, caesar.wang@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, xjq@rock-chips.com
Subject: Re: [PATCH v2 0/5] Add eFuse driver of Rockchip SoC
Date: Sat, 12 Dec 2015 20:21:55 +0100
Message-ID: <25029139.jfQHqpcHTE@diego>
In-Reply-To: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
References: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 11. August 2015, 18:13:39 schrieb Shunqian Zheng:
> From: ZhengShunQian <zhengsq@rock-chips.com>
> 
> Base on nvmem framework, this series patches
> implement the eFuse driver of Rockchip SoC.
> The data from eFuse contains CPU leakage, chip code and version etc.
> 
> The flow of reading data from eFuse is quite simple,
> configure the CTRL register, write data address to CTRL
> register, then data is available in DOUT register.

I've now applied both the clock-ids addition as well as the dts node for 4.5
after seeing that the nvmem driver did actually make it into the kernel.

I've taken the liberty to
- split the clock-id patch (into header addition and clock-tree reference)
- already add the efuse_1024 clock id, if someone wants to use that later


Heiko
