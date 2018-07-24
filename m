Return-Path: <dianders@google.com>
MIME-Version: 1.0
Sender: dianders@google.com
In-Reply-To: <20180724174513.174018-3-dianders@chromium.org>
References: <20180724174513.174018-1-dianders@chromium.org> <20180724174513.174018-3-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Jul 2018 11:24:19 -0700
Message-ID: <CAD=FV=W-YDFM2k6080naxPY8bfE8SJE68g60qXBM9+msgSQRzA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add qspi (Quad SPI) clocks for sdm845
To: Stephen Boyd <sboyd@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: Taniya Das <tdas@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Amit Nischal <anischal@codeaurora.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>, grahamr@codeaurora.org,
	"open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Douglas Anderson <dianders@chromium.org>, Michael Turquette <mturquette@baylibre.com>,
	LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Tue, Jul 24, 2018 at 10:45 AM, Douglas Anderson
<dianders@chromium.org> wrote:
> Add both the interface and core clock.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> (am from https://lore.kernel.org/patchwork/patch/966680/mbox)

It's just the day for me being a screwup I guess.  :(  That line
(obviously) doesn't belong.  I'm assuming it's easy enough for Stephen
to remove it when he applies so I won't plan to repost.  Sorry for
being so dumb.

-Doug
