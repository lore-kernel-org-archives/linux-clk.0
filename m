Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496351;
	b=3gEeC/3o2Qh/TKVU5hFektV8whLAKngQffPjIOE3hdQ3aw7MNGnrPhdbDN6ZBmKbDKNl
	 J9kLLPxMQE6xrNFtQsja9FmU5pAc/ZJYC2vjEbRV3UyrIYYGMRPg099KKzdRPgQT5liIF
	 UH3jR4LUPhJfGQPehDa98CvytLtCrD2pkJOUZZD3GHmvZefroT5mXcBiIHT71QsH4LERN
	 WjQi2FQScyQt89DXMStB/GqDTVyltod90GSGhzhmbDoHanEqAlM2ZcyW3MhNSdVMDoIOp
	 NqlGMgdaMD2I4WfBA35kCrNhLh8vuKwEJl2raitzTfaytv56FlImN3hjUCHQ4npltlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
	b=KVdcm+8XEnjCholXxlaM7ByMcJKkqW9T6aBt65dKOHjRMGulZoREYXx6dcXymk2HOPk+
	 ccOa8XDJjSucTy9iw4UULqITtAeZNL9kYsSFyQ1E07edSugYRisXt83LdYXSijpiDZQfO
	 UVe+51GMMnKlwpepHNUa9DR17ss/zX3uXJAt9kCafDFkHnl+3wthWEjyK7xxguLf9euM3
	 mgZafKBCQd3JJUqetPi7tTbeScLTPiKalSwXzU+r0twH3keU+5ebmJLkubGkiQUzoaevs
	 nXS0r01nmpKC/V/RMAGujzrthrWfKYUn4X2WBzrYF0U+95moVOb3WWWLCnlHlgV8arw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FpXFv9jb;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53201606A31C
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 11:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53201606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=FpXFv9jb
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4086e892a4so414536366b.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792496349; x=1793101149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
        b=FpXFv9jb8ZFizFKmibEnGMxt1ygssK0ha5/IxCeaeVWR/9PJUI5neVAVL4ikaUrhPA
         IT+9Y14UHyeMEfNifm70pPX7HZubefMM9Zech/k1MVWOmdyFtg1vlxacV+eT5xn+WAqE
         SKXtIhCXd9lzv3T1zwQeRqoyNvzt+R/H1/eqQMXmwk4+OT9IUvKJ1RbMrYl1el+wDfFn
         Uex2LJn8XgKH4CxLvNY4xwJFpk/ecN1HyscXaE/sVTz1p3U6wYCRPmRiEIHyRbDwOEFn
         bFIDAwu2H1uuchZNYutvD0S80IkKVdGRCpXuqHpJg8KSfpU0QNaP632lfjqb5tvNBEeN
         yLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496349; x=1793101149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52MzbrkvqUYyLpVPRbvTDBjM4Idiu7Sa4nLZ4X0lEUg=;
        b=IJ7PD0jDE36dYbhbzJNScXPk6CS7wFEhj9bXC6Z/Pk2zQZlOGJLyqxgZ0APVIOyGrr
         RD4eS96hM30BxPuOKT/wzFYXc4dXZabIMpRaCFC/2YKyE/P6HEseNW1GQ/gDy9y14Bdd
         4a5nR3yqHSe6jyCJmDxstBfvP1tiD8066uNbLdPjytNaV4SkWXCafNQzcPjBUEe9kqxV
         aGrOuPcJ6QsW66BavHt6Lyq8JAAjP5zMBB3n/MJm7q95xH5Vv0gby2pCat+7TpjgEGqz
         bFh7ZoRSW3jxdkt+cF3Ny/9QE9VatPyX5ycWIxmruX8CjD9wQ6m2ypz88rzeQGb48+Ae
         WdOA==
X-Forwarded-Encrypted: i=1; AKwUvByl/SbN00tN7WWWLOonbMQ0kXVuNbB48kC4QsMAu0twtxzQ3v5hT3aRTeaGczswIYxuYV8+wLpAoKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUtr0p+GysFaFUzDRf8Lyc8dmMjYTQdHurW24x5StM0Y3uSSZq
	oMHWLV7AHnPfcDCQL08aAjjDYfztvP/1ja9ZuTMtmbR54zu8Qn3do1RCZGGVCB+WovM=
X-Gm-Gg: AYBFou1u4kYDOuL0nIQkWgtCXaVaiyVAg+1Q7YGWZhxazHIKfu9tOsANso/4KVoXIod
	AhyBeTzIYYqjpAn5randhYJtIvRBWCNgon1/DGF0EY5cYOuyM3TDbilqKlljPl/9UVGg0x7sWbX
	q3G+hfzVYDkHyg45DZoQlRyKYeJdou2rQ6ix6LMiXz7W3KVxWBtug2pkgZGCunw//Ns/ytZ5Kcu
	vkwcDLN97jGOBJYmQbVgkqFsCb3lkyMEIx/wp2BEhF2A+q/gwhv57om6tdZ1mMiLsK6ozcSjmQ7
	OvPJk8qdkugjOvs0yDKsNVSotGo7zJkZHudWUqwHw3+arzbxgNiXNW3jnv41tNLSlDzVdfRqAEN
	nZYy+L5sGQ8N8Qw5XyS9OubsuE9HPgLloOgS9m8qT0czAYix8kGOZXllffXX4l26BeaOPVu8PVA
	DGiW5EHi+i2SdOrSJaitYsGJa4H3dLHYfuQ2fVhyyvADp/a293J5IAxYLDNWnY3Uq5RH5Hq36K/
	aCrtUSdrl3gR6cLEZLNhAj6udwBB2VRXmJHfho4KH/WFJeYxRgPZqN0tEt4JSzls9jsGxI4WMkC
	Nz0PNyxAqCBD8htHKsW1HhPC74gY9wWu61uOZjmUXR5b6QablA8rRYmKZNv4NkEVqS9N0qyVgac
	cubKnAlGJrRyu5nwkE/iPWu4n/g==
X-Received: by 2002:a17:907:c008:b0:c3f:c10c:217e with SMTP id a640c23a62f3a-c419ea3897fmr671238166b.23.1792496348368;
        Tue, 20 Oct 2026 04:39:08 -0700 (PDT)
Received: from [192.168.3.32] (cpe-109-60-82-88.zg3.cable.xnet.hr. [109.60.82.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4465eb0c67sm202867166b.12.2026.10.20.04.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:39:07 -0700 (PDT)
Message-ID: <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Date: Tue, 20 Oct 2026 13:39:06 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Julius Bairaktaris <julius@bairaktaris.de>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Vladyslav Andreichykov <vladdrako007@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Language: en-US
From: Robert Marko <robert.marko@sartura.hr>
In-Reply-To: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 20/10/2026 08:54, Julius Bairaktaris wrote:
> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>
> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> which takes its AHB and SYS clocks from GCC, so the device tree does not
> pass them back to GCC. With only .fw_name these parents never resolve,
> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>
> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
> as gcc-ipq8074 already does.
>
> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---

Hi,

This issue does not exist upstream, as CMN PLL is not yet wired due to 
missing
networking, even then the solution is not to add global name matching.

The required clock inputs should just be passed to GCC directly which I have
just pushed to OpenWrt.

Regards,
Robert

>   drivers/clk/qcom/gcc-ipq6018.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
> index 6943dc511534f..f58000407d015 100644
> --- a/drivers/clk/qcom/gcc-ipq6018.c
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -360,7 +360,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
>   
>   static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
>   	{ .fw_name = "xo" },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   	{ .hw = &gpll0.clkr.hw },
>   	{ .hw = &gpll4.clkr.hw },
>   	{ .hw = &nss_crypto_pll.clkr.hw },
> @@ -539,7 +539,7 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy1_gcc_rx_clk" },
>   	{ .fw_name = "uniphy1_gcc_tx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map
> @@ -594,7 +594,7 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy1_gcc_tx_clk" },
>   	{ .fw_name = "uniphy1_gcc_rx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map
> @@ -733,7 +733,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy0_gcc_rx_clk" },
>   	{ .fw_name = "uniphy0_gcc_tx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
> @@ -769,7 +769,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
>   	{ .fw_name = "uniphy0_gcc_tx_clk" },
>   	{ .fw_name = "uniphy0_gcc_rx_clk" },
>   	{ .hw = &ubi32_pll.clkr.hw },
> -	{ .fw_name = "bias_pll_cc_clk" },
> +	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
> @@ -1920,7 +1920,7 @@ static const struct clk_parent_data
>   	{ .fw_name = "xo" },
>   	{ .hw = &gpll0.clkr.hw },
>   	{ .hw = &gpll2.clkr.hw },
> -	{ .fw_name = "bias_pll_nss_noc_clk" },
> +	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
>   };
>   
>   static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
