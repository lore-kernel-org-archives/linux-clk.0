Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04734753B
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227495; cv=none; b=n3+9eibnwkeljf/LVQ6Rxxn+qdEW0mUsCQ4YSmL6Xg4L3FFUFdC2EuVz3d8StEFODdjDiqHvdBPJea8WFyNf71QdAfaXOw8aA9IaNjlsJFz3DU7R2L5TMGaJVmi5glH/CSSGvw/0WgMG7DIMfwJ38GHxfci+udAUTH5mWaqkOFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227495; c=relaxed/simple;
	bh=MxjZZDZZaEuYiPY927jOxN57562k/MZjNJFyBvG4prg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leyHGn4bRWKi2IFG9WPLRgZTSbKip/aLVNJBmKCASRSqq///OlRd2vk9w+3Zn9w9jammkXzOJ8+bnZnTZ99gvMS6h6b/D0LkHewEdTVFekNG4/mWVaPSDMVrCFnWWO37sy5/v6xdtcrigGV4kzjE+VKU1r/XSIwnrp5Z6/SXQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ayJlZJxt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5r6JxQa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ayJlZJxt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5r6JxQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775227492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
	b=ayJlZJxtgxIpiscjYw+fubbHmBUMY3FKXQUv1WoGsKzBQS6Bt+tCpp/hGmc+o5Gw4kGsxk
	l6R3iiC3VqUks8YDI56JfjT5C3QfNg6pVfGPz2XFkfivFnGNjiGZIMUYbGHsiO1UvKJb1v
	RFEE7+dIQtsrul3mK1hAgFl0MZZk0Fk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-5yvwUX8MO46Oo0Jq10XOhw-1; Fri, 03 Apr 2026 10:44:51 -0400
X-MC-Unique: 5yvwUX8MO46Oo0Jq10XOhw-1
X-Mimecast-MFC-AGG-ID: 5yvwUX8MO46Oo0Jq10XOhw_1775227491
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090cc6a7d2so53524341cf.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775227491; x=1775832291; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
        b=M5r6JxQap+FAZSBq0GEPxSQW0FvWbYodX8dBvnvn6uKNs+d++LuJR/r2kIFm1R2UXL
         4XjIMAhwvuTySzcobvh/I0dHOzbWvkwFEc33zCzTTmc7iyQ5m9lRmBYRSBScIP1NDZtK
         Ht+NEmScv45Pq+2XxVhp3Bb1tBGm3x8L4xZGh7gJWfUKKB1UH4q4Mcdtc5/yGXSHM+6w
         67lmoT8DHU2eyxg07Wn5G/SR2vyeGNoS1lRyD/c94eIBCDsoStmVz+09Ap11X9L2fCPt
         djVKSITd1NB8gp7c1Dxa76BzZZ673ks5ZbozFxIg1eZFJtGsiCMC8Ga0sMeaKTlR9mMm
         nEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227491; x=1775832291;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYCobLYtX3TeLAHy+p2pLXBgriU/XzUui5ACleydfI8=;
        b=kMXIfuiGKcw07nC1K0/XIWMzH+KGIVlrBWHV7k43ML50PMOmAR2+rrgyoRDSFvcro1
         zHOnKTmlpok98zC7NmXXwYLc6/nUWS37CfbXfGyvAA/rSrR9LfOhHmhbjyu2ZX/YUgn6
         UWawzwqBSCbYOU6ySs50frAf6V9vOPWYJmiIS8aG+i6LpBVZtwquoWVnSsIG9TD5QZUU
         JDDWv+KDsofVkN9eNCpwRQgItYPd+nhSW+YPOKJvf/DzotQW50gwQTrlGAnTyVl32gZg
         Mpjs/7xOrH21rvBhrGSZex/Hw+nH0dYrOOJ7zWdlfIll94/F4OMKp5Sf3dUvJ6Uefoqz
         ah3w==
X-Forwarded-Encrypted: i=1; AJvYcCX3QdrQ+546K8MfEm1saeKM+9SCeu+yxLU12rGvTQ3Ce/RO66QNbNwamMWCFtRqtZ/brM43QyrrqCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZp1EJ6BslNZKqCJJE6LpssaLNk25ogBDju+WthdzCM4DNErAq
	7TptH6AOPTmXfz4+t7IkRAZaLvRVjkj2fyUEgNXQM39Zot50r5RIjTntqvKUYg/TbIKSrenr21c
	04zlBYvxK1wHcj5hOexfXsLlWbLeTm0yPXVMPMhBBXyWLSsSooXZ/5Dv6y/mqzA==
X-Gm-Gg: AeBDiespGJe4T5IMuBLLYeEcRAnv1f/D3l4CVsDN/QjQJ1SEcvv5g4P+uC/YzZTZNsv
	gCNwAKwbCaFXkycQanw+RApH6QsY0SUe7PnYb+YX/K8ZhmOhK6dxSPZ8xVwSfC/K9no7duASiwN
	Vuz+kJoqliF05aPQKTTtBaHan6UgRWoA9wN961w1mO/qwhzxTa1oC9nYZYv/IWN8QXGcI+ND45B
	xiRx8IacblgIsoEPTZKkUZfwEntjWZcciAZI71uJbHRvSQsn1eJ1uU2wF0ijrZqbGXGQNhndvjL
	UWRJtSwJoDP/OmMEFLfA4etzgdzhdTWu/KNBv8YkYTXiKdanycZibuu+t9CZdqbGt0C2Jsz/yu7
	a5I7yNnm8ije0T6xq1BflPF5eTrP8q02sBMHFUowS75eTmv6ajJb83SCd
X-Received: by 2002:a05:6214:2a8c:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a704caf687mr51587206d6.49.1775227491218;
        Fri, 03 Apr 2026 07:44:51 -0700 (PDT)
X-Received: by 2002:a05:6214:2a8c:b0:89c:6252:4a4a with SMTP id 6a1803df08f44-8a704caf687mr51586656d6.49.1775227490715;
        Fri, 03 Apr 2026 07:44:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm58197296d6.22.2026.04.03.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:44:50 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:44:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <ac_SX1UJRqiBH2iM@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu and Yu-Chun,

On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		return ret;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);

I should have checked Sashiko before I hit send on my last review.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

It suggested the following:

    In the Common Clock Framework, .set_rate executes under the prepare_lock
    mutex, while .enable and .disable execute under the enable_lock spinlock.
    
    Could an interleaved clk_pll_enable() corrupt the hardware state by running
    its seq_power_on sequence concurrently with these multi-step register
    updates? 
    
    There also appears to be a potential race condition later in this function:
    
        if (is_power_on(clkp)) {
            ret = wait_freq_ready(clkp);
            ...
        }
    
    If .disable() powers off the PLL right before wait_freq_ready() is called,
    will wait_freq_ready() poll a disabled PLL and erroneously return
    -ETIMEDOUT? Is a private spinlock needed to serialize these operations?

Brian

