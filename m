Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDF33358A7
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 15:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882930; cv=none; b=adgJrZ/hWnHL7tt1w6H2ng2rTTzJhyR763zE6SPaPkbQuZYtuRNTnfr8frJyCxDqvK7FQEYTG3wwSVv+WWCQqzEFvqsZV4IMGrUhiQXlcGPMC6id6x2P9XacL2cmV1ZgBgPBU/FPwdgH7cFDVEKstmAbCqY1+fqr4PqzqtoTHww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882930; c=relaxed/simple;
	bh=fVkuWa4a6/cQxsnJg9pRm7tn6P2ndJyKnXupZf2dZoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ii6ExF48h440NT8RYkrjdOAHz50phLiiuJiKZljQnKEgYp3T1xSIn6PoejfZ6X0y6pqiMjuw6tk48qdrDZtxuRajGbMoz3hWm3aGSqOp0RYxatyBGnNAGT2ZK9v/kZl3wqY+4omExFK+eW0j/v+LP1uSuaXrW16q6ekqHTFukGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SfFreR6r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jrE7BW84; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SfFreR6r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jrE7BW84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
	b=SfFreR6rpM2ZOmgG5YA0lzIkhzb9Oq2LSH/Z/RMC7lQOEHHcTuCdap5ZRPgL9ohdm5mju+
	eoV3o2Retaryh2MojrhsGURKVcttmU5Lex5MjKUJ6igG2ytDetIS0beyXk6pDYJxhrljlw
	HO/rQcuoYRKDFNcJ7xhnOhbRstn/VDo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-06mFXj5NP9ePQMm2PLOzzQ-1; Mon, 30 Mar 2026 11:02:05 -0400
X-MC-Unique: 06mFXj5NP9ePQMm2PLOzzQ-1
X-Mimecast-MFC-AGG-ID: 06mFXj5NP9ePQMm2PLOzzQ_1774882925
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a1accb970fso14494476d6.3
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882925; x=1775487725; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
        b=jrE7BW84LjtH3vjTmBnHSlGa9i45Xcm+Eq6/D8A1g80H6L6bcPPvJe8apOSND4rGly
         CVVgCWYGv1Lo/tBCw5MWiv3ERaKvKiiTTuBnu+sY+Oi62WrotCIphf/6k2e1sAB6feu0
         nuccqoKu/TzSO8QoP+w9kDFJk7JfKn7ouvhphlLNKY4ja2o+HQOB7IdRJq9PV5sjuoaW
         i4vog5D0MGMW1bppab45CNPmHcnb8htqzb4mI6aA0L/kIOLiZQG2EQ2sQFcOsusEvsoL
         lKCBMZzARmnt6niXa0Q9nBmYH6jen297Aldk53QXMiBEwamv/3kAQoTkqvTKLxmJPVMt
         LITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882925; x=1775487725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ioaGBccEulsVefeHIBPg305ScRFhJiChwS24LCLi1yU=;
        b=TexMHWzLCEv6bmX2w3zxXIZlsjK/liebzXKgbedReX21Zoy/7A4KWFBXHM1/3N5tup
         tmTAD1cfxYR7SRqdOxJKThY68YobRXpMOiYnVMhvP4BsFUDF4f1Yw7qDam2H4XZzwrzd
         Z4xPnqOUuAYQ7ayIIziEdqc05plf33cKQnBepctr6uGDwIZBEPkHzk3GBNQbNxNT4EcZ
         pim9/ZCWqZECud8t6SEm0QrMLlG/qAjUSWoOcbwv2vRvKAMyyLxhvBBzZ44uLRoL08Ex
         CsYjnqqH1iGZZdu5qEL2cahtjJqTKfVfTpigixDuxAfdn8bJ/WTnAs9kGngwysPn5Prz
         cv+w==
X-Forwarded-Encrypted: i=1; AJvYcCXXdUhRKgL/IMhOph6VX2wsL5f597MlZZ4sI7H3bkwg7Sa55R+iWp49qwJr1GKRi/p4abbvNDW/WmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3BmU7A6C4c9o9CLCEcEFGjFqLHd9rywHGg51q10bkcF6CX1u
	Y5O8hxVOlAmP1j7YufpM/1uwi9jzgwD1gNwV9iN8hQ3oia5KzKBFHPaiARlPUGVHka9y4N3+acX
	8FUJRqZK7UkQjFgLS1B4iprN5nOtC71w+awfCLNGqsTIdAu0dKtKVC2qQfJfJJw==
X-Gm-Gg: ATEYQzwujhxlmnI/LCspKeQWQ3g7c3kxzfRounYC7S0e0iBbtJk6Ds1InJZZPSeW9NM
	p0gCIPkaymoSIroMlY4nxYwzs5EJ+RUbMKxFYOIcfbpTtBR0YHlA1cRIxXmpiKjYW7pLEcRV8xQ
	t5V21sR5rEnRkW5mQC6UbQO+5gMsKbg7SObs62XdQrfsyISEF2kXsI6s69TAx/7gyZPLu1DgV7I
	UdZb8RexsrKj49hg9rKRAdXJsw9o3YtTYdhSsnQ58m6ceG7IDcWYn3CZDWZZM1f4FkYh8+ZepW1
	M4zNKdYRaG8D34t6+H2iTqCXYBOWO+DotA7k9sAQkXsehx+KnuHZ/Yzj7MYaSYDJJGXWtXi/xRp
	XhTUENWy9V96JP5p2cL3x5onR+eRYA7LApJwiqaxLsvXZOiVRSok4NNlx
X-Received: by 2002:a05:6214:498f:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a007c84819mr89272126d6.33.1774882923329;
        Mon, 30 Mar 2026 08:02:03 -0700 (PDT)
X-Received: by 2002:a05:6214:498f:b0:8a0:7c8:409b with SMTP id 6a1803df08f44-8a007c84819mr89271186d6.33.1774882922650;
        Mon, 30 Mar 2026 08:02:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89f49cbb8besm57387836d6.43.2026.03.30.08.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:02:01 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:01:59 -0400
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
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/16] clk: Use the generic OF phandle parsing in only
 one place
Message-ID: <acqQZ5sx_WZrr4KJ@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-9-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 27, 2026 at 09:09:31PM +0100, Miquel Raynal (Schneider Electric) wrote:
> There should be one single entry in the OF world, so that the way we
> parse the DT is always the same. make sure this is the case by avoid
> calling of_parse_phandle_with_args() from of_clk_get_parent_name(). This
> is even more relevant as we currently fail to parse clock-ranges. As a
> result, it seems to be safer to directly call of_parse_clkspec() there.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/clk.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 591c0780b61e..93e33ff30f3a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5375,8 +5375,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
>  	int count;
>  	struct clk *clk;
>  
> -	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> -					&clkspec);
> +	rc = of_parse_clkspec(np, index, NULL, &clkspec);
>  	if (rc)
>  		return NULL;

Reviewed-by: Brian Masney <bmasney@redhat.com>

In case a Fixes tag is warranted, it's not exactly clear what should be
used. This was introduced in commit 766e6a4ec602 ("clk: add DT clock
binding support") in 2012. However of_parse_clkspec was introduced in
commit 4472287a3b2f5 ("clk: Introduce of_clk_get_hw_from_clkspec()") in
2018.

