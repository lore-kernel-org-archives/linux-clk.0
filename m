Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF51D3A6417
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455651; cv=none; b=QjqbOkwOfbxRzesKrmZTND82HQfNCva9HpjvRDzySZ0UCZL82opWJn2UNYXdmgKmrgY8JlrR1tGvgRVjcHM836DhNTMGl4SPOImClfhpp9i7xPtWRQWi1vT2X3Q6OtImY/BKhw76r118skHhXeQ87eJAqyCGsrVVLEq4No8gkWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455651; c=relaxed/simple;
	bh=bbZA1NIjrsyDbwc/owDhNs6Y6gSNpyIeUkxNy0yJ1ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDTaggVCkj32wFEwzeCWkkT2kzkelmzQCeQt07FmsGsW0hthgpZROAhn7Om7ovndbsvzInkKTNm6DjzbNIpestYZ4QNYPpfLWjWlYQjEIHjF16ggmOFgUPot1UlEE3X7HukeyDqBNz7GO9n14kR7+epZeh8AGC9J04l79W5VSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-46392972257so3604605b6e.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 04:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455649; x=1773060449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHdX83DJ8NzB0+Dg2GzVMundpvvc3+ChCaV5hT6gxKs=;
        b=B8o3mEf7ezOeT8nEKVbGWcIs2VCl0QrTGzWMrUym3KPuADc5gsAIC5VgjqUlTvy+F8
         5oft6ltHDw+zBeYOi5YXUDDmgDSMoefwp/pPHBPPt3Tss0BmCCAriRWv7kakSGNiBvVn
         CNnZVCCnTgJ+0rRiJmsK3JeQ3eQI+buDyZt1AiccGxeoGVXrBAECCaXqrRFYCrH/QcFE
         xVecvmljYnfJg8S93pHs3xiKIUTrZuvbry6rMxVchkcOFglqnrIexapJXwWMoqxNwgT9
         +CQTuWAkaCRuRzAdOb9fMN0V8PkxdHguLPsfekARnOpUMfTSEmrv28khm39E0w9Z8tmC
         FKgg==
X-Forwarded-Encrypted: i=1; AJvYcCXkjJhWlfS444SGENbOZtNBIS/EkhysJHyQwmYAO1eDsLPcKKzZCiQ/38ZqkrgjZj9geOPXg3dgRV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQY8HgKq/H0ncBzwz+MLnNV+BzFYe/pr/ZvLE8gjEFBWsU5DZh
	TKaGFIOMCw2FISxzHgbbSQbaHvuTLKedxgwl/vAy3tXzA3gOGH6Uv7hMvTh962ae
X-Gm-Gg: ATEYQzzJu8WjTsdXdqXIq+rxmJB2OJjLuT0ATKYtc4xYLiEzoVPRM2KiQOo3uIWUS17
	qd8R2uR8mB07+K2rx2WKMumK1/+PDd6QkYSWYSi06Vx4/AeXp399XqzyyYsc/+xDFx2jI4F7Fn7
	KUk+TGtUOsG/JWPsf0galZ6tpIKnqNSflXjFxXEIGBD3XfhwbD5hhuXRSNRj9W2VTzxNxIE4PNs
	/O5gGTe3TjrZgnG0xDAxbHsoX6SHhEr7PXWxzj9XxEphG+nQr8uXb5QJPwuJ6sVX/M9MLBkyhWm
	UbX+lfoVvMLiZ18mRv6+Lb1URJ2r1gPjjT6iZRkdYbHvjJwEZ99GjKmwLA+p2eOwNwSdkeHwxEJ
	xo2xbhfxoY8ICwyBCK5W9cc+fGraq2dKj/stkINg782ZyHkPvkYG8u3h7xhnA2uB8UZE1pSbf5g
	zB67S4Z5FmT2LL2fAOOJPCU4jdvm63UnBJsPSAxohKyO0UOsaws3TraGjMVzjd
X-Received: by 2002:a05:6808:1587:b0:450:42c9:4cd0 with SMTP id 5614622812f47-464bebd76e5mr7250748b6e.49.1772455648659;
        Mon, 02 Mar 2026 04:47:28 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb3ab302sm7475701b6e.7.2026.03.02.04.47.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:47:27 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso3884936a34.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 04:47:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViDguOxes+qK6yv5pFsz3Tmlzsoe8MVdpNery+sB5XS1Hpno8kFXNHQaYRw2P6G2GrSw03b9Uo75Y=@vger.kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:3159:303f with SMTP id
 ada2fe7eead31-5ff3228629emr4217443137.7.1772455202516; Mon, 02 Mar 2026
 04:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com> <20260227153225.2778358-3-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-3-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 13:39:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
X-Gm-Features: AaiRm53Myvi_2ZqSj1TUDPoKLpT_7oeJnXIYfnZdksVjKBsJ5C9Q8S7vMIJT-rk
Message-ID: <CAMuHMdVCgq4Wbm8g_O9e1sPhJ4PyY-nWTt9RW1f3=G3a0PvdKA@mail.gmail.com>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Brian Masney <bmasney@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
>
> No functional change.
>
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
>  static int scmi_clk_determine_rate(struct clk_hw *hw,
>                                    struct clk_rate_request *req)
>  {
> -       u64 fmin, fmax, ftmp;
> +       int ret;
>         struct scmi_clk *clk = to_scmi_clk(hw);
>
>         /*
> -        * We can't figure out what rate it will be, so just return the
> -        * rate back to the caller. scmi_clk_recalc_rate() will be called
> -        * after the rate is set and we'll know what rate the clock is
> +        * If we could not get a better rate scmi_clk_recalc_rate() will be
> +        * called after the rate is set and we'll know what rate the clock is
>          * running at then.
>          */
> -       if (clk->info->rate_discrete)
> -               return 0;
> -
> -       fmin = clk->info->range.min_rate;
> -       fmax = clk->info->range.max_rate;
> -       if (req->rate <= fmin) {
> -               req->rate = fmin;
> -
> -               return 0;
> -       } else if (req->rate >= fmax) {
> -               req->rate = fmax;
> -
> -               return 0;
> -       }
> -
> -       ftmp = req->rate - fmin;
> -       ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);

Oh, so the truncation bug exists in the original code, too.

> -
> -       req->rate = ftmp * clk->info->range.step_size + fmin;
> +       ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> +       if (ret)
> +               return ret;
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
