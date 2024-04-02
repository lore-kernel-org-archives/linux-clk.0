Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD8664AB
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056630; cv=none; b=e1HNA6E3JL7BOM42FdwWFAq4JOsqs1JlBgMShgb21JyrZpE4DAPts2z7CDzPGUmVQi72OLsDuXeqQmAe+KkLAKsxKywW9rfFVf1s9O670KtMtwG0XDKEmYME+r7TJZOkfU8nlfa9T79Kl1unRybe+lS/14lc8lZ0II63OuaEz78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056630; c=relaxed/simple;
	bh=xYEx1wB0KeFh5dfJ6HSa7rT6aZpOvWbEWZUcFmvpOYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/jRalVmDuGNrBFIT9bue4ZMiE1lD22eLHoUnt92aU9t5h//20P1yOpIhBp5Y1eZ6cTiQxZcHJLZ2sKirzAJB5qPrst2qW1Ojoc7ctQj4pOr2HG55O0xCjmB8qC1vpnGQIiaWK2/PwQrXlqtG1S6h3yrwlKdvHKjWZ6UYqlxDpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtz5tf/Q; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtz5tf/Q"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc236729a2bso4652326276.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712056627; x=1712661427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mFAn5q7CQFxXq7JaY+/0V77lsWhz1Tz0icfhEeQZiIA=;
        b=xtz5tf/QsdMLoKnoqx6rUztU2p56/IxKm4kRKm+X4rVcFkrg6e4owC085eK/kYL9kn
         1tjX/ujIHU2cSIoDXA+qTG4MG/rMfvW26UTiwox3tRNqJOZ89Rk+y3ptLICVRhzHPQ6x
         jkQbPlQehDn2Y+KS9/2U1QRPC2pEjlrfZbyjnzhgecb4F638Q1Nyz44id0neiJPxZLI6
         qk/2LfRlq7Me3H7TwhUfQHDas1GKcuIiVc0CGuTn2F6ZLc2h41wtu7/tw81J7mVFKcap
         3mAT8KO0GKbRQ1WL0Wyuc+RV03yzIC5f0jZ3AuBZT/oyofHnXGfIP5L9Or4GyuZLT078
         Xqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712056627; x=1712661427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mFAn5q7CQFxXq7JaY+/0V77lsWhz1Tz0icfhEeQZiIA=;
        b=KHlPf6lx1OC+H55aI1tTuZG+YWEVTC0WNyZjaS07PX8c6R9qqJN1/TfyNUhf/QkCdS
         CWIopxuQKhjFYQT7m6ZgluF96pWkct6fYNhuQgDL78hUnPwtn9FYV6xhJRETMzgpnID9
         qQh97yKH15v643lCnWOO3UL7ZGchmcWUcGldIvbzqRg2ihpNqCzE0jMFNYBYy8BVKYgN
         IA/TYraCZJu2N6yK8tFrKq7njMfjFVEE2pEeS7Bz1YnZcVFe/DE+y0MibvIAzB7jl8jh
         zlAwJhhevp7JS2/jbIT62linxKl9RI9qgpzN7h1kYm8yiaPHqr1aXgWYpfPCtjHXVbh0
         8dRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTkkMTG+WFiac7vzoHdQEa47ObtePNcBfbeFoVaj6yMiNAZJ7rj3PdCrWftVhPpxOOi1/85LlD0+b0Dx0uZ8U1RawT+FpMRz4P
X-Gm-Message-State: AOJu0Yx0Tvn3UQDJUqRxphZmK8Z9JJrY4glATwYuGxh69K0TNPp26vjT
	xRO+hvXsNpwgRqGpNiSwTfl+Nd+Gb1eVTAnpX/ddDUhV7u5mDWPNkM7u16rvh00BnUIChp4TxbT
	x7PgwrRdj8icBX2uqAs7ZMTD0YYpk+sh9JYMTew==
X-Google-Smtp-Source: AGHT+IEigHxfdu3Sh5IlyKpDafnA1zAw4DSQNtZfWejv/aZ9zNxq090wRE2n00r1tIubWICmJpip1//6zCXSEBerIZY=
X-Received: by 2002:a25:640c:0:b0:dc6:cbb9:e with SMTP id y12-20020a25640c000000b00dc6cbb9000emr10783156ybb.41.1712056627317;
 Tue, 02 Apr 2024 04:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com>
 <20240402103406.3638821-4-quic_varada@quicinc.com> <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
 <CAA8EJpo=TMhu+Te+JE0cQzmjLOTDPi-Vv-h5Bch0Wfr_7iVi2w@mail.gmail.com> <ZgvlrbvvPNA6HRiL@hu-varada-blr.qualcomm.com>
In-Reply-To: <ZgvlrbvvPNA6HRiL@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 14:16:56 +0300
Message-ID: <CAA8EJpp2dgy0DcLoUuo6gz-8ee0RRwJ_mvCLGDbdvF-gVhREFg@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 14:02, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Tue, Apr 02, 2024 at 01:48:08PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 2 Apr 2024 at 13:40, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
> > > <quic_varada@quicinc.com> wrote:
> > > >
> > > > Wrap icc_clk_register to create devm_icc_clk_register to be
> > > > able to release the resources properly.
> > > >
> > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > ---
> > > > v5: Introduced devm_icc_clk_register
> > > > ---
> > > >  drivers/interconnect/icc-clk.c   | 29 +++++++++++++++++++++++++++++
> > > >  include/linux/interconnect-clk.h |  4 ++++
> > > >  2 files changed, 33 insertions(+)
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Wait. Actually,
> >
> > Unreviewed-by: me
> >
> > Please return int from devm_icc_clk_register instead of returning the pointer.
>
> Wouldn't returning int break the general assumption that
> devm_foo(), returns the same type as foo(). For example
> devm_clk_hw_get_clk and clk_hw_get_clk return struct clk *?

Not always. The only reason to return icc_provider was to make it
possible to destroy it. With devres-managed function you don't have to
do anything.


-- 
With best wishes
Dmitry
