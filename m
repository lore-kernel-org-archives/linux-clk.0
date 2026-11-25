Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595562;
	b=kBQ4R+QYM35j4IgqFs+H60LZnHeQiw9ozFh/chbf3k1Bsj+uF1OXW1C9xnqGfyEaSXQY
	 dof3hwlhSp5dw8gimmNkuBm6XzM7Wpd1QQcY0zc5VXCQXvLlC4ebWkmofzVKCTKqMcq+1
	 3s3y8oYFygO/0flt79RG9hwZjjq8Ve9t/AqIeAyiwhI2nNKUqZR6Y32h5tZQov2Lhzxqy
	 owWp4ic/3SdyTIzPj6JkpI7iJM0EpegSgf2KlOvFtEMmzS62ToGJy4RFSMN+CaTt4KI5D
	 WqJZrV4VPOBfC2HFNhc7Oti6cjn024V7wM0PZxZCt6qthJfF0AX1/r2YRinU0jr9Kdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z7nVlkXNx7FQmO9ItasInEpMKvgYG91F7qwPmFbmBqU=;
	b=qArIdBz3h7txbrtrQsQO0fPYOiLIaLHLM2oo1Qv990t5DFpHSuADcSLZcC+TfegONk17
	 HsnPaFJi9VM3qpqnF9aOZNAMizngcLkqmchMXysrKibc56ISU6whaHCvqLIJ1ghvo2MjN
	 e0y8l8UAsF3yfbuQCZQKxbsDjo8AnVeB4DB6YkgQuPn9H1bgDl1CreU60vA9QpwfYS62K
	 OM0xVgNkhuKg1G/LTfhgq0WOnJfrwdJ32mKPJAEZ6Kh7c11CQRSyg9U1xk3fXKrc0Mkvu
	 A7S3QnpEJjGtnEBhhE8dNuudk64WdFO5R/EkwJhRZwiXPPfgWUM1qQ1bbT78nIR1y5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CGXhQYbR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52E606A323
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 08:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A52E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CGXhQYbR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b467581b98so52691135e9.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795595560; x=1796200360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7nVlkXNx7FQmO9ItasInEpMKvgYG91F7qwPmFbmBqU=;
        b=CGXhQYbRvU6BAp0MBowXAqnhc2lvISMyEpD/LU3Amn1yvfstAmkVKlVBbsheSu0/fy
         sgZDdHk6BAo6afbE7UtCGnO8JTQ5R71SZ74JuCFRePir7wH0ANPaFehNXDFQ/zOVGSxC
         m+8xGFNngmtrVaJTZB+N4KffvbM/MeV+b1RagGGtbESf0sAem0+Hy0slwv/6Lv/Ls4n0
         L+/pFEzjCkXziatYZj9dpWuJsXhuZ0FVIaBFfGYfucaVp0IHxv5wqi2iPkRycrNeQUCX
         ga8pxIhV4QVre3Clj+hHhTZil3hd34srREt0TqeslQSYD2Mtgu/mHgYobQBorl3mmKQJ
         sSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595560; x=1796200360;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7nVlkXNx7FQmO9ItasInEpMKvgYG91F7qwPmFbmBqU=;
        b=g2qbNaoeF1vYyfG1NdDZN9ujBGAoBkEo9KOIF6Tr8TTaSUCEIlDvyYoj5gcBNtE7h+
         FHgS4Bx711O6DKrE6nfG0mOH+dDWCEGWJiHYHkA/3lQwa+j3pzlqBZzTq5N+LjDUM2dM
         BtC5f88Pfm3B9owKAeRTQcDWlLHIi5VjZAG6S22R/x5qr4pcPo80cU+wJ746zABg9qw5
         muJokzzPeidB7FuUeUdBL9hDxPCPrG/Bc+If3t844IddyyszTgkWcn1KbR+OKPaJirke
         SyW7fhh5OStv2niB2pruJVc8doJ/p/jF+TaqHhikkKx+EZSqoo0I6mcfI+NqQVLZUu1E
         0b7A==
X-Gm-Message-State: APuU4Z+DtLnfxNxQYbXfE0rL8r+0fSSwt9GPYdlIezekQ+iVZb5oMq5V
	2zYDlPguspil0xTWDmBLeIv/tz2lzL+jvXMvAmtiL4yfhtjhKPmh3tp8j0hoUkZp6Ok=
X-Gm-Gg: AZFdTZfjRvO/tXktJXAeXk+CMj7t+F6Uc8Jzjo1jB8IN5rZAYKI5HNmG6Cdfxvs9ziP
	JmAvFRX/9QdtKNGJaWtBnja5nv7epd1bhPJvu1wQnC71GXhhlI7XigqUgXpE2GtJ5xTYx6rcyLL
	LpKKk9ilM2PPoyoa/ZunMtIsKAkyDHCTEr217DvH+voyjjKZMiuZYIKIP89cZRGhsOoiU3PmXqj
	HRklJj+MrDjo7RC6nvB1igAh0dNXO5vSbiS019Lu3Lbfgh65Ba6st87Xk/ATR5BTPTr+dkLEigR
	55TBHoXqKcUG8ZEPu/c0vSEsT4zdMu67+oxUbgzJMGMJC4RCuDEV3ZTYCFK6B+KjPoUWNZ+Qipj
	2Hhwe495+cavisbJbyFt6z3QFhD4svbD2zYFZKkIoSM2uCIaeeHLTBu4d2M1ZaMwghncOLqasHA
	2f5sKdaGZzMKFyXmHtuRLBZ/U4b1BTpHcXQREN5aogtNWV8eKQsAgC4aKVhRs+tIIEj+C8BFNZ/
	8XhW1I+VmmjpjZYAgGfO9hE6sop9hdxok/zm1G4M2WdcjTNgrC4HJ7pRBtcyd1VDjE4yTksO9aw
	tc1KcRFfGHhwVHRPllX0kgMdvpmA0tb0Yb1OmDjVZ5JDcJ/uKeS2NtJTd2I+Dk8R8yxKQW3VZRB
	V1GTAEdv8vxBlx/CwmtHq6xx8uPGCSw==
X-Received: by 2002:a05:600c:530f:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb887e21e4mr334917245e9.1.1795595560293;
        Wed, 25 Nov 2026 00:32:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:f368:ae2e:e717:e970? ([2a01:e0a:106d:1080:f368:ae2e:e717:e970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm502783405e9.15.2026.11.25.00.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:32:40 -0800 (PST)
Message-ID: <5ffffee4-15f2-477b-b7d1-67649605b412@linaro.org>
Date: Wed, 25 Nov 2026 09:32:39 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261124-topic-sm8650-el2-clks-v2-0-8086440e2c09@linaro.org>
 <20261124-topic-sm8650-el2-clks-v2-2-8086440e2c09@linaro.org>
 <sashiko-outbox-231728@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-231728@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 18:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] clk: qcom: unclocked GDSC MMIO access in lpass_aon_cc on SM8650
> - [Medium] clk: qcom: MND freq_tbl used on non-MND
>    lpass_aon_cc_main_rcg_clk_src
> - [Medium] clk: qcom: MCLK branches parented to 2X RCGs instead of CDIV
>    dividers
> - [Low] clk: qcom: stale LPASS HM iface clock description in commit
>    message
> --
> 
> commit 5b9d49ed39635aa6cd0df792f0d843cc860ce478
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> clk: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds drivers for the SM8650 LPASS HM, core, audio, and AON
> clock controllers so Linux can manage LPASS clocks and GDSCs without ADSP
> firmware.
> 
>> Add drivers for the SM8650 LPASS HM, core, audio and AON clock
>> controllers, the HM, audio and AON controllers keeping their iface clock
>> enabled while in use, LPASS HM's being the GCC LPASS config NoC clock.
> 
> [Severity: Low]
> Is the commit message description of LPASS HM's iface clock still
> accurate?  Only the audio and AON drivers acquire and manage an "iface"
> clock via pm_clk_add(); lpass_hm_core_probe() calls qcom_cc_probe()
> directly without setting up pm_clk.

Will fix

> 
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lpassaudiocc-sm8650.c
>> new file mode 100644
>> index 0000000000000..abd0258d9e72f
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
> [ ... ]
>> +/* XO only for now: the ADSP plan feeds these from the audio CC DIG PLL */
>> +static const struct freq_tbl ftbl_lpass_cc_ext_clk_src[] = {
>> +	F(1536000, P_BI_TCXO, 1, 2, 25),
>> +	F(2304000, P_BI_TCXO, 1, 3, 25),
>> +	F(3072000, P_BI_TCXO, 1, 4, 25),
>> +	F(9600000, P_BI_TCXO, 2, 0, 0),
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	{ }
>> +};
> [ ... ]
>> +static struct clk_rcg2 lpass_aon_cc_main_rcg_clk_src = {
>> +	.cmd_rcgr = 0x19000,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_aon_cc_parent_map_0,
>> +	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_aon_cc_main_rcg_clk_src",
>> +		.parent_data = lpass_aon_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
> 
> [Severity: Medium]
> Should lpass_aon_cc_main_rcg_clk_src use a frequency table without MND
> entries (such as ftbl_lpass_mclk_clk_src) since its .mnd_width is 0?
> 
> Because __clk_rcg2_configure_mnd() only programs M, N, and D when
> rcg->mnd_width is non-zero, requesting 1.536 MHz, 2.304 MHz, or 3.072 MHz
> on lpass_aon_cc_main_rcg_clk_src (or via its CLK_SET_RATE_PARENT child
> branches) matches the fractional M/N entries in ftbl_lpass_cc_ext_clk_src
> during rate determination, but programs only pre_div = 1 in hardware,
> leaving the clock running at 19.2 MHz.

Will add a table with only 19.2MHz

> 
> [ ... ]
> 
>> +/* MCLK = RCG / CDIV (reset value: divide by 2), the 2X clocks are the RCG */
>> +static struct clk_regmap_div lpass_audio_cc_cdiv_rx_mclk_div_clk_src = {
> [ ... ]
>> +static struct clk_branch lpass_audio_cc_wsa_mclk_clk = {
>> +	.halt_reg = 0x2a0d4,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2a0d4,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_wsa_mclk_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_audio_cc_cdiv_wsa_mclk_div_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_wsa2_mclk_clk = {
>> +	.halt_reg = 0x2d004,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2d004,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_wsa2_mclk_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_audio_cc_wsa_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_tx_mclk_wsa_clk = {
>> +	.halt_reg = 0x2a0f4,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2a0f4,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_tx_mclk_wsa_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_tx_mclk_rx_clk = {
>> +	.halt_reg = 0x2c0e0,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2c0e0,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_tx_mclk_rx_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>> +static struct clk_branch lpass_audio_cc_tx_mclk_wsa2_clk = {
>> +	.halt_reg = 0x2d00c,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x2d00c,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "lpass_audio_cc_tx_mclk_wsa2_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&lpass_aon_cc_tx_mclk_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
> 
> [Severity: Medium]
> Should lpass_audio_cc_wsa2_mclk_clk and the three lpass_audio_cc_tx_mclk_*
> branches be parented to their CDIV divider clocks rather than directly to
> the 2X RCG clock sources?
> 
> As noted in the CDIV comment above, 1X MCLK branches are divided by CDIV
> (divide by 2 at reset), which is how lpass_audio_cc_rx_mclk_clk,
> lpass_audio_cc_wsa_mclk_clk, and lpass_aon_cc_tx_mclk_clk are wired.
> Parenting lpass_audio_cc_wsa2_mclk_clk directly to
> lpass_audio_cc_wsa_mclk_clk_src and lpass_audio_cc_tx_mclk_{wsa,rx,wsa2}_clk
> directly to lpass_aon_cc_tx_mclk_clk_src with CLK_SET_RATE_PARENT causes a
> 2x rate mismatch in clk_get_rate() and conflicts with sibling 1X MCLK
> branches sharing those RCGs when clk_set_rate() is called.

Will check

> 
> [ ... ]
> 
>> +static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc = {
>> +	.gdscr = 0x11090,
>> +	.pd = {
>> +		.name = "lpass_aon_cc_lpass_audio_hm_gdsc",
>> +	},
>> +	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = RETAIN_FF_ENABLE,
>> +};
> [ ... ]
>> +static int lpass_cc_sm8650_probe(struct platform_device *pdev,
>> +				 const struct qcom_cc_desc *desc)
>> +{
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_pm_clk_create(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_clk_add(&pdev->dev, "iface");
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "failed to acquire iface clock\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(&pdev->dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = qcom_cc_probe(pdev, desc);
>> +
>> +	pm_runtime_put_sync(&pdev->dev);
>> +
>> +	return ret;
>> +}
> 
> [Severity: High]
> Can gdsc_enable() or gdsc_disable() access
> lpass_aon_cc_lpass_audio_hm_gdsc (offset 0x11090) while lpass_aon_cc is
> runtime-suspended and its iface clock is disabled?
> 
> At the end of lpass_cc_sm8650_probe(), pm_runtime_put_sync() suspends
> lpass_aon_cc and disables its iface clock (LPASS_CORE_CC_CORE_CLK), which
> also allows lpass_core_cc to runtime-suspend and power off
> LPASS_CORE_HM_GDSC.  Because gdsc_enable() and gdsc_disable() do not
> runtime-resume the GDSC provider device, any genpd power transition that
> runs while lpass_aon_cc is suspended performs unclocked MMIO on 0x11090
> and triggers a bus hang or SError.  For example, genpd_power_off_unused()
> at late_initcall_sync, asynchronous genpd_power_off_work_fn() after a
> consumer drops its runtime PM supplier link, or system suspend/resume of a
> virtual genpd device attached via dev_pm_domain_attach_by_name() in
> lpass_macro_pds_init() can all toggle this GDSC while lpass_aon_cc is
> runtime-suspended.
> 

It's probably fine, register access doesn't depend on the iface clk
