Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Message-ID: <5654FD46.30907@gmail.com>
Date: Tue, 24 Nov 2015 16:13:58 -0800
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
CC: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Simran Rai <ssimran@broadcom.com>
Subject: Re: [PATCH v2 0/4] Add Cygnus audio clock support
References: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
In-Reply-To: <1448301027-27061-1-git-send-email-rjui@broadcom.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 23/11/15 09:50, Ray Jui wrote:
> This patch series adds support for the Cygnus audio clock based on existing
> iProc clock support
> 
> This patch series is developed based on v4.4-rc1 with full tree available
> on GITHUB:
> repo: https://github.com/Broadcom/cygnus-linux.git
> branch: cygnus-audio-clk-v2
> 
> Changes from v1:
>  - Remove function prototype of a non-exist function 'iproc_audiopll_clk_setup'
>  - Remove __init macros from all functions prototypes in iproc-clk.h
> 
> Ray Jui (1):
>   clk: iproc: Remove __init from header
> 
> Simran Rai (3):
>   Documentation: dt-bindings: Add DT bindings for Cygnus audio clock
>   clk: iproc: Add support for Cygnus audio clocks
>   ARM: dts: enable audio clock support for Cygnus

Stephen, Mike, do these clock changes look sensible to you? If so, could
you also put the drivers/clk/ changes in a branch that I could merge as
part of including the DTS changes?

Thanks!
-- 
Florian
