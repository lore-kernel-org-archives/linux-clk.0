Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD81324DFFF
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187764; cv=none; b=OfoqpCs9b3apWHaw/OxDGbyyVaptN2D3eviDTGyAXcNtX9EHr6jJEVDtDYpGnKbBB0w0IdyxMaKoiG9fH8g07Pl0xiSJ8hvDKDFdyoVeTS+VxKiaF2JUpotmMpJzh9KbElFK4aRgn0D6yE+CaHbu3PpypHovnplQCNhUh+5J2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187764; c=relaxed/simple;
	bh=Gj6WtNoFSpFYRXUN9kESBueSyd6F3Fb+6o3j9M5Kdvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AN4tpO5TFLF/uz6Vb9uZhJg0ZynXP0rl7MGpkYsCJPA13mO7Z52sM4JE0mivdtGNg1hE0ah+4hdvjWlysVn63x5eUutToNey3Vfu8DkPCt5ARI1L62ahV8zU6OUB3ktZRxJlXHpKiSD1qmQ4WtW3yGwoJAamrh9JVXZhgu9CmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rgGauYbU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rgGauYbU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so4395023a12.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744187761; x=1744792561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LtnsbI0xn/MWrJ60E74sl+r7UIlveALJ5mHP+oWEsOI=;
        b=rgGauYbUQZMlrNFoOVUcceBRiNyLo76d43Jnk4MVadMHfEFkwDell9DJydDlBXyFJ9
         ss2Sdbye9LTcdxn+vYA3UH+MMWU/Py37SGm6uCYvVoU/j0tLHUVYRiphFX6mmx57YU4S
         1LpcDVjZfEs05CzGD8W9Ocfii+bF75BgjJKasqiWROIIshfIit9nGiFaI1zrbsGDYS9Q
         5zQrNNQsjhBcpGxajyQhsRVVVdfUJD24WEhtgP9dYfuH352NxeM6QNl5feQ3jdpYCW/H
         rX7d0mKxWw1l4WqLWCfvmTmA2KfyVO/ns5+A//KEIM2HZIRZa3gUWdF0UQe46aCGZBBJ
         xVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187761; x=1744792561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtnsbI0xn/MWrJ60E74sl+r7UIlveALJ5mHP+oWEsOI=;
        b=HMoAvfJlyDrUQ4NhzM7mCmZ6iPrVceg4zIeL1PusMcN5O9Yz1E1XaPUPRbqwDEukWr
         cuwPRgnIvGpaH2EnV7cFzXphrFOq6mDxIodz4hUjo5QghSDiehHJGEx9KHWI2ZGm8v57
         tpGyfL6XWEUa433AzhGZJpvFoYyBqCBhRZ9WWXgHVXE9Hq9HiryZlTYOWIgWwFevc7QH
         gf2YxH6BBCt4y10/PPATD7LBbmgVJn2YbX4XTJBXg3HtfY0ISgsXg9ApqN0KJx/xD/Hx
         MqJtKLw4vxovNqQ74dEwnXX0nY830rQYbQlCgGMyG8GFFqzv9bJwz7FFG3wa9zhMsFFh
         4Phw==
X-Forwarded-Encrypted: i=1; AJvYcCVIDeE9dNpSqJhUkr9WEIj/yDO4zY81HYW///nnKeuvg60cJyZHKe6UMijlneEZ2/bIBArvD2p1f3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXVqSW/cxXkPuOGculQjMkc4omcGEv3ufU/nRloZ8FA/wYPzra
	rrkcfek/hX3jojR7JMKDPI/IJYFu1vmEYXqe9KCUbQs9epLB67Ou+VS/Kab9mAw=
X-Gm-Gg: ASbGnct3hD9wUGdcD0KiLQyziaRvsKzTHA0qO0OFbK9lcDG2BN1mYPaHkhLcIEOkrar
	9DDp364oDlQ4a/WClYFouChGm4w/pcePajGIsHYA4HuejkozVgLEk6+3EK+MoDM951Yv9FlpS0L
	BgvOSrNaEfT9fms5oyHU0on8eym/qSNSStPxvgK//toll9nNUKIaAeultU6Qd5tMIGA+fp9O0UX
	ZbwvC5K9wsT8VCsyhYV98yvBc8hvTEnf4Mcnj3MOxgFruz+xTSXe9wJ8wr9+NJASwC4U1y7EzIi
	WWdGzXplxY5W0fPYvwAb0A6V8mr6zUo2O8oVQw+UxSqO8DY+5xFiQWq2wzgoIfEMQdTqbAZS8Wn
	e
X-Google-Smtp-Source: AGHT+IFaM4ht/uWK6nf/t2wImg96pc3MqERrzfxlvHDfVyaU0p2YvxDUtwTqEg6xPRFUlfT51nXPQA==
X-Received: by 2002:a05:6a21:3982:b0:1f5:6d6f:28e with SMTP id adf61e73a8af0-201592e22cdmr3092745637.42.1744187761022;
        Wed, 09 Apr 2025 01:36:01 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a250sm574589a12.62.2025.04.09.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:36:00 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:35:57 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/YxbXZ6Wp6q6kNn@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
 <174377855887.1313159.8477749895324191477.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174377855887.1313159.8477749895324191477.robh@kernel.org>

On Fri, Apr 04, 2025 at 09:56:01AM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 03 Apr 2025 18:44:58 -0700, Sukrut Bellary wrote:
> > This binding doesn't define a new clock binding type,
> > it is used to group the existing clock nodes under the hardware hierarchy.
> > 
> > As this is not a provider clock, remove #clock-cells and
> > clock-output-names properties.
> > Though few clockdomain nodes in the dts use these properties,
> > we are not fixing dts here.
> > Clean up the example to meet the current standards.
> > 
> > Add the creator of the original binding as a maintainer.
> > 
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  .../bindings/clock/ti/clockdomain.txt         | 25 ------------
> >  .../bindings/clock/ti/ti,clockdomain.yaml     | 38 +++++++++++++++++++
> >  2 files changed, 38 insertions(+), 25 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
> Warning: Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
> Warning: Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
> Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt: Documentation/devicetree/bindings/clock/ti/autoidle.txt
> Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml: Documentation/devicetree/bindings/clock/ti/autoidle.txt
> Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
> Documentation/translations/ja_JP/process/submit-checklist.rst: Documentation/translations/ja_JP/SubmitChecklist
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250404014500.2789830-3-sbellary@baylibre.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

OK, thanks.
I will check and re-submit.

