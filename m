Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652A27A932
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 22:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747953195; cv=none; b=Eq2QhpgN/hupKZURqZe/EdPsDlJuk7juUHBAMrujN8/aW/hLzZ/wsJTqR8HhzONeSUUVxYnZnB8BE4Ox/chgPwJzdpGsoxTnivMBw38BBi013b0VaWdjIGXdrvAH//WhI4QuGOyXFa9lU9/ibydgV78o8T28I95/Kxde/ythQ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747953195; c=relaxed/simple;
	bh=QSwh9e7eyWFctLzZF+Bc13eVUv8DWHOVQbdS0U2r/GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XP06GlzewFT29QHrdOTcWm3nUogTxuI2iMPQCkpQwNLFXTwSa8uD9M2kEVMx5mzkT4jhPWl0XAY65CjobGTiVg6NVA7iB6hYWKkSrjotHPthJCgUNOjyo+XY5mcJEaDcV4UVKTCXD/E3mv6ntlfbRffsOwjKEmcoZvIsgXaPHrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=UiRtJXNc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="UiRtJXNc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6475536b3a.0
        for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1747953193; x=1748557993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=;
        b=UiRtJXNc6h8Y/AgORrb7rtqvClgTNNJVTeYyKOYvC8WbJUxz+SiZi2Gilt3w2ZQnAF
         6G5baRUBQ5LadKo9ERHfMSCQ2UC8ApOBeoXhMcixFParis5OVJdWjO6X/4le66E5O/fE
         WFStNWcuLGJHKaqMXwl6DfXhPjDu/EULZlQ62iy0KXqkUa6ytAr3EHI0RbyHdigJ5KFd
         QFFnrzbPctGzgSCVoEmKAF7rrpPWJfaaXNIkDUHEM3irJdA+JWmH5Kkxm5jHsZ3xJpI/
         NaZatw2ySZMeL3MSOZGABhDdaKbE0Btm1aaG7BfHaI79kvpg+ZhJeoQQU3q4NPTYhaXN
         quOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747953193; x=1748557993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIPDnA54KHM+aahxuVehx28jJr1eOYyr6Lt8SFqaFv4=;
        b=JHaCtXya45ytYPq8l3j2OvZ1Y0RMAFRRWsl+FqPQvfDucCHusTUXH6SRhFiNRD/nEP
         QMxmpFqkhGjXco/y2cTD6QbWMpr6YD+kBXk2mpDSIeOX5DpZJHgkt7YsJS9rwHIh0VXG
         Va6RFli4Ly1dWY6R/5NVazOo+4i7A/xKI2KpYQGDm6Vb0S6lA+y3w39UNqf2coKFm1N6
         WNyBDmIzM1nvJ8MPWD2zyRPrUQjXhRlvQVgiNdd6JLQ8y5Y6CP8v2ltuLUtYIrfm8Vu9
         78zIl+anzySBHw5oqRf+hmkQYjS6T3NwgHcpia/daUmAqkC8iewLB5RCAbGzgpy4ZqPK
         xTGg==
X-Forwarded-Encrypted: i=1; AJvYcCU/sNU5uDz7N8jmC8F+ML5EBNbsNmKtIaVP7DUD1eBKKxtglOt04VWYqYmYr+HG8Y/QOvmQjhKuwfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfAaEUTFZtDJoB2z/b+1j5p1gw+MQjNZdn2c4om3Ip3+wB9/fT
	X3EuyNq5p5OZOAOMFi5mjgt1yPpbIlLLYf515Co1ObwPfS0ZFaKk43LMzaGDjx8m7H8=
X-Gm-Gg: ASbGncsGIoilIdf+X15rWLn3Lp6qJoQBgYw4E9EKcLeop+8C97Vu/laNia65RQTvfGm
	8nkJD9q05RDYqRYIxmmAtGQ/1Pt35ADmxG5uOtGUaClG0T+jMqicOA+a5tCAyyL9uv1mmPI1yLC
	O5dgl2s0aUD4HhBq3G2IqTXGBtDGVTYldl9lad9OnfrJfWjilbYGsrSA4A8QoQx05kJPN1H61jZ
	7TLAOU7uRuPuH2YAAmqGJhRSJEGWxbDyjH7dSHHVChvIlrFuzmLogrz1nd0jyTWaL0jmPupfmi1
	8XWy5XeXtXHZ4q48iZ0VcZj7lFtrdmgJCdMsObxOoyrol5Zx+0F0M6/TlfyvYSQ=
X-Google-Smtp-Source: AGHT+IEXf8P4jUBPRl9v3R75tHy0ox53KdngEfSQ/zTdV0vLhoyMGDNzZ3PqCSjMLrrOP4fvai8dMg==
X-Received: by 2002:a05:6a00:3492:b0:742:9bd3:cd1f with SMTP id d2e1a72fcca58-742acd728eamr34873087b3a.23.1747953192946;
        Thu, 22 May 2025 15:33:12 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c6b1sm12137965b3a.59.2025.05.22.15.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:33:12 -0700 (PDT)
Date: Thu, 22 May 2025 15:33:11 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
Message-ID: <aC+mJ560HbscG38R@x1>
References: <aBus+Yc7kf/H2HE5@x1>
 <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>

On Thu, May 22, 2025 at 03:24:02PM -0700, Stephen Boyd wrote:
> Quoting Drew Fustini (2025-05-07 11:56:57)
> > The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> > 
> >   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16
> 
> I changed this to https://github.com/pdp7/linux.git but please fix it
> next time.

Sorry about that. I'll use https in the future.

Thanks,
Drew
