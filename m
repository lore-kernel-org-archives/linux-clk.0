Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130193;
	b=d33WWlWGC1UIs6uCeJPYRcHtwnMA0DoUPKqVVpZTS0NLPLZlDwqV3K9DjrE4wLGtG6Nt
	 +j3wfLmHc0SjRr5gfOUJJnc2vHcGC2Sr4+Lc4c6SkBt/MuFkQbRwCGTTWrKKFjy4gTtVM
	 qDhJBmZxMc9xezik0pUVdQyh0FiN1BDXVH9qiqTyoBg8KcJOS2eH4crXj1t5x4zGUd3SV
	 Wqoh8hnzlUD6bLFbLbIxjXD9xXAn20HioM1Vaf8QFGqSiHuAcQf83l8b4B5Dhk+B+Oq4k
	 wwP8cNXT1DHFDPjutgCmq4zEMIZfPULNriDnmR/eT12cYW8XopnlKaEolPWTRGP09Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130193;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=+VCxsTRSatZnN7a1mABM1A30GPiQqVx8TUGLqOKrAio=;
	b=3GGnfXHDshbeXfaIvYoD1BPs3zVrlx2Y0Ox9HGPqHUwytyl3ZpiJr9Q6IURQo0vDGGbm
	 LlnE9Q0vn3baVkNp38j/SpHaPg1NqN2mCITAAYSrOVM5CiM7UP9WmYEkAgRakaTIxUJLH
	 k+lCVy2FYDV+jbIJSZ34sZwCi4mHa/3ceh+eeGwiu8W3R7EIQSrpFY8BwhgGnS1G5UaBJ
	 tL9Oy5IGCZ4oIfopX+LaLvTll/dODTK6aGM4XaJeFvwBDFFs2AsT8jNluoR9Cz0BWcQe3
	 jFV03yZoD8ljcZQT3Q5pYkJVBJCKPTBRe2s7ppJ+KFYrbY0IbGFtK52gmyGsk5QYv3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HA88rbW0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BC9606A33C;
	Thu, 19 Nov 2026 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HA88rbW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BD71F000C6;
	Thu, 19 Nov 2026 23:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130193;
	bh=+VCxsTRSatZnN7a1mABM1A30GPiQqVx8TUGLqOKrAio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HA88rbW0KlKhFLdCmiC+m0Ukxgqi9vh/FDkgEjM0c3zyD2t9aWQatJTfMFXNljUFi
	 Q2Z728kk7eTltbp4r+TQ3VlQ72iI3SYCvOamQuhYmCMN+BgUv2FwbkD9wlsC69zcg8
	 WoPf6K8jlnq/m/d2RZHbqO1G3u9LRDYs45JxoagATaVvEDawbibrQO7RF3Yyny02xU
	 xz9cvpDa3EDHwK1ILy8wTEVrEcGDSdEg8OnD1dzse18yQEyNuaBCrYuB+24qvPOo+B
	 EIAcLIf0dvO+gyhVudimeG38V8cfXZRcgkii+c55KP5uZxtmUyyWYN263uZtyZBYGQ
	 kqqpS/3gp9ZFw==
Date: Thu, 19 Nov 2026 18:16:30 -0500
From: Brian Masney <masneyb@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: siflower: Add SF19A2890 clock manager driver
Message-ID: <av-DThJFadNXhC0F@x1g10>
References: <20261116-sf19a2890-sysm-v3-0-b07bc7833a87@telaak.dev>
 <20261116-sf19a2890-sysm-v3-2-b07bc7833a87@telaak.dev>
 <179511480695.279474.4521829214953240997.b4-review@b4>
 <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY4CJ6DjoKi9v3Bk0Pt7ePRW_yiNiUzfX1id7efK8i8cUWFaw@mail.gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Thu, Nov 19, 2026 at 04:31:01PM -0500, Joseph Telaak wrote:
> On Thu, Nov 19, 2026 at 02:00:06PM -0500, Brian Masney wrote:
> > Can this declared as a regular platform driver? We are trying to
> > minimize the use of CLK_OF_DECLARE.
> 
> The MIPS GIC timer runs from CLK_MUXDIV_CPU, and it probes from
> TIMER_OF_DECLARE in time_init(), before any platform driver. As a
> platform driver, the clock would not exist yet when the timer calls
> of_clk_get(), and with no clock-frequency to fall back on, the SoC would
> have no clocksource. I'll say that in a comment above CLK_OF_DECLARE in
> v4.

If possible, declare just the timer clock with CLK_OF_DECLARE, and the
rest as a platform driver.

Brian
