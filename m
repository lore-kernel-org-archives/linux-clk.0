Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D88248A8CD
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672698; cv=none; b=sxeYZnd9N3VaQrR5OTuX1Y2IZwLJV8HZAXffhZ/QbMKQk0mUZLxD86dC+ZnR4kePrm1KCt6JTkgF9KgdoUT2F7a612o3aJouAxYY1qmiTH9sPVZLRyp3k0+o5ce35ubgMw+217BG5G5WmRNgGW52CaPAnXLIfHIwpyz4MHnlyME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672698; c=relaxed/simple;
	bh=RoNxwuvIkkCUrkl/TSTIGHMAvWivzZj78lAAeQ0oWkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3DiwOVU3kViKDWg+3JTVN5PGWbtFKNkLRLz//g0AcdM666KXN7wSkkAxG//URHk3E8hSyAkSjKOmNk1LhNDYeeqI58A7xAXaiMndc4ZS6uSrlQc09hVehqJfuJK2u6dZ5iRPuE7T71etQNahSc1qio84fuJINyvFASPTVguDoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDa4HXY4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aHQ2O5VY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDa4HXY4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHQ2O5VY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787672694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh5qdzgU4/sI1NAzoiIMyEleZO6Z0K521x8atNlCujM=;
	b=iDa4HXY4eXUAXT5J8bEbN4cJEfL31jJg+QU5BOe4VSttVMVOFNt03hAIwJvLkjQGZs+r/z
	bcSDdsT5P2QGlfma5M8QdtdluNDq5gCOAPPwoSuwGbzfJ6+5E1k596IVxcsLDH7t6OgSmp
	G+cKIpgiMR0lWPuJBi1fWk/pi3MAmb8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-ttLKuwsMNjmgsqX_lUUE2A-1; Tue, 25 Aug 2026 11:44:52 -0400
X-MC-Unique: ttLKuwsMNjmgsqX_lUUE2A-1
X-Mimecast-MFC-AGG-ID: ttLKuwsMNjmgsqX_lUUE2A_1787672692
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283df62d68so66035331cf.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787672692; x=1788277492; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Jh5qdzgU4/sI1NAzoiIMyEleZO6Z0K521x8atNlCujM=;
        b=aHQ2O5VYcDzeXlAclW9m3+Ja9nFR95ZesFvRsZ/5uTJmuz2mJ/9U9n6cnoTv/PBmL9
         1aLEqaeLr8ifmcx0zxrFPMk+/pSidqUJbEoyWkLzm2/7oqc4BppOk8B3RJJkwzvcBr3d
         I6gPK7mjDy96ygSxV+/RrPwVmxCz2VihQkDsoYp9sWVb81MFFVMW6iZO2xYjr9lkzglb
         Kl+dk3m20QPb96i2T3Q66BOKa2gf2bvyGFwL4nXNdz50uqa7SBTcStQTCI2a8Pq1Qx7/
         K8hMczmB9zMYTQOHGpNYNqqxRyl+cIUnNqdG97uQj0ZbcY88Av7P25fG+qmwuIRM5nd+
         gicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672692; x=1788277492;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jh5qdzgU4/sI1NAzoiIMyEleZO6Z0K521x8atNlCujM=;
        b=YVnRsS0oyJOW4wE4hSvbLdGMg1GRpK9MwiO4iqa9TgYSEW3IPb9LMaauR5rAy346iB
         SgVblD5HrXxES2jgrijm0Dp31ryVBGaXIftctbToWIDlx8wKsud3b7JtOLvh3KmoM7FV
         n6k2DHfdrAT30j7EU1KGJAOkCFu+KY67dbruRpkNQZZ5YkWivtNS9eat1P73m5IKFlKH
         LfucyDhQ+tX8oLpXAI+HueHBfzUdcDx/gIRD666PxgSUH1i/GszIPTnePS0LeI8Hdy27
         KWPeNfOMt5f0tSBZPziE4J+EuQx+cp1EsKo1fC9xkI4SSy5p+cYS5UxsukqEkLElmzEp
         u8hw==
X-Forwarded-Encrypted: i=1; AHgh+RrSQ/rSz241JkKxEWdHCzEdfKDNuN6zqienVL0DaEXnNZUMbjc4ZxAHpBX4gBgK2GoTDPcNG3pc91A=@vger.kernel.org
X-Gm-Message-State: AFuF++mivPYxl2rlFYj9GLj0b8pPzwbTnYdOf9zfvSxu1Wzf6LULZs7Z
	Z3EYR67LdRsFUHraWX31h0NoM2eQTeclxolZ98oYdg7z18emCSFTH8gDEIqdC4dQFc/ACUThqcU
	3UFf/fq5fJDPqT47TJzlsKgJW6ohmr1G6AfkYnB0RiANYr59p+Q+UIuCSWGGv2g==
X-Gm-Gg: AR+sD123DIkfT/HVLf/p4C6zS37ZXUo2aRULAMfj5hTPvtUdRYJeE8L7XqTBqLX0Yvl
	2B/iCzov1MAzBeU7EqQeK0lbbMEem5d28cOfGl76oEBJVWTTJ5YeXxbbWIbjLrAbjiBunay4aWL
	035X+fgGhM/ULrmAAWoOwGcgb1iVxUEMSbdWj7xzT1ZHk9QnR2Qo8ajH1ZSPNRvRphAScUAZKOQ
	yWcEV6wSf3ZQlmmcRybJmAjhBfcu2ynqmyh4TkdGHwiMcJH7P4daOWSORPwE8JT8X0/+TNZrC7H
	826MeGHo5uGm12fhUXm6XiD+WRnnM0lu4i04shTAMJDkEjmd5tPPuk79AhNKoQooyLN6rSD5rN6
	FKAKKS0vBH2wAhpNWsuPlbmihNL6r+VbHKEg=
X-Received: by 2002:a05:622a:1f0a:b0:517:7e26:36a4 with SMTP id d75a77b69052e-52df5a7601dmr383864171cf.34.1787672692204;
        Tue, 25 Aug 2026 08:44:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0a:b0:517:7e26:36a4 with SMTP id d75a77b69052e-52df5a7601dmr383863391cf.34.1787672691646;
        Tue, 25 Aug 2026 08:44:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09974dc5sm71521911cf.1.2026.08.25.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 08:44:50 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:44:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] clk: en7523: generalize register clocks function
Message-ID: <ao24cTsN_V-1O_6L@redhat.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
 <20260819221458.30040-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819221458.30040-3-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Christian,

On Thu, Aug 20, 2026 at 12:14:55AM +0200, Christian Marangi wrote:
> Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
> register clocks. Generalize it to register clocks defined in soc_data.
> 
> Add the clocks definition in EN7581 SoC to support this new implementation.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 5c45aacb6409..924e4f3e36b6 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -116,6 +116,7 @@ struct en_rst_data {
>  
>  struct en_clk_soc_data {
>  	u32 num_clocks;
> +	const struct en_clk_desc *base_clks;

What do you think about adding a num_base_clks member as well to avoid
the soc_data->num_clocks - 1 below?

Brian



>  	const struct clk_ops pcie_ops;
>  	int (*hw_init)(struct platform_device *pdev,
>  		       struct clk_hw_onecell_data *clk_data);
> @@ -714,12 +715,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
>  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
>  				   struct regmap *map, void __iomem *base)
>  {
> +	const struct en_clk_soc_data *soc_data;
>  	struct clk_hw *hw;
>  	u32 rate;
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> -		const struct en_clk_desc *desc = &en7581_base_clks[i];
> +	soc_data = device_get_match_data(dev);
> +
> +	for (i = 0; i < soc_data->num_clocks - 1; i++) {
> +		const struct en_clk_desc *desc = &soc_data->base_clks[i];
>  		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
>  		int err;
>  
> @@ -1014,6 +1018,7 @@ static const struct en_clk_soc_data en7523_data = {
>  };
>  
>  static const struct en_clk_soc_data en7581_data = {
> +	.base_clks = en7581_base_clks,
>  	/* We increment num_clocks by 1 to account for additional PCIe clock */
>  	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
>  	.pcie_ops = {
> -- 
> 2.53.0
> 

