Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB569951
	for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522720; cv=none; b=ib4nBiQ2XLxsYGo8dmSls99OKn7CWKMXMvOJnUZgbgli6kWIlA6gFuX8YDFfI5ATu+PJG/su2OnjmA8uoGKaqA0An0tMN75td8Z5V8WMdyLtrxK6o2/ZXlYTS8xb/oGXBKZixu5kagwY/I7YXqtHZCN34G5ez8RK18fj7s7XMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522720; c=relaxed/simple;
	bh=ph2UbQgsrbuCfnh/AmINSm2tHoGX/U8LJgWyPisUXjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OF/DUBCkqfVP+Wol/q6vYL8Sj/si4GYMIVxkS49Qbo5VfnQbC2h6tiBt9L/mIT57+zanX5TQRBICvSOH1qB9b3h+RJgGZymMSSC5tfINVBcx9+Uy0D7LA3jNrmQVIaVw/oSy/CG6ZdqcNLOBq4YkETDzSVKqzwchxYOBqAUgoBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mN4Anb93; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mN4Anb93"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6d24737d7so5974061276.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 05:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708522717; x=1709127517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph2UbQgsrbuCfnh/AmINSm2tHoGX/U8LJgWyPisUXjU=;
        b=mN4Anb93TyOuMCHkH2B+0+jOratxIs0faqE6FYvN2AK5/qA5eyJ8A6bVX7hLpyztas
         KjwwFNlqUA1CILCqeQ2CmYGSbvod0HAccRXn6sWolw9/m1uXyvaSoz/m60xzep9zFmeu
         Jub4BYZvfiYqjcD1/6YRWOph5pW2T3T9Id0DdtmZx+QC1MW9r6bo+ov/veqB6PMLIWmB
         mP+LhIHiWKLuRaee6rXky7yYrQuMvR+RKOV8X2x4h3FQ+PjNGsfRKhkRpaPEtoZPaIIN
         caH1RmeYoXp2DMICeE1O6C/2fQM85uhJt6gtj2A+LPdCHhOMsGT6RTFRK7bny04CohjX
         CAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522717; x=1709127517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph2UbQgsrbuCfnh/AmINSm2tHoGX/U8LJgWyPisUXjU=;
        b=qejS6KYsgmJYDjo6CiMVKyYmF/S/HKEDRkV6upREwBM+9rAmA+X62IWbvAQuvn5f6B
         +kGC8YXK4ZRJbpXiExnnBFRoOF84Qk3JeKZa+DIXRrv1MlViloCX8BjJh1ydSIO26eeT
         QVKx7WDZJVFP8nMKv617h8vyyjG/rzv8yGilJD1HwnVHnaIqa1csU9Ba83uCVfeRx2WW
         iB63PVzUDuML/DLq/JPf3Own5awB4L9fkSDwL2n8vw8Pamf7JOoNLB1YDWynT/ZgB0bL
         plkmVlPN3gojeVdn4Qx2yCNJQdm8bC73BwrYu2V9LsCkGygo9Tzh74wZe6KHjwgal5PI
         8dzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7aQJSy+x9sJkiCg35Ys61gJ+L0awfJxc/hOBJO+qQW+wDAHtOJQQEeHNa3ysauWPxbqe9M9CdEfrMKmGeNjoL+Ll8odhCCtOG
X-Gm-Message-State: AOJu0YxiqxsnIFnohkOY4GEexJ24gjRvOWENR4EsRAT72vfi+GDwDBY/
	jQCuu+7MoxcojuXd+NS1Z/ZuNpdDzZLhc0EWwnaio1f5fPufib6PYPHYy2CT2YchFB4XBK+1OgU
	jcaj3OZKkdxxxulybeuui9k5fCLUZ45XPvR2i8A==
X-Google-Smtp-Source: AGHT+IF2OkLRDdLse8vRcitJs8gTndLo8D9Y6JeTVVYt2QhVtGqFzHLke4WYR6iZMGxv/F5qvwz1XhINpDDxRT+71EA=
X-Received: by 2002:a25:ab06:0:b0:dc2:2e01:4ff0 with SMTP id
 u6-20020a25ab06000000b00dc22e014ff0mr15988542ybi.45.1708522716910; Wed, 21
 Feb 2024 05:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212-mbly-clk-v6-0-c46fa1f93839@bootlin.com> <20240212-mbly-clk-v6-5-c46fa1f93839@bootlin.com>
In-Reply-To: <20240212-mbly-clk-v6-5-c46fa1f93839@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 14:38:25 +0100
Message-ID: <CACRpkdYNe=2w10uB1mUgs2Lgg1TRiSF=bOa45OH5Lcz6+G6FEg@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
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

On Mon, Feb 12, 2024 at 2:44=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Add dt-schema type bindings for the Mobileye EyeQ5 pin controller.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I tried to just apply the pin control patches to the pin control tree, but =
I
can't because of all collisions in MAINTAINERS.

If you move all MAINTAINERS business to the SoC-wide patch I can
apply the pin control stuff directly, but maybe you wanna keep the
series together and merge on an all-or-nothing basis?

Yours,
Linus Walleij
