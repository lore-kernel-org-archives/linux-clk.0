Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCF442138;
	Fri,  9 Oct 2026 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526266; cv=none; b=W4843UklOEK5QdOFT2hU04OK0s81wWfnApZyMAgD41WYX3OL20Y6mOY5gk6hGerbReuyBfkzNXf1WRVhcCrN2Vskz5bxKE3TFlRigUgoNCOMWKHvSGtCoP2mF/ZXnAV20+aAECT9eqwQ6AJlUMpzbT9BGBmG7y6Dw5006Q+VK4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526266; c=relaxed/simple;
	bh=kNjC6FwstwBb0HZFRPvHGiWDSmN9lqpoTvjU96l8ouU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3A4a4c0CommMnQTrvvJp/53e3QkPO2SSk9w2KwHc/gAFQkke4/E7pUXGQkWUCYLC3PzTMQRzK8KP21Ra1IsOR7H1PrxIC81KCButPV4Y3eVFY981zAK8M+4B4qfJyUcMHzL8RyiazB6n2ChgP5/zAd8gv3VPvAtodKlryAHPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMKBbQm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMKBbQm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E211F00898;
	Fri,  9 Oct 2026 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526264;
	bh=QspHgvhexBo/96gD+93/ZvCQ+ECziB5aSNYOJ4PzkgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cMKBbQm5T0RW9UEpxoochiCoroChcortLtbVt6zfW/367irjuWv54gbHg4Pmla2NY
	 +ofSFj1KD636ThX1Si8snSQkKKmDQ2CnXNAyi8S+2rmZL72JBmfY+DqDYqpmEVlaQb
	 Lrl+Agw5U1PqQ7ZTzuLZVkB9WlfOB7gCRvE1dhccjC2CEJAKLXpdiR6hx4SSpZByK+
	 AZAhkRjrOZ5ieFhVWsJShx3zQaqTGFG9SDpKGLS3OuCJYtLnXezZ6lBZd6yWR0GN+x
	 dRke3sbO16lv6ycm7IVvpYqG7pEm9LqRabOqYNb8rFbwwUejoRFH8NlgcWkQhLosvl
	 ACU/yPIDMYKNw==
Date: Fri, 9 Oct 2026 08:11:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] clk: at91: fix device node reference leak in
 at91sam9x5_sckc_register()
Message-ID: <20261009-graceful-visionary-capybara-efbcc0@quoll>
References: <20261008163052.2685401-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008163052.2685401-1-vulab@iscas.ac.cn>


On Fri, 09 Oct 2026 00:30:52 +0800, Haotian Zhang wrote:
> at91sam9x5_sckc_register() calls of_get_compatible_child() to look up the
> "atmel,at91sam9x5-clk-slow-osc" and "atmel,at91sam9x5-clk-slow" legacy
> child nodes during DT backward compatibility handling. Both calls return a
> device node with its reference count incremented, but neither reference is
> ever dropped: the first is simply overwritten when the second lookup
> reassigns child, and the second is leaked on every return path, including
> the unregister_slow_* cleanup labels. of_clk_add_hw_provider() takes its
> own reference and does not consume the caller's.
> 
> Drop the slow-osc reference once it has been used and release the remaining
> child reference on both the success and error paths.
> 
> Fixes: 45b5ec8498ff ("clk: at91: modernize sckc binding")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/at91/sckc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 



Multiple things here:
1. Your team ignored completely previous feedback.

2. You use multiple identities with this email, thus I actually doubt we speak
   with actual person.

3. Finally, same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document usage of LLM and how what you should not do
if this was posted in a good faith.

Best regards,
Krzysztof




