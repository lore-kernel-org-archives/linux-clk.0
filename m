Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D9928314A
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302349; cv=none; b=EfAIU+jc+NlNNkbcrVvYlcycYYJBS6aFrK/u/4SB4qw+eScAe6vf3RRgiC4PUqYPnWFDm012sl8EMf128YU1CmQMRtGqjenMFTiAeMyhLdQnLo3BeqQVyu/YO7Wk755mYVi8i2sDcR4D04HmkqUBrw6/+We+zDwtYurmy8g9iuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302349; c=relaxed/simple;
	bh=xYDIaAtHlpq4aCLHhr2Et9EWkrcN8tXhB/rgvIKV8FQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXtn9kH3gvOPuyFazbrJNSF9kEBQef3XrgZ/zBpY/j6C8ng2gQzsQThosFaDmYOJj4DsuB3dFCsLRXrIAy8ZRLpxZYK/0pyXKjVxfX3X++pKu0gisixddyvOppqAunUFWcZPUEVlt6CettQGTHbNSYExL/DcFLK0q/Vu9cZIor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-931028aeaf9so1410792241.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302347; x=1761907147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXbJXdZuwtjDIdswroCFJwLSL36xsyFBW0J7iQ7tGA4=;
        b=vU1uG3gA+CxUmf6IS3Ap8RpSZb/LEVj8TqZytyWN0kM0Ni/D9OKHM/1tqIqK54hyGD
         fTc77Cbp1ZReIILL+XL3VbmtIm6lbVeXiBQ4joUOOs2lGICD5Cev37hVYIMKXEzmz4L1
         Gz1EG708XWb1JlvJtM4XWktp6pP2j29XLMj2cRcyVG/1jRyfUij4MdFx2sJg7kro9eWb
         TvJxvh1/15P4bGO7V8+Jn1N8kZY3hUwA+xRJkw+n21fqAIxyZ1wYUTJ9VK0VXVGQ57sT
         bXyrJhMcOboPLD75aIbnNsQGOR72pChc8z48XOexy3wFqRRy4gIGXb/tBiPo0SOrWPgO
         Vs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw4qMjFpnv1gcgbFF9rTHEo7KCFNUOLO8/TZH2pRxOudiYgGKZ91iedYOuaU1tqCvLfjmZpXBQ5Uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7BZeyxvYb5xay3/wXl27qgeQmiVAUwblBLEb+aO1zpQyYMlQ
	CdyX312ugNHZQiZuiThqavQx78Cq6FPZ1nvkF/IryGN+lcG0q5BE4DtH59ujaNr7
X-Gm-Gg: ASbGnctPsob3JcXmPj1BMKv/QVFE2xMF03vgenAvdStoIKH7LjDiibTAT+Ly+HA95Wj
	t/Hkd8CMHkAQfx8P4kQME49W73+sUA/KVmJ13QI2+cdjpodwY+vNDR7Bas2CpvztF29Sg+gyroj
	vVdU87fTMkqKvT1IrIYQOJI5knheTsT4aJlg4keVredEJMsAqtqLn/bD/w9Mx9mf3EHNsq0gZ7A
	8zVTyi3dRqtBffeFYn3fdWdkz+c1QV+8/tQ2y01rronx0hiINRb+5k3aznVuwrhIKiM6TW7scX4
	y4O4Gfk4jLqQSdYuvD3mDkEeaWixm23qfHYGk/ZAQfkWX3z+Dc6HPtYe4AFjSvYPZJSbSTINT7a
	Xodzr+wse6TrGVSS6xNRm2IXBWw4upY2A8TS/5VWOwqH4mqmK9WN527uKsYMHTCvvpDkkrjO9+f
	mUM9OhTXg4nznB4ZZoWDeAHhKqMKb9AYsWwtIxzg==
X-Google-Smtp-Source: AGHT+IEwpdmucZzmHbdzt6dDuRArqVZypkkdK1XsQJikjv9NOuASW7qyeGYKhaDXLNzDscYoUCwkBQ==
X-Received: by 2002:a05:6102:32d3:b0:51e:8f20:159b with SMTP id ada2fe7eead31-5d7dd6a0f69mr10746089137.29.1761302346744;
        Fri, 24 Oct 2025 03:39:06 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-934ab96558fsm2027582241.0.2025.10.24.03.39.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 03:39:05 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ce093debf6so1929050137.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 03:39:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFjCYl0U4kRMHBaU/UcDLcqx54YwLNw+/m/XYri4KL91Xb1JAaWmCLSuonrJ1vYtnHlFkPe0iHJDA=@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:5d5:f79b:e93b with SMTP id
 ada2fe7eead31-5d7dd6a43ebmr10434893137.32.1761302345477; Fri, 24 Oct 2025
 03:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023210724.666476-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251023210724.666476-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251023210724.666476-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 12:38:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6kXwnN+xej9jcr--NQqWeEX+a_V3EUP6YRnwv83iVYw@mail.gmail.com>
X-Gm-Features: AS18NWCn2ugKZLkqYLpsP9JDnV7zmuK_otCIXJWTBFNHqvbQ0CEn3hVk_jPHMqU
Message-ID: <CAMuHMdX6kXwnN+xej9jcr--NQqWeEX+a_V3EUP6YRnwv83iVYw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g056: Add clock and reset entries
 for ISP
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Oct 2025 at 23:08, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add entries detailing the clocks and resets for the ISP in the
> RZ/V2N SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
