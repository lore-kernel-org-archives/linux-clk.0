Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234923F8EA1
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678746; cv=none; b=eiF9MSpZpkkXabLE04WI7ONnjDfFjgPRwUvzgJu8iorDJ4p2qEdurg2ktxp4JJU1DLzRwui0l6VZMSCj1vHxL2hw4UdbLzdVRk5O/I7PIg4UO49kZbDS/NQNXk5xy3Qthdzv8ZUSEmXLDdT6+vsojNY6rlM8VXu2RA2ihQaczgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678746; c=relaxed/simple;
	bh=+p5C07PlzwAnFV8W7DMxCM+4XlX762Bvt4U2R/azgio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nm66AWYsh7Dg0pMJ/aP8unPIWRhFpuTzjycxw7u0+K6K3J3cI5WCzvg0II6aYc6Dl4fymYEmyqPZdmsJbJxP4qoMUM0fQ9DDlMmmVQmT27oSjKQ3NUN4q7LfikXQwB1xCuhnQVrUw3NxOCsAB24yCQ9OTVVMDCIzW2xgCY+CVIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso577258e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 03:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678744; x=1784283544;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bwp9IGUDjgmX3mBabgZGirsEvY8TKRimZIn+QIFNSvc=;
        b=UcZ7KNijnimdFGfFLhUNqWLhYrkk74m5miRenmI2p518nJYRlTLmhcpOLxmFTceKj9
         0vr4HMoURGksnJ8iKWyPTLH8HApx0BN4/o6kfdeY0iy8ugwmijPyDhrksRD940VbwXou
         fzftg7h3b7PhVscK0JvqFe69cxQiO0Wh6/Im91nsDIukOij73S3MsWeAWmKqA+v6hkTi
         QA5jzBrYTMEFSgGzJ/VaPD1YuIlB6zR2E1w5jB8weSnvYpfLEeHHcFDGLtlkTHqXdShn
         bJ5Fa9GOzFIdrqV+c5gC8c9btuXjLjVwokvtQDA/Av+GhWYdEdEnLedEaLgcL/5M/yQ2
         qt5Q==
X-Forwarded-Encrypted: i=1; AHgh+RouY32dQUvD/FhjwUbAGIh+L3yg6QF0WJ3EGnCPcehjH7esMSBe9OR7zJitPCXEuhlPqBBuwykzl94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFdcnGKvwqhuuY0DZecO+7rJQDOdxnl2P51A0PX/IPxvKA/8Y
	i9Q08YTVE723O1POIbzozh9ejkoS6Rh/Nn12VH0gaGWJB2J7a2HEci3KczyvanALbhs=
X-Gm-Gg: AfdE7cmXe++oo5zLlJqD/TSS9laNOL28nK8AKsR72rM12YTJBOD3Q/9S+TknEKmnvSW
	54n5hdvUaqljcXcxXFOtq0817GX+JRdRkNbHkla8TpFazGfWaXURqqKvJx2s1hx20xcxe9ad3xz
	6P82tw80OOsY1axxvegk4MSHOrQ3004xdrhzbilV4yDwEnAdcrPBdqQld51g04STrFQAMisPo2U
	07IUBDHIxz+SlHz8d9m9F678H/F1fCV+1XV6IjqG3CBbC/iIDRX+aXkmJOIxT4nkoUrJzR1akpo
	okIIxcffmmY099ddvUz84croBmKiEe4wdzOEX7yDU7dpjeMDIgpJXJnpk8uxH3vn7DHx3ytusmj
	1neI4uWnz8x6TIckOm4FMQfJzu2BR5EHF29lSVrALhAUhWQyZQb6GAXQXwChXEJHXGb12QlTy6S
	FXegn+jRsumQJJJdazKBK7M4m8Wle3DRzDcF11zrpLr8VZpKxJ2sreng==
X-Received: by 2002:a05:6122:311d:b0:5a1:b296:78fc with SMTP id 71dfb90a1353d-5bfa53ad88emr1447736e0c.1.1783678744012;
        Fri, 10 Jul 2026 03:19:04 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f8f4283sm4593019e0c.17.2026.07.10.03.19.03
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:19:03 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so350562e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 03:19:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkSLG8KJ5drEp1V1CQaqHQbunhrAML9SmyJ/V+hms/5YZbnjOHx4Q2id/Tp6xWVtqUkSgvOM3bqGc=@vger.kernel.org
X-Received: by 2002:a05:6102:8516:20b0:6cc:e6b1:7f84 with SMTP id
 ada2fe7eead31-7450caa467fmr935740137.17.1783678743107; Fri, 10 Jul 2026
 03:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709182332.876408-1-claudiu.beznea+renesas@tuxon.dev> <20260709182332.876408-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260709182332.876408-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:18:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGKQAuLJ-Vo7=O8E=kMCYiUZ2H=Be9T3PAkjHu+PRqhQ@mail.gmail.com>
X-Gm-Features: AUfX_mx3pB3dkKwbzFAKhxG_in4zcQzaeWH0J8kav2JP2BfBiNLW4WLUquaQ4F0
Message-ID: <CAMuHMdUGKQAuLJ-Vo7=O8E=kMCYiUZ2H=Be9T3PAkjHu+PRqhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] clk: r9a08g045-cpg: Add clocks and resets for CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 9 Jul 2026 at 20:23, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Renesas RZ/G3S SoC has a CAN-FD IP. Add clocks and resets for it.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - used R9A08G045_CLK_P4 ID for P4 clock
> - still collected the tags; Biju, Geert, please let me know if you consider
>   otherwise

Thanks, will queue this one instead of v1 in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
