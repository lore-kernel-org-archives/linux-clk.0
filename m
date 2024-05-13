Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3971465B3
	for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715584748; cv=none; b=aUvw2SSHVjKM7BcZiQWGcovY/C+lJpjIjSjpu0uKmDt68FkTp8csIMhw7WFArlfxjLfHQfKf25/V+zENRklXwx6WYXHMP2caRzmATLZe6kdqTt+pxmRH4p8L1N1lEQpDk6XOOkrbUcHlNq2Xz1ZjVP4Nmv+Wh5hVmQRn1eAV1UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715584748; c=relaxed/simple;
	bh=Xqhai6XT4tV+9iwtGmVhwEgbB0oM7oS/gv2BnoBqodw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGgdEI6RsEf+fm2NLqONSTJpwRx/TrFABmzc+ML+8hqrn6xqAeCSs/tS53xOqEN5ck9QmbU1Hta1TngxJAminFvc75guxbRYTkITGFj0qjvADItco9bW3FoXQuVoTJ2qIrTs+yn7aPWt3iPpnh1XzjQbT8uxBPsDE6aO8Y+Hisg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qVfurmg4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qVfurmg4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ee5f3123d8so177635ad.1
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2024 00:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715584746; x=1716189546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wO+nvm/FB7mdS6XXsADZh8n47g0eoqdPjOaA96BL71c=;
        b=qVfurmg4c1zd56ghbbVupOF2xNy/HkMBQ74nt7BiRO9lwhi7kBLG6pOwRmz2LsLz3w
         sQqpvLCRY6YV95gD0l5frtnSVHQsidqfs2x6OnyuF0o4S0wwat2I5/tVsyxk/qymvWLp
         xwjETQ+XaQ0uu4oIpiJDl7sU2YlSoZTgMw1YR+hmBIye4czAUJfO78kzCQXQzRbZ9Bee
         qWPkHBe+bErITlx26Xs+m3QECANT5SE8wwK7bUHQH0HjzhtaNPqoo6b82TV0UH5n6ue7
         e9eQGkkEk9J/Ul25o2tQDZm0bH/pREhFzZiturcl70SqGFE/C1BpJ4+eTVfyvgUtRzoA
         6g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715584746; x=1716189546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wO+nvm/FB7mdS6XXsADZh8n47g0eoqdPjOaA96BL71c=;
        b=ozAz+flJyZJ03dGgDJDW8wNUJZTpLaLgk5RxHnCudYEMzbiP3bZnO3sGeYihuN79Ee
         DaQIeWZlJO6ihKU97um361/KQ9QxlYPjWjLfQeG0+DNClLmXkzEKX97Oe+sJ2bc9vToU
         f/Pvm2gS2geLIImexuWS+pgBaD1UzSK4vKrQ2g8oybsasltIFug+9u0f2lCRo11al8uu
         0cXv/UEduf07ujIfyCdwD3wXPqfBK07QE1ZEItR0255okRJrKixulus7HBT6toHlEw9f
         Ct/XcB+lVWppVE3mOLWyT4cFWaryypv0HpKeXL0QyXMunDinBrGRTm9kmnoS4Zx5QOA5
         TJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWrOlrnSGXTD54M5uzn7vR2buTn4+dUaF1CG4XAIKrXUKn4cXtISl+IGqxutfO+otGNARhSEe59VQI8TMllx5ROb6QuN1/iaFkw
X-Gm-Message-State: AOJu0YxmI4R5iQ20JIrjb1ipCUTsq02mVHRgJwZ+BGvFck1A74RYQYy9
	4/PeDaGJZ+PVG12dradHz4gvmXMWMofSeaduAq8D2I7GOkzpJNiyKK43UKqKzQ==
X-Google-Smtp-Source: AGHT+IFyv2PyAmDo/5EeGxOcWm9/WBZPKynHL05Zf65z/JI/CEbCpxc05nADYE0fj+eC7NiR/C2JXw==
X-Received: by 2002:a17:903:2bce:b0:1e8:33ce:5d2f with SMTP id d9443c01a7336-1f060bf44camr2433465ad.19.1715584746238;
        Mon, 13 May 2024 00:19:06 -0700 (PDT)
Received: from google.com (100.22.168.34.bc.googleusercontent.com. [34.168.22.100])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-63e88787c93sm2506677a12.90.2024.05.13.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 00:19:05 -0700 (PDT)
Date: Mon, 13 May 2024 00:19:01 -0700
From: William McVicker <willmcvicker@google.com>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	David Lechner <david@lechnology.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] clk: samsung: exynos-clkout: Remove misleading
 of_match_table/MODULE_DEVICE_TABLE
Message-ID: <ZkG-5YbtJtjEojeF@google.com>
References: <CGME20240510070700eucas1p10ed1c978c78366b412770fdae6d4f384@eucas1p1.samsung.com>
 <20240510070653.537089-1-m.szyprowski@samsung.com>
 <CAPLW+4kYE7mnEUrQM4qRs0Uhr2RcXXVCu0XLvX7-czJUZ_Fd1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPLW+4kYE7mnEUrQM4qRs0Uhr2RcXXVCu0XLvX7-czJUZ_Fd1w@mail.gmail.com>

On 05/10/2024, Sam Protsenko wrote:
> On Fri, May 10, 2024 at 2:07 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> >
> > Since commit 9484f2cb8332 ("clk: samsung: exynos-clkout: convert to
> > module driver") this driver is instantiated as MFD-cell (matched by
> > platform device name) not as a real platform device created by OF code.
> > Remove then of_match_table and change related MODULE_DEVICE_TABLE to
> > simple MODULE_ALIAS to avoid further confusion.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > v3:
> > - Use '#define DRV_NAME' based alias. I see no point bloating the driver
> > with another platform device IDs array, as I don't expect this driver to
> > be used with any other platform device ID. Driver variants are already
> > selected based on the parent PMU device compatible.

Sure, I'm fine with this either way. Thanks for following up!

> >
> > v2:
> > - added MODULE_ALIAS
> > ---
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

> 
> [snip]
