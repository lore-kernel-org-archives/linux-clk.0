Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3653BED55;
	Mon, 12 Oct 2026 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841997; cv=none; b=DwN+Zv+k5vIwmEWoHW1/jGOMjQpSj3lCHtZQ71vu5/gvGne1CoktTaG3Sw3wggwLIWHV3Yw4t8GuvlFed8Efi4c+pY/2CNBsZo5UPcLdjoN3fviUFeuJZbVBKq52LATPTEQ8wBmjKsLOHeyUK03Fsr9yA3nYGP96AX3hUPLd4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841997; c=relaxed/simple;
	bh=AxbTsTkAJ4WwtIxBa3Agdgh50AjbujTEIZU+4j74akM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WU6qM8z3QPcOsCAZYuCE9iWREIaykgKsBTrRVT2y3SuAy00rOQSlFhnGNhbILgBiVz9EnpUM1f4lirBvkD9TxrnsjybWLOqD7J3+Gb9c5srHS9d8GkSfAz7WONE8PzIGCmopDd/t+z98CQPe0edijMCdyoINHREOjkaOWB6+q+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJrFbUmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJrFbUmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887E41F0089B;
	Mon, 12 Oct 2026 21:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791841996;
	bh=vTBls61qsig8dGlhb48vfY8DK7dKDeifEb4w5u2Xzek=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=XJrFbUmEzAPmHh8EMmblg0i4F2zRLYLLpIphHRD0+36uAfK6A5KcnN5RgP6135Cs1
	 g/z2D5mdDlsZelTCFs8V3vZKvRyjLjv4KTUvwoH9mP9C9S78pXnwigxWeJa0aeAbsV
	 5VfSgZ+ZBlIzV8rlSiX3cE2uLljGYAnZm5L7yWXgn9SAdSjONSngDhZvui/cI0xrQb
	 uXucITTctaVGlPCyGl1WVWeIVk1yuhcrSaall9tuIwdWjY6atk9rUxcxgOaavFMink
	 pH8uJjpN0vYjL3FXxRuwsNuY1op95TNnM0/f5QZFrnxmvm+OaWjUKpMbKhc6Kjv6i4
	 TnK2kUbT/u0zQ==
Message-ID: <5b7d5543-5608-40fa-be5d-92600c2c9e70@kernel.org>
Date: Mon, 12 Oct 2026 16:53:14 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: socfpga: agilex: register the SP timer clocks
 early
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1790935401.git.adrian.ho.yin.ng@altera.com>
 <b0214433cf10ebc094c6685f60a12abe58860523.1790935401.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <b0214433cf10ebc094c6685f60a12abe58860523.1790935401.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/2/26 05:22, Adrian Ng Ho Yin wrote:
> The DW APB timers are probed through TIMER_OF_DECLARE() from time_init()
> and cannot defer, but the clock manager is a platform driver registered
> at core_initcall(). The timer's clk_get() therefore fails and the timer
> is never brought up.
> 
> Register only l4_sp_clk and its parents (boot_clk, main_pll, periph_pll,
> main_pll_c1, peri_pll_c1 and noc_free_clk) from of_clk_init() using
> CLK_OF_DECLARE_DRIVER(), with every other clock left as -EPROBE_DEFER.
> The remaining clocks are still registered when the platform driver
> probes, which reuses the early provider.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   drivers/clk/socfpga/clk-agilex.c | 222 +++++++++++++++++++++++--------
>   1 file changed, 169 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/clk/socfpga/clk-agilex.c b/drivers/clk/socfpga/clk-agilex.c
> index 2bdea1997b5e..91a80b7b1886 100644
> --- a/drivers/clk/socfpga/clk-agilex.c
> +++ b/drivers/clk/socfpga/clk-agilex.c
> @@ -4,7 +4,9 @@
>    */
>   #include <linux/slab.h>
>   #include <linux/clk-provider.h>
> +#include <linux/io.h>

WHy do you need this include? Comment applies to all 3 patches.
The rest looks good to me.

Dinh
