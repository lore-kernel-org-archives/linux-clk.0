Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E629B228
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760996126; cv=none; b=OL0nhAoacMng5zKRgeiq2bqaakWyUkcHvzd0OSfrr+LSNVL6VYZroVss/GGGHvLKbb3eTaU9I/HIdDDiynfzAOAzgMnkN54aHix/LEk1FonR4BDZR9xvr8ziiwWi2rHxxEdqhz4bgqCNcIdzJvzN30TCkrbq6ONHkHfDFjNtgIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760996126; c=relaxed/simple;
	bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFrchrl/qfe2wBNl9ZiqtIa+FKN0QrDOv1Z0c9vP0rqxdgnl4qVVhVMwdYeVZ/Lo8NzOvWI/F/Mbe0/CqzFC3aIOzw/RYuWpI+gcAfWrDJQtMSBdBG93akyVC1KBSew5qfElG4qQ7WbcN5WiyYfzp1YhZgbrAPtoPL4CK/sxUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PE7buZHj; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PE7buZHj"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d60157747so49732327b3.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760996123; x=1761600923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
        b=PE7buZHjoYUMImtbfQNuaX+nnmlXX0XVVE4OhOMIKupSEDMANMsRMetsBK08uqy9At
         1ukTlNhpTEXQrM8BahxXobWCEbiHW7aWVf1NWaIFS3gablTeWO93iMG4LU1l9+cCvhYH
         7tPLZf8TCIvYEugcAzJA5ee8dZgQLC2ZY6qu12KFYAw022n6+w2D/bEPPh8qiOB6GmHy
         nGo9fDaU0220t0tuLMv4f2WWl0fLIrDUMy5DWw2lnePBzMljbpA7pzYa5Ni8uDXxb7Yb
         +Yn+cMf8PyBX6KFf1okxtiAiwDvRW9AVz1yHmzxK4J9XtSee1T7ifpwWG2hxFnDKzp2Y
         EPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760996123; x=1761600923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+3sYnwm/zVmUqqbZ6Lan1Fe/EeeP/Xr5dbG7CHwG7Y=;
        b=RxV1C4JliMdJqdAJX7UHHbIxUPba7qjHXj0Q10vaWU4ZmfR9wQ+Aosqrrh+63fInIp
         ffHoe0H1tEVWxj0cTulRzELO645iUTAPkeHOi3oc0dq3/jhyHk6R1qshaG/bRxi68F8S
         GptiWI0YR5BZOAEk7Y9qrfvvK2I1YNRa6mj33U7i/DhOAT6ZuvqcQEwI3+L5SgnXlTW2
         awjnkVQnUdyNmHPp/E0+GUdpO+bimK8Q4HsevqXACUGblmrlp73ZHfsDrLqBf/M8Es55
         B4Kw+RzWW8zaR6QY6k8u5k0HapPf7svesPrBs25sjANw+zHr+++mQEa8aAPwdb64xaNr
         vU3w==
X-Forwarded-Encrypted: i=1; AJvYcCXe6x0A08OY2UOWEJ8tu2f0KGPDi1dyH8ZYcKRhRUB6IP9ONggFGc+8q/sla4djyEQRmQD40D1z3Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5XCWWfXrhWJ72CJGh54U8ZjLnFMhAWstWVunZgM74PJsC6Fpu
	YAS+ssjYeiyrmLnY6Kw+qCpmOBNVkxMODsj9qPLvpWZpS0a7/gTMExD1iBs2J/PzaiE3XTvZydW
	3IZEcb//W/DUlyEpBwS3TBMXd9y+PYYgiwOhQFAfZ8A==
X-Gm-Gg: ASbGnctsec3i7Evy5SLI9UKI0pfvWnKvCIMndFFk811fX2F75CBVoowSD5o41mWu+r6
	pjPXCULL3RomD6jTU1vGCQSdYiNwrdFAnCAb7RC0L9Y4aaMQWG61k8tmHfuAAGB9QUVJjh/12HD
	OQPekdIAss3CKC9k+xVzxY21JF7XCt9066ZO0C0HNsB1J4i0dfutu5Wxkal6DKDuXc2RhrWR1HN
	XKrSe7NKmdeYFWwPLIRNxLhjJaHDpNuY+xBrGAzz+DFbguabQlOCj4Ls/e3WBFVIyBov7A=
X-Google-Smtp-Source: AGHT+IHcbLV8sjcTUSW/kYKLFIDfgxSVgbG/hCotLfs+E1Yurw11PQwO89zUraRAtmdIvysGYrHzIqa+Gk+I+qbLfMk=
X-Received: by 2002:a05:690e:408b:b0:63e:221e:bd38 with SMTP id
 956f58d0204a3-63e221ebe30mr9755360d50.64.1760996123201; Mon, 20 Oct 2025
 14:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015232015.846282-1-robh@kernel.org>
In-Reply-To: <20251015232015.846282-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:35:10 +0200
X-Gm-Features: AS18NWBAzh5HU2QEiT3WGw7lWd7_MVL73oGUD23tlLIja0Rs_422Nhq3kpTmHsU
Message-ID: <CACRpkdZFXxBY2AopX2bgFGE_nhXmV3YirfRwuo4L6qWzzAC4rg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix inconsistent quoting
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Florian Fainelli <f.fainelli@gmail.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 1:20=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> yamllint has gained a new check which checks for inconsistent quoting
> (mixed " and ' quotes within a file). Fix all the cases yamllint found
> so we can enable the check (once the check is in a release). Use
> whichever quoting is dominate in the file.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
