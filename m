Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127B20371E
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744307415; cv=none; b=VqWHMJzvSAZZtZn5DVBqZFMeNZTU62Icr5fFVhj3KYClak+ACAs5GetiK6m0TVUt8fGhJw1tcJiQAjz+96g9ssf+9Q1R9K5LZMfq2KgP3Pa0cxKNt3re2+ytRzD3BASoihHa2zF3nnSe9xDQPzmAbOMQDwoRBoNJ1dkZ7BLUS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744307415; c=relaxed/simple;
	bh=lY9Y1px5P/T0puiH7BaGtKHUBDN6WoqTLWKxNXRuM/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z14UGS6y8Czjw9JfkZT3wd9+mucMoYWngzYyh3j4F0wkWa8KhjlHBIoUb/bAeKoPKF1DZEsk8Vb7PKePKB02q978rxSFSb/xiyenbKrH3PcRU0cjvYDKbh6rV/rcvR3Oc3oEhCxwTXUdMZzlAzAZK/SIpruwWp7MEqt3iq+VEFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kkphNOJk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kkphNOJk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b45cso16168215ad.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744307412; x=1744912212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFvKBztlvaO+hpuywxVFq1Ch6C+gHqQXzW5kBxcM2OQ=;
        b=kkphNOJkIM3PK9y5ytq7EZKAjnuuZlCqbwdk9/HDnmyvn09DKUPpQcmUxPDMxEUQGN
         VBmZm0I30wEfuWj+teFbNQgf4XaHVXBUykXacx5l3/YJYeQtmxRRt3sMS4j5pgbfBh/1
         yKsOFqyv1Ga5xG0tfvDT85l9/3kVavlgL2zz0iigz+ZrD7bux/MuOGzsBuXl2RH1yE7g
         6T193yNm7ynjZUvPVu4N4lJxKHRV4PdA4ULKjpuEfNyTP8Uhu12jOAL/Uis0F64FaAvr
         t2tPCn/cZlGXtIPX3wGiYNYdpShZ2jMxfoc24CIX7264OCIjXu5KqIdOHsKbxNujCDmI
         GI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307412; x=1744912212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFvKBztlvaO+hpuywxVFq1Ch6C+gHqQXzW5kBxcM2OQ=;
        b=GQULYYaQtmS9iL1T23xYTyZqobS2QG6kiS5wSQYHfP+ViE4VtSiaMiAF9s4Kpa2vAZ
         itlq49uKsoe/OBt8x9F5IzQ2bWNGJHXSSZHSkgJHcH3GnuUgtgQQYUVwFPFel7XeXovL
         +s25hveE1wdF8zIJoiwu7oh6nQ0ZD/bGpUO0R4TebmDr98UYV9Rep6XgL9wqeBBZEMSY
         2BeNRnBA9ddtxzMBCfEfvbtZ/nqKl6wcHD8MjdHVx1bwdAcsZkSJ1CNanZ73BWtSNiOY
         9dRnlHS/HxZfkosdbumGkZBzl6nxha4s8DW+u5Z5LM0ZDoX5GR10S6CGlXekubEamfQS
         Ig8w==
X-Forwarded-Encrypted: i=1; AJvYcCXr8pmUTZo2R16+9iZHwCDoU6oD2BysU4kAL+GgRUA89435V6+GA2/UnLlXY9KEUo2mTDnbjPEOxvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHW43t8oeoXGLiBX5DMijIA+1CJqUEtsNbRZKwZT01vF6TGm+9
	KP2ZswTiCSzYBiwcgqFR8v5zwtAgxI7F5AEhQVCTl2+IkiVoJnr4FBwkgv1vlgzp3OH9AdP8ONn
	/
X-Gm-Gg: ASbGnctC4s+hRh8ZiZLUrBxavCc+Xi/9Al8F4mvy61Vt7EXBLJQWT8i+ZLFPuDndgMD
	YuVdPu+KKxiTCue14grapLe8/gjqoI/UfDWsk9mkR6x+INyEWxvv6OnCttqqK/BK2rW9SFjOapQ
	OyBt/O7HAJ6uZp0SDSsPzyX9ZH1LwJCdqtG7KR1fPG2FZPVHQcwtj/jnrM0wcNErz54eM1vdu8R
	q3C4qd9m0ZTIQbCmrGAHxvgFeMUcvGK97skPCZYpdO1NCWJhr3apGgH0kEj4mKIb1uyHCeRhzip
	zL7TLbJwQfuWwvecZQsiWdm+L89SLLQPSoe9t0pMRW5rSXXtdoPy9pmUUITct1Ku2NjMddCwLKx
	F/LWGlP8NUgc=
X-Google-Smtp-Source: AGHT+IFQfLjl5b/4pxjR0AKJRtL4njnVrLI7qc5hXSk6wBYhGK6iLJeFS3Z7hjVwQHKFbPW7UQz95Q==
X-Received: by 2002:a17:902:d50e:b0:223:517a:d2e2 with SMTP id d9443c01a7336-22b42c6e367mr57462235ad.53.1744307411718;
        Thu, 10 Apr 2025 10:50:11 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8bce5sm33652735ad.90.2025.04.10.10.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:50:11 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:49:56 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <Z/gExA95AnQzxYmt@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
 <20250409111002.5b88a127@akair>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111002.5b88a127@akair>

On Wed, Apr 09, 2025 at 11:10:02AM +0200, Andreas Kemnade wrote:
> Am Thu,  3 Apr 2025 18:44:58 -0700
> schrieb Sukrut Bellary <sbellary@baylibre.com>:
> 
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
> 
> I am wondering whether this should just be part of a converted version
> of Documentation/devicetree/bindings/arm/omap/prcm.txt. I doubt there
> is any other usage for this compatible.
> 

Yes, OK. So, do you want to take this with prcm conversion? If so, I will
drop this from v2

> Regards,
> Andreas
> 
