Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F582899
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184814; cv=none; b=ZanSehedpdjBcyrlRaHlKWtnEEYbWkBW2due7Ggq5TdHS+E3boky/lGrzML+hvgM4LhRhIEsB4MbkJDJ9dDoWcnCpGhfiKZwp5K9FfZp2srVy2R5Jwk3kFB3HM7A1l4vhw6WDZFR/YsWFk74K2tcDgaNHvMhkVo00g/O5m2rM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184814; c=relaxed/simple;
	bh=8pXvC8saaovmNYWD6LB2NpHiAdgmwvzHy3vNJ/rR0r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNxYlEumK7A3r4ZHW/dcX8shf+vcKCEs7Jv5uPaVujw7NkqeQq8xG7VY2F+paGF1BYcVCDfRtdT66uX/tciOxNI5al7C3NX7n/g7/sKjz0CgtCiXFo05lKfsZ/GOPKPwx/2XC/sXZ2saopuaeM0p9WtnpOkDL18OXtnHszieBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M6I3P3n6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M6I3P3n6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30185d00446so401172a91.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744184812; x=1744789612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPe5EFIk2JAls1hezPuV2MYzcMhxRkzu+28tJeOhpVU=;
        b=M6I3P3n6maq1tXoPvrqkl5A+iLIfsf2HTf09lfMjFwcuIVHbhSsvNQ+963hauJz4pq
         TDIbgAcg1U1C0v87XFRLAJWnuqeuRvJKtPZ9NNK8KWkq6rd5mRzmUy4VVxIuOuMpsQ98
         8UDyAi/gPWuq1h/DX9YUVlxFyYcT/Dp1zqXrn64G4ZC9H3JXU4LUXNdrzhhpQPchq1ex
         KW46y776YXJyVK+1uwM8E5qewYdxUFk9MadY6Q/vkzoofsIz8eA8HQYpY6RcQZiiAl8g
         ypE8AvaS0iUCjlM9YR1VrAdt+NhAcIWAC/hMXkLPYlft7ksiaqniHtfeegvMWq7A7GBE
         ZU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744184812; x=1744789612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPe5EFIk2JAls1hezPuV2MYzcMhxRkzu+28tJeOhpVU=;
        b=w+Ir55A2X1UKcPjfc/YG9JGaY2UUqEAARdlyG1GlbkzN0AhpB6jyOUe56szg7wQhWj
         w/05ZiLBKdxcZ2IlB9vYjV+VQtI0/146HcADo3eypLFvFoNyKfDedVZ004gxlRNl9Fhl
         KG45CsFdNObbRC+5Nw8j0pDUnXbpYlJrpPmLbyzhwPuQl3lHabHeM2tB6YuSfOTHsSSV
         BvpPnOiCmCX4Qiq7ZBIjwKPxDwjSVWY6htL5lyAlZPQmzCW2ytnZgo/Arr0m4twjrk1x
         Gd1P7Ef8V16Sa0t+/rhA4HQXG3eervwyqeTYBGjRtvR73GX7aNmnAa1SYbO526KrvJzM
         0RJw==
X-Forwarded-Encrypted: i=1; AJvYcCVNHYTyYt8WS6/YaEAhW87Cl/1l2+Y5Zc4CTi7bJfBSD/UdosorUcUZ+YY928wXwygXPC72NBlgjNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym44g/lDgc+JD0zlWxTloT3Aa8nGk5ZipUBVXQk9sVmJpBp5a7
	YOgF/AwcuYuKwb66Z1OFcafapgov21g5h4Zk1wSFOw5wvfxbYBf6QXdzHOejMnhdrikeg+2Rpda
	2
X-Gm-Gg: ASbGncu8F968XxaAhPL9EqOctO42ikkyCQWkeEsKuG6InVmz1BinJThZ1PbUEYUCn+C
	zNDd/pxLU19KP7ShEsJMrSlsDqr4Y3/7TxDihRJKXlkH3tB77rLMxDjRRc6Lrzl0IkF1Gc6RVVM
	u0IeQsidWzVl8Q1IcKziNRH6270FyH6L7obu2ui/cwbxD7Ti6+UB0Zfe0mT/BMz18waNOI4ybWB
	DwYzdDl56gCRnMNLwRyjV4PLsvDKVcAg/Lsv6io1KY4pBUvuO72Ks4TpyckER1yix1OzrKgvMM2
	QAsY7CoTbNwsVRUkjmiMvQ9x+S9Zwyu/HCJdHAIFWb32Q505ouqzsFuihH8NT3rPRp6OQsLFW7e
	J
X-Google-Smtp-Source: AGHT+IGeWFAmHsxFBBGDibBbsDrhNmr+0jD0MhdR2n98VfY5WnHP5Tsxjn8/Be23AVtU2AtbXgk7BA==
X-Received: by 2002:a17:90a:d64d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-306dc054d59mr2731761a91.10.1744184811953;
        Wed, 09 Apr 2025 00:46:51 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df07dc59sm728781a91.13.2025.04.09.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:46:51 -0700 (PDT)
Date: Wed, 9 Apr 2025 00:46:33 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/Yl2cvTEhM7y9Dz@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-2-sbellary@baylibre.com>
 <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-famous-rottweiler-of-perspective-e5dcbc@shite>

On Fri, Apr 04, 2025 at 12:44:39PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 06:44:57PM GMT, Sukrut Bellary wrote:
> > +properties:
> > +  reg:
> > +    maxItems: 1
> 
> How reg is part of this? Every clock has reg, doesn't it? Otherwise how
> do you control it? Drop.

Thanks for the review.
I will drop.

> > +
> > +  ti,autoidle-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      bit shift of the autoidle enable bit for the clock
> > +    maximum: 31
> > +    default: 0
> > +
> > +  ti,invert-autoidle-bit:
> > +    type: boolean
> > +    description:
> > +      autoidle is enabled by setting the bit to 0
> 
> required:
>   - ti,autoidle-shift
>   - ti,invert-autoidle-bit - although this makes no sense, so probably
> old binding was not correct here

Yes, all clocks don't support autoidle. So, required is not applicable
here.

> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    bus {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      clock@1b4 {
> > +        reg = <0x01b4>;
> > +        ti,autoidle-shift = <8>;
> > +        ti,invert-autoidle-bit;
> > +      };
> 
> Drop example, pointless here - noop due to lack of compatible. Instead
> provide complete examples in schemas referencing this.

Ok, will remove from here.

> > +    };
> > -- 
> > 2.34.1
> > 
