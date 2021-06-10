Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426C9C47094
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 07:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2836F613BC
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 07:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhFJHZf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 03:25:35 -0400
Received: from first.geanix.com ([116.203.34.67]:50230 "EHLO first.geanix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230316AbhFJHZ2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Jun 2021 03:25:28 -0400
Received: from [192.168.64.199] (unknown [185.17.218.86])
        by first.geanix.com (Postfix) with ESMTPSA id 7419A46261A;
        Thu, 10 Jun 2021 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
        t=1623309810; bh=vyfep8YIAK6qo0oOxa4YXp/asnk+y+Zn5gtODqva2d0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=EOBhJsJW93K3V42DZWKWSVDaCHBTSDuSUhvZg455ui0L2NxAQO8nlsmHWbFpPq9KQ
         a8VC0Ia3snmnV+qqWcTdkAKR8lxkKRPmvjBxG1IVPHwbiYP9oKntrgU9SyPN1iI3T5
         gO2U1Fvo32uroq49HUqZm7WEnTXWGQ+M7m+LnBOm1XZcMN9+lG/7n3j9uG6HEMdAHo
         roP5lXMbovdF7o+JtiLs3qOgEdpc5f+KlHx+sV8CmJ9Le00Rb2vtvoOqqmTdXK9Hw3
         hT00VntQ1iXnYOX8KL81bArtz3dlw/EBqyWoD4J/N20B9zqCAOPPqKL/h1+5OKRaoX
         85zg6pIwNLqbg==
Subject: Re: [PATCH] clk: fix possible circular locking in
 clk_notifier_register()
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210610071758.1560592-1-sean@geanix.com>
From:   Sean Nyekjaer <sean@geanix.com>
Message-ID: <e9849007-8169-cb32-b0f1-5be6210f1319@geanix.com>
Date:   Thu, 10 Jun 2021 09:23:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210610071758.1560592-1-sean@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/06/2021 09.17, Sean Nyekjaer wrote:
> Allocating memory with prepare_lock mutex held makes lockdep unhappy
> when memory pressure makes the system do fs_reclaim on eg. rawnand using
> clk.
> 
> Push the allocation outside the lock.
> 
[...]
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Fixes: b2476490ef111 ("clk: introduce the common clock framework")

We could possibly add this fixes tag ^^
> ---
>  drivers/clk/clk.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 65508eb89ec9..c32b71b08ccb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4340,17 +4340,20 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
>  	if (!clk || !nb)
>  		return -EINVAL;
>  
> +	/* allocate new clk_notifier */
> +	cn = kzalloc(sizeof(*cn), GFP_KERNEL);
> +	if (!cn)
> +		goto out;
> +
>  	clk_prepare_lock();
>  
>  	/* search the list of notifiers for this clk */
>  	list_for_each_entry(cn, &clk_notifier_list, node)
> -		if (cn->clk == clk)
> +		if (cn->clk == clk) {
> +			/* if clk is in the notifier list, free new clk_notifier */
> +			kfree(cn);
>  			goto found;
> -
> -	/* if clk wasn't in the notifier list, allocate new clk_notifier */
> -	cn = kzalloc(sizeof(*cn), GFP_KERNEL);
> -	if (!cn)
> -		goto out;
> +		}
>  
>  	cn->clk = clk;
>  	srcu_init_notifier_head(&cn->notifier_head);
> @@ -4362,9 +4365,9 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
>  
>  	clk->core->notifier_count++;
>  
> -out:
>  	clk_prepare_unlock();
>  
> +out:
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(clk_notifier_register);
> 

