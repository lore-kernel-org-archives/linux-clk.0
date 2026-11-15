Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779417;
	b=Z0KZ9fgK7LtFLGnA8TozGRpnBMA531R3YYQmVxgMhmdVYuO9yAz2cxg3nUy6g+Ss+GUE
	 lua4raENHBIOw5vkjtZcFn4V17/blZ46BLH/xMUvV0s/c0p5b71kKS8WfDSpel0+09F88
	 OiX+hG66ZgDwt0SqsrQlXBLOSrQXYclqEM+BPbSsD6gBe5G3pkjbLg19HHEUUXoyx4Qyt
	 78ZY4zh/JrU/JKkNPgIDTkzj96zj11P8Ur59dY/zctmh0GVqLzrh1PUACOjNbfMsH0y9v
	 zXo45M7R5mGea8NMXgZIcqk4JxD7h4qR8ArEyR2QqCsbbcKPnyX86CYJICDWL5SHdUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779417;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=6XvkMDi42j7sY0SuX8WsFlM/u5/0v+BfHkwMgWB/hdM=;
	b=atG5ac1XGQbnUJAx5FTMY4tbXEW1OWpdAXGzHYwBM41MJ1I8DL0/aTSQH2wfnVgPGv0A
	 dIEy92UNa3cRkCFGWeRW89Y2KY4U/9Y4wusTAk5YjuyDukdsbP1oyOohMBmH5TdIqh1pr
	 v5YS3G3qO6uCU/nvTzR9vvjroQwDENkCxaRC4mPRUI9SEmfIWDyuguR+Bli+C1aDFhS7c
	 MqNKn+JPu8HbrdRPyPQJGn7G23koRkC/YeFY/6cSGf7Rm6KMao87KhQ1njpPazeLZ9/oy
	 nr8APXusiJ9YMNb73BZRqHt6hh8/a0QcWLszGhmRfeo2lCsPM+ZKrRQx2mjhL7ewLLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFEZvwMx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D670D606A323;
	Sun, 15 Nov 2026 21:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nFEZvwMx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE831F000C6;
	Sun, 15 Nov 2026 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794779417;
	bh=6XvkMDi42j7sY0SuX8WsFlM/u5/0v+BfHkwMgWB/hdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nFEZvwMxQUzhZeELmnZEHAe8BYEEgWRUOfxA44QqBHDNEHKqgSvZInB5g+iW8EEVD
	 pj76uae/e92fD9oa7MNfKcgyS4hY2nZlIL17HBe7xjGKguIZu4LibMj7CQX65gLdlC
	 yUo+VjdlP1+vkZAuaIRoxfs1kj5AwLhAQdCo42VQe8nfnuhcZ3hXYN39CpJgvecOuQ
	 OPbR4u1buCNQRULF38yfpYWseRPD1F7jg8lXJQQJYmcs8oZQa6WkiiLB7B5pkjQTHZ
	 K+MwzTlKdAZbS9JOeVLV4XkiLpInJkLVuIRCWXH6oroJApZnFqC5JG6gu0J1Vnd/Zo
	 nMGHujxVcHOZg==
Date: Sun, 15 Nov 2026 16:50:10 -0500
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
Message-ID: <avopEsR4AqMUUKBU@x1g10>
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

On Fri, Nov 13, 2026 at 07:39:42PM -0800, Florian Fainelli wrote:
> On 11/1/2026 6:03 PM, Brian Masney wrote:
> > 
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

It's a bit late to do the immutable branch now and I don't want to have
to rebase the clk trees.

Can you provide an Acked-by for patch 3 so I can take it?

Brian
