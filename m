Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5291D435534;
	Fri,  9 Oct 2026 06:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526259; cv=none; b=brEjta49PDeEAC0cfT6objSvOi3lyRZN+BSjbGINWlW0Jv5Dw12lbxtTTYwNHTBZWu+Ft4a6xvA6tZ7GCupXsKKgpBr/ebHmHV+He92/jTSG+rYbw3LqTgYZDcFArZzbMfjzY4G/2loP9q+dpW7lDHqhghG3UPzS0t7rvR3F45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526259; c=relaxed/simple;
	bh=N6oKuLb55eA8lD9aO3ioDmNfeLCSxGY48zlC4YpkWik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjlYdkeQD9HITifFthr+3SQKijXVCVOz0KLfHuRVW8M3Cvh4Pkh8IlKrLj4ZFXO3FlrxSwZ1XVS9Bi6DvREu2HkzSdRNkl/Y8ajX4OGWSRVopDlmVDPXopGZJ0W8q8nHZSvtwWb47cIRoiNwtHaVjT0Bu79nSNZFarHxR3LTR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYjMQ8Rj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYjMQ8Rj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B191F00898;
	Fri,  9 Oct 2026 06:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526258;
	bh=vTBfdkdiLXR6doacRRqDnlzSTCmPURyXZAOXJeR/J/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYjMQ8Rj+ke+uQQ151GhaFQxe3REKSpKD/Y9PeDvy+4WMRY44KkcMkl+qgAKFJgQX
	 vehV9y1n3yQ01BPSd6P7MmT4h6UfXrUgMgq7i72iW+u54yglzj/mAEsz+4967c8Kwy
	 jvkj5vnisYO17n6soskqIC6nqSyCgplkJr8cAPamLEL4wQFzpZmKhyF70x6UY8qZ/9
	 0lArEvcQf7MTp6uDyfoBBQd1c0/V3LfZy8pI75s1kwgw+nCvxlgnpfvnPZLRiAKktN
	 Cp+pSYnVa3oXY09eWoVBPijbiwfVwvfINmufPv9l3aTPv4yHlhfIurC6BHut01pjbh
	 n8EW2xgMa+aDg==
Date: Fri, 9 Oct 2026 08:10:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: composite: fix NULL dereference when the parent
 clock is not set
Message-ID: <20261009-daft-succinct-stoat-5d5bd1@quoll>
References: <20261008180652.2756849-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008180652.2756849-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 02:06:52 +0800, Haotian Zhang wrote:
> clk_composite_determine_rate() reads the parent clock with
> clk_hw_get_parent() and hands it to
> clk_composite_determine_rate_for_parent() without checking it.
> clk_hw_get_parent() returns NULL when the clock has no parent yet, for
> example while the parent is still an orphan, and the helper dereferences
> that NULL pointer in clk_hw_get_rate(), which reads parent_hw->core and
> oopses the kernel.
> 
> Return -EINVAL when the parent clock is NULL.
> 
> Fixes: 2f508a955a67 ("clk: Convert basic types to clk_hw based provider APIs")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/clk-composite.c | 2 ++
>  1 file changed, 2 insertions(+)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




