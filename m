Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C22B445AC4;
	Wed, 22 Jul 2026 22:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784760767; cv=none; b=ovkiBkJFrFHjrkzn94EvsMpsQH9x270jGfZYvs4r5pBEOkzzlxND6WLbveEYIGyJLOQSq127QEjvh1UrSArwwiKByaStYHtq6+TAhnuZzKFdiybY7pzo5Z67qLuiHgDF6rict0X9wigp6Hg6WVx1Pj18fdwzh3oL/rRnFwGL5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784760767; c=relaxed/simple;
	bh=QmneknWzS97mS/IfrDJ7YAopaBp1cn95q6dBpkiUOPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gtY2eJg7NcT8W3nvks7pMMD5GkO3o4y71V/LqxqzrSzDW0r9SYkvE3PDWfincuZeO1PVPpmShqSi7uMuj1IgeNw79wpqRAYd9KJrZYYYHPcz+lONOL68S8vopnzZ+GBpT7zQ38dTsAa8ol8HyE6yOW8oDp2zHTrM2FRot1Bj2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mdDaGaZn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mdDaGaZn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A65168F;
	Wed, 22 Jul 2026 15:52:41 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99153F86F;
	Wed, 22 Jul 2026 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784760766; bh=QmneknWzS97mS/IfrDJ7YAopaBp1cn95q6dBpkiUOPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mdDaGaZnFAiUJx7LKS6ZbGO+gz2G39fzwP9q3Nn7FL/LDfb1CUZhHBFkMShVoiF9w
	 g4Q9Gb7KhcQHtWSNXhd8ZW3o1kNZS04ExsaZf4+KcBZAjgmjkNjKGIltPhxaS3Te6A
	 bH+JBHF+6gP6rt+RNW9cOu4TJmoAqkV6cTfWXOFU=
Date: Thu, 23 Jul 2026 00:48:56 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Junhui Liu <junhui.liu@pigmoral.tech>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: ccu_mp: fix clocks without P dividers
Message-ID: <20260723004856.55158e84@ryzen.lan>
In-Reply-To: <20260722173714.2394348-1-enzo.adriano.code@gmail.com>
References: <20260722005643.1208942-1-enzo.adriano.code@gmail.com>
	<CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com>
	<20260722173714.2394348-1-enzo.adriano.code@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Jul 2026 13:37:14 -0400
Enzo Adriano <enzo.adriano.code@gmail.com> wrote:

> Hi Andre, Chen-Yu,
> 
> Correct, this was not tested on hardware; it was build-tested only.
> 
> Thanks for the review. Chen-Yu's point is right: these one-divider clocks
> should use the single-divider clock class, which already supports
> CCU_FEATURE_UPDATE_BIT. I'll drop this generic ccu_mp patch; there will be
> no v2.

But there clocks that use a _MP_ initialiser with width = 0, both for M
and P. Which leads to GENMASK(-1, 0), as you mentioned. So we need
patches to fix: to convert the HSTIMER clocks to use
SUNXI_CCU_P_DATA_WITH_MUX_GATE, which is a pure div clock that doesn't
have that problem. Same with the r-timer clocks in ccu-sun55i-a523-r.c.
And there is mbus, iommu and dram that have no P.

Are you going to make and post patches for these?

Cheers,
Andre

> 
> This analysis was done with AI assistance and each finding was checked
> against the cited sources.
> 
> Regards,
> Enzo
> 

