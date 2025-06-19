Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F323C8BE
	for <linux-clk@vger.kernel.org>; Thu, 19 Jun 2025 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311355; cv=none; b=pdswhMp5kDl7QthCyn2TQVdnQZlYFq7NoJ5Zbp1ilzkfJ78WdRDShddbcVCuiJSdQ9EMjbqnA0Soz+FgR07C5QPnRoTajEeUwtJmT0Ln2vMiIGLZkNBCZTpKffmUxAYEwbBoVoh+RpBAjA5MkXhHVS2OfSP0cLbb6bZhc+Mi1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311355; c=relaxed/simple;
	bh=3T6kJuyoKBc2nft91aab5hLZW+0/3OZRvkSZlEz+xsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAJlivWJrOiIRxGNkQQgVsT/HMlE9EtLoMveXsO6f/e4VD9WEOz3vNzNZOatEutaXHmNo8bnlb5Kz4Sh/m9xf2NxQYjeqLXBxypEfAglfSxNA3h4woxt1ayiA5aKt+X03Q3CBbgxpUL/DnUb4pdSDIs+RrqPvr8AgzVp3yhhOv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbljeIXg; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbljeIXg"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so526484a12.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750311353; x=1750916153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=AbljeIXgWzc5HyaqF0LJ6zpYffGY9+wpulok//kNaTbZc6/TkJKAKfbrmMzw8rS/f+
         haPbdNy/VGgCmafJheFGqvyz7DxHbQxAi/+Ot3I76MYlZv2D48CHQBT+Av6dm7TbY1TE
         w9ZOnR8rxJkOnB3UidGtNObmm31bntqXMkp+2WZF9cqc8VdQrESEHPPM+O+7qegW1oED
         to7A9v6pZ8169cDLSIADe7i0rBCa8cjYXWYZDwMskHPiwYly6NhB4oPimrYJJRmI3rAW
         IJWFhjKFxKzLPibGNhMNTnH2uShn2AlAwSVeDEqQj/po+cpsEeC3VQfJ9R0YAWDegqah
         xD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311353; x=1750916153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=c4Bk6tM3PjhFI7slRLy6iQXrtGW/YYEMFWaxkkbxq6MhN8UOwMHWV67uBCkITe1UE7
         IJ4vApDNgDZw71vuazgiLwceBBBxeoN1j5/M1WQzFrHdPHqMu11PCdJHaCZCckzchroT
         56f4vxVzKTWqPnZoqkYGSYxn+haLzbC1Jdd91VKGmfZMy+naqE/OQbEc4VaIm1f7uYEL
         c6iU3tPiOUf6mur35si0k3RWHLsDC4hCZQoiY9cBpZjWqJRp4nsJKUSOOU+u8RtXcI3E
         lUnb50ehLTCpt5rdFj+sLvpLSm8ia88y1mCk+g8LkVHPjqHwC0NL/3GeV9Ra19C6lyFL
         tO7A==
X-Forwarded-Encrypted: i=1; AJvYcCVm+HVG28ZxZxqOwdgEJds0QPkar0wJ5YIw4W6Jpv5VWNb9CYKiZ0caNIDH1/kPtLq4oQER8T/JJko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6BfOCssvVe3UpQ3nn3yvPTpjSqi2c4dHz7NDm3uT+jioEG0q
	lLLj843JhSUlnW0iLPGvUqSq2rQc0rsmysdjtrnkt+sb6F+Xp65mR/ECDvf1uX2p+sw=
X-Gm-Gg: ASbGncvNk0Ak6uIkEeYe8ecEVP4iUjML/VCMPDweWGPCR0LjLN150RYXH5HZGgvv8nS
	sSn+os667OraOY1syyvU+wakrsAOUatBz0ol0/bahM0QQU3PcSeiCwaveL7UxDsu9pLuM/kNRys
	kRHaPKYNeF1M0NP8vsfnVcjngOi7/zozxwUqO7IxaxUnA+3ErrB8LEaIR0o0msT5+PVsWGOzWxl
	5AYGN3xX9AdLE8yPX+ANr7fZpBvP/pEykacFDSaDEXHxN8VzKSSa1g/tIZlApoJxA3QPjTuUx7C
	zBn4lVjGn9ikDuMEyGgZVTW2UPT2VqD+UiiHjPISvIz6EVvgpFnv9TnQitaIZxH0bm/Ix+O15w=
	=
X-Google-Smtp-Source: AGHT+IF1Brl2Ml/RhPp1ZISh/ybbgy1I/Aosv1oeoYbA3EE1IVQw9sjB8PhoTnTOzWYQtjW2ZHuZqQ==
X-Received: by 2002:a17:903:32c9:b0:235:a9b:21e7 with SMTP id d9443c01a7336-2366b3df793mr286985355ad.48.1750311353385;
        Wed, 18 Jun 2025 22:35:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0c9sm112008655ad.20.2025.06.18.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:35:52 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:05:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/11] cpufreq: apple: drop default ARCH_APPLE in Kconfig
Message-ID: <20250619053550.hogoo7ic5igvex3c@vireshk-i7>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>

On 12-06-25, 21:11, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/cpufreq/Kconfig.arm | 1 -
>  1 file changed, 1 deletion(-)

Applied. Thanks.

-- 
viresh
