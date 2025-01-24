Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2A78F57
	for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730958; cv=none; b=gXN8ZgaSq4xnZS59WMvOcNLgYsqNgIGmUN93Rt+f6j+8nrp+qCwLIMTPe+nJdrlfFk10x7J+fC3V0Figm+2iXMFgWbGf8xv2eNz584V4R7YaX+Cuu7R2i7SzwBG2WxUTSCydMXYx/Fk0lebwY0Ga0BaVeoyCZulTUooB4LF3pWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730958; c=relaxed/simple;
	bh=DOW7ZQCoyBFfJmoCI5MTQFFq9YjIfjcsUIXQyLyB98w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVfq817lrepdPy3QNVYVptEpyhQndzZpfb+Xmlai/ZbzGuCWuWw5ozRC5Qm/7iFB2FG3iDQe5m8DljtHepeI3tzT4uzryxThkduMO1ZCUmMWmtllGCDHWSMwkQtI8U1XT9rahFscbXQi9iQdHYWKCJqMMUfvwhI+/rFjtQ70nLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=grsCwhtr; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="grsCwhtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737730956;
 bh=MsYLWrXefMP5m34iCp3jAP9mKY5iNXf4rWORER2MwmY=;
 b=grsCwhtrDfyUZT6VOFPQs1Wz+mLNXKJM9ogR10hjYtJfqQMQa7NyKaC/kFghHLntlbk1ZHyUW
 4yJXRHal6lUhDXPWFQZ3wyF0p64N4JXnOFjMvo6sxlWL2HrJsSIcmFUyD0M8iwcFoPwWe/SE5yb
 5y2eyQ7jw63ZnQK96g8JpCFIbRTzJtdMURzrlk8A89ZHGvevKLa8NZsbo2flpDXh4O3rQIHkqhy
 OSkc3CJjpzI5CxlUqjWpkpNe3dX1fdZK/1NHvaJwkUY1MImdBADJ/Ht3520EgInY8D6iDWzIT96
 HgBfKjSAlYPY5fqEdFoEdQeEuY8OYlExMKX1HsCwWvZA==
X-Forward-Email-ID: 6793a67f3e07d3fa850557b4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d95d317c-5f6e-42bd-94a9-e1a6c7685e2f@kwiboo.se>
Date: Fri, 24 Jan 2025 15:40:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] Revert "clk: rockchip: Set parent rate for
 DCLK_VOP clock on RK3228"
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
 <20250124064619.13893-2-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250124064619.13893-2-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elaine,

On 2025-01-24 07:46, Elaine Zhang wrote:
> This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.
> 
> RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
> dclk_vop to change its frequency, CPLL is used by GMAC,
> if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
> affect the GMAC function.

Please explain how CPLL and GPLL is affected by this? According to TRM
the hdmiphy is default parent (reset value), this is also how similar
clock is defined for RK3328.

  vop_pll_sel  
  Control vop clock PLL source selection.  
  1'b0: select hdmiphy pll clock (reset value)
  1'b1: select vop dclk

Maybe the dclk_vop name is causing confusion, or am I missing something?

Regards,
Jonas

> 
> If the client application does not use GMAC and CPLL is free, make this
> change on the local branch.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  drivers/clk/rockchip/clk-rk3228.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
> index ed602c27b624..9c0284607766 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>  			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
>  	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
>  			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
> -	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
>  			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
>  
>  	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),

