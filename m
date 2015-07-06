Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Mon, 6 Jul 2015 15:00:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/7] clk: rockchip: add support for phase inverters
Message-ID: <20150706220021.GF20866@codeaurora.org>
References: <1436086820-3757-1-git-send-email-heiko@sntech.de>
 <1436086820-3757-2-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <1436086820-3757-2-git-send-email-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-rockchip@lists.infradead.org, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 07/05, Heiko Stuebner wrote:
> Most Rockchip socs have optional phase inverters connected to some
> clocks that move the clock-phase by 180 degrees.
> While not having any actual influence on the rate, the inverter
> provides its own simple recalc_rate callback as relying on the
> fallback in the framework is for "lazy developers" according
> to the documentation in the code.

The comment about lazy doesn't seem to apply anymore? So I've
dropped this last sentence.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
