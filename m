Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D83BB107
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267174; cv=pass; b=KMoYgynq4PxetHcPp6RlbWVNhf0Nl7uCcBXg13GYFP9gPhYFXV/FVFbxBllg+0xnMX6tiCUEu9TG1EVP1cKiQ3AHFGEfYgV8cZ0m/IUA8Kvc3VizhnpTuzfrnEK2fU0qD34HCwUbV/v7ZipBVJOYZIlxdaheDrsyyL0Ej+1ZX3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267174; c=relaxed/simple;
	bh=VG0JGy9V9Ess42oO7HJ1M9+yUlNIwa8iKwJ+GuLfhQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPaUa/voC3MHHMlJPws8njSIhFg2GwqbPf8B9A7fZPblN/GT9DdLVGLc9ud1WXMXawtKk92IJMxWCTDICY42TcORYvw+qmtw/ZfR4Q+D33sEPi8RJmP/r4sWGo7wHdqi+bJfKyITUEt8Lbp+vSRqExJR5MD6rz7hGEqNrtOEKc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APws7sjm; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APws7sjm"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so1466823a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 05:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788267168; cv=none;
        d=google.com; s=arc-20260327;
        b=KS3JsXqotlFXrRwKX2rZ7KmkmeotxdVNAsWdH7MxDxguDJOTNRmdLpMka1wYUCGQku
         SobKGUlQnTUuO28mGKX6Ps8/V3UbFkBBji62Lz46zunIeLebmUJuBj1iPYEQkmwtTTId
         4aYriRiz8TSe+A1EApKNsMjPk8qayWnxQdzVFj/qfWlEnnFuAdu9EWbOln9d7eN8KVFO
         J6bGa5/tnp57utUyc1LFImyB2QiB0SOEVTPlqvs9UMiz8h1BgQyXWBfkrTIgakXtjEAY
         KHYOTkheuWPj4rUMP12fVflAlTKSL0AahG/EWEwqC6oh36dYvvId3jjYj6LAnwTgArgb
         q/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        fh=xUY+Nn083Nijg45In98DohM8wcPmSsC9pBlwcuDOjPI=;
        b=OHZlabuMd6VEthPMTYUJHYRt/L2T/hxEosTE0IxM7s5Ik5WX5n+WUna/oPIjInA2Yd
         V4nlKl3zxc+dUwYOCf1HjVY9louuve3MMCtNKajhLHKiDPRWizoHW7ZoiVvHNz4oLjwg
         f8c7l7gsWIaKeGL97YF1jiIvLBtbREfNEx50n5Fmk2YWzS4JL1H+wQ/o3cZc+V2zOLZS
         pOdE6CjlvEcyDz5US++5KjCiDuMGqKGvfqkRLLrBd+B8sIekhkIZmg2iJH5sDrYMPxOv
         kYImUo+s9u2KpljpQFtQFM9LyUmF57pp7rte1hbvygbvtrTKi1HrB5yOy3segzd1a8r2
         NpLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788267168; x=1788871968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=APws7sjm7FGRX6eDqzMDTJ6cLbEvx5rf0JczDmKeh6lwitsuvAm68EWNBoHlcj9TZQ
         ryXUqotI5ZY1D783wL43Eqz9xwj2S9Ho3jCdeo2in8E+GMEDFdRa69LUAnc5UA2KwjzO
         HahJHGS0h7NSTdJ4fTQJ4AikeQWZihGAZwL7nEDnrjQNo0/3+OGPHFPoKh/R6H8v2k79
         YnnjDF3ZMrcQ9gfRiTmtODyPPoNCMiEcaDb/1ZIhjPr9an0sNK5/TgYfz8BsTOleITAt
         VAzFDN8mZUuUIqK6xijgMDpq5UXwiKPesyLA1o2p9BmtRoaZQ6OtUiOMcDt2p5o5Q7GA
         cDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788267168; x=1788871968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ssbA7eNLUxksYHjRqY8p3X4V4mfnV6KUS7EHrqUvZgc=;
        b=S2L6oCjq36tStJeT06ZGDHR8rCg/hpJqvA8P7EERyvsxOaTHjOlnJ3DFFZxcLLT/ko
         foV4oWI15woTFB7V1Y70OV5H/Bc4vmaQT7oWv1kESOvF8zjcAujiomg3YJywhrMeHRZV
         /Qq3CP/xk87g5/PrH8AFOFndmb0/wsTW97w6pcKPMkQFbui70X5WjEcRLB/tvpCgZFsy
         i3aVMxn7eKzEPc7H4hkINVQI3jQfe63YtL6vDFWDSL2eLg/SoeZg0BYjWlz0yMTNXk+d
         QriR0ZycWh/qMbdnJ/RWh1kTyXNEu8cXuPKrPQsta/HKCprA6en28Rw+c0HNrPR0rWNG
         I4Vw==
X-Forwarded-Encrypted: i=1; AKwUvByL8ZgaKGSKRHnCHaidBbJec6/tUpov9WKLZyo29gKwvY6c0XY30zvkJ+eoHHGSbUlZPvIH6SW9RZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++m0oHkRWr36LQ91UxEQYLvhYpGFSqu90hSAb74HzpkfkAR+Ac/Y
	Hov/PmEMt0QXabbTZsFBoDpY8rW7RTVWIAZAgrFKsodQhVw6W6ONLqfa45t1v6kv40H1OBqMak5
	mQZX+uk15wDV/Y1tO95mObz1x/JPrNnk=
X-Gm-Gg: AYBFou0BUYLb19td9TC8G1mnKCLvYRiGsMxHXXbXvHUgtumEYX9WBu6CMTWSNQqrslF
	VNpkrpRYb2v+cjDqxVprwg3tHFoBm7MPA+B2BoHTtCJPvnwohFCB9XUXAYHiYybHCijViQx+orU
	P7ecsl/rzk79LDcqePM0mAlBRvLsyPM2fQorigS9F3d0Y9Mm860deO3SFZxHbdbgxrZy9seeStA
	RxpQs5zx9pY/vvWK/XNrobPEJZnYQbawrn8wK7PKxLr28m8+lc1oawP0Kn2J/K4ReRhpJjpzU8n
	HQADVOi7TrKpJZYbyoE2YvwuRMPv8Q6YbOlhtsErbT2ZkIlgsbB76nSZcZ0wOKZhvXepKTnQaMX
	6rco=
X-Received: by 2002:a05:6402:44c2:b0:6a6:32f6:c with SMTP id
 4fb4d7f45d1cf-6a632f6013amr11282461a12.18.1788267168126; Tue, 01 Sep 2026
 05:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901092447.3028-1-sreeshankar0910@gmail.com> <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
In-Reply-To: <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 18:22:34 +0530
X-Gm-Features: AcwNN1U55mxl5Buv8KaT17jt0XFpq4P8gD6bW6R2dqKayvNk2vS1r-azwArTaqc
Message-ID: <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
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

On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 09:24:35, Sreeshankar K wrote:
> > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > SoC (internally codenamed Lito).
> >
> > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> >
> > This patchset is organized as follows:
> > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > interrupt controllers, clock providers, power domains, and reserved memory.
> >
> > Dependencies:
> > This patchset depends on the following patch:
> > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> >
> > Changelog [v9]:
> > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> >   Make all clk_init_data instances const across the driver.
>
> You sent 3 versions in less than 24 hours. Please slow down.
>
> Give a chance to the reviewers to have a look at each version before
> sending a new one.


I apologize for my actions. v7 was the intended new patchset. Unfortunately
there was an interruption during submission of patches, only 08/12
patches submitted.
That's why I submitted the v8 patchset.

Regards,
Sreeshankar K
