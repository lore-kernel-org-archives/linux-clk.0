Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B16E1ADFF1
	for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732542932; cv=none; b=EULUrzf7CShgy2JFC3epIKVNPPl+jQCgZ1D4N4i3InedUnMrBq6m6DjkaSZuCZ0fADdYjsGCspHGAz4dIV9Mo7gn3nO13S5Rktf4NU/gE2qoD3Ey4utqYZ4NWvbKwesTQcW5kyKTMjN6FNoRpKzUiPkRvOePuZV0bLK6Vs+SMWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732542932; c=relaxed/simple;
	bh=c68pDtpQmnz8Qz1FkmFGGGSFTXaBKhvzAv9vwHt9tNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2YJPsT+GMvcGH+cDNtKnKD8hMJtlch8IiujMBsvHG98LjC8jiR+zA775B7TeyE6rcavP5nhJ3aHZVzmvz1U5uOIxfAfV/6dGpUv5Q7M12qjvJJ/cq2AcE0xGrGDAcuqi1UmEsU0ma62xVWjiTjiroyaWbo85myyI9mzoeEN0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFLw37HD; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFLw37HD"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e388d8850d3so4325165276.3
        for <linux-clk@vger.kernel.org>; Mon, 25 Nov 2024 05:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732542930; x=1733147730; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7VmKDzCTkltKUjIPNueUVhqkcuFjEc3Za/mVfqbya8k=;
        b=uFLw37HDURWp/29GvX9l4cs3BlPD7CrxVjTZO17I5OgIjyT50wyOBKrBfu+XmaD8G9
         4iyYEaeLnRVGDUROg970SHq4SyLoaIkUHI1kPHAVTT5QxJ+T+Mycr5MpML78I+bGbRHf
         eo0w77SsJROYTwjxglvvsj2jBov4h4IRrVBrv+kP516rMASYnEtG+W/34Y1l7zE8hk+z
         H5rzE5ZWCOUYSP5uCaQg3cdfZcgQyBEmwft5zChiXk1T4Z1ryhBVNtGWmahKe3cOQUgi
         vpzV3ZQF+M9qJIop5LVFlxTiA88qx2cWqSHC3W9dxUiwcqxniTpCfOTrM1F6VXQNZIo1
         cbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732542930; x=1733147730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VmKDzCTkltKUjIPNueUVhqkcuFjEc3Za/mVfqbya8k=;
        b=fC5pFFI+qEvNLkSsLAvOXkjbZ2etHo74N8E1d+RheUFEsVYa50OUOwUAJPN6/Vvr8G
         gbglH85aYS/S4s79NeAoC3KCgXDmwG29GCzlhLoBF9mLodlpwlaexdW5SJ/1NZaVQ4Ui
         BnKecqfVQts+ICN7ZMfUbA/3lQpS01UKxXZ99JT9lemYODhgexa/++ZQFl9kLtUvuxVg
         mW5AVF066UZAW7yYNYBFqPfSjK24dwCvqZhxT7pchuR+/dYB9xVSr/STtlNHn9YxXiwS
         xP31GeEjyyWi4+LiPCfk19yyA4gTm6L4fq7+UKkvrGpFDKxU7pDc5BEm+X2Qkp/gubgV
         1u9w==
X-Forwarded-Encrypted: i=1; AJvYcCVNAiCW4gy3gwJd9Wx/NLgXD1vdqh8i5mGAnAP+EZImpVyBZcvR+uODqYniWgD9D/+gFVuSXyYFQgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SQ+l+MPa7WciJXEntHIWaVbQYSHASITUsgt4DWTKw09ul/c3
	vEOHJ40bQYLSwt3zcK8b26992SraSzflevT661SYbjW82xta7ks3LGaK+5V9+lqFI3HBao5Nqha
	Pd08RSCviDXQQ8ttl/IFBJCxzBhRP3t5BS/np6g==
X-Gm-Gg: ASbGncsKBeVseuBevnOPwbM0m6PB6cR3YsjMr3Bnckr1OSeGjlM24WXkj706hxaf2Rs
	f2i/XgdnxLZVnQhfAmhUygwcFm+qyNqh0GXD+H8k6e2TOtLqT1vMu4omwWHZrL6U=
X-Google-Smtp-Source: AGHT+IGhYldzrLXU1z5DyslvotkWdyomSc+OiyQ5LS6CzUSESd40sDqPgmBZIVdsFWN82ZsZOAGDbACG04OQXC2VNAY=
X-Received: by 2002:a05:6902:2292:b0:e30:d289:49d2 with SMTP id
 3f1490d57ef6-e38f8b1f688mr11832723276.17.1732542930263; Mon, 25 Nov 2024
 05:55:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com> <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com> <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
 <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org> <b411489f9f2441f7a0f936127678e36b@quicinc.com>
In-Reply-To: <b411489f9f2441f7a0f936127678e36b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Nov 2024 15:55:19 +0200
Message-ID: <CAA8EJpqYSujKXPFkdWcqRpOKZ+dJHQDkYM33Mt5JxuA=Mfs+WQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
To: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
Cc: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, "Taniya Das (QUIC)" <quic_tdas@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Nov 2024 at 07:31, Renjiang Han (QUIC)
<quic_renjiang@quicinc.com> wrote:
> On Saturday, November 23, 2024 8:17 AM, Bryan O'Donoghue wrote:
> > On 23/11/2024 00:05, Dmitry Baryshkov wrote:
> > > This leaves sm7150, sm8150 and sm8450 untouched. Don't they also need
> > > to use HW_CTRL_TRIGGER?
>
> > I believe the correct list here is anything that is HFI_VERSION_4XX in
>
> > You can't apply the second patch in this series without ensuring the clock controllers for sdm845 and sm7180
>
> > grep HFI_VERSION_4XX drivers/media/platform/qcom/venus/core.c
>
> > drivers/clk/qcom/videocc-sdm845.c
> > drivers/clk/qcom/videocc-sc7180.c
>
> > Hmm.. that's what this patch does, to be fair my other email was flippant.
>
> > This is fine in general, once we can get some Tested-by: for it.
>
> > That's my question - what platforms has this change been tested on ?
>
> > I can do sdm845 but, we'll need to find someone with 7180 to verify IMO.
>
> Thanks for your comment. We have run video case with these two patches on sc7180. The result is fine.

A single case, a thorough tests, a mixture of suspend&resume while
playing video cases?

Also, can I please reiterate my question: sm7150, sm8150 and sm8450 ?
Should they also be changed to use HW_CTRL_TRIGGER?
Next question, sdm660, msm8996, msm8998: do they support HW_CTRL_TRIGGER?

-- 
With best wishes
Dmitry
