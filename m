Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52362323416
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882124; cv=none; b=kOGhsrIwQmiyAVOLhEX+iasp1koS4haO436E8u7aukDgJy5yWvdC326OirYn/o6AusoyeLXbX6p+tJFSILV/EKcEUuFFpJhD/kXA5/hDvq1mRdAi2YK/74r2xwovK30ruCemxT19A/fUTdg3ZFHxdmO814Oi8OPkgtmKJBcIaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882124; c=relaxed/simple;
	bh=qRDMpKJX27w2zrmAyfZnBYRp0iKrPs7epsHO9Ew4my8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDJYzRwSG67JIiNkGpjMnTvqis5Pkx7aO6PWGpBCLu4X50GKFp6XTvOpHmcE+NRlRX5MR6+MSTHUuxOSBLu0vnvp7cNdP/4ZbeTyV5shfI0/IZrHt0B+sOmTUVynHBLby1Z8WLksRUmSNgIi6RMPhvuTkPY7touxspbZ6pHI++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BrEPOcJi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8q6oQhJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BrEPOcJi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8q6oQhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPJMgxubQOT61Bt8c1TkmO+q4Ej7bdY+pNKwDemJ1Jo=;
	b=BrEPOcJiBgKyawOW84vRe/2aaKHprKqX3AeT8xQvqyUdq26gDqzfFaE53ePL46sNJOnQ8k
	Yf5vLuPFGKS5Fn2EfGsEjROl8Dl0gMNT7TD4D3QAgNQbIvWaoNEkawF9DRABFOGCgVkSpT
	Rba2pLhQShN+d+br+Au/UrTmEDY1ObY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-AN8FaQkEMpihG1lacRA34Q-1; Mon, 30 Mar 2026 10:48:41 -0400
X-MC-Unique: AN8FaQkEMpihG1lacRA34Q-1
X-Mimecast-MFC-AGG-ID: AN8FaQkEMpihG1lacRA34Q_1774882120
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so117265211cf.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882120; x=1775486920; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJMgxubQOT61Bt8c1TkmO+q4Ej7bdY+pNKwDemJ1Jo=;
        b=K8q6oQhJEx3pnwO+3jLG8oJBEAddLRbv0kk5jno3mj2g50QrUs8oKawg8K8da2ZIwd
         r4FGXvNMTUtzI9qHaKsVrKsdVWtsD+aLqLhfwYxYl2kCKb4Bo6lUWbSZZJMHu2xlpL3k
         UIfg6GSawlT1jqE6TNlL/UHG1VOTBy1eeTbVwKrX9xjDjzDXLb56gtWQSQGo0WrVm4pU
         FG3yLZZ+JLOp6K+w2tfrKqpfnmsIyYN/6jM/Getsw7KqmzGl+ve5otXG3t7twa9P7Z1T
         b/DUjJ0vHwffMFZKlBwbe/721THxHotSdu6rpCmZty8sdZhcoy0NpHVGAWYWnoMgbMte
         RScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882120; x=1775486920;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPJMgxubQOT61Bt8c1TkmO+q4Ej7bdY+pNKwDemJ1Jo=;
        b=tNy8jRmPYeOG3veAurrvEfLzYclICSBbD3UM6KLjEIg2uCkjU3lcHqtbHGLr65Yyiy
         wFt3LMFMjGf77lZc72TSdhc6xWRLa3j+15Q1kAlitpy2C97xVWl38i5IpYfrggXt2RwG
         YIIkozSLeEaRB2Cg2vjsOMfeYtmd65nMcVgQO5G7mffCzB4k5vAHdrijyEXC9euM54pI
         xx36B1Q7J+m+UItuQN50qC87yk/yCMiQq8F9zCopgadQr4P780IJ8D1bhKiIJAc5Rqa8
         jFu/Fdb2BTxhepU/JeJLjn+4P8k70M4iEt58qPqGiu8wGKkR+p4+7hOGgBpnHjHSIvn1
         jL1g==
X-Forwarded-Encrypted: i=1; AJvYcCU8s/d1aogENqNyQFmf9yC79WyEDmqVkPDwjy5o+HZwJzph/fK8NnIwb+DtJ1XENYBJygk5RuDuD70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzew9/Y0Jyws4N+VWAmBMVKW/8oNV7KYSkmyTwYX7ZtlxiE+6nH
	8bxYhAgCcrK3xGytpCM++m7M+1n+VS4acXWh/WygKYyAvLMZdKe7ZyNTomjQ8IeTDzdpNeTqFm7
	rweScD5ApAE9Mwp2g7Uuji8yw/JbiM1B+3LfECst1piL1MYWZVhI/2Jyrq/LFxA==
X-Gm-Gg: ATEYQzxiQqCou9+k0O98UjezAbBZFE40w233mAAPO/+aWdJYGq3HkBKn2lIT8kCH2r2
	KT9PoOCzA6NDei+0UmPvLnJlt0R6keVWxHbyS+r5h+tlqnKgFiK0V2nDJs4xudrYGbqtFVOQLRD
	awbNyfG3vsqhCGaipvUyv3HpoTFJvILyzvw5tj54/49KQ08q9ZTRQ0zTfKY87Ag4Ha7yuQavgp8
	lDuJ4zVteCG01s2H5AwtmmSlhZ4sVFFFNssPq1QInu8lJs0jvmV7A3MAJz331MozD3It5oIvJmp
	dm6oA9QgTC6kuZ0nRYvtLtxLGuk6uSVlAzal8Wa28dSVQdVB9pWCJ2HtD44UQryel1wQANoZbAr
	OUvmnj1lLsCnOEHO8Ggn27YSVvdjQM4r481kRq5640Dz7SnEp+dXAnUn1
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr162438021cf.65.1774882120204;
        Mon, 30 Mar 2026 07:48:40 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:509:23c5:3291 with SMTP id d75a77b69052e-50ba39bae24mr162437351cf.65.1774882119419;
        Mon, 30 Mar 2026 07:48:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm66397621cf.16.2026.03.30.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:48:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:48:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 06/16] clk: tests: Add clk_parse_clkspec() Kunit testing
Message-ID: <acqNRVLrPxABvecZ@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Miquel,

On Fri, Mar 27, 2026 at 09:09:28PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Create a new set of kunit tests to make sure clk_parse_clkspec() is
> working as expected. We currently verify if we get a proper device when
> using indexes and names. If we make an out of bounds request we expect
> an error.
> 
> For testing purposes, we must ensure of_clk_get_hw()'s symbol is
> exported.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/Makefile                     |   1 +
>  drivers/clk/clk.c                        |   1 +
>  drivers/clk/clk_test.c                   | 124 +++++++++++++++++++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso |  21 ++++++
>  4 files changed, 147 insertions(+)
> 
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index f7bce3951a30..97b621456bf5 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -19,6 +19,7 @@ clk-test-y			:= clk_test.o \
>  				   kunit_clk_assigned_rates_zero.dtbo.o \
>  				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
>  				   kunit_clk_hw_get_dev_of_node.dtbo.o \
> +				   kunit_clk_parse_clkspec.dtbo.o \
>  				   kunit_clk_parent_data_test.dtbo.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 47093cda9df3..1795246b10a0 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5312,6 +5312,7 @@ struct clk_hw *of_clk_get_hw(struct device_node *np, int index,
>  
>  	return hw;
>  }
> +EXPORT_SYMBOL_GPL(of_clk_get_hw);

So that we don't unnecessarily broaden the API that's available to the
clk providers, you can use EXPORT_SYMBOL_IF_KUNIT so that this is only
available to the kunit tests.

Note that Chen-Yu posted a separate patch to add the includes for a
separate test. The two patches will conflict since Stephen hasn't picked
this up yet.

https://lore.kernel.org/linux-clk/20260225083413.3384950-1-wenst@chromium.org/

>  
>  static struct clk *__of_clk_get(struct device_node *np,
>  				int index, const char *dev_id,
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index a268d7b5d4cb..b814b45f1f7e 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -3541,10 +3541,134 @@ static struct kunit_suite clk_hw_get_dev_of_node_test_suite = {
>  	.test_cases = clk_hw_get_dev_of_node_test_cases,
>  };
>  
> +static const struct clk_init_data clk_parse_clkspec_1_init_data = {
> +	.name = "clk_parse_clkspec_1",
> +	.ops = &empty_clk_ops,
> +};
> +
> +static const struct clk_init_data clk_parse_clkspec_2_init_data = {
> +	.name = "clk_parse_clkspec_2",
> +	.ops = &empty_clk_ops,
> +};
> +
> +static struct clk_hw *kunit_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	return (struct clk_hw *)data;
> +}
> +
> +struct clk_parse_clkspec_ctx {
> +	struct device_node *prov1_np;
> +	struct device_node *prov2_np;
> +	struct device_node *cons_np;
> +};
> +
> +static int clk_parse_clkspec_init(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx;
> +	struct clk_hw *hw1, *hw2;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
> +	test->priv = ctx;
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_overlay_apply_kunit(test, kunit_clk_parse_clkspec));
> +
> +	/* Register provider 1 */
> +	hw1 = kunit_kzalloc(test, sizeof(*hw1), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw1);
> +	hw1->init = &clk_parse_clkspec_1_init_data;
> +
> +	ctx->prov1_np = of_find_compatible_node(NULL, NULL, "test,clock-provider1");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov1_np);
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov1_np, hw1));
> +	of_clk_add_hw_provider(ctx->prov1_np, kunit_clk_get, hw1);

Can you just use of_clk_hw_simple_get() and drop kunit_clk_get() above?

> +	of_node_put(ctx->prov1_np);
> +
> +	/* Register provider 2 */
> +	hw2 = kunit_kzalloc(test, sizeof(*hw2), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw2);
> +	hw2->init = &clk_parse_clkspec_2_init_data;
> +
> +	ctx->prov2_np = of_find_compatible_node(NULL, NULL, "test,clock-provider2");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->prov2_np);
> +
> +	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, ctx->prov2_np, hw2));
> +	of_clk_add_hw_provider(ctx->prov2_np, kunit_clk_get, hw2);
> +	of_node_put(ctx->prov2_np);
> +
> +	ctx->cons_np = of_find_compatible_node(NULL, NULL, "test,clock-consumer");
> +	KUNIT_ASSERT_NOT_NULL(test, ctx->cons_np);
> +
> +	return 0;
> +}
> +
> +static void clk_parse_clkspec_exit(struct kunit *test)
> +{
> +	struct clk_parse_clkspec_ctx *ctx = test->priv;
> +
> +	of_node_put(ctx->prov1_np);
> +	of_node_put(ctx->prov2_np);

Is there a double free of prov1_np and prov2_np? If this is dropped from
the test exit, then they should't need to be in the ctx struct.

Brian

