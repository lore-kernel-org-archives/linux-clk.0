Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F472FF649
	for <linux-clk@vger.kernel.org>; Fri,  5 Dec 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764934545; cv=none; b=g6+gZ7w53ifETS2dztKI7vagxcW5Zn60x5S63Tm7owa++ubg6cCjvZ91+Utgqxjz44RTp2D+x5coeBfvYMNOsuiXaH4b5gtni1sJQDk8ZZxTwF9jV1vdGiFXwO78xHfhyf4RMRlWtHNVWYtlEDE6gucyiDC9pGqdUltNq6N9ItU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764934545; c=relaxed/simple;
	bh=Jzm1bEXUYpHnFh9ZcEKGxsYxoLlxjGYwQ1tCJYuM+v8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuUub+FcRcsHfyBhbxyiv4iUn4quvQMzdJYGvFmYBk0mgmk3Saa1PBtuThAyeM3wDv/NmEr1PKOaz4ggrrk1XRlGV55RsvX0ki3y6OTWAOmWArisOxeXm4+7aIS92Z/lVROjoXEH1zozbyG5sdodkLRa0PsX8zCb9fsBgm2Q6d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkvBvR35; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XbUWHsgM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkvBvR35";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XbUWHsgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764934541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMNKSESp2KhR2u7iq37LU6C6fvZCMOUrQKe23habOVo=;
	b=dkvBvR358674SeC4wDy1v9nlEc8tdhmL/DixkoBvO/FO/DZgMUgiMh6vVdq/PC0smxL6L+
	BX+kPQ70w3kANJ0PezJFmxbhYvyLSTEEEqM+DEE3tBRvN5eccHur0WPVp8E/hdTCAgIeZX
	Es0i7RqWC9eHlAp4kyxQ89eI2br4bv0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-Tc8_U6GJMM23KfuN32sY2A-1; Fri, 05 Dec 2025 06:35:40 -0500
X-MC-Unique: Tc8_U6GJMM23KfuN32sY2A-1
X-Mimecast-MFC-AGG-ID: Tc8_U6GJMM23KfuN32sY2A_1764934540
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee16731ceaso39265091cf.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Dec 2025 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764934540; x=1765539340; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMNKSESp2KhR2u7iq37LU6C6fvZCMOUrQKe23habOVo=;
        b=XbUWHsgMRqgSLB452vf8HUj+wSCicsYF0e7ow9QGi4kJlC9+4D375KuHXMbWPdvlYZ
         Np/N5xZRokrpwcWXh2dLIACjQsn0fRpj3hBos5KBR4fmO44S7z6Q/jvlLKerp8jAG3bo
         Qs0P4Fc0f20Q8c+GMXkz/yUjLSRpCi+5rL9Y3aF3Xxk3NWX9WjheBx2PxqQ2Eq38X22T
         i198vIhIYkdpng88WlHC/IUZ4RZCNx3zNjiYt15l2RefB4+xV8hETxEKd8F6WN0kDVfy
         TYF+m9d5+FRFJEz2sE1HacMQjkpNhUFjgwRaNvqPjbvgFa7s3I270VO1hmev3bnm3xc7
         I1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764934540; x=1765539340;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMNKSESp2KhR2u7iq37LU6C6fvZCMOUrQKe23habOVo=;
        b=BI5uthpQdBzN9fvFujohTWZl+AXPeP2MlkhH3PanirfBFuVQ74ewjzN9PVoHXjYUAF
         pByKOQDcgxlWhOx+FvBmIBJFVBuxUaP6xz6G8CIzrHh7BTvBN+5IvZIdOXxFLlkdnjW6
         WCNYnyKNbpp3ZObDSwygPVLg/gTgD3Rd7xsi8fGxdQDqhUb86iSrrbYb3FfbC1c4ysJl
         EhMDw2GsgzqkXVtBpbU2b5UigDw9VwgJDrx4YFriFlAnO96uTazVpCBIRO4BaFG4B8oh
         IQ5c7E2wuoReZ+r+aYq0WRqtWlW5T9kdcHMIYRZHeAjfoQAi4Htcq0k/S3nWiAnlj8Ei
         53tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq9jLaXkcz8cePlwfr9ylLWfPTYJ15M/RAYxHBHg7DccHUhAvU2Nied04iaYiywKnbp/i/O/tB5Rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhauloWk6OEvHlTohUvZ/yDoAJ28wfPvSZr9yCLVz1YoL8Dnzg
	oLRckH60IFWY1yXbJaHbrInmj6Ug1kUewB6E5JCPNhKOoJRHqklTI7OA7mR61tvJ6HEzhIx9uxP
	5b6BbjgkQWAD3R50MxNvBQF28Erp+qJbxiQpGHPj4ZnWpf+th0eG+BFnIU8nXXg==
X-Gm-Gg: ASbGncvcQh9LPT+caGlfH6oTqj6sXZEa5Q7zf5BPtm1q8bgn+OQ/uqDZo7xNex7EZW1
	LpJrk4GK9VoS0qmLAX2sC8w5I/tTPv5pYhRu7IlPelMuOmKDgxwYKgqNKZaUzIEZVI3wmYimKv2
	jKNsJXT62ngQiThKag/Zen56SxaM0no12dnWSixx+0/4ficr52FG4bsRd8Wooq5KoG1nOc7pS/q
	SYroaN6aX0rry707+/ntTfMARbXxLQuAjRqLdqmlKdBJq6LMymrVOrx7pxYHPO1jV8BKfM7q0bn
	Bs7y+Hn9ebZJbquMrxw2AfCKmBLTk6vd+hr19tJAYuxqfGWKGAOrnWB0YqZAkxmHA16CgnNHlmi
	+g6ViPaGMI60HG42wcLlutcZh8a79bMifAwn0CpdMT7rU
X-Received: by 2002:a05:622a:188f:b0:4ee:2942:c4fb with SMTP id d75a77b69052e-4f017547426mr129887911cf.31.1764934539886;
        Fri, 05 Dec 2025 03:35:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYtLtTV+jrOOLlUAt4J0kXxIGaZvbsF+GW5Ikr3Ny5hO9ethXcJdrLBtX7RmdExo1wPjVblQ==
X-Received: by 2002:a05:622a:188f:b0:4ee:2942:c4fb with SMTP id d75a77b69052e-4f017547426mr129887661cf.31.1764934539516;
        Fri, 05 Dec 2025 03:35:39 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b6252cebddsm368213285a.24.2025.12.05.03.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:35:38 -0800 (PST)
Date: Fri, 5 Dec 2025 06:35:36 -0500
From: Brian Masney <bmasney@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aTLDiK50Me-iNkdz@redhat.com>
References: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
 <202512050233.R9hAWsJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202512050233.R9hAWsJN-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Dec 05, 2025 at 10:21:55AM +0300, Dan Carpenter wrote:
> smatch warnings:
> drivers/clk/microchip/clk-core.c:300 roclk_get_parent() warn: signedness bug returning '(-22)'
> drivers/clk/microchip/clk-core.c:833 sclk_get_parent() warn: signedness bug returning '(-22)'
> 
> vim +300 drivers/clk/microchip/clk-core.c
> 
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  286  static u8 roclk_get_parent(struct clk_hw *hw)
>                                                              ^^
> returns a u8.
> 
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  287  {
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  288  	struct pic32_ref_osc *refo = clkhw_to_refosc(hw);
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  289  	u32 v, i;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  290  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  291  	v = (readl(refo->ctrl_reg) >> REFO_SEL_SHIFT) & REFO_SEL_MASK;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  292  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  293  	if (!refo->parent_map)
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  294  		return v;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  295  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  296  	for (i = 0; i < clk_hw_get_num_parents(hw); i++)
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  297  		if (refo->parent_map[i] == v)
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  298  			return i;
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  299  
> ce6e11884659988 Purna Chandra Mandal 2016-05-13 @300  	return -EINVAL;
>                                                         ^^^^^^^^^^^^^^^
> So it can't return negative error codes.
> 
> ce6e11884659988 Purna Chandra Mandal 2016-05-13  301  }

This was an existing bug in the driver. Since I'm making changes
to this driver, I'll go ahead and fix this as well.

Brian

