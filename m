Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sg+541+8"
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58F5EA
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 06:35:10 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-67efd2cde42so3350746d6.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702478110; x=1703082910; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KTNi7dR+svtLHr9EuyRcDA6UpdWYvTWzjT4RYlMslAc=;
        b=sg+541+8zoRqfCoVuuIghcwZCGZAVzR+QvKWoNdUAkV3UR3j2Htv6zggzTw/6BtkZV
         D6Fz3VvD/wwNPs8TBpH4UCukTtp8g0V+kxNyWaZ79Al9+5szwuxdZsQ2dERr+l7SDXZE
         umAoyKWkAsuGmNpP7TAGrY7Mqw8hA0XHJRdb7WCjHSbWHWXngUVl0e0N1kfx/u9Sdn6q
         FL1bT5WFMUJwdjDYcC9+R3ao+LY6xUqMhLknyz9NUaRlNcXjfySly7DZZQRLKX5fCSUx
         mPwGsVHwFbAFSpNx8m6LRYCXd0ZRQhCVsIMLeUbhfb6BQTtJWlluzRTGfcBllr1rCAv+
         R+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478110; x=1703082910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTNi7dR+svtLHr9EuyRcDA6UpdWYvTWzjT4RYlMslAc=;
        b=Lmn8xvOuORVjbrvvxdeUwnR7hMhRLRKrGXA0f4Uri7Qn7NTjO14ncRTxXyv4AVQxAa
         7YCl375SI74HAhRdq4z+OgG5dFAvDAXF2IlGe94oFB2TWec0u3XQZ1JoVeX+5F1G1fdf
         /pPYT1zbeRkpfcHsnZT1hfNLhtN9SQGAktqltl4DC4qZtuM8qQlUu3KxpM3m/0TnKHx6
         JzYWzU7mq3EB3BY7ePMKiIVKRyyConEgDdAncin7fgHdn40x9F74/apulQDaQ7aLBhen
         MMgrPOqz4+AzVNRLjHwr30GFapoS1x9NqiOK+0jY03/cWAt4b6m9R/kkyN6BecCcUO2T
         NGvw==
X-Gm-Message-State: AOJu0Ywuqj63SGxP9asY2OVDo1Xaizg3t+jTtPrh0FWW1vNVKiRqUd4+
	h9nN1Dv35lOAQuiFme3tMYeQcqklGlg6rKj/Fab+yQ==
X-Google-Smtp-Source: AGHT+IH6ErSqj4HVtA2uJPaby1dJ9yyZlKr4jTaQrX7sGd+lhiiTWLXuE/j7czQuoLQh4Qis/8Wg8Qzn43NmjP/zrwU=
X-Received: by 2002:a0c:f992:0:b0:67a:d9f5:19fc with SMTP id
 t18-20020a0cf992000000b0067ad9f519fcmr11200900qvn.28.1702478109905; Wed, 13
 Dec 2023 06:35:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-3-peter.griffin@linaro.org> <170247795662.1093374.11352509671907840697.robh@kernel.org>
In-Reply-To: <170247795662.1093374.11352509671907840697.robh@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 13 Dec 2023 14:34:58 +0000
Message-ID: <CADrjBPqqTtimdR_twqqvvzyMAZ=Z4YoVKm80LT_utqcO6LAgOA@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
To: Rob Herring <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, 
	s.nawrocki@samsung.com, willmcvicker@google.com, gregkh@linuxfoundation.org, 
	linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, 
	kernel-team@android.com, olof@lixom.net, linux-watchdog@vger.kernel.org, 
	linux-clk@vger.kernel.org, alim.akhtar@samsung.com, saravanak@google.com, 
	will@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, 
	linus.walleij@linaro.org, mturquette@baylibre.com, soc@kernel.org, 
	conor+dt@kernel.org, wim@linux-watchdog.org, sboyd@kernel.org, 
	robh+dt@kernel.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	tomasz.figa@gmail.com, linux-gpio@vger.kernel.org, jirislaby@kernel.org, 
	semen.protsenko@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	andre.draszik@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 14:32, Rob Herring <robh@kernel.org> wrote:
>
>
> On Mon, 11 Dec 2023 16:23:17 +0000, Peter Griffin wrote:
> > This introduces bindings and dt-schema for the Google Tensor SoCs.
> > Currently just gs101 and pixel 6 are supported.
> >
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > @RobH I removed your 'Reviewed-by: Rob Herring <robh@kernel.org>' tag
> > as since you reviewed this I added the empty ect node. Can you please
> > do the review again?
> >
> > x# Please enter the commit message for your changes. Lines starting
> > ---
> >  .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob :)
