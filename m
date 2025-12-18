Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C9420B22
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 23:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766101047; cv=none; b=XbUuOY4p772iFc5m8yV00O84MjEC2DRMs1bKaftpYwsWOzKGnAgLE6qxzZfpEYBk0vwFld6ksFqdUOVGmNtT8pyIJ11Xw9eESAS/vAcmqrRzVAlY7bQJsJ4Tu8X/hKALIQzlPfitAaRlRxC7vxwKuYJij7txA3qvboipBLnh7Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766101047; c=relaxed/simple;
	bh=xrSMLIzsznJyXKpBxy2WiFFTsuEi8RHkrAWj8MUnxYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=on9daalxqX43LH1Rr+7Xvucg9mbJyXB7E13O5ROm66MSwrRs7NzA8FdnGgPYNgUKP9n3JmJfrL4AiHaI2LcrrDjlJPHT/wsXINCcWbogkeh5BkMGP9w0U8BtORCXXuKrk/DS9W7R+CrzM/XSF6qmoMcYrIcMFRBWXbrcIPOmtA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bEjX6jNQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghN4aU3/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bEjX6jNQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghN4aU3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766101044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=taL4VecI32GOlELm8+8Vnt26fKCO2BjXM3Lzuu9k69E=;
	b=bEjX6jNQ9YVK5N6BE8QwuKMKN09IHvdWm5gskXjYbU8ccNTMzMO5ofTwVl/bT7byXs2k0n
	djbROJznMLsdcuxMWEtpbH4/DblqZAWii71Pv1+IvKsfHjuUZju8mv9/GT3Ebp7EfkCN3o
	u/5AuwSvVHRgAQ7K3agwGl8M3drYgO4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-Xy6EJxpOPp6kX8ieP9q0Yw-1; Thu, 18 Dec 2025 18:37:22 -0500
X-MC-Unique: Xy6EJxpOPp6kX8ieP9q0Yw-1
X-Mimecast-MFC-AGG-ID: Xy6EJxpOPp6kX8ieP9q0Yw_1766101042
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a32bf024cso12563676d6.2
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766101042; x=1766705842; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taL4VecI32GOlELm8+8Vnt26fKCO2BjXM3Lzuu9k69E=;
        b=ghN4aU3/blCCHiK67/oqzMlWTd9amggWI6uzjyYYWuK6OptDfnzENd+HA4hnggrIyM
         jVGjISZODF+4VF94SLI1rscxeFmbn2HEcqmeN3rMfXSzilUjtsC3AKyKVG+eEWyGDORd
         2V2uHT+PP1PB5ycuU5G1Pp2DjZn0qJqpcwyidFeoCfLfBcKHUPipmqGhuRJyZbkQL6Kp
         sotIfBSSdeSE5U3h8PP835xpdKmxQ+xE+ZJqHCQ+oh/xe4qwKa0XAtQBLFVU+fP8gSnw
         +d8DnPX3pexQYC2AyvNIzax2JwU8StOlkF59PahoWZuep/MyDGE78Vz8eMpJ1tk9HMFp
         lOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766101042; x=1766705842;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=taL4VecI32GOlELm8+8Vnt26fKCO2BjXM3Lzuu9k69E=;
        b=lwbbnN9MCthQCfckvuVK0p2tszdYZxPDNalLKy2etB4h/7dFqtx8E8jbnw5wL/j7nj
         lSbkHRoCOh2X1tEgosAeCMRnd41uj4OqVeSo0tjg2r6WhuZVCLC1tbq7ycBuTMKFdIwO
         13yZQCoK/rfw5wj9OwCBZ8Y78gm4QVc7Qp6J6fGEa4b7oTmMRXyg2/H9A0UTQdNH5iBX
         5X92oOSF5+3afN8A/sVkm3CmGND7jHEk1r3yzbfFaGNI9++4UMxacVaf6sBYK8S+c2NR
         ivkf2X2VkGVyjUlC3a5WA0WKsa9tU21b5V3fKnuy1W73hfQYRjoDgeZ22xOR4XhmD68g
         w1aA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vbeuccDs4nVJ5C7yewtzgCGu0vCau5/W2nV6wnJBnGHR6brmDduvfaDqBvme0FHqaE9Xf51tiVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfnwZUssQKMCYAsbcIw/TSOx17UdWIHuUmH9Qk269XgI/JjIw
	svZ0Ud+idQoKXHn5buN4RDDteQK1nViDWCHep2Gus0JEqFkFe4q5YZ0JuW7GcKo2OVnHv7zGeIZ
	tW+DWzuM9QX1pzt0S50G+OwiI1VZ3lockJAnnEbZc4wWD2Cvb63lemqCceBqO4w==
X-Gm-Gg: AY/fxX4I5Wk4rS6rvt7buZjg0ULuXQBxfHUERqXpim0GqiPz1GMZN0iSjmT2N9hfwrH
	WHcruYt+qJrZs6E7FLJZboEgl7sEFSgtBebp1o/Jd7Fg/MU2vW/9/LR0C/iDaznt1QdBC3oEegQ
	TF6RzHBzAmMEFEgStrt0gAmtHmMeebRsSrE6WsKqsFYgNI89c+FPig9MSK4+FCAxD1B1bVpobCh
	m27+gY8zOAKQBmSg7mFPFtNiQTGSMbi/KMPMJ07/do6rGlgFdQdcxulCoAhU8dHvgGyGnkJmmUZ
	T7VN5ezgLoFkZOVa6OOnxgnDfXA4LuY9KwkMEYt51Ulj4KcE15lmq9pklTDfrQyxuqV2pDzRhtS
	QY2JyuFg=
X-Received: by 2002:a05:620a:2845:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8c08fbc8df3mr229402685a.11.1766101041957;
        Thu, 18 Dec 2025 15:37:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3jIAaZOF2kHstHYRyO1BtEzZDtmYfFo47TmQj/apy+4o6oNz5pTegY6y4DTnGxbC+K1Y2Qg==
X-Received: by 2002:a05:620a:2845:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8c08fbc8df3mr229399685a.11.1766101041544;
        Thu, 18 Dec 2025 15:37:21 -0800 (PST)
Received: from redhat.com ([2600:382:812c:5c2a:d26d:b7f:4624:dd34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973efa97sm54606385a.39.2025.12.18.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:37:19 -0800 (PST)
Date: Thu, 18 Dec 2025 18:37:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/6] clk: anlogic: add cru support for Anlogic DR1V90
 SoC
Message-ID: <aUSQLB1fmYgQe_Fg@redhat.com>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
 <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Junhui,

On Tue, Dec 16, 2025 at 11:39:43AM +0800, Junhui Liu wrote:
> +static long cru_div_gate_round_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long *prate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +
> +	return divider_round_rate(hw, rate, prate, divider->table,
> +				  divider->width, divider->flags);
> +}

The round_rate clk op is deprecated and I'm really close to being able
to remove this from the clk core. Please only use determine_rate()
below.

> +static int cru_div_gate_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
> +{
> +	struct cru_div_gate *div_gate = hw_to_cru_div_gate(hw);
> +	struct clk_divider *divider = &div_gate->divider;
> +	unsigned long maxdiv, mindiv;
> +	int div = 0;
> +
> +	maxdiv = clk_div_mask(divider->width) + 1;
> +	mindiv = div_gate->min + 1;
> +
> +	div = DIV_ROUND_UP_ULL(req->best_parent_rate, req->rate);
> +	div = div > maxdiv ? maxdiv : div;
> +	div = div < mindiv ? mindiv : div;
> +
> +	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
> +
> +	return 0;
> +}

[snip]

> +const struct clk_ops dr1_cru_div_gate_ops = {
> +	.enable = cru_div_gate_enable,
> +	.disable = cru_div_gate_disable,
> +	.is_enabled = cru_div_gate_is_enabled,
> +	.recalc_rate = cru_div_gate_recalc_rate,
> +	.round_rate = cru_div_gate_round_rate,
> +	.determine_rate = cru_div_gate_determine_rate,

When round_rate() and determine_rate() are both defined in the provider,
only the determine_rate() will be used. Just drop your round_rate()
implementation.

I didn't look into anything else on this patch. This showed up on my
search for new implementations.

Brian

