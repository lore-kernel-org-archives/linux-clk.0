Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E26D3BE17C
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876391; cv=none; b=omaYnrPVi5OBQeDKalcdTP6ucrtVaGsshpBQtcY5F/C9WGMhMvwpF2cU/zdAT1BsJvjW9C1R85RBE2Ih6M+GGlcjIOg6SMxWSluUh8CciaGmkj0iTZg+gUPN0mySgTiAB4vkPQ5xrvSEDZMf/aSiVp3j1Lb5ya5hctsAzD8IF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876391; c=relaxed/simple;
	bh=1B8TDAFwpLGHwiDqq4lc4BeRA9+0ahIvheZoJR/1alo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB1V01aBXfC1SfEATHp0vV7bKmdwD/sHRmO0CdDAZo5EGHvQKyLxpeuba5yI+udRZsA/aHsLkvWupm4wT3u5iFCQJ1r5SmRAiasjL7IbsvR1dSlCyEjHgCJNzzJlO40FDAZudBgQ/4K8/TtZYrrRl4zSi+WUj7sXWVEf1kmDgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gxrIKICo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZznO00Za; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gxrIKICo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZznO00Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUo0/wHcRmQzbX45cbbWi4ZZUfa7cbgmLMG4WHaF32c=;
	b=gxrIKICoH9XVn7hnVob0gZdtRFpGDYoC0UjVHUxY3PijgkJXLvPvseZ0GiPKAU5iFl7LbC
	GfqNNff1NoQ13CqLzQWZEYH0OACKpV3fMTEOSF9XnNkt4XpoVzlrMe6UT1QL6zpiQCJUhg
	qe0SEIkQ15ej8a+TkwcotWAG2ptLvlg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-xx19wWULO4aasBx2JVlHmg-1; Mon, 30 Mar 2026 09:13:08 -0400
X-MC-Unique: xx19wWULO4aasBx2JVlHmg-1
X-Mimecast-MFC-AGG-ID: xx19wWULO4aasBx2JVlHmg_1774876388
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ebd9e1ee4so134785056d6.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774876388; x=1775481188; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUo0/wHcRmQzbX45cbbWi4ZZUfa7cbgmLMG4WHaF32c=;
        b=ZznO00ZawVMMJjNx3mbaCFgxs4mwzwlwESk6ZmsSunpE7QB7ZzxFDu3nSmGkIg5PJ3
         3AE4Ip/EyoXIxvlyOLe/B+jd4MjEAwX73cFzWbCJ75RA4HFtQ9WV4+DK8VIGTF/Gtt8p
         ldjNhAJRHJyl+0me97mCek7N6dzRIgZINgKc+DndRE5OCIxK2vkSc8ih0iEmHhrX57OA
         fVuT3G4tnt0klaSrk2PZ49D+5+Pei+AwHLQAJQBnP6NR1MyPrvc1JKXHfHv707eZpEsk
         oEzZaBcY6ioR372t5tdtZI7/K98MuaR7GYBrGIPU3EZ8qC0JgOhSQu1TPXPrgdZa6BY5
         VG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876388; x=1775481188;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUo0/wHcRmQzbX45cbbWi4ZZUfa7cbgmLMG4WHaF32c=;
        b=GKfZ8UITS0jGRqSLvR/vD+u0ypvf+h+HB94BbgOwVCX0EEtQ1QI/qhJk6tPMgpbza5
         PF6LOcLDE1g4ySxwMCNYMcRBIC7aCA99WvT2C954XSjLGxQklvcH2bw4n3jC69ONe39P
         hHmxDb0H+lcrUnyRhpd4VwzHa2TFnUo8zWKPFKIxrOvQRbFEZm+GoDkMFULsuP5X37WK
         PK98mvsCKHhen1uXSmdWsB9HMhI2OYqOQyefNACqewzQN16sZFBsKX0Unqkkk7/MVNRd
         d0aMZhkTwlxRh6ZX1UXe1JQlidWEQMVg/F2EZa0CX8azOBgZjfvNu3wS+lf5jqbXCZgY
         WT8w==
X-Gm-Message-State: AOJu0YwS8rRE3G4e7ywcRBo9sLn3FdSwJYr0xlGyO9GdbFAakcKCWzUc
	7RsObpgfkb+BcM4s49hu0SUZZAwQqBkzZm/hRXWm5lINTICQWz91dVo2ubRRBE/e/neadZfag4V
	TP4OKmkKVS58zu6nG5vCM4LYJ36kJa1qkGKUE8EJIjsOkehUpFxi8i4Tz42HqKA==
X-Gm-Gg: ATEYQzz9d8IMXIYsAzCdEkZnEdoilGPl08ljv6TVs9+hIPo0Fl8VV8GY7EFgM5P65u/
	TCoVr7rBj3kbXSdk/uFd/5XDeW4XGzZC+cczyOeiEdrksDS92AoCmpPmk9cA9bPJOyhFmaDlG6n
	7Glv1QrJ/MP1w5uR/pOXioWw5mPlC49k0fUARbcrlyiYGJe2XhfB+gm13ovP3EKV8zo2AlZr7m/
	GKdIi4IN+hM5u9+T0IC8WuwnyzIr4VdMccLgkaQ0XdFQpTj1/qBy2eZb1JIdN5SGZovEIWxqLSB
	GBbpT+FUKzjGglXmPq6IPF0zMM/2wuUxc2Gd6tJHXILCtOoQ62tSahJrRTtapUDFJViIAOxAnUC
	2m4Jw76oeosqbAVsgk5e1M3IPd0Y75cX1Vyn5RwqXpzsk0CyWtgMzCsHD
X-Received: by 2002:a05:6214:4105:b0:8a0:22bb:1d3c with SMTP id 6a1803df08f44-8a022bb1fb2mr76477696d6.3.1774876387573;
        Mon, 30 Mar 2026 06:13:07 -0700 (PDT)
X-Received: by 2002:a05:6214:4105:b0:8a0:22bb:1d3c with SMTP id 6a1803df08f44-8a022bb1fb2mr76476806d6.3.1774876386785;
        Mon, 30 Mar 2026 06:13:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ec6ec2266sm63989576d6.0.2026.03.30.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:13:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:13:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] clk: kirkwood: use kzalloc_flex
Message-ID: <acp24GchNcb9iHXJ@redhat.com>
References: <20260326045555.240730-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326045555.240730-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Wed, Mar 25, 2026 at 09:55:55PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member and kzalloc_flex to
> combine allocations.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment to right after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/clk/mvebu/kirkwood.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
> index ed061d82fb65..fc2972538008 100644
> --- a/drivers/clk/mvebu/kirkwood.c
> +++ b/drivers/clk/mvebu/kirkwood.c
> @@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {
>  
>  struct clk_muxing_ctrl {
>  	spinlock_t *lock;
> -	struct clk **muxes;
>  	int num_muxes;
> +	struct clk *muxes[] __counted_by(num_muxes);
>  };
>  
>  static const char *powersave_parents[] = {
> @@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
>  	if (WARN_ON(!base))
>  		return;
>  
> -	ctrl = kzalloc_obj(*ctrl);
> -	if (WARN_ON(!ctrl))
> -		goto ctrl_out;
> -
> -	/* lock must already be initialized */
> -	ctrl->lock = &ctrl_gating_lock;
> -
>  	/* Count, allocate, and register clock muxes */
>  	for (n = 0; desc[n].name;)
>  		n++;
>  
> +	ctrl = kzalloc_flex(*ctrl, muxes, n);
> +	if (WARN_ON(!ctrl))
> +		goto ctrl_out;
> +
>  	ctrl->num_muxes = n;
> -	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
> -	if (WARN_ON(!ctrl->muxes))
> -		goto muxes_out;

Question from Sashiko:

https://sashiko.dev/#/patchset/20260326045555.240730-1-rosenp%40gmail.com

    This isn't a bug, but since the goto muxes_out error path was removed here,
    should the muxes_out label and its kfree(ctrl) be removed at the end of the
    function?
    They appear to be dead code now and might cause an unused label warning:
    	return;
    muxes_out:
    	kfree(ctrl);
    ctrl_out:
    	iounmap(base);
    }

Brian


> +
> +	/* lock must already be initialized */
> +	ctrl->lock = &ctrl_gating_lock;
>  
>  	for (n = 0; n < ctrl->num_muxes; n++) {
>  		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
> -- 
> 2.53.0
> 

