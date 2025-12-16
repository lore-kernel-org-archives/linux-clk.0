Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B31257448
	for <linux-clk@vger.kernel.org>; Tue, 16 Dec 2025 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904110; cv=none; b=mUJAoj3Bo0E813QpE/JzB2OluhCMCbmaFAMIUc67LVxIJoQgBixV5/Yv9OmeGv2DbXm9lCx1GvjV9qMQeObIyHtAA680OTKaxjyZwcjCs9iObORncSoa7SjP37NCDQKRn0sHuN9aCiIx6BMxk6lVIzkepqxsgxWor7DzjF0p+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904110; c=relaxed/simple;
	bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+wWAXSfDpv9lT0J0GkwkgLgmP4KUT271b9uagCcYM8TjPufBOZIW9535ZXFgjDGLDnrLJ4kP/booRVf5uJ18lxGxR1+Eye7/ezdepIdQsc1dIo7yCDUTybfYv06x5GXSkya22vJFeMvT61roa+SNtAeOxRDSCYyV165+rBayE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=p2nctEGS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="p2nctEGS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so6857978a12.1
        for <linux-clk@vger.kernel.org>; Tue, 16 Dec 2025 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904106; x=1766508906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
        b=p2nctEGSNrBNH4w0gv/yBfai7zSBJT37Uc/6sCOChec1JnUq/nw1WTcH4vymi0Gysn
         AroI/pZ8T3uPg5QkGXajLuB2WTjrAnztoLvBwRjqyRxmsBdcDCAW7YCLK+qAy3YVpRm5
         0jIkBfTX0ws4dfu2mNth8gjTjWhMx2EZQOKy6QhhKNirbkDGS7qdWp8SyOJJBY5ST3/z
         gC/oZXzU3ZyGWPCk/JG9jpo9Vkqgmrtj44yEOluChgE7zG0ptlixUvmEO84b9YPhYhTg
         blywLMj7i/cbZeihiF4uHL5VtC3JYGC1MiBUPlqXRuBI1Jo8lJ3VlO+hLQD3TfNz6+g/
         TiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904106; x=1766508906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
        b=ivOACqdMDQlCu9koxAreCSDCfHO2qnWn5YO/VanJEUd5a9CM4RmdJAlRcij256UEce
         NwdDx8ZFr8o9isL2ry1vLYoNqT6Sctn7+TaXMG1G8cac1mYP/OEh7IEglElm8PQ/9Xvu
         f33FwEyAS2VElqYnWayY8eqF8Uxr2TvOTZOVvmANpkx/ZsgXR+0JFhWwXSwrjaIi38aE
         OE5Uf714vKwc8vnKqJBCPL9sV8tS2EKacqq8QLUIfhmiDTO9ys7924peUFbWaWpsU7Ib
         Kt/XjOFMl82fdK/HpYzzKujH8mGkujHU6IjWbTF+H6g82+pmAk7VOvaxzjtSrcn/fxkC
         En+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/kjC4y+lHyh63PdQOrc71VLPqklkLqUGV06cBBmFpyL+GypWa0BUedp6XwVGhX46AsuwKnMULWvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDITO5h3D6Ak4G7eVCVOIhoE3030M8/qMSF7gTCtJ9q330Emz2
	68IlE7S7bo7zAxBs1xrX8FXqo2tm/IFrdgL5JVHKozG8UwtZE7KJMkdhI0z2ADO++bTqtHJHSBR
	wBpolQ2PLlhxSx44vvTZFFF1lUeq6azg1T2g47z6gZA==
X-Gm-Gg: AY/fxX46eZsM1amjBnIeJ65R32deUD68h7dtI6/qxwGhzcFZhanEGXhiU6gt3ZQJ1qE
	pbNi1J5/qRAxHpyNPC0IxbrtsTJmnNRGZBYAxF8j/jNcmemNFKS1QD47ZRJKmTaPKaCM39IpK0K
	1h0mlWe8qpA8R9Wloy1vqkFU0MLxiTV86OERY6lDmvbSbdODqZyH2ki/Ew+4nRKBfcpJWAeUDuy
	zcJWRafHzwxOEFJ3cy2qWsA2v2gOkSevMUCeh0InaSGEjwAONeuy1oFA6ZRk6+Y/6PvqPBP
X-Google-Smtp-Source: AGHT+IHss9Bd1xLNKBKVvo2auf8JouoGjNJ+pij6L9GBIFkYaw2yQJkBsu5mTJ8ApxjlWW3ipaEa8krFjlxvR+te8cI=
X-Received: by 2002:a05:6402:430c:b0:64b:3a8d:8f2f with SMTP id
 4fb4d7f45d1cf-64b3a8d8f4amr1282460a12.8.1765904105940; Tue, 16 Dec 2025
 08:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <39d5371a-ed3e-4262-9cc9-e76c039f352c@kernel.org>
In-Reply-To: <39d5371a-ed3e-4262-9cc9-e76c039f352c@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:54:55 +0100
X-Gm-Features: AQt7F2pB7VocjSO0euYm2JMWHk2AXNZHaLhwttYBwdz_DAq0CW2nlyHeH65guEQ
Message-ID: <CA+HBbNEsXG64L26S-78A4E9dUOnfdtTEQoifiv5Y16_oQeiiHw@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
>
> I don't understand why. Previous layout was correct.

Hi Krzysztof,

In v1, I sent the LAN969x series as a separate binding, but Conor then
requested that
they should be merged into a generic binding, and LAN969x added to the
generic binding [1].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
