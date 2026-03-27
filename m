Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0863EC2CF
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618255; cv=none; b=VHTOgeNHJ3h4cfEFlwmxjM8DZMPXE9faxExbIZEPWTr/de+Vvkv9rh6CB9IzJgThBtWGTxDZ4c8wOt+FRRwkfaF0x79Fec8RofumEb+kVGEIf4nP+Pfwj9D5sYerZzUFtWStP1qbhxBzvrjPjehnUSy3WCpOBtIcsHe56WnTe+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618255; c=relaxed/simple;
	bh=sghX4PphvCW7X0zgsIy5ejmBRZP/ntzeJagmmu1/j2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qg33JEaRNo9wy4qOnVp00IgX154E0pTxQLkj+oxkrWpEMWPq4JwFgkOS/jcwUAFC3Z+1j/aiD3j7HVqyzVoSa4rx9p5d89knEmQOq+IIxPbNWciJOXXwI7+EHgscADT3dWQIoS/wlttmM0YkNNZuFb25ykzn0/7m2J7ALBgHmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PCtppmWE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m1zuoVUQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PCtppmWE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m1zuoVUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774618253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wp4gmpeShrxSfN4R+47KecY7fqn2WEuVtUlQVVvdg1Y=;
	b=PCtppmWEkGSLOs5DfJdrnNU3FRPSIlCYbwJuFuT7XJ+obNiqcpUkxjC5FXqTteQFUJZ3Od
	ZWzQv//m+namoVAoalAnsgqxeWwOu16l1JpWDeLDXubixMPox/X/k9nH3QUz8jIOKnqP4E
	pAbkZQWXIxgHIX/aprxnmRiHY3Dlevw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-VrNsxdH0Oc-6Sk000qBrXQ-1; Fri, 27 Mar 2026 09:30:52 -0400
X-MC-Unique: VrNsxdH0Oc-6Sk000qBrXQ-1
X-Mimecast-MFC-AGG-ID: VrNsxdH0Oc-6Sk000qBrXQ_1774618251
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfc5294894so673612985a.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774618251; x=1775223051; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wp4gmpeShrxSfN4R+47KecY7fqn2WEuVtUlQVVvdg1Y=;
        b=m1zuoVUQTQEbtgHXErYPLubyfOS7lDcl9FCpxOHSvqpUPAZmRZZPUB50j/E3/FVVwh
         wBYIqlKnIhwm5vEluJw3OrWmRgjcTpMEA8s1NfAj5McAoePs0y8GsR3bhq9PYm2WhRR+
         gFG8jq0qzGbiC6BTxajqBuLDsBBg3Og9Py38ZbvwidZdvdFWV9UJNTYrHqURrh/tnqTq
         gj2OThnlQ3AVBVsUsSMQRE9WdAxcTNlRHl48i8socNitTq4HPP/RL7czoi3PJns9EGJl
         hfDP00ftfi2/wFbnPM+7Whmn+Tcs4u5qsBMmahTlKvFg9DQao0JW/evRQQC9zjllTPn+
         cCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774618251; x=1775223051;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wp4gmpeShrxSfN4R+47KecY7fqn2WEuVtUlQVVvdg1Y=;
        b=ic1A5swYMW3npkqGhM3KnfcCmLwenbMX+5E6NktuECcZQH9pLVlHDcXjtdT2xTQzVT
         PTc1P2DaUsPk2O0xqMwDtKCc4hWl7WVFEPhi2LV5zS/YuaUIjBSObZTqmuDUMg+yGaBN
         SObojfkVQI+QksisxlWeUbaiiB0nVqu4BGLBXOuO5YfuynPxSrOheGehKzvg1QpCfepx
         UM8SDcbR3my4xzr3O02dtnhSsia6s0xL6M1dSj3u+Ff0Khn6DnYIFpCCVAZkvcyeP+Lu
         eqb6Ncul3q1QXJqrsg7qWklHMnQeUvcqdvcDDIFeoQN4OevOR49uxS9BtoNRVfkyXlf+
         5yyw==
X-Gm-Message-State: AOJu0YxSMHy/iCNkz60Lksorhefk70GDCifFEmCfte59lBSv031qPaMW
	BBuk4EGA/ivg96IYz72RkynbZ8jiSYrxbfuhsVPRBsoB03/v8FaI+kdZmLqS+C3E83I3VgcWl5U
	5YwVDryHL7IWMl71woy3L4ubRCC/nqPn98J/lJJX53XunNefKFjAWe/JbMNSqCQ==
X-Gm-Gg: ATEYQzzp4o9wefAOiSv2FwkGhPrwJFKZlCFx2MZ8uJhWamKnrEOOC7t3J1jhLjECM5f
	JnWECUoA/Yr++e15tMW4xtzqtcynmSPTD/SvXycVIrrdVBevOY0nUpRu3282h+gjHSmTwxE+l9z
	scRAOYtGJg2IQrCNS3nc/UheW3ihq8Akr1+Xk+6++4buRATYRkE1jxjDG3NPPzAC72x2IePzq7z
	0He5afCPA3+IW2zxSAvsu5TjCtr6S3QeQBc1uzcIDvShqKOGXXA0L5/6SPcV4A+BM06b/mhoK6f
	4jJriSxi1BSaRePhGW5EJpxQECFpmBH1SCG7zxlM6GlGolQdWjvxrutdZzDugX01l2LMw67AFvI
	0lUQ0imVV8mhJawLndofJSGMG9Oz7EjVMtdgNOzt/k8FCw2PQ6Q4PgkU/
X-Received: by 2002:a05:620a:468c:b0:8cd:a76d:6305 with SMTP id af79cd13be357-8d01c7bd635mr314484985a.49.1774618244642;
        Fri, 27 Mar 2026 06:30:44 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cd:a76d:6305 with SMTP id af79cd13be357-8d01c7bd635mr314431985a.49.1774618239539;
        Fri, 27 Mar 2026 06:30:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e4cf112sm500417285a.23.2026.03.27.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:30:38 -0700 (PDT)
Date: Fri, 27 Mar 2026 09:30:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: move core flags into a new enum for kernel
 docs
Message-ID: <acaGfUueAm7lb_2x@redhat.com>
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
 <20260325-clk-docs-v2-1-bcf660e1ceb5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-clk-docs-v2-1-bcf660e1ceb5@redhat.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Stephen,

On Wed, Mar 25, 2026 at 07:52:10PM -0400, Brian Masney wrote:
> Let's move all of the existing clk flags into a new enum so that all of
> the flags can be easily referenced in the kernel documentation. Note
> that I went with name clk_core_flags for the enum since the name
> clk_flags is already in use in clk.c for the debugfs interface.
> 
> Note: The comment about "Please update clk_flags..." is included as a
> separate comment so it doesn't show up in the generated documents.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  include/linux/clk-provider.h | 55 +++++++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129453c241f1b1755f2c2f2a7ed8f77..cb167c17c4f79cf438a26bb113b4968d0f223468 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -9,29 +9,42 @@
>  #include <linux/of.h>
>  #include <linux/of_clk.h>
>  
> -/*
> - * flags used across common struct clk.  these flags should only affect the
> - * top-level framework.  custom flags for dealing with hardware specifics
> - * belong in struct clk_foo
> +/* Please update clk_flags[] in drivers/clk/clk.c when making changes here! */
> +/**
> + * enum clk_core_flags - framework-level clock flags
>   *
> - * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
> + * These flags should only affect the top-level framework. Custom flags for
> + * dealing with hardware specifics belong in struct clk_foo.
> + *
> + * @CLK_SET_RATE_GATE: must be gated across rate change
> + * @CLK_SET_PARENT_GATE: must be gated across re-parent
> + * @CLK_SET_RATE_PARENT: propagate rate change up one level
> + * @CLK_IGNORE_UNUSED: do not gate even if unused
> + * @CLK_GET_RATE_NOCACHE: do not use the cached clk rate
> + * @CLK_SET_RATE_NO_REPARENT: don't re-parent on rate change
> + * @CLK_GET_ACCURACY_NOCACHE: do not use the cached clk accuracy
> + * @CLK_RECALC_NEW_RATES: recalc rates after notifications
> + * @CLK_SET_RATE_UNGATE: clock needs to run to set rate
> + * @CLK_IS_CRITICAL: do not gate, ever
> + * @CLK_OPS_PARENT_ENABLE: parents need enable during gate/ungate, set rate and re-parent
> + * @CLK_DUTY_CYCLE_PARENT: duty cycle call may be forwarded to the parent clock
>   */
> -#define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
> -#define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
> -#define CLK_SET_RATE_PARENT	BIT(2) /* propagate rate change up one level */
> -#define CLK_IGNORE_UNUSED	BIT(3) /* do not gate even if unused */
> -				/* unused */
> -				/* unused */
> -#define CLK_GET_RATE_NOCACHE	BIT(6) /* do not use the cached clk rate */
> -#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate change */
> -#define CLK_GET_ACCURACY_NOCACHE BIT(8) /* do not use the cached clk accuracy */
> -#define CLK_RECALC_NEW_RATES	BIT(9) /* recalc rates after notifications */
> -#define CLK_SET_RATE_UNGATE	BIT(10) /* clock needs to run to set rate */
> -#define CLK_IS_CRITICAL		BIT(11) /* do not gate, ever */
> -/* parents need enable during gate/ungate, set rate and re-parent */
> -#define CLK_OPS_PARENT_ENABLE	BIT(12)
> -/* duty cycle call may be forwarded to the parent clock */
> -#define CLK_DUTY_CYCLE_PARENT	BIT(13)
> +enum clk_core_flags {
> +	CLK_SET_RATE_GATE		= BIT(0),
> +	CLK_SET_PARENT_GATE		= BIT(1),
> +	CLK_SET_RATE_PARENT		= BIT(2),
> +	CLK_IGNORE_UNUSED		= BIT(3),
> +	/* unused */
> +	/* unused */
> +	CLK_GET_RATE_NOCACHE		= BIT(6),
> +	CLK_SET_RATE_NO_REPARENT	= BIT(7),
> +	CLK_GET_ACCURACY_NOCACHE	= BIT(8),
> +	CLK_RECALC_NEW_RATES		= BIT(9),
> +	CLK_SET_RATE_UNGATE		= BIT(10),
> +	CLK_IS_CRITICAL			= BIT(11),
> +	CLK_OPS_PARENT_ENABLE		= BIT(12),
> +	CLK_DUTY_CYCLE_PARENT		= BIT(13),
> +};

I just checked Sashiko [1] for this series and it has this comment:

    Could converting these unsigned long bitmasks to an enum create a silent
    type-safety trap if flags ever reach BIT(31)?
    
    The flags fields in the clock framework are explicitly designed to be 64-bit
    on 64-bit architectures (unsigned long). The BIT() macro evaluates to an
    unsigned long. When defined as macros, operations like clearing flags
    produce a 64-bit inverted mask, perfectly preserving the upper 32 bits.
    
    By moving these flags into an enum, their types are implicitly downgraded to
    int, since the current maximum flag BIT(13) fits in a 32-bit signed integer.
    If the flags ever grow to include BIT(31), the enumerator value will overflow
    a signed 32-bit int, causing the compiler to type it as an unsigned int.
    
    Applying a bitwise NOT to this unsigned int will produce an unsigned int.
    When this is bitwise ANDed with the 64-bit unsigned long flags variable,
    the unsigned mask will zero-extend to 64 bits, silently clearing all upper
    32 bits (bits 32-63) of the flags field.
    
    Would it be safer to keep them as #define macros and use a DOC: block
    to properly document the flags using kernel-doc without breaking type safety?

It's up to you how we should proceed with this.

[1] https://sashiko.dev/#/patchset/20260325-clk-docs-v2-0-bcf660e1ceb5%40redhat.com

Brian

