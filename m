Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B304A01
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998780; cv=none; b=rGQ8X5/WzOpEWcadfke+kG/p4/11QvySJsvUf50h+k5eQUlDkeEtZOoXeA9oOMkXkxVbf92WtFbEVJBGCzfVdfzsRTyznVlX44pez3nNuFJWnmb+1NuOE93hCy0JoJgh9D9By7G8L2fy8NRNQC6U15G4vOOJ49AN5qDExFmMq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998780; c=relaxed/simple;
	bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2DH0IPVLl/wgjtF/vsvWOMIQWHbs/sZnBQ8bW4yq52VfpW9YoYKRGs+bzu6oBeg56vPUAwqGnUlYkGPaMKj3f9h8DvmVY0qFTqsde8+LyaMki6jHvBMcSO5HC9j0uwc8f4nZok4vg4mKpjk2THSd4SXtKZfJL9D4ETGNA7E0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jhqv17dM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jhqv17dM"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-36a6a39752bso6165601fa.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759998777; x=1760603577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
        b=jhqv17dM/YK2avzLOJ5fVM1xlJrPnS1J0gGa/+ec+ujLYF2djssLkyunOykHm8jWJH
         x6N9qz2rkV/HSZ7Rtf+Szwjwpnu2Z2BTPlBLQs+etaZ5zrQKzIzFSMIkAFtli2iLjfeP
         UWAdDBsXeKzyvO15FI/xGodADwontF/oFYM5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759998777; x=1760603577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zljMLJhTqmHi2q/FCnKIXWrWrFEkWPNiMAl0+Hq7D2o=;
        b=pQHO1mZKRPXAxLVcjnXvq9g5zGSn1nIeSmjm6p+3uz3Fk2ggAP3gRdiKL3mIVlNXl2
         ZSs5BeWn06MrZc9IKNxtu5Y7GUTbSBJKVKPib4CD0GhyiI+PeuknMCPobalXuY/v73Fl
         8RkJzlfBIoRGkUCrE8c7vHlTrNglFudYbg9VVsDPOAJansqY7SgZrlw5qy+Q+niNhFw/
         7WFOezvYYXrMj38SVfGu7Dgrh+ezuxzz3uBQjf7xJlXBUayVOpwD0FSGL/Vqa4M4fk3e
         HyUTFRJVMFCR7i6h5pveUh9R9q5ZCeSEMKCounKFwTOdqlX9/czjEViakHDc9294mgCv
         YQnw==
X-Forwarded-Encrypted: i=1; AJvYcCXAtFKxQJbhnV2RUqXqhYZBR5DwKyEML+Tr1QxMOAhIPiK2KF9FWQgvLlOEQwqnCJ8N0m+FUEVgGvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVQR7vrhLsAU6OxlL/Ql3WBbq3FHd26p5xyicP48fXcebmrV6
	8weTRzLdgisZm2vYrUgfyCA3VIR78iH/Vg8sCZDFh6zTAnqkYhBx2HRhDTvN9OMamvY3zl1ob0d
	8mwboXAq8q8uSWyuCszVJpHEewr4omiXu2wHuWWKu
X-Gm-Gg: ASbGncs9Z2VO8ED7jO11NAbUEtwjcAQJdHn4G7zHz1FUo1q3j5FFB1o/AgZztDza9kA
	W4ahm8NS794cScgBviZ1p5LuGUNRqJ8owx2qFR01NKpxHO0SZReqUk3PH2rHP4t/TtiS1wxZg8f
	ydEYuBF9w2m1gJmeswe13lpibkqVifrrJnVOCkAlJPqzPxrue2d0qvtc7j19YfIJ7A/7SjXf8no
	/t4Oi5HipSISUSIC5+CgaAMd0xqZ4mNy4YUJtIBqC7vDCAydfqTkDucYQtvLQ==
X-Google-Smtp-Source: AGHT+IGNqC+T82k2UhLGhs5Z+RJRCLCjdXUj8T+fy/dwo+JYeZAn+ZeihTGmoYgDd/1wSNYOMWZ3ybZyqQU5hYgcf5M=
X-Received: by 2002:a2e:a99e:0:b0:36e:93a3:979d with SMTP id
 38308e7fff4ca-37609d52442mr16172291fa.19.1759998776858; Thu, 09 Oct 2025
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-3-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-3-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 16:32:45 +0800
X-Gm-Features: AS18NWD6JVU3Hv0pwNvYA85CDPCr9XWrThP36lbmILYiActB6r-bT0qxLSR0NtI
Message-ID: <CAGXv+5G8XMRGasd2=H_obsLJ-97M-cNPDo3BJCrwhx2+GHhYcA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: mediatek: Pass device to clk_hw_register for PLLs
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> Passing the struct device pointer to clk_hw_register allows for runtime
> power management to work for the registered clock controllers. However,
> the mediatek PLL clocks do not do this.
>
> Change this by adding a struct device pointer argument to
> mtk_clk_register_pll, and fix up the only other user of it. Also add a
> new member to the struct mtk_clk_pll for the struct device pointer,
> which is set by mtk_clk_register_pll and is used by
> mtk_clk_register_pll_ops.
>
> If mtk_clk_register_pll is called with a NULL struct device pointer,
> then everything still works as expected; the clock core will simply
> treat them as previously, i.e. without runtime power management.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
