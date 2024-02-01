Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168CE12FB36
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706811879; cv=none; b=Q9mgwcUY+l/9W/8xyC02Hg6y+RYQrXdF+I7r7EmhFfVLKMLwKsP1SglsKXtFHWGJAfJNp/HU9IJH3Lo2+D2Jhsyvd7HdMC+yQW/3uSaiA4VQFg+LuOxKPfIBul2Qcxozau21Wwy9go+Vv8uF9d3U4wj0Mqh5tS23Aa7QnOkMWho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706811879; c=relaxed/simple;
	bh=WhQ0DzBaMOf2p0BQ0/iyFODtrdWQQm9VRmT+icXLJ58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzL6HM6eAJ8RDTakZWHNHuRJlPehWFrNq1EN7lddnpQq4+ZZs4Iegt2hyQa1NzVRLY6ZK7IobhbNWgBTtrUi4K7PSKbEm/L1x8qr3ChqpFgt9c+/gdhDx0fVVBu/5wsvABbtuKJzC7q3Sgdv4kgPzWrdnBgOZ7jsTYSuGnUPUO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S0MAZp+7; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0MAZp+7"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ce2aada130so1158752a12.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706811877; x=1707416677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUFcyRGjgFCHcU7TELJdpFaJ75t2Lcru3pbZ6VhQGp4=;
        b=S0MAZp+7aOh8rmNVAxqoRVgiAKNW/vVMV+tbEt2Yy2c8VMttn//g8P3YdS5o6LvPOy
         S2rkDPirq5BzfIfEdO+NWrXYCACa1RqscRTCB3e9fTlbOM/L0RUXxZL9xsfIOyvbAnN/
         sEjfVMUwzMTVgFag+ZGWN151m8sXac5+xIMGnWeRqBgkDoXXnL4Dhp3e1CamAdKkYj5/
         EIh2gs0uJJAg9RT8HbAJSKf7gRg2JvNujcbm/g3SRBgTl04g3R3r0VgSNamxSL49P9pR
         26RVrW4FZZ5Q60CxiRTnkFKC6gALILZtt44M5g9s2Elnw5PzwgWhfk0aJBxyCDZfo6Pc
         yh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706811877; x=1707416677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUFcyRGjgFCHcU7TELJdpFaJ75t2Lcru3pbZ6VhQGp4=;
        b=nNuF2xE6H6Y+nuElSrQ42uD6ZZ32gd4RUbvWCssgplMeRnoa2JPJRwoNxUQSxriOFW
         hskkZVSci49BfzqzMyd5wQrdQ71ErgnAMPuapX+ogYbombicJfGHvVZ8/IbEVqm/oyZI
         IyHV7/k3MAIUaUFy+0VRIN6rffcbMifCXl4Bd3TKdST5xdKQdm7alUsJsQCiamu6svee
         vhn2mPhM2MqVNzKeQN2aGHlSzlle8soMdepdEFX8QsyAepo79jKHECp61MqNwN9wrtf3
         ITbjx9BvYB1vgWITCgNUwz3B00NMUWaMH9F9hBHy+pzgMYFjth51ZYsHHAu0BrogXgXd
         N1jQ==
X-Gm-Message-State: AOJu0Yzolb44xV3dqwSSPD+zJZXcn19k/WMmhX5O1imSGAYcPvCvCfFT
	id4AR5ByA9Twsscv2x7c3PO2rvrNLp7Zbl/VVhiNpSoDQ/DxTH7gSmF1LFDd+qkGiFqpO91Cv/p
	0IvxIkLxEop4Lb4xmH7lUR9HtWu3QF8xx5kdtHg==
X-Google-Smtp-Source: AGHT+IEB90qcFx4TY3tpzYId3RpaXO+09NutWYPVOmVFBsoOrpib63SakvoAaXQt2ipdj1IdFncbrNePKi1xEbmWqqY=
X-Received: by 2002:a05:6a20:46a2:b0:199:cecf:9f5d with SMTP id
 el34-20020a056a2046a200b00199cecf9f5dmr5277395pzb.29.1706811877389; Thu, 01
 Feb 2024 10:24:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
 <20240125013858.3986-4-semen.protsenko@linaro.org> <170678377409.179918.13077326172475089482.b4-ty@linaro.org>
 <4c2c425b-3ddd-4484-98cf-3f7768c94e82@linaro.org>
In-Reply-To: <4c2c425b-3ddd-4484-98cf-3f7768c94e82@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 1 Feb 2024 12:24:25 -0600
Message-ID: <CAPLW+4=wsR=V+6vctf0gMzFVg6havL-M0kTDLLwhr-XdfuCD5Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 5:56=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2024 11:36, Krzysztof Kozlowski wrote:
> >
> > On Wed, 24 Jan 2024 19:38:58 -0600, Sam Protsenko wrote:
> >> Some USI blocks can be configured as SPI controllers. Add correspondin=
g
> >> SPI nodes to Exynos850 SoC device tree.
> >>
> >>
> >
> > Applied, thanks!
> >
> > [3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
> >       https://git.kernel.org/krzk/linux/c/98473b0d78caa5502b7eee05553ee=
168f0b0b424
>
> And dropped. You did not test it.
>

Right. Forgot to re-test it after re-shuffling the clocks. Sorry for
the hustle, I'll send v3 shortly.

> For some time, all Samsung SoCs and its variants are expected not to
> introduce any new `dtbs_check W=3D1` warnings. Several platforms, like al=
l
> ARM64 Samsung SoCs, have already zero warnings, thus for such platforms
> it is extra easy for the submitter to validate DTS before posting a
> patch. The patch briefly looks like it is not conforming to this rule.
> Please confirm that you tested your patch and it does not introduce any
> new warnings (linux-next is decisive here).
>
> Best regards,
> Krzysztof
>
