Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FAD2D0636
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989193; cv=none; b=UdJYZGz6WeAXkaS/u2o9KjpbYMBgOsT7+an7PDCkE36XU+gJ/ReAxz23/nCCHhgmhq3y/+p3qZjT4AEnffkIaFWotnCRrGUn2L/NynBdPMxhaoG/VzQr1IWJSDR8oj5rlq0lDDDOJvrZ0k356aTMrqKVAgvTbV8as2jrGyQVOmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989193; c=relaxed/simple;
	bh=t3tJ2jRQKZC4P9MzcSN7PfhCVil/dZB6XgmhD1WieD0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mg5UL1z5MYFnUVF5rw4zXj348/ZkAPlyA7BhBFfiVoduzm2eu67XRf7w2O1LA7eTh5bsErLxFWxT1jAxf8QAVhHGDPWUL8HB7EkpSbX151UD8kh0NTYFBc1LFqZnPpihfTAkV4QAKMYBguW69+ov/RmIe/ypPj0VjBtgpxix/5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kBOqMXKz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kBOqMXKz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso842331666b.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989190; x=1761593990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LnjpYSKS/43/yifHhUiYoGDnMYrtA5KLOT4CjCRe/RM=;
        b=kBOqMXKzPy7kzuefyEh3TpCCL07WRptUo31DeC3cRZfJqldqC7Z9GsfLb2X+JfSHM6
         KUHLGaSHtpFIzyRAE/YfsbbgoA2ssoGXWaa5bUPla1KWo7chvsM5QVdGW2yuqvRXFSe8
         /DX0030pDqJOB1OO0DKLvkJmExQFe4mDAV1RFZWIBrpmL/DPz0bIAWgC4PC4a52SRMsE
         LNQmfSB6AcE2sx5PGzwiNpqb59wqNwZxTs4F0K5Adg5y1XIbiEvB0hNcxs91Bwoo54FD
         j0DVMv5+WS5oNg7LT5JoZQNTHjiAIED7YopYl3S7/pbBbtB7VZxjolXuQcY1UTpaANF4
         wA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989190; x=1761593990;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnjpYSKS/43/yifHhUiYoGDnMYrtA5KLOT4CjCRe/RM=;
        b=pxouMOBeqf2EAuXT6e1XWoJ9lqGBpVve/4Das+mTlhojwyJW/U0Qgx1B0caWVx0caM
         +6mJZKN9CBNUn80nXrj4HN1XCVgcNgjE/OaCC169djc1sK++1JYwAKc0ea8I3vunmL32
         DPYRsCJIaGPMuRBcYqptnvXUx4yV53xpUcWH1IYCPvZnYgobRPLwlgG10Lk66kZe88Tp
         36hmCyoruIKRpqhX+lDboe7BcPhF/kqxm3d11kPSHeAafO7c74lZ7oz6sEVh6nt9hhKO
         KpQVv59Xty3uChc7yYa7vWiYAjOyZ/8CX5mSoicTY69iFRIz1ADBUea7y9Gp7Kzuilae
         IvSQ==
X-Gm-Message-State: AOJu0YxrgoVvNRrIBj24Bah+2NYM0apWRgTB4bKEuEDBsbaD4kCKqKRS
	iy5GfyDrltirlOiWLiaRcO/WQLOBVac2SDYcm/0j9WRxBmQ7vUEndnwJNq67B38Wgb0=
X-Gm-Gg: ASbGncusBgJHsgMGkwhT0g5HJ/5QYMYiaL7yHVJCgwwKlLSKVyW7UWD0lxEG7SU6VWp
	RxIjIdSJqA6gXEQulEIACDjQBfmEXJKqq9E8Pbc6hg8oVGOr7yER+oQBDQHKMuUVrpUmXqDKbdS
	fT8K1m085VHMSKvliKBn10B4g6YEm6n0X3OQ8EOyJOCCl+Zr3RriHYrSWavB40JlLVj/qLMUuU9
	/cfVtXxzg+6kZnV7Q26KjPHDX9EG9TBY1e7fN30n6XuTmK/e+uPws9Q139OyRVf4eh7CxCWX1Hw
	H/aUrzkN/GhR/oPcgr3G41189mAYTPrShviVALYdjcCLw2fsI68H38kfij4pT8iwexJGELZ5NZN
	AjC+P7DJjb5UF745i5j+A4lhxyUgREh/sWy8tMU0BvBm0zryk3QGigWIJ8BzGNErJ+VPJ0puu8u
	tTd77q3LaTleAhW7CdxPj1F8VniUlIsQ==
X-Google-Smtp-Source: AGHT+IH1hn38zTILbCMlTv2qi6kULe0P8fDltgqzfaMNLAfyLKQkqhNGIeocVuvV5wYRm7B5WR9gwg==
X-Received: by 2002:a17:907:1c85:b0:b3e:5f20:888d with SMTP id a640c23a62f3a-b647304516amr1918155666b.27.1760989189902;
        Mon, 20 Oct 2025 12:39:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e83914d0sm861545166b.21.2025.10.20.12.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:39:49 -0700 (PDT)
Message-ID: <ff968ce4-9490-4e19-981b-7a5e9a842b68@tuxon.dev>
Date: Mon, 20 Oct 2025 22:39:48 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 10/31] clk: at91: clk-generated: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Remove the last of the usage of __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
> clk-generated changes. Adjust clk name variable order.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-generated.c |  8 +++----
>  drivers/clk/at91/pmc.h           |  2 +-
>  drivers/clk/at91/sam9x7.c        | 38 ++++++++++++++---------------
>  drivers/clk/at91/sama7d65.c      | 41 +++++++++++++++++---------------
>  drivers/clk/at91/sama7g5.c       | 39 ++++++++++++++++--------------
>  5 files changed, 67 insertions(+), 61 deletions(-)
> 

[...]

>  static void __init sama7d65_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *md_slck_name, *td_slck_name;
>  	struct pmc_data *sama7d65_pmc;
>  	const char *parent_names[11];
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
>  	struct clk_parent_data parent_data[10];
> -	struct clk_hw *parent_hws[10];
>  	bool bypass;
>  	int i, j;
>  
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i = of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
> +		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
> +
>  	i = of_property_match_string(np, "clock-names", "main_xtal");
>  

Please drop the resulting empty line here.


> -	if (!td_slck_hw || !md_slck_hw || !i)
> +	if (i < 0)
>  		return;
>  	main_xtal_name = of_clk_get_parent_name(np, i);
>  
> @@ -1218,8 +1224,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	sama7d65_pmc->chws[PMC_MCK] = hw;
>  	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
>  
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
>  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>  	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
>  		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
> @@ -1264,8 +1270,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
>  	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>  	parent_data[3] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw);
>  	parent_data[4] = AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw);
> @@ -1315,13 +1321,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  		sama7d65_pmc->phws[sama7d65_periphck[i].id] = hw;
>  	}
>  
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
> +	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
> +	parent_data[3] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MCK1]);
>  	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
>  		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[8];
>  		u32 *mux_table;
>  
>  		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -1338,15 +1343,13 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  			u8 pll_id = sama7d65_gck[i].pp[j].pll_id;
>  			u8 pll_compid = sama7d65_gck[i].pp[j].pll_compid;
>  
> -			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +			parent_data[4 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
>  		}
> -		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> -			       sama7d65_gck[i].pp_count);
>  
>  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>  						 &sama7d65_pcr_layout,
>  						 sama7d65_gck[i].n, NULL,
> -						 parent_hws, mux_table,
> +						 parent_data, mux_table,
>  						 num_parents,
>  						 sama7d65_gck[i].id,
>  						 &sama7d65_gck[i].r,
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index ddd5ad318990..ddbf69beb495 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -971,24 +971,30 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
>  
>  static void __init sama7g5_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *md_slck_name, *td_slck_name;
>  	struct pmc_data *sama7g5_pmc;
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
>  	struct clk_parent_data parent_data[10];
> -	struct clk_hw *parent_hws[10];
>  	struct clk *main_xtal;
>  	bool bypass;
>  	int i, j;
>  
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i = of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
> +		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
> +
>  	i = of_property_match_string(np, "clock-names", "main_xtal");
>  

Please drop the resulting empty line here.
