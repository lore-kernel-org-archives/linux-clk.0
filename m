Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9526F29C
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505247; cv=none; b=n2J/e3bdyqi5b31ubFiH1gbQLfNtzQnj+0uFHH0ggGP/sKPnnkJK0gkFTpzOcr/nXU22vDf+aceRSFwOkrpSFlmV4/TfhSnlx7rZOr1Ia3JHT7ob0yJwzZ+PnGeUoGeO0ZFw+TZOSF2IhDAB8VYtHR0AsSAN6J1YreA6bjrTzgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505247; c=relaxed/simple;
	bh=PvYF/sHPuMEq+8fWLIPGoI5jyBD3PEX35Mu+Vy6V+Yo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvzCbMU2RAqvwEBWbzP4ue62nexHc3h2X6/EfrCBFGGzxhjGUtk0zOMHSN0nvIGsbcPyqVcg51aKqUkuOv99SGxPMEVerQpkbM87Wo7G1K8uYmN1aZmKgUvlD7hqz960vJuGKksRw5k6AEEP66K1VWpqkC8o2B8EK6JkOqW6IKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbcc814b80so191762137.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505245; x=1763110045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fv84lgioVMsP5SXRt5RM+4CQx1zYwL7FI4sF4TISOrk=;
        b=XO6I+JFSpvJXVusej+AMcDmGD73GajTwljcchAzgF2RXcqjr/mbTBkZLwCiiGl1Z/a
         OZIWgLVMpujvWEekFF7Cqr281P1vpr3qArocvwXmlc6L74Pbo26kBAyrQ1ry/+Mb/DSz
         f4WKUAulA/zVy+uni1tJZYd247VMdN0c9+U2sPBc7MXbUjN6lLjIscLBcD2G4saX0QKE
         GWbnsfU8+eWAIej+sQglQzDs04jJIOZGM/ovzwJw4cra8bEGd79ia5kxER8FgVK0iNXO
         xJEIIvjhAqUwy+1dczOQzxaDsKL5XpAAZl4kvf/gmS8PzdQ8ejICwe8iwG7B4VCboD0d
         FGrw==
X-Forwarded-Encrypted: i=1; AJvYcCWYFUwBiAggNk6DlVtdvGXoEkd1LK5/yVPImyAlKSh26hqu5TwFyahRwtm/PqFlpzoLPYYeTkw6OV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wf1Xnit91wFROIN4RVb9cd7QMsc89mZnxzsFcN70e9egyOvZ
	oneA40Yv85isAttO0Yw71mCjEWYlssI68XWSLfXCHltkUFM0Db9HfxVcEpQeE2BjuaU=
X-Gm-Gg: ASbGncsSJdMfYzKZvXPPZmQIdYMKv2n6oAtXKqOsmZgtX010tp86vnCY9IMDfrFVf4j
	jDPXyaUF3KJ7H+APV1euq2B9kUFR/FTzDU1Ajp0h77Fus/FOlGorbE+zDLCxhjjPiCgGWnWoz4j
	WTHXQcV6t2TA4kKwfYqcHath+tA9GL5xyCfU52xjzeGNNl3XVh/E0nFMkK4KZqC+b/39JhXeGHj
	CMFk3wH65vsZpKQLDKtPcRDRZjHSNeq9Kgs7UMIf52b9TROoQPdJC0rLC0JZGY0/mnDmlrj5Wtb
	auMa6n27guWXX6j5dOi1+gQdBeu4BSMwLkqy9DW0wSpOB+MRW4wGl92QI0wtMViFa5DzQMZ/pvp
	mkdri9lYO/KpganMhTVhk+wYFrb6F/o6+86RncVK2G+W/YK5irlqg5TwQsrfkiOg5oegmPD3SGh
	bc8EDc2kw7AbMcHskwMleuqR4im1b5e1Ag5Lq2Lw==
X-Google-Smtp-Source: AGHT+IELblWaNCCsbfbhHq0fGv6/JhYFsM3KXZTR7jABG04gwAn5er55QP71XIuSYUJ1k7/BuFFr0w==
X-Received: by 2002:a05:6102:6213:20b0:5dd:b393:dcd2 with SMTP id ada2fe7eead31-5ddb393dd43mr446413137.11.1762505245015;
        Fri, 07 Nov 2025 00:47:25 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55995863f11sm2683566e0c.24.2025.11.07.00.47.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:47:23 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbcc814b80so191750137.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:47:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGqQVpeYwcyxHpTfMZoIi9n+aLAM5VuY4D78zYGYdgsXt+hb4svsyjbJfVgumZROXAdfj9J+9wkgw=@vger.kernel.org
X-Received: by 2002:a05:6102:3747:b0:5d5:f6ae:38dc with SMTP id
 ada2fe7eead31-5ddb22b0cccmr751397137.39.1762505243558; Fri, 07 Nov 2025
 00:47:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:47:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPTXCWPeYn0jSyLLYrA8EGZyOO7K8SJ6uJP-szvzZT2Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnEzOQ8SOygg45RRCWr96B-LQAx_Y_KqMAbz1TsbUr3CSh72EhCGj54kt0
Message-ID: <CAMuHMdWPTXCWPeYn0jSyLLYrA8EGZyOO7K8SJ6uJP-szvzZT2Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: r8a779a0: Add 3dge module clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the 3DGE module clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thx, will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
