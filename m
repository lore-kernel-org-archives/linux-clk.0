Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983A11F8F04;
	Mon, 13 Jan 2025 22:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806677; cv=none; b=Syg9Yp8qy0icqlynNc9CZy76wX1f5uCzLoNuqZSOb0oTZ0IdIjsnbhU9EHfyuCZZNsg27DoiKLFG9yUOs+WuDkUkZT6dkIeXsZp+7kEqFbQNxZLTB159hMoDE+6Lzn07b34/bZDTn00doH8qenGDe5Ri0fOOECTnEnEjiEzJk1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806677; c=relaxed/simple;
	bh=UvyVY05mHSVpV8yciLy0ZY7MfgYQlDKDEi7obPQEjfU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHGeL8qrDSdG8HrfroFD/O4Q3n9DErlEdK9IlIoooLD3S59Srf4d8jw0e7Fg/HLXp+LrWbm2+UjcbnsFBHQ15RURgAbBdTEgHhv9ly6Y7EjWOJzv++rQ4DzFNQP4MzCXq6ZAQiv4a3/9iqrnVEeQhaS2tl0Km2YaNTDsUg+9f18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpD4ExA/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpD4ExA/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso35895315e9.0;
        Mon, 13 Jan 2025 14:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736806674; x=1737411474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TbJtoBjEHq/0nIQMxjla2H9E21V/iCC+q5Cg+OcmA0k=;
        b=ZpD4ExA/cs5uUw7qUoxuX5wt9re7/5nphbVRgtknVgxm9ye/7UAxW4XySQe+tzmS6k
         jxWCv7J5kBYacJD2VCyLy8tI5E/s0qMzRoqCamCM0F4w3MhMUT9786ACBn3NYPImQxXp
         CKd6D7GgTO/hrsHoo/k/JGef+xckEb4yGzlyux1SdXBAKwiKur0rW75vyigQdveMI61y
         5BKRtklUS+nkKFCSlU2hfqg5DTUO+oFgeJOKr1JG2Cxxkb3Vvs+s7L33HKSQVyHbGMmk
         V0qqjV0SYjD1y3c8v2motBgN1xz20btu1VHA4K5ut68Vo/qNIuanfNCkqqw0Z9YVMg0M
         iVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736806674; x=1737411474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TbJtoBjEHq/0nIQMxjla2H9E21V/iCC+q5Cg+OcmA0k=;
        b=GmIboEx/qpJwuUc3yndiSguVuF+0RwBbiGHy5SH2etA7npia7yM2ehXtRufwqf15um
         B9mQ5xzap3/REs53mwmjr+4q5oK/3TgZpnVJKynYOOOYyiN33f+fYWau1/VpKg7Vgw0N
         A/Fi6kaNvq5tcarnxIWq73VH/PuthL+lOoNUpEe5yobhhTXIi7yW3ncoAsilX3N3Epa/
         kHQ7+wWjS3tsrnwkjrMV6jxxiKhFW2qNCgurd3dr0ZA2z+AbBrPsCrBXxu71p061EBuj
         FYlh95/hbedD0JFiIhJgmUhgDmAKEGh50ntl5Q6VXIWe2rw5Sf6MQ6XU/Oe+wDHLkvl3
         qBWg==
X-Forwarded-Encrypted: i=1; AJvYcCVqKzGzVHycdkzOAynxSzyZiUI/TceEiq7pgAbyNkfyszWmro5rboWpVIOWlllvoZBhF5Ge4Ak12uoF@vger.kernel.org, AJvYcCWA+XZQCrgPe1MFrCP5l8IyfhcbvFmg9qwOgMyYCqkV4oJEhDsnyYc6U+SJ1GiPbwLEZ/KuleYkYqkt@vger.kernel.org, AJvYcCXr1/iFasuKH5wBVgzPtWyLmPtYyQKJ307rWYucFXP9Wm5qNEOJhSfS2DkoDsEl+ZxozWKXMcHav2l4//hT@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEMpUhl2vNJfD8J+GQKK6fkp/ciIHXNHK/wHUA6ONZJLzGQNq
	U2HjSC4fQNPFxtKBu5ZNX+73IMBylOCipsc0Ljozi0TGtfvvM/a5
X-Gm-Gg: ASbGncsVsw93mRvXVbc5ZziYqCxGaJRpNY0gvYGKRCWNXZoxlITgcFp1byW20G+VEgf
	zxRtN9SNN/lE7poAVPvzqcbdfKQgZVSVnnDu9+TsG4lCuEZxZrx20jp2fXtMb6IOIXkVcBEBvAn
	BrO1dlweRJYxBAnM8yrsUY2VpIHWyndV9r0vZz8Pgwzxsu0kk63Fi7DxugL+7pvpIXhFjnD2d6t
	UzMPbO+XP6sr9sZbwQ4tQvzgajt6ZmKB1rF21bJj6BbPoyiq4H55H5iw8m0cbWF1K0X7d2he8R8
	EdkXPyEXRcTl
X-Google-Smtp-Source: AGHT+IGEPvIKNtpfXaaOicSCr94OYhVM3CnJFW9kQZBpZSOsO2wrq/Q9L7aPkf1IFrKvY3DSxwy41g==
X-Received: by 2002:a05:6000:2a9:b0:385:e90a:b7de with SMTP id ffacd0b85a97d-38a8b0c79edmr15240417f8f.5.1736806673776;
        Mon, 13 Jan 2025 14:17:53 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c3428sm12895863f8f.87.2025.01.13.14.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 14:17:53 -0800 (PST)
Message-ID: <67859111.df0a0220.a316d.bad1@mx.google.com>
X-Google-Original-Message-ID: <Z4WRDWHqjzEnbxeP@Ansuel-XPS.>
Date: Mon, 13 Jan 2025 23:17:49 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for
 EN7581
References: <20250112133953.10404-1-ansuelsmth@gmail.com>
 <20250112133953.10404-2-ansuelsmth@gmail.com>
 <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org>
 <678587b6.050a0220.32320f.317d@mx.google.com>
 <3b60a7a7775b6bae58d231a52bd9ef10.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b60a7a7775b6bae58d231a52bd9ef10.sboyd@kernel.org>

On Mon, Jan 13, 2025 at 01:53:46PM -0800, Stephen Boyd wrote:
> Quoting Christian Marangi (2025-01-13 13:37:56)
> > On Mon, Jan 13, 2025 at 01:33:35PM -0800, Stephen Boyd wrote:
> > > Subject says EN7581....
> > > 
> > > Quoting Christian Marangi (2025-01-12 05:39:38)
> > > > Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> > > > should not be placed here. Value is derived internally in the user
> > > > driver.
> > > > 
> > > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > > ---
> > > > Changes v5:
> > > > - Add ack tag
> > > > Changes v4:
> > > > - Move to patch 2 (improves bisectability)
> > > > Changes v3:
> > > > - Add this patch
> > > > 
> > > >  include/dt-bindings/clock/en7523-clk.h | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > > 
> > > > diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
> > > > index 717d23a5e5ae..28e56745ccff 100644
> > > > --- a/include/dt-bindings/clock/en7523-clk.h
> > > > +++ b/include/dt-bindings/clock/en7523-clk.h
> > > > @@ -12,6 +12,4 @@
> > > >  #define EN7523_CLK_CRYPTO      6
> > > >  #define EN7523_CLK_PCIE                7
> > > >  
> > > > -#define EN7523_NUM_CLOCKS      8
> > > 
> > > But this is EN7523
> > > 
> > > drivers/clk/clk-en7523.c:539:25: error: ‘EN7523_NUM_CLOCKS’ undeclared (first use in this function)
> > >   539 |         clk_data->num = EN7523_NUM_CLOCKS;
> > >       |                         ^~~~~~~~~~~~~~~~~
> > 
> > Hi Stephen,
> > 
> > the same define is used for both EN7523 and EN7581, do you want me to resubmit with a
> > better description?
> > 
> > Both clock are updated so no regression.
> > 
> 
> Please resubmit the entire patchset. It doesn't compile.

Hope I don't get annoying and sorry for this extra mail.

I can't repro the compile error, it seems patch 1 of this series wasn't
applied and changes were tested only with patch 2?

Patch 2 depends on patch 1 as we drop the define.

-- 
	Ansuel
