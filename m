Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7078139581
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712142299; cv=none; b=WMshTRJKE+rCwJEPJaIHe9Nlv08CvSpgUHoaaHy3/DCziU4YH96zqlUWvIes4RXn+FW75CyFUb04E2WuwMg9Es9OeH0IdpUj7tslkUjBqvhRDB9CVpEBnMSY86jeHF2sRIBAmx/00f+NMkl6QWR5S2Gwf39/QoaUIKhlhnZnUCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712142299; c=relaxed/simple;
	bh=qAXDnAQ20/ngldFN/9GzwB90qcvOX2UPkxSdCsBXvdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCCEzpK51k7FZoGKyaH7aJxHSQH5ItBFTvXojJE8zZ4DUQKhLLUYKk9sWkWQFXhULh+cpUswbVIiGFv9bk8VCxRricJMTeXZuUXKkKJQFxrWO4sJX9MXJa56e6YO6MOsTRsOG+xm1WfTGECtzanfIzykkhsIYAqdJq+vRI+dCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4aKXYUK; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4aKXYUK"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso4040062276.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712142297; x=1712747097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N5/oaXGaDXSfCFWNRLUlqUFokKx3b3oa0E7IyM+4V0U=;
        b=U4aKXYUKDOHk18ss2xfkB6ISdDfnhaV9M7b/qOQlpjYaUxCQ8Z9xdxnEbE8ISrklqE
         o1AvkV02jyN6pFhV4Rk/eNEuMRJBijGolfPUFqN+HeNZlYTURFiBVmntK/eAFviWFH/H
         lxCjbd8gmovR/rvPJKEaB9+FCtT6xN6bwRFBlBWIw96Ixlo4Gb8glBQycRfp5J1zFPT0
         BguljZeFh/83ZRPbLTR7ihxEwpku+mGY7H8afma2zt0A6SEHUtgCfWeThJqM7jSDi2nK
         +zjDXZ6PhpttoqJHowhzxgAW90fsovNJ7H1UZL+HR4B9hbPmMV9cjC+6gMgz8v0Dhy9M
         O2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712142297; x=1712747097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5/oaXGaDXSfCFWNRLUlqUFokKx3b3oa0E7IyM+4V0U=;
        b=K4dZxRHVOSutxTvFE/29XcvM3sbILiKplfycDsQdZfsZof1Bdoq0uT6Qkb74B1j66K
         3JCnK8LukjlyRmecp7pLz9QYTGh3chUBI8Q7FpHiR8bz9m+RXN0X5KSOpat5l/dgSbh0
         xuMd0VN/1LCBgZwkLcAW50jUn0aGgTAkuheUKgucnwbwdAWipgpFeo1ZuhTsLMSXMZxc
         cfcmNrDHlWnzRaCKoSEdsAfTUqb8Rp3PcWD+n43l52pNhVtDtrRICxwji1P5CmQ7tAgg
         n+WoE6/JN3ywTaIDxwpXrAMYRP71VmtXBNxkynwqi7UgOcWM9D9+RdzF+/c0kwY8Kcr/
         OFpw==
X-Forwarded-Encrypted: i=1; AJvYcCXVz2mB9etyfopOF+BGuh1euY715VtYZ1+mDoy7UqMSEcKpoOCy7mlQqNKzJdFGOEGgNi1Ud1asivC7VQV0qL3JT0cbJMfNrYXt
X-Gm-Message-State: AOJu0YxgazSvwW2sfZShALeaHYvcO6oANOHdurxp64ZilcCe8WIovq/e
	591WkDaVcZSEyK0Vn0gCPV9AxEwlyx/g5m5ry18dQ9byONtc2+l11jdz+sId31/UKJUid+pg1MT
	LjU0+u2AFkZVAE/LG+7FcWw6eJ4Lbp34Lzqu5qQ==
X-Google-Smtp-Source: AGHT+IE12sfKk+/XM1kPq4dc8JVlzR2lCkXFu/Nv2FXb7Fs+ZLOsbaq4fFXjYhjHFZTi4dzZn/QBvEeU9aiC510tGYo=
X-Received: by 2002:a25:3c42:0:b0:dc2:234d:214d with SMTP id
 j63-20020a253c42000000b00dc2234d214dmr8359198yba.40.1712142296721; Wed, 03
 Apr 2024 04:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403104220.1092431-1-quic_varada@quicinc.com> <20240403104220.1092431-3-quic_varada@quicinc.com>
In-Reply-To: <20240403104220.1092431-3-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 14:04:45 +0300
Message-ID: <CAA8EJpox3EmmV9o6HqRJkTwDHTwAYQ8kaiJr1PacGnwLPSweQQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	djakov@kernel.org, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 13:42, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Wrap icc_clk_register to create devm_icc_clk_register to be
> able to release the resources properly.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v7: Simplify devm_icc_clk_register implementation as suggested in review
> v5: Introduced devm_icc_clk_register
> ---
>  drivers/interconnect/icc-clk.c   | 18 ++++++++++++++++++
>  include/linux/interconnect-clk.h |  2 ++
>  2 files changed, 20 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
