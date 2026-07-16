Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDE43C7DE
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223018; cv=none; b=GP9n6qkWvc7Ttuy6I+TggPNbL82vOWY1DSj/v2tox1bSbakfjoJ25gwOAvoVXxlDhRyoTRGpSWi6C/9PWll4NqLTcEGaM641f0UMcWK4wPhra0HODoMMAnTi80S3dt1o5Rnltp5jmB+R7CZZHsGieqlx7Pp/dwF+POXzpWUhaNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223018; c=relaxed/simple;
	bh=znIpRc+TOl5hK8xOuLW8u8SiTaWPKpiddGKsVC+Oye8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+aIUKs6saBAJVvKeMORxVxCVaL+563Swj7jtydLdoEybq9pVK0YVlnr83JtMSxU9eNmCah8PlQE6BYgydobBpak1kjqrupxxBLNJ0GV5u9CWpwPiVjQ8/JjGe3UPdOhByxbWtXuw/KCujiaKXZtSKRmG05MkmdFmajDm7nRdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SMpeJLeR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lR1ao/C+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SMpeJLeR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lR1ao/C+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784223015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCPldkKY5WQbG3wYqrfYXCPADMIMyTj8M/u2E2FHGl4=;
	b=SMpeJLeRDZhH+qHRPIZRhZiRZPgJDxY8oPn+0zz02eDKVJbNaBrQJADv/KwCrTl7IOLEdt
	6lQpsZh0Ci6mjko0wzebBD15jqcTQAYRBPPggi1UIJ+T/s/fRYD52PHVxwN4rorkTnNEOJ
	X/ey360zSRqGaUSA6Fk0L/rryCTBgwQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-kT1NcvkAPTG_q-khAISzzg-1; Thu, 16 Jul 2026 13:30:14 -0400
X-MC-Unique: kT1NcvkAPTG_q-khAISzzg-1
X-Mimecast-MFC-AGG-ID: kT1NcvkAPTG_q-khAISzzg_1784223013
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so69497111cf.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784223013; x=1784827813; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uCPldkKY5WQbG3wYqrfYXCPADMIMyTj8M/u2E2FHGl4=;
        b=lR1ao/C+AH8nlNSo7Dne0bnk3dS1iQZ/UHSxRzsGlJep9ktg+pU5yMx7hr0E2M6iF8
         6IP1TJggqAOg6bdYYzzpx2piEjWFg9QyxLjaP/KCTrIPC71EqprIDKKepZhXejzGuXD3
         n/g0mFh/ttkzhp5gilNU6WXkOPbq/8qEkEKiU8lQtfWQfJeQgsG7VESceTw4bOZ6GoSW
         7oboFAmSjcgMNgkSc1b9pqKByI7Tv8UBlwIkGDpP1ELWYd6t59Xp8bmTUD+v6ZfkaG+E
         LgPQskAQPDxJFJ7LBTP3jdOczv8cYhHodRFP6zEEGCeaRki8f/ARiWn43300osP2Ttan
         9BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223013; x=1784827813;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCPldkKY5WQbG3wYqrfYXCPADMIMyTj8M/u2E2FHGl4=;
        b=O4vQytQyRMTy/BZG9TuYjvjYUYmCs/53vKUbe2KCH8o8BhmLv1p4jRMCxFUe1VWBM+
         8Rjv3k53s4/c/L8Pp5O/oEWQuqpE12GKOq18yHO1881+/7zDxFJaYln1ZAKUaf0K1CcS
         7ZG0EURrAZWlqb37LQGUCdANssbhmbJe1W5Ut0Sr0VJSkLpeuHXvfGIhHCwp4mLBHgFz
         g/t74Fq9ijxtq8ir/1szIF2scsJcc9KFXPWowQQCn586ZzA1QTOdtrxPKZA3KCIh1ca4
         1r/Xt182ni2uuBNftHUpXn7gI8CgXkV7+mNDLctaqxcqb/0jcdcF9rlcL9B8Inb6NrvJ
         Fgog==
X-Forwarded-Encrypted: i=1; AHgh+RrJ2LrdHS/c2h9UKDFpFOIOJMF2iHhX3t5dlcK4teqbYp2qcMhy3IL9FvM82aZQBNtZ1ZDDMPNsiTI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmlx7Baxq80xHrxGbYV78GHMScRJvnzz4KbRGrT1fFMU9bJzRI
	UOplTLxzP+Kz1ziwYrm5+xOyBDkrNktOVH6DmlSj14HNIA/JHieT2NlNIsDkpJjvwJiyDJkMUTm
	30CLx/Doidfr1mDcJjIUq/uMYdlXt9zEzGwl33lhbxOP/wmbEKrmHRHjxgi9zKg==
X-Gm-Gg: AfdE7clORCg97PTNR/Wz25oMJbz6ubPOf7CVCpZUz4Tq2RCNWnCqHBCniCZr+j5FwL4
	pgbwKAriuOq2KWjJ8n6vkeWTUimM04AlPzYqwJLrWTw5MNQhk3y0pifwsxrYAyMLlJaqADqKZN3
	nLFsmr0kbjvXzG01g4/BwRop9uagCs0LhkXYK9Jgnm8YpzLj0QnhJsUDJjHgkf2pkw93dbAzBZ5
	Z8dUpNBcoH11nGx0+sQnYHbTz38/gBolgxOHQEBk6USgdOCPv/gKMfoOoYgr4rmlYhWrB3ilnb/
	g981qzKhbKiEqteUkNdOUbbJid6k8IcUwlcMKBkCpma5WqROeusmpqo6xAPgvbyiVoxUFKWbHZq
	p4llDiHtcoiNUwtCUOuecDOfnRsJ7x78Ep9k=
X-Received: by 2002:a05:622a:4018:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-520b9204263mr6434771cf.0.1784223013440;
        Thu, 16 Jul 2026 10:30:13 -0700 (PDT)
X-Received: by 2002:a05:622a:4018:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-520b9204263mr6434021cf.0.1784223012767;
        Thu, 16 Jul 2026 10:30:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm164561561cf.12.2026.07.16.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:30:11 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:30:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Message-ID: <alkVIP8jfXuVFP5O@redhat.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Jul 12, 2026 at 06:03:01PM +0200, Karl Mehltretter wrote:
> The AST2700 clock driver also exposes the SoC reset controller: it hands
> its register base to a reset auxiliary device via
> devm_auxiliary_device_create(), which the separate ASPEED reset driver
> (RESET_ASPEED) then binds to. That create call needs the auxiliary bus
> core (AUXILIARY_BUS), not the reset driver itself, but COMMON_CLK_AST2700
> does not select AUXILIARY_BUS.
> 
> It builds today only because RESET_ASPEED selects AUXILIARY_BUS and is
> normally enabled alongside the clock driver. On a randconfig with
> COMMON_CLK_AST2700=y and RESET_ASPEED=n, nothing pulls the auxiliary bus
> in and the kernel fails to link:
> 
>   ld: drivers/clk/aspeed/clk-ast2700.o: in function `ast2700_soc_clk_probe':
>   clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxiliary_device_create'
> 
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.
> 
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

