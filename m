Return-Path: <sboyd@codeaurora.org>
Message-ID: <55A44F3E.2040500@codeaurora.org>
Date: Mon, 13 Jul 2015 16:52:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH] clk: h8300: Remove clk.h and clkdev.h includes
References: <1436831337-8996-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436831337-8996-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/13/2015 04:48 PM, Stephen Boyd wrote:
> Neither of these includes are used in this driver, remove them.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>   drivers/clk/h8300/clk-h8s2678.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
> index 4701b093e497..44aa45f71f1b 100644
> --- a/drivers/clk/h8300/clk-h8s2678.c
> +++ b/drivers/clk/h8300/clk-h8s2678.c
> @@ -4,8 +4,6 @@
>    * Copyright 2015 Yoshinori Sato <ysato@users.sourceforge.jp>
>    */
>   
> -#include <linux/clk.h>
> -#include <linux/clkdev.h>
>   #include <linux/clk-provider.h>
>   #include <linux/err.h>
>   #include <linux/device.h>

Ugh and the same is in in h8300/clk-div.c

---8<----

diff --git a/drivers/clk/h8300/clk-div.c b/drivers/clk/h8300/clk-div.c
index 56f9eba91b83..1aaf75edf097 100644
--- a/drivers/clk/h8300/clk-div.c
+++ b/drivers/clk/h8300/clk-div.c
@@ -4,8 +4,6 @@
   * Copyright 2015 Yoshinori Sato <ysato@users.sourceforge.jp>
   */
  
-#include <linux/clk.h>
-#include <linux/clkdev.h>
  #include <linux/clk-provider.h>
  #include <linux/err.h>
  #include <linux/of.h>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
