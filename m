Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB9C2BE639;
	Mon, 16 Mar 2026 12:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662994; cv=none; b=hDZaSLjyfDIdKTkWO3X+FSuSryo6scKmBZevo1cPXHYWjVXXhyP/u6wZ8DvEGLZvRM78qrGHSJfYnB/vm/d3Q6sGk1Z2Mkr1HexRzsnh1G6+jnd7jreDIkbCHpzjSmjuplinlGSsLoJqWi9AkctdLxWvcK7zG5TLCsX8pCGcDTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662994; c=relaxed/simple;
	bh=5MXWQw7edysQr8fnerPKD+iq/gnFUPQ0uYdAaIpBuvw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Y37AtzTDpR9Lw+7p6sb7WMOHRi2uBEcd8yYm5WM3UxDEpRZjopIGcnfGHgeKzD8h+hk1x7a9rT2W3/rfRtDeID/qsnOgOedayFuo8WVbdAZvGYM9A18NIVzvHWFzaSqgzadsVZFaoPb44kkXopHxnV4dZQiR/umbCFg1g1KNHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgBg0leO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgBg0leO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DC0C19421;
	Mon, 16 Mar 2026 12:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773662994;
	bh=5MXWQw7edysQr8fnerPKD+iq/gnFUPQ0uYdAaIpBuvw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=LgBg0leODXjJ8tM6rnSluRjM/8ymEJOGGCONNCIs4lJK7+z/p0wfuxShyhVm5Mwn0
	 Vtb/ujLWo7OWd4VdbqX3Cx3wtoXpc3Tl/BZmjbrdzwy+Hhrkog1KxuzQbQYJ7lwNLO
	 yU0MEuIlan1Guno4OEYjRelrW1sPv1UkUjAaoGDF5Hq8KEl50uBwT9KAIJHdslvSFz
	 uwGB7JuK6C00FWF2uQC7dcyMGhNyLVMlg6KODygA6Xyu49ZMyPUV1mpl+PvcQahd1j
	 gW/wSCiMc5JQMfpnqtYrvoN9+KgG7ZcyqHvRBOf1j/YJcXzp77pupcK236Qgg4qtyP
	 aZVjFa20Fl49g==
Message-ID: <ab74df7c182201c345cc7a735453b311@kernel.org>
Date: Mon, 16 Mar 2026 12:09:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v6 1/7] clk: test: introduce clk_dummy_div for a mock
 divider
In-Reply-To: <20260313-clk-scaling-v6-1-ce89968c5247@redhat.com>
References: <20260313-clk-scaling-v6-1-ce89968c5247@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, "Alberto Ruiz" <aruiz@redhat.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

On Fri, 13 Mar 2026 12:43:08 -0400, Brian Masney wrote:
> This is used to mock up a divider in the clk kunit tests.
> 
> Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
> Link: https://lpc.events/event/19/contributions/2152/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
