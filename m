Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF1D2C187
	for <linux-clk@vger.kernel.org>; Tue,  3 Jun 2025 00:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748910693; cv=none; b=JzQrQsdvB1BbMIRqgis5U5eXyWTEQZXzIlff0ySSLc4dyWgXRm5qYuQDoS7DTGIoy4I2gn+iVRp1UmXvS9J7sHXOGgixlaYDZojoOt+OnWDdsSV9CmFECZnA+2Lxlg1BJxTg+3Pe09VhD965eB/BiHxTVlLmuXagup7R/6CNS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748910693; c=relaxed/simple;
	bh=+C0Gk9Lo27j17lR1Om5aDZ1uBMHuV88Of7KaaLuQJvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thKqGIIbq5I4TwRugmNHTJ5y+0Yp2bZEZJOn9/haP7GeyFRuXDEXHdQ1FfL5qM+y26/8qY9fk47COYiUD23kgeg6PddOKM9B48636V32feEhoca3QptZg324Y5QONNjfB5zKu3XRfRIlbqK3wj/GVBMn1TggZxSabkohU7MkLdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BgU67jIg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BgU67jIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748910690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ub9Ld5Og2J794EXigKYKviTvauaVfB+CsjKmCFqc+fQ=;
	b=BgU67jIgYxLqHeQyjEOK90lnDvlanOP8UtLsWPelhkxujk+Zqv79m70cWyvdUgtP4NRCdc
	58zB0zBY55NlEvHJnxLYnj+eeiIw2O/KtYfopXyayoJHEH+E0g2rgRADFpEGs+4326Lcsh
	je1yYcUWvZblwxyV8sewV4a4/KfJMFE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-wLoSceBsNhC0Qg1exBiDUw-1; Mon, 02 Jun 2025 20:31:27 -0400
X-MC-Unique: wLoSceBsNhC0Qg1exBiDUw-1
X-Mimecast-MFC-AGG-ID: wLoSceBsNhC0Qg1exBiDUw_1748910687
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so444591085a.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Jun 2025 17:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748910687; x=1749515487;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ub9Ld5Og2J794EXigKYKviTvauaVfB+CsjKmCFqc+fQ=;
        b=f6MRkZ7ZYVoJXkOhiWIEj9+UB+1hTQmYDYuufv+ucRVSu8xaSRnLv7F6YBNWQ34NUJ
         lp0ozf+g3uk3aMMd42LaILHDAYRHvp2S/XpC5lXJZ0YXszrUNEdg2IHLODpwbpBou8d0
         3LDEvfUB9hqEcWRmpJ991aQW4xFzM6PbAuaOb+tXGxdBC4hl1L/56mnSVbOT44/SxdVq
         k6Io608jPAc4RAIDzZ4zNKR3ZQblhjpUCFW9Dt5MN+EzgqpU4291mrJXaD+2lvub1RDi
         Z4yRF8hsO2wP2Jce/XOsqQxkcPRv4lH2wXMiBlFp6mQaaIUMmJUQzS/a7yY4ilQBiWZK
         kRVA==
X-Forwarded-Encrypted: i=1; AJvYcCUe4iC6eD+fekj0Q0jPlDsqiWA8rOo88Jn6NjIiQVDC8ApCNvpdTuRxb9oEJWsBRyqnfQs7xuLaa8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRNxZYN799gERSgfZjliRd3773F8lCHwrI3zOz8HAuh7ZgivQ
	bSu2+3yKCD93MkCzvTOJaKtAAx8B9b0JDLsyE1gK+Gy94WrMFosL7vc6ozY39GTIbZB3TF3sr68
	XirFVYRozNNGSJHnTXmHMrHCCWNPLCTnT5zYbH97joBHyrFQluEtldsPn/K5wOw==
X-Gm-Gg: ASbGnct1EfQS2aKWSuWncOC+Ti9towEDBpau0SD3wjfzxwhbunD8grdAU31QvvGiABY
	xCm0I7/AiKvUseDGykXvFsWh1CJqlJjTXPMlBSaH9TKRJwvcUHhXuZEGbAgcYKoCmIZ6YgvqpYd
	5zE0pebUfbmAK/jkxKgfXFagjLedgqWIiEcAnBzuaBRHNuFZd4rRv1r4ML23YerYQzuECCUS7fU
	7Cwrz6v8rWW3EoCCgBoFF4ep516XXOsbk9oYw1x8AWeRwFV45XT40FcdPTP/UuI36RpvR7QDZqq
	o4RSmC/oPwIPMYrYeOiAwot/AmRoHPsV1KnxVDa26bJj/A==
X-Received: by 2002:a05:620a:4509:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d0a4e394e6mr2020790885a.28.1748910687049;
        Mon, 02 Jun 2025 17:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXeGj+rAUYQBxhqVmcHl5R5OWVK/TVJ/1hYqSQFU3Oar1jrFtXFjwuXkb+WGyr5ryDc+1iw==
X-Received: by 2002:a05:620a:4509:b0:7ce:d95e:8d9a with SMTP id af79cd13be357-7d0a4e394e6mr2020787685a.28.1748910686549;
        Mon, 02 Jun 2025 17:31:26 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fa9sm726038285a.24.2025.06.02.17.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 17:31:25 -0700 (PDT)
Date: Mon, 2 Jun 2025 20:31:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on
 clk_ignore_unused
Message-ID: <aD5CXNy5Qtbe5cOb@x1>
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org>
 <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
 <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
 <efd38edbed2743a258bbec7e80ff2238.sboyd@kernel.org>
 <16fd590e-7a00-4e71-a003-d6aafa83567d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16fd590e-7a00-4e71-a003-d6aafa83567d@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, May 22, 2025 at 09:47:35PM +0200, Konrad Dybcio wrote:
> On 3/4/25 8:34 PM, Stephen Boyd wrote:
> > Maybe we would be better off with a config option that removes the clk
> > ignore unused ability entirely. Then you can have a kernel config check
> > somewhere in the build process that verifies that a user can't even set
> > the kernel commandline to change the behavior.
> 
> I used WARN specifically to taint the kernel (which would in turn throw off
> any reasonable CI checks). Perhaps we could add a Kconfig entry (unless
> there already is one) that would do the same, and clk_ignore_unused could
> be gated behind it.
> 
> But then, it would make it harder to debug production kernels with that
> parameter, which could potentially come in handy too

In addition to clk_ignore_unused, there's also regulator_ignore_unused
and pd_ignore_unused that should also be considered.

From a power-management perspective, a userspace tool like powertop will
warn about various things that could be improved. For example, on my
Thinkpad x13s laptop, one of the warnings given is:

    Bad           Runtime PM for PCI Device Qualcomm Technologies,
                    Inc QCNFA765 Wireless Network Adapter

I think it would be useful to add a check to powertop for the presence
of any of these three kernel parameters.

I know that power management isn't the only reason for the original
patch, and this won't cover the case to give some kind of warning where
the various core parts of the system controlled by Linux are not
described in device tree, and the system is relying on a resource setup
by the bootloader.

Brian

