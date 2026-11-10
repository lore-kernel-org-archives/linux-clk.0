Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270342;
	b=YgfG/uY6dE+k84z17nNifUEO2bkpMbJUjbjuRpaiD7eAzDaXtGKDrzEIw99ItIMIMp7F
	 vhoMcVQtCAALa64UT2KnpCOnlSTSeoLZNROtD5Trpe15QbFmGTHmyIhzaRHedGJZtEBwB
	 9cgGYcpu8McIy35O42oAl8q0sT10MxuQk30hqnaw9hqvbrpvkvn9gyb3PGA63UeEd5z/D
	 ogAK9L8W+Mpb0bWmuRYVoN2A67+9ryYb/m0TKUaipCF39uv3BZTeZ0LwnysbLVS4o9ZLp
	 EOgFK8W0bUse6/48j7OkwGkILmBJ3ey6CjYljbLFORQL/G4UccbhUZuRg9yFNrzf/JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270342;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pJ0OnwFzpVGOcpG4FFUqu9MlnPQTgb380nxJ31XSWJM=;
	b=OXkf2zLwGi+5mpG7k/XlP2/ir2u/r6R70L7M7EPRsN5IeyVyPxU2pwg8RJEJy7W6D8Dv
	 1MwWa6PhmtCMQXYhPGWzcBIOni6Le0nJ0qekiq/W5w6LLfb0gOVsKlVUJOHLb3u2aR6aO
	 D9MXHIGCxBXVfcKe6HwSCEnU1cGq0zd0c/PmVS6LUkzzvGalUJmC6ZkttpS9pUsvZpuyM
	 vEhkBSdD4gLzS29Xd/SAtR/YkDD7y+C0CUY1NLYqRnWQQYnoxZFz3JlTDX/sfzGUIVsM1
	 bwjWR5mDEgyWmIw/MyAh0+j/n06RlvsbwqvPBBhG9k/qdBZyLqI0QX86ZQb9CL06vJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExnotNNp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAAC606A321;
	Tue, 10 Nov 2026 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ExnotNNp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BC31F008A1;
	Tue, 10 Nov 2026 00:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270342;
	bh=pJ0OnwFzpVGOcpG4FFUqu9MlnPQTgb380nxJ31XSWJM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ExnotNNpyf+7X6LALstUp7a+UCi3MOD03gKLJi17QSrfj9pibNHnzzMvjecT6kd9Q
	 Nk9Z8//hhHxTU0PJJFkk1ywLviurW5xNSBNpoZb2SshsNfl5dy3Ah4FnKZl0KhyasS
	 ntEjGRRjgllzE4ortdNWUggemyCTf/o5AT7H2tNPnhhjSTPhGyMth07RgiP4kDTPv+
	 gaHVGxYBq5l4M2NIaS0R/LQVi333ZrLIiyb7w+a4+oGDUzt1gN674cNc1VU5S7RMaR
	 7/WiltxV3duluNxeY0wZe0nYT37JsrKmbUSkQv2Jc7UJ0kPmCX+CDMk7qW7OKTafJP
	 KmAmMYi6z12Ig==
Message-ID: <cd53c182-e36b-4076-a8ef-8ff13330f774@kernel.org>
Date: Mon, 9 Nov 2026 18:25:41 -0600
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: socfpga: agilex5: register the SP timer
 clocks early
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
 <289d5974c114e5bc71905e576a08302f7d8be6f5.1791871090.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <289d5974c114e5bc71905e576a08302f7d8be6f5.1791871090.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/26 02:07, Adrian Ng Ho Yin wrote:
> The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
> and cannot defer, but the clock manager is a platform driver registered
> at core_initcall(). The timer's clk_get() therefore fails and the timer
> is never brought up.
> 
> Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
> main_pll_c3, peri_pll_c1 and noc_free_clk) from of_clk_init() using
> CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
> The remaining clocks are still registered when the platform driver
> probes, which reuses the early provider.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
I think this needs a Fixes tag:

Fixes: 2050b57ecda0 ("clk: socfpga: agilex5: add clock driver for Agilex5")

and the Cc: stable

Other than that, it looks good to me.

Dinh
