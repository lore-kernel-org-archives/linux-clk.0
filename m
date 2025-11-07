Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7D29AAFA
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501525; cv=none; b=MEX32F3+AOh6sjzQ6LpqdjA/QsANKaK1OjMZNUWfdT2nD7QMwhMmVWPP/CUPHvYBi8PTNcON4OBTYzRjHX4WZ8Fh1EdOKWGVx9ann+mG4XHVpOAka823j8Lc+SzWlr7KGD8AEP+krsNFk3fW8foP6Hf2yoIeBsmhwHxiwX2Wws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501525; c=relaxed/simple;
	bh=Nf/+Nuiru5UQ5tKiQIw1Zyj3JCKTW1TPwNHP++22v+E=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6yZuM0fWLqxH2e8fnydQRh/ZzINBQFzckBA3OivXcC1V/kc1ndaYXgZ+gsVVHLt32VdwBm1N5uSVBQG9ujs+CJT9b6LLsVSSv7xU+FTXbkwUvJjhzxtc89c5pQGD2a9EBp3+S7OceNVnDGXwSiEuiHIvJi2lsQ8za7qnowdqAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGbKnpUo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGbKnpUo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47112a73785so2398015e9.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 23:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762501522; x=1763106322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ir8VQgkEh19ByDpqJ3ZhWd2KcYrZBfTNNF+aEN1RLFo=;
        b=kGbKnpUofPz234YE0vX97HtJ1SsYA6sLtyvBXDsjzL1aJF347XSFicgQFYn5EPzjrf
         WQjCwJE+MQo40+zWvubgscg5EJ+sB75L6Kt0/PFHmLaAz5yNjx5to3ipvR4FaBXPJiiA
         Z8mtitp0OuVDGngIf9WyIgi+6guwZNOi+1Fh0LL22+YRdX54WOXbd7G2hSxGvArE+DhA
         ncMBYeK/i61ysy0mHpOh/Te1wGt41vAzFWxcXat93boXPDxDPlJLONxVPkdf1igR0fjY
         4IOvbKdVCRjYLWzPD8YxUKGHBkkOb65i1LEJRozBdtoIQt+mVhPyN7H6o1LN2fGnf8G8
         TDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762501522; x=1763106322;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir8VQgkEh19ByDpqJ3ZhWd2KcYrZBfTNNF+aEN1RLFo=;
        b=irBkq028FMqd69hYBSYWy+w6HkPQP4tgZGvqIEUCC7uTNICd1xJwh3taNKM7LnnLKz
         AiVt9kAGoguClMkvuxQvShFCewdI+uRUhnsZ0EEd8Kpp39ctGqITx31/jDbkJ91AwX13
         BdoDGEnA1Wz6FbUSbmxmH2CxN8YjDlsaTpOmAG0cBFQR42QzcZsaFRFrcz3ZoR6Oi14F
         fkvY0P2/+43vIG0g0pSqvkp8rdLW/OUjM3WdLWnRv701gfskPkjhR/NQxj3xI1cuME58
         62O1DL6PJ1nzU0X6bGwdbNalVyGHiJ8jwWFNtDKfrugCrPVq6ev5sUVXoOjBZwq5NAG6
         5ssg==
X-Forwarded-Encrypted: i=1; AJvYcCX4pBVrPaBl5muu6rvQLLGfNxbnwWHc+4UJNwdWI9hXFh6PFnnod8rhf+SVCNa9cuZ4C1Lilr2rbjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy084OYmJWBHmTPpC3eGLxXow/alTPOqIhzyq4mOjOCcQt9//8Z
	928av9S6EDfg2hUAUIXXyyhK19iy+FUfRtVF+8vkowtuUW3QPl3C2EQF9M6ljQ==
X-Gm-Gg: ASbGnctZnp5qD3tJ64qEyLf0VmmjGCArce+PZI2vkRB+aic4BHWAyJqFX0af2bHWyXb
	flVwJOcT1IwQMbIagb1qXcNKAWB1KroeEO8VYBZukmLP2TM4N+1sOrTGvJ/qkjcftRRAFJRANtE
	Cgouu1rZULI6/20JLdOi0ZPh+uzr2UN4XX9tCqRtxGAxqSwhHJwJDyhDa0csDVXEdydjAbVlMDw
	EFL43A7S67QPPDyo10UsrkycZTuHmcKfiz0Ic5gAkw1AUCGjCymXI2yBKAcJiMO64k23x9mm0o+
	VfuY3KvFJutAOaWLUuI48tMHY1CT/PTVuc4Ck9fVrwbzIMsR8BX2QMZl1CzGYmk4w3e+mGU2ach
	fTNpjq+2LnuLFuQm6ZkhKMe9qgICJ9xFnhA5HMtWo1uD9xUuf4zeTV1fCl7+MQhwG2JB8zElSIi
	wbeOHAXW/uOR5rHt74L8v4JTvoLu0I
X-Google-Smtp-Source: AGHT+IHk8GYQh3wxfdQ/MM0WlQ/G6tPyoDQUjYiMB1HlnNgjeZhvbY5XK3zuUBHmQ5l2hQh0RRXxXQ==
X-Received: by 2002:a05:600c:35d0:b0:477:6d96:b3e7 with SMTP id 5b1f17b1804b1-4776d96b678mr9653645e9.33.1762501521541;
        Thu, 06 Nov 2025 23:45:21 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67921c3sm3627125f8f.40.2025.11.06.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:45:21 -0800 (PST)
Message-ID: <690da391.5d0a0220.33eed5.80b7@mx.google.com>
X-Google-Original-Message-ID: <aQ2jj3R3N6sfcHQu@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 08:45:19 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20251106195935.1767696-1-ansuelsmth@gmail.com>
 <20251106195935.1767696-5-ansuelsmth@gmail.com>
 <20251107-fancy-premium-lynx-dc9bbd@kuoka>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-fancy-premium-lynx-dc9bbd@kuoka>

On Fri, Nov 07, 2025 at 08:42:15AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 08:59:31PM +0100, Christian Marangi wrote:
> > Document support for Airoha AN7583 clock based on the EN7523
> > clock schema.
> > 
> > Add additional binding for additional clock and reset lines.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/clock/airoha,en7523-scu.yaml     |  5 +-
> >  include/dt-bindings/clock/en7523-clk.h        |  3 +
> >  .../dt-bindings/reset/airoha,an7583-reset.h   | 62 +++++++++++++++++++
> >  3 files changed, 69 insertions(+), 1 deletion(-)
> >  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index fe2c5c1baf43..2d53b96356c5 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -30,6 +30,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - airoha,an7583-scu
> 
> That's random order. Keep it sorted.
> 
> Best regards,
> Krzysztof
>

Hi Krzysztof,

I was also not cetrain on the correct order.

We have En7523 and en7581 and then An7583.

So should I put it at last following the number order or the
alphabetical order?

-- 
	Ansuel
