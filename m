Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363232470A
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512180; cv=none; b=gARu1604bcozj4ShdnOaDfuHp0tqbwerIpAKMLSuEqt7IOfXziCOI+BxqadjSdNEm3fWN849lkARymMDNpzAIwmWFMmhCOfg8Rbm6nZDVqrULYoMQPG/TMNiQqZFNsdMuTPlQ/ULu/KkJPvRVzAc7ZZG75DnD2DOVQEogUAScnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512180; c=relaxed/simple;
	bh=pDoOOoRbfnSiYt3NK45esXAiboYelbh9USbQXkCgS20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOFief46lWBNW6UFyrz0l4zSZgAro1sc2DUFRR4UfCwx4filx9ZcHldqm9Tzv9IrlLU0QN0G7IMcD5LMrej0gu4jfsziu6AeChJjq4pwXJi74r3uR0PRL/vQuicvMkCf1pLeVS+benMenz4hogAxY4ULcLdhzKEYSkR12A92JFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DovDn7M/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8P81ube; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DovDn7M/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8P81ube"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6fJ1KMpAkCCaRuC7BCMByjq+rlJoeF9q4cW8hbtF/+g=;
	b=DovDn7M/lp2ONsjgz8011+8qRaC/70kEJ8YpKsGTcMj34tMy9CRJC6o8gjakF4MGS/+bQg
	d+m/IJiByE444mpOtxxgWfGs+qTRHMCs8zdB4DSAfD5IWPwnvUY+nwOR0C08iQW5fZpd+D
	6V0lpZGIrxjkr8hO3m2p9YBqOFqbl0Q=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-qLMhqqVYOSO5Ix-BkzwslA-1; Mon, 11 May 2026 11:09:36 -0400
X-MC-Unique: qLMhqqVYOSO5Ix-BkzwslA-1
X-Mimecast-MFC-AGG-ID: qLMhqqVYOSO5Ix-BkzwslA_1778512175
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b459fa5f76so23989786d6.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778512175; x=1779116975; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fJ1KMpAkCCaRuC7BCMByjq+rlJoeF9q4cW8hbtF/+g=;
        b=i8P81ubedFDYCWI/d54uzWbgy0yjClFlMzy+hcyOYfUbHRqWryiWEZb4od1LguVc17
         dOA/FdQYEZxPjR8I61LNgCCu0SakT42KK/QErdI4GE8wpmh71D56ZYLoFYgmhilVplvW
         BaNblRACf73mp1K+sYVi8n3tgFzET0Jpj6jAbk80hm2O4qWkFUaf1v/O0PxLJdj8jfH/
         OPRbFZbtdnfYuqmgofxUNhvRtpr9l78ja3S3tt0pdd6W5xOFLLKscnpGwiCrEYLDjv5H
         dXwwwrzIWU6InHxZRLJXzD96GWvwkTEM1HOmrnSOfKYy2TCZOYZCi6saoOd5YHD7PBjj
         2zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512175; x=1779116975;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6fJ1KMpAkCCaRuC7BCMByjq+rlJoeF9q4cW8hbtF/+g=;
        b=kK2aFYEkicsGU2PMWRBz2JOPrq+UCe8xfqrZSGD/Waae38bvRwrilKb95ernr5ynuE
         4ZD25MTn6pN/KplwekwRCQzZWfIt8rxyYgUuD6gSz8Y+gmS0zE/Sm0Mq5m9O3T/C3uB3
         JeeS7p2a95AZ5QLd/ULfns6yjc8+B3HkUDMmhsqecSo8M1TAD/TkRLAFB/vlcU4A8FMa
         XTcqy16R8UEM3zNwnO8+NlrAqDiUMQ+MfoVFJXM/jD2H222davYdLYyYEOtHotEz9cNd
         Kdq8m/TaDvsuEzELRWZ1j5LEHyP6TTVkkCV/lncdMQfvblEBfoXWab+rpVgxCWtvroW5
         piog==
X-Forwarded-Encrypted: i=1; AFNElJ88r9XkA9EDzZtVlvGWDVaJPsllFvCyXihZxp3K95nwY0pftg5uu9lL+x6S5FI10SOWPyS/RXq+MEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGDDr3k9jis1kl5G6V8B7AUUsbdYjnBCvbRXGaR4gRHBVv0Pj
	+5SEhRKR7gF04bZHFHnAKvnbASQ41eOdRJ7fCkn6RtNBSq8Rf8bmwPxOC9lOziQdY84RV3xXmfx
	lmJ86jNlh8iBhUbxZPpcJOOy+q6lLbInWREZVa7RIVrOPOrJJdvRSj4+s9Em7A6zj7zRWYw==
X-Gm-Gg: Acq92OFkeRjuiTuPVNuv4Qu89utNXnnlGwmPnC5m9sEjSM+K6h/NkPUrFBf2HHBFnOW
	Mpef9kU0bhnkXWNKFstMkhxL6lWZ4gusWSBTPnp0KVUsz4ULxp9n6zmhe6hBVW9N+i2xtcolPc/
	DqlEJ6+BRnwKbQv3Vv1JsVBYfrqxLL4YY7+aVlmLfQ3O7zPHnIqwn0f53aYotAfVVhsimIP3j8U
	WN+P/SfoKyAlUeTpQ1+Cl9gWG0ln72ubaKMwlz3JE32qIzQaJHV0vcCd/VCpxf0/qhJyrYu2BoA
	6JetoR6mBmbB9hRNkZUomJKNrA6N2w7yewUTXWEKVSKf79yLV+uZjEUCBHqbsLPFclQDXETWrbW
	gAREHAUDGFXLZ+oXiG2HJ2kYi3zU+p603vJ+hBKpF2DthQvWQPT6JN8/y
X-Received: by 2002:a05:6214:4989:b0:8b2:2474:8f3a with SMTP id 6a1803df08f44-8bc449aff3amr377914136d6.25.1778512175149;
        Mon, 11 May 2026 08:09:35 -0700 (PDT)
X-Received: by 2002:a05:6214:4989:b0:8b2:2474:8f3a with SMTP id 6a1803df08f44-8bc449aff3amr377913356d6.25.1778512174525;
        Mon, 11 May 2026 08:09:34 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e65sm96046336d6.16.2026.05.11.08.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:09:33 -0700 (PDT)
Date: Mon, 11 May 2026 11:09:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Min zhang <zhangmin2026@yeah.net>
Cc: Wei Xu <xuwei5@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: hisilicon: reset: Use devm_kzalloc to initialize
 hisi_reset_controller
Message-ID: <agHxLO-sl3pCYVY6@redhat.com>
References: <20260511053216.538035-1-zhangmin2026@yeah.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511053216.538035-1-zhangmin2026@yeah.net>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 01:32:14PM +0800, Min zhang wrote:
> Using devm_kmalloc() does not zero-initialize the allocated structure.
> Uninitialized members in struct hisi_reset_controller may contain garbage
> data, which can cause reset_controller_register() to fail unexpectedly.
> 
> Replace devm_kmalloc() with devm_kzalloc() to ensure all structure fields
> are properly zero-initialized.
> 
> Fixes: reset controller registration failure due to invalid dirty data

This is not a valid fixes tag. Please drop.

> 
> Signed-off-by: Min zhang <zhangmin2026@yeah.net>

Fixes: 97b7129cd2afb ("reset: hisilicon: change the definition of hisi_reset_init")
Reviewed-by: Brian Masney <bmasney@redhat.com>

