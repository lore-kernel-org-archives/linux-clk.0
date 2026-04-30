Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F51A2C158E
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777588935; cv=none; b=Ahvvl1SdKyhcBkQ67G4RS2tZYybwvgDDx312OEBYt7Eq3qnla6mjNLytcU0Icyfq/W4mbtqnnLx/bHotD6m5lwE0dLMqsf0JfPNhnxK7sk7n+05i+MdTynGEz3Vjeuz+R5HBoEdXzfmZnUKIBct41CvXSO+tjdto/E9qhuZgOU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777588935; c=relaxed/simple;
	bh=HkCDsJrxUFIGZKnS0KSkOLg6VKUuj8W6ZTGXMnQq+C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4hFoiUOClH1ULfLaximvIejOigEYN1VGQPumY0TLr813v3DlMQMY2ima6C4LKOAn4YGA5a/1OrUwaHfkcDSp/Wchs0blg0PABZQFz3p2KpA+kStMOToXvVSKmCSZmS1aNSoP84dvJF7V4k//CA40iigN+XlM+un1M0Hci+ZgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cxg6PACk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VkvQtGZG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cxg6PACk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VkvQtGZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777588932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/1cSzGnnBDcTXUhWLIx7rOMO3bSL40zQakAMBJWPaQQ=;
	b=Cxg6PACkH933hsmLO5q5VzvXz/G7hP9VCQtw3zvlN1Ek4bCWVoGGp+QmBnaCPc72YvFuMb
	1GjH0GgX/YHl6dfBMBsy37bzmYP03OEEA/ZCh3HyZvv6VMLfBPuG9Hdor2YUWZOLlKYt8K
	2hqsB2jsuzVdE1V8rJ7VFdBBU/BP+sM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-KNJs74rvMNm8Id6aKHNAGA-1; Thu, 30 Apr 2026 18:42:10 -0400
X-MC-Unique: KNJs74rvMNm8Id6aKHNAGA-1
X-Mimecast-MFC-AGG-ID: KNJs74rvMNm8Id6aKHNAGA_1777588930
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d58bed44aso35283811cf.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 15:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777588930; x=1778193730; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1cSzGnnBDcTXUhWLIx7rOMO3bSL40zQakAMBJWPaQQ=;
        b=VkvQtGZGPPFRhJvpiHa3ReqXsPryHrzu7nQDxc9Po5F61wVl6BZc/w6PWvLPheCj4Q
         ZNnXML5QIwxIMYLxTO7Fs0huIPliIBH8doc90apq2tpFdE8dXh1HRIEWjwQpb57H8QCv
         6wWDN4MKIgbIyTE1V/HW5BCG1DPCB9ltR8J89Q5KpLPFtrsKRYcHzdHlWnjbj217SWMJ
         k9PzspoBU37f3m0s1NMxiyJOIacj2d0LQBUXghmsU5BFgn0BCwuXRob5jSTcP9jnUKcq
         Kp88TfqB5S2yQww0UqtlOSloiPzPthN+hgVUx91LZcRvIpdTdRNf0XA4JbNRv+04ImCS
         dnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777588930; x=1778193730;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1cSzGnnBDcTXUhWLIx7rOMO3bSL40zQakAMBJWPaQQ=;
        b=JCpXTnFMSAL0Qn5pDy9RsvZdhRZDP+4A5FBttNCb/gj+FbR76giufVcLMzkfqnGpl0
         3sEvZ8TwDk3ByVzGhwleZ6XMyLsNqAWW6Mrt6yleguKtuY1dYHupfOna7m3qYZE649vL
         PrIrgN79wFmMgrUbCZPJN4WZeG9QfoPi5RCJ3KhjQ9bTyFSSHB6qWXKvrb0S08bkQK+o
         UDgUW9AcXdrefc7hzL+RLBfR4+DOW+f7FIcG942og7AElYXrCEkIiAQ8PNtLf4hE03Jx
         UltJqwlHhoKJssGkiuUwbDV23qCXhtI/9U2cOtVGNmlBa3j3GSqAEA6QgXyA/+qs5Hlk
         ge9w==
X-Gm-Message-State: AOJu0YwZMaQXGCjFrJL4J5OLFdCYA1EeI6Q2OxqAXHdaF0rKz3G7p4vb
	BNM2eCFT276RrQzq1FeLwCHfE+gXwC/r2UPfEPSYq6Lyifp4aQ6vmE4Y2eBVxfQW7vQKHJZwl1F
	XVEHMf6sKeArY5Lz/O88edBHAF+knvW182XRbg5ok/mmz9XBBPzTRRyfdJA+zGg==
X-Gm-Gg: AeBDietwbDUQP1xWG5gMhglEzAyb8AYMBOPKSwWIJPdsGMCByKUK6cvpHyVRpz/9V0l
	rkzpVUO/AVIJvQjfvWog9xND4rljHwsjmbDsnp54doUBpKFcUhGjX405eLJNFbNP/BwzHpoa32z
	L95OAB1pMkf7nYTiCuaPrivLyWP1y8qm/nOjbhOblAm0biY/Rvj5MGD73TDaTawkpVn1QTD6V8r
	XO//c7RN+4YF41wDWS6E9gLgLDD7Jkauy4jm0nvlA0tuhX6c30eGpxEcHq7VU7rE1ERzDjGFay3
	+5Ip3HCUWo0Lssatxtv9Lwt9I4+ZXWGRlEj2QHJwG4H1Mcz0BIKaMQI2kQlu1EkAnLjgCBrM8xW
	pjhN3Lt5YVoBYZjNxCRm6mQfC/X5hiCY=
X-Received: by 2002:a05:622a:145:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-5102ab1eeadmr73739571cf.18.1777588930280;
        Thu, 30 Apr 2026 15:42:10 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-5102ab1eeadmr73739151cf.18.1777588929738;
        Thu, 30 Apr 2026 15:42:09 -0700 (PDT)
Received: from redhat.com ([2600:382:7701:f83c:fba1:9a93:4c64:db25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e796sm4571016d6.41.2026.04.30.15.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:42:08 -0700 (PDT)
Date: Thu, 30 Apr 2026 18:42:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix peripheral driver
 registration failures after oob fix
Message-ID: <afPavvW89sHTx644@redhat.com>
References: <20260430-unmade-overpay-28d175fd09a3@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-unmade-overpay-28d175fd09a3@spud>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, Apr 30, 2026 at 07:30:28PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Commit 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds
> access during output registration") fixed the out of bounds access, but
> it did so by packing sparse indices into a linear space. When
> peripheral drivers request clocks, they obviously don't care for this
> compression and use the sparse indices, and therefore try to request the
> wrong clocks or clocks that don't exist.
> 
> The most straightforward fix here seems to stop being clever with the
> packing and just overallocate the array.
> 
> Fixes: 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds access during output registration")
> Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: Brian Masney <bmasney@redhat.com>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: linux-riscv@lists.infradead.org
> CC: linux-clk@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/microchip/clk-mpfs-ccc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> index 0a76a1aaa50f7..40c17593e5941 100644
> --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -32,6 +32,7 @@
>  #define MPFS_CCC_FIXED_DIV		4
>  #define MPFS_CCC_OUTPUTS_PER_PLL	4
>  #define MPFS_CCC_REFS_PER_PLL		2
> +#define MPFS_CCC_NUM_CLKS		16
>  
>  struct mpfs_ccc_data {
>  	void __iomem **pll_base;
> @@ -178,7 +179,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     out_hw->id);
>  
> -		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;
> +		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
>  	}
>  
>  	return 0;
> @@ -231,17 +232,9 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
>  {
>  	struct mpfs_ccc_data *clk_data;
>  	void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
> -	unsigned int num_clks;
>  	int ret;
>  
> -	/*
> -	 * If DLLs get added here, mpfs_ccc_register_outputs() currently packs
> -	 * sparse clock IDs in the hws array
> -	 */
> -	num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks) +
> -		   ARRAY_SIZE(mpfs_ccc_pll1out_clks);
> -
> -	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
> +	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, MPFS_CCC_NUM_CLKS),
>  				GFP_KERNEL);
>  	if (!clk_data)
>  		return -ENOMEM;
> @@ -255,7 +248,7 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
>  		return PTR_ERR(pll_base[1]);
>  
>  	clk_data->pll_base = pll_base;
> -	clk_data->hw_data.num = num_clks;
> +	clk_data->hw_data.num = MPFS_CCC_NUM_CLKS;
>  	clk_data->dev = &pdev->dev;
>  
>  	ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,

Reviewed-by: Brian Masney <bmasney@redhat.com>

I confirmed that there are 16 clock IDs defined at the bottom of
include/dt-bindings/clock/microchip,mpfs-clock.h.

Brian

