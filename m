Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C83019D9
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710641; cv=none; b=TzpsImb2q/nANlHgnZT48h3BTVksVbtwwAOP59ZK3nXtc3DRlq0orw+KWuWQKdPH3QcFc6I1trpArGYXY9JbQawRmYz5TutU9EQvJeb1llp1ynxuGRiLFEBK0FZXQEHejasjl0E0qS0FZpHDUI7M9VupFQESYD/qAcrVXneOuuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710641; c=relaxed/simple;
	bh=r49bs+7Qs8NsDj/N7bznmT1ZuVswJhyMFfKxM2sbSxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEM9UXRM7GHGHSVbGSDodOhqfPaieDiU6LubWIw59hAdzI3Td72rXHhz9QI4bVVpqtUrovhpFxbzU+N9+Cn+UXXPcrvR8s9qZadtmV/CPgUxoVyBpZqwHWPyXiTSjZErMauS7JO3hBSrBjJrFIbc/rwRwaGDu3rdA90pbleI3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=x6e9p9Gp; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="x6e9p9Gp"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c15e8b2f1aso90021585a.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 06:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710638; x=1768315438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqUOBca7OUQTkBW+LdJYJV8MljcXkA8rUk+TvUtdkC4=;
        b=x6e9p9Gpm/BMf45GuorWsFHEQg2pRMIyzoMNt9ky+przHMKkv4rXt3F209LFv2bOCp
         k/iQ2TiBryEKG+0RCr78HrDAcN4WtKGyk2g3YN2hwFmRcROh1yurw2xt5eFY4Ony6waH
         B0Bz+P7Tqd2DgaMkTfZvalWrf4pTKFF3QaFUChMK2UrPqo320Ne7fU1I8Aj2bhktNUTA
         oN7TsSC4BvA+IcjSXrs25rjvjcqMu7obPXiRY6fipIluPIFPKHwOPM9WN7tdsk2EUKhk
         WFG8WvykuckX7TJ/mXVH/jugsjY5eISvUNQDGeQVXgdTK3AjjSoxxtyE2tZK+xUy41fb
         4i9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710638; x=1768315438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqUOBca7OUQTkBW+LdJYJV8MljcXkA8rUk+TvUtdkC4=;
        b=Q1MQY5wLtyAdCHES72mC66KSWLGnzhdLRJJdiGEGGCtHMPbIHflijArjlMgjqN1sIm
         iq+xKv71vykkO6VYYu4P5lZHgXDTqy74xNwZN1rltc5Jw2CUgwgX7UA34DYVJfryM2x/
         VGSwU1yV/I7BVyr0/5EcHnp95KRB7f6oH7UXftPNRBufPx4LJr8OUKmH00lgG1bBXnty
         KnVEpOiXthvWX2zLKmFvqltTkMCwphLYrvYKev44kAPDKIcXZUVTzS5U0xHwByLkq0JX
         AfE46+AMJQgNPKNVnncXDqtDYqzus4H1AAH7sXY4WikmXnG7C8tPaHgM99L0s5j+le9s
         hMVw==
X-Forwarded-Encrypted: i=1; AJvYcCUHnXIq1uKNSG5nOhxvbw5Pu80HwyPt+9QjXKPaYkdGOZllGTI/CnwG1oioF5uvmHJL0MKHbweQQpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbw7mZ9KpRf18PieX+raQSf+hifa1t0Ygi5tuSJd2kV/YZxYEE
	7GEC3EQkKkDs57DFzADLBNNLW+O59DZlupSUUT3In68ArjMAojYlzoKNGwjZbmUN+fU=
X-Gm-Gg: AY/fxX4N7GKizLudO8VIRyNED7ytB+xAIAtov4AngldsFGSUqqz7IEiIohmW3Hw9HaF
	fSO33X4V7OJEJmUl6ad886jTVtDpDP8oTvL4TZ2xWZX3yAhmgS4Yc67YS5vuaMUpIGeCdjax5g+
	pDH7nJXNPvSTaKcLSXEtjDnFQOFQFZBrmGeffFI2lUBF24yMZY0mEBsxphkYLt8OrebXCFuH8FS
	jq5pnn5/X/5OQ9ukFKDCv5wne6uywKaqx4PrnV4SN8ywz6CHlENjETnQ37AdXki3etBw6enR+qY
	dm5aXFxkuu/k7blClQvv7/lYB802/ETRaqjYb48iX+S7772bhIFFrdYvmI5rIiLxpK+iMbLNsY4
	gamxaZqnXJHj4VvO5huKBn5ccTCBD1uQgWGbfmOvl9r5nus7BBonCjJaUA3oTj5/BjTWv4ctGaw
	Yrf0LQkNm5fRQxwR6aE6khZ8JFrxc3An0kiySb7TAkxOvg0WnBrAA=
X-Google-Smtp-Source: AGHT+IGsExHw7kmZLolfw+ZMAQgKhdT3ljZ72+j77ytqYSqQi2wGdBc4Exxo++iBk542WCsTNheI3A==
X-Received: by 2002:a05:620a:1a9c:b0:892:25d5:2ec with SMTP id af79cd13be357-8c37eb7afe5mr382734385a.27.1767710638057;
        Tue, 06 Jan 2026 06:43:58 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:57 -0800 (PST)
Message-ID: <017413d7-426f-495e-94df-b93e39b0be98@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:56 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: spacemit: add platform SoC prefix to reset
 name
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> This change is needed for adding future new SpacemiT K3 reset driver.
> 
> Since both K1 and K3 reset code register via the same module which its
> name changed to spacemit_ccu, it's necessary to encode the platform/SoC
> in the reset auxiliary device name to distinguish them, otherwise two
> reset drivers will claim to support same "compatible" auxiliary device
> even in the case of only one CCU clock driver got registered, which in
> the end lead to a broken reset driver.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 02c792a73759..dee14d25f75d 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -789,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.reset_name	= "mpmu-reset",
> +	.reset_name	= "k1-mpmu-reset",
>   	.hws		= k1_ccu_mpmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>   };
> @@ -900,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.reset_name	= "apbc-reset",
> +	.reset_name	= "k1-apbc-reset",
>   	.hws		= k1_ccu_apbc_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>   };
> @@ -971,21 +971,21 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.reset_name	= "apmu-reset",
> +	.reset_name	= "k1-apmu-reset",
>   	.hws		= k1_ccu_apmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> -	.reset_name	= "rcpu-reset",
> +	.reset_name	= "k1-rcpu-reset",
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> -	.reset_name	= "rcpu2-reset",
> +	.reset_name	= "k1-rcpu2-reset",
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
> -	.reset_name	= "apbc2-reset",
> +	.reset_name	= "k1-apbc2-reset",
>   };
>   
>   static const struct of_device_id of_k1_ccu_match[] = {
> 

