Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537A8416CF4
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743506; cv=none; b=s8BZqQSGEKKa+1YJygXHyvXGLAPzengh5CYofAIdYx+u/StYTXBtgWVFa65WId5oo26Z453RHcpqflkft0u12fH+FSBvQXZKBIdTgWX/4XlPqSXKLWGZDrw7+yOIiaXwi6G1c8YmZoKXCo7kuRJEue2j77jFB41az8c9WqI+q/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743506; c=relaxed/simple;
	bh=6HRoK3x0AQKUC98OUBm801Q6IEvMxDRu7vC3ONMl4bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1Z1y2iZmNYbhhMQkK1ky6QLKG9Qr6mHHdEKU6Xy3vn5H/npv9OUsYgQGK+pplh/xCWbW9ac4BZvJvTaeE+kadulU/Js8GIn6em6G9qBOJkmDZ/FJk6zT1YbJFCl+lf/jzxwr5k5nGsa7QZD6H0RP5cEmhIpmj2SIz6TNmHS3nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bd96d34082so675393e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 07:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782743504; x=1783348304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5dAe0yde7h0g87UykwQHImiYSAjXBDEcHPO6+cdmlw=;
        b=phAEdXfMLeryXMDo4YhfC7gY76fqfi2EfY2lDAP1pn8+PnmNeIO3ZUV8iCSQg4ihxU
         v14ozbCn+6HX5yCQXWTMA4UU/RPiIe7GggkTBDf8n2P76Ib22UsX9KcnqJL5FqlEAvqw
         ukAL4Ssj8OX5LnTok/rTGnYxWYVr7BdRMoUZgFJ00Fga1Qwfw2A1R1rSvblW3m+NYXBN
         sH15uso+7J4ozr1Co5TwzLFUlDu3nyyzMDsMYqKHWu+md6sr/xCoSUTjS8YgWv6jkNZ/
         0acWHH2eq9V0TM55iHfpuu6hoFQfwB3qzU9k9hmgVx5AwNcUlwHxj2JtK1VlhHadaSqg
         sISw==
X-Forwarded-Encrypted: i=1; AHgh+RoFEG7BgWjCq2K4prwKRw2qM76HdqMse7fWo4P+RmeJZDKLxHvK8igmd+7B5+ZkwnROD6E5WL/z4hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nz9QyocQqcJpeG46C+qirkrlYtIlpOj2CopVyf4zCbuKZAz2
	wuv2xA7VXqRW3je76j+/gzKkL9TW7Sw8On61uJEs3LdJjYubugZ2vv+no5TKHsVe
X-Gm-Gg: AfdE7ckeiz3qkd3iEHTadZqTy5qWFsndVQ1LCiHUGO7lMethjxzld3OaNdn760PazYU
	pvY2okEJDfmXQDzQk005nODGRMGkZ0//HP/Fkn8U6xsZ9qX4t72EK2V8ngX/B5V+VODJzb8iR6p
	e/8EQeKZTbMln3aTJVl6xEtRe8pcSCm3m14bFS3rq9ED+uTrMYvaAfi0xNIUfyA+BudyMnn+mXt
	yN+3hXD2ijBqr4O0lmlUNkaSDfxsEPuqBqBl+JD8rrxZMl7o3/5YYgTqD5G0qRIQxovFfckkptc
	Q8eA+V56KZNEb/u3MO46zJ6a1d8KprxF7Q9OvZCZkaeD1Mi58/9QdvfMK4SIV/WEp+rTtB0MWhe
	mYCENF5WO8dDSq2soBDlLXyzzxCd4AwvfArq7W3O7Z3gD72xRasKvMQTHrRhifZjmXvB5sb7Z24
	Dpt3IGDcTCZVTTNzLAifewNJaIDmI6eRfgA/nxkFxWtCkDwbY2wuSkOVZDYE26
X-Received: by 2002:a05:6122:a06:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5bd69d1ec98mr6986624e0c.3.1782743501302;
        Mon, 29 Jun 2026 07:31:41 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd79108c5fsm5741857e0c.17.2026.06.29.07.31.38
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:31:39 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-73703f19c06so491344137.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 07:31:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoS0F+wifto6zVQQopGauvnmssZwbQikvrY86+kPnC+TGK1k5dh6231vITkru6r9zCrPMc/ANzTJ7c=@vger.kernel.org
X-Received: by 2002:a05:6102:50a2:b0:738:20f:10de with SMTP id
 ada2fe7eead31-738020f155fmr2154680137.17.1782743498122; Mon, 29 Jun 2026
 07:31:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623152851.478573-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260623152851.478573-1-tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:31:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSSkX=R8oEBcdGnSiY32-QNpfHVgYN7oeV=4cHfaLq5A@mail.gmail.com>
X-Gm-Features: AVVi8CcgTvKk-M5mRJzGweuPSzZh9k4hEU6qBV5yTdVU6gaVQ0PgkwRdJZ4JHAY
Message-ID: <CAMuHMdXSSkX=R8oEBcdGnSiY32-QNpfHVgYN7oeV=4cHfaLq5A@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g047: Add LVDS clocks and resets
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 at 17:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add LVDS clocks and resets entries to the r9a09g047 CPG driver.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
