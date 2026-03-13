Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA7389116
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 09:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395681; cv=pass; b=mlm8ajFvc3kyI3rhnAHj7DMiXxggFKmtIgVXWELX0IH67hFMoGT8mJTxjNW/vromSps2KoOB9Co2jKAhg3XgIRlYVlzhJWGb1yRnrp1r97bJ7F0+cVDmqUSBbnWMLV0S4Yu56f8d798Ol1tNUSQUfnZcHGYXbUKo0AHdLby0BoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395681; c=relaxed/simple;
	bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdrb/CjuLMlBl+UUgU/SeNOdVI/fEcal+3A3lfBD8SRVci+fAkE3rLGYwYZDbwPrgzo73EKD23WhV64RnknZHJBf9SpdogEobwyIe041Ecn0FxnWxd/RJLjFQZaTw1XMhScOBvVcYpRFE3smowH9o1Tgy9q8h688037YEvF3h/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlzMQ8ZU; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlzMQ8ZU"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56b17c0223bso797269e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 02:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395679; cv=none;
        d=google.com; s=arc-20240605;
        b=bwG4ptEyipiAYpJWJTuRvU9hdFPpPFanBOJB5ptTUML4bZj5R5kiFgzR39mVyomky3
         7BqjXFsZ8+PB2UHN2lMMezr4YBXAWNlCSBSwwx2hkDaREWLuxGZnlihl+qTiN461f83H
         JYFnqmc+4CzK6XN9MryXFj6oQMSnrR3/tqNn8L2VNGUCi8VZQowhno25ecB1r8WK4Rio
         RJx7omgx1SeMuoBoBIMJMf2ZzoPnUYEtZSXayT6rYYP65JgapsvyorynKisVAX7vBM70
         mfvNNQ4uyx99mbJY6iw8u1TMCBTLjNfK3AGxQYEt04TliwPKXVGJG5B9FbhA58E64cAu
         h73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
        fh=MLEIkz/ytMAYuoSqZXpymRnQkSXnjh5DSRAnTHNAglg=;
        b=GJxA31FNSLI7A6g3WLXuAfF4Ivo98oxUMMVbO8shPokoEPxGflAy5QHBHu+0Z+u7FJ
         kfdhOAYDI04QkWGTKU0hucr+reHDXV3ldGTdKGNR91RaROzeXUcE0WSA67mt78TsaWQG
         1qQ7dz2xMBuCx2fuKniKi0wcks7JwAolZMB0uJ1qd5BZ9G9bVNL5cqj8E/xotkZ4iYBx
         oOyTdxLLHqEj8v8XIoEZ6mHyfDX6xr7/kMdRJmFEERlC3dCu0mZbu/b3ayltatcYAZV0
         w6usK+L1CckAAGz7Frj5BPpfzfqXZk4NflNdANjU9EqXZ81a+Vnq9cUEpGzm37a98Wi7
         9Oaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773395679; x=1774000479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
        b=hlzMQ8ZU7hV5rqi/LkjlZfiaq0Xks4Bl36HaUSGaEkBuDIxFWjE6vcLWMHZeagIh6P
         k4B2fOjeiUj3+JDnkpBcZVHrlgX6hq0hBOMICBzXuELU7TzxuBP96jRXV7NTXhzdSq2z
         pZeuHGlhFNeLBiEncF7x6IwYVMPH7oIgFjLOMyLl9DuBil4Q3L89o2KQi7fp96lRVI6r
         d7y6B0PekUivyRL979CIynL31avqcCO80TE2U/riIX4kI6yMyLo/oq1iB9/EY5X7sJwB
         mZB9JzoyYWm2/7TdxKlmduEa1sxfLBsKQyF1WM2D7X4Wtqfl+su7k8ezFG0X0s/E3Nlm
         G6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395679; x=1774000479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jxfTqxavhweb0aNd0r1ls0KYKuiW0asScKUixBQDaEU=;
        b=QhX2thjpDzZ5MXIyFm81G4WYMANhERQOAvlKQ1217bj7IFRRlRr1d/Ic81wa7vPpPw
         37DziXG2wQjMRKxFAnnvp4o2CvSjSXHCCWqdggUmkuiP49+gj5buU+fbwTGeDZAbifbG
         UHo/8xJ/Xv/A4j0SEGa3YsaM/HapUHIbmp+dWVgdozTFoPg7SwyMURzu+wnYqeQHCiVt
         N+Vtfz1BpyBxIxAr3VCD9hvG9VJtRpQfV6zzwE3HT63XicGjmVvpERZPPmRUVbJSPwu2
         yJe43beIx8hFCFkHSWYxgb+DhSCWFwlyiegNs3hmYpzzffOtmbRzYeyHpc6Y5kXCF5q0
         QB6w==
X-Forwarded-Encrypted: i=1; AJvYcCWfvkVCdcxdDSvrTbj8GTAK34VDpZ161fPF+5pM1DIkAdrhg87ziihDwm153NmLWAf6xsZCG8OuCgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwz/KUYuIcWMqT2MlVBYzyD+McfzWfj1ARBuAA9pMW+uPk6kQQ
	6oWnCSjgN5rcCnho9qwrcoZGbF4kXbFFFgKP+RN/866/UwEamVsY/U8sZ4+90TvziTCoB2SiFxO
	oYACedlO9e+23jBT1Wm+uTdFmqWHC5qU=
X-Gm-Gg: ATEYQzyjIEYzAS2DVZretnW6S8JP/PHCRK0kvJx0KiqBRdFKwhDamx+cgv5g6yiALMz
	+Ag6Plu/YvtsAcc2OsrZfaigi00pwoIw1RbNXuUlOfMo4OfLS+/Xvx+iHiIES9/ujnQwZuILIiW
	9crr62af5RfXzEUDXIBwEH75rJe8ywik/prqIwYf0xpd8ZIlcEwmIcH7/mXtyd4J7gtjrsiOi9I
	GDaPqWreSLHHf/pFpzqLPix8LJH1OamTd/9ZHB5yAbpKIBTB6IltJu2/AdU9dxp1TVSWuG0DPRt
	SRAnTBs3eny4nVcLRB4=
X-Received: by 2002:a05:6122:4b8a:b0:56b:5e7e:d40e with SMTP id
 71dfb90a1353d-56b6294ef35mr872151e0c.12.1773395678977; Fri, 13 Mar 2026
 02:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150152.90685-1-mitltlatltl@gmail.com> <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
 <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com> <d2e30b43-75d3-4c53-af26-4761cc093a56@oss.qualcomm.com>
In-Reply-To: <d2e30b43-75d3-4c53-af26-4761cc093a56@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 13 Mar 2026 17:54:15 +0800
X-Gm-Features: AaiRm50_vKWcJ6gfGL_kMjM6_0IVql9mtwkskiA_FF_ThWwG_j8-Q8jo-zNqJbw
Message-ID: <CAH2e8h44gt+eQ5hsuJAUCSRhok96jZe=9X4+uN=bt9etXav+4g@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:32=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/4/26 12:54 PM, Pengyu Luo wrote:
> > On Wed, Mar 4, 2026 at 7:20=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 3/3/26 4:01 PM, Pengyu Luo wrote:
> >>> Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> >>> Gaokun3, the image will stuck at grey for seconds until msm takes
> >>> over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
> >>
> >> Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?
> >>
> >
> > Yes, always.
> >
> >> The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
> >> node, so if you're unlucky with timing, this is ""expected behavior""
> >>
> >
> > On gaokun, if simplefb holds the mdp clk, there will not be the early
> > framebuffer, I can't see it. After seconds, msm initialized, the
> > display would show logs.
>
> I'm going to assume you don't have efifb.
>

TBH, I don't know it well. How can I check it?
Recently, grub works well and I can set a new degraded resolution for it.
On my x86 laptop, the downgraded resolution will be scaled up to full
screen, on this device, it displays on central with the degraded
resolution and keeps
around unused, no scale up.

> Is there a chance it's because simplefb is waiting for dispcc to probe,
> and by the time that happens, msm probes right away?
>

This is quite different from the android phone, where enabled dispcc
will kill simplefb.
AFAIK, the bootloader would setup display things. The display things
are properly configured(include dispcc) so that we can use fb.
However, when dispcc probed, mdp clk is reconfigured(mdp clk park on
xo), this will kill the fb, and it will reparent to dispcc_pll later
when clk_set_rate() on mdp_clk in somewhere of msm. (My disclaimer: I
am an amateur, this is only my quick insight, maybe totally wrong)

> i.e. it seems like something like
>
> https://lore.kernel.org/lkml/20220806163255.10404-1-markuss.broks@gmail.c=
om/
>
> would be better suited if you want to get logs early *and* you have a
> panel driver that works anyway
>

Actually, I just want to cancel the grey flash.

> >
> > Once I owned another sc8280xp device(Ntmer TW220 aka robo & kala), dsi
> > didn't work at that time, to bring up the simplefb, the clk must be
> > held and no parking. gaokun3 always requires no parking only.
> >
> > BTW, I can see this grey flash without simplefb too. On x13s, if
> > building msm as a module and not putting the module into the initial
> > ramdisk, what happens?
>
> Do you mean that in conjunction with dispcc-sc8280xp present in
> initramfs?
>

I mean if we can load msm asap(builtin or early kms), then we may not
see the grey flash?
So the things I wondered are
Do you set msm and dispcc builtin or put it into initramfs?
Do you meet the grey flash before the display shows logs?

I built all the display things as modules if possible, and early kms
won't cancel the grey flash

Thanks.

Best wishes,
Pengyu
