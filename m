Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168022ACEB;
	Mon, 27 Jul 2026 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144902; cv=none; b=sjY+KPf8c3jWGFb+83ZdzEMLH+KuOr31m4ATeaz8SGsJ+AozoYZpMCd2uBnfPhufPDck+NaFsM+1L2LYzunGvQJe9mNrPumXa9KWi/by05uAbrc6jTmcZNjv4UcG0cmkUUJJlbagElXT3PNf2DVWMLrk9ybL2NgZMkKg4ASFWWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144902; c=relaxed/simple;
	bh=61PcQcDvXzE5votusvTPAxF6joW4E+Gik2S0AJ2e7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c4oO5sZauvxM1jEmlI8F0iN62d+1AH+ROFMm8RQd7JBtT2vr6hA/5cOk3pqozBZQzaWQ4pEOqjXPQeifsRiT+fzqOHySjNWtuO60OARoAZmRwtVjTOVCGPRtCgD/t6MqbXO7c2djjCvGDf8z2jA3NBt12qHbdt6cTDP4b/CrTYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjclF8DR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjclF8DR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C00C1F000E9;
	Mon, 27 Jul 2026 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785144900;
	bh=WFlsQzSJEl+MXDtyzozfCwWlLOJBpDw/B1n32t0hzIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gjclF8DR3p2IGOdZt8j98/z5Rxy0e3VxXFn2u4RmPbKPZmhikNypurPu6HXDBUVzk
	 qhI7SfqeH13octvLnjwe57ZNmRm6wZ9zD4vZ3jsaEII/c6xMUwuAwLkD7WjRuH4uYX
	 FTA+46oSW5vkwfumQ6SbhZp0fCdQJe5VK6FSh6/HC7+oLJWnTThNbhl7TPmqjBD3RJ
	 cgkw8qyNwdooi6lNrtPVclgfxkSW+rFK1uKlm3+Z7gROiqZBvKItsNcEeJ/vAdb9u4
	 6o46xS3ve0Eq3zadqXT61tOtQ1o7iMTLB8ifTZKCYd0PMGZc+hfcT/d6AorN/pdKmV
	 3Pf3ku5G2mevQ==
Date: Mon, 27 Jul 2026 09:34:57 +0000
From: Yixun Lan <dlan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: spacemit: fixes for v7.2-1
Message-ID: <20260727093457-GKA76518@kernel.org>
References: <20260706203425-KYC2957292@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706203425-KYC2957292@kernel.org>

Hi Stephen,

On 20:35 Mon 06 Jul     , Yixun Lan wrote:
> Hi Stephen,
> 
>    Please pull two small SpacemiT's clock fixes for v7.2
> First patch for USB2 clock fix need to go in pair with USB2 reset fix, the
> reset part patch was already accepted by Philipp Zabel as a fix for v7.2.
> Second patch fixes a system hang due to HDMA clock being shut off.

Generally just want to ping for this, the USB2 clock fix need to go in for v7.2
as the counter-part fix in reset driver already merged by Philipp..
https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/?h=reset/fixes&id=1ca22c6aa006b05143367268066fb74e32cfe66b

-- 
Yixun Lan (dlan)
