Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DE30BBBF
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602337; cv=none; b=FJFALwfINiuSEDajhnMyYgdHFW5Tn54iSrneT7YXcQELuKXf6ILqpOxdpW/LHSXGMoOiwyQgbdr/Yel+6f8wupGVsM5Usqbeb7aGWcySXMilcbVvOBamilfwqpV9j13Fe1jRjVQSnm8ihjFh3dyUIhK1rMdzk7uaumMkLpK8jgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602337; c=relaxed/simple;
	bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukRSu8X0D9RcU09j9U4FcX7CeT5GhZrCLa87u+S4TGxpqY1EzKrh9xRI/SpwzMfNCSH2Wsn8oIUcZZpJ0NOal2iBKCPDVhIKtpl5m6Sf2xy3jOtEfdu8HlnB9RG6+Xi9mAl4TvkZg8PNawcDcwJsakS8Z1EBtwffKN+f6xyW9J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVbFPix/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVbFPix/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-592f5fe03dcso5890402e87.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602334; x=1762207134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
        b=TVbFPix/MEpkDHpX0aZDlETK1VkYOmtlsAs1c1kR+oesvKyM3uq5XWm55MG1STEo/h
         mO77I/TOqg53ZsHi9lvEAOSumIzBnVQPQp5G6cFmvDUDVn5SaWl1m59AHpRtTHFEshfJ
         HrjKwY57adUt/mJ2r0jyDw4zMR+7zBuxaZ1z7qAdggaEB6CuCb5u2ocCwSAFOl+FZDeD
         UsmLz0jTR5SynSNJ/NPefnsWTnRgHmGUzt762P3+QvCWDNjulKbUO8U4JWQCoFLI6EuG
         UPYbZ5sYYASVDcuJB63EUcom1U2If0J+BTi0cDmQrgzw6LWOLD0Jadl9SXLoGZ12Wzng
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602334; x=1762207134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
        b=X4F/yr+Y8r03NIjnXqObTuzLx7Gt/xejKn2pefW30p92cZ/s8UMuf5YQMXMFgmo4Jp
         Yn0WIgtASHt6Zy8oTY5tnXayEofqO8/bgTH5s3mZedWGHt3CJE4YelJM/yVMPNjSChKF
         OJgKe1b+l+yiVQu6mvGTHYRzjr3PdZ2BfjA9kWCfvqOEM8orH44Ji9qLnmNFNadUpax+
         LLXurO48cNuRKJDmChA/5/pPHeZzr0izCkOi7qggOH5gNlLyxAJJyPaxI2NXKWbpz/t8
         ow2ZuKW4qhZGBCtZY4TQCysujdBkolk/fVRnJRDhLMtgmMuN6FvNRwf8EQQkRlyKF1uG
         gufg==
X-Forwarded-Encrypted: i=1; AJvYcCWtH7YYvmn8l0O76mohS7cP57w8LtG4cf8YcDXPLnP3IipsafFMqjuYau5xxvherp833gjFNEXiiI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WHlP5fL8cFIFXODkFHdVkg+wO32TlNBli8ZTPwbviU9pVoVo
	xZWCQ06DmlHldJifao0ETeL6yAF2lQuzSgucUkS9/m4CXwhgrdNtCTHPshtxFYnhzkjAxdZrPp3
	DA3toSTlep4lVfAxOosSDJDStxE0wNP1jleQsGwVCbA==
X-Gm-Gg: ASbGncvryVR7d1wsgG/8OpC0NF1fE9Y7okzTauAR3pLxpOmE9GIDwwvxuKE8sRMwbB7
	kR6yAuRCgUdeTT1I4oOnustg5U91Aj1WCCLAA5/yLmUsonmlv6txtUnbj48ygtzFfMBQbUCpRwp
	Undr6APtuMcoHBZX0d0m6i7EDQkD8sNWYxsDyvc5GzrRUgSr6Lif7V7laScYjPTZre+E3FC2DXb
	b2c7ITQYa8KvPgoivGm/etZwEtO18jO8HmnrIbAIKcV7hNsdVBxsXNzzoSB
X-Google-Smtp-Source: AGHT+IH74o4YwHFrblcCgtKny6KnIQvfpnqGtyi6DTdYt7rXfkYKCJxr/ADLzmPlUwLvMuIMarNyWU51gxQT7nyU5+s=
X-Received: by 2002:a05:6512:3f0e:b0:592:eeb7:93ed with SMTP id
 2adb3069b0e04-5930e9cc2admr556166e87.32.1761602334166; Mon, 27 Oct 2025
 14:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org>
In-Reply-To: <20251022165509.3917655-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:58:43 +0100
X-Gm-Features: AWmQ_blAMBN4XZpjKBnIGmFZUkW4sspYUvqfxOKik98qDG_Txt9XayPb2-OwUdA
Message-ID: <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
