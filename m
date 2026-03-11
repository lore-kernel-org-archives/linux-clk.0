Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA03D8908
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773228653; cv=none; b=mOMoijBZiUOOfOJlwhaiTyhvTVYh0jpy2wgNVu/Ess1RLFVCdWOhpwV3tOTL9nRArYNQiQkGa2QaBsK+srSQ3qG3NdmvyQ8ukd18bwOHusMLTErpJC3ufQPLeyZojPQl7V/l0fKoPACXUkbZ4KfitrPRLaJavrYdBeCTEpCXAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773228653; c=relaxed/simple;
	bh=+3Q5cvF0zoX3Fs6Oo+yHNZCoRTKFJVHEonlQPpaB+j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gk8mKf5KAj1VXnakMo9k7AMAYNKxbb34RH4L/R6zcGLFTLZeOxAgatUSCqYPE3giaXd7fcZmQuMyosHu/a7Bb0hvwqvt24jX5QictLlrv8KNDFp0g34B8JnlCkNmlpA2RY/c1dCB3BiXwnqkje19CODTWo0h3XmLdogXpqBNslI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffc6a96602so1530451137.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 04:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228649; x=1773833449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFUwPWUa2C8RyPEgXtS/bViQ1F3uFE3QYAtTuWHnxcc=;
        b=fpLb4k5ERvyF0UVxfTJBcpMrg1LMipUKszhRXvOjDcRrxGiHCxFgvTvu85QhuHkMNG
         aAG/exeZcm5iuzk8LX3CX18A9hTTSMZrxJwjGAVb3Jrvgf/Mr9O8krQq2yyFTYa+UMhW
         JpDJ1lkHSGbRlwXJ9jLBnwJ1AmZev2daIdkSCqLGOCA21tni92UljGWViD+46wE5cllV
         vxJeSbCQx+giiquEM7HHdOs4kmvyXEsB+JTpRgQIEf8U80LkFLNaN7bsDGV2OtYrocS+
         hnO7D6NE11E5T53PF1Z/HBpLoCb+I39KE3b4NTHZ3plL4w9tI8J2gyB0nkUbfXtHHHxB
         gXSA==
X-Forwarded-Encrypted: i=1; AJvYcCVMkLXvIwpKHyxp9YKagoQXH0CyGyBDuh0kv4ZgFtN2PvpwcVQhCBEsgRTfn1+3d1z6L86z6Or1KeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzduVBNclyEO6z6i6niq46lnOzhKlOg2RQEBtI6uxLYo/n8VnQh
	WPB+1pelvNsrxoJKethqJahFmpZf7RNwUlZxzzCXBhD1NfFwDRfY4u5nk+VNFPvE
X-Gm-Gg: ATEYQzyB3vVmZYWyAIe1hNJ3Ws7jgXnWN7iMx5QiEba/hNpAuyCPGUg44i+v4/kDuIE
	3VS3OPCNo+lmBy/AYVmO5Eo6G5K7pNohb6ksAZ2DeanyQS8P0G7paYz3e4/ZdGxj4mDzfpUtiyi
	KLXb3l0SxHSAeAG90UKLjuPafVOhahGZ9Bty7uN/C4KnwOVQKQT9ZSghB0ibvQ3BWjjqejcvmVA
	XKUM772Ex0LPAnNm+ht54bTUXjqLUvaMhRgq2aADq0L3BlN0d1I62YR3h3YCWdrYVnSEhf7v5k3
	xOgg/ssXiN8yl5BbnfTJcpJW1w4/YW24cYhHaIvp7sdaCuUZkEyQDTQ9oE+r1I76aU4OBb4tJny
	og9Yq1Uta2eo+hMs+toJnDkUClXi1wARkSYuqVvVUKhHWPZicXA2MdjX64Sy3jxz2i/c+3pYkho
	ZPPmqnbH/IQPeHaLnSSXdZUq1PvqLDgN0B2SprJKh852pLAQPX3pG05s5fLE1ln6xo
X-Received: by 2002:a05:6102:b14:b0:5f5:4eac:cd2e with SMTP id ada2fe7eead31-601def6651fmr755087137.32.1773228649091;
        Wed, 11 Mar 2026 04:30:49 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc4e9bdsm452007241.1.2026.03.11.04.30.45
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 04:30:46 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56afff51694so2754993e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 04:30:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5+0I3IwG1Tx2XdXc/58MKDz9Q8UpcZIDzKSKUkZmwgiJ3755g9A+kvwzNAuOjvpRcHCaUXQhFSsc=@vger.kernel.org
X-Received: by 2002:a05:6122:4b14:b0:566:2711:d8ab with SMTP id
 71dfb90a1353d-56b47474538mr661085e0c.6.1773228645230; Wed, 11 Mar 2026
 04:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-2-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-2-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 12:30:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
X-Gm-Features: AaiRm531V7pPeKFeCYpwBljOpOuuWMHfwPn8-oVZZtZhYt-YNy5G1WfiCBuIrko
Message-ID: <CAMuHMdX5T-7ERcjEK_=z7joEftC2cMLqDkyy8iO65U21S-umng@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] clk: scmi: Fix clock rate rounding
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 10 Mar 2026 at 19:40, Cristian Marussi <cristian.marussi@arm.com> wrote:
> While the do_div() helper used for rounding expects its divisor argument
> to be a 32bits quantity, the currently provided divisor parameter is a
> 64bit value that, as a consequence, is silently truncated and a possible
> source of bugs.
>
> Fix by using the proper div64_ul helper.
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Fixes: 7a8655e19bdb ("clk: scmi: Fix the rounding of clock rate")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c

> @@ -83,7 +83,7 @@ static int scmi_clk_determine_rate(struct clk_hw *hw,
>
>         ftmp = req->rate - fmin;
>         ftmp += clk->info->range.step_size - 1; /* to round up */
> -       do_div(ftmp, clk->info->range.step_size);
> +       ftmp = div64_ul(ftmp, clk->info->range.step_size);

include/linux/math64.h has:

    #if BITS_PER_LONG == 64
    #define div64_ul(x, y)   div64_u64((x), (y))
    #elif BITS_PER_LONG == 32
    #define div64_ul(x, y)   div_u64((x), (y))
    #endif

I.e. div64_ul() is meant for the case where the divisor is unsigned
long.  Hence div64_ul() may still truncate step_size on 32-bit
platforms, and thus should use div64_u64() unconditionally.

I am aware clock rates are "unsigned long" on 32-bit platforms, and
thus cannot support rates that do not fit in a 32-bit value.
If that is the reason you are using div64_ul(), it should be documented
properly.  And probably the SCMI core code should reject any rate values
(incl. min, max, step) that do not fit in unsigned long, as such clocks
cannot be used on 32-bit platforms.

>
>         req->rate = ftmp * clk->info->range.step_size + fmin;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
