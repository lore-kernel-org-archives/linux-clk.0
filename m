Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963451E491B
	for <linux-clk@vger.kernel.org>; Sat, 25 Jan 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737811286; cv=none; b=OPmKUwnAHc54xouETBo7mKxo8JHvrOg1f55ouH5/eTQJ/H6T7pxwIewfJSOhCaoOaulzHpldZ/uOYJitpWIjBSsWiwioSlB7Gz4+6pvLBCZVpd06D88tHUJe8ITmO4ndVGfDYtjES34KuhvyEWDDIBMzC+/tImZSI0XnH0VuMz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737811286; c=relaxed/simple;
	bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUtEjsu+SUHB8ABA9/kN8B6jBCgptcDP6uVCCog0mTigZIsEE5byvzq6knMqT8VLL6oRnD81+B0e4TlZ0HhBjXWfuM/sWWapPN955sOLIBtw6OM84aCl9b0RBc/LQssSdLnE38eAPEvUJ6Bx34n3PsWUhR5miU/ZGb71+WaSjys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V5tHekW3; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V5tHekW3"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso4240647276.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Jan 2025 05:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737811283; x=1738416083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
        b=V5tHekW399w2KB/CZ5EmIr/jHO72JUiSIYq7DHlM5CHdnR8E1Nlp56UgJnGaxCPtMG
         skdQf+EpEjnYp8FbBl9pJcGgExuUXQkm1YogMw1j4xLd12yZxZbDd7tJkNGPlmO2+Ktq
         vhWrf6ZH1+x5bSetTHcgdO5TT2Gx810hqtQBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737811283; x=1738416083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqQlkYxYh5YiVxFjsX2QaXZvcKyx1dpoVsF7zYYgoA4=;
        b=YwG44cZGAy9bmx7p0OREL+SvhnlmM7fP0gPfK3ZMsiZ4Wq/MP8FKBZzAoDhcCXL/8v
         VqvbMB2Evh+f6I+vtlEBxHt8NdyWWUlXUQQ5ZQ402IqY9xQec37Ub1JP1isbf+4RFbRp
         1gG4T46zBfMaDD9/Fyy3CD6c21UrqC0pQpgZbNDsBmNO1lYu5atNQ4Rd5bHpp86/T0Ic
         B3p9fHMm5060+K6T9nrFclKAsy6UJaJLxxn9onY3ThMH+derm/Sairlpj8fM4sXfG9kN
         C6/55LRLsqnW5G6cIyEYavf19y7DVId3xdzT4xWc9Lg+hP6KM4zEakl+uJ0QTk3JL1xp
         AKcA==
X-Forwarded-Encrypted: i=1; AJvYcCVqbh1IC5d7aXKSdjVUPyHCGpQNKoJdxKirj9yXSr8zTA+nfw6uhLnhIKvTXANbUW+HU3ymMcYhkBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaO7iYtET0teyxQRSohJby0VOVSioK5/RLsbkWyRQ62LBmeAh
	abHdXn3ZSam9gBsMeOJ8fHe1PYP5qMqV2CW7N0KEowa1NGzmo3Hq1foXVUckhkTe6shCx1zcauy
	QBuvTYtb1UmHoppI9ZRlX310zuqqe+wpOJfJbcQ==
X-Gm-Gg: ASbGncs+IHoxu1bXb7ZW1DD6A3oAhBXnPuD5yjUf4MbJSCBg+ets2+nCrzeLiJ3K8mg
	Wg8Qosg3P8d83vxOzjmaAk4g9QzwiLL+aK7aK5xMvfKIgC0+Vvn6Sqb6ZQoPT
X-Google-Smtp-Source: AGHT+IEC66mHyu/T69Up/dX022TugdsmD0uulT2kpXSasOG+om+qGGY/LBwo1LfOlHcKiAvuEQ7Oi2p0ts4rAblyPzI=
X-Received: by 2002:a05:690c:25c7:b0:6ef:6c57:ddc6 with SMTP id
 00721157ae682-6f6eb937ac1mr261166397b3.34.1737811283560; Sat, 25 Jan 2025
 05:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
 <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
 <73ad1336d9fbfa020ba666eef340f784.sboyd@kernel.org> <47865ef4-fb8c-4ba5-82d8-eed1f292bf4d@kernel.org>
In-Reply-To: <47865ef4-fb8c-4ba5-82d8-eed1f292bf4d@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 14:21:13 +0100
X-Gm-Features: AWEUYZn9YZy8Owehe6KhYJIuvjU2tyrCD5F9XaUX2lhI1_Zpu924GXyOjD3iZ7A
Message-ID: <CABGWkvpeOyrzcU64pNxSYC7n-VOsjSEL-iD-_YqmCveGsrH-hg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 2:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/01/2025 00:22, Stephen Boyd wrote:
> > Quoting Dario Binacchi (2025-01-14 10:19:47)
> >> The addition of DT bindings for enabling and tuning spread spectrum
> >> clocking generation is available only for the main PLL of stm32f{4,7}
> >> platforms.
> >>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >
> > Applied to clk-next
>
> Unlucky timing. NXP just sent this:
>
> https://github.com/devicetree-org/dt-schema/pull/154
>
> which makes these bindings obsolete.
>

Why have the DT bindings already become obsolete even though the PR
has not yet been accepted? The series has already been merged into
the kernel. Please let me know if and when I need to make the changes.
This is the first time I find myself in such a situation.

Thanks and regards,
Dario

> Best regards,
> Krzysztof



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
