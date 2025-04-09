Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB4F253F0D
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187002; cv=none; b=Cyxn6B7U/mdwIMOpqmYL4SP+ZVhEe7D4TIOWCbVvWgj4y1+Zco47iiHwbY6DHuxK/0Gzvk4NntW4LMizuDt/efiU3dzzLX1uO4/g/wm9NoA5IQdce/QQgzMmdMixtTy2gNwZ3hBziOmONFUeRsoO5GGLz54eH1B+I9KGIZkFWgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187002; c=relaxed/simple;
	bh=BC22B58ebf6orl7qqDiyHa7iwd/DmKy9U31GLWFWWvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMaoXOzc3faKErpE+pgIdQxlBSkko6uG8VHMcBgURcAVxi+UoRwJBdBQi5pG/rj1eJADzYRrr3gY0FHQ+ukHOgPiQdJvO6Rd2XMyR2tEK0MZeK5tVEWUDpkaxYho6zVIDDxRpnwasERvVsTXR22WX7JCMhdGqa8dvQFvrYogoYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kf++T9IY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kf++T9IY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so5708857b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744187000; x=1744791800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8Uxcp65AEN2lXG7OunlJf+FIxnQApjkFfx8Dt72lEU=;
        b=Kf++T9IYB1narSlux9I8VwS55DtKxov/GEKO+sXLP8bb9yKWWkLkXcev+rsxcxh/PD
         OmvrZG+grNaJNz1mpXWKtNVA2/Ox1iCefG58TkuYY77Tujn2qRtsjCaQxpow0ZkHcT66
         TU93FxhtGEkWvbW/ZUrZkXkRDAr23LCgCemiu613OsOoxGE13G6zCXniwYFirFhcbMX4
         +DYZKJFkrqMDYED9L8j3p6NJdoQ59eo+X1buY4ZJh7A8mRVDqHtLLUK44wLvxJE19KOI
         Aab44NkvxTg8BCwGfsyQrcGMcqZUmEoTLm8+TkccvpoOLnTnXWOfwsf5arx0AB2gFlL5
         VC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187000; x=1744791800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8Uxcp65AEN2lXG7OunlJf+FIxnQApjkFfx8Dt72lEU=;
        b=LFCWH500J+cYH396yrPeiaR/r15OAo1Gtohbs9syf0BNo8x95/qk8XykoXxU0SlzB+
         MMALQ60hF/V7/6RS1jlDOSzlgGYhNNKJEP/PX33+oyaaWHBB1aem3RAtL0Z+C/zUoQdH
         d6tNHYlUfrsphOJdVwYqSIowDAoCTRe4a1K/f0SKaGfN5cOYApzbuIV1XuGPG9lCw5BC
         lpaJ6fFvnR9IpBkSOVxlZk8ISNrCsEnbKGmfJtYxQg2LRJ6NReTtiwmbSvPcolfkgsjo
         x9oOJkMRmc58xIPaVy13DlHX24jUtYk+YmHXE/ylklIcdGcYf+qMwPdMWBAC1aqKKmdz
         V5kg==
X-Forwarded-Encrypted: i=1; AJvYcCXEeHcKtydFMyTXtfq3Lp5eUlEzWBvDpYfP+o3K78xDMfZNe2FSTrljm7VcJMw3bY9ueevj9P+9NxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygfvROrWDhZ32FI8ttcDcPBQ3k6KDoV9NKhiJzKS0msMt1AMWf
	2Pn/d09RMCeE/0cjQkakZ6Tbbf2UJNJ85+48aycpJvbmiSELIVa5JYEhp8KLlV0=
X-Gm-Gg: ASbGncuoaqI4cWQQx0HjAB/dAajP1db2AENzzMW28aEnHlCub+6YQ6NXUmGx23BA6Sx
	0P+Zo6F2IvJx3dFtjEgmCYWhrwdG/gMD31LAkj2VYuvUSISyoqyipd1Ra65JcHVz4XKrznUjOXP
	QnZxHmXp7Fx7gFSdwqMg5fFMDt28nKk7dOnbnzsRraGAssY/HgtqLutl2vlhPFiCuETEGxujmrR
	8lr9J3598W2r1ls7K4yqjnd9UELGMEHKyRsS0Qnwy2Drxz6COw1emrFKBZM+aXsHqbwJVzpi9QA
	jrVQNRb6O7tADhAFd8LFTae8HW1lSptB4zfXhW6689+EAVCs+6u+lgxSBH1+Mv/sBDD+WLs0JES
	0
X-Google-Smtp-Source: AGHT+IELAFHnf6NcURJ7YwZpI3uONM/cHB108XuMeGlHH0Z4VyN7IgVNBUS39Fs8l1da/2JGxOqo6w==
X-Received: by 2002:a05:6a00:10d2:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-73bae5512d5mr2408875b3a.22.1744187000327;
        Wed, 09 Apr 2025 01:23:20 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d464c9sm739894b3a.58.2025.04.09.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:23:19 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:23:17 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/YudZ0c2SBA+NMD@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
 <20250404-tangible-reindeer-of-penetration-ae9ca3@shite>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404-tangible-reindeer-of-penetration-ae9ca3@shite>

On Fri, Apr 04, 2025 at 12:46:28PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Apr 03, 2025 at 06:44:58PM GMT, Sukrut Bellary wrote:
> > +maintainers:
> > +  - Tero Kristo <kristo@kernel.org>
> > +  - Sukrut Bellary <sbellary@baylibre.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Thanks for the review.
I will fix this.

> > +  Every clock on TI SoC belongs to one clockdomain. For specific clocks, the
> > +  parent clockdomain has to be controlled when the clock is enabled/disabled.
> > +  This binding doesn't define a new clock binding type, it is used to group
> > +  the existing clock nodes under hardware hierarchy.
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,clockdomain
> > +
> > +  clocks:
> > +    description:
> > +      Clocks within this domain
> 
> Missing constraints.

I will add it.

> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    l3init_clkdm: l3init_clkdm {
> 
> Follow DTS coding style. Also drop unused label.
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Sure, will fix this.

> > +        compatible = "ti,clockdomain";
> > +        clocks = <&dpll_usb_ck>;
> > +    };
> > -- 
> > 2.34.1
> > 
