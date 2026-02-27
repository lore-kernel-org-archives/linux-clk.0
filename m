Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D107288D6
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180424; cv=none; b=GvYH0xjaJXiVyWZ4sdttFFlMz0EdSdiEFgwrCh0de9kK3j5o4qKa8NbTRJM+duWF0q5qKqJNquKBR1seama62S8wvdgaBTB1rzRUAGK5Wc2wgONmbZ0fS0RBzqk7CAtYxJk7/qxsvTFm6J2Kr/61sp2aKH3IZUTjJ+8DtFvXeFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180424; c=relaxed/simple;
	bh=qfGaDXK95+OOnoa2/Oo2k0+JRm83LeVTat62jVPLQws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbfQJls+lLXAjFBZjZh5jkKpSjTZl8d46XelRhmLrNnmKdzeIJZsr1MBA7lI2JqrDsmxne3OO3lwxs2QIRDmJd3i2ooRBtFMSM24ThkSgr+PceEKbWkfhaGSRuNIrL29K27ztC8XiMEdOGksaS5cmaLhVyXVOQ2FVRe3KubroL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso693177e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772180422; x=1772785222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vM7kNTsRSuwTYb1u/IIFpUK3Lpu1QAEIlctXUAXXFc=;
        b=cuMHT3x7FJcHI/DoQsGke2LcOsfbpdmX623HGNVbHPkSo5MvCR4LV5s5FNJuENKntf
         Pyn7HQG+Ae8GDrHnLq9OVxIRsrkvqq4YIRXEGqw03x9O+SUP3re4ceCerEncKza102UR
         BD+sdryhHMc8MitCQ9bzK4hks9JuroI3ls5TUMC0WpzIF2ltTSjpWmZCn8oQjVKg0HrF
         WqZJMeoGHB9repFhYDIXtlhz0kErt83cwiKpsBtcY1CXQDSEhcFHV8FPYHj9oRja8plu
         wNOrIw9BAFPADxJi+hBrCUqTPqFDemUkV1uWzplHJIpbnBQ4o+C1xKYT1XCBOHkhrlO/
         VTuw==
X-Forwarded-Encrypted: i=1; AJvYcCXh6bycOiYvj5L9zmfbStkEqUXSRf7wZnv7n2mX3bxutMm06N9Y6I2NNRRnKtXbjccRZ9koWhqT9Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoCp0NzlQEsHdy/yQaWrfkedzqoz8EIViN7Ijv4r5D41GeyKe
	mXVrMI9yUHLhGxVLMjb5VERVBEP9fnmS/edzyBKIpyWMmhTLDp4B3e432JR5DwSH0oA=
X-Gm-Gg: ATEYQzzV3NFQIOLCu41QWo5n18jlRxkoO2QAIc4FaU0a1UcUwFprxa5lXY59jAXhEzM
	IjOwgDZwhnZdvAN/QSYa5IImJcY/or8IicH1lACKxckofrU5uncVkCPlU4SZBon7QpNCTDMgq+B
	+KNZW6Z+b+5vU7DMkUTafqppub2kJM2tjGwmhwRWGCjS+mVV5dva50J94UCWLQNwkSFGmHho49V
	+nU//olzil+cR6WgZxX2mcX0ojhA1txRiWSh2vmMFq8pePmrH5IO4fr/6O7lcoOYbqUyG5FpdI2
	csawhSxU84yIZMpf/+EN02anU1T4b7H/E/us30SGn+PrLRw3Bh2Ax6nD/BK/BpyYddPYUnTkysL
	jmQl1392lLI/YrwycOzDweY3u0e5PVcs1QeVwzyao7b4lVGHwuppXlXuq4zY6cGSR45oRS/HyzS
	Wh+4UqsJYx5NartglSPpJ/EJpvHTfgIliOcL8HA5tNFpkJtkwaIYsNusQTxoTv
X-Received: by 2002:a05:6122:1803:b0:566:37da:a72a with SMTP id 71dfb90a1353d-56aa0aafaffmr1015438e0c.13.1772180422327;
        Fri, 27 Feb 2026 00:20:22 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a920493f9sm5392034e0c.13.2026.02.27.00.20.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:20:21 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff196450c6so427059137.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 00:20:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7vDShE2hep0UJDZJrcYT0+fQiA7sD9ssnD2LHMTHHG976EDj6PhxpE+HhafNUp3sQm//vQRYR/zw=@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5f0:2451:5f5 with SMTP id
 ada2fe7eead31-5ff3227b5fdmr919932137.7.1772180420917; Fri, 27 Feb 2026
 00:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com> <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 09:20:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
X-Gm-Features: AaiRm514zxc-j2wSE9hmPrV4K28ncYIEZUw_Gwmc4uNdGcUAjx-4leTB7pDypQg
Message-ID: <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op and
 use CLK_ROUNDING_FW_MANAGED flag
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

C Biju

On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -938,12 +938,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
>         return pll5_rate;
>  }
>
> -static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
> -                                          struct clk_rate_request *req)
> -{
> -       return 0;
> -}
> -
>  static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>                                      unsigned long rate,
>                                      unsigned long parent_rate)
> @@ -1015,7 +1009,6 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
>
>  static const struct clk_ops rzg2l_cpg_sipll5_ops = {
>         .recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
> -       .determine_rate = rzg2l_cpg_sipll5_determine_rate,
>         .set_rate = rzg2l_cpg_sipll5_set_rate,
>  };
>
> @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
>         init.name = core->name;
>         parent_name = __clk_get_name(parent);
>         init.ops = &rzg2l_cpg_sipll5_ops;
> -       init.flags = 0;
> +       init.flags = CLK_ROUNDING_FW_MANAGED;

Iff this is the Right Thing To Do (TM), it needs a comment, as this
clock is not managed by firmware.

>         init.parent_names = &parent_name;
>         init.num_parents = 1;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
