Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCED65196
	for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532864; cv=none; b=cT08KM4FVhY2aiCW3jtQMPoZYHVSxNIW4WjZhzdREO7RDKIio7yRD4iH0T3gwgT82dlRjFQXn6yZIc+TBoByM5LZdVXoaMeJLjI7Fr5lwudlY+kSPBEwePni4vFYKDTpV4NsBE1W5H8k0a7I7TwRFbmZMQQ5LeCctj0YhPOS86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532864; c=relaxed/simple;
	bh=9fhnjxZ/Z3eDiIl/YeEMnJ3S6KNDkcBYjFwOq1E+8ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVMWybXHTIH3QDbT5oHjRvx0eNiTrPlBhLR9eeC6W6B2xIDojXmdNcfziQE2UwD7c9PIaN9ik4thZSonhjc0Ro1N/mc4jl31EfcTwlbh6pXBFEIPRI9LmERjWCYZojC1QTEjiLujMgMS5WV+GQh56Lv9QEy3hLVryGcvZ7mVvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo0ueFqH; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo0ueFqH"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4bd81be18a1so455083e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 04:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706532861; x=1707137661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fhnjxZ/Z3eDiIl/YeEMnJ3S6KNDkcBYjFwOq1E+8ic=;
        b=Yo0ueFqHRTYnDfScc9XqOUMKIcve+GHSNAzBIaRpd52Hx64rGuutlG/0eOm92u5Ykl
         w5kvcRd5CkalsJEiHMvXO38tuZsK5ExSv9U+84eltOVthjzZZBg+a0ax8J3gvXrKUzo6
         5trF+Y3vklfuuB9ujtasvkP4Y3cijekQNdEZYLiHDd3voWxLyGhKD9CSBb9gUOw29Vuk
         1nXrnFsYJU+Gq7L3F6tOH6qKI73QgCYz3Qz7cTPnVkPmpfm8Rw92XpYoueRw5lbLg1ja
         +9jcXdSoFzzOWCSG+bw49VIErFndeAdOfV5ocdu6LmsZCd4VlrPc/Zcpq3DzY0Sk7dw9
         TPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532861; x=1707137661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fhnjxZ/Z3eDiIl/YeEMnJ3S6KNDkcBYjFwOq1E+8ic=;
        b=wFQNqGX8jb2SOApDMtgy/m96dGCTL/SI8pErx8ANcEyFd9/wdBZRvMOjjI5n1HO+eC
         Uuo8gOiEu/jY3RHlsSe2tOm5UH13+s5qFqqTgoZFVm0yxX1JerowbYgBgGnpY49RrDHe
         QG8tLHjCrN+i7C3lfpB1cXk4yPlIuqpA2RlNakR3y8LAJ7FNTwTx7Bz2ZCAB2JItXgnf
         BJvMFGejG0Z74zgqMDebqx3AbxNorjvOVIw6coUUxzy16cEPe85MEZGsV7l6fSRDGKWC
         a9RFtr9il5WW7erC0yd6n3WboEtNL70tLhUBuy4diRP8VeJSGnz9NPbnkG8L1ISEIxOA
         EtMg==
X-Gm-Message-State: AOJu0YypV5tXv3L/JWsivRkxyS+7tUDI8zspyumx/EBsJnnL6tKARoHK
	J6ISmrLANKo2Vj6OYYmGVPlbcnfuaRnKBYxQ49y4OiddjCoBk8UPuYjdJjRLA7X+/niXuuuhh36
	6RISmA/aUl95f76vJMoJORvgxvPtvmHic46pKNw==
X-Google-Smtp-Source: AGHT+IGPu8IxPwCZdmDI+aLgUZ/+xyElq1oXto8vc6/h7JrJnAJ8UG3qkg/uKgc6/g7pLgSpiTY7msPMtetgCHtV67U=
X-Received: by 2002:a05:6122:2525:b0:4b7:8199:5d11 with SMTP id
 cl37-20020a056122252500b004b781995d11mr1970096vkb.8.1706532861322; Mon, 29
 Jan 2024 04:54:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org> <20240127003607.501086-2-andre.draszik@linaro.org>
In-Reply-To: <20240127003607.501086-2-andre.draszik@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jan 2024 12:54:10 +0000
Message-ID: <CADrjBPpabnoOUBcq=wyaWZdiJr9jmHadvqvtj0Thvo8qQzWD=g@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: samsung: gs101: gpio_peric0_pclk needs to be
 kept on
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 27 Jan 2024 at 00:37, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> This pclk clock is required any time we access the pinctrl registers of
> this block.
>
> Since pinctrl-samsung doesn't support a clock at the moment, we just
> keep the kernel from disabling it at boot, until we have an update for
> pinctrl-samsung to handle this required clock, at which point we'll be
> able to drop the flag again.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
