Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7E93AA4F6
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 14:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273078; cv=pass; b=RDACxNJEWSLlQzE352/OatrMqtjLoqLtdlAC/5yOao5OWtPsDeoMkK1SiHPwZEAo5GNqf/XDzERNHJ/sXg+JHAQb8XxKQCK96yowYAIOCUEXPpvbRfp+56/JTA/HMc88uawXk6acDQHpPMwLPolhOffoq6pjnaFYxTHzJmaMsGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273078; c=relaxed/simple;
	bh=5JCE49kjhVD4CKDJFuR7VYFhCbO5kEQuzu/oho0PrZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWQDW8ODMEGz1O220OffsGQ5W6dzP9XcJq9B2wYLgI3pcdM9OkQzBsEcqes3TFc2BHsZf9WZod7+FU/2WrxVli4ncOBpwMivmrSpvVg2V3KBfxrG83qEFPqqWJUOEFi+EOh5BS9QqSKa4ux3tFAPQWZw16Kp9UibH4ppnY+PN8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra0nvFJa; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra0nvFJa"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso127495466b.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 07:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273075; cv=none;
        d=google.com; s=arc-20260327;
        b=LsaNZ0E/qHkmY9QjZnMvFOBbJ+5z/AhR2Hi05nByil7+BuGuwtwiLMP2HLI7TuVUIH
         7n4shO+PgNe9qym3r/rBPtIgufqQPj13Y6137JoHIwkhaWuUSCySLRRP3jrv94/h4OmI
         joU5lqps309DNtRVPBTvEYDu4h1wBSkPCs+ApCeabfLinpVwnu4rIupthmdL3EwBZa8w
         +AhQGuuuCrvHSkxjAg4eQgZpnhCB6m+5hy6N0HZxsN3E3GCMOha43YV852S6+KuGkoNS
         PiuBHHi4X+KwGm/+S6cEqPEmdRjUaCdZyz3O4MUtMwW5jEC0fUthe8++YNvH0CuZxXQs
         53Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        fh=nzOc4RctTolM9YOjyB1BxJl+09GmBX6buj7dpFOv0TY=;
        b=qbUC6VdamR+sofSUz9h/4zQIAHlcn/U8YOfnY+H27AEY2Pe5LiZWJ3aE37cZTnZU0j
         HFBEnq00U6XBk9Rj3vVpBeB12anvbNxS9r9hIytKJPHcN7DMV9Sa2p4LYahWdP1euLPu
         0UmFpIogHFH7NYddctBvgPgieuX9lMRKnzaUvANoYfW+mFUK5AVZByEH1u2HE0Va/KAE
         O+nnHINOpj8qWShU2ScBBjV8aSwh923Fo7lOO6i1cjarH8/QfBANSH4DoLhSQRx70TD9
         0TIg+CvXf/SYox+oVrU0iJ33j32UchyvRvRttg8p/7gYSJaYb2R1MZZxvVVZ9Hlgws3Q
         USjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788273075; x=1788877875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        b=Ra0nvFJanSQ7SkN68JImzqcpaOmtuEL15S+/IRDIAVmT7x/rTpvhfH8yKuqsqtVFKq
         QTAFGWPmu0fk6JczX285Uryl2flqajJ9WjERZ/sJ2lV+/37uSniOxoXBndM4IzNC1tuA
         qsT5IHLkXCDt9/ay/2//d4DFVQvsjTfa6iufkPv1gLiECG6xcHMC3bQr9TJM6qWk+3zT
         c38gYxIM6UZqWUlrbG3EsJ22x8sQIeTTKseBWou/Nok1r5Vavd45oNMVu0ahoZ6kVzLT
         vhWEukICnaWe8mpItmxV6Pt7f0qTOFqAbEehcJgR6gt9gj0epqs/jljEU6JNsYJ1/NHQ
         adXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273075; x=1788877875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0lgToU+YU3Inc+G+YzISxuhKl/BOokX3QBBmgvrxTc=;
        b=UrdJmH4m+Xp0tT+S98qZ30xk2fNi4otdRmv1VZHTgBU2JYKyr/RGBPEGT1wgUNm9xm
         0HgYR575PhTBIaQYUY9ZzJGgRjCiBbDHc2l8Zq1aIVszvF6vWZPCkKoLGkImsDhyD1Le
         GLzOqSQ+1cYdva2A/J5uvKZVn2VItyk2jfPVVj4mdXEVMh+I/K2TGMVa76+PAi2NLDhR
         pPWTPG9Ya+Bq5sNZ3KYpVBUylKUtSvjVJbvG656bewdQ9N9A/gGF5/jhp/1jujKHRbB0
         Jvd5ghZ1TyQKP+sKQdTRzMSW+bG8W9jD5BqJegw71kEebRfCfQ57s2xdUJQrMy92CDy0
         Hszg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1cuF88JLlpQvcCLrkRwYVHcLQfThaJcV0oRycZVabLdufuWRe6Q7M1W1wG6Wpegb9IekEUJmC4kw=@vger.kernel.org
X-Gm-Message-State: AFuF++n46DS6SlyTufVWSuC20r8RSWf7uCPIe82PGhlzVgJASi+cdH3p
	POG9D7+yZsItL0XowoeVc78wU5VHpsksCh6eCNCM/m1tWb91u32RI0Wzb3sTPqDxi3Apqa5WBuD
	VYEwt2BdvLFtQ+P0xOLzQlVIBMn6N/fI=
X-Gm-Gg: AYBFou0XalzZU6mDde+S2xsDriUqs0c5pTfwJh5WM0isMWZ4Do2h8/jsI/sSmzXzig4
	6wa9oatJybLfiA76sXAyHq9gvTBhIjTquj54Ya24YFb9hjMLEKp3/HtMP7gZnu/MDfXJZwQk6ux
	5scGWFQqED5jg7pLDu8FcIYlpJIycLgcYcJmkmpOHDFHQxwebCvuaahpnHO4goyAKQvBLYMGpRy
	0BfgSe9k2XmBVHcKhJbnPbWSy8cw6yNNagHM14C6fLc0jGyZ+VqNC/0u3SvTVbGt92xIFjMlq6/
	CccMe25iYlmIgyR1716lpNeHViLA9FseaG6sWyN1eX7wRaozv4G92sOMuW/K9jPsfvk+jUVJ9qV
	v9AIVPTf0zscU+II/47NR99O+8Czne0aZI1s=
X-Received: by 2002:a17:907:97cd:b0:c20:1c9d:8d4b with SMTP id
 a640c23a62f3a-c2556bad5d4mr1984246166b.2.1788273075015; Tue, 01 Sep 2026
 07:31:15 -0700 (PDT)
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
Date: Tue, 1 Sep 2026 20:01:04 +0530
X-Gm-Features: AcwNN1XCELOPcPvrH8u8ByY6Rzj-i1F5LZ1I1noSysoUtzBHJi3bLNMYR8sODV8
Message-ID: <CAA-+uk+k1sy1oCu8KiRod_MHWOPDzpQiVnD184srzhSggYZETA@mail.gmail.com>
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

I will keep that in mind while submitting future patchset.

Thanks,
Sreeshankar K
