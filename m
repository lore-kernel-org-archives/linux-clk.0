Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B682DBF76;
	Mon, 15 Dec 2025 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765837139; cv=none; b=TS6GStlDq+bFuxLdaLOFM/rBFKC2E4HZPvLrSFWUMWIgCQ61Ewo41UjYp9wo0drc0aKmKB8c3Gp8FECr1qxhREbdyGx2UfPhPq/O78gCfCC7fZfvZDQnopiY+TQh6GpuH0wK4/QJBQ5N0ZB+5szz5+c42W+Vxy60Ok7+m0abVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765837139; c=relaxed/simple;
	bh=vGhvV/FBDjdBLbNAIlF809mjZgrZGUaTV2USMMacaJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mECzutngGcmbkfsY8F2DaMhQvIS9gltC6n15OEXbVaffYOry4hKI43anijZe4xuYxIsSuiHrbN+al1qTQR3JeIvlztY8k5QHSBNEGAV1gV443MzioPyJhhpwdp+8O0BNOYdnn3kqwJc6MC7srqo0mcBparGXJuBrlWGLAyQbX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6229B341036;
	Mon, 15 Dec 2025 22:18:57 +0000 (UTC)
Date: Tue, 16 Dec 2025 06:18:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Haylen Chu <heylenay@4d2.org>,
	Brian Masney <bmasney@redhat.com>, Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] clk: spacemit: Fix module build for spacemit common ccu
 driver
Message-ID: <20251215221853-GYB1903981@gentoo.org>
References: <20251214232938.668293-1-inochiama@gmail.com>
 <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EE6920993009E270+aT94cmKTM0tHn8Ly@kernel.org>

Hi Troy,

On 10:54 Mon 15 Dec     , Troy Mitchell wrote:
> On Mon, Dec 15, 2025 at 07:29:37AM +0800, Inochi Amaoto wrote:
> > For build spacemit common clock driver as a module, the build
> > process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
> > and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
> > build will fail.
> > 
> > Add these missing hints, so the driver can be built as a module.
> > 
> > Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Thanks.
> 
> Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

I think it's more proper to use reviewed-by here, for acked-by, it's
up to subsystem maintainer or original patch author for signifying
explict agreement or acceptance of patch inclusion..

-- 
Yixun Lan (dlan)
