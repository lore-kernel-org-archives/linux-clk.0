Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213517DE26
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210749; cv=none; b=Qzz97em/Yxv/1Enha53mLnCIzKEbbvJwB+blRHA8dWGAJpp9gNyaSpX3/9ZkZXSb4Lp0RzF5clGX9YCBX2GqAg8xBJlCd4RlPVxJZfEkZJqaYnwRehbp8CcDkTnwwci9NgQGTlV0jp7bxCKP2oTewdbgz9GJYQTZjuMUwfZ6gTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210749; c=relaxed/simple;
	bh=chH+ucYVFollBpWofReK7yIO2W2cQCdc+Y402fQusJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tt3yR7fVZZRXJMnY0Oh2i3d3RnEq3L4xeRGHECqyh18eTv5XhPYVtQ7uUPdxAdrQMtRCh6PQGwl666PouP48gwoGtzwSQCY20izXMc5QatrkoyRRjjunC0AktpI/bcwk8YY95vnUfkaBoJEeFRhK/pWWzii9jk1Gc6dm5GwAj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHgaUbjT; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHgaUbjT"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e035f4e3473so5987160276.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210747; x=1721815547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoUdOZLlQAAmruOrbVsxcaV8sc5lR/mg/6r1PDCx+D4=;
        b=MHgaUbjTxFa4sb3U5Fe1s+s4pJjXrLw7qPqmKCOFZbVB6VLZADtVn+tKOUFmmCxJ3e
         nJ8fRj4TsTJJ0W04Bt+aL+4CUT5wOhEeME9v4GrGoVh1oBStUmYNllqbiAhCVGZkLpxV
         hz//tbw5mCesmkSJZ4mwKppTtAQG+wsSh+5JlXv3/daW29hDSDgh1EkIBnd8vG6Cyls2
         VsBovnQbDH1N6BBC9vWtXsoZDp+ATUlSY9XrOfR5bzsuxELo7EKQWCZLBao+5rDjlGDp
         k437e+X2b/wVjtisDb3bqo+njXYZVUiHrmvsrb/V+RCmql+9LcP6nH2qhdk1t00ergMZ
         mQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210747; x=1721815547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoUdOZLlQAAmruOrbVsxcaV8sc5lR/mg/6r1PDCx+D4=;
        b=F1WnKnQVB9EMSMDHkKfhtRwKayVIHBSrRWB4hHvZdFogn31bclZsp5zj/qTfyk00tA
         AwX2IaEn+80NxHJgsNZdCeFEmOc2vsMDnpI+H7WtPTAp549Ijd4+UK5cfMVls9G3jZb/
         5IuwbQ2Gd98QCUHmqlkH97NXTE2gljzf4Yq6qZcD6kdhlm0G1RZyIQoO+AbUe+BQF3fY
         G4Udnl7pU14m5FunDZYKGj46PXI76V9++w7X5U8vDqb0x6rT9k0OVLJ3p2UNhxsQ6qGl
         1xVN3nXGJVEKN3E/DsIOzCmzkksmFHkdwVr5ID2dCs3GQeZ4/39YunOQpJESG/qd7TNl
         Ha0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUjapbJNwm5Fnaf29MEF9voCxE473uHOXujhycxeYs7WGn2jabIFZu2tXtXP0LFJreZFPG4KsB7IWUZcWzSNqatWnY/rnCWj6Q
X-Gm-Message-State: AOJu0Yzs6I3Fr24+gLtG1PDQr6VKlY3XojaHt+6hQ80q0V9aGp+424w4
	s+Uzw9mOimaxrsS4bh77UB/DaYTM1Ab0jFJAekjuRYYdckwb8VtEqS2YUOJNyVYS2wZMvL66Y+x
	uHLeJn+/cYgvIkcdHiU0m6OhlYanJQ9dbYXAC6w==
X-Google-Smtp-Source: AGHT+IHYh/6i/8hq7tpOwurvTcspC0p58XaYzPylkrOGMSKDPt0iy/Je6Pf446cf1ZySUgGleEGSE6zosAzFkMtIqyk=
X-Received: by 2002:a05:6902:1102:b0:e03:4ead:a32c with SMTP id
 3f1490d57ef6-e05ed6ed999mr1472948276.30.1721210746690; Wed, 17 Jul 2024
 03:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-2-efb4d927dc9a@linaro.org> <ef1e4d78-7e94-4853-90c0-73f0b80f9a63@linaro.org>
In-Reply-To: <ef1e4d78-7e94-4853-90c0-73f0b80f9a63@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:05:35 +0300
Message-ID: <CAA8EJpoCtEOK=qgqKqFENiu1zCdXsBpR5EXzPZMrQQnuVMqnCQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 11:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> > clk_dp_ops should only be used for DisplayPort pixel clocks. Use
> > clk_rcg2_ops for disp_cc_mdss_dptx1_aux_clk_src.
> >
> > Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/dispcc-sm8550.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> > index 09e4b1e40e20..8ceeb17bbb37 100644
> > --- a/drivers/clk/qcom/dispcc-sm8550.c
> > +++ b/drivers/clk/qcom/dispcc-sm8550.c
> > @@ -400,7 +400,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
> >               .parent_data = disp_cc_parent_data_0,
> >               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> >               .flags = CLK_SET_RATE_PARENT,
> > -             .ops = &clk_dp_ops,
> > +             .ops = &clk_rcg2_ops,
> >       },
> >   };
> >
> >
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Oops... Neil, excuse me, I didn't pick up your R-B tags for v2. I'll
send v3 tomorrow, with your tags fixed.

-- 
With best wishes
Dmitry
