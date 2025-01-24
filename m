Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8D4146596
	for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730041; cv=none; b=aXIa8LdQOdC/4nQNpIBVqyE/zcE6uarVWx40CikbTs5tYURn+PjYFst/bMjR+Llh9mMBH+vkLy3BFX9aBNzUiQxxg6CR2LJCbIazMZ30fDwSdp4mli2dqmGFIyvie3L4ON/n5tveuCJHncHXb3XJG7Yjkpv9REkuWO65MNQKqag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730041; c=relaxed/simple;
	bh=eTaf9HW41uxqE2CPS5NCpTxA6jYnk9XYAKcaAuJgBMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcsZCO0AyZTXweOhokhTxBJEg8ytMa7bbzVofRnwZBIIwCgER9cJCZxxo77nXHb5GHW/D9tFslftOZvLciTnfAoFUQ9VUtnBM3qVt20Rtt8ElKA2RrrOusy8v9555hwEFU25iu0WGk3jpR8xiz8AK6fNom6vHAuAcbkrx8bp6iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=SGYY3MWT; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="SGYY3MWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737730039;
 bh=bWc4eegiqIRik/oWmiPzWCZlgXnb9uJU2PJU56uMGgM=;
 b=SGYY3MWTQ1XEwbNFVhymOC1zL+LU3faK1Xb/b4Jy6SkwV9B2sUhuwqCaecUGIYN2M9iOQKRke
 y03vU2CIc15/BNSrDsyVEoSoHwtdkl3kRPYEG0Iola5dYnbS2v09b7Ekj55lnDYPuNwnnT/alZO
 uUV+79OUvRHO/OuNKQo6ylsrWKLveBZlNFaMZGhnyYZapbIxeM/sw5LnSOFd+Xx5+v71dOmWDk3
 hveefviQAD7FpLqdTWggeAAR3VnKu+VBhm2MStXd8m45jnfxlj+1byaYXme/0TktGoZvMZTc7gw
 16IXYrPvx+di79zD0GDTYVBrrBc3R5DVyPaNMEhRDFjw==
X-Forward-Email-ID: 6793a7ea3e07d3fa85055a37
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <cae9cb0a-1500-4fbc-bbf4-a6266549bcb9@kwiboo.se>
Date: Fri, 24 Jan 2025 15:47:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: rockchip: Increase VOP clk rate on
 RK3328
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
 <20250124064619.13893-4-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250124064619.13893-4-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elaine,

On 2025-01-24 07:46, Elaine Zhang wrote:
> The VOP on RK3328 needs to run at a higher rate in order to produce
> a proper 3840x2160 signal.
> Change to use 300MHz for VIO clk and 400MHz for VOP clk.

It is probably better to merge this change and the prior revert into a
single patch with a Fixes-tag for the commit 0f2ddb128fa2 ("arm64: dts:
rockchip: Increase VOP clk rate on RK3328") to ensure this change get
backported correctly.

Regards,
Jonas

> 
> Fixes: 4b6764f200f2 ("Revert "arm64: dts: rockchip: Increase VOP clk
> rate on RK3328"")
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index f3ef8cbfbdae..0c905f411e92 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -842,7 +842,8 @@
>  			<&cru ACLK_BUS_PRE>, <&cru HCLK_BUS_PRE>,
>  			<&cru PCLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
>  			<&cru HCLK_PERI>, <&cru PCLK_PERI>,
> -			<&cru SCLK_RTC32K>;
> +			<&cru SCLK_RTC32K>, <&cru ACLK_VIO_PRE>,
> +			<&cru ACLK_VOP_PRE>;
>  		assigned-clock-parents =
>  			<&cru HDMIPHY>, <&cru PLL_APLL>,
>  			<&cru PLL_GPLL>, <&xin24m>,
> @@ -863,7 +864,8 @@
>  			<150000000>, <75000000>,
>  			<75000000>, <150000000>,
>  			<75000000>, <75000000>,
> -			<32768>;
> +			<32768>, <300000000>,
> +			<400000000>;
>  	};
>  
>  	usb2phy_grf: syscon@ff450000 {

