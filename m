Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B2035E923
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816420; cv=none; b=tLdGpPgqpT0ewHjbJED2MfTmNUSrrfxU+hPfQv54jTwByVW5ZyTb2TBwlgkwM3O0I3eJxY/y5txDLkeMknOM1qbJua8g2JfTMGnLKO1vNciQjDfPmXHtRWEPIbgxZxym6KZEXVllCdUMUlSY97iw6GXQwURo9fd0X3ssviPQvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816420; c=relaxed/simple;
	bh=YRYeKiGIeRUVEcqtQ37wY7Dmw90+OgfZ3uew7J4z2jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN73G9kCQspaVSP+9cyPHgkz0QOMysBiNta4TLStbqN9I59sz380nU09BDbAc7J21GlQ5GajxAsQSiCWexl1Wp3O0pinf3qYtSJ5oFAQt+Aenj2Z0KbsOq7dh2UVjRbX5FJxZX3ckga008AQMhRWXHW40gGOiquhyBbGo05p+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O6lBDV8T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mCG827GA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O6lBDV8T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mCG827GA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779816417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IOPEqVDY+5err0E81AfsN3PV78PIz3lBGWYzfFDdrGg=;
	b=O6lBDV8TgHs59w08xQ4xyQCm0dcvHiEjPrDsFsan54MNyKJKwFaDzHC6twVvOG3OcySAzH
	lb+WXiz+eUkKaxovjxyH+2/Ai5rFpTzFjnNDQmxyMJ5RnEXxXTAglD2xFUrSxj/xDfJcXM
	R/6MwhAbzN/S+WF+kuNEY0UqzZf9Yy8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-CnygiSjXP0u1dw5RJCb8RA-1; Tue, 26 May 2026 13:26:56 -0400
X-MC-Unique: CnygiSjXP0u1dw5RJCb8RA-1
X-Mimecast-MFC-AGG-ID: CnygiSjXP0u1dw5RJCb8RA_1779816416
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95fd51d5c22so18650615241.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 10:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779816416; x=1780421216; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOPEqVDY+5err0E81AfsN3PV78PIz3lBGWYzfFDdrGg=;
        b=mCG827GABq4znyGKlLmkZzZkDmXnX6CkmkE9wcAgVVhIFNodq78d2wIDeHsMjjN955
         c9w6/Nz/fKMcihIoRq4q0ZI3NiHCNhfMnB9Lu2P/Gx5+pyml6iqhDYgP15QSBbjSziYc
         dv4b57DNh13yb2412aL7nY4pUZF8da2l+sHi76rzFtGoCrbv3byx+rkRfQpY1dZJ4QwZ
         xLzEqu8YnTVdamZiLEaX+7EkllBI7N7GFr3K+64F4F+HCykY4rLoDxCfcTiO4CHoCHFa
         UkSHI8JS2xBX9DaJyer9M0fjpvzqSLqtWoKxwgf+RWto8UgwP5U5frMSkeuaiIpFiB1+
         VsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816416; x=1780421216;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOPEqVDY+5err0E81AfsN3PV78PIz3lBGWYzfFDdrGg=;
        b=QZ7yvR8D8AfoVLIzRxMdO1rAqVin2RHJpqd/r7vpRJ8i0lckiLQBkyNWFN5ZFh52t5
         pzJIhh0ZrGvs2pMw3mzoep0eTCkWzxNksEWZ/2Ln6cfEG4G7AlaBj/8hlinscuIx5GVC
         GUIbFBNLYPAe2i4YaFM6ffiw/KdyQ1xd1H8r/6W0IrR4kqHReAzTuT1OG2j8OleS2zDs
         /jEVX41QixzrhDeP/DL7M6ALaNrsvq+g6n3j4NsfjFTfhBA5rZZXnLbaLCRPqwppSWKf
         9Ab0bOTo7nkFxoNlPPwcNR3BRbbobro6f4A9FZoJZPtc6/45yT8rW1t9+wjlALXxroLQ
         ITKA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZJCuM5eq91s1scrxP7Kse6Irzer7PMWWtw44dIcF2WTwyTyceQ5AxgQdBa9HnJFN3yKTnGvA9h1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPwosML1NgkGxmgCM6UxZ+r91TeFXwoQFPIB1DsbD7ynVIov0
	4CF3LYlQu4NBICVXpHnY/6PYtwGcxrEQPVsG9O+u5uexT1T/fP/CT2WfykfcBk7d11yKrlCo8bp
	IMNlSilOOCfuqeZIbxH83ohTMxJr+dvw6ul9a2eG7erWS+3TT/omTqENcLhNqFQ==
X-Gm-Gg: Acq92OHCPgWmZMqBPHUCDSDM6It8x4diwgjpg9m0bPxzwRqqUFxhkIsJLi5qN2yRuF7
	q54s48TnNFO7i40Ew1KV7pulgswIisduXN7NbAigfpvb7XferLu1sDaMhw7rewF1iKQwpLd+gfQ
	V77b1k8MTmxYycv7XnkKagmbEJcB90jjHKWcNhMi7JGUbc3tnZ++hr5vM7+RocOC16kkjz/ZpHe
	DHkt+fTxHVBH9jVCEcpwUCFAWBfS49yj2xmDvPd7Wk/jyh+u62R5WT9cOuYdoBIiNeltoWUIqYu
	YPp5Z49T+xjJdl8faF23of23eWTSafhiNBoRCjNiD0TGv3nvmloOfmW6nLCE+pyA8/f32atqTve
	1CprdX2y7XO6ewsUmGryAeWlRjzKm8mJETERdHwLWqURStf7fhWc8leD1
X-Received: by 2002:a05:6102:3f0f:b0:62f:5908:648a with SMTP id ada2fe7eead31-67c818f134emr11183111137.28.1779816415823;
        Tue, 26 May 2026 10:26:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0f:b0:62f:5908:648a with SMTP id ada2fe7eead31-67c818f134emr11183038137.28.1779816415083;
        Tue, 26 May 2026 10:26:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc8131524esm145812196d6.40.2026.05.26.10.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:26:54 -0700 (PDT)
Date: Tue, 26 May 2026 13:26:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH] clk: tegra: Support unique names for multi-socket
 platforms
Message-ID: <ahXX3OjBsCTxaM_h@redhat.com>
References: <20260522163034.80330-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522163034.80330-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 22, 2026 at 05:30:33PM +0100, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP which exposes the
> same clock names. Fix this by appending the NUMA ID as suffix to the
> clock names for multi-socket platforms.
> 
> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> future proof against anyone changing the size of the 'name' array.
> 
> Co-developed-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

