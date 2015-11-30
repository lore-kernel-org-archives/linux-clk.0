Return-Path: <djkurtz@google.com>
MIME-Version: 1.0
Sender: djkurtz@google.com
In-Reply-To: <1442230072-31593-1-git-send-email-pi-cheng.chen@linaro.org>
References: <1442230072-31593-1-git-send-email-pi-cheng.chen@linaro.org>
From: Daniel Kurtz <djkurtz@chromium.org>
Date: Mon, 30 Nov 2015 11:48:00 +0800
Message-ID: <CAGS+omCkYTPyjMk6QaoxGAL4QVU8VcpWyFqWhST+iP2EFRcRYg@mail.gmail.com>
Subject: Re: [PATCH v6] clk: mediatek: Export CPU mux clocks for CPU frequency control
To: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	James Liao <jamesjj.liao@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Linaro Kernel Mailman List <linaro-kernel@lists.linaro.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Pi-Cheng and Michael,

On Mon, Sep 14, 2015 at 7:27 PM, Pi-Cheng Chen <pi-cheng.chen@linaro.org> wrote:
> From: "pi-cheng.chen" <pi-cheng.chen@linaro.org>
>
> This patch adds CPU mux clocks which are used by Mediatek cpufreq driver
> for intermediate clock source switching.

It looks like this patch was never picked up.
It is required for MT8173 cpufreq.

What is the plan to get this one merged?

-Dan

>
> Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
> ---
> Changes in v6:
> - Relace __clk_get_num_parents with clk_hw_get_num_parents to reflect
>   API change
>
> Changes in v5:
> - Replace __initdata with __initconst to fix compiling error
>
> Changes in v4:
> - Fix some minor issues for v3
> - Rebase to the patch that adds 13mhz clock for MT8173[1]
>
> Changes in v3:
> - Rebase to 4.2-rc1
> - Fix some issues of v2
>
> Changes in v2:
> - Remove use of .determine_rate callback
> ---
>  drivers/clk/mediatek/Makefile          |   2 +-
>  drivers/clk/mediatek/clk-cpumux.c      | 127 +++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-cpumux.h      |  22 ++++++
>  drivers/clk/mediatek/clk-mt8173.c      |  23 ++++++
>  include/dt-bindings/clock/mt8173-clk.h |   4 +-
>  5 files changed, 176 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-cpumux.c
>  create mode 100644 drivers/clk/mediatek/clk-cpumux.h

[snip]
