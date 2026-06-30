Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B1A3EFFBA
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819165; cv=pass; b=ZPs+7GzS05N7iBRtQkXKE/tTtWd9Z/kJdfGn3uEr7AUI3baRSaqaVWNxcjRdcZkaAk1rYfnZDKQPvOPM3Pxv4Gho5PPnVXT122FBbGzA3xKLBIG6uhcJUPdrz/ogTXvhz4nH0a7s3e6f4mlt3MOEphNwIPKIca36H+kPKvlYZp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819165; c=relaxed/simple;
	bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3BLaJ80KY1GC050P1SiDzj5aYzVbMCwutLEYPyljPVfKoh4SqiCdji7mo/FdDLVc22W/800i1MJIuR5hFnw3RBBYc8uwo4LbaSvFkX5wALqnOX9iabiEysDjUN5n97LXBTXcBVsx1b9VQ3uLN5T5gmCb5yIgw8eFi6ts4J2meo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAdrWwk7; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAdrWwk7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-697df404e32so9200454a12.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 04:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782819162; cv=none;
        d=google.com; s=arc-20260327;
        b=I5ZzevwtsYjCq8AU8BHJCg+RB56R9Bf9yLeRZQpkRO1qNQUxLJPturS9hNRT+KfSlt
         /rSkW3S8ZLitS+ybgpK/O48n/jcaA0h1WPQibBIwB30xxTMcnJQiC7u8ArsHwB1pVjJr
         1AZLUgDBiO/82vxTs+EXZiS5NRggh2LZcs47SkzmX1VurQopCEtndPEPi4Ie9LfMHVJJ
         yevXuYkCbCliQkKG3SpP5YGZGEvOrYO6jg4uOkWyYICdpwt+wldCG+39tg/fNPg7XWad
         jTi8P/SQksdPDq3EREIA0MD2MQ6VMXGAk3UvkyOokB6g8rZpCmqXUUA17cp9SEMCJDPU
         B4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        fh=MvY2b9pvwDCND92B557mEEW7nGhNoNdf8KKQ17DJYro=;
        b=JINNN5DZvW+WX4PrMjWMu4DHPY63t7Yz2OzLw0ZfFAyrs3qrW0O+K7QzeaG9HzMzAO
         EtqGk8biaV3B+o9kxykrnaCKcVdcNpi0MmC1DqRImpNTtpKfiA1OBtSmllJ1kcK901wj
         PbDDt9ob9rV8WD/gOjo2Jaa4D1z17ymqw6JaGlgubkF21n7YNqD1zVbzV2F4eU4oOZ1q
         Wfr4jg+10xJpKawXC12SgBWWl7f1a7i/dVHDhwOZw/3etNPNZ/LOT8hQS/nAMLh9zT+X
         Cw9HYuxXt4Vq58cv7Ib6Zay+cM8uyvHPScPN0sUcXTwKcmct2+1mmu4N3n1sNapyuVsJ
         Lxdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782819162; x=1783423962; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=OAdrWwk7io5oRt1D+wBZo4XxKyRYhbS6Ga+h5k2kXwFfqO2AeuIuDEj0LSUzB9GBmO
         f0rD+mCzMfVr47ERrP4WOeHPDWE/5OvIxMOsExToiiXTfSzyUgBu/61t+i9xws+p/AKT
         SYputwV7kGbe5rmLIH4scSfPzUWmuuqHCZERoVqhuDXB62mou9SO+wABdItAa2iWKIRI
         L8lwHW6D/oGFXhSUkpJBpAQQIrqk5TyXnlQoiyExM5w1EPfb/qXpapYY+oZyfDL3MZ5z
         86VTfAf9aNOPluWsB+ZmlpXGGFTNsavi7owG0emKIdizUY8N7QWz+V2GRUgXVCPTXKjv
         Hs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819162; x=1783423962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml3S2a0ZylulO8bEdZQM280rooBXFC/9alJktHHXtFE=;
        b=VeW1PB1CaqtW8ldlmgYoCo64pRl0aHUsDseXVa87MfLbEN8QHEl0e56ScIIIOEJJhc
         Pk+Y2bvXbb/CKBWDTNvYFVgv+WehlXQQfg+5AR7jTw0H3nTrbXUmg58Qn4bq6Uu5JKn0
         0JPlLa0Dyq7Hbz1kfTF6/4DurMsVrgIdEWIK2VDbp99j9kKdKjlrFRHqLjC2mHLEyrKb
         SanFxFEZooCHtgUg2dGcb14VPEbOmdotmbrurHTLGNCTFyNIliGz2EIg4DaRrG6y46Be
         CKs9F//MIlgsVcdnD4F0ItSVkX4QdWvO9ioIFtVvASePfCMG8EqkXdFcJuc8N+Idqb+A
         rvxw==
X-Forwarded-Encrypted: i=1; AHgh+RpXOPuKM1cKHjwdgSrS/3Jc+OARLEBDBXoX5XnAoOEVhL6QteHD04lUHseRLEl9PS104cmr2Jl50ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LCDCRMoQA8g93GwjX485nX/3hx9lxqd29K1O7evKqWxQ4Hwg
	a2VDuV8BqoEYe2pUIXbu5IfKRSd7gsbKciUCzwESzUpi6jF5+Q8ANTlWalPn0IdVCVktROFs4ew
	jfIv+8hTZakitOMHplpRlhNWUjD7EgJLCEsgbqqhc1A==
X-Gm-Gg: AfdE7cnYNqlxt/LfCI411zsCItEpOfUgL7DiZc4QBP/+aXSHYHhD+SfKjB4skCVOyz7
	J24K7zNnVC83Snf+hhdNkpNVjJvcUvdDNbZAH9SASrL2Mo5pBEVukjMYWvGsxUxxA2FGKK3/8U2
	dw8bC8qY6EGxUx28g8eYWtDYC1FoQ8YyB7E/epeTB1s8p5jDRf7qAk/ZWEhEEgyEvCBgPGr09si
	FENZ5zr0YMPluuwGPnLSAzurNb8BaeDPLBd0B9hkwWNBmprk5YuCacexlxC7DoWOQwHsOz1dkVl
	Olf/wPhKm/JlsJoELGNrmxBteySXbw==
X-Received: by 2002:a05:6402:51c8:b0:698:3b7c:7e36 with SMTP id
 4fb4d7f45d1cf-698878ad389mr184057a12.32.1782819162077; Tue, 30 Jun 2026
 04:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
 <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
 <CGME20260629123246epcas5p2aab9da9ef417274bb0b70f74c386f7b4@epcas5p2.samsung.com>
 <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
 <0f1e01dd0844$01190c40$034b24c0$@samsung.com> <CADrjBPoZ4G09WGC_b59YWq3_EfTaPFyp0dD7VizKLYBW_eFk+A@mail.gmail.com>
 <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
In-Reply-To: <b035916c-e985-4acf-930b-bb74814ae748@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 30 Jun 2026 12:32:30 +0100
X-Gm-Features: AVVi8CcNxlc8aBvVUsFvxwtw-6b-XjIoK93AeruSemmptuSvFy4q0u1JGeOhNoM
Message-ID: <CADrjBPrG7bo1i6YcxuwNKnYmKF=d-MXXMWSNdu+KfF7hhqQMXg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Denzeel Oliva <wachiturroxd150@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 30 Jun 2026 at 12:12, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 30/06/2026 13:02, Peter Griffin wrote:
> > Hi Alim,
> >
> > On Tue, 30 Jun 2026 at 04:53, Alim Akhtar <alim.akhtar@samsung.com> wrote:
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Peter Griffin <peter.griffin@linaro.org>
> >>> Sent: Monday, June 29, 2026 6:02 PM
> >>> To: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Sylwester Nawrocki
> >>> <s.nawrocki@samsung.com>; Chanwoo Choi <cw00.choi@samsung.com>;
> >>> Alim Akhtar <alim.akhtar@samsung.com>; Michael Turquette
> >>> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> >>> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>; Conor
> >>> Dooley <conor+dt@kernel.org>; linux-samsung-soc@vger.kernel.org; linux-
> >>> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> >>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> >>> Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock
> >>> parents
> >>>
> >>> Hi Krysztof & Denzeel,
> >>>
> >>> On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com>
> >>> wrote:
> >>>>
> >>>> Correct eight PERIS gate clock parents to match the hardware clock
> >>>> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> >>>> default source.
> >>>>
> >>>> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> >>>> ---
> >>>
> >>> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> >>>
> >>> @Krysztof: I was thinking, maybe we should establish a new rule/best
> >>> practice for Samsung clock upstream submissions whereby patch
> >>> contributors should link to the downstream cal-if code for the SoC after the --
> >>> - line. That would make reviewing the patches' correctness a bit easier, as the
> >>> downstream cal-if code would be readily available to the reviewer.
> >>>
> >> We can leave this choice to the reviewer if they want to refer to downstream cal-if code.
> >
> > Generally I would like to, but I also don't have time to hunt around
> > the internet for a downstream kernel tree. My rationale was that the
> > submitter is most likely to know where the downstream code is, and is
> > likely using it for the upstream clock implementation. So, linking to
> > it as part of the submission should hopefully be fairly easy.
> >
> > If it is a Samsung SoC for which no public code is available that's
> > fine. I didn't intend this to be a hard requirement: "you can't
> > upstream x,y,z unless you link to the cal-if code". I meant it more as
> > "best practice/guidance"; if the cal-if code is publicly available,
> > linking to it would be a useful reference for reviewers.
>
> cal-if as vendor tree? Some contributors just base their work on
> downstream GPL-compliance dumps from opensource.samsung.com, so not sure
> how that link would work.

Urgh, I see. My suggestion kind of assumed the downstream vendor tree
had been pushed to a public Git repository, similar to how Google used
to push their gs101 sources, for example:
https://android.googlesource.com/kernel/google-modules/raviole-device/+/refs/heads/android-gs-raviole-mainline/drivers/soc/google/cal-if/

A link to a tarball for sure isn't as easy to just click through and
take a look which is what I was hoping to achieve. Thanks for the link
though, maybe that will come in useful at some point.

Peter
