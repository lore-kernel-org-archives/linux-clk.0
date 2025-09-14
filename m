Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49514B977
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851377; cv=none; b=esMN4C5DftTJWxO2tFa+dy6Xv7vI8EH29oDML1ldseM8ujG1bcnPE0ZZK9ZUMg4TK3x3bpYJk497UtzZUWdOF6wDuio1lQKjt0HbJm90KAP6dtYAPAnEWmrUpbS/Bz4AXTFBKUA2wTuTK2oYsYFIrzeSEKhJuFeXdCkeaZZzxQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851377; c=relaxed/simple;
	bh=0zGf5IMzfNgoF86x6HEB8LsnJvdSA9phhqHaIyPzjdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLZcSc1S8wKBURx2t+0pf1caolShxtiBGvilG4EwhQEYJkG6wtd7FPX2ysdhGZD+KmTy5NCIx3Z8PeoosGpOKI2VyewsF8bH+SCTG5NAC6Hl5AszyjobIVl5hoXSrgeHVJWhZv+Q39HBFRflMqQNiJb97c3LLHIxYTesb/4k6U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKJweEDP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKJweEDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mhq4ntYmN439CKdGT+d1l8erZ8eBL5gLNqqonKEQuM4=;
	b=jKJweEDPjPwWuCPwnnxIZSvWViNAqJvuHIzVDRbB64hK2daE9EKR8H+D0BeUjBYNLtDTLY
	C7AvxdC7bRp8cGl7agULngGc4mZ28riV4qQuir4WPcqfkUh+ARHH0NkkL+MFwUeQu5Boha
	4BKqtxIC7vCnPEQ8HgVAJoc+lR+8NG4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-P-SF5fXNN6GebLRpEk_noA-1; Sun, 14 Sep 2025 08:02:52 -0400
X-MC-Unique: P-SF5fXNN6GebLRpEk_noA-1
X-Mimecast-MFC-AGG-ID: P-SF5fXNN6GebLRpEk_noA_1757851372
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-817ecd47971so1006825685a.0
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851372; x=1758456172;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhq4ntYmN439CKdGT+d1l8erZ8eBL5gLNqqonKEQuM4=;
        b=ZHENrVlUBG0NUpBsEZT6TFNPtyjdxWW838M797Kd/MhZwj0U28VrUcDSKZMXl13XUR
         Ij9qdEpvYzePbdcHgWf9FsI7ZE8FBgfFZ+R0SIwhiEcn+NJpjezE0bJMEtkc6tJ9OpxV
         Rx1jD4+HUemUi82A/NcwgAM6gLJv3iRSQZDkXWzeprmev5Z8WcbFzllq77881P03q7Me
         RTSbpC0PcbRoP7+8XbQi7oteX6uf7genF8PQvDB1Qa5mpmIoEbWNjt46TGZXtziljB53
         mNczwJ8LZJeUFrdKfqb4gMUzNu/6I3H3pFKBDC5Slf2vTSt37gXz/m/eC7lYfl/SfuI8
         Vt0w==
X-Gm-Message-State: AOJu0YyacvB8L8GyilvkuWnHv+HHSTZjxKdUmBasSYV9pGUtr7fwC7hm
	CjgHeLnWHNss7VV5G0YBUbACq0DmRPIkf1BHTzoIdG1KZb4nxIMK31ZuDaW6s19yc98ZrF8Y8Og
	F8BOpo0le/znAsaULNkOX3t8BmvkyTyD78c8uK7UVOr9IfACyNBubRP4Rw5M+OA==
X-Gm-Gg: ASbGncvz0eachlvLE//Uy7J9fZ+uqOnN/yrswH7tBtLP4sjJbvTDi+OCVFf1Y4sJovc
	5TwFioSazdXCi3F8Ht86+GrbJnoACorcq9y9xFj7BaIvjy1fL+m1uT2wm8MYNQoDH6nILaf2KMA
	5eFi8OnZmWRz9rr+cVJ6MFR/1n+76RM6xtAHAcfGkLpQnzuucqe3ZN8ID+5othCrithwKEqQF/g
	nxHWrdSSYumQnVzTen2Uh7x6wufWKwaCxhdYhI9eEmpImGDF2uDE/DPEtPnqZQongStjb5rHU9i
	LNmkCdw4joa8ubXlNHa4KubX+d6g+r3vDGjYdePTHtPyCExG2br/DXY9o6imrCvXqfRUkvXUIoz
	0uWRK/LLBHZ/luro30CrZhki2X3hsGMg=
X-Received: by 2002:a05:620a:17aa:b0:815:9d71:62be with SMTP id af79cd13be357-823fdeb328fmr1174352885a.32.1757851371776;
        Sun, 14 Sep 2025 05:02:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHddUjBPw2+Eoh4CJBNqL3DRa4XzeYrF/c1LzR0K0PmQ0AzUaqM1uVjIA9fi3fWlDTgnInMRw==
X-Received: by 2002:a05:620a:17aa:b0:815:9d71:62be with SMTP id af79cd13be357-823fdeb328fmr1174348485a.32.1757851371345;
        Sun, 14 Sep 2025 05:02:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b450860asm58199336d6.12.2025.09.14.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:02:50 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:02:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource: ingenic-sysost: convert from round_rate()
 to determine_rate()
Message-ID: <aMau50G_4loSzSv7@redhat.com>
References: <20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Daniel and Thomas,

On Sun, Aug 10, 2025 at 06:37:10PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> While changes are being made to 'struct clk_ops', let's also go ahead
> and fix the formatting of set_rate so that everything lines up as
> expected.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian

