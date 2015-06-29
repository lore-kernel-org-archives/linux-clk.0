Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <5591B97D.2080003@broadcom.com>
Date: Mon, 29 Jun 2015 14:32:45 -0700
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
CC: <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Scott Branden <sbranden@broadcom.com>,
	<linux-kernel@vger.kernel.org>,
	<bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH 0/2] iProc clock driver fixes
References: <1435613410-18698-1-git-send-email-rjui@broadcom.com>
In-Reply-To: <1435613410-18698-1-git-send-email-rjui@broadcom.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

To Michael's new email.

On 6/29/2015 2:30 PM, Ray Jui wrote:
> This patch series fixes two issues in the Broadcom iProc clock driver,
> reported by Dan Carpenter <dan.carpenter@oracle.com>: 1) a memory leak from
> the clock names; 2) 32-bit/64-bit arithmetic
> 
> Code base used is the latest linux-next (20150629) and its GITHUB link is:
> https://github.com/Broadcom/cygnus-linux/tree/iproc-clk-misc-fix-v1
> 
> Ray Jui (2):
>   clk: iproc: fix memory leak from clock name
>   clk: iproc: fix bit manipulation arithmetic
> 
>  drivers/clk/bcm/clk-iproc-asiu.c |    6 +-----
>  drivers/clk/bcm/clk-iproc-pll.c  |   13 ++++---------
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
