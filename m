Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7319B1FA140;
	Wed, 18 Dec 2024 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734542435; cv=none; b=ojWwApN9Nbmbm8xn8wyNHjOdt8v2dPtrBCEkWWu1zbJ+lym57ifcylHtJzSgsttpsy7HfIPlxbWaNoQtxsADmJY/ZcQaakiSZz5W/D+Oa6PIkCpqiuk8whaf6/jBsBz1t5YgjEo59PE/NfhYtRQwI1Nr8XRcz8+n+Fnzo0mJBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734542435; c=relaxed/simple;
	bh=u64ri9BUtoAVKWgZ2O/l4jE81YYOleGfUXE9fDmZ+HY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI2RTYsaYc7U4fUeDO3ZiXWwIUBKrVNEPGS6YHeGEdzGo8CgfyS4o29bKlnt5v3NqiUAp5t3GFjW/ch/3t+o09/ftrxIYxTdCBGMaJeXBQ7wR0zhp6xeYa17eJjhqw+IO194GtzgfzHZa8mDleEuOIRrLrqpA8l6K2NsiczEDuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQfDvZOv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQfDvZOv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385de9f789cso5227238f8f.2;
        Wed, 18 Dec 2024 09:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734542432; x=1735147232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dNZjry+31dahnZzXUmoHA+3E2HLxqRTBFNkl2T4CcLc=;
        b=bQfDvZOvS21GEqQg5qVIgkxICAldpU6XDDpbCsPrq5gpceZVnRdYufGllzRgtT3rhf
         RSE3/dz1+GtJU2xXSZ4NOvmKXeJ6uH02P1GyMOeu707EJ3lHv9e5HXAvLIO72H9KYpX8
         261CG8RSYRUDwJjzZ0mAk6Igva1dOSAGpSXmBl9K/Os3uxvKQZYrLOkKkf/7R7AXCzcH
         3WjBOSOsyMiWtXTg/rgApvpjgYyrcht00WJyjyasmOQhueYdHs0QsEuoMG+I+0OjF8OX
         LczyUx3HsO4R0ySHZ7W+pUut6kG9IAvcTXcureMuRVNcnpFh++pjhGGPBJxqNzmIcE9N
         ICKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734542432; x=1735147232;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNZjry+31dahnZzXUmoHA+3E2HLxqRTBFNkl2T4CcLc=;
        b=GKgVAsFBx5/x83RdiVtNXMzWACVJ454ekEQo+FjsLMoCi5dg6eo/mtslsF+4yi4oPw
         qJYsBqU5VXJazdUreVf/L3d/vvjp1nX5sNmgKcu2rU/nx+nL4MuDiPBgpID2KfGXmRy9
         TQu3dPI8fc+Txcs8tMC4bI15qSjKk5sPkALU56UhBOlxEn5Xpm4jH4FKwq9R/i72NF1U
         u6MWUR5ELyYnn4MyVuluG+/S6Tu/H2yXIjgLX9DsdJrA6csCZL17mLH0pUXyE5qMOPd1
         UEFU++u3BBi3jb6X+eqwXoHOLAaKhBU86rhgCHu4N9rhfGY/tKhjUpShMHeV0y7mmLYy
         xx6g==
X-Forwarded-Encrypted: i=1; AJvYcCUoJKysWFVyF6UC5ApTEF+swVtUtwhJdEg9ogSPnGaWBuH8WVKFQF1suPeo0Cb6hoGEF2lBhdzgorvXCoda@vger.kernel.org, AJvYcCVBjcetOvecQycnVgbu8iqjf8vbiTtSRz3FL8NPvoQZ0y6w51r//5y7tuXDDX17Zybqm3/qTxr6w6B0@vger.kernel.org, AJvYcCXi2J3cnUzPiWHkVIiQryWRZpNdUhCWcJrwc0yJ6TkjAQ3M+Jx2a+TJIz0EVHDrDHtPnATv2no5vpNM@vger.kernel.org
X-Gm-Message-State: AOJu0YxcUaPx4j7zcgHgYGF5OHWyisG90sf+A9wrBxx7tKEkMlWiToGx
	o0SlG03uKQMICrLHAooMbYr7CvKVqtnzXcDaxnQm7UucSt/vGsX5yWBFfA==
X-Gm-Gg: ASbGncvm8MUUhXYHZ2AhrQrV8OBppUUbD/LU+MpYwZ0Ue5rFWRk9HiAeRH4n180WdUv
	y3bqJ9lNZHfZE4Hzzei+sTloUpPGCILrU6Lft8WOprDuxzVcyCJhz1R1IBkUzi5m74MZIomXY6T
	nlv72skHd2y0G4ujSELcy4o4dBvBRLtE0ksHcLGZzYLmIQPWajmMhODH6z8uGEXbPSZeUfgZ+pz
	qNC50FBfM/LPv9i9Ti+OvT37caMf2nzo7oe2n6P+APU+i9+HUaoA7NeOl64VkNqjxbbR7leufOv
	D0wSLR//AI5ac9dKotars2X2No7cQg==
X-Google-Smtp-Source: AGHT+IGhysTjlK20RkM1q7wx5cRtQSC6Q2lOfBlUQcyJvdaEtRc23lCcglEoeKNkFiVqnC2MMCY6MQ==
X-Received: by 2002:a05:6000:186d:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-388e4c94106mr4011559f8f.0.1734542431450;
        Wed, 18 Dec 2024 09:20:31 -0800 (PST)
Received: from Ansuel-XPS. (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c806086dsm14456796f8f.91.2024.12.18.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 09:20:31 -0800 (PST)
Message-ID: <6763045f.df0a0220.10df6b.5428@mx.google.com>
X-Google-Original-Message-ID: <Z2MEW2wvgiNA1rJw@Ansuel-XPS.>
Date: Wed, 18 Dec 2024 18:20:27 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add ID for eMMC for EN7581
References: <20241218091153.30088-1-ansuelsmth@gmail.com>
 <20241218-shimmer-defog-97f86d6ebe98@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218-shimmer-defog-97f86d6ebe98@spud>

On Wed, Dec 18, 2024 at 05:04:03PM +0000, Conor Dooley wrote:
> On Wed, Dec 18, 2024 at 10:11:33AM +0100, Christian Marangi wrote:
> > Add ID for eMMC for EN7581. This is to control clock selection of eMMC
> > between 200MHz and 150MHz.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Changes v2:
> > - Drop additional define for EN7581_NUM_CLOCKS
> > 
> >  include/dt-bindings/clock/en7523-clk.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
> > index 717d23a5e5ae..c4f8a161b981 100644
> > --- a/include/dt-bindings/clock/en7523-clk.h
> > +++ b/include/dt-bindings/clock/en7523-clk.h
> > @@ -12,6 +12,8 @@
> >  #define EN7523_CLK_CRYPTO	6
> >  #define EN7523_CLK_PCIE		7
> >  
> 
> Why the gap?
>

It's only present in en7523 so maybe it's a good idea to have the gap to
make that more clear?

> > +#define EN7581_CLK_EMMC		8
> > +
> >  #define EN7523_NUM_CLOCKS	8
> 
> Can you delete this please? Your changelog appears to suggest you did,
> but I see it still.

Yes sure didn't want to change this too much to cause regression
downstream if anyone was using it. Will drop in a dedicated patch when I
will post v3 tomorrow.

-- 
	Ansuel
