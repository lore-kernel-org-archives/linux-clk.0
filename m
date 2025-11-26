Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059C1FC7C5;
	Wed, 26 Nov 2025 15:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171984; cv=none; b=omdXqHLedx6SQuyZrGAafKo9GAQ+2D/xyjql6c1XNYbewF2ZrADjM8P/ZUqxZorZIXzu4TQFltx1nyCy5J0j7d+irL6Co+G7AKMuHe0z4BxKbNHRCP3/J5AkSHtsDHXEalPZGiSnrLasGACDooQnaSoNVYFQwMOggsCRSiRbahA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171984; c=relaxed/simple;
	bh=siTykx/z9aXu4u4cdZYkqgRvcZO1UfKi7lOi9dup+QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsHc+kkx8JkmiSJPZYPk/vhMrh0Z6Jk1rDkmwqAJ9KkdF6laRCCmapHdlAbWj34E11EivOgsIT659KKGid3/sy6FP9O49gMCY8Nbf46mgZ7au0DqCayy69tyQSbr0gU162zQUc8zhQ/1JAO4yUk4vRSafegr2XL8+H/Z3t3pxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxbEiu58; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxbEiu58"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02796C4CEF7;
	Wed, 26 Nov 2025 15:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764171984;
	bh=siTykx/z9aXu4u4cdZYkqgRvcZO1UfKi7lOi9dup+QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IxbEiu58UVYbahyIig+UROqDs4S0uIs2r0Tz+kd/H7oTpTvMP16TB6yNa2aJ94292
	 XH31Fhx7z4xoQ16SlgaQxBR4Sdo59RT3wQdtVXqVchoXmc0iJWdRlL+LLv98WH1G0D
	 3qRf9DCqHn4WNmOP7QzDRpg2r+zFQgLEyXjeDNbwEjvi7arNW6xV5yl4LohRLwT9+o
	 ebKVVT9Ho9LhiC+SXB7jwFMWFgmV87Dp7s/vEmi5x8Dh6U5tP0GweWStcvM2DK3byA
	 rfP5dw5+uioFJgwA3w2TSXaLpzzJbB9jREFdvhO8gFc9j0v1G6tRtIbP2rHVSEBqG0
	 Ync/uTSjkWNvQ==
Date: Wed, 26 Nov 2025 09:46:17 -0600
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 3/7] clk: thead: th1520-ap: Add C910 bus clock
Message-ID: <aScgyeV2ojGN9JC3@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-4-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-4-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:12PM +0000, Yao Zi wrote:
> This divider takes c910_clk as parent and is essential for the C910
> cluster to operate, thus is marked as CLK_IS_CRITICAL.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>
