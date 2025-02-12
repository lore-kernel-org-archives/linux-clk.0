Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A3620E715;
	Wed, 12 Feb 2025 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381470; cv=none; b=VcLHdFuVQIyU+ewguO3B36Enfdx5rWZtGZCbhLokGZg+JrHKqOVs8XUJzh5NH4zex+Y3Dyj4NdhUMXMI+5U9BFBpg+ZDLCxxGYDTIHcpXZcEopmsJTDu+weXHVRMzslTICIhFxHQRkTaDh0N1GMzgJWEYbTwMO109yK/KuYLPzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381470; c=relaxed/simple;
	bh=cCDE0/i6i24oZI4BzPX7w4nr9GHEOVo4Q2qZZ8UMW9Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyGO1cyNA/LyjMcFms92sgMBsLMS+O+ikE6uSATtTjh8cGLDYKmamYpvo6JvwL/fJ96f0PMOWCABD3+Eo8y7znq/XrR8OLcExbpKTVm8AIi5Z38pbdQkvNrn+kbkYyO0Rz5Q5P37mhh/NKdaKLB+BaGo0ohMoZFqant4JlCVc+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzxLYSuZ; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzxLYSuZ"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5fc7d346980so1188869eaf.1;
        Wed, 12 Feb 2025 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381467; x=1739986267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
        b=lzxLYSuZWTQkp5264mp43CsfApB5arG7Lfy+1QtKCfIzjYbP7g8Qg+C23GDpWTihKp
         489jGttHibD09tWSKQuSULONg3xwTlfBL/y4M0TsHgs5cbAomHgCnkMtn+STz7Curr53
         iEaUar5aV3PcpwaZFhLMc1YLkLg1A3zpR8NyzLndPmxxE9XyDpjzOOI/TEUE+5z3nR2O
         G4NA5qZjn/5ZvrSTT9SS012qlRCr5thieoCR7WOjqy9mWdVV/cs19XDaYk8hzqxGbpHE
         j+wSwx7q4NSqG4ttjkyyVplT8Pli6fVL+yfL6Q/qnRlbM3Ze8pE1/rzV4++j+OoBIjeU
         5+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381467; x=1739986267;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jbx6FcfP3bq2n5NRhn4rgJREW3IAUmWBAJQw6Shyrdg=;
        b=nZ4vNjFLwjsa2C3iGRjY1MW+ZkV9DHgyJmGhKk2pC6KCQ1bC3OgaAtfK5hRDFbxOYf
         WkdaUELqCjgYHHuYHjuWX0NkT4rkHwmAhTsQIQnlvpg2RORFpgqG9rZZw280K9aA+H91
         fNf2pJbrh1nOB/Y2qFnjROlKNx/RdvXcelKKav8/Vx2IQBg+95w0s4k24NQsRpDr832m
         FlmyyhP/DJX4z1o6voVYTTpOhSfTGf7VeCIePtWnRdxFqs4YB3RphhlUBxLKVQ6+CgFu
         M9QDJb4qwfrCtaJ92Z8zwjT3ycQglUZLviZIeVTxykMEQHm1HJM1X+KSO9arthI2c/2C
         uZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCVZPwaIWFfkoTOEomAbm1n73la2kAHCvHUwP45ETndA1TViwdo2g467l+e7X04hrlrfRgitULuNbh6R@vger.kernel.org, AJvYcCWRvFk7Ib9o1tPaL9Kq6u7rT3vYh0QL7V4WnxGNtvC/R30KNkB5THMa8CHqJxHhUMRIcgy4WMa4wWAF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywif0oUsN8xm1n4hW5lGrQhj3Iu2+RPBRK6w7bWVprH/vbmlHtC
	GL+Eyfi3XpPkWnIfgWVlrOxtsIEVrrK+rAzdh71Okc1VOWL4SwWy
X-Gm-Gg: ASbGncuSgW2rZCaf+d9Ptw1q4sSQflZC1SrcE6w70bcRNnCJ7+fk6bSxDXmDfuqmj6V
	1LaOYNmBnnfPhB6Zf/UOCe6vRO5H1mzAMudOGb6glmHJUNTOw9JKh6BrV+LoHU1LjuxWWlUs0vY
	Q1s31fOMWlev3E/9TzvY7sMoh8dkSHJa+Ne0umCon5+gXr5OsXnZtMJ2cC6okfObmTgpOIzj7Ay
	iXM3yow6H/PMiF9iKyyv+2iTcmQj+xImJPvQn/ssikNza/1ABoTnnU9NNpOF4FRDF6dhtTFt7hY
	ht9hQt59ybCTjWzl8WgXjQ==
X-Google-Smtp-Source: AGHT+IEfXVxl7VC/O2TXG5AUw40jRF/jqb2tNJhJqtHmv0DAX3h4yayluWuzrQzPBPHKrw7ZeZKhgw==
X-Received: by 2002:a05:6820:54b:b0:5fa:61b9:3e7e with SMTP id 006d021491bc7-5fca183ea60mr2464323eaf.3.1739381467421;
        Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc8fdcbc21sm2233640eaf.37.2025.02.12.09.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:31:07 -0800 (PST)
Message-ID: <67acdadb.050a0220.28f58d.f522@mx.google.com>
X-Google-Original-Message-ID: <Z6za2bhKAmHvUMFR@neuromancer.>
Date: Wed, 12 Feb 2025 11:31:05 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-22-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-22-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:53PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad2..c37eb8ae1b8ee 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,6 +24,7 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
>      maxItems: 1

-    maxItems: 1
+    minItems: 1
+    maxItems: 3

> -- 
> 2.46.1
> 

Also need to add constraints to set maxItems to 3 only for the h616-de33

+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+

Thank you,
Chris
