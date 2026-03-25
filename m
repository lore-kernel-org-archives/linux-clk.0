Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E4B3EAC9B
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454536; cv=none; b=D1bXkdm8kXFtHZFCByi49TgCN5km8MoyFvLJ8gbCimx/iyBWtTmgnvXfdtWgLMsaRxW4B/cW6Md98RpNwkX8xa8eDM49kjSTezmy3j+Am4OlgsbFriMtSrY/QCDlYjWAUIgg15ST4QvMezLKlo1LmwAmTSH+1ca4Cp0sCXg4FKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454536; c=relaxed/simple;
	bh=V9EhkXmHhCfd6mpQBTgvR/U5ijzRrAw8mhQanHksz6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/QiFXsK5RjYDi5S9+jB5COYAGAm3ZdcY0q/22m0tACzJ8YtaakBsxBwvcXY14S90vy42Xeoy6zqbxt5Gq4HRazbIARPtYioKn5hrjOdsQgzIVEp3waOd8Isl/cee/K7bA+HEYaLFXCCFhhYa7DtrcLRLNMEBGi4LTNobRHEy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94e9810221cso1108090241.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454534; x=1775059334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZPS9rvjiCNyKh+pIYFKpxEAkHK/vWQ91zf2PSXKLkY=;
        b=OWDWW4GkkYmBySREMxjQfPLozSmKXkzkRP3RY6p7AlEAvsyWYcneUtRxoBzjGHMPKa
         xP5u5mf0zcK7KSR5I03sSroM4123SWYRNooPCXnf6MJWrj7l5L7284xM8i8NOZatfQU6
         iRfhyZ+6OLJuv6pVzTLbDuHhVbaYALj6Ma1+5I0PU8oCSJcZRpW0QNa2HLngCg2RZsge
         ZkxYzQ269CW6mYwtLW5mZp5+38dS0MHN0aZUFlIftM7fP/j7V2FOke4Az4L3D50UpqXG
         7Xb86hahc0wHmsZAQdqgGCoZOXONM+JoUwtBxbxdshSSlPrdhNupnJAezulpkQGsE/EF
         mULw==
X-Forwarded-Encrypted: i=1; AJvYcCVAP/Yy8R1AMAUVKc1qvsQqAgzKH66Rw39cp6lPrd2XYOV7jdDrB6AINkmiwBfArJsxaHxDQcsNL4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqgj4I8Clu/Gb94fD9/3+CXuSnXdcR9Gy0w3U7wVeexUeT2sA3
	i4n0TXIuFGuiFDx+5Uw6/HzyYVKzqgAGW7h4X9GW1SBiU78VcwqUD3R7fnTvje4fCs8=
X-Gm-Gg: ATEYQzyhv2g4BFbW9JJve8jXYCJ3ZZAh0q883cY+Ee9E2CFaytMFziU/l/0RX4x0I17
	Lk7H9jHEhT7izRD8yQw+rcrFn5Bv12fM5v7KfMW6bA16Yp/htwxcdY9N4COHKx++sZSJUOyvzDl
	Ov7fH7B20sgi1nmW39sB6fWT2xeuOqeAn5reTRi3ACpv8PurfFVAzDnupk6UPNsa92cSN9HXTPz
	hyoJ7yAl0O5nFZ6ZYUmWpTKn1y8OxMUCiCIo1BHKLGiILXugoeUP4kLEZ+F92ehc/8nPQYraFI5
	ftmEThgK/vubWNFATApvZU3Ym03nJUDa7LWA7cuDQEmTDYgV80LNcIzb7ZK4yQdMawC5bvxQPOC
	k877jgoIwdyA30MH3PQI+8xOLZNipCn90xLNXWILzGQ+gJS8fzaS5K8nLjHn82X0gBYPQMzekho
	GFOTaEBvHCgdh46NLXSBQC0r5dhnJJy2Ytg4yV/3UL+avC+TFMazCS1cSDWiX42g8d
X-Received: by 2002:a05:6102:41aa:b0:602:a9f3:74ca with SMTP id ada2fe7eead31-60378fd6a02mr1682133137.3.1774454533627;
        Wed, 25 Mar 2026 09:02:13 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d5105e59sm87351137.6.2026.03.25.09.02.06
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:02:08 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56adf76631cso45701e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 09:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbJcv5O4S5hNymWbXjtK89n3jrL6nspPu3JeZFnrBx2XdxXGCMVtq4Rby1esnEliOoOn5+thUGD+o=@vger.kernel.org
X-Received: by 2002:a05:6122:4f97:b0:559:5ef5:b196 with SMTP id
 71dfb90a1353d-56d220c4f8fmr2065624e0c.13.1774454526013; Wed, 25 Mar 2026
 09:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318085119.44717-1-john.madieu.xa@bp.renesas.com> <20260318085119.44717-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260318085119.44717-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:01:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPvnoSVBVKFOgXFrOyVK_CDuiNXZ44v_FYkEBtYKEhOg@mail.gmail.com>
X-Gm-Features: AQROBzDAUOx_p6wz4xdqborLEdAuZA8hQ4cgzmgeW84NqoNOTvQEgITg1E2ITKk
Message-ID: <CAMuHMdUPvnoSVBVKFOgXFrOyVK_CDuiNXZ44v_FYkEBtYKEhOg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Mar 2026 at 09:51, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> Enable PCIe support.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Changes:
>
> v9:
>  - Renamed gpio-hog node from 'pcie-clkreq-n' to 'pcie-clkreq-n-hog'
>    to satisfy DT schema naming constraint (reported by Biju)
>  - Updated line-name with proper signal name on the board
>  - Fixed node sort order within &pinctrl (reported by Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
