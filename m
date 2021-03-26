Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC23C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 17:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC54C61A2B
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 17:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhCZRpF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:45:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34481 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230003AbhCZRpC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Mar 2021 13:45:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616780702; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fqTXKlxaID5peJONj5y6klwSiiiIBugF/pSXxYmx9GI=;
 b=DzPauC+t0Q+D3TtBOJxKw8lutdVl3rxCsj0Vvi6CzoNkYkohBrXrBqO9AZkV/iip4IsffT0m
 5F1pqxGsZEARHtz/Gjs8Z2ZadVl7dVQjgxXkeOH+qkF7VP6RaRTcVbPHgyssKYERbdQx4EV8
 bf5TFFMipzIPvpi7S9XPiX36yA0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 605e1d8f87ce1fbb5609c883 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:44:47
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 045CBC43467; Fri, 26 Mar 2021 17:44:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0556C433ED;
        Fri, 26 Mar 2021 17:44:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Mar 2021 10:44:45 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v2 02/28] clk: mux: provide
 devm_clk_hw_register_mux()
In-Reply-To: <20210324151846.2774204-3-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-3-dmitry.baryshkov@linaro.org>
Message-ID: <d84149929b251ccaa5cacb9efdd52e22@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> Add devm_clk_hw_register_mux() - devres-managed version of
> clk_hw_register_mux().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/clk/clk-mux.c        | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 13 +++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index e54e79714818..20582aae7a35 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -8,6 +8,7 @@
>   */
> 
>  #include <linux/clk-provider.h>
> +#include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> @@ -206,6 +207,40 @@ struct clk_hw *__clk_hw_register_mux(struct
> device *dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
> 
> +static void devm_clk_hw_release_mux(struct device *dev, void *res)
> +{
> +	clk_hw_unregister_mux(*(struct clk_hw **)res);
> +}
> +
> +struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct
> device_node *np,
> +		const char *name, u8 num_parents,
> +		const char * const *parent_names,
> +		const struct clk_hw **parent_hws,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> +		u8 clk_mux_flags, u32 *table, spinlock_t *lock)
> +{
> +	struct clk_hw **ptr, *hw;
> +
> +	ptr = devres_alloc(devm_clk_hw_release_mux, sizeof(*ptr), 
> GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hw = __clk_hw_register_mux(dev, np, name, num_parents, parent_names,
> parent_hws,
> +				       parent_data, flags, reg, shift, mask,
> +				       clk_mux_flags, table, lock);
> +
> +	if (!IS_ERR(hw)) {
> +		*ptr = hw;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(__devm_clk_hw_register_mux);
> +
>  struct clk *clk_register_mux_table(struct device *dev, const char 
> *name,
>  		const char * const *parent_names, u8 num_parents,
>  		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> diff --git a/include/linux/clk-provider.h 
> b/include/linux/clk-provider.h
> index 58f6fe866ae9..3eb15e0262f5 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -868,6 +868,13 @@ struct clk_hw *__clk_hw_register_mux(struct
> device *dev, struct device_node *np,
>  		const struct clk_parent_data *parent_data,
>  		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
>  		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
> +struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct
> device_node *np,
> +		const char *name, u8 num_parents,
> +		const char * const *parent_names,
> +		const struct clk_hw **parent_hws,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> +		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
>  struct clk *clk_register_mux_table(struct device *dev, const char 
> *name,
>  		const char * const *parent_names, u8 num_parents,
>  		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> @@ -902,6 +909,12 @@ struct clk *clk_register_mux_table(struct device
> *dev, const char *name,
>  	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, 
> \
>  			      (parent_data), (flags), (reg), (shift),	      \
>  			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
> +#define devm_clk_hw_register_mux(dev, name, parent_names,
> num_parents, flags, reg, \
> +			    shift, width, clk_mux_flags, lock)		      \
> +	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      
> \
> +			      (parent_names), NULL, NULL, (flags), (reg),     \
> +			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
> +			      NULL, (lock))
> 
>  int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int 
> flags,
>  			 unsigned int val);
