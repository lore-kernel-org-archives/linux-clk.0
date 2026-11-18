Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045291;
	b=ktJdsawn1Y9f9el63I9HPXCSIsTksmUEGDMwU0c0TzcZubgH9kKaeKUkWEbzKFtQMXcw
	 abvHbdDHDiRj4VnTBHBFrKdJ9UY6t2H7b4xNyshBAk6PdJK+jZt5252QsR99+8IfNjSPT
	 CSQlsCHOWEMyFKJQmbJe+CPDxEWeiPX89zojIc99aFPV2T1Dmix6hX0x7s3BvNYc5g2px
	 nzEqtlQ9TKWcdGXo1AB76s18nkXi9t/3J735Ufro8kXohpQjcj+RlpN/VqZ2GZU1TNZ3v
	 62ySA1jLOVAD1DI2EdHkqfHUKTxEdmaaeuBfdelOgJ1AFN+75IQEOvq94pmzW+R7fdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045291;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=rSO1YX8ECwF6lWE7jTNfVJI7sFNdXuobHYLm3j4lLjM=;
	b=CzZct+yFPCyRtsR/R4WMwSMZ6PvsM6B4AI61xkWIhmVsCBKuJ2nlf9tUcPlJpC6dTp3h
	 EwwX3fHQdAfFvCHVj3yusAvYW6MY2kxovgsv/tZdDu38Y3scRY+3YjPpum9qe6PGFo/Dz
	 nvieThSE+DBS6JY+ThJvUQmqknnozArGXCvEkDYrklZR0A+Lig9BrK1IC62zxLKFdGnHJ
	 flZ80qpRtFvSm3169tpSv34kkAYpY8FG1ZyNS42+n4FUyRDWWxjUXLfKylkuzQzNiFsHf
	 YTyxfw6dAsZ4RZPR1N+BTHBISrN7Wzg9r6/9FqpoZtpwCe2+3Ln2GkQJfChJ3X2DDpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6quvtmI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A49606A325;
	Wed, 18 Nov 2026 23:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G6quvtmI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A1D1F000C5;
	Wed, 18 Nov 2026 23:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795045291;
	bh=rSO1YX8ECwF6lWE7jTNfVJI7sFNdXuobHYLm3j4lLjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G6quvtmIAnAIa/2BWcN9t0CtnflDE2825rvG4CvCmJtlY/d/K7rXajjLf/3ag9UFF
	 QaKv2LgifFS+21hUYitPHmHbbtoYt2HCNrR5LddVBeYl7rBJM5jgkndby5p+RNwQPt
	 5epMhbP9mzuW8gUqHu+yWYw+6HjDQHOBfv7UO2xjblgACrVAKv/aioDjGOrcBKP7RA
	 u53iU9oszIuzsVCy5CwqAtXzf4d0OolBeribe8ofCdGBZDgaj3NuEvPgEh8+P60U5y
	 j8OIVNNQTdOlIAx4+YbXuYoWdJWmcnZXOuKrqUjF2d2l6bpNPgtH9k8CYsjb58C6eU
	 KNSbkAwvA2ViQ==
Date: Wed, 18 Nov 2026 18:41:28 -0500
From: Brian Masney <masneyb@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, netdev@vger.kernel.org,
	James Clark <jjc@jclark.com>
Subject: Re: (subset) [PATCH 0/3] clk: bcm2835: describe the BCM2711 GISB
 clock for the GENET MDIO controller
Message-ID: <av43qJ1JUBgjFUtf@x1g10>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <179358503716.355577.9187303706042543606.b4-ty@b4>
 <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
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
In-Reply-To: <2e846fdb-32e9-4ba9-a6e7-ef67d24c4f8d@broadcom.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Florian,

On Fri, Nov 13, 2026 at 07:39:42PM -0800, Florian Fainelli wrote:
> On 11/1/2026 6:03 PM, Brian Masney wrote:
> > On Tue, 20 Oct 2026 16:58:08 +0200, Nicolai Buchwitz wrote:
> > > clk: bcm2835: describe the BCM2711 GISB clock for the GENET MDIO controller
> > > 
> > > The timestamped MDIO write series [1] needs the reference clock the
> > > GENET MDIO controller divides its MDC from. On BCM2711 that clock is
> > > not described anywhere, so 5/5 of that series hardcodes 200 MHz behind
> > > a compatible match, and mdio-bcm-unimac's clock-frequency handling
> > > assumes the 250 MHz of the STB chips.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB clock
> >        https://git.kernel.org/clk/linux/c/af7994af5228
> > [2/3] clk: bcm2835: register the BCM2711 GISB clock
> >        https://git.kernel.org/clk/linux/c/ab94dbf30233
> 
> Brian, can you also take patch #3, or you would have create an immutable
> branch for me to pull from. Patch #3 depends upon the BCM2711_CLOCK_GISB
> constant being defined.

I ended up rebasing the clk trees and I pulled these two commits out
into a separate clk-broadcom branch that's based on top of v7.4-rc1.

https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-broadcom

Is that sufficient for you to pull? If not, I can spin off a proper
immutable branch with a signed git tag. If there's any other
Broadcom-related clk commits this development cycle, I will add them to
the clk-broadcom branch, but there's nothing else in the queue at the
moment.

Brian
