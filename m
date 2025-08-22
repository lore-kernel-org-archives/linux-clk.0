Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C927A10F
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 05:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842394; cv=none; b=DIYLKBXND2/T5m5l4rHd4Uiu2U9kDnhKZbmPlZBujsDMjK9DKe5aBu/AxGpkr3trPAlyFpbXjugoP/ZG5ngmpUdIIwrimyprLBOBjtflVFwLRYhm8iH2MtE9nO3OwrYVCD5VMCFvD0jDGJXhkSyasEmhZTlXxT5sPs4ZNnzM5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842394; c=relaxed/simple;
	bh=Lv4OXvThRZ3aaC9Yk63c3r3UXiEApaGmTnynlaWwLlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THJ4f5gU0rTDWJEXwAOHznGydHX7uLcca6UHhSDe2etXiNqVvzEU0yi3MMDjXdQAUwtnHQmzv1kYXyuXbe8gQ+PL3q4NFAFWNptk4pC24Y82DeoVEE9qmbMkFxzi1LODr+Dw51WgUwGkZRE3Xr4L+tGivTLnhGjn1cPQWAVohrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CD4BCs1P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CD4BCs1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=muTL
	R+uO1apVyAZkBbYYZe6gE3Jd5HWWcO3c7R6cA9g=; b=CD4BCs1PRkjTCCYhPycc
	34kdjEOjYanOh4U654+aGn6BZHBbuPF+jcC/cv2aS8DWV8Jct4EOIkwCUOs0WgHR
	seR6tPavlBgjL3wwmOISzO9W8uvnhAJHNUDRBxm9pN1dgVA4fdyTjunEhDCnUokO
	tB00CVhfMFWHhQFHD9kg91SWyAdPqZ7J6pkoslduLsz/z0M74LR7DRpikfxMuYt2
	q6OmOHPTWk+doXL6W57nrnVLbA53X+sSSnl1a/j0gTKB8/gaEo4t6+3HReiK0Rjj
	pSHe2u2FILIEH55eX2T0BF8My1ZxsW2P74nrg0vyNFnzpHHZUKfn4Y2OEMkK3JDt
	2A==
Received: (qmail 3778719 invoked from network); 22 Aug 2025 07:59:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Aug 2025 07:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@KHGr6e08GtDUtcd1
Date: Fri, 22 Aug 2025 07:59:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKgHUXzK_iSfjP7Q@shikoro>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
 <aKeTq1lJ549a2jnQ@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKeTq1lJ549a2jnQ@x1>

Hi Brian,

> These all look good to me.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>

Thank you!

> Should drivers/clk/sprd/common.c also be updated as well?

Yes. I wrote in the cover-letter that a few occasions couldn't be
automated with my coccinelle script because of the indirection. I will
fix the remaining few ones manually, but I didn't get to that until now.

Happy hacking,

   Wolfram

