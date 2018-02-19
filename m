Return-Path: <sudeepholla.maillist@gmail.com>
MIME-Version: 1.0
Sender: sudeepholla.maillist@gmail.com
In-Reply-To: <1510586871-27478-1-git-send-email-brian.starkey@arm.com>
References: <1510586871-27478-1-git-send-email-brian.starkey@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 19 Feb 2018 15:57:42 +0000
Message-ID: <CAPKp9uZY_4Hm9oq_aBdWPAhvZv-LbxezWu3rU86kw9+kFAXJ6g@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: Remove WARNs in ->round_rate()
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: open list <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Brian Starkey <brian.starkey@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Nov 13, 2017 at 3:27 PM, Brian Starkey <brian.starkey@arm.com> wrote:
> clk_round_rate() is intended to be used to round a given clock rate to
> the closest one achievable by the actual clock. This implies that the
> input to clk_round_rate() is expected to be unachievable - and such
> cases shouldn't be treated as exceptional.
>
> To reflect this, remove the WARN_ONs which trigger when an unachievable
> clock rate is passed to vexpress_osc_round_rate().
>
> Reported-by: Vladimir Murzin <vladimir.murzin@arm.com>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Ping!
