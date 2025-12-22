Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855872C11E2
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 18:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766426991; cv=none; b=gBt7RUT2LRfPfPUDNswS1Ob2N4Ph9Qwd2xhuiE4wIuql0+/xy1VpyYp4snW3S4pmpkJn5wt9g4HnJV5gUvyJJidYA1OZuUZdb1QYMFYrr/xKBsUVhxt19PNEh4/wmhDq9EHlHape9LtkBIRyyUCG9dwRpX9dkkI6dHiQRv8/4/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766426991; c=relaxed/simple;
	bh=QwG/0FxDY3hM4dlUwGFQgvk8sgXJ2bZfYuW6qjGqu74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi6NBCD61ShOvF1eLhIA/qVB5/gggsB6Jtt6A8suebrym3Hpib08IYw0HgT536uy35ChKvybmIiOkhozUOZ3E5Hq+CGQzeLP1HzgdM9lkZ5Y9UpsNW+KP3QFKbSpQPvIUQSYQ6KOi+Rmdo4S4eTkeYDRbiA4zhK+TE7ww/MNCs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BIl/v2FH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7ozkFH/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BIl/v2FH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7ozkFH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766426988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
	b=BIl/v2FHp1rvioOgjFCfRfYHJQDusr0YFhHuABEV0YQ3jacqvlT+MJQ+91VUr4S7+yyLQ1
	IP9GIwnyWS/SkeSs1yWOKvwnSEPXC3ypdeX8/FAoaQhMMcIkMLqFEfekrGfbfpTcDWvbZs
	esEzUPaMAFZMjuQDuyuqQNy0hfLzjSc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-R6LNgPZdOrezyUfq1vqtKw-1; Mon, 22 Dec 2025 13:09:46 -0500
X-MC-Unique: R6LNgPZdOrezyUfq1vqtKw-1
X-Mimecast-MFC-AGG-ID: R6LNgPZdOrezyUfq1vqtKw_1766426986
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1dea13d34so92602721cf.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 10:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766426986; x=1767031786; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
        b=K7ozkFH/9F/8KKKYkBH9LfbQrcLUkBc4lR725qSn8TN5JWPZxUAvgU/Tjf5M2bqYHD
         fFbbixuxn3f9oj8WXsHjiUxA+7ubWYco0LQWrsUBAdLHVvtwdXvXGywSXqlamdoAltUs
         s+j2wO4y8/xDAm91UTAd6GVl92+7lzEyuLBbhIoTO/8JPGPjIAGq5vcJMF5n4x8GfUon
         mkS67AsFebL9f06uPitsBTcHD8yVfTIP+AbDH0utnpqmlQaHL/5ZFEchAdG8BMQsmGdS
         RG50mkHpo61/oOhMx/UzgY1V2Q8svfd8LNNDrkY7OnU5aXbMn89c10EY4eArNMKGbo0n
         KZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766426986; x=1767031786;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MPZ0+lXn26JACnK/1Bt2AJSyVQiGzIeO7aL1qutLK8=;
        b=lUQKcGtuPx31KGGP8NY1Ww9UebpzP+7eKFKPOXvQJ8h7wKdHAc3RyljNtBwSh7hTOE
         +Zx8u83LK4tsHHevvpfjKS5y730VcA4ywYiGe2YjyuVMng8rfcy8tQ0E/hN2Ql028Sxj
         F9O7wOkpPwXFSxAFN7StA2K+oTPES+dEZ6+Tg9caCdW2RG25AMlsgdgDIQqGT0MKldfo
         ttbzlBu0YjClHRPPjbK34HSB8cUxm+Mj0F4bXucHg0A4qpGVwBE6FvjT9AFXOiUF5KQY
         rBfyNZn8gqf96evkIguUVZ2SSNQZBGc4Mt/ZpqlyRe8bIE6WwnYP46RZrrZQ/XfHB3DQ
         UcOA==
X-Forwarded-Encrypted: i=1; AJvYcCUntKrhGYvTkZj8Mv2kLBS9HgPLuaYLE49PgogiggXRrq+sK5wY3dhWtTHNJjk9/2Q0BVNYsebXUOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQdL9KTyPmFq1HRI9rFc6LbbX+yiDmsnviuq/TjU9SHrG0TPx4
	lUqDOYWadr4DFyPMScEpI30Jo8iUvDX1Pou3Y3y0PaytL1EPM/yUz+l2SfhUR7iT64B4V8CXSDX
	DUkS7mmp9GDMhHJKVSYgqqqKA7IjYrHI8N6WKUAEyLWJYkK5iNV+4cRx9UC6X+Q==
X-Gm-Gg: AY/fxX6ygVv5sSrYmG2D/j/rOPOkH6AycvxVpzEtLzI6qpvzv4tffFKKyDarMhUa0VJ
	pJtLiZDDyxAsj9nD87UCoBIDkgylq1j2T4RDhzHY11wmYGi9EMMHhEqeFey9oJWJv5mHgBsAb4s
	rSeP/eyKwCQWhq8ggdSFmSgYDMcGAAHSHvW2Zv7Wae0sq3I9irPDCHjVMkomFM3m3qoQg3pAf20
	ztyOKGTETs6o17NOa1MnjNrdjkPRM6Y8XXCUKVAU6vILpJIbV9Vt+YehfqwcleDwiZVZPsiX0zr
	vZOn7ts/iFGzx6/HR58xAvTnbSml23k/nOBXLNLhwSfMUYhiwwMDIpEcWpq33I2GPUonc90lp3u
	N5WvC0k/BNk7lJGj6ocSfrNRtbRYvlojnSUoe1QS70zQX
X-Received: by 2002:a05:622a:11cb:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f4abdc6a37mr166818041cf.76.1766426986185;
        Mon, 22 Dec 2025 10:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhen4inuPei2QtIgz1Jhp7TuWhSfPiBiWyK9QaTxuqDdPYVrS4RnzupTyJuPkfHzkoEa0TrQ==
X-Received: by 2002:a05:622a:11cb:b0:4eb:a192:de99 with SMTP id d75a77b69052e-4f4abdc6a37mr166817461cf.76.1766426985756;
        Mon, 22 Dec 2025 10:09:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm89568916d6.38.2025.12.22.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:09:45 -0800 (PST)
Date: Mon, 22 Dec 2025 13:09:43 -0500
From: Brian Masney <bmasney@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: don't select clk-mt8192 for all ARM64
 builds
Message-ID: <aUmJZ7o6PpWeXFZP@redhat.com>
References: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222150235.34919-1-bartosz.golaszewski@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Mon, Dec 22, 2025 at 04:02:35PM +0100, Bartosz Golaszewski wrote:
> This option defaults to y for ARCH64 meaning it's built even if we don't
> want anything related to mediatek. Make the default condition stricter
> and only build it if ARCH_MEDIATEK is selected.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

