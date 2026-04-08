Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1878C322A
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 22:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775687536; cv=none; b=B1Uar93HrNe6hj+RbRaU8w1nTTAbu00HQBhLUm5FODWXQnIZMCpEY2mldl5nqZaRQR8o6meyHKYPnOxcJwUEjEYzBfent5tVqXU1+QFYGIqAor0FZks25zt0sZY1LoKjDoEeAIFylnQYIRlX9TRceVC0gcHR7IGuxGk71+rrzEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775687536; c=relaxed/simple;
	bh=9YURxhx7fNEuUVEkfz24VOFN50gBXwcF/UAJ4miyN6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0Lq/jx9wTd/lKwJITQt1Ob9RGojWI+3cFSRETHiNssfDRmtRrqY7Vu6W1hhWmqeTHbPzIcJ9TP7U1Sm73IrnuudgBSiRbbM+q5+huYnnDmgPYWcwASTiOXdA7uWVw9zVHXzEj15h6PsyN5OvcDNkw9fttxzVOwQtoEJ4tHM2eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LAoWRgcu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yy61Zb2E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LAoWRgcu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yy61Zb2E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775687534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtTJZ2wfNEt2cLQXV6l/PRWSpcHnG0qmiWEptUKrHmM=;
	b=LAoWRgcufuTtLxJng4NnaczeK/vqnqQ3cXtjLyIreTqj5lrv6HcOZ+jZ5C0Q62cHXYbVvW
	ZFym7trkPnUs38wg2pygLHNHXpWz+pYRtBU3T9tAJNBw7O1l0x4ae3PPKnw0EvTHxfZgS5
	rsew3Wvu5C9ED8M06cG95Bw3HK1GuEs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-7gkshCKtPvSxs67qg9Y1Ag-1; Wed, 08 Apr 2026 18:30:35 -0400
X-MC-Unique: 7gkshCKtPvSxs67qg9Y1Ag-1
X-Mimecast-MFC-AGG-ID: 7gkshCKtPvSxs67qg9Y1Ag_1775687435
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cc1d6dbe4so19723226d6.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775687435; x=1776292235; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtTJZ2wfNEt2cLQXV6l/PRWSpcHnG0qmiWEptUKrHmM=;
        b=Yy61Zb2EQApF5zUtYufiZwIB9W7M6J8nIvJExxAX58OuwACVF9X1cc8wRTU4Bjesfy
         L39lPqGJvckBmtcCyNycCBb1NJ2/KErogz52fi5N9ktHh0auw+7WxV/F5twRzIHMHk7D
         pKpzWxpFSmh91Y/vYBH8wHv9/6b1qiiKdLHTd0htSD3tUjqVPfkY24SoAREGLaVHNhrw
         jfZp1KNby/KRZduxWHTFo0PAV/Jd2hxQik4Oodp62XK9tzs7wVBfPFyoUs5/mhq3UzOi
         3zmEtV77xpBqYsvojrl21ken2B+Yu5u5C/UKOF3cdN1GXpgLYXZg23ec/XGqSGP1zPPc
         aNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775687435; x=1776292235;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtTJZ2wfNEt2cLQXV6l/PRWSpcHnG0qmiWEptUKrHmM=;
        b=N2kKjZHWo3+Dzj1n8YsIEzhJTmuXWMPTLpdTJEzqKnap/fdT9agxXJILL8yBBqB1Dd
         Ud7bOBxB2r8KhDKCdCEQ/ySpxYwMAOvZf2cyI3PW9Djoi0iRtM9SX+lc2CuJgAGhdObi
         LjRMPrjJtSt6cNrB4v9c2EARDbXSk7KBjvP3xypZknMfKdZyGv5g/Qd8UGmLsG0qK98Y
         7PvDnGAiy4aqZkQd01UomB0zpwHt+bCZ0TiPtQ8DyXj4prklSv3ch8TZSXZzX9ln4R+p
         lYPxAOLxsB4aOz2vPjh+QEn1cu7SWfLRXjmqSMch7/h1FgtgiSPZXC87sNxS9Tsx+RB5
         aDlg==
X-Forwarded-Encrypted: i=1; AJvYcCWNfYN2l1ZofJkXIQTEd4u5kcs9xAvSmYnzxZVb9oFZXNE+vznl+l1D8N9y1CmhVCndvSyTbKrKMG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/oBNNPLP4jNk8K0yKykPeXNQ02+HSWTmgBfZV6JQVctNAO+nq
	/ykAD2cx5YWh3R8pAUJ5D363qF8QICq/qY8/mtZvcIe2legNlbbAQRLlo2W0q1n3LcqWkliyXLA
	WhuJxjlZhBDv4UfqZeYqySf+3mFhhl1nq77NMXviW5KlcMzDCF4k3ps/ErfXELg==
X-Gm-Gg: AeBDievLigIf2LNtIGmHJ8mBCx9ru8/rISKgaosVC7SFlrs1bPzzRWrt+amlJnQKqU1
	0t0XyxtOldxCG2NhZg1W6/z2B4ZVxvzMhu72i+ApsvmD/v/BORrQSPg2W36ok/Zb7StO1CjjquT
	F1F9svxkaNr7N+Gbc3gBgnZve7guuSiM00gWZ/Mol7BinSlDC04++us/9Aem8tiQcwR5UNrdRlE
	0xNQ8CoDonFUrsI9U8Mser1Yf2l6CIhlqdZGr9eNIepDpa9u5bM3FGllvI0db9C+xkYz4s9HwQX
	CVcEtoHss9EbrQHv5wWgKPOuUvfvOvaHrhBTx63/k0L8VXl5U09zxXhlXD0hi+tRS/vTMdkhx+P
	HnJVaCXB3XxgnHjq4QgA7ImO4bCd8b7dnaTSYn4h2c26QEwTXIm8CNkw9
X-Received: by 2002:a0c:f114:0:b0:8a3:221d:9095 with SMTP id 6a1803df08f44-8ac743038b7mr23717426d6.15.1775687434748;
        Wed, 08 Apr 2026 15:30:34 -0700 (PDT)
X-Received: by 2002:a0c:f114:0:b0:8a3:221d:9095 with SMTP id 6a1803df08f44-8ac743038b7mr23716276d6.15.1775687434158;
        Wed, 08 Apr 2026 15:30:34 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a59323a0dasm184620536d6.4.2026.04.08.15.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 15:30:33 -0700 (PDT)
Date: Wed, 8 Apr 2026 18:30:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
	Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v5 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Message-ID: <adbXBwKC_cNxGlpr@redhat.com>
References: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com>
 <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260407-ti-sci-jacinto-s2r-restore-irq-v5-3-97b28f2d93f9@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Thomas,

On Tue, Apr 07, 2026 at 04:25:08PM +0200, Thomas Richard (TI) wrote:
> Implement the restore_context() operation to restore the clock rate and the
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() operation. The parent index is saved in sci_clk struct during
> set_parent() operation. During clock registration, the core retrieves each
> clock’s parent using get_parent() operation to ensure the internal clock
> tree reflects the actual hardware state, including any configurations made
> by the bootloader. So we also save the parent index in get_parent().
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
> ---
>  drivers/clk/keystone/sci-clk.c | 42 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 34 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d5071223f4c..428050a05de3 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -47,6 +47,8 @@ struct sci_clk_provider {
>   * @node:	 Link for handling clocks probed via DT
>   * @cached_req:	 Cached requested freq for determine rate calls
>   * @cached_res:	 Cached result freq for determine rate calls
> + * @parent_id:	 Parent index for this clock
> + * @rate:	 Clock rate
>   */
>  struct sci_clk {
>  	struct clk_hw hw;
> @@ -58,6 +60,8 @@ struct sci_clk {
>  	struct list_head node;
>  	unsigned long cached_req;
>  	unsigned long cached_res;
> +	u8 parent_id;
> +	unsigned long rate;
>  };
>  
>  #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
> @@ -210,10 +214,16 @@ static int sci_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  			    unsigned long parent_rate)
>  {
>  	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
> +
> +	ret = clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> +					   clk->clk_id, rate / 10 * 9, rate,
> +					   rate / 10 * 11);
>  
> -	return clk->provider->ops->set_freq(clk->provider->sci, clk->dev_id,
> -					    clk->clk_id, rate / 10 * 9, rate,
> -					    rate / 10 * 11);
> +	if (!ret)
> +		clk->rate = rate;
> +
> +	return ret;
>  }

Should the computed rate from sci_clk_recalc_rate() be saved as well?

>  
>  /**
> @@ -237,9 +247,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>  		return 0;
>  	}
>  
> -	parent_id = parent_id - clk->clk_id - 1;
> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>  
> -	return (u8)parent_id;
> +	return clk->parent_id;
>  }
>  
>  /**
> @@ -252,12 +262,27 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>  static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>  {
>  	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
>  
>  	clk->cached_req = 0;
>  
> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> -					      clk->clk_id,
> -					      index + 1 + clk->clk_id);
> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> +					     clk->clk_id,
> +					     index + 1 + clk->clk_id);
> +	if (!ret)
> +		clk->parent_id = index;
> +
> +	return ret;
> +}
> +
> +static void sci_clk_restore_context(struct clk_hw *hw)
> +{
> +	struct sci_clk *clk = to_sci_clk(hw);
> +
> +	sci_clk_set_parent(hw, clk->parent_id);

Are all of these clocks muxes?

Brian


> +
> +	if (clk->rate)
> +		sci_clk_set_rate(hw, clk->rate, 0);
>  }
>  
>  static const struct clk_ops sci_clk_ops = {
> @@ -269,6 +294,7 @@ static const struct clk_ops sci_clk_ops = {
>  	.set_rate = sci_clk_set_rate,
>  	.get_parent = sci_clk_get_parent,
>  	.set_parent = sci_clk_set_parent,
> +	.restore_context = sci_clk_restore_context,
>  };
>  
>  /**
> 
> -- 
> 2.53.0
> 

