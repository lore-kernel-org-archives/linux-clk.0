Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130133;
	b=umJHoMK4c8PRvUTkuJRW872pS/1JsLp8yShl6zbSbAPboXEXYlXeVvuj200ca8H6K5d4
	 FKjhwmHWH0fYsOIcp7chPJN1mphYknRfo97Z4ucNhikevhN58MZ0FSpc/kPtlxvyzYXEO
	 oN3UUwUufbljfpXkieJwIYDU1lwRzTm1aBpESS9DlZBgsvWP/4UyqwPM7s20G6Ai7ObNJ
	 IFk96bPF4FBXw/1IBU15kcPy7QipII5+hQigqywxYnQdMCr12wves9FIdP/jo48rFhibp
	 lvbBYAKYnfMCOfk3ydo1lp14oF643u536D5Nb/FkVZ8GEXYsGnEHeQz1Y19mwF56Mbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130133;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=x/9A3QQAgtqvZFKRZTIXKDkzxXMY82r+Uxy1GUUYeEw=;
	b=e98QNs9XBNv0g3Oe4JQhl+gl653foJkKMTzJf8YHwEe8kBsmVkWb4Lyc3DKSRNHDTtR5
	 d37nCV9NyE+s30kaSvwEv9QiD1hlEUoho0mKic/Kx59IWZLYeTRuWEViD1wC3LO773pj7
	 O4GoDf19rUbbdGTU6zUEqpiTldSPuO1S8ImNnnHptKvzXJ91gMKyDgGbH+ArIy/7ycf0b
	 B2CLBr+9iIlj/HjBDybKyiPbebv8NZ7gCCcA1KFm5tIa+zU03zS7pP1CkrbwZTF06sjL3
	 rMSfusW/l3QmLUycnw2kdq1Xiu97j4DRHbnget8vhaTrIzmQtgmVuI3XoNZN2bcQI8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpxunfk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE83606A320
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fpxunfk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0EA1F000C6;
	Thu, 19 Nov 2026 23:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795130132;
	bh=x/9A3QQAgtqvZFKRZTIXKDkzxXMY82r+Uxy1GUUYeEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fpxunfk2YKfYP0h5TTKfqZcCBFbWd7w++cHSNo8aDjy45F9RjrDdHH3TEPTnqR5f9
	 NiUgtdpDcwAEFpBESBZp7qr8NRr4NqgaLDet8vJW6HW6vY3ZekKmpKS4vEs0GCnhXT
	 sr2vDLaZMAcK4N6yZAK+cF+LsiVc4/O//FR7cNg8M7sgQx/c0p+FEWG1WS270b3qjd
	 axwDbfYGEc7L/FQV5O6e9ciNvfYHPGdARwDjGLEQohNaMy65VjxBBeExjDhQE1VCpd
	 JehSXp+AMjNmJyPvvuPRkAx1rrPfK7tc0H8MFnQR7/koLJ7JQ/rKZyYsrr50A56GZA
	 KA6lgvtPlHV5Q==
Date: Thu, 19 Nov 2026 18:15:30 -0500
From: Brian Masney <masneyb@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 2/2] clk: en7523: add support for .set_rate for en7581
Message-ID: <av-DEjQ-DwX_zE18@x1g10>
References: <20261117180213.88046-1-ansuelsmth@gmail.com>
 <20261117180213.88046-3-ansuelsmth@gmail.com>
 <179511794323.284394.3927169878877033939.b4-review@b4>
 <CA+_ehUxpNk-2goT22GB5Tx0+NNhHR=c+1VpriaX8D+Q6kbK3dw@mail.gmail.com>
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
In-Reply-To: <CA+_ehUxpNk-2goT22GB5Tx0+NNhHR=c+1VpriaX8D+Q6kbK3dw@mail.gmail.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

On Thu, Nov 19, 2026 at 09:05:53PM +0100, Christian Marangi (Ansuel) wrote:
> Il giorno gio 19 nov 2026 alle ore 20:52 Brian Masney
> <masneyb@kernel.org> ha scritto:
> > > +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> > > +                                          unsigned long rate,
> > > +                                          unsigned long parent_rate,
> > > +                                          const struct en_clk_desc *desc,
> > > +                                          int *div_val)
> > > +{
> > > +     *div_val = divider_get_val(rate, parent_rate, desc->div_table,
> > > +                                desc->div_bits, 0);
> >
> > I think you should use divider_determine_rate instead for the rounding.
> >
> 
> For v7 I have a better implementation but for the set_rate I will still use
> this version that doesn't round rate...
> 
> Tell me If I'm wrong but it's determine_rate that round the rate.
> set_rate should only set the rate based on the req->rate value. Right?

That is correct. The old API used to be called round_rate, but that's
now gone.

Brian
