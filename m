Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1273AE1A9
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 11:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625282; cv=pass; b=RFj0xhHJ1sGYFfLzOFb4nyHTLx4FeCYwlzl7diqz+x0v19CuVccb1MHyFwcA2A1cAayjas7itCUIfJ55SyeYHsOVF6X14vJTv0fZ7NeRNZWx+X/lO2spPrLCBTah/AEoSoNz62+avJNoWXOKKTGHOfKpcWWCHRZuVN6NUxXPdgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625282; c=relaxed/simple;
	bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmOgKdTgxgFzssEqiT+4yG6EiGF3AzCGWuQ8JyKejpkER3eVvkxUqPUa+GU2wkl6bXIAjFLfsknst5OI2+5IsMkR20RzhS3bJ7qEJQSSLBLYv+Gu0q3gjZ1rzYhxfOWMTgThCt6LLeMJ29zx8xW4rzOC9gxujsmSD+K69vF3D1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPFbQx4N; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPFbQx4N"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5ff05af29b4so2386634137.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 03:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772625279; cv=none;
        d=google.com; s=arc-20240605;
        b=acFxLqFFsuvPlqFymCFuPOJSrRk3PwnETvHliY48idpm8cQyrRqXD2chjYfmWljAOu
         0lrdyoANos5KqIdfcRA3QWFN29fWO2smouzU+Wjsu2FT7SPA7p7fTSPsMtsg38rz5GKf
         v6u/9W5AKP+AGbepDst3dwY0eYr7kumAhkkjJ8GuAVE3Nis7QDb/t/B1u3UkL1EpVvvB
         KUEeaKmlRBrfmWO3wyC0+bPZmPBpKHM7WrteKss/p46Oje1tXqi/Qbat0LlqOfoywdkw
         Wk1IF1Jxn0/3WzVfy20GGZVzqRB8am3LeoL4+E3ZvrVSxxHwCkePCoFFrkavtlDNkqBV
         +kiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
        fh=ut6P/749KEolcx8cB4HvMfmFu4YKZU/66wpgsjHEM44=;
        b=dISGrCk0zK6G9V4bOVqjhvyXOc0S6I+pTug+5+vW8Mi2B3JdE0DY3EUZ9t2lKhU9nZ
         RloY8gzjcNykx8uTfSGQfmHbR5GNlW6sqBaMiQxUNVLNf/B78prHFP0wXhyY2C8073yo
         xqdJikpsbhdZ1p/wijmTQNLPTT9fdoDomj1hXzIfybz+LOh2oh225eQ/F9Z6YSSKuo7e
         TFU51M0ByQzC2iZ2/gPIbiCTmevfICXAfDqln+X4an5sTNXFSdVQTaqHbZW+lmwJ6whL
         1PWDOhKc4y2d04hxJTvAhZWuT6+pfSr0ISJiFCNJ6RlzjFPJ45zBn1gXU7dSJKaJXcmH
         0r6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772625279; x=1773230079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
        b=YPFbQx4N/XWgf6Yz6FpgYv/LATnO/9u++MFaKGQWKHZJuYnHkZO4mPwKlxN5zd1TYi
         VL2E9jpT2oCzN/DCzOlG7q6nB25jgoGrezdBbbrvQsi+uQyWwL1bNvNsh3mJ4a+opnKw
         L96E5rus0mBowgBEsIvgKJieniM142Es3gSdwBurQ5TgUXr1CT4VZalPJqGC+NaHKxrb
         Tgbig7FJSJf6rCsjzvrg9Jxwqt2b1I9w7xjSVlpenIESKhnFadgB8Zh7D6qSM28YtH1C
         uejgCyj0FYqv8MZU05mYhhkvhihnES3jqHRhhewP3csMaZG7qMaPZa2BRtsZ5LkdYV6K
         Q9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772625279; x=1773230079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DeZ6Ygfqs/heAUrJFlxVUi2dKLAHlgjAvV7UVsRLntw=;
        b=a6dbs2T7NuuwYDil9ETZf7X70jPMQ0R+uK43+tDZHwJt7xJKLjy9yFfIUgJXqM6HyS
         GWbR0L3uAfCfSc05qzJXNbvRlFjzsyLTl0POrJ11EDt+xw0btNU6i3soH+swZcEjppNy
         kkOXQChP4LBMNXpIbmA58Ptzbu1JxciMKpfGst/6wDitd56EI39tLM6fjntinjV9H568
         W/t+XjB9kq4wRxsFxX6lBmTuzMR8yc9vmirAxqwb5f9QRWtGmH8PrXcViNGEnSI3cnuY
         doXBOhVkHsD7KnjQ5I5NMQ319szDE5CssqJc5913p5Yv3dxltI4PCfd+RhVKYbC9BZVt
         XYeg==
X-Forwarded-Encrypted: i=1; AJvYcCWNny1ayqFah0eH91JiR0Z9E7yXmOJ0XkzGVxI/AiEpdGfTzePcBzUrg1HvqSUbUVaoejydkVUaaoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRmvKRGoL9POWPrSfp2IzZBPd+BfPGkJe9r5oorL29OianDfar
	ImvJEYCkcuwwof0ejnmsmBb6+NBc3H8OcjXs9BR0aSSlV0yqjjDf3wZDhLXFAmQjgoOwk8YensI
	k4f43NO4hSFp70ksO11SaGzOkao1UqsA=
X-Gm-Gg: ATEYQzxrQ5Bs4ik5xoYI+XSPke2M72KpSedLLwOAuA1ayQH9jKbe1oUsGXcXH/enZky
	2eovaAEUldFHQqaf9NbIkPcPdL0HbG1o8SjogMtDbRFpFuQX6KAYW2QjBfrWkib9PVKKumS1N8L
	wDOYO/ItvtjQ1rUKJbz+pdM07Ei6Nd0RkL1pMTsBty5ROxGgZjI4mhDe3LBkImvMBx9Oo3kE1yi
	KWa+9C0vIlS13I4kh16i8FD3V7GSgRl5NX/szv7+LBc+JdGSTB2eQrVVueV11ajEATay0qQ1PLX
	dAI9oz0=
X-Received: by 2002:a05:6102:3053:b0:5f5:3ba4:312f with SMTP id
 ada2fe7eead31-5ffaaf09f99mr661974137.20.1772625278684; Wed, 04 Mar 2026
 03:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303150152.90685-1-mitltlatltl@gmail.com> <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
In-Reply-To: <d90cd589-8a0d-4e72-82ae-7e78dec2320e@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 4 Mar 2026 19:54:20 +0800
X-Gm-Features: AaiRm51JUjTWLPopUm59SQ2DGOPsTEwAW4-AC3meern5RDrKecAF8z0xKR7p4Lg
Message-ID: <CAH2e8h77bpWvSdYu2guC1muz2A99+cPtWZyUGNKVOeh3J+eygQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at
 registration time
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 7:20=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/3/26 4:01 PM, Pengyu Luo wrote:
> > Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
> > Gaokun3, the image will stuck at grey for seconds until msm takes
> > over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.
>
> Do you have clk_ignore_unused/pd_ignore_unused in your cmdline?
>

Yes, always.

> The sc8280xp-huawei-gaokun3.dts references no clocks in the simplefb
> node, so if you're unlucky with timing, this is ""expected behavior""
>

On gaokun, if simplefb holds the mdp clk, there will not be the early
framebuffer, I can't see it. After seconds, msm initialized, the
display would show logs.

Once I owned another sc8280xp device(Ntmer TW220 aka robo & kala), dsi
didn't work at that time, to bring up the simplefb, the clk must be
held and no parking. gaokun3 always requires no parking only.

BTW, I can see this grey flash without simplefb too. On x13s, if
building msm as a module and not putting the module into the initial
ramdisk, what happens?

Best wishes,
Pengyu
