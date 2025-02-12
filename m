Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2832580C8;
	Wed, 12 Feb 2025 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381252; cv=none; b=GC1qdARFY0F0U3uRyGLk37VIXe3vnzcqqQiWJ3yf9nTeGMPyOl4YL7BD84zncazuQ3V1YKaPiJxhi3MpXJp4aSUo4UuhrPHPamq20KQxiYa1bX/vrd2O3X9lEV7hSwmTmbchjP1JKAU7sZv5Z17/daV6bY6I54ekR4ViPHfkJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381252; c=relaxed/simple;
	bh=Tt+QV07QmML3nEGkXeeRLDtH8eKqEEk75s9TnV7KQ/g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEbBwpBRWWh+P73qMlbgoykdUOZbKJ83XyZeoB5MSXiOigJsEw0t0RGNOz17mbZrsjS7Kjvk2HKhlovayrIeY86QiPcTRJn4hycJTPoCyG4BrIZ1rK80vOeLrulUOZvOHJn6yS6enz8OK6h6+4EBNVOn3mXAFffM/9H1o12FJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuCQ2H7m; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuCQ2H7m"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-726819aa3fcso4163594a34.0;
        Wed, 12 Feb 2025 09:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381250; x=1739986050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
        b=PuCQ2H7mSavCNgSumQLBBUocCekmxbFb6alYrTSrF6OPDcYOZsmU2MB5yn2204cXSM
         VXOAMpaA95dLAIMZqsKbAk/q2SYZgrWMwkDTSyMc6PSkaKwVGvvyMnw50PNncE5Pm5Kl
         tJiCO26nzbXB/mmIs2NPTbIRsaOQcaSSfaUUkHQZBmZHPYo0dMP8AOT6cb/wD8QjzuLf
         JHSJc5eW6wkmLK+p/EzIktQBfX5D/ifhh4di96qWIBlU00iiC5r1T1hf8ppXlewH/fN/
         07xKwKl6p8K4SOCTKEM2qjR168v2fa+R+0yD8xnJGXE8/bddUJ0TeOsdchVcjocBFXlS
         /Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381250; x=1739986050;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
        b=Z52yn0pxAZpSyhhUzuL2gxo8k1tuUYK72SP1lEw4BJmXZP97mCus31dq+unTymL3fs
         ONEDPPNhdsyMF3cIFHleV4c21EHfexnkd9dXuF5d4UPgFC2qAKeVqguVYHVURhlFsp5n
         4scg2Y5Kx9FY/r9Ppzdv1os10e3K/D1toL2nnW7UOd5e+CVu0L5NQwXMvHlxvqWRSaYV
         YGoQT84SZzlH27PR3sArgtnbg1K+uCMJL1XRWDAgvslx4fRVNMRQmByUvzY4YAjrufnV
         PTFUutItNLrYZVgLsy3mM3mgJwu9e05ZWr+irY8M4zc/zU0vBt4kY+D5pdAEuXm8rSrW
         lMvg==
X-Forwarded-Encrypted: i=1; AJvYcCWROYTD3QEn8DBZeyoLIF4bcwbVzjXAzwbIcl0LV1BQRkOeRZJNUDBzYfl3oxDqgGYJU3UdJWRn2lva@vger.kernel.org, AJvYcCX8kio+gjkdFP8PU71Wi1IzSCFp4Rm6VyfOp58GM91bPkluC2bYOxG2T36D+Xc/fzh0pb1laYu1tEZR@vger.kernel.org
X-Gm-Message-State: AOJu0Yztrkdvt48oJ+ohpR5wJirJE0fxrDBenJXcb8jS5/JbYl/iysIW
	9hGw7ZoL9dzQXME5FsKEl5wls1tNBWpg2pj87yYi7vEhNJlixdyN
X-Gm-Gg: ASbGncsL8tAIjgDkXYl1kllQxd9PxYanhiZFC96l4LzxVdzIiPPNHL5TL0EBSb6Ngar
	ATVRNr48CPKhbI7HvLZqufr2lhsv4+7miywJGYEJh6MFLFshNa7d2a2BzfL5YoLL3DWcU3obr+s
	xGKMLiX1+11OOz70x9sKeUskXGhgIMeOI3Qp6dYacHl9bVrZeIz2UmFJsNUTRnq+gPqDw8fPUqN
	bE3baEm6ugOPj/Aho5W3sV3t0kW4PYUFqqAiz/tPW9JW0JwOumU/Qx9Ck8Bs3fEgm4+woZfqTRI
	jZKDaqm7BQOUJKjKH/PQbw==
X-Google-Smtp-Source: AGHT+IHQ+r/B4g2h4U+MDj6Kx5Km7Y0OHx/D1NpwgCExrt743LdxVlv3VXUZQzCcXj0qf+dKJIpoeg==
X-Received: by 2002:a05:6830:4107:b0:726:eff2:9b57 with SMTP id 46e09a7af769-726f1ca8939mr2600982a34.13.1739381249618;
        Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af932f78sm4722036a34.18.2025.02.12.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Message-ID: <67acda01.9d0a0220.22ffaa.f02a@mx.google.com>
X-Google-Original-Message-ID: <Z6zZ_2u-MrZUZnKF@neuromancer.>
Date: Wed, 12 Feb 2025 11:27:27 -0600
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
Subject: Re: [PATCH v5 19/26] dt-bindings: allwinner: add H616 DE33 bus
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-20-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-20-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -- 
> 2.46.1
> 

Because the h616 uses additional reg values, we need to change
      reg:
         maxItems: 1

To
      reg:
        minItems: 1
        maxItems: 3

Thank you,
Chris
