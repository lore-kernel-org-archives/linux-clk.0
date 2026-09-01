Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FD9343883
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273013; cv=pass; b=lkMW6/4OcegvhCVHLfCSAJ+huBb2Gkg5tMD+4DZ3csecMw/1XNbF3BECwMemwj7EXcmhYN6MBgc8NI6JRHMzoJ0Xw34fClhKcSoQgfWcGCzz3xZaUzN68BuWCsJ1t6JOufvVjjrPHXMtyZc7ZFX51lDHt7vF6ld8e5QlzgU9wrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273013; c=relaxed/simple;
	bh=hO66QjvFvGCV1TK4yqeQYuxk+Mmmppj+GGDoeW2H4xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VpNFc/Sz9BjkMHqr/bNUdwegPmlcRdXd+5Ne9+7QHQsV+CJw8HQ3fTPTvddVFs3t7tQL28XAZSF1PUsXvNqwLhgroG1qpS/uK0aBvYxxja0hH6L52DyywI22BvQqtiSbyyYFkPcjX5UWSwZaTqnDPLg0W5zBbcS6wNp7KqYSXkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8i0PAXA; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8i0PAXA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a611ba5130so6935798a12.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 07:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273009; cv=none;
        d=google.com; s=arc-20260327;
        b=TtOT3NLql/g8o6zdnlXzNmdf46i0L9b41x2W3lIjMljpxaqMtfPnOt9AYupOrrn0P5
         DzAbqnduuLYWWuJJqILEsXO8OJUjmgVbQE2Os+q8tBto5KqBQl4ypFeFf4nWhJkXtFEB
         ij+Eu6d6x+sLRP0xNEQmqA/3eJo9LVGV/UK06QIUbF6+XKmSEJ+UR+wmVVlNwj8cO88e
         GM6JKXeb2OI3DArvryrJEv/cy7wFnRVxr2LvU+r1LR0P04eGerBW3qeVbf/LaH/RsWid
         1OelC3AJSevPZ9yz/aJ1LlMQZCyZFyYEnmCZ27JiecCJyD3ou+c2+b5xG4arepLa7xvU
         /RYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        fh=J3nyTfQ4tc4MTQNBABgKfmiqSc2/mJoFyUJLGcERg5o=;
        b=G/9AuIIfSQRrLo2h6At8+EROVj11qJ4xqNxXpNaMJruNT0UV/wRpxyHNQ0VHqNlyC/
         kQLB9tmVF2pKwYo/K9cJK17lCJtWFP5uLTe/dXpQlbSEGz+JrDiGXscVYRKDYzanXTIT
         oQTONdxFP+FORoZeprf7TyRCrS9SKlik4B3oEgO7vypPZS4d1aVSz9B7sMQ+oYzPhot3
         FTKWkEdXeXVOaLu9AC8QGGaUh/UtVE1Ch11bA5o7si6C9ZaTT2zd9qUFw5mW9YaphpfR
         hAg58W6amWb1HHz4+wrRFh+n46WcLO03408NMuN3vJwcuFNuvyV0NrFLRWVDCFEHbZzO
         ml8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273009; x=1788877809; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        b=G8i0PAXACK+x6b7YMOSSEYqE2ah4sBav28gW8nzr517OMaqMhws4nSJOpQNNmn7zW1
         wQ0/a8VuGvLZTL6b+2OBf4bupxWVabAFolphncNoqCCQU9gtffm8iGSAep3sG+NJWy7l
         gyQLjWQUeNNL3lccKQ6eBbjTtkBycAD6f6cT6ei6GTutS1eK7Drv/VudGrJdjcEeE2Jb
         ii0TUU89Ne4TkN5HNaD0de43fZSand20o59WVIEEAWSH6kj9FunPEkcA6MkOQmqpRNsk
         y8rCYtMIXWe68PRx7aDWHhs9b5jvmRYqEJGx9lhOqmgDRIt8luOtxljjqwfWqJ2Vtc/o
         gsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273009; x=1788877809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=81FUhWMTlJ+wMcQRgyjk2bEtDAqNufgvrwMi+leycFs=;
        b=Y+LPFaO3fZ8/uF9xzqjFPxnFnwJ3niGwhMFObZoaC+FWyX2HuHpiPjk/cmiLKiK9ul
         l7hGaggC778wps9JxPDChIeHpbrkKYaM03ISWHBvIs9UBXst/IA0JTCNWFqLBvAQ8ORR
         2GSY9kQUlzzm3oP/9Kc0iwrf5Ce5IGkR+KiHXTvb3fO9lnzqRnXQA9q4M47wN+qomXoQ
         Mr1f9dJj+7ibgIeUCFwMR9Fieu3G+DMbMf8xDVUrm9NETQ3c7X6cwY9tZ3a9EgP3EgkG
         F5n3XZRxGfoa5C8zW1damjzeLlvit/ivlIQCERNOx0OyB0zXBeZfTMcWEoEapWZWVjVz
         dtUg==
X-Forwarded-Encrypted: i=1; AKwUvBxerT22WjMmbfr99SV0FDTth+z43ePbeAW6cPmymCbOZK5VxrccfwOmvMWO3ZfLBqifnvTJysoIDhg=@vger.kernel.org
X-Gm-Message-State: AFuF++kcNFSxlyKP6ZGW1crEuNeco5xM+hwX29H7nnc/7L+VuVlxcPv5
	xVc3gpfff9CmgtN5WLxDkeM7Duc2SB7nuhSRSB0lmeRBUF9Exi/O+w8yZfmKsPumcBPnI83mbg8
	LplnJ5No0votyNZVfVSRTeRp2HrIn/pU=
X-Gm-Gg: AR+sD136ItNjsTVVlRKNhCkpitsxvNwvFXnLid+2yWxVRb8NJMZfyVmKiJfbIKanQ/o
	l9v2yZ4m4xHsgbeTHPx8oC/ZruIL4o72Tj4lXgkZemfhPrOatPii+LBblQpCYNhvps+ICRux13a
	PY3boEkwcQVfcQQ3cTwAlitr/wylvsgnZZ3jy/QWHPkgOibKoYggMCf+6x833dMetXfHEz2NhlF
	LIC/R/i/NB+yFo+JAjc42rZOSGX1cZj+A0CSNOI9eonzeFZu8r287uPkAfbqXJUX1lyEhL5svBX
	oJl704AfN9LVOCj9d5rkbWPNLmnp/kuGLx3wKzRq+u1AtQpr6EE1Oco1FQvx3y2d1dt2G3N9YIZ
	Mk/pZcPmfNlSs6cfggAjEr/fGSH+4FqKQIJw=
X-Received: by 2002:a17:907:c1f:b0:c16:12ff:dc93 with SMTP id
 a640c23a62f3a-c25b3d6fd4amr496747966b.18.1788273009053; Tue, 01 Sep 2026
 07:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
 <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
 <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com> <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
In-Reply-To: <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 19:59:55 +0530
X-Gm-Features: AcwNN1Uomn3Xc_3Adcsk8DWFI-MLIGjMbU2Tt_GmbXn_JHJipzIc1HtCVCNKh-A
Message-ID: <CAA-+uk+orBPf3uCpwyC02Wnvk9mzChukO494wuPfu2r5PpX9dQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 19:51, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 18:22:34, Sreeshankar K wrote:
> > On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> > >
> > > On 26-09-01 09:24:35, Sreeshankar K wrote:
> > > > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > > > SoC (internally codenamed Lito).
> > > >
> > > > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > > > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > > > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> > > >
> > > > This patchset is organized as follows:
> > > > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > > > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > > > interrupt controllers, clock providers, power domains, and reserved memory.
> > > >
> > > > Dependencies:
> > > > This patchset depends on the following patch:
> > > > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > > >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> > > >
> > > > Changelog [v9]:
> > > > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > > >   Make all clk_init_data instances const across the driver.
> > >
> > > You sent 3 versions in less than 24 hours. Please slow down.
> > >
> > > Give a chance to the reviewers to have a look at each version before
> > > sending a new one.
> >
> >
> > I apologize for my actions. v7 was the intended new patchset. Unfortunately
> > there was an interruption during submission of patches, only 08/12
> > patches submitted.
> > That's why I submitted the v8 patchset.
>
> Yes, and now you have sent v9. So even without the v7, you still have 2
> version in just a couple of hours.
