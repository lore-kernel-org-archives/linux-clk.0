Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37732 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932132AbdK1Cmo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Nov 2017 21:42:44 -0500
Received: by mail-pf0-f194.google.com with SMTP id t69so18305127pfg.4
        for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2017 18:42:42 -0800 (PST)
Date: Tue, 28 Nov 2017 08:12:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: sboyd@codeaurora.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, ysato@users.sourceforge.jp, vz@mleia.com,
        slemieux.tyco@gmail.com, vireshk@kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] SPEAr: clk: pr_err() strings should end with newlines
Message-ID: <20171128024239.GD11413@vireshk-i7>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
 <35a712ed8ee10491c0a605d0cc825250286370a4.1511505932.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <35a712ed8ee10491c0a605d0cc825250286370a4.1511505932.git.arvind.yadav.cs@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 24-11-17, 12:25, Arvind Yadav wrote:
> pr_err() messages should end with a new-line to avoid other messages
> being concatenated.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/clk/spear/clk-gpt-synth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/clk-gpt-synth.c b/drivers/clk/spear/clk-gpt-synth.c
> index 1a722e9..1cf219a6 100644
> --- a/drivers/clk/spear/clk-gpt-synth.c
> +++ b/drivers/clk/spear/clk-gpt-synth.c
> @@ -120,7 +120,7 @@ struct clk *clk_register_gpt(const char *name, const char *parent_name, unsigned
>  	struct clk *clk;
>  
>  	if (!name || !parent_name || !reg || !rtbl || !rtbl_cnt) {
> -		pr_err("Invalid arguments passed");
> +		pr_err("Invalid arguments passed\n");
>  		return ERR_PTR(-EINVAL);
>  	}

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
