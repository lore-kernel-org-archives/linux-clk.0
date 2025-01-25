Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691B20469C
	for <linux-clk@vger.kernel.org>; Sat, 25 Jan 2025 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737841182; cv=none; b=m1WgFNLOuBrJ5cgQ6/uePTalk7anmoqI5U+KeXwLRmCq9DANXEcrPgPOXwJGA7/7r4s+M2G9fpOyRbDUfC2XZbTT5Bft5h3ZX5QQsL+APwwSLCThIU4P/n/NnBWEVnnxGuXwUY7y+0rH9K2AL5imfFfIREQpLWvmb14l8ldupfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737841182; c=relaxed/simple;
	bh=Pksr5rnbV6SReH57SbHvv9tl2B7dWJAHgeeDTNucHa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X6aL+T7VzVTuDv9q106T6c3PoJS0b9PGryUsEzwD0SX40VRUCiDFoMHvgDfIPLfri6smarKJIWrS5ovC4Ujmo0qlNH6zKuPzB1BAeIe+oL1KYZZwM76DkcbHVSzsfpBhMv6jDxfISccDu0v0WwyAT3hg/vZE/D7pSyC/Mip4tdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=vkB9eOS3; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="vkB9eOS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737841180;
 bh=ZR2tSkF4rwVVUs2XDXjB3CxX9NUqN3QjJdhV+zW8rXU=;
 b=vkB9eOS3R0SngnrSlf7cmp3X4k5oZZbmm/DgR7ImvGJymCggijMcAO3qkCmeQKyov1DAYf/VF
 JjkKoDU5EjCCqgDhO0DaOR3+M4yRrd1jsQBZWb4OK3i04FNur6VwIGPOSFhlq3InlgWLgK6MOLf
 4NVb+jYTZC4jOzfTdKc0NqwpP6P8RlsAUr1gCFVajNJAaEnsCnCFqaKC3aNAbIEJzpiQmppihDu
 Z077K4SQJHsLyzxZMhnDRteRcQ5BSk3f/EcEsbsXRiE+meVEp7Al71KMtI3+8WcHQk04YAat1hS
 eSdRQN2f7DRflT/dTGZDVDTiFDUY90sTB5QGMJhRihDQ==
X-Forward-Email-ID: 67955a1458390289d47a0e52
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <d1ddec89-08d5-4eed-8ecc-7df47294230a@kwiboo.se>
Date: Sat, 25 Jan 2025 22:39:27 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] Revert "arm64: dts: rockchip: Increase VOP clk
 rate on RK3328"
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
 <20250125011545.15547-3-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250125011545.15547-3-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elaine,

On 2025-01-25 02:15, Elaine Zhang wrote:
> This reverts commit 0f2ddb128fa20f8441d903285632f2c69e90fae1.
> 
> Before changing the PLL frequency, in order to avoid overclocking the
> child clock, set the child clock to a large div first, and then set the
> CLK as required after the PLL is set.

This commit message does not match what this patch does. In this patch
you revert a change and in next patch you re-introduce same thing
slightly different.

As mentioned in v1, see [1], you should merge both patches as a single
fix, if a fix really is needed.

Testing on a rk3328-rock64 I see no difference before or after these
changes. Please describe what this fixes because clk_summary show same
clock tree and rates before and after this fix.

Also for next revert patch you send, please include the patch author in
the recipient list :-)

[1] https://lore.kernel.org/all/cae9cb0a-1500-4fbc-bbf4-a6266549bcb9@kwiboo.se/

Regards,
Jonas

> 
> Fixes: 0f2ddb128fa2 ("arm64: dts: rockchip: Increase VOP clk rate on RK3328")
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index 7d992c3c01ce..f3ef8cbfbdae 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -852,8 +852,8 @@
>  			<0>, <24000000>,
>  			<24000000>, <24000000>,
>  			<15000000>, <15000000>,
> -			<300000000>, <100000000>,
> -			<400000000>, <100000000>,
> +			<100000000>, <100000000>,
> +			<100000000>, <100000000>,
>  			<50000000>, <100000000>,
>  			<100000000>, <100000000>,
>  			<50000000>, <50000000>,

