Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D70774262
	for <linux-clk@vger.kernel.org>; Tue,  2 Apr 2024 12:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712059938; cv=none; b=gf0EsY3MP3B++CtkT+96aNtX1BtQPNRNSFUcWfRUkQ0BBh/NZDPkl3/KFkxp8JdVs1UEzn33vFkp6ZmaQoVaCb9J0znrsEvfLhIP++YZAprtr5B1gf3h6K694qbN5LE0iyLW6bZB5SiExFnWFkVv3wwL+ao8IwcatAIPmxn3pFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712059938; c=relaxed/simple;
	bh=ZU19AXGy1gTKu3ZdKgEYCn04X7EzHEkd9RdcAo9TIfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrcJ1+Zit3q6Vpf8Ga38ypVr18ljRB95xUfwCp9Q6zvN1PIy3YGaFR8/406istqrODycMyQRxVhmeljETkqWAezJTZxzoDUVe5roDzm7j80OjHylVR1OSReU79mziyZomP/498CCCWmB/XWgr5OCD2+jxsOwm0myKEYSN5NFOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AcA7VeuH; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcA7VeuH"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-61495e769bdso18929377b3.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Apr 2024 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059935; x=1712664735; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=59+8zgH9nKJkFqI+MIO5KUM5XCs5xUxjBY89iFUie7c=;
        b=AcA7VeuH1lsru5Ic48tq2Mzw+fYeKQfYxFjlYwjbhNZqZiMZrNGnc49AfTH8KtU+0b
         DwDdB06Yx0nGgRNQr+uRvtwU83f8Hp8Q3YDSknC+GKmD/9yb6AB6eCA9x8viSNQueEZt
         uYM8BxMdZSBpD3/RlNksTZVVg7LbwVtnYBUo0fvBEt5o++7H3fmcd2+eG1yPEfDqc7T+
         1a2hctcRPBQCQPZ3M+Mo+QUefjmwhsdkQ3xpeXIZV13P9tReqlvrlhdMvX/0ta0IyCJA
         ipaVJnjftUGu38a9Mzynj+RSBpim/6yNCWqHBf5dNy/Y9Z+t1p63iXWoXgRy1kI0ZPin
         hawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059935; x=1712664735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59+8zgH9nKJkFqI+MIO5KUM5XCs5xUxjBY89iFUie7c=;
        b=n8jnJuCGhID1MCZUeS3ULFDQJ69sWLULZSgTdELOrUCm+jFMhr/fsPJknrmWsAFXmn
         Zv3Lw/A0fP+d7khbLZQPGbuFOUu1FTBoEO4WUU1RxtuApH8lF4hk28MeWZNcm8a8KUqq
         P+xQ6YG1qDVWi1JtxuSVjLBW1OD2DDXOr1h7116LMJcTGT6hxzNfX7oaf1dXlYFL/vbY
         lxgPhzd36/gQfTQl9KRk5HBpDABvRw1Laq1LMZDGVlMAXvFIhkCBgKQ3bd/OkgRde2wb
         zrO+gQi9AGHJ/pobyV6NIOUuQUSnCZb9ZC/mxURag1CSgpAk2jfXbKlzzGjc3VnWr8JD
         3W7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWT4ewBj3Qn7GLtzQ92kdHLIxbOoDKSY4xzvHIKzWFY+/3F8m6veeMHc4RaAr/ZnQHY97kAESzc0Qi+Smu6/hXMLQPH56vgPHvs
X-Gm-Message-State: AOJu0YwYdMvM++zxECOemD0C+rhJq2wOzVxOPVnO8PRweIvgQkCpRW79
	dwhToo5h974cIbtPjJJFQDw7qHIhNMQEThwIUzt69Wc2fP1OxmfUvM4N6PdOtZ5ROq25vX8Fkni
	JENZm0aljNnPDPArFI8IgFs5Qm4pQHI6mYrd0Zw==
X-Google-Smtp-Source: AGHT+IFkuZ7UzLaijf9AS20sbPh65/6NkxIIfNCV/NSfdOu3MxTu2vQNwQDFXF16gKf/9sOjZBiIcPSc2VfwYBA43k4=
X-Received: by 2002:a25:8590:0:b0:dcc:a5dc:e9d6 with SMTP id
 x16-20020a258590000000b00dcca5dce9d6mr10343762ybk.30.1712059935303; Tue, 02
 Apr 2024 05:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402103406.3638821-1-quic_varada@quicinc.com>
 <20240402103406.3638821-4-quic_varada@quicinc.com> <CAA8EJpphk_kqzBE7cKb73ipdpTi29t9ZSOOdSfq7pAGSs5NKeg@mail.gmail.com>
 <CAA8EJpo=TMhu+Te+JE0cQzmjLOTDPi-Vv-h5Bch0Wfr_7iVi2w@mail.gmail.com>
 <ZgvlrbvvPNA6HRiL@hu-varada-blr.qualcomm.com> <CAA8EJpp2dgy0DcLoUuo6gz-8ee0RRwJ_mvCLGDbdvF-gVhREFg@mail.gmail.com>
 <ZgvqkhF2mTG82Rx2@hu-varada-blr.qualcomm.com>
In-Reply-To: <ZgvqkhF2mTG82Rx2@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 15:12:04 +0300
Message-ID: <CAA8EJprN3TuMF-v5PeFW_JUKk+a+MxB7poccZbi9biZNniRnTQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] interconnect: icc-clk: Add devm_icc_clk_register
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, djakov@kernel.org, quic_anusha@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 14:23, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Tue, Apr 02, 2024 at 02:16:56PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 2 Apr 2024 at 14:02, Varadarajan Narayanan
> > <quic_varada@quicinc.com> wrote:
> > >
> > > On Tue, Apr 02, 2024 at 01:48:08PM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, 2 Apr 2024 at 13:40, Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Tue, 2 Apr 2024 at 13:34, Varadarajan Narayanan
> > > > > <quic_varada@quicinc.com> wrote:
> > > > > >
> > > > > > Wrap icc_clk_register to create devm_icc_clk_register to be
> > > > > > able to release the resources properly.
> > > > > >
> > > > > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > > > > ---
> > > > > > v5: Introduced devm_icc_clk_register
> > > > > > ---
> > > > > >  drivers/interconnect/icc-clk.c   | 29 +++++++++++++++++++++++++++++
> > > > > >  include/linux/interconnect-clk.h |  4 ++++
> > > > > >  2 files changed, 33 insertions(+)
> > > > >
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > Wait. Actually,
> > > >
> > > > Unreviewed-by: me
> > > >
> > > > Please return int from devm_icc_clk_register instead of returning the pointer.
> > >
> > > Wouldn't returning int break the general assumption that
> > > devm_foo(), returns the same type as foo(). For example
> > > devm_clk_hw_get_clk and clk_hw_get_clk return struct clk *?
> >
> > Not always. The only reason to return icc_provider was to make it
> > possible to destroy it. With devres-managed function you don't have to
> > do anything.
>
> Ok. Will change as follows
>
>         return prov; -> return PTR_ERR_OR_ZERO(prov);
>

I think the code might become simpler if you first allocate the ICC
provider and then just 'return devm_add_action_or_reset(dev,
your_icc_clk_release, provider)'


-- 
With best wishes
Dmitry
