Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740327FD51
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 22:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785383; cv=none; b=jCUj3Ig+LFOe87j+Ouy6zirsd7WytNCbObhYILOGxOj23Xg0sBHOdfwXGpbMXhLM2Wnsw3fytcbFi1ybQ0XqCyfCVAUkndT8JJ7xmuoZuHG9HUVpMLrffQhX+ZpZwgRg0kInSH4XJD4B0PbGjFLP6nE76MPMLC3ujCu5OXw93j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785383; c=relaxed/simple;
	bh=9X7swX/8yMUMhwMxtLNwij2a5oD3GT+erMjqq8TCDBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhbIZLsO0lftO+1TLmPPMUwtQqpCZuQ5FIcdAyp8p1MCRHll2ZsrDbWcdsfhJv1Td+hGW9021V94evkBx1y8P30V3H5X+xGP4ScBip74Q3X2VydTg1h2Q48DgSEXeIsiol5Zat8MZK6OWNRkEMS1UOHLS13wLlVDwT7ioLs3Vjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A04Vly5E; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mrRLq07X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A04Vly5E";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mrRLq07X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773785381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dk1wudd/iOGrTdVOp9IBIbtc0x1PPisYVtUAogdFG9s=;
	b=A04Vly5EPe7Zfzatp1Gu6h4RYO681VRdqvjLTm6vRlxjIKzp/sZnw4GweFB7dO+S9vLgu9
	7zR5sdLG0JcQKpniEfkaZLJvN4fWhKhfNnQtnzU3rZvttiRtcxDCbbRSSjZDND0qF3DeJm
	KetgUJNhV7CvgwOmgqv+mA5Sx5iaz90=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-88kD2Sw9MdS8e9oe_S4slw-1; Tue, 17 Mar 2026 18:09:39 -0400
X-MC-Unique: 88kD2Sw9MdS8e9oe_S4slw-1
X-Mimecast-MFC-AGG-ID: 88kD2Sw9MdS8e9oe_S4slw_1773785379
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so4146101385a.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 15:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773785379; x=1774390179; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dk1wudd/iOGrTdVOp9IBIbtc0x1PPisYVtUAogdFG9s=;
        b=mrRLq07XCubdYoRJ/pDmZTKc3hxFE43WbOT3YBUwPR0MUA/o0mjeqTnkcxogrhFjfH
         gB78oOXm4vrrxVb6BJohmRRR0QI+82LWCxWO/4jav+U3Ff9oQ3KFoh5VLvPaU9Du/4Tj
         zBI09UiWwq2zDmpOMrGc3LWpVwfrHD+QuZkqQA1npRYPH8LQiJpkBCIonL8NKSRBSzuN
         ufi4kEPWq5mC+68NmWdM0IygY1MdtUg2E8xeGEM6hSm1NHjFsLhn5GlboYu6leBtKZrj
         dwHIdXUBNJT2smGai6b2tJEoylLTX8KgI9+gEU6PugizOOLyjaK18I7ZJ0IfPe9FFLzz
         6C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785379; x=1774390179;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dk1wudd/iOGrTdVOp9IBIbtc0x1PPisYVtUAogdFG9s=;
        b=s7Ig9zLtdGVPA1T/MvJ9wDM5w00W4fI/WhqMq/SpKdnCjnta/VNbmFD8pSds5fLaWU
         0CQH9vTEIeNvbqpZvGSnFbvFYAPSG9EdPHF5hN675Ey72DQPjB9p/FIu4QK6Yzm3mCYG
         mPxPVj7xUz9L7MV7ng1byZtw9+fWz7TPkiEW+/edgaxqvBIJDH2DxfDpRLJnKzcaxqk1
         W9GSGmEjTow+TYzcYL7xt0hWIhZhZG+sRx2f23KkhiihFbppuXZEbQyiMgdpCe3F3lbH
         S8f/ghLpkXyK0xYuJi+LVVCZKvVyc3K7wJe/C5WOlJ1xxElfBS/MGtbPaWmFpjHTBWFx
         dqYA==
X-Forwarded-Encrypted: i=1; AJvYcCVv4ojK7n1Vorr4ZPNc6NGoza3r2ARinKLoXXEDM64zCyvU1ruNVfAVivne9Fe71TwcLnET/09ePGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfXI+JY3Xj0GNOUQT4tBGQ9vWvzQ+fuWr2pGYqn0mLuYAa4Wzb
	b2EZR9EGXTY/aorfagzZzykW7+HBJGljBixzCp7EJsDDP5uKkqzEw90Wv0n2hngASQNbY4S3YWC
	B4ZnAdoHzALTwGgT1WxV2BHaARrEb7g08Z59Xbds9B5jabNbvny2y87Tn3lcyww==
X-Gm-Gg: ATEYQzyTdGJBA2xKvQdbsP4AhNES7JO+FvvAD+tup2iVjCsdooNDQSQZ7lMbQND6vMX
	I/bak9LgKLtJ4LSuyU1isEW4feUfgy5zoKT2lYq27HDPe/6PNirpsWNtjfLUfIxeEqbLi7bgDco
	mpTU4AZcQM/CHiSoqv45eO9+dWwhJq/He2dFwuL6+aZqXkS5Gdm8SiBJkGUX5TeHg7HWcKhWWZK
	biJXcF3XIpGcr116ixZUhSSE0m2R6Egbi57TgDgeQDEI+To9eU7iegC9lRhu1jaWELreW6ulWKj
	wf/eTNNTwPzTSS8WEMNb8gyoF1qDkhhcVNtyfGo/RMwQsbFEHRRSibwgFdm6ZH5H9uTjv3Xf4cP
	3BlDFtEXnjwi4v9zPWrXPndWukBkNKLeeckXToFP9PpS+Ztz60eBxQFye
X-Received: by 2002:a05:620a:4488:b0:8ca:123e:819c with SMTP id af79cd13be357-8cfad2f5edfmr177071685a.35.1773785379019;
        Tue, 17 Mar 2026 15:09:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4488:b0:8ca:123e:819c with SMTP id af79cd13be357-8cfad2f5edfmr177068185a.35.1773785378579;
        Tue, 17 Mar 2026 15:09:38 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacdb21bbsm74143685a.2.2026.03.17.15.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:09:38 -0700 (PDT)
Date: Tue, 17 Mar 2026 18:09:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add clk_hw_recalc_rate() to trigger HW clk rate
 recalculation
Message-ID: <abnRID0SfnQlRw-e@redhat.com>
References: <20260317173255.5531-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317173255.5531-1-ansuelsmth@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Christian,

On Tue, Mar 17, 2026 at 06:32:45PM +0100, Christian Marangi wrote:
> There is currently a latent problem with HW clk that only expose a
> .recalc_rate OP and doesn't have a .set_rate() and also have the
> CLK_GET_RATE_NOCACHE flag set. In such case the rate in clk core is
> parsed only (and set) only at init and when the full clk_set_rate()
> is called. In every other case .recalc_rate() is never called.

As you pointed out below, it's also called for the full clk_get_rate().

> 
> It's also possible that an HW clk of this type, initially report 0 as rate
> as the register are still not configured and the HW clk effectively doesn't
> return any rate.
> 
> This gets especially problematic when a clock provider use such clk as a
> parent and require the rate for parent selection for the final rate
> calculation.
> 
> In such case, since the HW clk rate is never updated after init, it's still
> 0 and cause problems with any other HW clk that use .determine_rate() or
> .round_rate() and search for the closest rate using clk_hw_get_rate() on
> the parents.
> 
> This doesn't happen if the full clk_get_rate() is used instead as it will
> check if CLK_GET_RATE_NOCACHE is set and recalculate the rate accordingly.
> 
> Updating the clk_hw_get_rate() to align to what clk_get_rate() does is not
> possible as it should be lockless and might cause problems in any user of
> clk_hw_get_rate().
> 
> A more safe approach is the introduction of a direct function that triggers
> the HW clk rate recalculation, clk_hw_recalc_rate().
> 
> Any driver that implement an HW clk that entirely depends on some register
> to configure the rate (that are externally configured) and have only
> .recalc_rate() and set CLK_GET_RATE_NOCACHE (aka the case where the HW clk
> rate actually change and depends on the external register configuration)
> will have to call clk_hw_recalc_rate() on the HW clk after changing the
> register configuration to sync the CCF with the new rate for the HW clk.
> 
> Example:
> 
>  - All register zero -> HW clk rate = 0
>  - PCS configure USXGMII mode -> HW clk rate = 0
>  - PCS call clk_hw_recalc_rate() -> HW clk rate = 312MHz
>  - Port goes UP
>  - PCS/MAC scale the PHY port clock correctly by having
>    the correct reference clock as parent (instead of 0)
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk.c            | 23 +++++++++++++++++++++++
>  include/linux/clk-provider.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df3..35e0cf627c24 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1977,6 +1977,29 @@ static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
>  	return clk_core_get_rate_nolock(core);
>  }
>  
> +/**
> + * clk_hw_recalc_rate - trigger rate recalculation for clk_hw
> + * @hw: clk_hw associated with the clk to recalculate for
> + *
> + * Use clk_hw_recalc_rate() for the hw clk where the rate
> + * entirely depend on register configuration and doesn't have
> + * a .set_rate() OP. In such case, after modifying the register
> + * that would change the rate for the hw clk, call
> + * clk_hw_recalc_rate() to sync the CCF with the new clk rate.
> + */
> +void clk_hw_recalc_rate(const struct clk_hw *hw)
> +{
> +	struct clk_core *core = hw->core;
> +
> +	if (!core || !(core->flags & CLK_GET_RATE_NOCACHE))
> +		return;
> +
> +	clk_prepare_lock();
> +	__clk_recalc_rates(core, false, 0);
> +	clk_prepare_unlock();
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_recalc_rate);

There's no user of this new function. You need to also include a user
so that we can see the complete picture of how this will be used.

If it helps to demonstrate the problem, you can also add to the clk
kunit tests in drivers/clk/clk_test.c.

Brian

