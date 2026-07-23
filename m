Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0532DCC05
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817000; cv=none; b=EBRHIrh4hZPBKgcZvQlCw0twbNB+T5WalF7U1aHWn/dpFZww7xf9sjEkldW92t9MOAK+OXwVGpJ8BiS7sb9tUSsGMp+iUS0cGUB3UHi1+fFVYAzzkvUGULsCGukLJ8/YbesgsucpGdlak9I4yLMvXC8ZLGM3/RSFNNid6THUroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817000; c=relaxed/simple;
	bh=WDGGeicfdcEmBFt40jDKkyJ3oVCMWSJWR9BP9gFN7e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvtJKmiF89PuHF+SDVBPkfPXXCNFHGqWlEqBCSVi8UGznlKmreYCnXwxJJ5xQXryXZjC8i4xH67dq5h2WFIxqaHNmDL516J82ubE9eYCRNL4gkZ1xL4hOLO4Xs6Y5Rgz430Blo1/fAfJto9Q5mVFyphFIHY3GQaghC2JC6tHctc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvjrYFdl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Co7QwMH5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvjrYFdl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Co7QwMH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784816997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vB/RHKMaz6FhCewmeGNBXfsP/nmDQs8Y9XfA8B9BYyk=;
	b=NvjrYFdl90E9IdAapTruKJ12AyH5KUMCWsZHL9Nb1efzo/L4BaO8bgGpIZEIWlQzG9DgpN
	yxtBvh4tE3sGAn7ex+LB364BnCLg9mEuCqAq4jgnkXxY4Ud2z7Ydphv1uEGnN6g11j7WSg
	J+FSQGAdsBnRJtsmvmXwZtX3SD4gv/k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-hNXuRNxQPwuzi4twifTbJQ-1; Thu, 23 Jul 2026 10:29:56 -0400
X-MC-Unique: hNXuRNxQPwuzi4twifTbJQ-1
X-Mimecast-MFC-AGG-ID: hNXuRNxQPwuzi4twifTbJQ_1784816995
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a098ea19so77923185a.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784816995; x=1785421795; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vB/RHKMaz6FhCewmeGNBXfsP/nmDQs8Y9XfA8B9BYyk=;
        b=Co7QwMH5TWT/k33arDbZX5s35W/W/8054jogMNlNLBceWHOqLH+qheBXtggxsWhEr7
         3tX42bb/AvqXTIEw6/N3WcPSaYzNVR6qeH99Fj+s82CSPqLlyTz3TJnwbWWilUWkLdwD
         zifSeGgIbozsS2mBlAHJFNnvIJthKbQLsiC/f4zCOOeKtLc0Ku+OFEhJ8Mixp9W7Alyr
         h24KdMBMMGNSAVwbP6BsQ0IzZWQxX8PNoNNGXh4DxsOfpTR9GXd7UjL/spLps3W7kffy
         LcTL8qOKcBHipk5nA2bhaSmMhnA2fW35qbNpEXuH76n2NuyviJZ4/r3PEqaTVEkDKUn/
         zhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784816995; x=1785421795;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vB/RHKMaz6FhCewmeGNBXfsP/nmDQs8Y9XfA8B9BYyk=;
        b=avxQ1xakkoARNK5yFbQ1rP5mOtQEU12INuRA7YSf/joIBbx6QHsZFLdORHJyNxxOt9
         XMk15fNWiMGw/UOWHxZpYmbpycg0ZsOYJnyYQHJ88NfvT+07jXUJ0KEgTwN/3USQkpf3
         4UtcATxgoQPnB7w5yXFzmaTUz/SpNVKFycUf8ddhEIhed8EZhF03fJsVZ/GfLZD2TZO8
         ues7wG9tK3aGWkUMzJ6hahH99O87MMwvl34Yki5Xb3wEJt2hnbKP2PUcCaUythFhRWby
         JiL0U1OL0gdjpPFLoxx+wtmhrMaC+w6c+ccXhDsqhr8xdnyR7EJh2rfg6y2B7GKAyPqu
         XfaQ==
X-Forwarded-Encrypted: i=1; AHgh+Roce8rhAeJrNoKzASRGEQAaH7bIn2Pp2onjEq5MfR3UVVP6Wi+v1uJgXs0S2xKt0Wqgbfel/cKPejk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqSxw9B/q53RH5t8kBuzBq+M6P84etCGF/FnI4kDcjZyOgT2If
	3PedRnDGyAmYftAkBFzlp0ggRrSl87TmoSTYX1yUlryJ6ODuvl2cg8DM6zjrE4asRqBAWkWyGPz
	yal4+N4HfkbMpZ1xtUozvGh1I8s+Aw1xjjulDdyfalIrwwnjbdrSHAua+QvrkHQ==
X-Gm-Gg: AR+sD10SeouMTf/ONXIqd4N52/TJEpBODTBBE+C2qyN26gUqfipkLeC1qpJKMYVITMh
	gfZM9ukUUXFB5KF9JVoET6zIAX8peTNw34d2qss8ljTSfTZKVKgQf8QaWnKnKvkHxhCjhvx6oIT
	UZNQlZYe8+8wyM+WjvsUwXsXXV9C8ZLWLqy1omsY9lclsghZRSUR73FEZUulWlRh50nK2gReY3U
	7LfNEGhbZZ8PwAhENiAYjnTLaRkfiFpqUCKYN0pFRX3y5jSlKFoxURqrh6ZDH9pCXK19nbU0cgG
	tVn3qZzp7xR1uL6jtC+1h2iHNbiHZiAOa/Dt75iMDA27zJcm21I9HPahm+bGvMWy/kXfjlFS6WT
	SSeaPJpFBTI4D0uBBHR+7odiYLDbK6taZKDU=
X-Received: by 2002:a05:620a:c4e:b0:92b:67e6:8ac2 with SMTP id af79cd13be357-931036e32c0mr314663385a.60.1784816995368;
        Thu, 23 Jul 2026 07:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:c4e:b0:92b:67e6:8ac2 with SMTP id af79cd13be357-931036e32c0mr314659085a.60.1784816994731;
        Thu, 23 Jul 2026 07:29:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6879e8bsm429930685a.6.2026.07.23.07.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:29:53 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:29:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, konrad.dybcio@oss.qualcomm.com,
	mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH] clk: Guard clk_round_rate() against error pointers
Message-ID: <amIlYNjWeJQ9tcOB@redhat.com>
References: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Praveen,

On Thu, Jul 23, 2026 at 11:40:47AM +0530, Praveen Talari wrote:
> clk_round_rate() only checks for a NULL clk pointer before
> dereferencing it, but callers such as dev_pm_opp_set_rate() can pass
> it an error pointer (e.g. ERR_PTR(-ENOENT) left behind by
> clk_get() when a device has no Linux clock and is instead managed by
> firmware via a genpd/OPP performance domain).
> 
> Dereferencing that error pointer to read clk->exclusive_count
> crashes with an unhandled kernel NULL pointer dereference, since
> ERR_PTR(-ENOENT) plus the field's offset lands on a small, unmapped
> address:
> 
>   Unable to handle kernel NULL pointer dereference at virtual
>   address 000000000000002e
>   ...
>   pc : clk_round_rate+0x3c/0x188
>   ...
>   Call trace:
>    clk_round_rate+0x3c/0x188 (P)
>    dev_pm_opp_set_rate+0x114/0x33c
> 
> Change the guard from "if (!clk)" to "if (IS_ERR_OR_NULL(clk))",
> matching the pattern already used by other clk consumer API
> functions such as clk_unprepare(), so an error pointer is rejected
> the same way a NULL pointer is.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 048adfa86a5d..8c1ad3d10284 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1780,7 +1780,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>  	struct clk_rate_request req;
>  	int ret;
>  
> -	if (!clk)
> +	if (IS_ERR_OR_NULL(clk))

Can you provide more details about the clk_get() call point that starts this
error? Specifically which driver this occurs in and the exact scenario that
triggers this.

Brian

