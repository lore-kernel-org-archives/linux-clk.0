Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([119.145.14.65]:43266 "EHLO
	szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750704AbcF1H1z (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2016 03:27:55 -0400
Subject: Re: [RESEND PATCH v2 0/5] clk: hisilicon: Fix some problems of
 clk-hi3519
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<yanhaifeng@hisilicon.com>, <yanghongwei@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <577226C0.3020101@hisilicon.com>
Date: Tue, 28 Jun 2016 15:26:56 +0800
MIME-Version: 1.0
In-Reply-To: <1465971998-29619-1-git-send-email-xuejiancheng@hisilicon.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,
    Can this patch be merged into the clk-next? If there are still some
issues to fix, please let me know. Thank you very much.

Regards,
Jiancheng

On 2016/6/15 14:26, Jiancheng Xue wrote:
> This patch is base on branch clk-hi3519 in clk tree. It mainly fixes the
> following issues:
> 1. Add driver remove path.
> 2. Fix the ordering issue about clock provider being published.
> 3. Add error checking upon registering clocks. 
> 
> change log
> v2:
> -Redivided patches to make sure every patch can be compiled successfully.
> 
> Jiancheng Xue (5):
>   reset: hisilicon: change the definition of hisi_reset_init
>   clk: hisilicon: add hisi_clk_alloc function.
>   clk: hisilicon: add error processing for hisi_clk_register_* functions
>   clk: hisilicon: add hisi_clk_unregister_* functions
>   clk: hisilicon: hi3519: add driver remove path and fix some issues
> 
>  drivers/clk/hisilicon/clk-hi3519.c | 116 ++++++++++++++++++++++++++++++++-----
>  drivers/clk/hisilicon/clk.c        |  89 ++++++++++++++++++++++++----
>  drivers/clk/hisilicon/clk.h        |  34 +++++++++--
>  drivers/clk/hisilicon/reset.c      |  19 +++---
>  drivers/clk/hisilicon/reset.h      |   5 +-
>  5 files changed, 220 insertions(+), 43 deletions(-)
> 

