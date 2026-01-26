Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF90341057
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443030; cv=none; b=HPbPGOkkuyGlMv1m7Sh70VsCAZK7l2XaUmuDM8XFOT65Ojfrl9FHYI2Xf/ilI46q/KMnGly8H6AHo/4R79dpRBokKwr4YBSHvv6J8wOPU5LPgere2/oobVTsmZBwfC9oeTeRRGZCjYjp0K3h6cdmOWKUVo3B15OVj6Xj6kP3EHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443030; c=relaxed/simple;
	bh=YLtBt7Yt1uOj6O5aaTFlwAQnG8l5W6SfahAW/Yz+oGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQsgoPNKOrGIYXLL2J7Vn9j1b8Du9NIDomQ4bcf7SyuT6waSs8s2sYrJerE7rPbzCZlEtIJYcMPxKIPtlL8cUW1BgMeBBdSMA11ZfO5Fd5x3G6KEjMLTUhyR2HMtvOCXB3i7q9XfCwRRjLpsHjEiBv4QNnv1s+u7a+X0D/N19T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56367a388e5so1170473e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443028; x=1770047828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdijfS0+OQ3FioX0VO8ULn53/vOnmf0w3wcm1RiEZQk=;
        b=ILhGelkIW4h3bYKfjmcO9xcFryAdkaq8NeIY688mShuh/QpHVQw+9Xs5DlonvVFZ2B
         KaUNsugkVDbvRefTvzHRFzwdK/PhXMyUqq2xvMSg1O8udxgrkHKjbFQJxZJewivIRG6t
         5iaBDq6CYBcWW7ZGHcTFLxFbMVDobc/zN8uUdi3jAmvTVlLckRLy3MlOOhA2EcKfOHU7
         Ib4kTrRsv7oaI2INRsVjo1csjmodHSfcHG2eVZQ1dYmppeKedz2Mq1I3bmAlxgExhGQ1
         53dP0/ePvcqhsklEa4fP0szTQ8rVcDxQJcN2lP8R8+W/AecaFqgCnsmKXm6mqTaHRO8O
         ah+A==
X-Forwarded-Encrypted: i=1; AJvYcCVgNQBYZhxmjQ/wC481UlHRy3iWEBQsJHtBuTevqIZ5ZtD3QBbbcZw3bKT2IZfbXpLJ0rhon7Y3xnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMNKQk1ToSlGJ1mlPUOFqCDwAv1glHP49KaukTprITwaubyCH
	IpMdQlfznH1GISF5A+/GT4M7My70zS/kZMFN8HGFG7A0yITY3t9xxbiafJTfBauu
X-Gm-Gg: AZuq6aJNyWhNF9muzZxUSi//PLzykjTIj6ZIZ/V+Gc4KAQ7cafAi+Z+DqkHF+OmJvsp
	3oWSVR7kq/QqbLm1ZOqV/qT0cKLS7E6yTbhtcCsQ3qeV/aaC4sLILn5fR2u8r1XJeknhG2GFR+r
	lFz7TebnXew6PEVaZDXEEfib5L9niB1NTfWq3V2bfVsXc1TXFPuOB5llPwHtOo2eVpa/fIcecNT
	XKM6VdGqZWepgojno1hg45neasaVUsAqym11oBHs2krPxy2aYctVxo8DFIDl8CoVNDGjC77a+Gu
	ciu493xcSXnMcGdo90nm00xvLH8RNV3Dvnoyq3ywT6oZrlUFqpzffXpBiODhD2htFKaUiQsRHzt
	e4dQ5hgkEm+76/v3MvDFTNCPr32zVh6L4fb+UGsvI891EDuYF9QA6EHSbMmUsyKVRIADI8sLEZ8
	lXJT7DgMuF6PBaCirn1Ws9So/p64SnbK3yWPb8qFRMRILPonauHtZW
X-Received: by 2002:a05:6122:3c8a:b0:563:746c:a32b with SMTP id 71dfb90a1353d-5665c9f0c98mr1049122e0c.15.1769443027832;
        Mon, 26 Jan 2026 07:57:07 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7f019sm1807576e0c.18.2026.01.26.07.57.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:57:07 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56367a388e5so1170426e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVcaM6WYGF/Q01ae7W/Y7t0saMhBheUS4FGqx7ra5BqnC/UG07P3C7Q3AHVaNR3zndZ74DpVgXBKxA=@vger.kernel.org
X-Received: by 2002:a05:6122:3a13:b0:563:6767:217f with SMTP id
 71dfb90a1353d-5665c93bc8fmr1333184e0c.1.1769443025008; Mon, 26 Jan 2026
 07:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkXFvOOcZ07seJ6M5f=6ENEkCnoj29ueimdOJg3MRaUQ@mail.gmail.com>
X-Gm-Features: AZwV_Qih8gRGOzcPfHBZgLb81bZR1XZJrEB5kRB8S9RRMk4gAayWM-Q1oPZZvjI
Message-ID: <CAMuHMdWkXFvOOcZ07seJ6M5f=6ENEkCnoj29ueimdOJg3MRaUQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g056: Add RTC node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add RTC node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
