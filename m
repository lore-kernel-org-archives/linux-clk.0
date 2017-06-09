Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:37452 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751610AbdFIK6j (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2017 06:58:39 -0400
Date: Fri, 9 Jun 2017 12:58:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com
Subject: Re: [PATCH v2 1/3] clk: samsung: Add enable/disable operation for
 PLL36XX clocks
Message-ID: <20170609105835.GA9789@kozik-book>
References: <CGME20170609103849epcas5p397e85db2388d4d91f5a775996cb9541d@epcas5p3.samsung.com>
 <1497004711-24052-1-git-send-email-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1497004711-24052-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 09, 2017 at 12:38:29PM +0200, Sylwester Nawrocki wrote:
> The existing enable/disable ops for PLL35XX are made more generic
> and used also for PLL36XX. This fixes issues in the kernel with
> PLL36XX PLLs when the PLL has not been already enabled by bootloader.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v1:
>  - none
> 
>  drivers/clk/samsung/clk-pll.c | 87 +++++++++++++++++++++++++------------------
>  1 file changed, 50 insertions(+), 37 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

