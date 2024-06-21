Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D1770FB
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005725; cv=none; b=fBUg7845aygE+t3PPOFqsn1DNJwPfNwBWoTysJjxF+Ukx2WhxXcEHnxw+quNgGWZJHymA/7nXUveBLdEG1EDQEah9nlXYVcSiUTZi5oUOn4v7QuLb9skmgDlIFRD7bCC9HbgzGCmF2TwSb/m4tuF0M4J9PIab+4FbcqGJjtSwCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005725; c=relaxed/simple;
	bh=qTMEby76e+phzeqNSFga3ZWYraPCTO0fmLO7nBbtIFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZWFgFJw+IDTidFv/+HvvF2SKLy90zP5xGACCV60pacck4k3im2+pnwFlYuZzaFPWaz7WUPWz9RUFATkx9jadc9Tt+SHcDF3CB/XhZ7lpjSj4jSoBMglYiQ7nuvIXhQ1Xg25PBJykhk2S+zalljtoL62HhJMh4Rc92UXIyViTZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwIadPYT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwIadPYT"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52caebc6137so2709012e87.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719005721; x=1719610521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7QzofDMIJnox4m27cbx2yoWL76uSEp1G3gfH6bMGlo=;
        b=UwIadPYTXnfrJfPIYo0729ZpMZCawESKyQ7vgeufxAhb4GutOU64L+cDuYQRlSqj7o
         6I/mp2yJEJH5ZxlXd2GM+bama0iHy/qbsW9x1WEkmvqkFda0HPjHprmQpvnfisVIKIOi
         VMqQpqYW2qtFOZvUXeBRU7IPW1zKJZctX2gshliVGLtDcdprKy2xsoofAJZh5HN7UmeW
         YeZrgMJATDFRCDfKa5uimT2fFqc6Rqnn1k4tgbU64vjOOQdTgL+gT5alnbKO3JrSUKSL
         64lV8ebOF+Eg7sA1ZJ/Hhfwgc2XFLCI23xGm5AU2+wGbodJ12T88kYv70p5LymvckiRE
         n52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005721; x=1719610521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7QzofDMIJnox4m27cbx2yoWL76uSEp1G3gfH6bMGlo=;
        b=c15EUN1JP6tnsVx7p3C8zGqfwVhlN44cULCEsd7qwi+BKu3HRIlq682LIXdFCeI/dg
         lw2ElIirJ+8nFPw1ILlE555lcD42Ch9RogZfje6YywQEZy3Z03mCqrG1hosXRUbVo1wU
         REMHihi3ub47nx7ngo4lhz1NKBIaY9BCEASJJ95c+6gwvyti/4pxArASs/XsFKZpNVGS
         63sFEDQmkQuoBNhhTfKxfrrP8PQ5HXt/1BB4bO4dFfw9DCRMRkBkeIsP8PEfaabtKdo3
         N5oaexfU/F5b/to8G6N1aI4ZaIqwhRTrH3icEBv031c0qeNn2Rsg87abppVy2pNzHDrl
         ESwA==
X-Forwarded-Encrypted: i=1; AJvYcCUDL/1k9veYp/QrnxEMMWvvZPSIJycHJOlhwIzL2moFco9HMItPxpe7yf2vmB8Aed3Y7NbIREsiyfg689QlXbQtnvXZ/gfJpAf9
X-Gm-Message-State: AOJu0Yw/YaL62sTKVgSTD0CFDbDZHih8jDwtZjP61ERTpe+fBQ6atdjT
	LxfH2f8hnLupyNsm0bhVf3rRd53hXuXAym1UxjNWtOgeeHEQ1BWQgIG3q7qbA9o=
X-Google-Smtp-Source: AGHT+IE3I1OW3tps/gbJ7JLgMTs4va9JJcfWhFkgP0GEwspZ6da7/hcUMk7cMNq1x48Qb2faeRouvg==
X-Received: by 2002:ac2:4c01:0:b0:52b:c14d:733c with SMTP id 2adb3069b0e04-52ccaaa2947mr5347391e87.68.1719005720668;
        Fri, 21 Jun 2024 14:35:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bcf2asm314624e87.74.2024.06.21.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:35:20 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jonathan Marek <jonathan@marek.ca>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, quic_jkona@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gpucc-sm8350: Park RCG's clk source at XO
 during disable
Message-ID: <cehpfdrqxcz6azrbswscsp5xubqey3ogmsyxw6y6n7lphvrfez@nep3r2nua23i>
References: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-sm8350-gpucc-fixes-v1-1-22db60c7c5d3@quicinc.com>

On Fri, Jun 21, 2024 at 05:34:23PM GMT, Taniya Das wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Fixes: 160758b05ab1 ("clk: qcom: add support for SM8350 GPUCC")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sm8350.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

Thank you!


-- 
With best wishes
Dmitry
