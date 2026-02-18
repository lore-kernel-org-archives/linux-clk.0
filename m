Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A620309DB5
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771413273; cv=none; b=tnNtA11y6tceE+v82XLdO0I48eXGC+SDn60SL6Igu6e1fdS20uuLPhkHUp+RmInH9lDtA0iKfSqZucs6Ii2fpbziGkQdiYKYlluNqyOenO9eK18Pa8eg/5G5hR+g2zbKJQ2sHM/4VCJmE1grMkEvVmOH5HeXTKQvAMZSF+w5hkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771413273; c=relaxed/simple;
	bh=T8V75jFHCxdVBIey4SVAYN9nGoaO/70zF+m7YAmtrlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVziPUhCj1ewIcAtRaOPrL4i3qfQJ3qZn9T6+d5YQKJnHkGsDq+r4eIFYvtRMH7AfIA+cNXVQUPgOMe5KlDSr88muRtYOBofrXKGaRAZQJszYhBdQ18XwBw1OOT80H084v7ZSqcGZ0B0yjjE75tgmahNQTWdxnXtGJldaUzGFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KUH+t7OV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nIP+As6a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KUH+t7OV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nIP+As6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771413271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2G2U1r6MNxqXWHe+KrJPIT7PkZtApRJqJedGKd+iJpc=;
	b=KUH+t7OV30HOSW1ruP/9h0J6ZNmhwQNOBcB38cwxwuG5AWWvsjvB/RSsqCL8RGbWEuKMyb
	IeFL4lR4T2YPNzQQt0/JaD+63SJG9RO/Hqb1K535BjV2A55pg3A1dyhUnwo6iKaenrLfss
	YCE59aahICRYmiTNioLuaROphAq3B4A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-3eGksUNcPH-MCukuPbXcmQ-1; Wed, 18 Feb 2026 06:14:28 -0500
X-MC-Unique: 3eGksUNcPH-MCukuPbXcmQ-1
X-Mimecast-MFC-AGG-ID: 3eGksUNcPH-MCukuPbXcmQ_1771413268
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so2908360085a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 03:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771413268; x=1772018068; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G2U1r6MNxqXWHe+KrJPIT7PkZtApRJqJedGKd+iJpc=;
        b=nIP+As6aBHaHJQ2RQJuGN3dY6oIj+yjo+TdN/K6PZPT48V/vcnsmB8fxefvowHSKIh
         GB7qKdfERx9HeIy3nRfn7CqPTZoKUhz5WGdB9Bj/BW3F/WrnDxiEP4yrT7QAjV/+9IHV
         hLUxQFhWT9llEt6Z57b6pFfA5eDHKWRW20NIkX9pQ0pKI6e5gPiM9LB3v17ViY+igx2M
         Defd47i3P90g6XudhJA9axOuiAO6xvKM7BhuRJNqNbSvkE0yA5KqNhQv6YDcq5FCrrEm
         19E2TPauCamhn4TmRyADKiQaT2htYFAG4Dj+nVZ3Y6xNG8OOBKm8xMc9ud9TwOHs0lpr
         TyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771413268; x=1772018068;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2G2U1r6MNxqXWHe+KrJPIT7PkZtApRJqJedGKd+iJpc=;
        b=PquFO5BwgGu8umfl8wCK1s/0IXsUJngPdZAJxtpvJoJ/j9T8PXG3Mlqt/ZnhpwbHvT
         f5R6T/SzzPBYglbVw18icy1ERLPrOoYkavYpYpKcYgomXDeeM3ih00RcbsU/oKKw5Ubo
         pOHhrbJpWxCjGdW7AG44+bHGsWAmfKE7B3J5FNnr3KKYqkl8xrNgHBB5pU2b3Ve+rvNH
         3YGh120/+W+Qo/9kZiJF5U0KDwm8TNgtJpmFvYZw1afZFSMF94nNWZHy6w3e8/NVb4Ya
         IBJ84EAjc56oL7EXtX4IY9MtOGLOgeUEy0KEgsjXJQEazaSb25sq1rNm1KOLsY5dfis8
         ltAA==
X-Forwarded-Encrypted: i=1; AJvYcCUX29u3bBVeHDJpKEa7dXKBqv0ykCtFT0b1wQnWPRAzjManoisBKvRrrkA7nRtij2XBelm0lsWSXK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5Rhs4uEa9w3uxXexIjX0JFaUSaQziFi94A2Nt7eIfiEi8pFy
	LcbkWS1rYlzR/z9tGyzSy5siQDUTvrpO62IxL2EMkP2lFqlHpke0paTL+dr5iyMfPo30qzXMI3w
	kLj6H9H1s/yhh0MB6usYMPY9Qwb/pF5/Drs4hG8oiMVGmajK2QTyGax8R5Uz3NA==
X-Gm-Gg: AZuq6aIiKHmBneNOqcBr7w+EnyZBfNOIazCahgmE9Uvb7AaMqkypS6NpUHHVkKntjNV
	Ytp4ZrqGbUwnGm7TfSSYYCQiBWSWp14ns9itIg2lKcSZNjAhP+N+M6ur7DZKBj6LJov+TvdDQHs
	ryw6dlJKBsbUBEA8/7I9RKODpCxsedjkEqBt5eNl2B2MLkjYk8wwFsystP+LmzCcX8dNyL7TNqa
	GcTI1LoLSsWMgbnVDWJSJLj5GKPwEibw6lvWpAMMwNnT19nmNDUcbMBAbHLTfWlyrsqKdDeAKEm
	UxvteO9qFOWqknF7cFcvXXrzcEh5/oD5S6hghkeQDTjsFeE4L9P0OV0kl6nQjTtLPVEntG/hIGq
	TmIajNttslyGzBB8RaiTVfFDSAOz+YNxN8qpcyI4J8tjHvV0n6sbPML9x
X-Received: by 2002:a05:620a:1723:b0:8cb:4289:6c3a with SMTP id af79cd13be357-8cb4c01f4e9mr1744949985a.74.1771413267745;
        Wed, 18 Feb 2026 03:14:27 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8cb:4289:6c3a with SMTP id af79cd13be357-8cb4c01f4e9mr1744947785a.74.1771413267191;
        Wed, 18 Feb 2026 03:14:27 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0e1bdbsm1749411685a.17.2026.02.18.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:14:26 -0800 (PST)
Date: Wed, 18 Feb 2026 06:14:25 -0500
From: Brian Masney <bmasney@redhat.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: ast2700: Add missing NULL pointer check for
 devm_kasprintf()
Message-ID: <aZWfESmMIw-e81W-@redhat.com>
References: <20260218-ast2700-v1-1-2388e0fe3597@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-ast2700-v1-1-2388e0fe3597@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Feb 18, 2026 at 04:16:37PM +0800, Felix Gu wrote:
> devm_kasprintf() can return NULL on memory allocation failure.
> 
> Check the return value and return -ENOMEM if allocation fails in
> ast2700_soc_clk_probe().
> 
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

