Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB665810A
	for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709197954; cv=none; b=Px9kNfZkdFmrOgbDG3XVLrtNR2qhC9UPkLWitr/ykNRLKAdRT0+TCtW0IP6REyI4Ye2MLUiLBcSW1ntuQpfSCHVFNEoOplxZhqZCOcLJa2qPnSf3nPRn9ZVc0B3q5QUJ3y75Y1T2QgUDj9F3TFLQsmAW7EWrGFJNozwN/tLCSeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709197954; c=relaxed/simple;
	bh=jmZ3qLypHNtRzpjVcX8wNh12ZGObOwM4O6LdoHLfufA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS7ruG7Uj5G4X+HG9dr42si8npfYH+1Ml0L37N/FVgwluAIyF6qGkNFIbw159ZdMrvFIzdAlyFpdJueH7Nd1IWy9pRlqUbwjVb6c2mBgK/Fjxj2PxY5oPPPZQXTktnwJFBMN5dbSmOOUNQr2FLMK6GB7fUb7LbyXP52vzzjZPHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSMJhSHD; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSMJhSHD"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dbed0710c74so640204276.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 01:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709197952; x=1709802752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmZ3qLypHNtRzpjVcX8wNh12ZGObOwM4O6LdoHLfufA=;
        b=ZSMJhSHDa8oG65KuSF6uFUq39xA4KWERowin+P+qK4Vf+pRXufiYCSp2w6LMn8XFaW
         JK/kUNjAAblNyUCYsRjGPZTA+a++QXc8YvVwb5RKN+WRk8osarsDRXBntzb1XksPv26K
         Mdap///KfZ1Cre5VQ78YhDb/P65/TIMlqrEuI+NzIPpaf3uvzDgjThXfmXIRSY1wTDwT
         ZUQRbtuTHJ04EtOdvKVLIEC0cvcggfXeZ35uikJEar0nFVFP9v0r6Ifzhe8UhHJLYjXu
         ruYSDUvKsQXr1oNxPwnnf8esp3PRQFWo/5L7+9iL1IyQ+Ceu0qxqLMq8oFnfUegEYlvI
         zrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709197952; x=1709802752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmZ3qLypHNtRzpjVcX8wNh12ZGObOwM4O6LdoHLfufA=;
        b=R9lQxQ8Tki/lJuL28PHgbReqlpJEVARdJf7GMO8A7w3JixrQaLbqeSOPnL80EhpPKX
         /lN9IOZ+3aH8GlmXjcmSWHj58sONILV6tRXbMLR9jjeZVhuovRXY6YZQK80YHCbVUKy1
         869q5gEJqYlO+RbhtNfsjQ+iVE4auHGBlrqTy4nQRJqW69WI8+3aiRJo7dG8ajrYH6yD
         Xs7HE9/zelRSAt/OQDqUgu2l6a42+e21C/AS2KwE8OMGThw0MDnFH20UDWWuzBySjGdT
         lFNCeXfXSLL1go4xb+46j5SezyLu5CNxppRcC8Nve1NYsY+/rOzwqh4ZGJFC20F+Cnrd
         NJvw==
X-Forwarded-Encrypted: i=1; AJvYcCW2EamFNfqE/k2NT5c1Qbs2Fp7qGLptv3bPlkfSRgEAWua+jxg8mIkOaZ2xYxxcK2+sMFNQSCUXH4CcGT+9eGKHnAR6dF7r1Xtz
X-Gm-Message-State: AOJu0YxlJOhmArhkdUR1SKDkCOEsVaslbrV10wOnQjV/ihMhqdye0sbR
	UAgCt8BezNCTrNaEsHrIubCB4wFD4gtER3TbPTrP5FwBPITtd/C5tCGnRZnHSShol7/JMtB8iao
	MypSUcBubwLQMQ6TbItW9CJXMUy5nbDDjhE043Q==
X-Google-Smtp-Source: AGHT+IEAi4/pXUDtlLl34+LSgCiaeZ67gTneHjdK0XuY0Ypo72LCRTzLIF12Q3GEdeS6icfVUdzIU6lcYWk+sFDA73s=
X-Received: by 2002:a5b:9ca:0:b0:dcf:66d4:1766 with SMTP id
 y10-20020a5b09ca000000b00dcf66d41766mr1505518ybq.52.1709197952220; Thu, 29
 Feb 2024 01:12:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227-mbly-clk-v8-0-c57fbda7664a@bootlin.com> <20240227-mbly-clk-v8-10-c57fbda7664a@bootlin.com>
In-Reply-To: <20240227-mbly-clk-v8-10-c57fbda7664a@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:12:21 +0100
Message-ID: <CACRpkdYtwyKJ-j5Uyh2=jvQ5k6c1b1rW_n02YeKJh9nuRo=i5Q@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] MIPS: mobileye: eyeq5: add pinctrl node & pinmux
 function nodes
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
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 3:55=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Pins on this platform have two functions: GPIO or something-else. We
> create function nodes for each something-else based on functions.
>
> UART nodes are present in the platform devicetree. Add pinctrl to them
> now that the pin controller is supported.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
