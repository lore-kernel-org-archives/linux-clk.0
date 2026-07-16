Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4442BEB4
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212276; cv=none; b=AiWqlqLMolvBA2eqIIR9LiqZd3LXcX6Oxzmjjz6lYqhEEfrHddMuYkRH1bmDA+912SlUwrXS2Eajjm/2EQI78cjMevuxHuQhoq6g4VwK2poyggML314jnL8w3qG+MqcvNFPZ3Gzz9851GFa5i3sMDl8+ni3Zo9eLT7YjYCPfcqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212276; c=relaxed/simple;
	bh=Nxx/2EV2lPJc1PCs/jGP+MILodlt0ez1rkHAhA6QGYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxw6r0cQNFkNDYdJ0OqSRTLpfec2iPVL+M0CI2tFKR+SxetmGTvn1iAEsSwEl+SZEmLUYy01hFyOtN1X928mMrtlT6z3B6+smXm1MqS01xB5nl1WWoqXajtz/Ukgf3rHU55w2y0XRKYzulSVZdRh2aN0PxJgKX0598eBsJ6389s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUYfKCR7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FnP5iDEY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUYfKCR7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FnP5iDEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784212274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nNxG1D+ZjGW+3RdHUwFcLL782nqg2H+vzuXmmfdFhLs=;
	b=LUYfKCR7Cbk5zbBuEENood+kx2T0oq6LAGCTv7sVrQBNIs2ENnd8HN+tu74OoJ91urayLN
	KMtK8MaYfBuGB+22/twoxNMn4IYnLjM6r2aYhPWZuSkR1gB+HqJ7TZUyfoSo36x+DB2LN2
	3ueoU0nr2k4mdocCgvyoZjlgZNwszQQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-4Zv9OLPVOuyi1RCfQK3mQQ-1; Thu, 16 Jul 2026 10:31:13 -0400
X-MC-Unique: 4Zv9OLPVOuyi1RCfQK3mQQ-1
X-Mimecast-MFC-AGG-ID: 4Zv9OLPVOuyi1RCfQK3mQQ_1784212272
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so608606585a.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784212272; x=1784817072; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nNxG1D+ZjGW+3RdHUwFcLL782nqg2H+vzuXmmfdFhLs=;
        b=FnP5iDEY+G85yoqQfX3QDET9Vd5n+8xVEcoy/bRosu+KaxCPvPTRKWXkBUQ6VI8XZJ
         dWLCGm1tnHlSDXMGs/SQBcyGr4HJ0EX+gYngozdbptPHrOfIwe9vEkLFvd7pU7aSEeuK
         CWmGeLCRLTm8c2UcgQMx/MHMLQVM9/15YOLP/k1sHvuTOzPmBR/k3AdDfjz1dRGO4qMZ
         ZnjB23CUKtmND1UkTQ8c8gGrJdAOE4tlZz8/o+5xoLyiLh6KrXm8fS/65MZvimcBppFN
         a/i38ys+aKWu3L/x088Q58NkLp0ij007OsLovW2tnkAfoQWl9iEGcimGRg2uUsltEiyR
         JxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212272; x=1784817072;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNxG1D+ZjGW+3RdHUwFcLL782nqg2H+vzuXmmfdFhLs=;
        b=a5g61cQ1/NgzBNNxEY25IWIQXiJOmKtgtrrlbYVcvRl7KOAV4RZU+2758HyI0+v7Az
         d7PuHEOgkVEGPz2zZ+XEf3uoXLN9Y+W0nMT+7apcFPh7Whiv8KEOgKqW5nl3WVRpUJzA
         LRu21QSDSYj+HckQ29otBI0oJuE5ZHS4gGuqCjE/FyacYpNLxb9JezsLDgj6MKAytmYg
         tLGnCgeebsSvqHapeJ2GiaWg25RlIPw+Nvygr6CiTpNbnVlmhbS23tAnjaw/1hI0giyU
         dUk8PkMJDuz5O7XzYGhWIX7hYZA7ZokoEesixl0dwm1f5G/fWE3ZGs2JGHEBfN1zUmZ+
         NPjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQH8IURuX6eQOQwH1PIJLs1qUxeZwbRglhgWzdiSXdVgNLgaTR4JhiNQW5JCGG/sowf8ob/VLmMrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKN67Z2iNCpOo9W/fZzw4ZDTBAwADj3OggRaZUjC4Z3eF5P8UK
	AxxpnK9E/q3uzirFxgvJPRk4XnH7++ceTHRvUdju075ExpOk1NwJMf6YqqyDqg1A1OtLcyshNio
	X5ZZhiIazj+IzEN9hY6xqG4R/abjigQfrtxfexaZH+o6El3azjjq30fjVstxCbw==
X-Gm-Gg: AfdE7clamJ748mKRBOLS74w/QepqaFIFs5e5Hw2xCcKv2MD7gOxPzUgogV8nnwMvO9D
	m05HLZmgHtRueX53Z93y9or+M07pwPzsWiXcxKzG4PW2kMJ3+WpRiIPIx7ZQ+/ivCKXuFWdFTkQ
	ZR9ZpKujQ58HPenHllWHWGnXiJT7K/5FryeqEyPKWfISn2aE9rlpuW/44vJ1A1cRKvYEu2FJD98
	MHqb6mgH2PfF2WKWe1D2/HNEX1ZvZHJbLM+sELdixvtA6QmFHFQ4d7H1mHmQs0UaecSk+4HXXGi
	d2awDqpUm7eUk0xqX3M+Pon6R1L4LlS2qIINARAuJE3c711TQ/wkVFRdC0ef6u6LiQTOSOs=
X-Received: by 2002:a05:620a:3729:b0:92e:da7b:561b with SMTP id af79cd13be357-930868324d9mr1218165685a.19.1784212272386;
        Thu, 16 Jul 2026 07:31:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3729:b0:92e:da7b:561b with SMTP id af79cd13be357-930868324d9mr1218160085a.19.1784212271847;
        Thu, 16 Jul 2026 07:31:11 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d2d68bsm2007014285a.33.2026.07.16.07.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:31:10 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:31:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk/x86: pmc_atom: add kasprintf return value check
Message-ID: <aljrLM6kPRTiMGr7@redhat.com>
References: <20260714065133.487-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714065133.487-1-yanlonglong@kylinos.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 02:51:32PM +0800, longlong yan wrote:
> The kasprintf() function returns NULL on memory allocation failure, but
> the code in plt_clk_register() was not checking this return value. If
> kasprintf fails, init.name would be NULL and could cause NULL pointer
> dereference when clkdev_hw_create() uses it.
> 
> Add proper error checking for the kasprintf() return value and return
> ERR_PTR(-ENOMEM) on failure.
> 
> Fixes: 1141d9d08184 ("clk: x86: Add Atom PMC platform clocks")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

