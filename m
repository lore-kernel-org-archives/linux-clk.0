Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Mon, 6 Jul 2015 15:07:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/7] clk: rockchip: fix issues in the mmc-phase clock
Message-ID: <20150706220713.GH20866@codeaurora.org>
References: <1436086820-3757-1-git-send-email-heiko@sntech.de>
 <1436086820-3757-3-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <1436086820-3757-3-git-send-email-heiko@sntech.de>
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
> The review for the new inverter clock type uncovered some issues (missing
> headers and name handling) that are also present in the mmc-phase clock
> type, I got (to much) inspiration from. Fix these there too.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-rk3368.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
