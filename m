Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DFF800;
	Sat, 25 Jan 2025 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737783501; cv=none; b=YKBctLkwVyXPqkLd2edIKRaA4oFU1jGlND19b4NhPkaLpltL6s5yeFiCfmjOTnw0USIvhazZ93mQxFV4hJk7j0YQm5ofsAPETciS7NY+Mz5x9NsN5Ohi7S0g4x5IaHfhvdeZ4NTZB1bqa3cb+s0mRF+QKx/Q/u28IihiHFeJ5U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737783501; c=relaxed/simple;
	bh=eMNIcVDROtqNQjFN66gb5J1gVoJ/xAgKL7GpuYAlFdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FySeuR01wX8z8N6qB/SMbUNIiwyydCuWPraKOc0LWOONDCIjmfBRjxYzPoKl9YQUwq3ESm7cBNIwzf3SeN+lzoJnTxYYv1ULO2W5/+myNld0Xy/nMxPZJv/52oaosymasElO19YN2RBCb9pkmlHDpHtpNkOjP7+O5XG86S6+MGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjHSHWKR; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjHSHWKR"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso5565083a12.3;
        Fri, 24 Jan 2025 21:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737783497; x=1738388297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wBlvQUhns2Fl5P0fg/DPPg45l3SQWGXjsshoQlChso=;
        b=mjHSHWKRZCVg2ntPxiQsNrTwV0LJBGt8EcERNGn+BoTMtF/162NoJknIS9ZnCaVugL
         k6pb2WBI5cuhOk01Y4W6xyabl1v4TZc0FvnwU4vZiXGNBkuoDB68RwtEb3zK6Zm76wgr
         5hL3IHuGp4zpvsWQJ6AqTHVKklQkIQZjx21OyE9oecu8XdCE4WH+ucfPixb7dHj6YH3/
         HIV4Vt/FoVUG/u+D2YLMeoazVG4Z7dkhTCn6bP0EO/5FWLV8liZEn87aCFtJxkGH22dB
         xE72CKHo/kku/XI+ef67DrQRMSK1GimdyvWpm+TL4plB9Ny2SyQfYofh6Fc4fvOuD0Sv
         pgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737783497; x=1738388297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wBlvQUhns2Fl5P0fg/DPPg45l3SQWGXjsshoQlChso=;
        b=KQkQkuZwRVbVy5ES2gtYYX5W2Z4dfd+GP3izdy0EsvQNGqqTme+eIzWqvjy1VIU66j
         hJq/is/VtUZ8s7ag6Z3xx6jc1Yezg5O0WXkRJbUo4MbB4TDCHT6aOFtb7WFh4rgXy/Rj
         ln9ganOqv4SrO845OZ7f2JeSzPmNhfmZrjWkqHgq3xeGb4hydzca8HZpQzf6JaUS8Lp3
         dO+4J4cvdG9ZEB30V5c6K33PkalNkk+kLmMtDMTHnkXqCorI21yVYnJWQRXf+ASOBxCa
         VmAV+3Z8isTy9NJKzqYNKeVBhMy2udKmBROkMB4uDw6M8PIUxyc3BdMr0UcI41+Wq7wV
         bBUw==
X-Forwarded-Encrypted: i=1; AJvYcCVnwYglPtQnm/6ED+sDaFQnXqthYVYXbWhQGJdc2ITTQsBMduuNL6IMRaBwkXL0uuTkYzPJcD5FEwhhwH+m@vger.kernel.org, AJvYcCWfNnN3AvsbySZ+Cgjo2P4Iy7czCole87TTzxshuqMtSZ0QOrfZ1Hvpg7um7sb7QRRZEyaBgam5HjO9@vger.kernel.org
X-Gm-Message-State: AOJu0YzY+d6wzcDyTOlIQq6Sx7Hb7zapyjE5NPqFSnTRkVnqae0txWL+
	8gi3wupr0JBiRoiyEeAEiEXedJTFKg3DlQQVc60+SUdb7ukSwjU=
X-Gm-Gg: ASbGncsJ2xQUQsmEkMHoOogobqwsRrl9X2nBHiE7yHVG1Rmdlkh9gnlzqIKBVTzNkFo
	vRqf6sMkv9iLquRDuxHP/ucX6oLnW/zW5y9xpGO5kK3uLllHryIg4j1jY7fdC6pAuRRm8gtNXWU
	AleG22dDo+KR0/MyGgHK/uZDmPusm12Bz41/MAF8Bh5mGsiOoCXFSeegTAkx/QIddOpbCoXooBR
	J/3nRCVz9ECAl+l4GJ+sA2Y83TALzAhpFHLZjBgI9xaqSoHoiMfLulmQP1PgkYPaXWY5KgXqbyw
	RO12+C4gAsQS24gwuqsKpqnEDDcHrEMc2qBq/BhARAgBlPoGaEgCAMuc9mVLbg==
X-Google-Smtp-Source: AGHT+IHAvNy64vq2AlNHzrqw8S9bi5DJ7yFZQfWAQC3Lt7zxz1sa1Y3OWNi5oA+jIVvNPXiO9gaMQQ==
X-Received: by 2002:a05:6402:4416:b0:5d9:a84:d4b6 with SMTP id 4fb4d7f45d1cf-5db7d0e8a21mr31148865a12.0.1737783496938;
        Fri, 24 Jan 2025 21:38:16 -0800 (PST)
Received: from ?IPV6:2a02:810b:f13:8500:3620:7e8b:b241:a0c8? ([2a02:810b:f13:8500:3620:7e8b:b241:a0c8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc18628282sm2071358a12.17.2025.01.24.21.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 21:38:15 -0800 (PST)
Message-ID: <8752cfda-b90a-4296-a08b-054b177aa586@gmail.com>
Date: Sat, 25 Jan 2025 06:38:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "clk: rockchip: Set parent rate for
 DCLK_VOP clock on RK3228"
To: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
 sboyd@kernel.org, kever.yang@rock-chips.com, heiko@sntech.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
 <20250125011545.15547-2-zhangqing@rock-chips.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250125011545.15547-2-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Elaine,

Am 25.01.25 um 02:15 schrieb Elaine Zhang:
> This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.
> 
> RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
> dclk_vop to change its frequency, CPLL is used by GMAC,
> if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
> affect the GMAC function.
> 
how do you come to this conclusion?

On the RK3228, hdmiphy is the default parent of dclk_vop, a clock that is
not even generated by the CRU but is the output of an external HDMI PHY.
The CLK_SET_RATE_NO_REPARENT flag ensures that the parent of dclk_vop never
changes to sclk_vop_pre (and thus never uses CPLL or GPLL). With
CLK_SET_RATE_PARENT we only ensure that we can use all rates of [0] since
there is no divider between dclk_vop and hdmiphy. Overall it is pretty much
the same situation as for RK3328, which handles these clocks in the same
way (see dclk_lcdc for RK3328).

Regards,
Alex

[0] [1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c?h=v6.13#n293
> If the client application does not use GMAC and CPLL is free, make this
> change on the local branch.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>   drivers/clk/rockchip/clk-rk3228.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
> index ed602c27b624..9c0284607766 100644
> --- a/drivers/clk/rockchip/clk-rk3228.c
> +++ b/drivers/clk/rockchip/clk-rk3228.c
> @@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>   			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
>   	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
>   			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
> -	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
>   			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
>   
>   	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),

