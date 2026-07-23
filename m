Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA0738C2A0;
	Thu, 23 Jul 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802810; cv=none; b=pmhs1mkUYBArdnqEt/mbqrH/Zac3nXJVjUY445WpPMPS6dY7yTkPTCuI1qJYPAZ8kIogxkIBRWjQDBOuTyMUOHgHRLH/ndowOpbB3Y9U4Lnr03A+NMA0dpCHeBobnIFON+UFyUJbCBg+FO0nFlUPF8VtNKSxr8tLsZC+CReUGio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802810; c=relaxed/simple;
	bh=+dfNWEEgdYLLcwUrcBbVrou+9TgjN530XCCSf+eGeUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rq17kNvBoBYJhFmew0SOTz2UZ9ToE1en19FWGdkwHfUrFO2KRFTne9S45BBRjyNWR4fQESvk82pwi6xjLVw+l0v9bEjb/zVb86eYvjXG/n9RAt4onDymM9apkjF+3Ff6ER1wHkdfxZ3PZY/7ZRPWXR5Xs1pv7SiuU9IGHhSI2+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=XrV34SMb; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="XrV34SMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1784802775;
	bh=Nke0i/JTdEBAOMHCaZMWt/DlDNqZ5T/UfW4FQxOno1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=XrV34SMb71i4HhqMmxAxK+PFBbf3A0U1GoS8y8X5PVxZLhr2fvJmJ9E/P67+w+xUh
	 EgtbmjQAJ95+uxD/G9njOA417OUnDIhs2K/RCZiBeKRzbdEwKKZ/UBm9OlXEDvQeRQ
	 gk3U3cNYenW0ab6hV/0FVuVgnGtKcLrg9pMU24dk=
X-QQ-mid: zesmtpsz2t1784802770t35b5fb83
X-QQ-Originating-IP: b5Uv8wOMovQ+QXu/2dOXjuxoCPnrNY23T+SUkFndhfU=
Received: from [172.16.12.90] ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 18:32:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4791706803425340570
Message-ID: <5676B227B50EB88B+ff62bc9e-5175-481a-93f8-c1de7f68eba2@airkyi.com>
Date: Thu, 23 Jul 2026 18:32:47 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: rockchip: pll: Fix the fractional part
 denominator on RK3588/RK3576
To: Alexey Charkov <alchark@flipper.net>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
 <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAeO0+xU6W76mF5AnUSgW4uGeBbVM4juVrPCYXAGRLYOJWRPpkie7+Ar
	3ixKQvLhiJsQBJIbbTawbK5G0PxCBm6UiVQ1L0rW9PGL0N5MXKIarXNqMDjY0fJhibAa2ya
	10KLx2IuiU/11nioAqSUIkFBP+Q0CINHfNOCExLYFBQr6YS/ufd1++HBHCTdc/IA6FTqge9
	Fb1vjr5ASbmWT90d0qjdYLo/36AdJNkxn3gE1MkEXEP7YWtYXOECC/Wxd+BcCljZgidBtaX
	qu+8ucKBQR74/bOsS+Y7mcuqBha5jZ4PLUgZkmDmOfY1KJ1fR9uD2htSzo4wkuAuez6TVAl
	Wlx3gQWikFkv0rTRv8hjem3syDEXvX9Ew6tVEkt2jhzLafgfKcfJWkMJVgNeInVGvJHTaex
	hibGYTgl24GA1ZUcTDTPVRLnM6dENHetUVhwbA3Wyw4huJiwCaZWY97ZMnpDgE9d5ZpnJpg
	rVuAg+6JDWYPTc12pWkHw3ANs2RE0yuDnzZs0K6hgN/2mzH3jAaU4If9QZLyaCZsYiwrj50
	xGTi54xvlJDyDWYikRJTNze1t7FFaAUISxqsVeZSJSWenhifun2LF15UwIBv7Z/BA4YBWas
	ww160Hjr4YerNbbW4mDHHVSF4eFRqeyeiErpuO0NSmEz6LXDptZMJ9Gb700A+lrUmA353hV
	J1Bti7uXDhcBiiKkFEKIaXmdonwmbwI8AaGahxN1uU9Dai4tybeaT4jGcp0NBkQgEZ0zLWV
	izuOGxfafWNqHZl3Y7GJvS3gGAQtNA4uX5oTfmLkxHmCbDdmCn8qkyDGTUT1AusywaebLkU
	5UzkvdsUJV07p+Repn3iB2otQVhGvIicxNE5J+rbmVvmAStTmOwXWoCzE5z8lEvZykRqmNm
	NkJ9d1iHQvJQ8gw07TEE9YmD3srzYLplBQjmnQ0tEptvKsAw0annKJQYTTc9voKnLM1029v
	79e3Z0MWEAFn8p+sOZxzgDWYwGNhh91L8C5runvjwifM7sLOHsP1W5B6l
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Hello Alexey,

On 7/23/2026 6:21 PM, Alexey Charkov wrote:
> According to the TRM, the fractional PLL coefficient should be divided by
> 65536 rather than 65535 to obtain the output rate.
> 
> Fix the denominator and add a comment with the TRM provided clock formulae
> for future reference.
> 
> See RK3576 TRM Part 1 V1.2 section 2.13.1.4 Setting Guide on P, M, S and K
> or equivalently RK3588 TRM part 1 V1.0 section 2.17.1.4 Setting Guide on P,
> M, S and K.
> 
> Fractional PLL rates don't seem to be used by any current mainline
> consumers, so this is purely a correctness fix. It will also be important
> to properly support DisplayPort output going forward, as the video output
> controller derives its pixel clock from system PLLs with no dedicated PHY
> PLL option for DP unlike HDMI, and some display modes are only achievable
> with fractional PLL rates.
> 
> Fixes: 8f6594494b1c ("clk: rockchip: add pll type for RK3588")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/clk/rockchip/clk-pll.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
> index 6b853800cb6b..bf8acf7cee0d 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -900,6 +900,13 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
>  	rate->k = ((pllcon >> RK3588_PLLCON2_K_SHIFT) & RK3588_PLLCON2_K_MASK);
>  }
>  
> +/*
> + * 2250 MHz <= Fvco <= 4500 MHz
> + * For Fvco > 3 GHz: period jitter +-1% frac PLL, +-0.75% int PLL
> + * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
> + * Fvco = ((m + k / 65536) * Fin) / p
> + * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
> + */
>  static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
>  {
>  	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
> @@ -915,7 +922,7 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
>  		/* fractional mode */
>  		u64 frac_rate64 = prate * cur.k;
>  
> -		postdiv = cur.p * 65535;
> +		postdiv = cur.p * 65536;


How about using 65536ULL? Will the multiplication here overflow?

>  		do_div(frac_rate64, postdiv);
>  		rate64 += frac_rate64;
>  	}
> 

-- 
Best, 
Chaoyi


