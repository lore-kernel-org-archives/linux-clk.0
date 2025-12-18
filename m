Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7534CFB3
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072148; cv=none; b=XPtaGgFnskTNq/YZfcTny3Bi+/TIuGvh6hVr1SPxdbeFkYnpBxv7oSM0dtHS/d0+PyJ59grqofG7aBg9Lz520kiVwyd9XGTXalXYhSY17xAgr722z9BJ6RSIz4WvNWERfmmfI5AZqbZjbgSy5Hpd3aIUG2rIp2vYpZmrRFIxCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072148; c=relaxed/simple;
	bh=azzl09Wx7rt0wPbIl6zF794mRt/KoBI4Cg5cx5Yj+oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+GYavJxChQkmvxFlGK5NHoSdmdUQXD4HizYeyA3aaWr22/eBjIHiWyDEox0M4NTsGIpx1r22goo0f/Srz6e/p/6QL43GWxnNW2qOm7tfzeg5iDl/RGUUEkmexPG00BDk8o7/4Ro3P4SJ0HanwvSBwhh+FOW1KjrmpbHhHYkrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b9f73728e8so78785085a.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766072146; x=1766676946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXHlTDVJTF5vvWPU3rkwyK6a19VuMS7dqDcJr9Xe7V4=;
        b=HZXGemet2LeB5oJ6jjXNC1Lt3AZUf5AQAl6+/yrLj5psExH+qXNci3od98rT/Tup9F
         Q0LN99VuGskKcMKRdE8Z9qQtB3318MlqF2lvZcZFjtj9oz6GGuC6sYnpe40jOxqoC/ab
         yZzocIJjcLZl5wKn+vQ6maFf8TWMbOPFIVmsOMn/B977z5q2yIpDATkMdf2djOgaaoUm
         eG2cOV2FjQfYFRR5WdLNDJ9PmG/dyrCOVhfeMsSm+kA9OoaAa3JtD0v8bFY3KSbw1Ppd
         vqLGWrYsUrExAoAxdlwD5MX3huDGBJqwq5fjOspZJMGX1DH0p0DE4WsB89loM/ctsY0y
         hMMg==
X-Forwarded-Encrypted: i=1; AJvYcCUnc+bQ76c2oBdkHPuL5rk9/6/l5JLkokT/EI+Eb5kPIouc1HDDzRdkdU5GJywpLxG8E3XiEPkXtic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDS1K9WFvkn0ZP28LZRKQgz5zdZGDcMzr6/3aZJtxFiFSBpy4H
	n2D/Cecm0jo0ksZwsr5GIPJ3+td34zMlAKBswvWBK8LiylvWyqq545aHGkn4hrrX
X-Gm-Gg: AY/fxX4e2IswdHKEVEjAPAL/w9Qk7vpH5PKPPC4vBi2x9qX+AKLeiC76YRDEXLalO/S
	NcFqUa44UXYEsMHwDrHeKabVt3ZjRAWEpVJY7VwNT+ch95qjMb9RrEkFMQ3vBsfZN3Ecuxn2AOV
	Kk7l5FV35kgBcWQ7AFtR6GOpKHHdH090dvLe5jj1L6mNOakU8ii4VmJhZQxsRaVe7jkHVkky/5R
	m42MkzTjFW1uyM8S4LHkGBty4nmbk7Xw1PzKsuWKSJGbuOaNhXJUjPYSo02w20KceGxOQvw47mf
	mP6atbmmaMP09T4LcfKjWxRotv9JAyTGAB1d88Gyha5d+bHEoSClbkCD6+rdNNghmfxHkTyv9V5
	GM8yI8iV4zqXuW0GfPXf4cFSHNVBD9yD3aHd72apcfGfuW4GkmEyDg25FtE89kWXUJdaO8IvFQ9
	zwCZbZ4qNKlXJ6y8AsGXOapN12HDExtdoIaj/y17CzxnFbzcOlQZgQ
X-Google-Smtp-Source: AGHT+IE+bpUFdhYtvKuMno3lQwHGInl+TzWpFBi30pZQbX9kYYi5eP2x/xdRfNVU+nVb2UTYGZWJMw==
X-Received: by 2002:a05:620a:1910:b0:8b2:f191:2b3a with SMTP id af79cd13be357-8c08faaf173mr3073685a.53.1766072146278;
        Thu, 18 Dec 2025 07:35:46 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beebb4a1fcsm185095085a.55.2025.12.18.07.35.46
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:35:46 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8bb6a27d3edso70818685a.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 07:35:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWr/L8lc2nBHPKfeyNVDonwFRiM4n04ZJpWcflCcFFzuY55GQVeIh/B+CcfMYk7zuVZwW1dLXLtuSA=@vger.kernel.org
X-Received: by 2002:a05:6102:14a1:b0:5df:af0f:308c with SMTP id
 ada2fe7eead31-5e827854ca8mr8511390137.38.1766071730637; Thu, 18 Dec 2025
 07:28:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:28:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
X-Gm-Features: AQt7F2qLc82Kbfmr6BXfh2mc72SoQ2IFZ770WV9-Gsf5ezj4RJc3ZYutw9_Yvk4
Message-ID: <CAMuHMdUkghCNb96J38hbEZ8Jct6m2MPvnPumGp-y_dPfPW9eAg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Support TQMa8QM
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:22, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
> 1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
> as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
> property on the parent clock.

Hmm, clock consumers should have no business with the names used by
clock providers, even less so whether those names are specified in DT
or not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
