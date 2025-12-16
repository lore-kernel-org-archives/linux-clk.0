Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E23254A9
	for <linux-clk@vger.kernel.org>; Tue, 16 Dec 2025 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904416; cv=none; b=jyojLu73lG6V0HebmAG9/lZLsReaELfvC+b4eCw+0gooOp3r/8vER7Y2d57ZoDL9yZarh1EK/LaED0fNvTSH5kT3cp3scTrgiHuUPhFrbV1DRQgexIzwnGe/WT3XIzC/PHEGgwF8TH9lgENxIRq2o3kkVJ6fuHK9Za7AQDsa0dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904416; c=relaxed/simple;
	bh=3IYSY9PEuKyOHfJY9QUPzKffXbog8qESM1aHD/icEQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEEt2DiIPq4rFXsNVKWytFGlsTawUyxGDRVqjxTToyh1tp6bsHbB+YGbJ52sTFuFhYsNvdzGA/IzMeg8Qyj9AKusTdgAe6Pfz7mr0KtBS8QWQXt+TBo4EQf7+6u+E3jZkrgEKv+jX64U6ZxNI27xbO5uozhJJek5S1sYyRjKbVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=uLbYzMri; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="uLbYzMri"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b735487129fso825959966b.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Dec 2025 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904409; x=1766509209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3IYSY9PEuKyOHfJY9QUPzKffXbog8qESM1aHD/icEQI=;
        b=uLbYzMrikJbXrolr+nmd8GSQvVajEW2UEgZcKqPe98hLq6969czHgw88r2gKgv9n5u
         ixZqm5Wo6D1T8G67PuoT1Pimw9a9H8Gng18B+7E8HTMjw56nSu1yz7gDHw+g+vmRSKLr
         gk0/g8Y+x/aWaCUqxrwE9zDC5PD8LV9bGzo87ea8hL8QgKCjEm4k2rA4fDNMuZjdh67E
         Lox7A5otoQz5W1IywzHMQiIHGRqUiI9nJtEW8Cx4k4A/B/guEyElge9f6iEfVJEdC0ux
         j6abMKT6eZjDeqEBa22QNXgQVQsab+JFiVeCrui/Jnd8iWbRdR6hnfFf4cCZMy5cI6ar
         P1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904409; x=1766509209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3IYSY9PEuKyOHfJY9QUPzKffXbog8qESM1aHD/icEQI=;
        b=a9y6HPhhns1MXBeKLQucT6xoYG53SFCt2B8BwjZjKA3eflXY7l0Hp5Ws1l/y/IzpbI
         1YYxd+YNT+cZfj2cK+0QgppB0LbRQ8VlQffg/MH+ITAiIpzrZ/FPJGO6rL2kBeOa1oAP
         AxE+K4/LJlUAqLj65AGazJ+uzYBqkPORmLBuhiNB6/vflFydWvlyJiDd42XaHt8osWbu
         I7IZt/U9TF43+Gsi9XqXhrXFOZQ10E78Y99zJPPedZQ39Qo2RawENs4XoPs6e8X/US7E
         nhc7FodW4idYNdQj5zjX5QfwILJJKWHjv+kfxqDC1fNfyllQMquGN+PWNQqK4LtEmrbT
         Fupg==
X-Forwarded-Encrypted: i=1; AJvYcCVLkzGdaq41uAiXfqCi9f9+d5vuzkP+gG2hNylJ7oLsUx5U/IW/OdhWOEBnFehf0k792CvmwXMRNX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNLVj7vH0WG6fQAgTgBK+VyZIMVUc3JgUjXs3YvALJOT3VJeyu
	E7RW6xi5Ma0AUgyjFFJWQ8aH0Kl4HJRP6dpQzks4Z5CvbpfxiXRMT3tclGt19OHY25XJVtErc8P
	gm1HJ9Yfid4mn5A8tFBJdo1MlgFoHTN14JVQKUQzdsw==
X-Gm-Gg: AY/fxX6UruzNX3K2+YDW9V5eTbHheDWToQbW401KEcXlGrCusDPkH63sp5k4oSk36KQ
	+xnL+gcupCmDUSVZmPaFTNWP0MWJRuuTgYdLp7cZIDgkXQaQCFbWcVLCWV4/j5ssMJddcfnVIp4
	qVjLrDxzt95PbdRxha6eAazIrDAIClBuTSHUrSaP//w1nxcNzEH1gXdCd7qryUlpFiSJsrJEk1B
	dEBtmxrOCAbuYFdn8xKCzD8BoXpjeYmRcYG9elZI4bjhanD956/mQhyTkAZ0c9rjvZRpe9L
X-Google-Smtp-Source: AGHT+IFwk4Ao673gGD7fsG2ghKfE+CBJxlDalRvkjfP0dfzZsUtUavnidDCo43zIGnGvG5i0aqfY+tiPySp8HUjss5M=
X-Received: by 2002:a17:907:3e1f:b0:b76:f090:7779 with SMTP id
 a640c23a62f3a-b7d238bb030mr1612478166b.33.1765904408497; Tue, 16 Dec 2025
 09:00:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr> <23e02efa-bb94-48ba-9b6c-acee5d8f6576@kernel.org>
In-Reply-To: <23e02efa-bb94-48ba-9b6c-acee5d8f6576@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:59:57 +0100
X-Gm-Features: AQt7F2oKQzHSEY0k9JattjchuSq-s1wqnAD6k9L-CshDVUNdGCLvRtWCtUFfTxw
Message-ID: <CA+HBbNG9wcDTPD8GAPVECecUN8maSvTyahkxaXsHqzLY_8aM3A@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] include: dt-bindings: add LAN969x clock bindings
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

On Tue, Dec 16, 2025 at 4:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Add the required LAN969x clock bindings.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
>
>
> Where is cover letter for this patch bomb explaining previous history,
> giving lore link and providing any background/rationale for making it
> one huge patchset?

Hi Krzysztof,
I should have made a cover letter indeed as it is quite confusing.

I did not plan to add all of the new compatibles, but it was requested in v=
1 by
Conor [1], Nicolas [2] and Claudiu [3].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-4-robert.marko@sartura.hr/#26687201
[2]https://patchwork.kernel.org/project/linux-arm-kernel/patch/202512031223=
13.1287950-4-robert.marko@sartura.hr/#26698565
[3] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-4-robert.marko@sartura.hr/#26690625

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
