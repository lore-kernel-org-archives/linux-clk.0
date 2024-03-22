Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92AB8289C
	for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711146802; cv=none; b=MICzvwn8QAt31tGsMaeRzJFE9vqxC77mQyiZmvoZ2AM2xYoGJ1VvpZZjN97oeucJde5CMfhwpb2EmE2FlouOGVCdEmHRfumsa+6ZMWMItRryPmA7K45X8ySkiXBENBqA+oqXZAU3Xtne72eyqIiEjwdH/gYM8i84poNChuNeQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711146802; c=relaxed/simple;
	bh=eqf3ihHx9YHmHJuuScJ0QnswcC+loLOYogzQd1XaHpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9gUbRTs6hHe/FRYhs/Xm+4+w1SSFnizSikW8f6b+CBrZlNAWnkoLt5e/jKhErN7c6VdKNttCXSMLvYQC1kAThJiAdNMjEPIy0AIxdPAVLyEn2lhL9YQ3LNQr8pC0EXTBVo2hM7RoneVBzq0ZBbROqCpPHoh75le7OGG8+sUEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EC1n8Imh; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EC1n8Imh"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso2689268276.3
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711146800; x=1711751600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ9F0pY9n/+igvd/03ZLKYicj33ULltRkxaxHp9S2Mk=;
        b=EC1n8ImhTItkTN4PavZIK4BRpWnuHsMjukmbTREwhMfKuGkMbUU1ObIvXhzPgXskFf
         Sjk0TPxH4Msq4lGSTPSMmSfpPwJGzLbTvg5OM9lG/fhQ+93MrO522fxc+UFfIEC5Vg4+
         SQ3RaqAwpUi0urIseuKGN5JY10a7dm6ZeugrnBdltOaXS+bt15yg6YmYdyu5T7ilBk5k
         p+d3kYZ3h75c6vnkv9vSwZqUCEy4oASN4RxFnrTgD98YdBh4OGXIX9DhJMm3v6+Cr4YC
         CNScVUlHIjpbZzz1kWfm9p5RUfuMFfuWLQ6/xImSDi+z79q59NzUPdQ1dhKZP3OBgPw7
         ajVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711146800; x=1711751600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ9F0pY9n/+igvd/03ZLKYicj33ULltRkxaxHp9S2Mk=;
        b=mSDYUALL+OyUDlIXVkoWcPlRTfAt0myJhPexsn+Uu4o9puwNjRmUSW2TANIDjm4ORa
         yzaRgI8BTE0dpWsr0hOL8g1xmcXLLVh7dm1KZkklcBTFysDong7LD6Lhb2rKoM/3QdzP
         28uVj+x0j/HseYvQ6vPo5lkLSWOWHW+AqcXT/lGo8MO+5JibgbdCB1/eKmcZ6wtZMfR2
         Be9iF1Rx+N37MzQbFR0L1aCGUICaKsE6J+5O4Wef7ckxgflWrlMKeZiwBhKaICOK8khp
         tMqFh7DCLp4qetz3/oNJPmqwr2z8oT3iABVbajMfd1OO1uL2VY9qYenklvcbgHHFD0Jp
         13Lg==
X-Forwarded-Encrypted: i=1; AJvYcCULlNnI+X9bbszLKYuQEgDllgaRg6JUjl1qzYxrt80/tEGU/GM6It1xesEEd6tYC2Ukwjkh4jzRiN+ZBT0V4dAN/5JCSREN2svC
X-Gm-Message-State: AOJu0YzkWbE2pSRgiGvk6fxuEOBr32NLkHzFtu9DXltyaHe9O7kP8wlA
	hqgGVyp7GMZNIyT2blFwah1/I624SJrIqmtmVK3I8FBUEtVGhGUgyM+GXsviiBXv+T3JSMG3WTJ
	V3U+Q5hc5fx77zc47hXpbhC3gtJeorrust1EeXA==
X-Google-Smtp-Source: AGHT+IHeqHvXyVTz47o9FkA2GJ7YHmI3n1DCfYkliY4NJgtd4mhyutbc3aVWnftbGu6jfh1yTN/kdnyTxaqt4ddPtJ8=
X-Received: by 2002:a25:1941:0:b0:dd0:2076:4706 with SMTP id
 62-20020a251941000000b00dd020764706mr576713ybz.31.1711146799824; Fri, 22 Mar
 2024 15:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321-apss-ipq-pll-cleanup-v2-0-201f3cf79fd4@gmail.com>
 <20240321-apss-ipq-pll-cleanup-v2-3-201f3cf79fd4@gmail.com>
 <CAA8EJprr4E1CM4f+eBzdRN41nm33xY-hRPQDn3peR94vLyJsYQ@mail.gmail.com> <ca4d85f1-397e-4c43-8548-436b9238e85e@gmail.com>
In-Reply-To: <ca4d85f1-397e-4c43-8548-436b9238e85e@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Mar 2024 00:33:08 +0200
Message-ID: <CAA8EJpp9jyCHgMSEBMumSz7xXUkMRm3wapjUdjzeOuJSpH5g5w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: qcom: apss-ipq-pll: remove 'pll_type' field
 from struct 'apss_pll_data'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Mar 2024 at 22:59, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> 2024. 03. 21. 11:37 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
> > On Thu, 21 Mar 2024 at 09:50, Gabor Juhos <j4g8y7@gmail.com> wrote:
> >>
> >> The value of the 'pll_type' field of 'struct apps_pll_data'
> >> is used only by the probe function to decide which config
> >> function should be called for the actual PLL. However this
> >> can be derived also from the 'pll' field  which makes the
> >> 'pll_type' field redundant.
> >>
> >> Additionally, the CLK_ALPHA_PLL_TYPE_* enumeration values
> >> are meant to be used as indices to the 'clk_alpha_pll_regs'
> >> array so using those to define the pll type in this driver
> >> is misleading anyway.
> >>
> >> Change the probe function to use the 'pll' field to determine
> >> the configuration function to be used, and remove the
> >> 'pll_type' field to simplify the code.
> >
> > I can't fully appreciate this idea. There can be cases when different
> > PLL types share the set of ops. I think having a type is more
> > versatile and makes the code more obvious.
>
> I understand your concerns, but let me explain the reasons about why I ha=
ve
> choosed this implementation in more detail.
>
> The driver declares three distinct clocks for the three different PLL typ=
es it
> supports. Each one of these clocks are using different register maps and =
clock
> operations which in a whole uniquely identifies the type of the PLL. In c=
ontrary
> to this, the CLK_ALPHA_PLL_TYPE_* values assigned to 'pll_type' are only
> indicating that which register map should be used for the given PLL. Howe=
ver
> this is also specified indirectly through the 'regs' member of the clocks=
 so
> this is a redundant information.
>
> Additionally, using the CLK_ALPHA_PLL_TYPE_*  for anything other than for
> specifying the register map is misleading.  For example, here are some sn=
ippets
> from the driver before the patch:
>
> static struct clk_alpha_pll ipq_pll_stromer_plus =3D {
>         ...
>         .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_STROMER],
>         ...
>
> static struct apss_pll_data ipq5332_pll_data =3D {
>         .pll_type =3D CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
>         .pll =3D &ipq_pll_stromer_plus,
>         ...
>
> Since it is not obvious at a first glance, one could ask that why the two
> CLK_ALPHA_PLL_TYPE_* values are different?
>
> Although my opinion that it is redundant still stand, but I'm not against
> keeping the pll_type. However if we keep that, then at least we should us=
e
> private enums (IPQ_APSS_PLL_TYPE_* or similar) for that in order to make =
it more
> obvious that it means a different thing than the CLK_ALPHA_PLL_TYPE_* val=
ues.
>
> This solution would be more acceptable?

This looks like a slight overkill, but yes, it is more acceptable. The
logic should be type =3D> functions, not the other way around.


--=20
With best wishes
Dmitry
