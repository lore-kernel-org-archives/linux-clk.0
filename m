Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045205674C
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016944; cv=none; b=Pn5+eY9jnMOGBgHDhrGRmKBHTUPRLtY8JtPyZa0QuqxcepZdULr6hNxi/17SLQGexz5H1xZDMEtQMNqY/NZpqk/n58aD14sRIqW0Tp0hG6GFUmy/YtBq5BiT4ngiAYKUGRJGnTbXlqU3TaicrFlqUz+wFujC1UCyvQYN0M/uv0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016944; c=relaxed/simple;
	bh=P9oLwk7VJIg3OdusQw6OhW8NcToKDBX6FFXyfjBmguI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRB34rKYicgJclyIKOPOsT4EzmwxRtRaY7pi74opPMWuQBb1oJfRgCt3kKtsqsREf9V5DDKzbdK2KlNLKddevP3Z8cRM0p21a6LiX1DkWQW/ZfMHfuKrReq949StPQutUuzx0X/TM9hmGiuOpNDGJ6qhRL4BcgUbJJGDNbbaeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEU9gnbf; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEU9gnbf"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60a15449303so8428567b3.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711016942; x=1711621742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uLfK8GwjqCfs3VrBCTLKTjymM9xM7mMzCdCq1/Z8B4=;
        b=HEU9gnbfJxiR4PtnaS3yck/by5EvQHOr0SZfCa/B/BsSXfvASxwZaAnGoid2udQZ9/
         TFSX5j7Xc5LzebvSOq74zHyndQ6AQRKhssEK5Va8jUHA18ar9FaUhNQyU5VF7CLFciMb
         tB3/2Qppldc7FCenKG6WwNp3HuJeD9E+fdw4Hnu7bpDA/tZk/43pz3fKzwJOr0y4TsKC
         lCmJHZrJCOccpiPaD9HreHUcX3gftkCx2GuWNJ6BmC3wuCxcnHjSxRKwj/ltGBFjCI5U
         bcs0uu6PGP6bTccYQHs9Zkz7inbRcUENBLekyyHbBsvhy7m9RFaLgL9km/kWSRYMiEFt
         XQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016942; x=1711621742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uLfK8GwjqCfs3VrBCTLKTjymM9xM7mMzCdCq1/Z8B4=;
        b=V9MJpMmEWQsPCxqG4lYvGk6i75OebtRxxEKK79Y5pLZtNpTUrAZPpKBWabxUmnyTIy
         CFIjTRMyQePAfFIK92YhXxXDAJRpADbC1los/FxFKTwwkZV8mnr0K6BOxH4XrAHyfHyN
         dASPCsnysC40erLiqWi1orvGFa4pyT5BOhbHiOghy+84ii3Yaq5DvWHRpPx/MnASVCyI
         ElpxasAZhNCVgA90sRPbWxYID+9YR01Qm/tXaledgbR0i7E/A+2DuWsvOM9CV/Naip5H
         X33oNR8COWoRbsdZfEp/36HwPyn7yaq+b6Jbx6tU4dejOOIbxM75aMwZFihiUBU5gdtt
         gApg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Xf1br4P1B0JN5UtymSm5HOuQXn9XeEGO45hcmgnkVVbgxDly42TEyNS9wwcLbY7BrqmfiCKbYquZFlU8dRYO093VVd3yE0ra
X-Gm-Message-State: AOJu0Ywdzn+IcP8FV38sFAl/du72tM1/ANQP58ckQPoPQe/OgHQL9VYu
	5K+lDVwyz0QHbuQ2d9HUssqW7SsYNt0faOzjjKMaZxh7CGcwOs6t+QdInnPW4eNaWLjZsLNz65D
	bzzFSUNaHxO7npELPTSv1H08kus/ert4r4mz39Q==
X-Google-Smtp-Source: AGHT+IGTcMuTl2BR8QgKlXuZ62FCg9xZRjlzbWgj/MWKvepEwUPTunC3DUu1ys33B8adCr0Kx8RWRCBXkvGDVJ+BSaM=
X-Received: by 2002:a05:6902:2408:b0:dd1:4908:7a91 with SMTP id
 dr8-20020a056902240800b00dd149087a91mr1515831ybb.49.1711016942104; Thu, 21
 Mar 2024 03:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com> <20240321-apss-ipq-pll-cleanup-v2-6-201f3cf79fd4@gmail.com>
In-Reply-To: <20240321-apss-ipq-pll-cleanup-v2-6-201f3cf79fd4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 12:28:51 +0200
Message-ID: <CAA8EJppOmPJ+mNEfsS7kJYR5ASpa8__a9002KpPjaAwkwTcdMA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] clk: qcom: clk-cbf-8996: use HUAYRA_APPS register
 map for cbf_pll
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The register map used for 'cbf_pll' is the same as the one defined for
> the CLK_ALPHA_PLL_TYPE_HUAYRA_APSS indice in the 'clk_alpha_pll_regs'
> array.
>
> Drop the local register map and use the global one instead to reduce
> code duplication.
>
> No functional changes intended. Compile tested only.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes since v1:
>   - new patch
>
> Note: Although this patch is not strictly related to the subject of the
> series but as the change has been suggested by Dmitry during the review
> process it has been added here for completeness.
> ---
>  drivers/clk/qcom/clk-cbf-8996.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
