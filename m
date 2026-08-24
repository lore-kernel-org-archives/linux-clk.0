Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB02DF6F4
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580923; cv=pass; b=gAG1c7VCGAkmxnQEtd7bygVR5LOWFKCL5rXNc6ne76fxEeaP0Bu34vJ6V+LsSwIrY+Uq4EfLQObyOFRNRJwSYt3DVMwSo0ggKcHblcQzubMGXW3skRiQ6uwA3WikBQNst4Mh+dQC7DBYRqMtab5jC2KyDOou+slG8djDCOOn1lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580923; c=relaxed/simple;
	bh=0kks+j63StSPlXTF3OV31d0II5QMTMM20avDv0cE8Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7cW2IePdEYLSGCYPqdUNT9whALU/pd0s2edSIgK/2lR/qTZ/XICz9Tpwg8iAuXpc8QGFrqCj0Ak1SFtyfGvKZNK1pcyuXd9QC0PJCP5WwU9j+VjUTlYMH8Sal3z2S6sRMK0kbAafSvcRJZMzPx4vxvMQQvvJ96+AqxIZvDzP8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDGJJ78F; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDGJJ78F"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2020421077so602080666b.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 07:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787580919; cv=none;
        d=google.com; s=arc-20260327;
        b=h7uaNgsVCyjlMttvOzKe3ssyixuq7xsfc8zB5+Bq8/mEKngtQp2W3AcscjOj7Yc69z
         VCgiWxBjJ8NeI+3cU4O/Wr+Ium7N2WBIY9xJ2LituXImzUM7dAvfzkaYXfwy4ymF71kn
         +IPLaFHjH9mHazZONwSUOpZiYyJF/Z2ngNYYAG2y1M7wQ7S0WxlFJsswLv1W1AxY1oKa
         QRw156ZeQeHHN1UGzpw2K2oMpvYDhTlx0Vy3Np6YKy4QzSM7/b5nUJL3Tlr+BuWYMfKJ
         fIH4af9bfuW08xhffvr+zO8EnDjMTOU+YVUcDAtUma9tPIFdxAGag9kOzq1HN47mttE0
         4wCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        fh=oFlq0lO3L6YUZZf+eJ6DJdVj0gbi1qdiAx0unLa0uJ4=;
        b=lOpgKyPmOV9LDQTYJdcadtAUc50tBJd6Gnu8TMTqV/pAPgiGRRBLpyh3x61kyPvIAU
         gdurjBwA9Q/N9H4hdsS0msxVBE7C/FszlY9oj0OoYU+5NEp4AzriqPCtBM8Zq7eTDwxt
         c/t0V4Ek5hAXNvvM9NtMiYHHOeSXYAPi4oCy2vZr3EFNJlFfMkCQsJYlca+Piho0tdT5
         mEVA8evbhS2oZa+0SOiTkaHnyB+yiyIy1eM8ow65O96g1KMY8qB3Oi+vCkhWcu4y779N
         3yydyBkavLFztPCBLstBKT1GJogg8XTEi/mEF67PqGIAduh/vxNWvFYojYOrj82rZo7Q
         bHfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787580919; x=1788185719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        b=IDGJJ78F3Ipc9tB0nbEffHy2jfdT1CrCCk4hIeHeL02LxT0clK4aILUCWwf2BolUbr
         wxOMh2hBeW+7aJ1e9wNd3P+Hn3H1M773HuZi1a9uORkh3kauQNk66E9VImH2UnISY+du
         H/zJedVRgM0APaG+w34ig2+9rvrfyHyCf8XtBv1mh3c1umdjzmjBsmHQ/0Wq3Qama6ff
         +xhTGOqAbKhkOiWQm82qhjQqy+ls6ciwXytomojpFytyOWDJyFeSar4DdF6CyNrRxpgz
         x33NlK9pJkVxTMVNaQzeTtnAgtlawn8Wze9sSXH2KsQgydBZS2VbU7qbClJljw6MIkgM
         wNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580919; x=1788185719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        b=rgBJDt2SF06MLYHJriU7DwzsyHZz0bmPF26Zp5U0RcswvugqnR6VkiXGiyNf6oW50C
         n1GqCH0itUEApJ56iNqy702YCy/o5DY6oGvomQjmmjeJbHyAP53McIIuIYj9owTmJbyq
         T0sMsKu2/zBpc+Ih5o8uL0yEZmKknM8XMGIFaW75ei+yYPsJfy85iLKQm6/5KfxL8MO0
         GUckWZikJt3j0+Zn59SZZHMcdskcY487hmpQKQ2o6aUl6efesaPCZhvlRzRp/r2SQ7NW
         OQQ1t/5PSwgszc1TkEn/IbdPnJKnsGwYmQ9VEmYBpP8zL8ZWvxoKha98fDIY6356UbHR
         aMCw==
X-Forwarded-Encrypted: i=1; AHgh+RpIH0A2y3JQ7gpszBySyhYYz7fz/8Zh3eAFNwPFN/BARzedOZOd/A3aWwfqTtkbp846e3VS6xGxH9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++krgnw82MraLlciu7hpq0w6WAZPkOwOjfLdPFthWyTxk/w63a3p
	wYjXGYTo9oYsFoK/K4tMeIiXQE8+INZD5ELKis3HkjL4DF99Sv7jmI6FHWWjSjgBhLbtCSSKX91
	bWNhijgv0kWVISJ3U01IyJLE4dRfmwxw=
X-Gm-Gg: AR+sD10eD7Xaxq4MQzZn9utRt1qyoypTXKDavAREBShXO5RcrkS2C9ouiELqG8TGhgL
	wH39k+admy7FoNSLEdACwd2d4nog/44he1ewIbqmxYYTLTB9jyIbH2V2IA9EmCtzKc/xXuS6EMb
	MVe6gq+niwlb6zEXaq8w/3iYnS/Gh39C7cGPTT0YT+XH/UpeLOX0pwzReArCYmzQRQdaaeNknAs
	AkNdVSUxln4naUx1+D26UKTSNfRjqFom/I+dKXb/L/ugqplNENw/VJG9JkaR0X0ucmUXlcC1QaM
	3mVEBPXuBNZ3IjIfcANN5byEd7G3vGSt+/hJJpx39RJNIyjot62B+LeGGezybVettl9FrUY50Py
	naA==
X-Received: by 2002:a17:907:3e9d:b0:c20:f4ee:7c97 with SMTP id
 a640c23a62f3a-c2491c2846cmr2216363566b.5.1787580918870; Mon, 24 Aug 2026
 07:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com> <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
In-Reply-To: <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 24 Aug 2026 19:45:07 +0530
X-Gm-Features: AcwNN1WcsnGQSHLRyuZJ-yHONrPiOQJH8iqD06u4L2i4WB6_vuJbh1UpdH1J-_0
Message-ID: <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	lpieralisi@kernel.org, taniya.das@oss.qualcomm.com, danila@mainlining.org, 
	davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com, 
	linux@gurudas.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

Missed that, I apologize. I will send a v6 patchset with everything fixed.

Thanks,
Sreeshankar K

On Mon, 24 Aug 2026 at 19:21, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-08-24 13:04:28, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  drivers/clk/qcom/Kconfig      |    9 +
> >  drivers/clk/qcom/Makefile     |    1 +
> >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> >  3 files changed, 2285 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
>
> [...]
>
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > new file mode 100644
> > index 000000000..bf75c8ec1
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > @@ -0,0 +1,2275 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > + */
> > +
> > +
>
> [...]
>
> > +static struct clk_alpha_pll gpll0 = {
> > +     .offset = 0x0,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr = {
> > +             .enable_reg = 0x52010,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
>
> You missed my other comment from v4.
>
> const here and everywhere else.
>
> It is always a good practice to compare to other (older) drivers from
> upstream.
>
> > +                     .name = "gpll0",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .index = DT_BI_TCXO,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > +             },
> > +     },
> > +};
> > +
>
> [...]
