Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9371034B1A3;
	Thu, 26 Mar 2026 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501481; cv=none; b=c5Tz0TM7Um/fbVbx3wZr1jbFmdk6wLWaNWfhHUMV5Z5+rNniVKHF2+bs/WTP9tNCLIXOovDPZg6bD3gCOiiaH4rrPe4HylrBn9TEwULfrvv/gJPSlswoicVq1iHghMnC8/koi2M8QTh8V+xkh0Lq39+cq0kRNK5UTFiQw6gS3lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501481; c=relaxed/simple;
	bh=DWfDep4TYYhYNNj9Xc28QoDbJutlj/1mbmBuvOiQH48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtMkgGY1I5Tt03CoHahgdEcKMFNNJB5cKt/VoMOjGpl3Pmv7Nz216EscGX9iK3t70BAfcdYnnO6EDptwNVrRakhYjRDKEZDVcLwBrv5HCwy3YHxh43lblZVpzCGZvuhHpKHBGiDrFlvAn1M3w1om1N0VI8LMqfe2PWwldjlk0l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cwFb7HXu; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cwFb7HXu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y/Y3zLLFpoApavNpmljNRDb9ckQyx6wTnbS1a6SPxZE=; b=cwFb7HXuyXD6K4Iugi7xipOHdJ
	Wc+atYmpAdubg3O+4NSQpsTjN+SsIjnteHsyy3T+0L2dHVAuNaDOi+zaYYSva5lJ1U5xdAVjPJ3VQ
	LrKQRvSrjO5pJISPnL/tKQyOt8U5Ekq1VnN2BQgddk0pFoOK8DjtKsn/1aA/EzvPoHwkeXD479fU6
	iQgNALWh/Rh8PM3PPJVQqLwG3OckAgpmAfRx6o+FnV9hQJq5zzh1DppU7We7cAKD20MSGcljqjLz0
	Yya2kTTTN4EnnTCfZfn1sTcXGW7mWwlNBMxbpUG3lKGOwI4yTUNadfu5X9fBQzfNNQZbI+Yj3x6dJ
	fTJZGryg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ctZ-00000004hwq-0fjT;
	Thu, 26 Mar 2026 05:04:37 +0000
Message-ID: <96824619-dd36-46bf-a43c-6230cecb5670@infradead.org>
Date: Wed, 25 Mar 2026 22:04:36 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: move core flags into a new enum for kernel
 docs
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
 <20260325-clk-docs-v2-1-bcf660e1ceb5@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260325-clk-docs-v2-1-bcf660e1ceb5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/26 4:52 PM, Brian Masney wrote:
> Let's move all of the existing clk flags into a new enum so that all of
> the flags can be easily referenced in the kernel documentation. Note
> that I went with name clk_core_flags for the enum since the name
> clk_flags is already in use in clk.c for the debugfs interface.
> 
> Note: The comment about "Please update clk_flags..." is included as a
> separate comment so it doesn't show up in the generated documents.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  include/linux/clk-provider.h | 55 +++++++++++++++++++++++++++-----------------
>  1 file changed, 34 insertions(+), 21 deletions(-)

LGTM. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
