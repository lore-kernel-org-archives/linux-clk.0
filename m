Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538121;
	b=nznYlYIWfNMe7ZQfDHkvdDv2/lmlS1jdG278R98S/Gtlh2JJDy04wyTa5vJvla/2z26r
	 7satVCHqerfonQ17zKde+HgYINUlI1j5GNR+8QbCZrHCl/Y9RKauvlDIMtEiii4fMUvlP
	 wwWwhBiXra/Yolio/ZB8YexLmlwAlQJtp32lUmFdVaz6vImzTDwCHAqPlcsM3Iv92UOxB
	 5zBsm0aPtaf/3WqDNT3wR5sEh95tBw+c7nGnCFstPfIfQ5TBqUNDHrRxZv0B1V6minP91
	 ZNg2ccQ484mOEKfmsTfuKRpx4/Ah7BPI4lwTrfv0LJEJ2arIMCoIQ49a6NmEmPuRa8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=OY/Zl+lwKH/e6ynWkvNXEhIqQBGIHtdz6KyUOa65gk4=;
	b=jZj6chOjKHtZtdPTF4UGIq08lqI5td2Ywe28l07eTGCUHXvl1i5kJRB8yyUGpD3jfNmh
	 5d49awTHiOwHhjrLoPo6wIEZ2OeqJCo8wxlIbUttPWN9FqmZkWf1W6mbdFvMGoDyOO4bx
	 wdVOh0LYdiXZQ1HNps23Gp3pX5dz65D3XNFWkbM9hDzrV50SiwMpTX24VS0UHjxABiFRf
	 gDsURgP2OLXndIUSHpm+RkCA560mqZCSoXW5IR03IsLHsROnZWy6gnt5eu5SwgQDJkcMb
	 9iK2+83otYFVFCBXcyODJ2246vHiJk9L+gMALabNS9KJyS8eN0gqdaR+9tdgwUYHvsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKgPZfO0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4010D606A31E;
	Tue, 24 Nov 2026 16:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKgPZfO0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776831F000CF;
	Tue, 24 Nov 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795538120;
	bh=OY/Zl+lwKH/e6ynWkvNXEhIqQBGIHtdz6KyUOa65gk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fKgPZfO0bpz+MsGiqhCHtR5RKko4H98ofGIw2qvV9HdCFLxfz/MGHTVsqJ44ThHe3
	 aOOAfDNeCGhQ9LfXOj92uQCVnVXTvGGzAr7id+Uy3ImC9/lgY0OqeE6+KP7oRYoesZ
	 9OdJgQ6SBOdhfXBCaYNEKhy0vqhzkVmzxxbiK9/tZ1j6nFV2shY+8QuaAANbCqpJ77
	 rUz2n/PwgEyvTmtSXWGqXr/FObr3rk7CtmyBoWxicPeb/BTzeMZ+C4WB/ObjqOvP2e
	 puwDHzprzrYA23TTyG8BDkOcQ8DQbBt8jA2meFWw/qPkNwKuHVDSBIUq1OpNYIMaf1
	 4nh0WFVemi07Q==
Date: Tue, 24 Nov 2026 11:35:16 -0500
From: Brian Masney <masneyb@kernel.org>
To: =?utf-8?B?546L5rWp54S2?= <wanghr2026@mail.zgclab.edu.cn>
Cc: linusw@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
Message-ID: <awW8xNY79j-sP4G-@x1g10>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
 <179509997129.279270.1694900680492734463.b4-review@b4>
 <6898ef95.3261f.1a20296984c.Coremail.wanghr2026@mail.zgclab.edu.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6898ef95.3261f.1a20296984c.Coremail.wanghr2026@mail.zgclab.edu.cn>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Wang,

On Sun, Nov 22, 2026 at 05:29:13PM +0800, 王浩然 wrote:
> Thanks for the review.
> 
> 
> devm_regmap_init_mmio() cannot be used here: the only in-tree caller
> passes dev == NULL.  icst_clk_register() is reached from
> versatile_auxosc_clk_setup(), registered via CLK_OF_DECLARE:
> 
> 
>     clk = icst_clk_register(NULL, desc, clk_name, parent_name, cm_base);
>       (drivers/clk/versatile/clk-versatile.c:81)

I merged your change. I welcome another patch to remove the unused
struct dev here.

Brian
