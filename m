Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B2C366
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761562286; cv=none; b=EkwpWb4W/RQtohBnoQts0LOCyFCs3lTUw1ErU0GD51GIo1MKkVYOV9mwn6n8yMIV0/n0A3SFK4AGXTwh7dCcvc8FayDV+J+PWOZMFST7d7AEBqQVnT/HwdcpZWfccb+GFG4bJKdaK6NeiqAO/zF7StkpqlZcRcd5s5qlT7jVtE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761562286; c=relaxed/simple;
	bh=WASv8vPf9FPyquyQDbPoOdROvffB+ReSLfQNpiWjqIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb+KD2azHzWFJRsYcGM18bMtVEPN4bfOb3FbohPiVNMXKjJYGCGITijkINv+w5I5RhX0SLfjYRiXbWNmx6UIBlt5+KNinw7AZFjJabijUt6x1FhXfueoT2J2Tw0CkiMzGqtgUL/JC6fmYeCmAUsmWkXeL+O+7LeFY6hOcf0bEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c53a8d1e42so1182248a34.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 03:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761562284; x=1762167084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFi78x1MtIeYqpVCKC1DBSPNonZlJu7dJLYb6jM72vk=;
        b=v88JvL/K2sPErutjPEDnngdwnBvPMFEn4f2cXh8XVf/0PobolJvWXPC2regU9GrbPi
         VQ2FTeXZH+NO83rvnqyUA6LgRNkQhgL6AIphS8v9obz9A/ENcxLW/3LxPW1zWKNziPXK
         ONTmrYBjV5B5UQpm7tccRVAuRoXfTazE2HBFb3sn+75V2yK4hIBz3BVr5PDPl0PPh2+m
         N4niEmKmLPi3YOhlOHwkX3Ox0fnu4BwC6DYSofbIPhvpJnTSlmHpBNbUj4p6iVJouXfS
         +y5rof5V4HbR6YIjL7aKw7sR+RHshiSN8fEHn/vXh/8gK0sLnfhOeXxXpHv8BwOFlHV3
         4leg==
X-Forwarded-Encrypted: i=1; AJvYcCXkEZrVjVlcxszWmq2MDX5mMH3rdt63vPHJcT7DU5h/9MjASzc5Ysmb24MMfExM30T3Y70ay8NplLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkb4vVmF4FjXnHLHNhjPR4GzMj60blxgU8t61AmQ2zQK/NCj19
	ltGHOc/SEGrfuRM+WK3LK+/xeEuNo2Ym+XBdPZhOYOzs7atqx1XKOLe3nl7ILE/e
X-Gm-Gg: ASbGncvfBECJQF+ydRqfhSbirjmBLrS5/A/j1gc+mHvH7Yh1Jyr3sQMG9JhIwPHj4UZ
	7n7/WiFHjU5ioytPZarf6/Gc6UDK9v1hMHyrC0oABvPCBgv5wwbZBagRkNVxCBWRMf1K+g3PywL
	NJKCBDC7T1UDHsm4IAod3j+KyBuzmY+Rc0jhPPbkZWnpDHcY8m2+1RSiCuoJVmMK2/N9GK0H8a0
	x37tkPAyb++D9gmrc0QHlo23oNR+mGPZ3qS3Ux2yAVSHkqoeSWGQVMykRlLNLSedun8gSvZu+CA
	D0ZoDowtB7RSW2k/P6zySpHCJmc8RCTVRosJoby6zPs7dzk7fSeRuU6ToDzb4MaMT1hTP0DZwBO
	vaxO2z3BveB7jx2RpICs3wd9GXJoz+evXWah6aYlYUGoBm8PfhPOaJvH1hp1mhVxYFdDg9pVQiO
	10Qpt8n0F/8aeZx+osHigMY1memHkoo8vs8hqG1g==
X-Google-Smtp-Source: AGHT+IEC4f+dsxmj3Ruq7iKjVOfouDHr007HN5P++dSy8kHsipE3kllKYIQ03PFU01TKRiWQ3cFA4w==
X-Received: by 2002:a05:6830:2a06:b0:797:97d1:de29 with SMTP id 46e09a7af769-7c52307797amr6109565a34.13.1761562283771;
        Mon, 27 Oct 2025 03:51:23 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c53013505asm2154507a34.12.2025.10.27.03.51.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:51:23 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3c9c379af8aso3082020fac.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 03:51:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1PBBiqf85NjHfBT/BaRUC1AISgI4aqhb2psQvyLFlddQ8ZeqCnZY8ezYyS+FA2reR4rPjIn10ODg=@vger.kernel.org
X-Received: by 2002:a05:6102:30d2:20b0:5d5:f6ae:3905 with SMTP id
 ada2fe7eead31-5db3e25962bmr2803354137.22.1761561924836; Mon, 27 Oct 2025
 03:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023081925.2412325-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251023081925.2412325-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 11:45:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUnom39_Rj+6Jc2g69i+Z4V7UkfXT791buK3h9cpOFpsQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnn-hFWk4Ur68Qi3gdEa85bXZjpybdjIi4iorAZW0HIZJSSUE0PNnuk68o
Message-ID: <CAMuHMdUnom39_Rj+6Jc2g69i+Z4V7UkfXT791buK3h9cpOFpsQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: renesas: r9a09g077: add TSU module clock
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 10:20, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a TSU
> peripheral with controlled by a module clock.
>
> The TSU module clock is enabled in register MSTPCRG (0x30c), at bit 7,

MSTPCRD

I will fix that while applying.

> resulting in a (0x30c - 0x300) / 4 * 100 + 7 = 307 index.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
