Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C99149396
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723473; cv=none; b=UI0djWcE//7yVuNoDoFPRfM1/Ii5DabRJ5v6L3BjKS3DUR9PpTp4aDmGvYuAMZfi3Wano2vZWXBD6LKNHqOWEXyibjvYvAo7Zu4veCY4wgoquorB2kw9RnChkHUmhAYs4j8JreJXoUlygROig/DaMOzfQHwlUzad5P3oaVky8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723473; c=relaxed/simple;
	bh=H/tJhqv8w47L674SEcvyX50L+C3QiQZtQ8jkIBC/B54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXU8AkOhMkrZXLGQJiptbSz0H7HpSSnw7zzGkpKxEtBDlbS3Yt9J3PofgZElHZdKH2qT+u7num1vvB9Brngtne623ylMZ+J99fvfkKx6SczsxLWZQD3OVcQBsSYnNuakBIjNgS1On/0YT/g/YhgayygXeIDcXcYKLGQqFB06bAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hv4K9X47; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hv4K9X47"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso1472659276.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723471; x=1709328271; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=akuPkkgI0y/oHinOKr0HxoZmwUf171P0m6vGM5/O5Js=;
        b=hv4K9X47aldLnHaFXYeYX2ZhiYjXGK1bQUZFnv8mm+NWj72tgPiNw7CJllytkU3wSj
         17U9T+RadYGszAvbjVFGZbrHC+I6a3IUsk8RD+JXljHi8gv7abpXm8SoD+i3MofH9Wdc
         Zt51DLzfpXIR0tU/AWRMUeRqJfCXkNH56TtM4Cd1myobOEBqG73he4W1UPR1YtwSFgq4
         UrPdkJB4qLOlc/1RK/u8cte1x92bj7K7cX7WTovIvXSV3sh0zCId/aVaIOXEL7cQl95w
         mRfIA2n2ZXJXDfVCo79FcCjMm9giiequxNZGsmn2DeOHfHdjFTynQYs4zZ2D4rQdppe/
         akig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723471; x=1709328271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akuPkkgI0y/oHinOKr0HxoZmwUf171P0m6vGM5/O5Js=;
        b=gOl6m2asUI+5+DbW7nuWWtmUV0UhgaB3WeJPQpEnHGoFNhuMrVidbXbYdnjbD3uFfq
         +VrgzSfkYDm3nL+FO0ERgjjRli9+nlVhBh+v7eCKIzgojd/LlqpExCx70dvUpRYTk72E
         tE8jPimskLUG9NNyJ1TsdDwlSKLXzF8CESRi/IZMSDc8yYLssOMFKKGxxppOHBwmBxCd
         +4nx/tyEKGB/nLHfc2GCevN6Vd1di386avtBpCTESZdS0+XejzS+7behOdqb+aMbIGwg
         7G6efG6203Ms3gMsMzhlPBzaziEy61M27IGwooxTwNKdsufZusB3+MBmVtVTUfjZURmF
         EoAw==
X-Forwarded-Encrypted: i=1; AJvYcCXyiX493kffYLSI+Gkg8fY5/E30Gv7XdioSR22JWmSz2SdQGZCS2Q5PbZQjCrrMbLBSwKTM0fS1q6dKmqus89cORhsopClH7+PR
X-Gm-Message-State: AOJu0YyaedJ0Tn/XM5D0XYJhcyONHbOOHJVCqJLmbsOyCEnL4SA6Uz1o
	WRNOuVdxU4FS8OIFtjdiHEUUXkFriqHU6tJI38UhcqveoOniFESBbhPWgF8lzNqracaUvb8g0E7
	pAmj9K7YmPfvTLwR2ymElw/e7uv5RItOsQUc58g==
X-Google-Smtp-Source: AGHT+IFbG9R3qzPDyULutJwOdT2KkYVwoLnuTNnZQAQUOT10IOJuFq9jx8p8pvPNgR7Ok5iVzV0j+sTC9nwDRCxlZ88=
X-Received: by 2002:a25:c511:0:b0:db9:9537:2c39 with SMTP id
 v17-20020a25c511000000b00db995372c39mr1121626ybe.2.1708723471023; Fri, 23 Feb
 2024 13:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org> <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 23:24:19 +0200
Message-ID: <CAA8EJprR=tPUsFit7DEzh0U9TDOm8TY29m=JVJwXQwH6vEN49A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 23:21, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
> introduced an entry to the alpha offsets array, but diving into QCM2290
> downstream and some documentation, it turned out that the name Huayra
> apparently has been used quite liberally across many chips, even with
> noticeably different hardware.
>
> Introduce another set of offsets and a new configure function for the
> Huayra PLL found on QCM2290. This is required e.g. for the consumers
> of GPUCC_PLL0 to properly start.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 50 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
