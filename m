Return-Path: <SRS0=3lGJ=RF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B0CC43381
	for <linux-clk@archiver.kernel.org>; Sat,  2 Mar 2019 10:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6916520838
	for <linux-clk@archiver.kernel.org>; Sat,  2 Mar 2019 10:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="1P6ZFaIM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbfCBKPa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Mar 2019 05:15:30 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35997 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfCBKP3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Mar 2019 05:15:29 -0500
Received: by mail-lj1-f196.google.com with SMTP id v10so279455lji.3
        for <linux-clk@vger.kernel.org>; Sat, 02 Mar 2019 02:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cHHNRHPJqf7aByI4pP6V3ueWusNGY7S6yJanIoX8rTY=;
        b=1P6ZFaIM1F95ENHgM3CW+4bVcUDbaBO0y1+qHrrX2gu7yaOiS8YNDYxKnXIbelJBXX
         fpBUxJ9UfJbeXl1uyD+Z9jK5DQWCOvQPgKoH+yjHqJPeqvWXiLS6Zb/2zxFe6edeSPCN
         Wo+sCvW9Fgtc+LebR6XqrYSJwQPmhHJcJK9+3O2aerJlO9gQK4DX5s2Bhir8YNXyMUwi
         hQIiIkApoMaWQcTSK9UXBcYGmPGPzi5SbPqUZlC3ZaxizeEOoYgJ+IHkpxr8iYM1fBXj
         RqhJv1qxYlZbMWDOqh+WC/HGVt0PN0sESMyj8hY4Y7xW4Z98CrKDv4wuAqCcoJHPRVyr
         yCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cHHNRHPJqf7aByI4pP6V3ueWusNGY7S6yJanIoX8rTY=;
        b=Z3AeFMap1kuVnq8yHoBQKbGjEo+rwpZmMhMmV5m+uOUh0Vi2r6TBlQspdhM0FBdYJU
         bo61XBlfGVWlX79TJSUzy3LzjY/1KyaVtQX4hSfBvwj55VPjwFwcybwFhmNt7kQO25qO
         iCb6HcFgL9Klo5Szq+ALO/bS1MDNs4BHlVIu6pTUk6NhyHaMVaGrlrbYNo+fPcu0T07k
         yXuxVs2HMxCoyijQxZHczaJXX66p3xJeKWc05Mf8trbwY4obsFYGVL7VDZQ34dHLj+DZ
         R1qXh9R+YlEB8lUWwNmVYB52vsxvL74wg//ENsStGo6aIsHX4ipX04ITCkkrVtWM8hT/
         njuw==
X-Gm-Message-State: APjAAAWAPNfKrf2Q9Xj9zDSWgIZer8SbviYX14o1ew0y0q1zMhYO/U7P
        M7AFcFcEWsElGhZMCwBebTbtWQ==
X-Google-Smtp-Source: APXvYqxVIXcZ7Aw/RkZDXIEJju6w+sr+4U+X5vnxKPSG8gghr1cTT7GC9Fvx8n3N2igqgYmFV3T3JA==
X-Received: by 2002:a2e:8092:: with SMTP id i18mr5426826ljg.91.1551521727624;
        Sat, 02 Mar 2019 02:15:27 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id u14sm108891lfu.94.2019.03.02.02.15.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Mar 2019 02:15:26 -0800 (PST)
Date:   Sat, 2 Mar 2019 11:15:26 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Pass name/offset to
 cpg_sd_clk_register()
Message-ID: <20190302101526.GB22550@bigcity.dyn.berto.se>
References: <20190301123822.808-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190301123822.808-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-03-01 13:38:22 +0100, Geert Uytterhoeven wrote:
> Explicitly pass the clock's name and register offset to
> cpg_sd_clk_register(), so the latter doesn't have to extract them from
> the cpg_core_clk object.
> 
> This keeps all cpg_core_clk parsing and unmarshalling contained in a
> single function (rcar_gen3_cpg_clk_register()).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.2.
> 
>  drivers/clk/renesas/rcar-gen3-cpg.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 9a8071a8114daec9..dcd4ac389326b932 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -369,8 +369,8 @@ static u32 cpg_quirks __initdata;
>  #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
>  #define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
>  
> -static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
> -	void __iomem *base, const char *parent_name,
> +static struct clk * __init cpg_sd_clk_register(const char *name,
> +	void __iomem *base, unsigned int offset, const char *parent_name,
>  	struct raw_notifier_head *notifiers)
>  {
>  	struct clk_init_data init;
> @@ -383,13 +383,13 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
>  	if (!clock)
>  		return ERR_PTR(-ENOMEM);
>  
> -	init.name = core->name;
> +	init.name = name;
>  	init.ops = &cpg_sd_clock_ops;
>  	init.flags = CLK_SET_RATE_PARENT;
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
>  
> -	clock->csn.reg = base + core->offset;
> +	clock->csn.reg = base + offset;
>  	clock->hw.init = &init;
>  	clock->div_table = cpg_sd_div_table;
>  	clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
> @@ -606,8 +606,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>  		break;
>  
>  	case CLK_TYPE_GEN3_SD:
> -		return cpg_sd_clk_register(core, base, __clk_get_name(parent),
> -					   notifiers);
> +		return cpg_sd_clk_register(core->name, base, core->offset,
> +					   __clk_get_name(parent), notifiers);
>  
>  	case CLK_TYPE_GEN3_R:
>  		if (cpg_quirks & RCKCR_CKSEL) {
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
