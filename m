Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172850;
	b=zf/DQl/XFlFBVk43tXf76usouOwebe+gtT1rGV8Dh2it60zkOg/4XiBoyMzI1fabwkhk
	 oHQ7FK357ncqeD6s77Qk4dD3b5X4WfkevCwnkSWkmNuiwEanQgADEon9jko6j15DxjOBB
	 fptvSRTbSBzGklYHgd1HBSsaBNORnR+hiwLbBZcs68XFD6kq5//K09Vf1L+XcfUS10uOE
	 u6lNKfkQpiAMXAdQb+H6bAOpVYr8+eZPdVOGhANuXYFyTGN1xaHKw1e7ba/kOS2pTvwBu
	 cDXCeABEYviM+FI0xDA8x9iLjLrbNxo89wHbt0y1l71F2+5M5if7dQxeMV4quNRScog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
	b=fwi6oc4jBmKbYEIVOOdbCBhMnPmcKn0zfU+QxcYeBN0EdQuuctvN5rsuwwOmvPKnwaUp
	 pb7IZ/w1bPPShqZAFSTeDCcLRKFk8GcOLubac6V1aED9N6pyJ6WGLk5NrOZfoTNxIIkiA
	 eoqoB8ZjHXj/IKE1A5tEYDbUtZR1ztiDhOVJfhrkyylmNXN9nIWfGoKXi55n1EgXdD9nr
	 0NQVIEuydnjU4i1xy8iDx4CIix/YOy+LvBrJmVNhE6+uCKn0EIH7s/S2FO1npe7Qu+Rx8
	 gR0IQfoJiYL6kY3P6jJp3xsAuo4XBUxW8yny7gaPqh/OyK4tVrFBdST+Y6pzyZfSBlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yXseSSBw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1F60A2616
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 11:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C1F60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yXseSSBw
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so772501a12.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 03:07:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172848; cv=none;
        d=google.com; s=arc-20260327;
        b=O5Wa6GrH1besr1FCBJZiNEPH4mGEM8G7wweMMBil2EpAtKncA6Vp4378CmWqGAiGfR
         IKJKAQajAta1Hg/AwmyBH8tB+b8fp93oPx4egjifMgCsUecL85cXnligauRsgAK8HEpr
         zzn4RfOcySymksJY4vgBocGLp7vQSa8y2SV7VnDg3ASn/jBzv/36PHi4pXqEa/nngGXL
         suI7ZZ6ZGi3m+K0/nAhW3BbJIkirJ8MPatT8DQT9ZM8CXuBjlDumq1wjXz1xrJbKoNqn
         dt1ER5k3XmJJfEYcp59eE5CPklLakx8GQ423riFKCVsyLtPI6XPlnbvkHtysoTkr8kTQ
         vn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        fh=SU5MlVMjAoXtzRxRsVEKUs4BFCrpf25rnkHBQqVLoGs=;
        b=GvAix5E6o3wM54A9HCfFJe7Ljc/8HjH7sMuvfh9YkkqndBNmDvNAkICgwZVRFxaokU
         i8RiDwPNCQP7i0eB/1x42vSG1hh+HYzmMUC4iMVjtArboquK0eHEwb9CLa6yxEV/bsa7
         Add1TfI+qGDKrWWXg3BFlvkRpjtkkge0XzHrcqGviWIAirxuCemS0j6rNj3abUkwwx8q
         Esl5Xk0kMMsPFHVz90p4lyNy9D/JKtnWTQ5dGlrSAVWxlAAawKpfQEKEW3mHCqm1g2mq
         kfqxnyu/rfnnqxBK1hqKkdSauy08Oh/fZZH+F3koYGNufTVgeMK10qdrD6dpGypPbKmb
         YHJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795172848; x=1795777648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=yXseSSBwL667WWeqcwc21yoPcofDc/e/i/a0eCGiiUIrolXJjf8p5oc5Tb4mc6Ermj
         bePnEkY54ZTwInl8DL26psq1wTSD/NFqBAe8CxTmiyBHp1H/jpU84o455nMMjQhhEdEa
         lA1XN4iqiRUxyl9I8P8BVP5yyGg+CpqVfPuEtVWUJ3GwjYCturtgNWaBIXKDoI27wRMS
         eZA2otDBZHbX3bSAsZq6wZS6p8uA816T6cXsXjW9BokYqZBj516ziReL7o4DVqv93sGi
         YtmqSj33RCnGt5u/8A4nKw8q/PDc+udI289bWFav1ty6PHm9KHhQlgCApfj082PM3uVD
         IKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172848; x=1795777648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vw1Za3j6nrNQlO8tUKSo+13HAPp3lg1xUs/OwXV+egE=;
        b=PQv6Jza0tYK2KI1s8Dis7pryuF97Q03VdpVPwYTfmYKfSnrWkjVrr8tR5JwH6cKt3k
         K7C2v/9x4z2xfMieAVdG2eWK+j176YbQLEJnJO5GaTO1q70xe50VSZNQ+E/pShdpxeGD
         eEXnLeE7xfKBsIUGuYKlXyuMTx9AO7lqsRXSVPXJhXJ84MvBKI7k82tK+NQ7wBFQOQDN
         AnqJWY4ZiUZMaIo6iuG9ekv6RUn64wi9O2c1JgPzLD7INvy7OEUX1Fh0esDhZ9IInT+w
         7iFBTIy47OqsFrU8o/Jap1aLzaUqTYEvdFdi2x8J0bsivSjEX3yZWVl9BMtLoT/2PYAf
         q7+Q==
X-Forwarded-Encrypted: i=1; AL+hErH5ySQr+5FN2C1OqJdHtIB9vB6uO0b81pLUHLHSpv1h1CYSXugIXnN/+9z1huKgM9aQmP2ATd8lBYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kdV+FWuAEkDIDlOxqDLUbiXOrJZi6hvgdz3IMkQkA0K8zUQno
	Z9RTsbbE0cNMgkg6NnnjRqcHpw7HXUOiTtutUloNEuYDZzW6Hdb+WOUpoWTMVz/w4bJG+mGveBs
	sKL57JoiJkvUNdt6qWmxlMjk7uaBe4bg69CyJSMXjiw==
X-Gm-Gg: AZFdTZd9wzTqZPoW+5LaWXtkz056e2bODeXizKwltL23UU9qZfIKtT10UGdbZO7K52h
	nrsXfLSE0ffjKSRurzv6MR2WdmUvtlr3yPanXrcSDQgcrxtbUVULwZqDQnojllGx7Lv9daTurrZ
	YGG4pluyJOM1oQO8wjbupXEmcB0ltodIUvljXHEx3Xo9bFnN1scbv8qYSZMG2u9sT1Fzq/S8IWt
	piSDcTcaZcaL3U8AVQafkXDBOrgDFSvLQvv7CMgd/8ASkTzBBQn8EZhbhd+PD7hXLh1tbhemnYR
	3Hm/bht6o5YdBVLvnt/O1vF0a+zZ7vGcKNhSgiG51NJP7DJlN33DLKjVHUzjzukqdZ7oZYJq1L9
	QIwT924CcYGRME+thNs/qqmEzN1YHz5BOivQWm00JeOnr0gcY7B5rVrNFUcR6JA2AElael8M=
X-Received: by 2002:a05:6402:3225:b0:6b5:79f4:8d52 with SMTP id
 4fb4d7f45d1cf-6ba37e6f806mr1953110a12.20.1795172848247; Fri, 20 Nov 2026
 03:07:28 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-7-raghav.s@samsung.com>
 <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com> <002901dd77d9$6ddef600$499ce200$@samsung.com>
In-Reply-To: <002901dd77d9$6ddef600$499ce200$@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 20 Nov 2026 11:07:16 +0000
X-Gm-Features: Aa3M54pTNJ_y_R-HLRUhtwnIbiMHdLsAfFF3Abu5bW9vYYJErrbwlv-VYU97Njc
Message-ID: <CADrjBPrO43A6XaVK7_J3-y9=bOsjhNbyf8KA6fmyvLJ0O61gOw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for pll_4313
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Raghav Sharma <raghav.s@samsung.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Thu, 19 Nov 2026 at 03:52, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Thanks Peter for review
>
> > -----Original Message-----
> > From: Peter Griffin <peter.griffin@linaro.org>
> > Sent: Friday, November 13, 2026 5:58 PM
> > To: Raghav Sharma <raghav.s@samsung.com>
> > Cc: krzk@kernel.org; s.nawrocki@samsung.com; cw00.choi@samsung.com;
> > alim.akhtar@samsung.com; sboyd@kernel.org; bmasney+clk@redhat.com;
> > jbrunet+clk@baylibre.com; robh@kernel.org; conor+dt@kernel.org; linux-
> > samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org; is.gandhi@samsung.com; ts.amit@samsung.com;
> > pokala.reddy@samsung.com
> > Subject: Re: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
> > pll_4313
> >
> > Hi Raghav,
> >
> > On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com>
> > wrote:
> > >
> > > From: Alim Akhtar <alim.akhtar@samsung.com>
> > >
> > > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > > pll_531x except for CON8 offset, so re-using code for
> > > pll_4313
> > >
> > > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > > Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> > > ---
> > >  drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
> > > drivers/clk/samsung/clk-pll.h |  1 +
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/samsung/clk-pll.c
> > > b/drivers/clk/samsung/clk-pll.c index 3d837bd74355..7b0756127306
> > > 100644
> > > --- a/drivers/clk/samsung/clk-pll.c
> > > +++ b/drivers/clk/samsung/clk-pll.c
> > > @@ -1306,7 +1306,15 @@ static unsigned long
> > samsung_pll531x_recalc_rate(struct clk_hw *hw,
> > >         u64 mdiv, fout = parent_rate;
> > >
> > >         pll_con0 = readl_relaxed(pll->con_reg);
> > > -       pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       if (pll->type == pll_4313) {
> > > +               /* Offset for PLL_CON8 which hold FDIV different for PLL_4313
> > > +                * which is PLL_LOCKTIME_OFFSET - 0x4
> > > +                */
> > > +               pll_con8 = readl_relaxed(pll->lock_reg - 4);
> > > +       } else {
> > > +               pll_con8 = readl_relaxed(pll->con_reg + 20);
> > > +       }
> > > +
> >
> > This starts to feel a bit hacky (pll_con8 register being referenced as an offset
> > from lock_reg). Is the register really called pll_con8 on 8855? Or is it called
> > something else, but happens to contain fdiv?
> >
> Yes, it is named as PLL_CON8_* on 8855, and contain fdiv bit.

If the register is actually called PLL_CON8_ in the TRM then the
current patch makes sense "as is". It just seemed odd at first reading
that con8 wasn't an offset from con_reg on this SoC.

Thanks,

Peter
