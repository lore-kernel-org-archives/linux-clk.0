Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0CC425862;
	Wed, 29 Jul 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314318; cv=none; b=jNgVWtk66uHz54/pzJQBq4AlAk7H8KM5E9IEfJsR39aWrrQ3/gG3VXYOWlU9dshiHrYM0WjzQHWE5arS9uJ/kAsaIqXCLwG05Ie+XxgdiaeCwWICgedkhDjPHzpVxOb+GOKQsKXoBT5aViZVJ73/Op+grEHAmkfz/8XcbG/0yks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314318; c=relaxed/simple;
	bh=mQusrFz3OyuSWO9NxPU1k1JP8a64bekTduq9i8UdhqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQJOVOeDRiW2qtNRuRG7FyD8LQ2zdRderPUOiCY2Sa0ynp+SB1D/i5oNW6K83tbSLhtnoNjjBd48tywWJCyxGooZLq1rOsgyo7ldSlvfTijVqq3wQRJQfIg8pOO3DjYa8Ik5v3rdzbJxFsBkXt9/8WSLvuqndVYnkPzWw2pO760=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=kSyrsvfu; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="kSyrsvfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1785314305; bh=mQusrFz3OyuSWO9NxPU1k1JP8a64bekTduq9i8UdhqI=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=kSyrsvfuzVPAK6yMZO0m5K31ueXpTo7gtNJxYlQylag4AfA5cOH950+70TbTrTzSw
	 nIZKttmaEXTZJYVowZJ1hekfUEdbYtSJzfUft3h9YwOtdLQpVg7ZCmmkEMfg51eO+Y
	 yuFSZ1XJpBJS185dcwb0Et+oY2GIlggLFI78KiLw=
Date: Wed, 29 Jul 2026 10:38:25 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: sunxi-ng: Change NKMP algorithm for finding factors
Message-ID: <5r4fxm7e2ooagq55nst2hblyeixrk7p3hijqra4sehzbfionvu@fwkwxhrjcfue>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260725122645.2270876-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725122645.2270876-1-megi@xff.cz>

On Sat, Jul 25, 2026 at 02:26:40PM +0200, megi xff wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Current algorithm is very slow. It searches inefficiently in a brute
> force manner through all possibilities all the time.
> 
> Eg. it does >1500 iterations on every rate change twice, because
> ccu_nkmp_find_best() function is called multiple times per rate
> change.
> 
> New algorithm determines correct NKMP factors typically in 1 to 3
> iterations if precise factors can be determined for M = 1, P = 1,
> which is a typical case. If CPU clock frequency can't be derived
> precisely this drops to average 8 iterations needed to determine
> the factors.
> 
> The results are identical to the original algorithm, except in cases
> where the original algorithm does not try to satisfy SoC PLL clock
> constraints, like N*K range 10..88 or P factor being limited to output
> frequency < 240 MHz.
> 
> These restrictions are based on A64 SoC datasheet. Although they
> are sometimes not documented for other Allwinner SoC variants or are
> slightly different, this is still a significant improvement over
> not respecting any physical restrictions at all, as the previous
> algorithm did not. Hardcoding the values if fine, until someone
> finds some reason for not to.

I withdraw this patch. I reworked it with clock specific settings for these PLL
specific constraints (instead of hardcoding) and I'll run the new version for
a while before submitting again.

Best regards,
	o.

> 
> Motivation for this patch is that cpufreq schedutil scheduler thread
> manages to load one core to 70% all the time just doing these calculations
> while the core is running at just 24MHz during frequency changes.
> This helps improve the performance significantly.
>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> ---
> Sorry, I don't know how to avoid overlong lines here, other than
> maybe not indenting 3 toplevel for blocks and keeping all of them
> at the same level.
> 
>  drivers/clk/sunxi-ng/ccu_nkmp.c | 80 ++++++++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
> index 25efb5b37607..c39b19891431 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkmp.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
> @@ -32,40 +32,70 @@ static unsigned long ccu_nkmp_calc_rate(unsigned long parent,
>  static unsigned long ccu_nkmp_find_best(unsigned long parent, unsigned long rate,
>  					struct _ccu_nkmp *nkmp)
>  {
> +	unsigned long _k, _m, _p;
> +	unsigned long max_p = rate >= 240000000 ? 1 : nkmp->max_p;
> +	unsigned approx;
>  	unsigned long best_rate = 0;
> -	unsigned long best_n = 0, best_k = 0, best_m = 0, best_p = 0;
> -	unsigned long _n, _k, _m, _p;
>  
> -	for (_k = nkmp->min_k; _k <= nkmp->max_k; _k++) {
> -		for (_n = nkmp->min_n; _n <= nkmp->max_n; _n++) {
> +	for (approx = 0; approx <= 1; approx++) {
> +		for (_p = nkmp->min_p; _p <= max_p; _p <<= 1) {
>  			for (_m = nkmp->min_m; _m <= nkmp->max_m; _m++) {
> -				for (_p = nkmp->min_p; _p <= nkmp->max_p; _p <<= 1) {
> -					unsigned long tmp_rate;
> -
> -					tmp_rate = ccu_nkmp_calc_rate(parent,
> -								      _n, _k,
> -								      _m, _p);
> -
> -					if (tmp_rate > rate)
> -						continue;
> -
> -					if ((rate - tmp_rate) < (rate - best_rate)) {
> -						best_rate = tmp_rate;
> -						best_n = _n;
> -						best_k = _k;
> -						best_m = _m;
> -						best_p = _p;
> +				u64 nk = (u64)rate * _m * _p;
> +				unsigned long nk_rem = do_div(nk, parent);
> +
> +				if (nk_rem != 0 && !approx)
> +					continue;
> +
> +				if (nk < 10 || nk > 88)
> +					continue;
> +
> +				for (_k = nkmp->min_k; _k <= nkmp->max_k; _k++) {
> +					if (approx) {
> +						u64 _n = (u64)rate * _m * _p;
> +						unsigned long tmp_rate;
> +
> +						do_div(_n, parent * _k);
> +
> +						if (_n < nkmp->min_n || _n > nkmp->max_n)
> +							continue;
> +
> +						tmp_rate = ccu_nkmp_calc_rate(parent,
> +									      _n, _k,
> +									      _m, _p);
> +						if (tmp_rate > rate)
> +							continue;
> +
> +						if ((rate - tmp_rate) < (rate - best_rate)) {
> +							best_rate = tmp_rate;
> +							nkmp->n = _n;
> +							nkmp->k = _k;
> +							nkmp->m = _m;
> +							nkmp->p = _p;
> +						}
> +					} else {
> +						u64 _n = nk;
> +						unsigned long _n_rem = do_div(_n, _k);
> +
> +						if (_n < nkmp->min_n || _n > nkmp->max_n)
> +							continue;
> +
> +						if (_n_rem == 0) {
> +							nkmp->n = _n;
> +							nkmp->k = _k;
> +							nkmp->m = _m;
> +							nkmp->p = _p;
> +							return ccu_nkmp_calc_rate(parent,
> +										  nkmp->n,
> +										  nkmp->k,
> +										  nkmp->m,
> +										  nkmp->p);
> +						}
>  					}
>  				}
>  			}
>  		}
>  	}
>  
> -	nkmp->n = best_n;
> -	nkmp->k = best_k;
> -	nkmp->m = best_m;
> -	nkmp->p = best_p;
> -
>  	return best_rate;
>  }
>  
> -- 
> 2.54.0
> 
