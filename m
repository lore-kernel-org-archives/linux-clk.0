Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19204322A26
	for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513669; cv=none; b=QfQeEHpiCTQZXvKHxUuR7LfwGLlxk4lBYsMSkHegkMGAJXcafv28US4t+UMVV3otr0Tp3IW8UJuwxA9Fa/XrSlW3hito4AeLYgeKJIfhxdH3ZiD4bjip3r64tg1zEM8BFhuK9HMt6aUJd5x50rIJ/VCalg6Qqoi6rzpYQXEAj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513669; c=relaxed/simple;
	bh=r+AaCInzdkxBbx9W02sgOISt/s07Hcu0+abKHIJ1GWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFBUkSDizOqB4t1991tMxtyXHBw0VwpCHEgR4ipUg5AeC0Vj6+/iqloGY331P4eDiGYdxvHcW9Gzcc+XDNjzQQj7whEMXEYSX5BYGrN7qGnHGr+HRP06MSBLXMM8B6b9Li8fXqcBtZTWwmy6hP5ci8vATAgIAFUzmVnuJx425oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lz0fEuih; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lz0fEuih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757513666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4AKBrsHYyZy6NVWerxVC8iAlV9/6fvAVIrP6ESd120U=;
	b=Lz0fEuihSDksJa8ORAcwsySuw97OHAJMZhjK+AW5cRNNpuwBeGDwncW4q+HaHN2tNRLku6
	nNB5RAbWCL50VugxJlHww/KXNg8eXq/RzsvRPXgpte3Qj2rywAjtYZSTob4PCS9s4YbvnE
	DIuf56ASPuej8uEUvSPAd1Jl46g/vq4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-P-_iwKDIMJiXePPv8uMyAQ-1; Wed, 10 Sep 2025 10:14:25 -0400
X-MC-Unique: P-_iwKDIMJiXePPv8uMyAQ-1
X-Mimecast-MFC-AGG-ID: P-_iwKDIMJiXePPv8uMyAQ_1757513665
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ffb4a65951so2748155885a.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Sep 2025 07:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513665; x=1758118465;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AKBrsHYyZy6NVWerxVC8iAlV9/6fvAVIrP6ESd120U=;
        b=MTHXPG60+t26OWahH6Hnjej+g4G02rh0JDNAyzOA6DN9ExsAuJJf9Wmlxyr3568hV+
         N7oSfHzmN+c00gF3gmsGlKfzOqwebpZ7f+JbZcJsyPEuPK+Wd1fCIzrJsRrg+bboYwAA
         iNArTxVYcvir6Ixtc2RbExEikfc/dMQlA1KZ5NjBM2jmQWMSTb2+Vsas2N4HNDN7Ce2q
         nN5rubj+HBNGw40FvSjn0Xd1xmF2eRMTEH/aKSIAHIsNHjHRl87GJ7bTY3Tt6cZoVfTp
         aq3e4K6Jz0G2T09V9UplCxMN9WUfA430w2BZcY0g9OyPzlIFgyHQLjBBl7p2S5EA6tUO
         G/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Nkb4hrTTeaNBgp85Omn1LNCR1M7z9LY25OV4bEDbBwT/NiotdX/em9TXGLhkJpvSYH6Nh+Gz0kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyITekAwL/G7EyMWW7uLaX4I6eEUTh9O+KRRr1uzTmlUtkp9yY1
	Z3Ts7G8tgZ47n062xYFeIfW8NJ+FvMF95qgk53M01ZITLuSQ/AMs7UqgjGOR4D/EfMENnun+7we
	3t0Bx4/oiQLtsPAo7Bl2oMKNXNvnuoNDn/AHgL6SYlMnq0VW15Y/FreDzwyLRQQ==
X-Gm-Gg: ASbGncuYWcY5YVJMzyNol4T8zFYnwluxFz1SSVafyrrdNpefstBz+m2tfzD6vwD10K0
	lyBH5IuoH+7IEvRr9KyDTr9ezOnhQ1Z6J0x/F5YnKwPryAvOWZ3ZYccjpZuljTXglsOW96YV9mm
	wW4P7x8xlw+Z8pSC1g/8e1DhHP7N6re7HiqJyXhoXBhU6+rePSNitRDKl5bsuyDHBaRM7+prQBi
	1YvWxTe5mwpqLKu4C1OHWeGvf1LxoO2IhfwyE2CtOXWBJGRBAIKBOYf8WswQLpU0FR9AMv3czoQ
	GaF4i0W22j670ATExaOOCsOWuzelqc2RJgrgrvU9GFdkUYghb8jo7arOYV8tFpVt2WZ5rZvp0Xg
	ygNiQvHmsfVdrtGeeG+8=
X-Received: by 2002:a05:620a:1997:b0:7e8:922:f02b with SMTP id af79cd13be357-813bed042c0mr1615332985a.25.1757513665028;
        Wed, 10 Sep 2025 07:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkFeL3wPJOKIe3shUG9pzAQKQjdBD+pGyVy/83wrA05r4tPdXbaw2hUPMEXQ3KZIEvXGTTLQ==
X-Received: by 2002:a05:620a:1997:b0:7e8:922:f02b with SMTP id af79cd13be357-813bed042c0mr1615324385a.25.1757513664239;
        Wed, 10 Sep 2025 07:14:24 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b58b5d7fesm299937185a.8.2025.09.10.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:14:23 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:14:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mo Elbadry <elbadrym@google.com>,
	Rom Lemarchand <romlem@google.com>,
	William Kennington <wak@google.com>,
	Yuxiao Zhang <yuxiaozhang@google.com>, wthai@nvidia.com,
	leohu@nvidia.com, dkodihalli@nvidia.com, spuranik@nvidia.com
Subject: Re: [PATCH v12 3/3] clk: aspeed: add AST2700 clock driver
Message-ID: <aMGHvHf6BPrJD1pC@x1>
References: <20250708052909.4145983-1-ryan_chen@aspeedtech.com>
 <20250708052909.4145983-4-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708052909.4145983-4-ryan_chen@aspeedtech.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Ryan,

On Tue, Jul 08, 2025 at 01:29:09PM +0800, Ryan Chen wrote:
> Add AST2700 clock controller driver and also use axiliary
> device framework register the reset controller driver.
> Due to clock and reset using the same register region.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

I just have a few very minor style comments below. Otherwise the driver
looks good to me.

> +static struct clk_hw *ast2700_clk_hw_register_hpll(void __iomem *reg,
> +						   const char *name, const char *parent_name,
> +						   struct ast2700_clk_ctrl *clk_ctrl)
> +{
> +	unsigned int mult, div;
> +	u32 val;
> +
> +	val = readl(clk_ctrl->base + SCU0_HWSTRAP1);
> +	if ((readl(clk_ctrl->base) & REVISION_ID) && (val & BIT(3))) {
> +		switch ((val & GENMASK(4, 2)) >> 2) {
> +		case 2:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 1800 * HZ_PER_MHZ);
> +		case 3:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 1700 * HZ_PER_MHZ);
> +		case 6:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 1200 * HZ_PER_MHZ);
> +		case 7:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 800 * HZ_PER_MHZ);
> +		default:
> +			return ERR_PTR(-EINVAL);
> +		}
> +	} else if ((val & GENMASK(3, 2)) != 0) {
> +		switch ((val & GENMASK(3, 2)) >> 2) {
> +		case 1:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 1900 * HZ_PER_MHZ);
> +		case 2:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 1800 * HZ_PER_MHZ);
> +		case 3:
> +			return devm_clk_hw_register_fixed_rate(clk_ctrl->dev, name, NULL,
> +							       0, 1700 * HZ_PER_MHZ);
> +		default:
> +			return ERR_PTR(-EINVAL);
> +		}
> +	} else {
> +		val = readl(reg);
> +
> +		if (val & BIT(24)) {
> +			/* Pass through mode */
> +			mult = 1;
> +			div = 1;
> +		} else {
> +			u32 m = val & 0x1fff;
> +			u32 n = (val >> 13) & 0x3f;
> +			u32 p = (val >> 19) & 0xf;
> +
> +			mult = (m + 1) / (2 * (n + 1));
> +			div = (p + 1);

The ( ) is unnecessary here.

> +		}
> +	}
> +
> +	return devm_clk_hw_register_fixed_factor(clk_ctrl->dev, name, parent_name, 0, mult, div);
> +}
> +
> +static struct clk_hw *ast2700_clk_hw_register_pll(int clk_idx, void __iomem *reg,
> +						  const char *name, const char *parent_name,
> +						  struct ast2700_clk_ctrl *clk_ctrl)
> +{
> +	int scu = clk_ctrl->clk_data->scu;
> +	unsigned int mult, div;
> +	u32 val = readl(reg);
> +
> +	if (val & BIT(24)) {
> +		/* Pass through mode */
> +		mult = 1;
> +		div = 1;
> +	} else {
> +		u32 m = val & 0x1fff;
> +		u32 n = (val >> 13) & 0x3f;
> +		u32 p = (val >> 19) & 0xf;
> +
> +		if (scu) {
> +			mult = (m + 1) / (n + 1);
> +			div = (p + 1);
> +		} else {
> +			if (clk_idx == SCU0_CLK_MPLL) {
> +				mult = m / (n + 1);
> +				div = (p + 1);
> +			} else {
> +				mult = (m + 1) / (2 * (n + 1));
> +				div = (p + 1);

The ( ) is unnecessary on div on the three places above.

> +static void ast2700_soc1_configure_i3c_clk(struct ast2700_clk_ctrl *clk_ctrl)
> +{
> +	if (readl(clk_ctrl->base + SCU1_REVISION_ID) & REVISION_ID)
> +		/* I3C 250MHz = HPLL/4 */
> +		writel((readl(clk_ctrl->base + SCU1_CLK_SEL2) &
> +			~SCU1_CLK_I3C_DIV_MASK) |
> +			       FIELD_PREP(SCU1_CLK_I3C_DIV_MASK,
> +					  SCU1_CLK_I3C_DIV(4)),
> +		       clk_ctrl->base + SCU1_CLK_SEL2);

This block is hard to read. What do you think about this instead?

        if (readl(clk_ctrl->base + SCU1_REVISION_ID) & REVISION_ID) {
        	u32 val;

                /* I3C 250MHz = HPLL/4 */
                val = readl(clk_ctrl->base + SCU1_CLK_SEL2) & ~SCU1_CLK_I3C_DIV_MASK;
                val |= FIELD_PREP(SCU1_CLK_I3C_DIV_MASK, SCU1_CLK_I3C_DIV(4));
                writel(val, clk_ctrl->base + SCU1_CLK_SEL2);
        }

With those addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

