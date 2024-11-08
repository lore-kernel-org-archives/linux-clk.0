Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC781DF739
	for <linux-clk@vger.kernel.org>; Fri,  8 Nov 2024 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054723; cv=none; b=rMuoZ8Pcm57dhv0mXVgpqK2LqVlFNU4FXMZiIJgDXbfdl5IfKtEqG51ps3BAwlQAUMMkycuSxVyaIC7ZyPL6R0DYzELylQvlCN7tI8rjTwLBkQO94DXkms4yZR4uQyQckROWTBkqQfH9qynWpPkY+0XO1L8+fxp7owwPiI4dw+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054723; c=relaxed/simple;
	bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IW3KBXWGH8CN833HegAr74R+LQldAMResLoGSwjBzrfaV6qqEB4HuVtfwsjzzB88v9im5fc8iTLEaFErfbt/BLWOSbnDdaWjJ+nJlI43eHvPnB9cl3ofKsh/IAoMS85wmJu1pk07WGWvS0eVyvOccISfvpiVyb8ItznWobNgkCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVWctg8Z; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVWctg8Z"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e63c8678so2020202e87.0
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 00:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731054720; x=1731659520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
        b=FVWctg8ZuaBYLWY61+0XodgtTtsSTBZLH+xKE5gTk6i5131Bf2h9l9VFvy8GxWGquE
         mYdH5VzV5eJafavG4oB83FZyBl5/wo2vy9HQZdt6uVd6BsCpqjmqbfaFAEZAaWJJ4ZWi
         V5b7Bdb4uNO8i170+yYvbv8CU0UiJVGdEf+ZcfOT8I5rC7xpvHPMB84HVrmBpyBNba9q
         /WNaeYv96bOJQGJW+2W0BKcpqYU3nNDZPfOKB/xwZFw7gHUYB2XHRMwf8FnPo+okd4sh
         Na4YdIxyp+IPiHinMKEA54aFJpTl0cn6VzdHiKbMApAXG0xNFp60yoEJR0aUSQ/X2+/w
         7AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054720; x=1731659520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ND9bgK3KQWy+3cq/h1wKxgWNdJ1WBFhWBNSE25A4wo=;
        b=uhiV5WI38r/yU4o5y+RZp+imL7r17a1VY3zttbu+9pokTEJfReOXVS88R6LY8TR5tj
         wP4HM8BQtYFCcUEUw/Q0IhzPZMozyuSs0CQJP8l4mUI4OpnQVn3s9rQdfwPXtmxEDVoO
         4sqOF7z9i3wPrd0+1ORA8H4WDoe25Ti67SwgPhL0zMjyoifH6Zfus2/rX8Nsgin+RJjA
         HtuzIOrqQ+cSpERpRd9QmO5jAC3hj6S1I3TQZg7IukjMjdf59nh71FySkTqMROOzHUhs
         NJCbuJ487VqXZq1VpIN+NAlaqadN5qwUEZqr2RyRjExYGzxMvelrQmnrsdtMuXXGd405
         7A3w==
X-Forwarded-Encrypted: i=1; AJvYcCUz3ARvwEsZkPMdI5nw3k3cDNR3tGdRl+0rnlWeavnXUrVALrTW82Twzn0HeyS9CNHT9RF8DS1m3aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcUQZrbayACDHoJEKQSmOGzSso9ihtrzYQUHH6j+bAwh0JuMqX
	wLo+If33sHgRAEaC/Je44ohigxXvR+/24r5QoNr37X5KPotQgc381h6yTzQE1cpnJKh8dyGmTWR
	2rCqUWQkC+HDS/eUvrDP1Iclg3dGX/xp2C9i5qQ==
X-Google-Smtp-Source: AGHT+IHWAsQqG+y15H2WGwWZPQvCIg2GrPsoE8du8PoiicmJWn/4qgCjO61EIsCAk2BM4YFh3XSjkJBItIutIXE+if4=
X-Received: by 2002:a2e:ab08:0:b0:2fb:597e:28d9 with SMTP id
 38308e7fff4ca-2ff20188093mr8640431fa.14.1731054719602; Fri, 08 Nov 2024
 00:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
In-Reply-To: <20241104-pxa1908-lkml-v13-2-e050609b8d6c@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:31:48 +0100
Message-ID: <CACRpkdZCF5o=1bc=tj7VM=ie-iakmBC_oeJh-LWqtsASw4eRFA@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 02/12] dt-bindings: pinctrl: pinctrl-single:
 add marvell,pxa1908-padconf compatible
To: duje.mihanovic@skole.hr
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 5:59=E2=80=AFPM Duje Mihanovi=C4=87 via B4 Relay
<devnull+duje.mihanovic.skole.hr@kernel.org> wrote:

> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>
> Add the "marvell,pxa1908-padconf" compatible to allow migrating to a
> separate pinctrl driver later.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

This patch applied for v6.13 so you don't have to reiterate it
after rebasing on v6.13-rc1.

Yours,
Linus Walleij
