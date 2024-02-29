Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9039C5786D
	for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709197815; cv=none; b=gxioR98aumytS1FOQP/emNMDmJaIA4UNZmE0OIAqPD2jb7KrWG6XpX7pGD8er1zw9V7S04EwYvQSa/sMSRVVdA9o2G9TOaDzGWZa7gFqnD3X0MudXNAaex6g/221rewlE2Cv93pwPfMNDCal/Y8HI1CVdJgEc6v3EEgqK/H+ibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709197815; c=relaxed/simple;
	bh=tYdJ+lGX899NpFpW1u0FUrL3zEubIxJzBAKKeOGPMZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGVMwY/mgi0N92+xzBQbIft9Awg91OjyLeBMx0dSiPaY3TilQRMeG5jU+bj0yxjBVNDNBiJvwR1cKyghYZqSObve95X92z/2Fhse+Oeh4K6f0bRrKBT6uYhEx6fAHwPWdhgfplGPYjuasrXJB461A8NCEY3YEl0ejfwkkj5MBd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYyyGafn; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYyyGafn"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so736076276.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709197812; x=1709802612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYdJ+lGX899NpFpW1u0FUrL3zEubIxJzBAKKeOGPMZ4=;
        b=VYyyGafn8fYGXuQTh2xN5c5sQsoO4w6w3ncvrXbvv04Sj5JaJXCb2ooJugwbKjCxKH
         Mhk01/9IhHaCijLawXqFNJnBA95C8jGDJgcrJtRpodS962DD7MLXK8rNCZwaPG/DDYGA
         UHUDCBwG1ejM8SBLtN1eBQorWj7hLPNQNZlXa+dR9SIbjS525p9fgoNrKLW3U4wHrcx2
         Fd02ykhD43s/aZsIO1cSHs744aKGRMU/KlfbdJkmBf22/Dnujc3zSXQw4TXhjH14mybV
         nMGq30zi7x0Ps21bqgq6UpLaPHO3Qmlk3t5Ji4b2DNDVNPphQJdKgKct3k5q30plN+jz
         q4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197812; x=1709802612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYdJ+lGX899NpFpW1u0FUrL3zEubIxJzBAKKeOGPMZ4=;
        b=Br7KLo/5ltnTijiHyLAJbq0tzVJN189gj2rxIop4qEHSAwuchoIJUl18ugjftfvX4S
         1S+shfBAiZhTs4jPBPZxp1QbhoVsfks2UBwbRm+XJmGFjsrElqfUJIojdx5KegNXiuqo
         JKmyo8QSH9IVmOraw5EPiMVDLcD5x7QLykSiZsVm3tL0SYsa8ofrj+ccEY4cKClP+8YK
         A9VqM6gaEXMm4ZRT1YvizVvFAi+0aGqGJnj38DXSrifH1+xkK0rXYTyrJFVuLvAQysA6
         ZmG0KolN9xZYZhOHL7LG/qjuKxPpLEHv8LemelqQMEvNbK7OB9Dc2zm3YuaoLg2E2+pz
         UOjg==
X-Forwarded-Encrypted: i=1; AJvYcCXy2CxOBdSeId12pP2mybpZBnyRmRTuUxHu2ZtEGVyIK9x/+E+S0gvt9pSD/bZUVpUziXhrk7cOPCep2ddV33aPTdn4WWNXp/bB
X-Gm-Message-State: AOJu0Yyqfu68QD3Oz1Tu+Tqv3GUmDjEoP2E05bwT6vDllaaHsVsv0W92
	E0FKwrwJzYZrnrUnneJ151GFD98s7eW/IYc8vvBCO4CboIWb3cgQirKt3kDZ+e6ANv866qZlh8y
	J9rCzKARiiUje31Tbxocy8/ku6REqPwVxUOITYA==
X-Google-Smtp-Source: AGHT+IHXJtcxUypOTtLEATMHHzOH73b1Xs7hatFkLIIKeftmFvPSBf+tk6/aFwSpb+kgIHj44bbTi43CvloDA6E8K+M=
X-Received: by 2002:a25:ce47:0:b0:dc6:c32f:6126 with SMTP id
 x68-20020a25ce47000000b00dc6c32f6126mr1820937ybe.22.1709197812659; Thu, 29
 Feb 2024 01:10:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com> <20240227-mbly-clk-v8-1-c57fbda7664a@bootlin.com>
In-Reply-To: <20240227-mbly-clk-v8-1-c57fbda7664a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:10:01 +0100
Message-ID: <CACRpkdYT_A=PAn83tJvKibLAjcXekw-WABERgKQQFoFi0dxSEg@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
 add bindings
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 3:55=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add dt-schema type bindings for the Mobileye EyeQ5 pin controller.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied!

Let's start applying stuff so we get down the depth of the patch stacks.

Yours,
Linus Walleij
