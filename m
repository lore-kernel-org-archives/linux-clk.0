Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C0F3D5643
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696247; cv=none; b=le4NijMj8ccWQ31ucnrCNUDFkOZXKIZdKX8vZR+6g6jve5+sGIUkaJBpxFo3t3gyw21vT+1BZM9PPIme6ttS+RU3M8fyr7ztpNIbyRLgSkkykz70Nge1E+Vt2VJfq/CiLN0Xp5XFs4xgqj5Vp5p+fkN3BcaUusFbaQXnMwI9mMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696247; c=relaxed/simple;
	bh=4vllGicUbdN0Bqlbgpv612IvW1fY5Ga0NBXa/j5YjIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enEk+XTZVVrZPmqUV2pq1k5vQB45bqjS1bW9YFlFPwS4B2t+tWHloIqRZy7yzy/bK6z8gF1Dw45lqugrMoIA2EdpSca6ZuxW/2O2CqI613vM7ttjCJwHlCVnSe/JGAtlmaBWl6tahJz/UpuUE7A88BgyXSTJrRerQzZ8WwXqdDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONAbaRd5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONAbaRd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43541F000E9
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 08:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696244;
	bh=4vllGicUbdN0Bqlbgpv612IvW1fY5Ga0NBXa/j5YjIk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ONAbaRd5hqziXmIjbcC45rSuMKkCRwKMzaE5TnBLMmpKaBNi2XQTIHCByRBlPx94U
	 D0P927r+Dy99NpqkcQvUqZWEaAqOFGFfnEs5lHaRE2WGyJv7xuLufbCsGcJ2oRfLbj
	 gKaHHVcaKTqOAvznP2yIgagbACgHVBeY2UYDElQJ3Mui3JaEOF003cyzcFNZhN+R24
	 T5Ew2lb3JwFp4FZpTOByXSTyVg0JzCkrQsxAkhl8GCCRDUCoExzF/aJgKQaUr3Tx8r
	 dSeLfEcsUr18+bjRAchySs1/M5kmAJ4cKFtzjeP6gVrnaPOxT4VR3tU1zzmn1ztxkG
	 W39EL/s9uPKMw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso9996145e87.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 01:04:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ90jo2en1dvRaSE9wZAGb9bgXKacCo0LeTG8nfkVCnCJVmtjvPn/gaw4RxvWzKD15RBj4se+s4e3W8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzljhQgn7CTbFCSa6F0Hx79W4uVcbfLifAw1Wxc6IlCgne1yOUL
	B2tLfrUIugwg0KI6QXO3L+oLvG3SJnSUOG5q4Vcdvb6FUuof5p1WXf8eq6MCYUr/Lho9b+ax3bW
	pHIMZI10pbZVOny4PMa+jfHoOip1Gf3A=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:8825:15fc with SMTP id
 2adb3069b0e04-5aa3238ba06mr4490982e87.3.1779696243482; Mon, 25 May 2026
 01:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com> <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-1-308be2c160fc@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:03:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLm5Jsrdpg=H8xowFzx9omJhGpamjjcg0LYN2R9HCeW5tw@mail.gmail.com>
X-Gm-Features: AVHnY4Lr6P_gJlk6yPcaGrv6903bIHaJS623wqRPa4vQc7mnCclEd4yYEBmZPTc
Message-ID: <CAD++jLm5Jsrdpg=H8xowFzx9omJhGpamjjcg0LYN2R9HCeW5tw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Lee Jones <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, 
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 11:17=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
>
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
>
> There is no functional change to the SCU binding beyond permitting
> the aspeed,ast2700-soc1-pinctrl compatible string.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Lee can you pick this up at your convenience?

I'll apply patches 2 & 3.

Yours,
Linus Walleij
