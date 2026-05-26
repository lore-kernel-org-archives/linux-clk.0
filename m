Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6E61C862F;
	Tue, 26 May 2026 02:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763682; cv=none; b=ZNIfEvPmLMV4O3R05pQPlRtt0e1My+0aCfxsoMLl63K8RpE1mJMWsvCMGnktyCFDaGzpGYNqCUGol5qwBMWjnsgehagLnw9iHB1959eiGvcJbMELzUZQdPy0fA9+L34Fg3JVxHqre24jekYNA3yMR1QjnlfQZPXlMY3kEj5NBag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763682; c=relaxed/simple;
	bh=8a9m7kLY8So/2NT2t3ZXYEZtGa+HWhHArshinzupqSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VpznqkKXQSwYs4YkOcY+mHsMPLTm9Eb16/Kp56YvVaH4/sEgXS/Tng7sU7m79UCTSKAKTIwSmfHcDm5ktP94M1LaTURZQJL/QA0340QSaaXERzNOw8/jjS/bkCInQD3Vi3ki9aNrBvbM0odjrIJ9AKDQ7gZRnd7m1an1YxA/7tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9iwrQQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9iwrQQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC271F000E9;
	Tue, 26 May 2026 02:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779763681;
	bh=pxOgqfRKsGA1FzBczg6kpVvyTf61ybi+CWTb5xCwHLg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=b9iwrQQQlVuiSpQ5hlX9Rq7ocfVFtHFgCrp/LMPttRB0p99cwkNXNac7oKKhYTclE
	 fGIoYGkO19nYoMnBJrB7eyefLOt0j6D2QSonBS9ayi0UG9dzXGJGvoVmA889gcIkzF
	 JgSAwL1OY+MhqemelObprpzbIc55ih1kUgPOHbFHc/zMIHlEVTCvSn/aHZxMVi1ez/
	 ilL1VpE/6V4OVJBxpb8O9MuHHK7gpRij3zs5SaDXVH6D6q3PqQdBPl+1yEgcQfRmGy
	 g82FolJ8Kw/tXyPdSv9ATLuB2EbwKDgjsxiCf7eAWqQ4djjU7b1ztD1Codjyq4Siv8
	 I8VdphHblZLZQ==
Message-ID: <e718b395-1fd7-4ddf-b5f1-0291640b7da0@kernel.org>
Date: Mon, 25 May 2026 21:47:59 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: socfpga: agilex: implement l3_main_free_clk
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9f35b944a8bfc79ff17e645d2d3662824e57cffa.1779439821.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <9f35b944a8bfc79ff17e645d2d3662824e57cffa.1779439821.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/26 04:02, Adrian Ng Ho Yin wrote:
> The AGILEX_L3_MAIN_FREE_CLK is defined in the dt-bindings header but
> was never implemented in the clock driver. Per the Agilex TRM,
> l3_main_free_clk has no divider or mux and is a fixed 1:1 derivative
> of noc_free_clk that clocks most of the interconnect datapath.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   drivers/clk/socfpga/clk-agilex.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
> index 8dd94f64756b..2bdea1997b5e 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c
> @@ -259,6 +259,8 @@ static const struct stratix10_perip_cnt_clock agilex_main_perip_cnt_clks[] = {
>   	   0, 0x3C, 0, 0, 0},
>   	{ AGILEX_NOC_FREE_CLK, "noc_free_clk", NULL, noc_free_mux, ARRAY_SIZE(noc_free_mux),
>   	  0, 0x40, 0, 0, 0},
> +	{ AGILEX_L3_MAIN_FREE_CLK, "l3_main_free_clk", "noc_free_clk", NULL,
> +	  1, 0, 0, 1, 0, 0},
>   	{ AGILEX_L4_SYS_FREE_CLK, "l4_sys_free_clk", NULL, noc_mux, ARRAY_SIZE(noc_mux), 0,
>   	  0, 4, 0x30, 1},
>   	{ AGILEX_EMAC_A_FREE_CLK, "emaca_free_clk", NULL, emaca_free_mux, ARRAY_SIZE(emaca_free_mux),

Applied!

Thanks,
Dinh
