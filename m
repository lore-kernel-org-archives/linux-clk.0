Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528645FFA0
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710959; cv=none; b=hFiqRj4wssWuxp6qoD7vX8qt+U6JZckQUba2zS5ORIVKUc4VCLLC/Q0K5CwWNg57LFMTKMBxczIpTPcPsTokEJzsGkR7bVEtP4Ggz6wJO2IIQQRWeHZI83Wun6jZklNOn1UwX/kWk4FZvXbmLGOcDx2hwoOwDVWURvAVIPUeTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710959; c=relaxed/simple;
	bh=lu59pHls0RMY/42xD43+xKttiqSoyZqgpB1FVRwNThY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ec5FncrF0X2CYPBsihWb4SYHAEjN9DVwQyY0usSQJAXUKnu9cgZLUjGgP7gtjKd7HtrKZi7icAdtjZY4KJ+plntY7Jb+1RN3+a4QObJbUkUulBeDvF32RAfAlbYfNu5np9c5Kd7sQECvdr6mQ+mRQq9aUgbo8dTmx6q0+272xnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1671ec8692so141745966b.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710956; x=1787315756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7ZvHpK7CvZSqQoAUQWt0M0GRHi+RtHuH4yiUck2Ywc=;
        b=klWFessLT9amROEUQ+RcD5fgK8Hm8ENkneMxIDGv1AArtCEJzVQQogUR/hAqs4ui+k
         TNtXxnbFXbzoJ8yud1JoH79FoFJJOs/WZhTj5UYTXaiQtwQZvp9dy8MH7NSgmYYTZJUG
         xngyAP8rrQDcoB+3q4FIKm2Ya8VMyztcdwM0XvveuuqHJcA0STU3XGCx0+4bpLOFOv8K
         G1+OYQOOxoUGSTafV1tFguHPRDuZnZ7o+G45uSAEBztNJ1TJROj6o9fNI7M2JwefhOMK
         IyKuVyFLjYxivQ+jRM0Qs0611YITHApUQ4h3WQP2CMYMMg+RFAOSwrGm8UdZoBUXmMVs
         /S3w==
X-Forwarded-Encrypted: i=1; AHgh+RpnsEKPS26bTwfeGZDDMj3eMJjw5i61HEi7XpK6YgeDmk88MC9mE9/1mgCNTLCQnlPhFgWPog09uLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL7v1XL9Uz9EmuttGReIP4MjpBHiYunPnf1rVDKIhx78Twh+Yw
	LfyHU+mdJ9y7FZj2jVaMa8ncD23p4qsFtjcRItS3kCnQs7dWG08Bsy3i5cYi1P+dbS4=
X-Gm-Gg: AR+sD13Polest2BArbJ8Luy8rc47woZVBTJ1sHcTdrVCHvkyz5GGw3vsD835urho9uu
	0/YqtuNG8twmjugdeEz3+Mpd2JKb5yaWU5ZAzh+wtByhGLiRJY+uE1F1+Y/8TOKT8u+bP4i00DI
	YsJFmcq3KTs1qb+ocG4GfHk8Z6QEa7D9dJk6y+AaGXxa1PesBsV+5KNlrjm7W8tqyfXzK29780Y
	toBmt1VU5X+8U+Cv6pQuPZ1W5tdk9l83OixNJOBJsIqjLSdNKGNDiivZloH1jyIvYQF1mQFTbXh
	AK8jBWUrmJSGu14T0UFdQBxQqTDzQzG09higLxCVpfi3XOaj9yhDG4gArQHC1CSsCI0s6x9tpe3
	Wy0vTy97x3fP5eIJ51Rjolo3Im0WzSwDiWkGBi4K9tzsFZgu+kzNlSoZ4SE1cFP4PbcYi5lXZ7Z
	nYXrn29BA7fVyss5FkVlYdu+LrTdivMB1aCf/SZImPA1HcUBtcR9r5iyw9z4p1LK9BNwI/8EXcc
	XU9FJvwSvVoQHWECkWFBKls2w==
X-Received: by 2002:a17:907:9611:b0:c20:fd37:fe1c with SMTP id a640c23a62f3a-c2129b5a60emr251858466b.11.1786710956186;
        Fri, 14 Aug 2026 05:35:56 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21237e57cdsm98608666b.43.2026.08.14.05.35.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:35:55 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so1417514a12.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpI7k1CQKF/oxo/DOO16EN/Pjf1R0zPEKKbC0It1Rsp6bNjRxoSiLxZ1Ek3Am1nUwAANA1wSesPpm4=@vger.kernel.org
X-Received: by 2002:a05:6402:a6d3:20b0:6a1:b515:d2b9 with SMTP id
 4fb4d7f45d1cf-6a38a9b3558mr1633562a12.14.1786710955204; Fri, 14 Aug 2026
 05:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:35:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUWPx2kiV6xjEo66UrMROapDL1di_cfQ4f09YtsZo7tA@mail.gmail.com>
X-Gm-Features: AUfX_mzM0IoPuPWInjQpRT9GjZOnzV2_6uakqg5goXrXMoc7ptiDPxj1fFBNAYk
Message-ID: <CAMuHMdVUWPx2kiV6xjEo66UrMROapDL1di_cfQ4f09YtsZo7tA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] clk: renesas: r9a08g046: Sort macro definitions alphabetically
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reorder the DDIV_PACK() and SEL_PLL_PACK() macro definitions so they
> are grouped alphabetically by name, improving readability and making
> it easier to spot duplicates or gaps. No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
