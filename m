Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7731AAD7;
	Wed, 27 Mar 2024 01:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711502158; cv=none; b=tPzqWOpuPPxVJsZLA4BUz/TtdgOzoHsnd27LKTMbWci0x80UomV+5qczjmT0YUqVcRr+OASGgIOJFcEosTel2xFBQjmu+4tPIDang7kwDZYjG2DYnLpEQ7flzRfORWWoToIj7B7k152lU67yjPZoieVQNq5uDiGqVgXO0r9DzE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711502158; c=relaxed/simple;
	bh=PLidVJaE//HxRhz5H/QzI3/xtp56vRobIOOw6V0NeqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoIvdF3Ymer4hH1umLWjXiWvCmF6xoYvkpDduWM7GQBPPWjoE18/mSU1pEUppmSsWvFmFpHh59q/zK/k/yqxgnWpH2cHjfZIL0Fha6qqwUkKIAoWj0ZSLB1vvpmXX22Wu2pxT+8SU3V1w1+Pm7enKmSY1Y1W2H87WRRfwiXgoUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZm3nTPf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZm3nTPf"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d28051376eso111937201fa.0;
        Tue, 26 Mar 2024 18:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711502155; x=1712106955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OHmV4irZFRN7yhkxXILCmLuBOPWKdOt3kQNZKrG9Qo=;
        b=CZm3nTPf5ezLJX/SuhuOdezMF+4YaX9J6vfL1aNv1H3Sv3hmTjQ9iYcU+HsimQo5US
         xfLTRWu1COzozQQ5g1cXuAaJC/S8fzvjRpjTSe3yvEDo0al9VNGOUvj36heQc3YYVbjI
         XssL2kdKw7y5vkKOoZu6zMuOx28MRYDmG5cnweQkb1JYNZlRwmmL7z8oujCqlVqFDYQ+
         S2pOGYJACrHVupSFSECqemyAywDaepuf9MX0AqeftseutSGOXyNA59Kp9jgaNXZsWq6j
         67LcMEEbNfg9DFEWLzge54YWEju1WcHTkWjA3GpGJDxhi0eL2G6cQ6qxJ12Ef95QoYD3
         2JEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711502155; x=1712106955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OHmV4irZFRN7yhkxXILCmLuBOPWKdOt3kQNZKrG9Qo=;
        b=K+oVX+oJgJzgQHy9vObMCNqVxn2RkYBv3s6oxtmJsfqTGlBztYkEgeZmgkULxNR/wH
         gRyQJWYixVi7+R0WtBNoMtjc6vaU5jLHXw5wrbeuhgZ9N49JUId2JGp2/PB/mJNlvg9J
         mrpRs7Y0v6DDHiPYN5ieB6TPOY79T0m43uYOAGpoCR4RllQhM0AD+6qkNorG0/oODOP6
         4jC6mW72r9AA8Ds3NRQV8B3etIQ7Ty4wACrKwr/kCLRGlEbrhQ1IG+py/BVq+vcFc+AR
         ZwP2jSRL9ZdIwYT3blVbDiQZpJXMHd9ea0GnJ4TR98OX/somI8wO57NOsbzCC7ZCjBLU
         oqyw==
X-Forwarded-Encrypted: i=1; AJvYcCWkFmvbgniQ/caX2Hy2OoRnRjEb3rFYf1VnyqmSEqTXlhI17JPiDwg2/GCbAknQDZdsMw8mbNb1bQ8yVFUV8r5vFC0VlDYyHjYI1SM7SqODWNC2fwDGMKEEGIi3DPqYtGcZJd0miQ==
X-Gm-Message-State: AOJu0YyPXAp9QCLPtJW28fVtW6px8GERw7buJ1FhvcFsFZzOdVM/zJ9A
	CzxgSF0MCFs1BcorHpKQbUBmEYhzdQzM93UaCY3giCqJulhvDFyAs2kefHMSM8LWe2a8ShtIu2t
	CcItwFXsGR9P4Vy1g5ePEMeA16Hw=
X-Google-Smtp-Source: AGHT+IE6oY27Hvh1xBoRmMHbRBXrUqGabIUdZcpUuNN/8gTJHCNOgWIrkAnYswBuXrHRGBvH38Mqs7Kj5XNZBc+eiQw=
X-Received: by 2002:a05:651c:10b9:b0:2d6:f408:fafe with SMTP id
 k25-20020a05651c10b900b002d6f408fafemr984912ljn.42.1711502154359; Tue, 26 Mar
 2024 18:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1710926402.git.zhoubinbin@loongson.cn> <0cfd237c2c7c1e4f89b6e5f7af0a64d306de1c8f.1710926402.git.zhoubinbin@loongson.cn>
 <20240326-shifter-zeppelin-1d8616dc82f9@spud>
In-Reply-To: <20240326-shifter-zeppelin-1d8616dc82f9@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 27 Mar 2024 07:15:40 +0600
Message-ID: <CAMpQs4JKYxJQ=+iRW6EqRc4t3wF=eNLVg0Y=943D+X+LmJyG=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: clock: add Loongson-2K expand clock index
To: Conor Dooley <conor@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 12:54=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Mar 26, 2024 at 05:01:00PM +0800, Binbin Zhou wrote:
>
> > -#define LOONGSON2_CLK_END                            18
>
>
> > +#define LOONGSON2_CLK_END    35
>
> Please just delete this. If you can change it, it is not a binding.
> Just define it in the driver if it is needed there.

Hi Conor:

Ok, I will drop it in the next version.

Thanks.
Binbin
>
> Thanks,
> Conor.
