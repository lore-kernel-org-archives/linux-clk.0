Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com [209.85.221.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A634CFBB
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486453; cv=none; b=sEGuRBNR/ibgcw2erMbDo81+xQq1stfPoL2l+iUaViX+sCBH75JrHpqXYTjY2jiiv2XPDA+k6uf71Cuhkaqe30SyQR2BAQ5bzuRLn8MZwU5CbPomDByODrm4Ncnn/kR4Vb3gT0bA3JFX/JMW+clJa4z72JeAx+KU5K1TsoVZH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486453; c=relaxed/simple;
	bh=He4BjfuJKlOVZCSqBFYthIZfM2I1ZkSLAml5bdxckng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J90jRzHffJpT69bxC3BPblv7aSflO4vvPaYSvcVuwIRkNbP8TwUeBp9PXsEJyhI8R5JKs9SI2taJAlCC7tPbuF5NRo6XA5uqkcZzNViTJfq9TwIo21/duxxKWvM0TIHMmRdV9VMIMD3B8v1Q9YQDpHUI/p2HWVfDv0Ony8XSlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1700993e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:40:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486450; x=1767091250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ju2WEPZhFSwJDfyX+hF0G6cQfKmw2zuzSQc8O9oxIig=;
        b=M9BO1y2Y5bgAPfwZhw+b/NWRU78koCwXaH0tLILZZ3aNielNUS9MRjY+2PMm7nxiba
         XTKjJyDAnycDvvgexaF1/7rcwJC3RYFrHwyNmHPHxRUbs8iq0EfSoQI5zvLiqAINZOAL
         CfgrjXcY3ewg86PKkQggnfOTl7TQ4JNoiyDF+qmEIJcvIvkibj4Ob8ZuXbUEufK9RoX9
         H0hf6XvhbDrarw/mi9vrbQw3aXUtMBRkVI5oRwZ+Uv8E8+ajluEYxop3aLcnC5qlWEkE
         yAxLucluoLTvfeCmrWCQjWWI1dVG+8y+X8HUrNkSG/OO7M7EKeGyA3GGL5GwFyfKy40q
         rxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4D70iM5kD1VyPCr4D4nWMe+xuouaTcHC/yiwjPY3EnbtAeONV0Q+OFmiLWqBXV6L0eKV2LpFxjvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysGFqOj7OrF2mJww82fcIx9dBg771CvL2g1ARqGdai87Wc6hBC
	cxQjdvYpFaQ/3Ta1d6g5VcKfvLqJRGMCL+D3QxAtD1kJcJmv6UrZ2PxLU3cH5MdL03w=
X-Gm-Gg: AY/fxX6wnBhgpVfEnjw3EjnXuLlFhFrAOzeH/p7Cr4I+IYTNQvmSG7cms0NLqZWRJqf
	TYS6E17PezASX5yXwpTtaupd9vizKsNegaeQXa39Pna4vp+XkHLPNWUiC8kXoEO6c/MXISuwsld
	bkJGagghTeBFmOClp3zzo1TVoiRLVmHP2A2v1omvJP/11vaT4+MsNOz7eaxzYOWWp6e4syHkvha
	BH8x+6Iu2mwrbykUY3bCZ/scg0OhMdHRLtFi0wOvQi2OBz1vwzWxNaaG46ipMBgIQJUA+vWwp+k
	0+PDJtv8Cx3tdMe3qO52WuN1c9McsW+xp82PonH9eZLqsbEAbcLh08xyf3fZBRYX4oA71JYuksJ
	7JKgzwrpSL/hqDW/J1d3VyfhFqLA/xGX1czlc5RDF/Iwd++0oVx0HU4roo0CnqmuEZ6bzoMwLxJ
	pVN0NYE5ZC7VfySjL6jnd0mSeTwg/2lfog9N44dhaL00xKqByR
X-Google-Smtp-Source: AGHT+IEkPoxF1SCn2IlC0F1Y63WrjiU7kO5mmLk34WM9AXAfiKmMnOV8eOdT1qizTvvX6U7tKYn8pQ==
X-Received: by 2002:a05:6122:3282:b0:55b:305b:51b7 with SMTP id 71dfb90a1353d-5615bf0ec82mr4780503e0c.20.1766486450051;
        Tue, 23 Dec 2025 02:40:50 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d15f5d4sm4237949e0c.18.2025.12.23.02.40.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:40:49 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dfa9c01c54so2938835137.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:40:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbWyIuIpytlAN0hcIm1J9CLY45gqroCMpwBo3UXnYuJGi9sIIbwgvJj1opkOjqAcKx+p7nvPSbyY4=@vger.kernel.org
X-Received: by 2002:a05:6102:688c:b0:5df:c10a:6683 with SMTP id
 ada2fe7eead31-5eb1a817ff8mr4650551137.35.1766486449690; Tue, 23 Dec 2025
 02:40:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209091115.8541-1-ovidiu.panait.rb@renesas.com> <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251209091115.8541-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 11:40:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1QQWf4mTDRPgOdRGLttUMPewbRaq1GrksBK6xA-mi+Q@mail.gmail.com>
X-Gm-Features: AQt7F2rxebZz2lpc976a4wNX_gG9-mxMoPf2hgGvnyD8PTUzp05nnW-kYeuYB18
Message-ID: <CAMuHMdX1QQWf4mTDRPgOdRGLttUMPewbRaq1GrksBK6xA-mi+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: thermal: r9a09g047-tsu: Document RZ/V2N TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Dec 2025 at 10:11, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2N SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing.
>
> The Renesas RZ/V2N SoC is using the same TSU IP found on the RZ/G3E SoC,
> the only difference being that it has two channels instead of one.
>
> Add new compatible string "renesas,r9a09g056-tsu" for RZ/V2N and use
> "renesas,r9a09g047-tsu" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
