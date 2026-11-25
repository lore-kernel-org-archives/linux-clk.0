Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621215;
	b=HmlYloKgPnqpquENcXPltjo351YgczOfXwrXOJNso44puGylBpe4UIPJXdUF67GWcMnR
	 x1piNqVpkYgSNL+4DIwOjYee6vPS2ZGwBU2XFT/4hAiNhgA1wKm6YI3wrtZD7LRllHGUY
	 xkEkzKR9iJBmVLG9aYDzNVBuT9d1VXEYXsEoX85nxWaudEXJ1yAA7ft9+rrPPgmhl4V/b
	 lpdPLYbj6IM+OWIPo0TMOb9FT4TGWwRhoyl+fKIPLnvinnEJNKB7FTVd5U7MXMNwX52aq
	 HHirFgv0qfdTBVfayxt2MhxWtbrLOu8JAkpQfKmaWKzxp6sLDfp9gkmRFSFZiq84MVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621215;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Vo0yv7V1NvB5So1od64WGTrt056xHM+jS6nDksudhu4=;
	b=0OpcjgkbaS4wvJRkBBixSQ2l3KEpMtnlhI/JT3O6jNBWY8XeWqmy8oL+7hw74VnfpzuL
	 DzRrm9PTJ/seBOunPh++Mj2NegWf7ZJE4UY0Mkyb7HEmo8hnIENauNpX+BFxqihp7Sx/x
	 7460x/PAYYT6Yfbkh5ptf3cSyVvq0WqmIyeRUTabvhTFGbaj6KOp5NuUlNII7PUk+ann9
	 T1oWnR/dG3bPJNTKF4r2+Nr+VA8p35ZMhTRJJNGLgdL2SxYNLHW9LHQ9pG8sdHuQXm33S
	 6NlDc4LLxcAHpjIyL9R5OTueDfbmeEA8sNJX7QVUfZZ/Cj6nYNYAmYlQF/7WEiVlziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Htpy3g5Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0722C606A69B
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Htpy3g5Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E811F01562;
	Wed, 25 Nov 2026 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621214;
	bh=Vo0yv7V1NvB5So1od64WGTrt056xHM+jS6nDksudhu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Htpy3g5QQtT9AutvX+04vhFSwlDvI/F6wHL8lSx2Fu00dFJeN/pJtA4yNwm6tP3Yq
	 kBC4EEjZUGQ8MyTHzVfw39gvz16zm4aXPSGR3g8ecTN1g7ryX8RqJkBKlQcWijEH+N
	 oeQfecVB54Mtu8Ovowtf5Y3qKXVBZd/fwA/+ZByYF/ZyFv+wGHHlfTrMDr3w4CArgR
	 g0GrJnXKhjGCHMkMMom6dplCPDcXUZrihjo2jigOzPRAcn6bnbvEdhv8O65N1nxim3
	 QCo/OXpAzas3v+pPccCscfaX9+JMSB0P+xPe7ZV7rTHiklUPfI4njOtJFd9KbeVBRO
	 WP6IsPzyNawYg==
From: Brian Masney <masneyb@kernel.org>
To: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>
Cc: Brian Masney <bmasney@redhat.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, Jingkun Zheng <zhengjingkun@iscas.ac.cn>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
References: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
Subject: Re: [PATCH 0/2] clk: eswin: Fix the EIC7700 PLL post-divider
Message-Id: <179562120730.338124.17758286214024367532.b4-ty@b4>
Date: Wed, 25 Nov 2026 10:40:07 -0500
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
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=752; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=0AvNTPmxzNkEFjucXr+CMHujO4Eyar4Gy4/CIDTWa10=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGSMDWNl2rFmfuWFRsXTNEy/Bpuq62G8+O8V5VYS27
 j4d7CjVUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwESeJzD8z+aSqWm5+YhPZaW+
 3gfmlScOLZsWUf3/9uQ8Kxej4A9q1xgZ1mWuXiNT25r5j+u72nchv9L83KhrC75pWZvOKAkx/Vv
 LBwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 25 Nov 2026 02:41:01 +0800, Han Gao wrote:
> clk: eswin: Fix the EIC7700 PLL post-divider
> 
> clk_pll_set_rate() sets a post-divider the rate math doesn't know
> about, so the P550 CPU ran at half speed. Patch 1 fixes that, patch 2
> makes recalc_rate use the full formula from the TRM.
> 
> Tested on a HiFive Premier P550: all CPU operating points, and setting
> and reading back the audio PLL rate.
> 
> [...]

Applied, thanks!

[1/2] clk: eswin: Fix the EIC7700 PLL post-divider
      commit: 1ad511a38987c827a465da8d281a843ab37774cf
[2/2] clk: eswin: Use REFDIV and the post-dividers in the EIC7700 PLL rate
      commit: 1b6d57e98eb01c3fb8c3b4e287a797b6f7a072ca

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

