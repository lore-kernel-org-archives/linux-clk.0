Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ECD2C327E
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967889; cv=none; b=pCVfQJl5fmMnAvitqDIaNcVahoZ/Lxk5If+GO4gP7KFA/VSDIg+l2Rr9WFBWPLxOloz/4a8CVNzE5Q5N5nB0Rm/AJtdkFlHLNG0oULwFgD75++VFiVZYXisvIE2btoqlNHJHm4qi9mXYjl2ARhMi3gFZcOay/FoLkEodjh0DhpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967889; c=relaxed/simple;
	bh=FWabBx1o2JRPXQzeKmabXmIF+PIs3CRXqrX7grDeR4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKLOjzleufn6h0JgDoPKN0qGaNEL8R7OyD17tgbmHv6diBiCKMNFLFLK9aJIT1R8E6mfzmr4nLZ56QxppJzFPX5aC1fsHXr/3/5DOqLf1sxoNXMjXuT5irgpSUYVdHPWX9Vd5rr6Zbv54Uuq2WD5zEYOQ9edDE/4LsMulxXR3Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bfeO5h5G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bfeO5h5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759967886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yYml2VDxH0siTYU9ImG12BR4vPhtEsV9x6dMYi9DuW8=;
	b=bfeO5h5GlA1OTU2OTg5a8KZXJvBYCcXrFdnWRXaU4gKnxtvlGcUdwbzn42Ju/mTo7KDM3B
	CYUKCLdWfNiM39OZ1c3CVROE6t1MjeHve/9lmfGnJCUh7WwWB9Vc+WrVVOwSo8399QDZJb
	2dqY/t+QepgsrgZAx+cy36EmMXX8KKs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-WCt_WCD3NMCcrHC0l7u3IQ-1; Wed, 08 Oct 2025 19:58:05 -0400
X-MC-Unique: WCt_WCD3NMCcrHC0l7u3IQ-1
X-Mimecast-MFC-AGG-ID: WCt_WCD3NMCcrHC0l7u3IQ_1759967885
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-859b89cd3f2so121080985a.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Oct 2025 16:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967885; x=1760572685;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYml2VDxH0siTYU9ImG12BR4vPhtEsV9x6dMYi9DuW8=;
        b=PqhXoAMSQsiPkgjNN5ww02561+cvKNoKG6ZXHgZ/TuyAtcFgpT/E/U6oYriq3fYFlN
         tK+S0tg2qND2wPPNUzQYGIVomv4m4D49niapDiDXg9EoyRBIbuLRqzaNRc+LNG2c2Ih5
         NAAP/13YDkjv94hzoa1nPNXh5fchyyHxZ6r+ehluNtoWgQ+0JQG5aqZ9Z1p3mixAZq3P
         4jme7IDtjpoHscl6pQA23sJlyIc5X2absnCgMsQ/SHzrhq5G7S/zwgu992GJ1wsn+IwS
         JyQsdUWBy5neaANkprL4RDfCUiMfFv289A5P77rZ8l7wWQm/w4tm5Q2QfvtDn9SYvIug
         TI0w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2BHEImjfiFaYU67lAVGanidF0zeY8nOvDp+GJWA2sRIrT/kVaJlwbYnr6r/u/Jv/Haej4B6KBTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hcRBxZpSFAPuSFL5XUZVBzBsLDBfsT1aitQ0I1eJLAEayboF
	984G5c+PbBnRjXWKh9xAXP6RYqEUNW8sEyQsXL4oYd1vtLYcXGS9JID6R3sz1g7PLOAdZr4xSjE
	u08+ubRdKlWge20VutQciw/oo3LFWxjcR6EHfTteh0G1+3wifpvFh87BU6meCew==
X-Gm-Gg: ASbGncs3i3isSlEgPiZrqoq9EBorqcMac8J7v4+Xm44a+mMbZ5H8Fdy29Scq2/mZ1Zg
	OmnzTruUxGtQTXVyCLjH3Uwk4co18ttYXQbzp5u/sy3ULwypK67LC4sN8+GZC+PEvjH739luZXD
	ngTQdeWYKiVDq7xmeSnHSRmqjzoVa9/Clz9i2IuwEO0prxyuy9Ch9nblqUWu6FxSWv4iuGFS3VG
	q4/U2w7GXLSG0mxl7t6CxUnlaUtE1vMgFS+n5TftttOIhYVBPXWylysuME7ulWctbGyx0wprivI
	nyCpRfYb0eBQLsfSotUZ8tuny7G6py+KIAvtsJ8MsEEsJA09ELWSjdcTozFuKMGAscLPKRfazdO
	r41OalUb+VgAZKtXuitWnSrfxd18BSU5kpFiF
X-Received: by 2002:a05:620a:2685:b0:864:1d18:497f with SMTP id af79cd13be357-8835088dbbdmr791584885a.20.1759967885069;
        Wed, 08 Oct 2025 16:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQXcFrO7Er3Q3mBDdQBcLXHQVE93CDbRMq7AeTkxsZVEPnKqRubMgwFgmWShVeh1oXVhT4lQ==
X-Received: by 2002:a05:620a:2685:b0:864:1d18:497f with SMTP id af79cd13be357-8835088dbbdmr791582885a.20.1759967884635;
        Wed, 08 Oct 2025 16:58:04 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca3f2esm87125585a.41.2025.10.08.16.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 16:58:03 -0700 (PDT)
Date: Wed, 8 Oct 2025 19:58:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
Message-ID: <aOb6iNR9T4R9Hp3R@redhat.com>
References: <20251002092036.2504858-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002092036.2504858-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Oct 02, 2025 at 05:20:35PM +0800, Chen-Yu Tsai wrote:
> Clk lookup (by name) recently gained some performance improvements at
> the expense of more complexity within the lookup code.
> 
> To make sure that this works as intended and doesn't break, add some
> basic tests for this part of the CCF.
> 
> A new "clk_hw_lookup()" function is added purely for running kunit
> tests.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/clk.c      | 11 +++++++
>  drivers/clk/clk.h      |  4 +++
>  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..a17d0070d11f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
>  	return !core ? NULL : core->hw->clk;
>  }
>  
> +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> +/* This is only provided for kunit tests to test the core lookup functions. */
> +struct clk_hw *clk_hw_lookup(const char *name)
> +{
> +	struct clk_core *core = clk_core_lookup(name);
> +
> +	return !core ? NULL : core->hw;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> +#endif

Use EXPORT_SYMBOL_IF_KUNIT instead for consistency with the rest of the
kernel. In clk_test.c, you'll also need to add:

MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Since clk_hw_lookup() is only used by kunit, why not just put this new
function in clk-test.c, and use EXPORT_SYMBOL_IF_KUNIT on
clk_core_lookup?

Brian

