Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399911;
	b=BsoAtCKe0ndizzflzyB+hG+eEhIjfoP2KE6w5MamTbC0VejLBL8NA+p5XhyboZw6igZ9
	 hETRsR1vkvCDYhB5+4IaFGgKErV9Rb3rvKKJaOhwCMHwOExm9F3IGtOc7lxelmLnyfGfK
	 tUHKTMcoUibmEm2Jnv8hskNGr8UHWR4+sAhXmOcUTEUEwr+WN4U+57kI1yCA5T+UtMZ0j
	 zJZ+saHateCTULWB5tYEwJFSbQ2fW7Jn28bv9NqI6PONWawFzCqHA4eyMgXpvgMXzrFqV
	 6Slt7Pl7qL9uII1ZFfXpxjUjLqOzzbH0jj21tpvdvAs7NR7ZYDMheWbuDj+2rU9lS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399911;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=STCS3l/zlpLuADxUotZrhurI2/8ti5xPCPFt7Px/rs8=;
	b=eU9xlHu6G0kqDWufWXASEecPmr6Isx0ykQ4t82BGOZxf+giWeIvKSFdj48u24vMYNT99
	 N/X5H9bYQ2CxYBF/PVZsDXVIogn9Ume1Pz4EWpxwPqE4SK+NC8mDxcdFd0LoRyHmHZ3Li
	 UpN0uxIgK7k+sLhyDJyfGY+pMBe823KMPKnCxDyThVkhJqsCPhz4/6H7zC43qZebcnUFJ
	 PlVM0oj3Kneed1xzXzmznS5hA73RHjlYpixYrOvgnxhVoWIA6o41bRhFieUpYlt+cUvQz
	 9CUyjJpMb0+YDRYmZsIc+wJQajqRmLNkLDmu7Tf5Qy1jF295HwLMhnrryDmDQ7TCG0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRlg66S4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FDE606A321;
	Wed, 11 Nov 2026 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRlg66S4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB71F00A09;
	Wed, 11 Nov 2026 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399911;
	bh=STCS3l/zlpLuADxUotZrhurI2/8ti5xPCPFt7Px/rs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRlg66S4iIXJo+2HWV2SwS8uM9Xye5xipVQWhkWwFlH8LK5W360qY/YEz4j1PAG0a
	 6pgX9vYTQitWSDG8/WUlT++MR65jDJbJ8q9q5qVwY2yIC+zh2NN5ueGCa6lFY7s72T
	 wl3tWtwv7F9TwZ8Bptv4fkyoRFoFuZCbuUTmaT1jKA6BmlVaNbkrPp1BuHmY+kmQwj
	 wZFRKBOl1YYp8pjiRSD6gZgj2BF8l0JWMBnFiNm66yfHeO2p409KwZ1oerndynr9lo
	 SqnUtJK05DmeOadb7yWC7Ia3oe7BpPHi/AZFDoSWrkPM8sKIWzOhxyFbXE3ZAZSaRR
	 MSaKoYNYVrtgw==
Date: Wed, 11 Nov 2026 07:25:07 -0500
From: Brian Masney <masneyb@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avReozTC_GEmfIxG@x1g10>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
 <avMmKJpczepWTRdc@ashevche-desk.local>
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
In-Reply-To: <avMmKJpczepWTRdc@ashevche-desk.local>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Arnd / krzk,

On Tue, Nov 10, 2026 at 04:11:52PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 07:24:19AM -0500, Brian Masney wrote:
> > On Tue, Nov 10, 2026 at 09:46:29AM +0100, Arnd Bergmann wrote:
> > > On Tue, Nov 10, 2026, at 09:27, Krzysztof Kozlowski wrote:
> > > > On 10/11/2026 09:23, Arnd Bergmann wrote:
> 
> ...
> 
> > > > There is a build dependency - DTS needs clock binding
> > > > header - so it has to be second, unless the dependency
> > > > is decoupled.
> > > 
> > > Ok, I see. Let's go with Brian's suggestion then.
> > 
> > I see that the pinctrl driver was merged into v7.4-rc1 and also
> > lists ARCH_AMBARELLA. It doesn't cause any build warnings or issues, so
> > I'm fine with this too just as long as ARCH_AMBARELLA is going to appear
> > in the tree.
> 
> We have a bug about dangling / orphaned symbols in Kconfig. It's discouraged to
> have them. I dunno if we get the checker patch being applied (it was some
> activity a few months ago).

OK that makes sense.

So how about this:

- Have Long post a new version that splits out the creation of the new
  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
  provide an ACK on this?

- I create an immutable branch that contains that the two dt-binding
  patches, plus the ARCH_AMBARELLA Kconfig patch.

- Then I can merge the clk driver cleanly. The DTS folks can take the
  DTS changes.

If the DTS folks didn't want the ARCH_AMBARELLA in the immutable branch,
then we could do two immutable branches:
one for ARCH_AMBARELLA from SoC folks, and one from me for the
dt-bindings.

Alternatively, I could just provide an Acked-by for the clk driver, and
this could just go through the SoC tree.

Brian
