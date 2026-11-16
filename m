Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863862;
	b=N2ZIcKoy52yvDGZtKXoWvBxAZoWtQ+MrfBPgTaRC0+KspuR1MC4qhXO9yBtgu9VWsRWh
	 Ixk/VtvcSCsgmiv7vuqJz64FWq22MxEGppYoZlsXtjicf6qTmwKa4TAwyYUzpUnHgdcUr
	 cXsc22cdK9d1iQ8OiZrLvDhPbI1LfnhnPpjvDJ7Z9aAr30bLC0M+aJn1fA3UsMd4SRRUz
	 2e1MbJ6XM+voI/uy1HLZ705JeI5OMGvYSOLEu7BIkOm7SBSvDA+8+aO0AWFL3k7+ghlHl
	 kcaTCws/Kz0g2o90P+NKz5YMD3YBoiDrXUI0BCxUwW15QR2rbW4DTo9qqUDdJF2N8AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863862;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=mAEZQLkzA5rc+bXHU//DRX1Kle/RYd2cpmXMc5t2/VM=;
	b=Em/ITgllGGsU4VM8dfkriC4v2zg5JyYn1/68c6G1EBExxYuwu54AEQGZCkHD5G6+VAFR
	 mxOYs2wypN6wp7lAHnagqlOODM999btBpQFkYVjxtS64gISqucMrMx+Jg/pq2yQ8+EN24
	 8ZQ1JWjMVpdkc8dBeupXdfBa4LsjeJeu9cMFQxbfd6kfguTxAn2RpKudvuBDA31dvjaqg
	 HnvVT48Kahq+vgO9VW9kwSbR05WBZYxerRCmkbNj6CvxVF3is1niNNP8PK21xhGRZbO0i
	 FRUqIFdSZZejS7QuxlNGNRll8QmvCbrP/EtyjNV5WI8Rnby5wBWFJRYr2jcTV3eOgog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M52cFIyR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D95E606A322;
	Mon, 16 Nov 2026 21:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M52cFIyR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FA51F000C5;
	Mon, 16 Nov 2026 21:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794863861;
	bh=mAEZQLkzA5rc+bXHU//DRX1Kle/RYd2cpmXMc5t2/VM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=M52cFIyRCeQECNB55sWMDz0h7ctVheI4KZppMUbnDyMkYs7l0MleFsKQWdv785n48
	 QNJs78WvHwjB2gxe13aCltgrmu1en/NhpiUTR8GdR8Zuqn5E3FjI2oqtGAfZWYNoLa
	 TC85cNxdWkmPFNoEt5kr/R/UTEdWlELMiTjexQcUnC8/gF674NVCg/nzR+QxC3R7Yt
	 SWBVcDeX/8NK7EPDyj7m/geX9T9KYj227Lxv3jOwtClkXhNS93QERUPrkkBHjhNUWY
	 2uS19AdJlRYuzNvWOKUpcZ6WTGLOncYehPrNZQFepPgXTVD3XzTWYmvdFV46EaRgpN
	 eptwbZdPtZZsQ==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/3] clk: divider: Fix round-closest for rates above
 the parent rate
From: Brian Masney <masneyb@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Maxime Coquelin <maxime.coquelin@st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Michael Turquette <mturquette@linaro.org>, 
 Stephen Boyd <sboyd@codeaurora.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-2-18f3bb888b0c@baylibre.com>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-2-18f3bb888b0c@baylibre.com>
Date: Mon, 16 Nov 2026 16:17:29 -0500
Message-Id: <179486384987.178014.11385996366214068516.b4-review@b4>
X-Mailer: b4 0.17-dev-ca76d
X-Developer-Signature: v=1; a=openpgp-sha256; l=647; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=n2y8y3b6tA+v7XGUBT99cGRLyn9XrqJrgZpSeOMyMqM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+F70qWf/vLHNtO/u373Oe6R/V+JhwMGPtloqTvFpb1
 aR9edOcO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI1w0M/50uK9ll30pMPPvS
 oWbj+QD7uVO7S+Ma/afcqfjxzLf74kdGhjNfrh+R4W1xDPjAIsVYaS72njNn07ZN1Y8tLBM+sH2
 I4AAA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> When the requested rate is above the parent rate, _div_round_closest()
> computes a down divider of 0 and divides the parent rate by it. Asking a
> CLK_DIVIDER_ROUND_CLOSEST divider without CLK_SET_RATE_PARENT for its
> maximum rate with clk_round_rate(clk, ULONG_MAX) then traps on x86.
> 
> No divider goes above the parent rate, so the smallest one is the
> closest. Return it before dividing.
> 
> Fixes: 26bac95aa88c ("clk: divider: fix selection of divider when rounding to closest")
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Brian Masney <masneyb@kernel.org>

-- 
Brian Masney <masneyb@kernel.org>
