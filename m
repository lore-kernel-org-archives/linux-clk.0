Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467BB2980CD
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 08:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360711; cv=none; b=c3u7JHIIvek/m81tNGkacfkMsmsAzuXOiq+BMOjk+QFFF/0kbB02vwELP1aIOtEtc6G+638Z/1n6nJVMEA+U0trWqx3x9DjNeS9NpfjpelEJsdelV5Aky43EW5BUsWINw7KgWJOR5K2Zkw5XMpLArEQUMBTWg9FA26yUDLHiwkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360711; c=relaxed/simple;
	bh=D7R9oFDs5xYoXN43Ulwrouo3nLF61el6kbjtNoLpuyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVjbnTj4gYBQIlcx79o8xJbmEcL/JztLgMuGI2LlGWqws8QjMWy7V6HaHRjF/JjfsNhzN15t4ahd6U4h1MjzD2ARUAZx5wtjmlC7FMKxs+Ac7ji1cx/9xbZs2uPUlaD3mo2yerojC9Kwtu6oQPMdc4tDBIpiLlml4ReGt2BwTJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UzpIvUwx; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UzpIvUwx"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e6e2a303569so1341820276.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1744360708; x=1744965508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=;
        b=UzpIvUwxO+k22fbZNAK9zkUFeyaa/VmpTJvs0do+/nfTjsFynHnh185YRbcfQ0rzcR
         vB3E3/0ij478ZA+Qg2zv/OrH/0bL9efzaQzx+uXutMvMqJ6ivOQKWo6IlDs+jZsUJVrO
         ZoAj3W/isU9utclcGyzHD/b6+qj6i5lTWwdLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360708; x=1744965508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtU+pOoZbsLOnPjUI7YZ5FGGjZ40GzcCM59B/7LbYr4=;
        b=vNej4gH9BFFtoudvWXRutRBPz7nsFB0WPxt3ugbIRQNQfZupD1BtLCRKOWPP4toI0x
         SNRAKk8MQsigFVcfigRqHY11uQqfB9WfR9IA+cZT8TQAi5hMqPUHcEZ+NdX+Pe4tECfP
         oUZau/BEn3p73tl6c9Xg5LHBeC2mtGgKProIPepp2qBq9+8HE1rSo0zrwRySvJ2MAcXl
         7r/LoS1Ls23KyFXEy8Cjv3meX6dAH99A3hIhdQBcIr0dLLjYsEJfTpTftWh/RZ3Pb1vm
         kdNixaMy/gSXlSFT0cnpl21WFSucfgXdYJ5nk3ze3yPkgFwz3/YtBIIE42iPHOOEhIll
         +brQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOEDCe0bTLY4APsQSOrMmemZ4gSpEb8xWU8ORkGBxfUoho2iM6cWipGxpeykP1kSlfWD2OSl/UBqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgnZUcvkWWAugocK5W7ef8h8+7+jd8rQBWzlDYZ/Mt5SGXsu3m
	uNwBdVK4KFiwffWKVnQSHEN266VV9zkbHV16lkp9ankoGrKE7G2X0LV8DoS9i6HWSdQuMa1mWP2
	sObokWUQeOeKo0qf+hLdh37iHWQsWr0VAk850nA==
X-Gm-Gg: ASbGncvgVM8Nd/R6DrnOcLSrM+yLZ5QvvBzaR5vvLbWkUxZK2nT/5DNXxewIfgWOQfs
	IKBM25EkS2ixJQ10vkyVGQOnpb9ivXJ/wkt1hkQukKOp4Gpa+NPq9ySV6yUtx1fKWZwQqbiZ7+1
	jubZTYVTxFoXhrLIQzFQI=
X-Google-Smtp-Source: AGHT+IHCodNLsYqxPgYy8KacCIFQ8uMbF8eAgpfHHABuPW/r+cXCzHR5Dy1G6JiUbudEZgEzb8V1wt8pBrFYRs9UU4s=
X-Received: by 2002:a05:6902:2012:b0:e6d:dfea:8f09 with SMTP id
 3f1490d57ef6-e704decd54bmr3276455276.26.1744360708185; Fri, 11 Apr 2025
 01:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com> <20250314093503.GD12210@nxa18884-linux>
In-Reply-To: <20250314093503.GD12210@nxa18884-linux>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Apr 2025 10:38:17 +0200
X-Gm-Features: ATxdqUF7idGp2hnH8dEoppZJLC3ZC9jhgwG1uStDtkKfsGzYjzpE_DfoJqtsu9k
Message-ID: <CABGWkvq2X9L6P39K5OeQW4+c2OmSYGHN03mUW-96U5okO1CK5A@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] Support spread spectrum clocking for i.MX8M PLLs
To: Peng Fan <peng.fan@oss.nxp.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 9:27=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Thu, Mar 06, 2025 at 12:27:49PM +0100, Dario Binacchi wrote:
> >This version keeps the version v9 patches that can be merged and
> >removes the patches that will need to be modified in case Peng's
> >PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> >The idea is to speed up the merging of the patches in the series
> >that have already been reviewed and are not dependent on the
> >introduction of the assigned-clocks-sscs property, and postpone
> >the patches for spread spectrum to a future series once it becomes
> >clear what needs to be done.
> >
> Although I give R-b, there is an idea just come out in my mind that this
> might break OS distribution that use firmware(e.g. U-Boot) to publish
> device tree for Linux Kernel, such as ARM System-Ready complaint OS.
> I overlooked this point in previous patchset reviewing.
>
> Since this patchset is to move anatop stuff to a new driver to reflect
> the HW truth.  And requires new entries in CCM node, so old bootloader
> with new kernel will not boot for OS distribution, such as Fedora/openSus=
e.
>
> Not sure how to keep backwards support as before. Leave to maintainers
> to say if they are ok with this.

Many thanks to Peng for the review, and a gentle ping to the maintainers.
This series has been ongoing for a few months and has reached version 10,
thanks to the reviews from Krzysztof and Peng.
I kindly ask you to consider it as well.

Thanks and regards,
Dario

>
> Regards,
> Peng



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
