Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389403BBE3
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450351; cv=none; b=AY6dvIJLaNiGOW4zvIMrZSMQqtS2GgiyQvrnqs6h1bmb2gJmaRD+AKRwzxsskuWkMdeTyLbB6tuigNoXD/Mxk6vEMqV2nIEFFJ8IbZ4M5wSkw+4yVDeVXgC3pODaL2Hzyw3eCViA2OKK/nJf80Wf8MeXhaWjH2ASEgArnvvahTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450351; c=relaxed/simple;
	bh=SbypRaxK4y7FOUc04r7g6F2EtP4Xxirop8YZAKga7xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gv6lDmTrsexZ7cDrshHt0pe4hB0BPnRiLRCKrNE8nVLIo9H4j8lqQLyVkeaXl8S3PuS28jroGXyQL8E/yCHQQhXx1L9Vkrj2gh2CQIZkEsoEDpdb7rFSxIlnxTO5XDUYSnpD3Zzq60U1QWcKzAehEAAXW4UNeF5VQRAR8jRl4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zaxsW9mp; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zaxsW9mp"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-65cd720cee2so44256217b3.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 11:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722450349; x=1723055149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdzxLzu2RkJLVHNIZ4Z2FLUcNDJnzadZxmlA7ncYpvs=;
        b=zaxsW9mpK2SKBOsbgkBkWzaWWfsYmcOyKJaN+SS2EiSv/sNmFCIfI76m0/qE0AFb+y
         jEAdWikJrUORrMdYl7eGld3cNgIQA2XU/JPAMcf4hLg7fMxVdGuBby0qIsE6NZD6gN87
         bbNeJcLGhoHdBxAp5vdN9iWSGv/yd1wcBK7VTXhprGT4tT+njSOX1FuuFfitQSd8g5/m
         uQSCDkoh3Ja8UpvUGDMU8og9La9kLGY3lN6Vra1L6Du3R11uzetJfhxPS0DcSGAwfStE
         gzWCGzzDZvFtN3AhLMlw5SSQlS+C9t/+7qtZF7suE72AvEqONgTe08/NRyP1ud7QwHxu
         qiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722450349; x=1723055149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdzxLzu2RkJLVHNIZ4Z2FLUcNDJnzadZxmlA7ncYpvs=;
        b=EaCCZAwael4eJvrE/S4LCM8NshAXevuNyB61+2M9OqzQ7RfwxE0g3iKF2doJCVsA5W
         6kNjNyL51tNQKXx//WJU8If6bozMlgqaSBTvCQh/w8+vnyBsyFmMjoK9+eX73Edvzazw
         ABZB2N3qLxwi/fcjeXdTF8pCQX3K6wzTNaetyCgBf1b+t2vVSlHXBYWvXDy2EU5nxCIU
         SIDCzFua5QRwM7CFQw+xWi2BtT5WMCWMQIFjmZwPiRbmT7VSmLZ9MRld5XlNYFqPo6Lk
         TE0dol2+DaA50QnRAUMHVw1Wx+5YSDISbvCu+XhjAPTHh9I63yAciwGOymEArsof7kn5
         QtoA==
X-Forwarded-Encrypted: i=1; AJvYcCV/iQ4azf8GHrOYdNdp2yyncgpLvrlF0DTB02gC4qGtyC4zs/07La6sp0mgfxzCKlYSJXOPvCDLfnjwqn/CKUxiF91eWhPfkctI
X-Gm-Message-State: AOJu0YwjhKG5Nu3r0gK+U/jnNjJMy3S6h6uQdvUESCVFswtQBjYosF9H
	45HcgeFs15FVLBDEQzAP0W+v21JH8GUwcGdhGTuLeN0fCJ+3qDQ+gf9+bw0OvJ8HyGLePd8eosq
	KPzRYdCrllQ2CgB1zzdbinVQ3kbNX/0OiuZ1SoQ==
X-Google-Smtp-Source: AGHT+IF0KfSlWB047Omd2PMOsZLUTxv2++sjbYGOlV9vhnSEfTHz8IYHfgmHBSw8qekBtE8MJoZfDGTkjDqE6mB+3vU=
X-Received: by 2002:a05:690c:d87:b0:64b:ead:3e3f with SMTP id
 00721157ae682-67a07b757bemr205779687b3.22.1722450349254; Wed, 31 Jul 2024
 11:25:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723163311.28654-1-semen.protsenko@linaro.org>
 <172243565547.42492.1072397968108986657.b4-ty@linaro.org> <ee392e1e-bdb7-4cbd-8b43-00ec0efd5026@kernel.org>
In-Reply-To: <ee392e1e-bdb7-4cbd-8b43-00ec0efd5026@kernel.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 31 Jul 2024 13:25:38 -0500
Message-ID: <CAPLW+4mxtTj5VGi4LYwU-8F9hsSgDe+yxAsON=rXUhxGWHCCXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos850: Add TMU clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mateusz Majewski <m.majewski2@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 9:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 31/07/2024 16:20, Krzysztof Kozlowski wrote:
> >
> > On Tue, 23 Jul 2024 11:33:10 -0500, Sam Protsenko wrote:
> >> Add a constant for TMU PCLK clock. It acts simultaneously as an
> >> interface clock (to access TMU registers) and an operating clock which
> >> makes TMU IP-core functional.
> >>
> >>
> >
> > Applied, thanks!
> >
> > [1/2] dt-bindings: clock: exynos850: Add TMU clock
> >       https://git.kernel.org/krzk/linux/c/01ce1bf22adc0d09d906319787091=
ce784cb9914
> > [2/2] clk: samsung: exynos850: Add TMU clock
> >       https://git.kernel.org/krzk/linux/c/79b918aa997acd5066c7962502b1d=
aaae76b6911
>
> Hashes got mixed, but the commits are properly applied:
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=3Dn=
ext/clk
>

Thanks for handling this!

> Best regards,
> Krzysztof
>
