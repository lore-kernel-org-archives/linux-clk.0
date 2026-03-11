Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9CF31E84A
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248704; cv=none; b=MzOocQ9chLKuAR1iFlvH2kHefMhyFD9awBbIXyWCou0HLQ9BUhbgYJ+epvAFzOe9umxuE0MgZMecYi8e9eEBFMgmWjZyz21BwCQmTBLxq2aMTZKtebCWQpdE4+xsYDM+LPWpGcOxbTTLU11i1Py530x/kkEqCcP5gD2yPWyoFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248704; c=relaxed/simple;
	bh=3dMJxR9TjCJ9S3Lg7LcRJbtat+eyZPt3SNqC/m6FxkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1OoBxdGKmnfu4JEKGBAxURokmcQlakqTecGD/OykCmQZOfP0ZfvRLkVLlDOD6AD5EZ5FfZsbcwHehUKWSvjajoUQZb6eYU7IuBngKNVCNozUAXZr1xT5Tatqba/PhFTqbuBjnF7d4ucZbJkHbu7mThOSTnoa7RzzRBs6qXWI7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd785a8783so6764685a.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 10:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248702; x=1773853502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHqYyMyxNQscHKqebkYfjh9WcEHBmwP9uSBnn8fEJDk=;
        b=GWxYdOvLySqcAjCoxxESEuYoqhFIQEKvKe3PS4k2tj17I+j6jD86JxE0ffGv+wqdND
         T+ZbGLZlb1q5OByUoFXBn7WGjmzy5ehYGY6qy+XwI8Ben3CXlfvyCNBdWA740wPrRY+5
         azV8CkGlBzAR4+wsL1vxFh+0SV7yPo/ym+q8Zr4p3HM7Gc25cq+m89QJHPLVcKJ4xfEv
         QAyTmNxVaS8p0ZQcX9mi3+OWTyrDqqrN4Lhn/YzMhPK84nxnZu6wahUgg66g5wMgDwTl
         uIYNdaJaxowmYFftKR6x5qIF/RocKweJV3c+iWfZFvqa1oZuhdI1z6VVCJ8v4gSITcAv
         LKlA==
X-Forwarded-Encrypted: i=1; AJvYcCWXz3lrCxWRmsI+HVIdXQB2WW47nKlYB38PhsEL5+Ej99sEiZtv+4qPO6V1fg48x41e1117J114Nms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWJrt9ZoSzdzT7cC9yaaAFqUN4i6MrkTkbSayLSbqLsCfcM/6
	SkXJmNXIdL2bAcFvlgGFVHpQ0TH1GESBakvhu6kFDJ4qeDOiratBEABbluljelE6mW4=
X-Gm-Gg: ATEYQzxZgdWkdsv9frY1plOyONuaewRFQMGl4SqvTq9VRLD68lnLiS6X5ZqPIYpSWud
	2gmyMNk3Y22l6Jled4OgdRCOq84SDZ6WoZnirrUL7AxSaDzWcS7Q/PMVxS+5KhjlgRtHIpkCSgu
	uJvYdWQ6LhKIf56axejySVVTBlEbT1u4cKUYUrWK1uDVXstjoHi8sqyqji/lf/IgCe5zA5DJNoD
	JYgD4Sm6gs0XE1uzeV+vZR5J6XNklpPNu9v44HNF4Nn4o8PLJpzBWWtdw0EWyCDsjtMtnkhWiFH
	ZbO40wurC1r/003EGWtF6P2bJ82CmtC5/lodMsFs7o61yS+FJkHrP0Y+rrCpQnvgV/y0DOoxDqi
	f8v9sW3RB8D0pgUEyOaAC9LvVNxMDR/75CDltmU4T+x18THyZJdTmz3YcuApemxzvPbBPVoBowY
	Y5dXP0XbPD75c25G5NfoAs3nZE07sjEYOjB4m9VE0phuchFK9hE/QnsUYiJUemoUho
X-Received: by 2002:a05:620a:191c:b0:8cd:9665:9eee with SMTP id af79cd13be357-8cda1950f82mr413190285a.24.1773248702147;
        Wed, 11 Mar 2026 10:05:02 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda214be99sm186397485a.41.2026.03.11.10.05.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 10:05:01 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-509149ab7d7so617221cf.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 10:05:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0hqZNAoRklg0Du9F9KGJ4P3f/7ai7uexkWSIpC+29xfpR6v/YZ2/pJZnrvu4yAyKztEL+Ch5iviI=@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:5ff:a16b:93f8 with SMTP id
 ada2fe7eead31-601deaf0a5cmr1083265137.6.1773248394584; Wed, 11 Mar 2026
 09:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310184030.3669330-1-cristian.marussi@arm.com> <20260310184030.3669330-9-cristian.marussi@arm.com>
In-Reply-To: <20260310184030.3669330-9-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Mar 2026 17:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
X-Gm-Features: AaiRm52tcdDuztFkx9k48Wz50kutFch70oo-cU-eA7FFMTwppL_ACNeUC0TZgzs
Message-ID: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol initialization
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com, 
	marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Add proper error handling on failure to enumerate clocks features or
> rates.
>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch!

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
>         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
>                 cinfo->clkds[clkid].id = clkid;
>                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> -               if (!ret)
> -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;

This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
do not support the SCMI CLOCK_ATTRIBUTES command.
Before, these clocks were still instantiated, but were further unusable.
After, the whole clock driver fails to initialize, and no SCMI clocks
are available at all.

> +
> +               ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
> +               if (ret)
> +                       return ret;
>         }
>
>         if (PROTOCOL_REV_MAJOR(ph->version) >= 0x3) {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
