Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0A2C21FB
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 06:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299865; cv=none; b=E+24au4XaWHygQX/zBooMSpEYm3UOfKZTsGlZreH55jfTzWfpLE8tuz0lXvg52Ie09kJO3Th2h4rkjPND6C8CvVfuIWkLjakpouRVRqCj1j2kaLxzLlEovLZOXlzmlatjX2yfpk7Z0+iAZrTaSzO8/bcOQ6z0ph7VwA0JAE0zh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299865; c=relaxed/simple;
	bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzhqxPs+BO5s+inuLs0GoNrYYcuswbBNunIaNjAwneRld+SHz46gcxZHG8EsmwvCzg6l6HjdDQy2nrbgTlvNxckPRBdYunRmZG0udfRb+ppiaX/7MA5/GJXLqZ0pimU/i5CB4fDvyJeb0f47WETkrF4vqiMhJjJ7JrFeIdQrXMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBmH2+ws; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBmH2+ws"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso7102534e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 23:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299862; x=1759904662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=WBmH2+ws8/DDuBObE2cAr8KZ/24nrJYEIYCwS+M7mxGUmUwpdH3/oskZ2UqtynHEun
         RbP2kdtvDP7liHTY7D0oF7RdORfI+HqIrEG8bC1bkBIFgoD2/Yl/x8OXTx4msfQV7+Uk
         aDP0J/wwS1CbmxhR7grMGDhEqp5BmBP1Bp4mWug7YdxhUubT9IVlFfeuJTQY80jmRdrA
         5YHHFLH0shOZ380FYVXwdhKOUcs1cNa1/kiNTVBNP6rLHKXWICR2pWsScOd4Xr5LFCib
         l4CChbXU9ykn0RNwTi0ulhcAfrCw0uyxFXw/ntewc9zmIng2QDGIPBrCMdzMJa4HBkBB
         16sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299862; x=1759904662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRAgifSudG0wZpugBPM8hbg3tAFsd9BARcUmc0q8uy0=;
        b=G8ypwMBh30CNAl30F0+1dzKSd4jx2MKeZqrqPCG//G9Lkeq4fl5YbLCUQ+iO7OZv05
         /aumKMn303QfF3jGjMWaP2//HVUZVVnrzQQ8OKIt55EZ0ItEaYsO1Coa/Fw0Fpvf8pox
         mE1ebGS4qZmuWwGj7gd9eMRuK/ZzoZ9i1nT0E1hxWG4TkXsKKFmeCjxpKbjpNeeFeYwC
         9f9lWENzON0YuVDB88x6hvE8jKBw7Nf7bAjeWLmQ7raUCwdA3Cxuou7ojvDmorayCkBn
         8Yj54QsB27gOQ4DiOpv9R5ZpWacEsOD2721sLnNCCS33H8ZmAW24d2nZ3Jh/9ExiMSIY
         NnEA==
X-Forwarded-Encrypted: i=1; AJvYcCUYNakVO/zoko5lPRi1JSmi+89z49yVITXbrCJC3BCIcM8mmi3NLi4NXN5FFmDzXh8Rm+BqpXs7leU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb1Kl/H2REWj28KRxKZMzqmJt3VXVaSI4oeummVyul4DPznw7Q
	83/57mzJtQtgZZ5HI8QNQqfUMVqO708M89hYq0DdZ/rlQQgsZgqw2VggdJzWs+FJgUeoEQEj+6i
	DbEi8wrQBbLN/YCDDD7SHkBukjlC67R44w2GAI+wgrw==
X-Gm-Gg: ASbGncutDEoycWNPNiIVSVJBqe8BHjhr1ioDH9Ki47dl3uWePOr/vI/yn+T++F+yk7S
	4ZFHWlADsBiGQa8tNDgPBtsvgHJ+uacOfEtdhpPfAFyvnz3bI+3Zt/ok/k2Nywv29pKDEzaQm20
	PF5NK1uTh37zKOhYzu5exshlYst3vO70Gl5NQ1q1oBje15Ro5Bkbcpn9qB1B+9OQgFkEMGXqdhg
	CiHs83cdbhPVWesh2AocyymfvF60pk=
X-Google-Smtp-Source: AGHT+IFozN4lyb6vOpauqxIZ3ZLWPP665BWKXXa2eLUpNSUCsqO967pjOJIApkPryd/vgSxP+dQ4iOCA8lbPex5gtHE=
X-Received: by 2002:a05:6512:6c9:b0:57a:1818:480f with SMTP id
 2adb3069b0e04-58af9f6e9famr596020e87.46.1759299861855; Tue, 30 Sep 2025
 23:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org> <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:24:10 +0200
X-Gm-Features: AS18NWB7xcfQD0XZT5zZ03zQzwmaWFrlIYwfqVvy-IagezTBvTp7mSD81HURh8c
Message-ID: <CACRpkdbhTWtu1tvGQ-nY3phUeD8+0D2TmEQQUwDXhXS5thHn1g@mail.gmail.com>
Subject: Re: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 10:09=E2=80=AFPM Dang Huynh <dang.huynh@mainlining.=
org> wrote:

> The GPIO controller from the modem does not have an interrupt.
>
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>

Can you split out the GPIO patches (like the 3? of them?)
into it's own series and send them separately? They seem
to be possible to review and apply separately.

Yours,
Linus Walleij
