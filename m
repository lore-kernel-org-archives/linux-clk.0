Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E93546DE
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 06:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785566793; cv=none; b=qWzKILbOFYJnEXhPTvEKeYGlaa/O1lvrSuIrpUC1ORp+Vr0cxN5hSy6z00vGM9Tjxw/E9gsnhNHozkYZVh0mNAp5zNZlogbDu0ibXpCeL69XHjw7LQdslbVRChnIZ5oazvDutXqtHU/yIFUZEG0ZDBDNc//HmhLKxDCbmiJQGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785566793; c=relaxed/simple;
	bh=LErCCR4nKC4XHfd7uC4yKWkLcjq9F9iY393Fn8sX9Z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJ1+BsZa6CcsRZYZ2/HwHKdIaLnxmQngyZSo+CuTm3d14SMqpSQ6dLEkm7AgJD95oUmPEM370dui3MByWDFpsZLjQsd7VUt8yKHT9fnsYCiek02+yt2oFYVHo7oY0STKOdulbBf6DpmfpSYIfR0A+XyyBLYsFim7liSaO+mqlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPCnafdK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPCnafdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F571F00ADB
	for <linux-clk@vger.kernel.org>; Sat,  1 Aug 2026 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785566791;
	bh=NziBy7OG33oYiNr9JUn+R/txXnPdgHaF2LDnuUeFyYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hPCnafdKqYHmdeMbJZS3eiyYSQEMIroHl7dg0JHm/f/ELGhGaKpAyRgsGaTd5d5GH
	 q2xBIbT2Z1oGBXiFy2QhUOk5T5b7baOmE5iBM6UyfbNdwsKS7ft8QM003C+0t8kJmL
	 GYH6dcAPXg6blbfGmd/40AYzGSFl4lZc2/T/xR2bmY1700gFIFeGk1lING7ksn9yf0
	 8i6/VdQfKzUKXEmkCdlzvZtLV4WFuxPZx9u6pTeyiOuxplesbGrXzqDy7TxXEaFa3j
	 Xt8NKn5NIbYpQg6U5TY3b1m2bNEm4wJDHM5ksVnFEc2eCJqCv7WdWSIVes9qlheM5S
	 rNOYUEh3fHfjA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so1711810e87.0
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 23:46:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoBf0Jgcx0L6R9LrliKtfvXTstiNo4r2uFHbrzODpSRncI7GX4R+hLwvzZiVvKuyNkyFCkbhKj74Hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvMI1v32ZOn3NqXCM9BaxF+HsHKHMWFq8q8v+ugWEjZxonp3Ol
	kJCmpIeKSv5/ixrMgPtLVPfiFNJOG+59/CwY6S6SBU7zfNuKJ989MNeMRtKZTB0Wa3wFk05e1aD
	RHUBLV8ZqUKyHSef5TR/gm9rJIBCOg7s=
X-Received: by 2002:a05:6512:3b11:b0:5ae:bfa0:54f1 with SMTP id
 2adb3069b0e04-5b2e4f969e1mr490370e87.59.1785566790672; Fri, 31 Jul 2026
 23:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730104330.81367-1-longzhao@ambarella.com> <20260730104330.81367-5-longzhao@ambarella.com>
In-Reply-To: <20260730104330.81367-5-longzhao@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 1 Aug 2026 08:46:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Zw0_jKj4FiVHAVC6ASjRJgOF6WswAJBZD=Y3nQCAauA@mail.gmail.com>
X-Gm-Features: AUfX_myXQ9tmFb62wnb9uBwgjcMdvhCxVtgyWuLAaEHToUKhGjWH6cV58R5yeJI
Message-ID: <CAD++jL=Zw0_jKj4FiVHAVC6ASjRJgOF6WswAJBZD=Y3nQCAauA@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-serial@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

thanks for your patch!

On Thu, Jul 30, 2026 at 12:44=E2=80=AFPM Long Zhao <longzhao@ambarella.com>=
 wrote:

> +  "^[a-z0-9-]+-pins$":
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      function: true
> +
> +      pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 96
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +
> +      drive-strength:
> +        enum: [3, 4, 5, 6, 7, 8, 9, 12]
> +
> +    required:
> +      - function
> +      - pinmux

Usually either (function + group) OR pinmux is used, so this looks
slightly confusing to me.

> +        uart0-pins {
> +            function =3D "uart0";
> +            pinmux =3D <AMBA_PINMUX(44, 1)>,
> +                     <AMBA_PINMUX(45, 1)>;
> +            bias-disable;
> +            drive-strength =3D <8>;
> +        };
> +    };

So I take it that "pinmux" is used for all the muxing while the function "u=
art0"
is actually only used for the pin configs, right?

It would be better to encode the groups into the driver I think and then it
would look like this:

       uart0-pins {
           function =3D "uart0";
           groups =3D "uart0tx", "uart0rx";
           bias-disable;
           drive-strength =3D <8>;
       };

As you can see "uart0tx" is easier to read and understand than
<AMBA_PINMUX(44, 1)>.

Also it hides constants nicely in the driver. I know this is a lot of work.

I know a lot of companies like "pinmux" because it's simple and
convenient, but it really
isn't the best for developers writing device trees and debugging.

Yours,
Linus Walleij
