Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA433A9EB
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578221; cv=none; b=cEQh51adhVzlh0/rRgCGe6r7g5D/Dpucg824l2xffUCkUbXTiag+mxN5y2xk2/cDetSS/akoKAxSE0OefuTTSSt1bunnWl4yFQs/KXq6H5uZ5H5EmObinuD5M7Gt4IHU99LekCoWzugSPuctnZxdwYJfs4XsDdmN1uBhTt1JCOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578221; c=relaxed/simple;
	bh=wP0VuBymKjnK2yDnprg9vlE/v6L4WJJ2taaTKlCsFRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/AiQbXJQKOwK87FTXzwR/8Up2znV8RbZt0QHwSdZNOkFGIy41HR31hBRVCHL5LH44PKAgVU0MhH8REKWcFWLRVJwq1+p8jmOcMXrVftSeBaKmM4pGRZIQpNFmCIkBwJ5oQ53txVMid64hYFiLcFq7ykqt+6ttNiI2px5O5rEDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8aLxoF1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kf1wZBLT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8aLxoF1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kf1wZBLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768578218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4zTrolYR6sxi5JH0WGxqRhyi0s61/Mhtp+AU+f8L/k=;
	b=a8aLxoF1KzxZOyyUKELpFfGLGauBuMyUpYNASCQKRAnHq4q0Cnyh7uQbcUlfWqaJzhW9PZ
	3IsHSi38ILMAVkIBQWA6EITE6QWaqC4tZuF5SQ2I3rY/IaJjCh+yTyNi1aRm9EemYeumHs
	dyyi+s0kcJJCE1/e+B+2FQfG/FIeX8Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-OcMCvNIoP-uO_s2D1t9yww-1; Fri, 16 Jan 2026 10:43:37 -0500
X-MC-Unique: OcMCvNIoP-uO_s2D1t9yww-1
X-Mimecast-MFC-AGG-ID: OcMCvNIoP-uO_s2D1t9yww_1768578217
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c530da0691so466834485a.3
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768578217; x=1769183017; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4zTrolYR6sxi5JH0WGxqRhyi0s61/Mhtp+AU+f8L/k=;
        b=kf1wZBLTaSoUA4DdPPCBW+0+7bZS0gr4mGD2c+30Ifwni/6JBKHUVjIMvsTdoRk0K5
         zty/V4H9VAx6F75hqrWq1POP8HqGTOXaXPDVd9kp3pVXsqkZd63YipKa/FfN/vlYoZcz
         s7j0qm/i74tWyd1D8GnDwMjuEe9vAUB8bVAi/6SDRVnFJtlC1G5M2KGlm1OafqY2qfyg
         ECD7GYc1pOwmh915oJB5VHwlYKZOIJqeJI8BLnNaie4TlpveEFvsCg6d+W1hMzJqlSj/
         w1xfEwE//6TiwxQMFIoLXhg8wQOZzw4D1Z5CoU7Sw+a2p0EAI5bkzn4PyeBBuJKVjTkp
         n1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578217; x=1769183017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4zTrolYR6sxi5JH0WGxqRhyi0s61/Mhtp+AU+f8L/k=;
        b=LCk65nYm6SgrCbsQKiu8Y+TUtGtUniBRkNgVYRra4X9poGF6wocFRthL8MF7bcKQWW
         XiZ9f9TmbVeBufe8U6geM/9nMA2BqeaGsVbTZmW6zoaKjelJnrOE5J0Hd/V7inVE3cAp
         fJ3bQriP1opCdM3pc+WvYaPHLhKZbv5wGvD6EK5/EuJin34ILCXkEmK71UTuc1ms3ZlO
         0MiuMLNrhDIi8RC+zQBWtq5P9gzHwkSAZV50b+2bLgm+UjxbW4tCZKWU3tnAlY0XJtC2
         dgkxY6B5FmUWb2B+K2TZTDcTmAQBosfBwlZJObpKLEY6cfciSYxVGJxmyIRMAalUxDa4
         1sjg==
X-Forwarded-Encrypted: i=1; AJvYcCX88MVNLnf1wUhYuiVViXiMjLoW06+mdwFUrmCKfU49/JoECssM4gnleuBbLPKV2s/3THA365RgEqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIB+fSjW22ATuZ5uKZ/LW0btH+Zz+wQDkMQVkuDthVhb3/AiC0
	78Lpt+x+1UuF977coersDDzknH6zehvKjOrURMQnpxuRqfhRfL6k9QslAoJVpqjlP+ac8Uj+VUx
	JcgmFE8FEMjPKMU794naIAb+wVH439vYAK2Ic2RNV6H66n8rWshgtd7J/eo4qOw==
X-Gm-Gg: AY/fxX7fA1Bgplhed3IOu2pt5jO0c0k31KvNSpz55gAyvfHxppP0yWt/LhpJF7bbbQX
	S70Kgc5oJIUwKD6et9kzoSEtz+eNFAHfHgYxIyWDe8pu+17h9nD1G4O+CRTLTwpbpaGMvdIwC9j
	Yq+VzLhp7DxxepfIKs1nV+awIqz2vD98e25qkwVrGdnKL3YP0lqTORsyM/31V0DLjYH5ytjDToT
	hclCTqW/U9Fl7MwWZvYdL3oxi9loDH5NUivUNglnEwhQQ0yJfOoC3ikxlYVnTh0y7jJ/OGylxPr
	yuX01/AkOCP0INai0dE9KScfXdYs2nxaL6qgC2IKbnT/5Dg+n+9JpXD1dBVLywcEImtjiNoMEaL
	zKEk9qxESnWsroKsfouaec9aYeOkfY1Divd/yKWIYCJmp
X-Received: by 2002:a05:620a:46a6:b0:8c6:a508:a467 with SMTP id af79cd13be357-8c6a68d95b8mr438692185a.25.1768578215387;
        Fri, 16 Jan 2026 07:43:35 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c6:a508:a467 with SMTP id af79cd13be357-8c6a68d95b8mr438679385a.25.1768578213547;
        Fri, 16 Jan 2026 07:43:33 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c0759sm243653985a.14.2026.01.16.07.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:43:32 -0800 (PST)
Date: Fri, 16 Jan 2026 10:43:31 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 5/7] clk: st: clkgen-pll: Add clk_unregister for pll_clk
 in clkgen_c32_pll_setup()
Message-ID: <aWpco0qchQyNPB9b@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-6-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-6-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 07:38:45PM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), clkgen_pll_register() allocated a
> clkgen_pll memory and registered a clk. Add clk_unregister()
> and kfree() to release the memory if error occurs.
> 
> Fixes: b9b8e614b580 ("clk: st: Support for PLLs inside ClockGenA(s)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

