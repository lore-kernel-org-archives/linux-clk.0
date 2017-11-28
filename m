Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:40153 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752997AbdK1Cm2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Nov 2017 21:42:28 -0500
Received: by mail-pl0-f67.google.com with SMTP id 62so9739365plc.7
        for <linux-clk@vger.kernel.org>; Mon, 27 Nov 2017 18:42:28 -0800 (PST)
Date: Tue, 28 Nov 2017 08:12:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: sboyd@codeaurora.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, ysato@users.sourceforge.jp, vz@mleia.com,
        slemieux.tyco@gmail.com, vireshk@kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] clk: SPEAr: pr_err() strings should end with newlines
Message-ID: <20171128024225.GC11413@vireshk-i7>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
 <03a5ce213323863375e1fb3f85c0c3cc8c921a41.1511505932.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <03a5ce213323863375e1fb3f85c0c3cc8c921a41.1511505932.git.arvind.yadav.cs@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 24-11-17, 12:25, Arvind Yadav wrote:
> pr_err() messages should end with a new-line to avoid other messages
> being concatenated.
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spear/clk-frac-synth.c b/drivers/clk/spear/clk-frac-synth.c
> index 58d678b..cbdf43a 100644
> --- a/drivers/clk/spear/clk-frac-synth.c
> +++ b/drivers/clk/spear/clk-frac-synth.c
> @@ -131,7 +131,7 @@ struct clk *clk_register_frac(const char *name, const char *parent_name,
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
