Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36100179A3
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533094; cv=none; b=eH/1KKdZcBhqCxIOY9NcWjlKkncI659lab8geST/titf+s80g5/rTkZI2Bfn9AbxVSZc3TH7XkOjnRMrpUtMSPLHSmErq2gwh0auwlMwSK5mxRRoHSN0VHKYShYppw7BwH75P1lo8xSednjhO5FD5bTpAbmEYpNY2LSockjDq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533094; c=relaxed/simple;
	bh=c+6uzPUXChU7DJrRiFRC7ZBh3ifQTt1gYWU6T/1FsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBp6v4hNMTXAnsxdgxos5nXLwEfXi/EAzP0tweW+JXkJSu8H9zCO1UQ48zWw3nL26tej4H9rEN0tCabnmnKJR6xhWRDPN82XDSfE7+4QdKwZJp+EEy6JLKmivrTkF6nxl5Sx+xfpB+4KEPlS9w07DHHNtXEcrS1c7xC1sgPpf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9841aecf72so117100066b.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533091; x=1775137891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTG+PVXztusd4gXgWpBEqm2YM7xAWRFb+Dwh9rXSIBU=;
        b=Zt/IGkFYm65J8he4lOC6BWwBS7odNNTBfr/vR14GRDROH/mmAO8/WDPTOTdcBRt9jz
         efAmgvC8Ho2S/68zPg5Cxf6qepBIo/Tugvhx1nVKVVj49sz+pDArVBDnXVcR2ClhO7Dg
         jmTdMNgR9jOCQ7z4DewIxqRX+gQ1gk+lkWRQY70Q9ryt8eW9tDqqTGsg2k1MxseKHfzE
         vNlOQf0wfu8aq3Efqm14AO+YF9MdsGeQvraKGGyqHxaDPeKiv5g/iW0uyzM3cgd160KY
         mCfSZPPAmQeyuX171n5LMdbb6fWWGbEwcE88DjK5KPI3erCqzUuogLoLfBmlOU/WNj74
         LBQA==
X-Forwarded-Encrypted: i=1; AJvYcCWxokuxTg1kzMRksZ8aVyTxgY6GXJtkdntJFx7f5YVOXlL9Z4nsshQvSJQPazhEKGKES8Hk7va4vX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYr6Nlpng0gFEFnzUJL6lMedSzCTE9iVzKvj0muXP2y9P4mnVV
	sGB1UN97Oey2Sl3LTTPAcC99LVulR/Xk7VxHqS91sQXe96T0iKC62J092DU/yEkB7N4=
X-Gm-Gg: ATEYQzwCjnOJko49cwfNBhe7fbc0CI2saDEtt0NkFDI41JZs0GgQUfcTfQR6WjxbJ1X
	BJUE3iKEHjhKiv29L9jutTjhI4DlmN0J3Mu2qMZVW1BME0BsHfyl0KEZkldoNRdZc/CKeM4Kj4S
	/dLBOMiv5tFqOABRV9H5hitZp4NLSGvP27s6IqjEaxdJQcC905elq/3PU2iAE/z6oBf2tU0tYCU
	SULsj3NtSOwI2b1MVw3LGeaJbXTFofctuX8VOXHD32jzjrED9NfMV9Rgc+2jih1xCTXijFK+4On
	cP3r2eIjsLs6usn7fBeVXOVd8XuZDWnuk6seQKC8j/4hrbHKauZdmPfcA+pc8Xg3oC3zTFzM2ww
	gZt7gzs6d/7wZujn8u/to5EPkZrAVyuArzJqW+5wQEyL2haOhWD9pAb1EpNL0FTnkJxi/ZT0N3W
	i429PvMRL2scVLQbNhXBc05ov5O8Hk7Woo+EHawi8T3Ir2U7UAUNSKFbH828mF
X-Received: by 2002:a17:907:6d19:b0:b98:4d6:8c9c with SMTP id a640c23a62f3a-b9a542404e6mr506505566b.32.1774533091408;
        Thu, 26 Mar 2026 06:51:31 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20264ed6sm120737066b.20.2026.03.26.06.51.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:51:30 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9382e59c0eso163767066b.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQSEG5ClSKWxAfzwTW0aRMZHPAvvsWYceE/zj+X+ONd1MqXrAnKAyAEIUguJCRoALEF8t+64nBBww=@vger.kernel.org
X-Received: by 2002:a17:907:9997:b0:b98:32c1:249d with SMTP id
 a640c23a62f3a-b9a3f17037fmr593171666b.5.1774533089838; Thu, 26 Mar 2026
 06:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:51:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUCD40Qd00VgKS7S4pTN1jTPMG98tLFuuKYdg++tewTw@mail.gmail.com>
X-Gm-Features: AQROBzD6orTH2sPl4Ow2ijjzpvAHLafztY8QkB4poxVkmd_p_x2ZQ7lIySQjcjI
Message-ID: <CAMuHMdXUCD40Qd00VgKS7S4pTN1jTPMG98tLFuuKYdg++tewTw@mail.gmail.com>
Subject: Re: [PATCH v8 03/11] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC family requires DMA resets to be deasserted for routing
> some peripheral interrupts to the CPU. Asserting these resets after boot
> would silently break interrupt delivery with no driver to restore them.
>
> Mark the DMA resets as critical by adding them to the crit_resets table
> in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
> r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
> ensuring they are deasserted during probe and resume.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
