Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E912BEB8
	for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558908; cv=none; b=Uz1E8D/uvIbglWdgh4sb+AQ7SOaG8c4cksOEY/AVVgd0fRlTzeoY+3i67Gd2uMm2ig0sTjgRwm+j/2gNftJeXIP+KZXdnJoe9NwpNaj8v4KnhXmxwalj49z2dOS3uzo1S33xk8oGNV1LfClEEGA+Jum1RUCvjI0kkh8eKoS8DVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558908; c=relaxed/simple;
	bh=9YvOp898aubJjbKRrUpp3NGfhZc4uwca3cNw/pQSCCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKUb69AHpNzFMRQRcTEYOj1c9RZMa9SZ+gviSF20yUFVf5yDHg4GCesI29EzDmsVU1GEPfSw2ATG9nX5pxzobCXULneqtwPqu6smJKfY9ux7tI2ucrtGdiT1Pwq39FTlmzerYAeCh0er9mTTxxpTUvVel5h87oTS4SCzEI1UXrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0LPisQ5; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0LPisQ5"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60893d33269so5923227b3.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 15:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708558905; x=1709163705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YvOp898aubJjbKRrUpp3NGfhZc4uwca3cNw/pQSCCE=;
        b=C0LPisQ5cs0aUZSHutzTZrhKCGvRJYx6GAHbFM8yhqgCh6IHHf27rPvRvbu2wGnY4T
         LWjn+bSp3nzH+pOY8cG0z4GojUYaR2gMtZ3UEZojl/KFclPqmBzZJVMSxRL7bH5pHFDC
         xVXhKl8DQq9vCFnRaic4TPvonDPMr1iz8uSI8vn/+QEEOIGClyqXt7WMQyPWU2lLjNFh
         cZQGg5wL23mcsYd9BrjkNuFW/1ou0G5yWd8i2clTGVloWeyzThhoPoj+vn/IlT942Ly3
         fYmRbsTjT5ZarFMwj5aZ56L4HvBTF4JAc+JEC3u57vv1NwCg6RhNYp6ebHhIGFu4v05g
         ZxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558905; x=1709163705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YvOp898aubJjbKRrUpp3NGfhZc4uwca3cNw/pQSCCE=;
        b=AmvWvdh8c4DM+hQjh5ysPRkPAF6RsU4Hg6+5hGXA2YcpBcmSNprqntWJQWYm0h2iis
         uTuwue8MfTDM19T+mjvFsv1OwVoIKvltNNbqvHN/XFMXNLD2nEzMc20Myc81LoaPcYwg
         lDFMTCv+zaaxE2smI5TfDSc/mF59s2LW5N+O+4rEoG1aETpK3zHOp69239f9UypH+nE/
         KKHS61rIg5A+8oMC5bj3+Rm/XOZ6dUkOxtpLFD3LJkJzDYUQKucFTX+eEG/M38OoEr9T
         QG/mZdXrQcvdbcNJtrjBnZtKawETfNizkG4Yole/cu6Bbzk6S2pjNKtuUwUbJ8R8rloI
         HB/A==
X-Forwarded-Encrypted: i=1; AJvYcCXbfb/SUa6eB54Om/9Ez16P+hDg859/Nej0zjOtDDZeyD9RBll7HjmrcLFe+cPHXjt6lgSTulpXGX0Mejc0BROZDh+J+XbX85hz
X-Gm-Message-State: AOJu0Yw7x4XHmdo34jUBxNPE42FHny9EUYvcsdL5BlV/gLQ6vzXwlCH3
	wJFRt8Ped7WU9u9GYyKZFZgZgKcIjtjMSNZWWX5iE/nv1vw/Aez0zINsEiPU9nJ7JbOwYU69Vrl
	5fL/rwrI4sLz+p3Ol/eDXi5gSDM9Vtr7nn5tuiA==
X-Google-Smtp-Source: AGHT+IE7g3qCDVff+W/CzfLEO8l+1aNVMFbNxg2BUH5qBAPDXU0ZojYsMYxoP7Sq3tZtsKEdt3zrgeBOx0yZNKS1nfE=
X-Received: by 2002:a81:a103:0:b0:607:85b3:b52f with SMTP id
 y3-20020a81a103000000b0060785b3b52fmr20920543ywg.22.1708558905505; Wed, 21
 Feb 2024 15:41:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <20240216223245.12273-8-semen.protsenko@linaro.org> <8c1f0a4f-8a8b-41e7-b7f1-4c5a38ec7c1a@linaro.org>
In-Reply-To: <8c1f0a4f-8a8b-41e7-b7f1-4c5a38ec7c1a@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 21 Feb 2024 17:41:34 -0600
Message-ID: <CAPLW+4n6zA9=1ZswySPE7MmpbV_f99bi8OM9zawgST=XRDSyZQ@mail.gmail.com>
Subject: Re: [PATCH 07/16] clk: samsung: Pass actual clock controller base
 address to CPU_CLK()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 4:53=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/02/2024 23:32, Sam Protsenko wrote:
> > The documentation for struct exynos_cpuclk says .ctrl_base field should
> > contain the controller base address. But in reality all Exynos clock
> > drivers are passing CPU_SRC register address via CPU_CLK() macro, which
> > in turn gets assigned to mentioned .ctrl_base field. Because CPU_SRC
> > address usually already has 0x200 offset from controller's base, all
> > other register offsets in clk-cpu.c (like DIVs and MUXes) are specified
> > as offsets from CPU_SRC offset, and not from controller's base. That
> > makes things confusing and not consistent with register offsets provide=
d
> > in Exynis clock drivers, also breaking the contract for .ctrl_base fiel=
d
>
> Typo: Exynos
>

Will fix in v2.

> > as described in struct exynos_cpuclk doc. Rework all register offsets i=
n
> > clk-cpu.c to be actual offsets from controller's base, and fix offsets
> > provided to CPU_CLK() macro in all Exynos clock drivers.
>
> Change is fine and makes sense on devices having separate CPU clock
> controller. That's not the case for:
> 1. Exynos3250: dedicated CPU clock controller space, but we merged it
> into one driver/binding.
> 2. Exynos4 and 5250: no obvious dedicated CPU clock controller, but
> register layout suggests that there is such, just not explicit.
>
> In all these cases you provide not the correct offset against explicit
> or implicit CPU base, but from main clock controller base.
>
> Mention it briefly in above commit msg.
>

Thanks, you are right. That also means the .ctrl_base field (and its
documentation) is incorrect. I'll rework the commit message and the
field naming to the best of my abilities in v2.

>
> Best regards,
> Krzysztof
>
