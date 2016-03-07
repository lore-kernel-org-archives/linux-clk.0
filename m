Return-Path: <javier@osg.samsung.com>
Subject: Re: [PATCH 29/41] clk: max77{686,802}: Remove CLK_IS_ROOT
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-30-git-send-email-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
From: Javier Martinez Canillas <javier@osg.samsung.com>
Message-ID: <56DD8629.1040003@osg.samsung.com>
Date: Mon, 7 Mar 2016 10:46:17 -0300
MIME-Version: 1.0
In-Reply-To: <1456858826-28541-30-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen,

On 03/01/2016 04:00 PM, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
>

Doing some search I found the patch that makes the flag
to be a no-op: https://lkml.org/lkml/2016/2/2/1037.

It would had been nice though to have that information
somewhere in the patch, probably between the separator
line and the actual diff so people know that is true :)

> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
--
Javier Martinez Canillas
Open Source Group
Samsung Research America
