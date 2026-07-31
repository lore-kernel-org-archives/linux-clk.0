Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F30431E4D
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509961; cv=none; b=gwvFPPRKmB3uPWFRIj3AdLpRkmP0ENWcKKgMOD584hf+ThYyFnkptj03V6ZITu0jhS8IjVxoPQIxgLW+oHAgmK/asvPGa8dDZHy2juk4q0vWF7u4xc8G3ac77ADhFP94xVWVTVr7p2Xq8fWfVP1zzJtrZlhd73rbqTJ2I5qlU4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509961; c=relaxed/simple;
	bh=ElGXvGLoskpu0Bmfw7kAcsfTpn6NYDJabJYnb+cF31E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+/t2qnfhU+YLlZkzId7MSIIwpUVgHA5aZq4KD5SZOvy3Y4AzBfsCZWW/x+1Hu319iHsmLtwptfIwEy83yK8S27a3OYodski0ZvybN48O9exPEtXMvY+gdf/xR2EyKOlb7CDWSQjr2Ff/hzJiE84QLszX4fA6siGuZyzYuhhSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5H6h7kT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5H6h7kT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caed617615so13373205ad.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 07:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785509959; x=1786114759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
        b=e5H6h7kTJbQfdEecLnOTVgZaFj1UvzlkkoX6RsvnhkyPG5YLsUJI/auJsivjwnUzSj
         uFxmYKwC2q2R/Nvot2UbQr0k9IQ+jK+dS/7IRH+UIZOZ22srtPumiLAqpwnDOqtd7NWO
         tJ2zANYqoIQicb6yKC28+JZEHX3StkhoqEZHZdM/zuqCxIqImMSXJzIus9LPsdQXz+pD
         BlRjEyrKwYHiDDSk6HDQitz2XKu5cJTwbL+H8nyKwhyBP/NO2pC5J6lTKPTkAARWqwHs
         08g3NPQ8hzM56Vwp5uyTljeBqWM3Q5Sr8CzZ8pt754Xt8oFJTgVnM7YAT7jfnvP9h9UV
         ULqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785509959; x=1786114759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aOO6TFiM1TPLQ+b9lC0xXQx5BzJNes86bMOqbAvU35g=;
        b=k3wwHz8XVeN4DsMmGVP/COGc9zAyQd+YFlX88ze1vTKeVqjEBRnOd/YFCC84lSXWZN
         ybbh6XxPtLb7Jnwm7YgLwMd2wLHRKi562ien+/qWIZ2tRS5hDUVqTpyb8KQMKM6o1KMF
         7Lvr4uMZnWYx2KzYx1FPB54NMac2jUCIjrQhIHdK44v2DzEMwk2zf8i8Yc2yvaMertlb
         8CX8n+4icxaiF4XTCVUDyM0jR+JVdkZVSc3x7bZg/lgarR4ro9xCo3AzhTmKKz8blt5e
         ue++sQDHXheI9gI03IegsHB4u9ysZR0sGqXvY4obMuz34Enhb+lUO4pxK4K+2gHsKipv
         YL3A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3s6m/eu37vA6ET6vj095JS3WKHcca2bZXFMY0ZD5pXRWYcwrA791z6Y0uNFm8UvwgosMQjDnXm/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz8l7gLWZ19XA9smh7iKFC/YrTgnJGdRH2xpOPxk5G6n0POLrX
	GXy90zrrNP/63vyyjObg26UrWpl0Ftg6OH8LIMPCAzhrCOMn2DxoHCmp
X-Gm-Gg: AR+sD10EA4HRfe7HuNfjSHmqioO2OXlfomrX8N3NcpkioCKkx4LsUY3YeYkci0bX2pX
	6zuRfOcNPuBrmhbT6uGcoiz2elmHJ0AVDa17teT3y11Y0pjAfbMeII1Sh+LKurgBzBSpizDd7UW
	/cXZo6HvXMuzdtdtzoF7qft202GFuU+YYwrb1OQVcWptGFu4dh0qGiDI40utVCGw0Whh57wU1dX
	/QXgUoGsL3AXMO3Jl/HB+jMYYU6nUpYOwAcO8rk8LWZrmxU851hUH0L7YCO8uYoQLCaY2rp9Oug
	jh5KyCTG7Xo0qSLZmMknRYl+Pgh1c9+sHatyhtc1yCxVWdPp7y6RKnFAh4WRzReNLsE0GuhyPB0
	lv/BM3U31m/n12u2c2jq6hXFwqAEMwcq2DER41jIYgrO/C/WCbhCJNI+CCNTr0cnuUaln0VVVp8
	RfgNxnbuo/rHu4QSowrfRIcXqGDZoteYSnKFGF22/UDIKoT7SIOULsSXyvGV4GWmU=
X-Received: by 2002:a17:902:ce0d:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2d0524723e0mr2815285ad.42.1785509959091;
        Fri, 31 Jul 2026 07:59:19 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb491sm6466105ad.42.2026.07.31.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:59:18 -0700 (PDT)
Date: Fri, 31 Jul 2026 20:29:16 +0530
From: shaikh kamaluddin <shaikhkamal2012@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: nuvoton,npcm750-clk: fix 'suppling'
 spelling
Message-ID: <amy4RBUdtE8tTU5q@acer-nitro-anv15-41>
References: <20260726060354.18755-1-shaikhkamal2012@gmail.com>
 <8de9061a-dea3-4bdf-8dff-ad8ed4acc200@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8de9061a-dea3-4bdf-8dff-ad8ed4acc200@kernel.org>

On Sun, Jul 26, 2026 at 01:26:49PM +0200, Krzysztof Kozlowski wrote:
> On 26/07/2026 08:03, shaikh.kamal wrote:
> > Fix spelling error reported by codespell: suppling -> supplying.
> > No functional change.
> > 
> > Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/nuvoton,npcm750-clk.yaml          | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> One patch for all bindings for such trivialities. This is just churn.
> 
> And wait for review to learn from feedback and do not repeat the same
> mistakes.
> 
> Name in SoB and From feels incomplete or as login...
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for the review, and apologies for the churn.

I have fixed my git configuration, so From and Signed-off-by now carry
my full name (Shaikh Kamaluddin).

On the granularity: understood, and I won't repeat it. A few of these
have already been applied by subsystem maintainers, so to avoid
duplicate work I plan to resend only the still-pending ones (iio, usb,
ipmi, clock, dma) as a single dt-bindings patch. Let me know if you'd
prefer them dropped instead.

Thanks,
Shaikh Kamaluddin
