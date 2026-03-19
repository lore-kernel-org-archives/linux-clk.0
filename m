Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814873B8BDA;
	Thu, 19 Mar 2026 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912991; cv=none; b=IbTCzhZsS4h8KgnTb9GoRsVuz7wAHm7JJTifAdgiB9l4hQl3xthvm0waLjGZ4ZFN/urvoKkCeKTFkRr+OlR1xj1kzVGoAjO/HgBppdjKLexPXeGJVXgXS5n8BotxtLVh5OjyaoR3p5m5oN1U8NCO1HdstRVywtNDOrVNd15IPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912991; c=relaxed/simple;
	bh=GZNguvxlPJA4nmfufctPY3tctndtYB0tQ5LlXHqx4wo=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=hikxYvsN1lWrJwPjSxsD+G+26Z4+45AKeS192XzhzMt7y2h72NG8PYRnQOIbEIl4U2biLnwUrZeZph98zEorllISpwpTOBvvMICSWOZPc2o0qLPWTvp8WDlssRpLp3/f49PH9oblFAAHb32Z3H21k3go56JMlpGMA86YOf3EQ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzirZe5c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzirZe5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF612C2BCB0;
	Thu, 19 Mar 2026 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912991;
	bh=GZNguvxlPJA4nmfufctPY3tctndtYB0tQ5LlXHqx4wo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KzirZe5cgd1oq2p6fDFd41chhx3tU0hvZShSHxDmybzHSM7NAs7CsH+q91KwbDt/u
	 FJIjJjllMPgZ8SQ6aais2+0RNBPLKr9CrAppUi1JpGtPEcvSKWCVKxpyUMmDWTmSEP
	 7sbeUQ5Z8YUBTpFk7Pcf5ssEoJin8UIupusV/QX9kl7sgRlOR0m8rhQ7djzSrwxORR
	 HxhhrNKW96m3haOtXv60kCqMVGegT/X4VHHcf+8lP1gnvNf5nnjQky21jLLim0xE5h
	 SQxX6GYwltQmbrQeB+mYeWYV+BeAGqpgt0Ly5EVk/1GbzJuKTyCsFsYKQdIgpp1EPs
	 oocYzmcZIQDyA==
Message-ID: <b9cecafd294f6d7e9e2e8e7a06434b19@kernel.org>
Date: Thu, 19 Mar 2026 09:36:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v6 6/7] clk: divider: enable optional support for v2
 rate negotiation
In-Reply-To: <20260313-clk-scaling-v6-6-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-6-ce89968c5247@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, "Alberto Ruiz" <aruiz@redhat.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Fri, 13 Mar 2026 12:43:13 -0400, Brian Masney wrote:
> If the v2 rate negotiation logic is enabled in this portion of the clk
> subtree, then use the Lowest Common Multiple (LCM) of all of the child
> rates to determine what the parent rate should be. Make this change
> for clk_divider_bestdiv (used by clk_divider_determine_rate), and
> divider_ro_determine_rate.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
