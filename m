Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3E392C48
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 23:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627204; cv=none; b=dm2t8L5R/kbpZkJIUEzM9fE6KbnQRyOs4cpaYUz5jpYmdbDuB9AorSgdOj+e+9bxdsNYgUnDjUQHXOMTxbP9tQHTnAitDN8bWosDuTT9jCdFGRaFHgtqY9TvGY5O7Dg5N8lQulUfVG64v6B6JLz6XM55zwb8Rxwd7qqu7jDXJ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627204; c=relaxed/simple;
	bh=R1t0SeWJx31FxhAVeRYNyR+/ZF45DU4Itnh1FqftXoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJxXmmja1sDa/jhauWeznGn1kjLdCjnNXl0bf9HLi2xOANOnZFPQFH3u6dEW0vowmmVKakQzxedUyRtFPuuHF95hVt8AZAIjaxmyWPFXvJ2M0dACeVaJanPzcavZBQJHtu+sqYUig+sMrmeb+/c7y0QIYx1McFHb+m4LaSQhoIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0V0Y2ZV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3ICntnm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0V0Y2ZV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3ICntnm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778627202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uf2ZZcUAdsYRPJlInndn26AcyIV+WxHtWduO2wceWlU=;
	b=M0V0Y2ZV7DWkIHafJDUHnRbHNwKYSrarhlrrTVB5Nk4M74RFiUJIH3+2dG3x3xn6XAdS18
	hYEaVK7/Qx42RdCXtNkIgMJy1o6+bmDNPU0DLPmThpn86Pzgx/0nUCnhcKdWSWdW7afv17
	8qReDnGNRqcSq3xzn8unVepX4vKB7OM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-9WdD6MhrOEWcJi_GtAFxmQ-1; Tue, 12 May 2026 19:06:41 -0400
X-MC-Unique: 9WdD6MhrOEWcJi_GtAFxmQ-1
X-Mimecast-MFC-AGG-ID: 9WdD6MhrOEWcJi_GtAFxmQ_1778627200
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb04352924so1181764885a.1
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778627200; x=1779232000; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf2ZZcUAdsYRPJlInndn26AcyIV+WxHtWduO2wceWlU=;
        b=W3ICntnmjeDSjG1qFs57FscSVNOh36+oyTtwGnJJTmjzW5tmftkHgqm7zTq02Jm3pR
         EjxCBivCLakWT5iE3Bsu//TmqWoGv7NBvZLgezpSD6x2zND8/TAgo1YvaeKy7lq7RRnZ
         teITgR9FQ0iotWTEpZDvGI8CJP9T+1ZcV5R2EHaeJ64SpzMNTWDXBqxaOXLsyZmF4YZT
         CCvXjIBxuxKt5QajgkqgSvA+gnCHx8KL14fqaS2CmZdoJaoQKQmWgZ48p52ZWVevtudD
         mjP7RUxsDhHpjgnDu9izt9abAZW52zit/M1dikd/5+tCfuFMUbO9fGpsEU86UTDnWBPq
         CEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627200; x=1779232000;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uf2ZZcUAdsYRPJlInndn26AcyIV+WxHtWduO2wceWlU=;
        b=PHFesQaeVAjQu12uvi3zK11EmyOZUZf9ae0zUe0vkWfG3q11VPs6P6IxBQy/qsdTxV
         vqAT1RTqweDe7m2E0oQBVEbO+45NkMyqDkfPRDmXtq34eh7mTReGHZbPpDmKjNmfrPM8
         QPNRfR5+W6hP7LCAj1NWUk1ydZQTQVHL/b/C4ScepIFm/1FG3vBBzUwOSQyiF6BxrJ36
         yiPOJRMGOL2alAeJnV0ZCmFdRDrahFO8Uq3V9VOicc0TX2YpYPLHslclvHluqxpLdo4a
         keqoaEjHwV5wY7CYhNh0LwCzQFf07djzIGU/tmQcWU1ViCLCkXss2zLZu7E01P81Wxo4
         lJuQ==
X-Forwarded-Encrypted: i=1; AFNElJ9d+uDsQoxMwNKgyO1JQ/GrV7QZ1IMrleG2NbBevSmp40XAERgPhfHABXavMiUVPRTQTHDuOP0ok7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAm+0Qlc4L4JPn+POOtbu6kXIrzSwwT933EorWCSjru8k0eMa
	hUQF7lP+rb8lt2oSnQvcoAkB+8TIBJEexdresxhObKdhVyqddy9yhxgZPGCzqHwfA/6qqm/Ndpy
	lTLJZ55h7ukPKn2iaDIY957ecVH+36XKBtuUzjvmi7Al3adu42cIUOWiC1b6bbA==
X-Gm-Gg: Acq92OFju3dk0p4Jj0BE1hDcArs80Ts1Fon9QmUQUv9ViwjKBQfLSu1dftbXuZmXmWr
	m6fd2K4SOPcgiG0FjGnb/C0tlxHTN69GYZDrC5nN3zWlQILI7FWX0vtUfro0s1NlQudBVOkpJLI
	27vpYiH480d19AOIPdutQnUv8pOnUGZiMGIoVSRmjJvIxlDpgburX9DmOK/rxPMXFq6oHW5A3H+
	VY8FGTx/zKvA98zHn2MHVEu9YzopAIYS2NjMdYQoYloXnnFm1CByWf5ZUyCPZMXap641YYiqpSk
	coId2eSkdecUPYrVXRJ/giaHUdPeOrdRYWK70EuwwoiixhZM+QDkJ18+/FoWJQsT+fNAz2zAQAL
	L1bJq21ZF5lTf25HXxfJdhVeaHien+HxLVafGHk8s2KyW7d9PLMWaC/Iw
X-Received: by 2002:a05:620a:1232:b0:90f:c88d:ebb9 with SMTP id af79cd13be357-90fc88deea8mr8437085a.13.1778627200525;
        Tue, 12 May 2026 16:06:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1232:b0:90f:c88d:ebb9 with SMTP id af79cd13be357-90fc88deea8mr8432285a.13.1778627199946;
        Tue, 12 May 2026 16:06:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-90fc56de5easm6787885a.40.2026.05.12.16.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:06:39 -0700 (PDT)
Date: Tue, 12 May 2026 19:06:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add missing function short descriptions for
 kernel-doc
Message-ID: <agOyfYyjWzT0YEHw@redhat.com>
References: <20260512212453.1306667-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512212453.1306667-1-rdunlap@infradead.org>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 12, 2026 at 02:24:53PM -0700, Randy Dunlap wrote:
> Add short descriptions for 3 functions which are missing it.
> Modify the parameter name in comments to be @core instead of clk.
> Use corrected function names (with leading "__") in a few places.
> 
> Warning: drivers/clk/clk.c:1899 missing initial short description on line:
>  * __clk_recalc_accuracies
> Warning: drivers/clk/clk.c:1972 missing initial short description on line:
>  * __clk_recalc_rates
> Warning: drivers/clk/clk.c:2244 missing initial short description on line:
>  * __clk_speculate_rates
> 
> This eliminates warnings in this file except for missing return value
> warnings, of which there are around 70.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Brian Masney <bmasney@redhat.com>

