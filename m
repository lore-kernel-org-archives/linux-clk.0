Return-Path: <emilio@elopez.com.ar>
Subject: Re: [PATCH] clk: clk_register: Correctly initialize enable_count
To: Rhyland Klein <rklein@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <1455058120-7398-1-git-send-email-rklein@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Emilio_L=c3=b3pez?= <emilio@elopez.com.ar>
Message-ID: <56BAA6D9.9090009@elopez.com.ar>
Date: Tue, 9 Feb 2016 23:56:25 -0300
MIME-Version: 1.0
In-Reply-To: <1455058120-7398-1-git-send-email-rklein@nvidia.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hi,

El 09/02/16 a las 19:48, Rhyland Klein escribió:
> When clocks are registered, they could be enabled already in
> hardware. As of now, the enable count will start at 0. When this
> happens, it means a clock is enabled and the framework doesn't know
> that, so it will always report it as disabled.

Keep in mind that during the boot process, towards the end, unused
clocks get disabled, so the state remains in sync. If suddenly the
enable_count on unused clocks is not 0, this will break and unused
clocks will remain on, wasting power.

http://lxr.free-electrons.com/source/drivers/clk/clk.c#L244

What issue were you having that prompted you to write this patch?

Cheers,
Emilio
