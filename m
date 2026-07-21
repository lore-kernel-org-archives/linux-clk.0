Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C3236D50D
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673168; cv=none; b=kUtYQ7gmFEUacsWsREf78s3CDaXEoUBIMTbmT3fPYRrkOun/ym4pP0vTu3FgzWG+FIV5JDBKnGexk39Q5nyGsAYdE/RGyMA5HZmz7IuZa6crCrnMcCINB4niDNAaWte360nW6qc9TNmXDAcP9RkOBmfS1IKQJNlhkgt97QVGY/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673168; c=relaxed/simple;
	bh=9sE08mWiHIkvCopY63Ytv07qGv7Tqnqj9oiKu6FrlP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4Y3KuYHetRpwpqg7FVA74fdAfr1YYYfAgHyb4xLtQBPx3ni3UAO2GRhQTtFRKLEbGuFct+N59rKFTCk8x2z7jIOybzVSAghf+JK4aDpR93ZIFZsADSvcDe6yX7TEMEpNSCGIHXZiGzdsPrawnNjVegJHVBWi98FUW4onW+WxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDBcE1AS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IBvlF5il; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDBcE1AS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IBvlF5il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784673165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F7BKONF8ODMOL+gKzoyhMNcxsmzd3EOR2CMZZShEkWI=;
	b=iDBcE1AS/y3eF9lQDrv7jmIzQdU9uQNNqpn++sJFYJ1YOo2wPDbZp9DYYLhjn6tAGkUaVs
	r/+h5b1UXavldKhVbkehTmttJYcEI2IB3TCMn2fscLrQHtgh8IDNK+ErlvAhgeYYVdUuIP
	7PreX8UHLCisAXpCrqnbROZwG3u9u5I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-K3ftHVLANhOUaNuUZequuw-1; Tue, 21 Jul 2026 18:32:44 -0400
X-MC-Unique: K3ftHVLANhOUaNuUZequuw-1
X-Mimecast-MFC-AGG-ID: K3ftHVLANhOUaNuUZequuw_1784673163
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so2069418885a.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784673163; x=1785277963; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F7BKONF8ODMOL+gKzoyhMNcxsmzd3EOR2CMZZShEkWI=;
        b=IBvlF5ilEtDEcCM7MLKOA1y+PiSfAwY1abxOOFCZ1Hu9xawOjaoXsdL0lo/G+mmukX
         DvkUnuM0UFStDISehVBmTHNYNRGUXyEd3YSXe1B0oqkdVFpzT+SmINIUeYFUH5F4Hmnn
         bHsDKUG3GOGO4/nefZssVwPuAy7cX9fcH3WOI7APVA2qTb74BXwiuS13a9Gtz78kcdbA
         ghXnTSuj54WFoUrruW8/gv+pNRaGsUBq6Xjiw5y2zuf+KHqb9/A1J+7PVJr135fsqzi/
         asbXWamcPQEHhsEkFy06ystTJ8R931EN8j5bxOx41mnbieqSMPYn+wiPX3DXhUf/X3fN
         1BNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673163; x=1785277963;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7BKONF8ODMOL+gKzoyhMNcxsmzd3EOR2CMZZShEkWI=;
        b=fx8B4ICVIbuhDWTRLY184zPQj6nXmLAyyszazD8E6UoQ6TylEs19wcc66XZDZJhheO
         ijAox8XetdHhpZlzIEGX065J9H5osDlRVZ33ey5suPiKU7b3DEXj2W578/Ruygmfppoc
         FJGf1dm0yvaQOWoISX0fOPq6XgYULTIkmPp92iPEw1sThgnmORLxmBq+LfwmxCNlB7yL
         PdEmnIVqck0ynlSlRv7c1Qxe+SblY9lm5eeQKtw1Igaa+RsEqMOtT4ptMed7vXngvfdg
         ChaNeKzjD1UdZZOL2eAcQzd+9LYmVrbne5dnNmiITaqNkpQlTGX4EfT406ttY7lfb+l1
         CgJg==
X-Forwarded-Encrypted: i=1; AHgh+RpGY2XeGBK3+h9sT34eN9CLVYqhqbwGq/N6N/tMbzKWOW90ZjqAqqRFXa+X2fmz+YPyGKZQhLXBM1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuE9H9D5o/hV91avQ+US5UhOmxMztlQWmPAXKW+zRxAWBOpdj
	g00kHyyKnd98fr2zTJK3C8h/1yDHUbnwudgXUlCt0dS0ZfTJrKWg3G2IAOoLbL+MNmNzSMP1U1N
	Zw2USt1/IMmfkCkFMVC+uIFNfyYg3LTNK58JyJANFxUbaSP0s+pCn32FsS7IZ3w==
X-Gm-Gg: AR+sD11amD0PG1WFal+wOwxMzZjOz8eFGU4uh6oJJpMtJWB022pzR0uJvAjQPz10+l6
	3UijsucNleoab4nnX7+QuZjIcdMiRa0PWHPzG/ibJFvrxEqLrZxoKE+0iPo3T/Pd7Yfmujue6xo
	xMlU35BLEDSUczoSos8BfuYuwC7knRS1DYjYyRLXc804Bto9jSz9htIzzBlSKuoedGhEwsbDqil
	KAEBUjYPhA658fD8BmuoFUavD8h8nb3Rxsdv7kRio9/DkxPmAvyMYDCmW8chkr3cJiFJWoL/Azg
	TYcnsJ3lJFPvYc9/TXoD//dHKsAK2whcRkbTDXm/7ZYU7f1ATDm7VfNjjBnSSTyOQtzmkZvo/IF
	+boBOJ6f94LUEydIqG4IWoHfcxn0C0sdhBHE=
X-Received: by 2002:a05:620a:2703:b0:92e:9ceb:24af with SMTP id af79cd13be357-930b3ef555amr1901754285a.41.1784673163433;
        Tue, 21 Jul 2026 15:32:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2703:b0:92e:9ceb:24af with SMTP id af79cd13be357-930b3ef555amr1901752285a.41.1784673163086;
        Tue, 21 Jul 2026 15:32:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a03834sm5454785a.30.2026.07.21.15.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:32:42 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:32:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: Re: [PATCH v4 7/7] clk: tests: Add Kunit testing for nexus nodes
Message-ID: <al_zh1cOInMXEU8x@redhat.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-7-751547e160e5@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 05:59:23PM +0200, Miquel Raynal (Schneider Electric) wrote:
> Add a nexus node with a child requesting a mapped clock in the fake DT
> overlay to verify that the parsing is also correctly working.
> 
> Create an of_find_node_by_name() like kunit helper to garbage collect the
> node automatically in case of failed assertion.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/clk_kunit_helpers.c          | 31 +++++++++++++++++++++++++++++++
>  drivers/clk/clk_test.c                   | 15 +++++++++++++++
>  drivers/clk/kunit_clk_parse_clkspec.dtso | 10 ++++++++++
>  include/kunit/clk.h                      |  2 ++
>  4 files changed, 58 insertions(+)
> 
> diff --git a/drivers/clk/clk_kunit_helpers.c b/drivers/clk/clk_kunit_helpers.c
> index 68a28e70bb61..daaf1cf1546c 100644
> --- a/drivers/clk/clk_kunit_helpers.c
> +++ b/drivers/clk/clk_kunit_helpers.c
> @@ -233,5 +233,36 @@ int of_clk_add_hw_provider_kunit(struct kunit *test, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(of_clk_add_hw_provider_kunit);
>  
> +KUNIT_DEFINE_ACTION_WRAPPER(of_node_put_wrapper, of_node_put, struct device_node *);
> +
> +/**
> + * of_find_node_by_name_kunit() - Test managed of_find_node_by_name()
> + * @test: The test context
> + * @from: Parent device node to start searching from, or NULL to search from root
> + * @name: The name string to match against
> + *
> + * Just like of_find_node_by_name(), except the device_noded is managed by
> + * the test case and is automatically put after the test case concludes.
> + *
> + * Return: the device_node on success, NULL if not found, or a negative errno value on failure.
> + */
> +struct device_node *of_find_node_by_name_kunit(struct kunit *test, struct device_node *from,
> +					       const char *name)
> +{
> +	struct device_node *np;
> +	int ret;
> +
> +	np = of_find_node_by_name(from, name);
> +	if (!np)
> +		return NULL;
> +
> +	ret = kunit_add_action_or_reset(test, of_node_put_wrapper, np);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return np;
> +}
> +EXPORT_SYMBOL_GPL(of_find_node_by_name_kunit);

Should this be prefixed with clk_ since this is in clk_kunit_helpers.c?

Other than this, the whole series looks reasonable to me. I'm curious
though to get Stephen's feedback about this series.

Brian

