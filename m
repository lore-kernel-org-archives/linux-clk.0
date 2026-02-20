Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0032E74E
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771589802; cv=none; b=Kashl4VnGZyyueToR1ySwuG83phBcEF/kSW9fkisipE7n9O8q21gqjypkvej9E3Trb3VJlp2bh3qwNXRo2wa6Tvvqrn6z6qcTZ69jj4C9tddchdO2zd9tKy/7zMn8woPvnDiKPxMqHUgR9ekSghERK+erVPpLXdiF81SJVUoSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771589802; c=relaxed/simple;
	bh=wm76su/KSHXbP9XpFDxWLEEOisiuyvETB5+Pc5yMr6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZiVeaplpewCHeQsfo/XSocq8okMb7QF0L4dmF2K6npOMX/7j55QbE6MIbXYpfvMS0W6672pSeE+8pW/NmkKJRbe9Xbs+3gPqmqfv1Kbg4cqoFXzdTzSveppHI4kMmgQC1bGln/cOpwVF0TuGrDWimGe57v11MPRpwK5UvWdoRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPx6jRAb; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DHTSWF8i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPx6jRAb";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DHTSWF8i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771589800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cLoJ+jp00IG6fGnTItrasTfbATFvyrsRR0CaBc2zB4c=;
	b=BPx6jRAbv77Iz7/pVxMtWQFMJ5fUr0b4VSWaI/hGqt3CTTlXkRsgi6JxiUUFZ1yrxFR41o
	lzUev33fzdVc9hLBkgwutMAzXXCY9rXFo6CNMqvzHgQR61rDoen0eehNDlQD2Tf+L9+XsN
	NatbiM6kNwfzKxzuiP8AB+vXttRwAbA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-52aYilTtPyOcs8xDVaAE3w-1; Fri, 20 Feb 2026 07:16:36 -0500
X-MC-Unique: 52aYilTtPyOcs8xDVaAE3w-1
X-Mimecast-MFC-AGG-ID: 52aYilTtPyOcs8xDVaAE3w_1771589796
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89718626897so222969936d6.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 04:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771589796; x=1772194596; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLoJ+jp00IG6fGnTItrasTfbATFvyrsRR0CaBc2zB4c=;
        b=DHTSWF8iCAOkwxTFEaj08Z9jvgLErR6HZ/Mau6OA6DhMjAKNmQg269fy2yXAtFzQoR
         Qpct3ZdR5s+iH0yvFKsOVg7FdIMDjaqVUZQjkklKnzgavAa7YXbSRvEhMFMXMjmYzSuV
         QZbTYDak3pIMWRYrcbgJq5JBC7ijV+aEDlWBIdNdbrxko2Yt0x6YqjJ914HgaX4fes5S
         KV/weHji/tkKtz5QtCv/FtuSLmCSb/5V5uvL7mZkFS81OlymiIi/IBkHXiytTNnkaJbY
         eEAezAuOARK7Y801WS4etcCG/rdhZdgAqtHgiwXkUlDZQbcQ/ShUQIMDXp/FlOxZ1ZHI
         KYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771589796; x=1772194596;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLoJ+jp00IG6fGnTItrasTfbATFvyrsRR0CaBc2zB4c=;
        b=mlTTqBBMvT4sxygw1dsTEPTh8ZhjGdpqm9WtK4QWErmJWvg7eWrv873q3KD2y9Y6It
         RJx8ovkaMxLfOfb1v+8KfCnV2J1nSt1gVYsne5COKq2Ab3HL3FZxCcbC0f8p2YhQ5N+5
         abyt+rX/BS1cYGXA+M4QNX3Gy1Usjx9kzmELVUNDMbXfXSBMcY8E7GiwGGrvAO6wwiUw
         oPnkBZTAbBS3MyFvAm1LcgMK5Boa5OVrzJwdrJLJH972vAoSGgIGnhWlyQTtK+LXNqIG
         xSDEvv6QjrZzSkonvxhGaFTSlrmHl6Qn06vGJBQl9sdSGCyH1vVOse6oI8jaL/G+wiro
         6OoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeGGShce6VhfHZD45eim354C8PEdeVMzkfqaeZogDHz575419MzTNGgAUHpAM9Zrbz0j+Mc58V0Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgOryO5Ne6l4haPp6rWaRrVukelRv1I/D7gkcE3Z6eAQiwt2V
	uHMB0TUFmzSrZZ/DfCXHAI2w1mWQb1ezcu+87vKoaGLHS61pN9qdLeczEMOIb07RvJMZl76a3Ls
	pFTZsBI5lpiJyfWPLYPY/AMAthY7uqJzvNamR+7KQZBydyigrp1bukcNbSOUm6A==
X-Gm-Gg: AZuq6aLLSK5vq5V+cXAQpgayioi6IHsNMlkWlpw8eJLMgev0tuTgmjq+AYqihbZ+Vih
	6N1xRWpRrD5RUbVbNEcCFICCOJNjfERCz/oWMfREqOxLE6IE6fZCeVIpR85DT3jFyPzWjs4eY5Y
	wJIEJcLZNSZmUJGARcKVTrQCDIEfvq7dHVgEIockhijwOF3A823K9pc47q4HnZNP0dQD+gkubJR
	z2YSGvr0qUZUdi9NLB1r891jqI/WPGCZTMOscmN/3iqpUuuj6RqC2mjzubN4TzK3uIMAsf2KWIS
	TbscPWH/WyzBiz87nG5xFHrqsF0WgYZRYsy5pXOudU9Ov2iyZA7B7FE36Ywn/+M/gx0n8rEZF+G
	fo18j+v5r9RvUn/2RKeZCz3vapiao+cTIl3ElQuuxjpjZ2OVoJmS2SgUZ
X-Received: by 2002:ad4:5e85:0:b0:894:470f:677c with SMTP id 6a1803df08f44-897404af8f4mr315254396d6.51.1771589796247;
        Fri, 20 Feb 2026 04:16:36 -0800 (PST)
X-Received: by 2002:ad4:5e85:0:b0:894:470f:677c with SMTP id 6a1803df08f44-897404af8f4mr315253886d6.51.1771589795818;
        Fri, 20 Feb 2026 04:16:35 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdad6c1sm235678206d6.39.2026.02.20.04.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 04:16:34 -0800 (PST)
Date: Fri, 20 Feb 2026 07:16:33 -0500
From: Brian Masney <bmasney@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, netdev@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v1 1/1] clk: baikal-t1: Remove not-going-to-be-supported
 code for Baikal SoC
Message-ID: <aZhQoY55bwGj8LJc@redhat.com>
References: <20260220082210.2320303-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220082210.2320303-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Feb 20, 2026 at 09:22:10AM +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.
> 
> Link: https://lore.kernel.org/lkml/22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org/ [1]
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

