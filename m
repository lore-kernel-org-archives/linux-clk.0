Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025738552A
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457928; cv=none; b=WkKNEdb/OxLED5U50NIgw3u32/PgvcKVD2z+7Dd9TVUs3jpYAnk35PkvS/cMspwJphp6UeRfALY7VcATh9BUBu62NHZO7zzFg8xLZu9lpLGBtO5ttyXN9VOul/sISCwKX1SD4PO/6kcUXvfcGeva8OTxnZbQ2y9I1YJOJjdfNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457928; c=relaxed/simple;
	bh=sgxnmhj2rQgljJRNTMAEIU71ZOKKmdvca0WN6HsSkl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwLWyzjwrFr3ANRuPGoBk2Iu7cv9dA6m/GxBbokKXfZUpgOV1Tc407ZYQkPueS1CCfpvyF/lE0891sI58rpJGGBC+UN5p9VTvKSLT9CJ8z5Y2Imq5kU8MKD6tRUPK1ZhUDjIvwwoXBZxiJ7gYYTyXpZXGjuXOX2ZSaDnnkoudSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8ebde349so3809927e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 05:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772457914; x=1773062714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/KgeLtXmZOUh5kr82wm/EePACuyTgS6gfBGBNvywTM=;
        b=dPwM8+AmJu5A60FsnUSf4vxxwmQvRp8qISSOSgTNHe8QDHKTvb0zibQZOTi05rzqFd
         U0MWsKaNeVXlStTOlLbO1OnhUSeFaTuC8ApDZjcW5Wi3VPxgHLuvMXozSD8XIrgimMbb
         ZDev+GlctyeonqqxklkQfrqDU9IuBQUR7E57q2ycxg3cinM92tXuQMqGnXzfD7sCJJEe
         bIQzNJiVR89DKU9ucN3X4h5g4FSWFyopBW1VqeZ1DZq/+rH0KAZqdDioigUi0FVt8vZJ
         APA8/YNZMbjR98Ct5lLjvcA2TTasaHV8k9ONgtnitkZXZ8BOwD/MAQDeoNd9HUWfLC3l
         c1dg==
X-Forwarded-Encrypted: i=1; AJvYcCVWwsRdr3/Ex0oSki4HKNPnailKnpBid/B7q46iI1JePfle7mN3hwLzRZkjdNaGi+dHeFp1FRzfyQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YnYJ7Ga45kRAnZsBvll2+Mk8SEh7cE8T9DPLwFMIInT3dR3L
	toY3LXZTA/kTraSW+zF6ygQ+VamflClf0J1TiDd0n32DPIS7EPKSk3R5WV9JvM09
X-Gm-Gg: ATEYQzx+JKIAViKmrwYM1SzWYkel5SpaduIhUAdrREYJCGeO0l6ZwXytUdVAYfnwvEH
	gwpk/9iIXit3RUEH4tF71IlEKH/g5DeV/tLeKRw/Ji/DdMM9e5B+BZ5bdYl5wnSc6O95LpvWp5C
	1qryrY0JEKl5XgCV/t5MG3WC65Q1yxOxel8S5qAEKM84V6G/FGIrKffYu/wmH2Cry+/T7N+WWH7
	uO3rJcDSqn9dNsEp1uTZEjJrzax2ijZR/RSBvF5TUcC/QlqZ/EEP6ABNSWrooHgjpFs9stKHJAL
	pkQ6Fv7/f7JXYZRnE6O0APXTXHswRLAP2wBz+xiEhVeWC+m7cSGG1KRY/HkPQACcwQJcIwmV1+c
	lnzjsaJD26ubHR+l1b1XRFz/gqCpfC+d9/BXx3CUEhmRd0FxmOgBv5Vjx+9ghkhB2Wpbg8E3got
	ulri92FFcbv1/qyUg7gF5Uxq0w7xr5fgP/vycTcSkkwmeCzLOLbRAUrO2haUQC9GKkp5SYgdc=
X-Received: by 2002:a05:6122:829f:b0:566:3954:f74e with SMTP id 71dfb90a1353d-56aa0a16848mr5655542e0c.5.1772457914284;
        Mon, 02 Mar 2026 05:25:14 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb97absm15307963e0c.6.2026.03.02.05.25.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:25:12 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5ff09bb668cso2960928137.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 05:25:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+6OLsosue1JLviAHXddUt6Tt7J+Mf7CaNvJSobt0+twrBG+u/iuneQHNOpoRCmEp/0k5MUMQDlV0=@vger.kernel.org
X-Received: by 2002:a05:6102:304c:b0:5ff:1d94:b746 with SMTP id
 ada2fe7eead31-5ff32519f2emr6218672137.27.1772457912000; Mon, 02 Mar 2026
 05:25:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
In-Reply-To: <20260227153225.2778358-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 14:25:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
X-Gm-Features: AaiRm50Tkxhc-oCHlHPyabn9QxR4wbHw_RTC9z1g5dQZe_w9JY9CV7dca6PXC-4
Message-ID: <CAMuHMdW9dtAnT2E103kp1zK=LJrER7k1ib8_WPk5aorPRw80uQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, dan.carpenter@linaro.org, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

Thanks for your series!

On Fri, 27 Feb 2026 at 16:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).
>
> This series aim at solving this in successive steps:
>
>  - simplify and reduce to the minimum possible the rates data info exposed
>    to the SCMI driver by scmi_clock_info
>  - move away from static fixed allocation of per-clock rates arrays in
>    favour of a completely dynamic runtime allocation: just allocate what
>    is needed based on the effectively discovered
>
> This is done in patches 1-6.
>
> A further bigger optimization suggested in a past series [1] by Etienne

s/[1]/[2]/

> would be, whenever allowed by the spec, to limit upfront the number of
> queries in order to simply retrieve min and max rate, that are indeed the
> only rates needed by the CLK SCMI driver.
>
> The approach proposed in [1] was open coding and duplicating some of the

What does [1] refer to?

> functionalities already provided by SCMI iterators, though.
>
> Patch 7-10 implement such optimization instead by:
>
>  - reworking core SCMI iterators to support bound enumerations
>  - use such new bound iterators to perform the minimum number of queries
>    in order to ony retrieve min an max rate
>
> As a final result now the rates enumeration triggered by the CLK SCMI
> driver, while still allocating for all the existent rates, miminize the
> number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.
>
> Finally, patch 11 introduces a new clock protocol operation to be able to
> trigger anytime on demand a full enumeration and obtain the full list of
> rates when needed, not only min/max: this latter method is really only used
> currently by some dowstream SCMI Test driver of mine.
>
> Based on v7.0-rc1.
>
> Tested on JUNO and an emulated environment.

Thank you, this removes the need for increasing SCMI_MAX_NUM_RATES on
R-Car X5H, while decreasing memory usage.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> [1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
> [2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
