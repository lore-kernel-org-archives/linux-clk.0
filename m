Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF872F8EB8
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 17:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261165; cv=none; b=Yvn3ZHyF+HVwG7HcL3ff+mvrYiL1Jw/hDhSMZTeAxcfAdJnMj4QQUX7iGIlZZ3FyikT/1gqBTmepBvOw+1HCTS7Am2tvDGV3N9SrS3eRtVjqWsqQg7ZHM3Il9Mr01neXVfs+98llkoAA0cTNVd0t59HzxCjKj9bxvEQDLmcCzuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261165; c=relaxed/simple;
	bh=d3tqz39L8iL5cu1eneVe/IK3XxjBUmhnX0iGHJqd3Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1xobHHK6Sf0MDYYUWcL0YOxWFHj0gNmqVquIda0/TWKUjvdOESSwIqH/U61+O21ploF3eGrDK2sp3C4QqrzVgCbayX1oC5KBanUuXQjFz46Lz3O2iOhg/KZsvEY2DUspLvKy+9eUT2ZBgDvVF6LvGxFS3I9qmkg86wNq/7P8U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso2039135e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 10:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778261162; x=1778865962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1gOD0ZM4cLpgZVKDB7ZJDmU99nqHZQBEOc0xVeQoZU=;
        b=S9kAn37z3YNerQLu16E+eRMcJ/mCB3PCopoWWp5JLgfva/IAZ9sYot1uwXFmUY9nI7
         Js4N6OWll+CuRtdBye4NM8TEnfEAH8BXlHGMwXc72MjftcuRw/ivcmP9H5r7H+cv3eQ3
         jcy3x6LzxFRmaLIdsih0g2Jh2r5TQIROKcU6gbYLeUAeBgW4LZRRyboXi13u56AWKEQr
         sb+i1Q0xWXYt95ML8mdCa542/vqVDr4ZgDjY+hHtBtFfilsD0nf8wIhu/tCVd3A8GSyJ
         1fa5oqrUMecCtAoZPUeax2S6fup7h6WBrEHYDz/z5U481v/wbE8EaB7cwjTjUCUk+usG
         KFaw==
X-Forwarded-Encrypted: i=1; AFNElJ8H7AbXRydON3kinmJAgJsAE3FCaLUw87gwfAsf+SEKSoV44crmJE0zzTJMqaoPAMYC6lx75IYxKtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz333TTR//bx7HKztrfc8yZ//TBxMLnyhwFQrctmoU2d0bqQC0
	LyMC40FhPeR6TzpEth9me+sP9qo+1Lgxs57618ei/DyQBebInSC0PMzXAO+bgn5N
X-Gm-Gg: Acq92OEOGURvwHOnGNs/63YW+QLE34HU4iYpKIejpwNyL6FtO0GKWtVt6JQVSQY4Lzv
	kjBkJG22KHUOAq9W0SNtE8cR5k3F2qf1l7O6OD2TuAvyonksjMF1qpxl2rsENsPiOU0sxYvg93Z
	OjI/JO2L4u8Z0s7cgciwCUexQCfpOfyJ+l1eq0ipVQSiGXTknXt2xDunR7wM+vq3hHtz1cKELCz
	JIZvVYtNGYQcPanEAk0Z4bMxU6didAw01dU/bnVDGd6VmVdhOOXPDbg5Mkc1/phfh5tIt3hrxLq
	i/7/f7QjMQDWhIKWKJCRwOceNOZc0piyT3Eo6JATf+G6Xz+Wfq3sc3JJLE7kdtUAqih/DbcHH21
	3HuEbPBNeQgwBtEt4fAMyh70mpzLpdlGTjQQ/cZaG7VL+5rue6y45Q0wbQ0b9cKcx+hUw77aHYs
	yZcUu0TnTDChUzoXqunwuDAgRRRL1WNHihr28crF0ukmSualeGnqBVWZImglR4DooZ37ePqQE=
X-Received: by 2002:a05:6122:32ce:b0:575:56fe:574d with SMTP id 71dfb90a1353d-575596862fbmr7860187e0c.12.1778261162061;
        Fri, 08 May 2026 10:26:02 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869f2d08sm1563814e0c.0.2026.05.08.10.26.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 10:26:01 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-62f4c4e6694so1387544137.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 10:26:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9SueEn44/NKG0+yLpUEVasRaHFzvVbLWy6f8mL+vV+1qK0S16fiTAnL9M09Y1xMZ1BpFwWrtxMXEQ=@vger.kernel.org
X-Received: by 2002:a05:6102:8496:10b0:631:37cb:1e64 with SMTP id
 ada2fe7eead31-63137cb2003mr2206554137.4.1778261161532; Fri, 08 May 2026
 10:26:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 19:25:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
X-Gm-Features: AVHnY4ImO3mUPR5n2IoskKjzHgmLGVKQHLOrOGove6CxmDdyTEnlUGm3u2KWMbE
Message-ID: <CAMuHMdXyJcmL1k+odRC3ej1fx2oH_Li3RjniXuqXyJUMpBo7CA@mail.gmail.com>
Subject: Re: [PATCH v4 00/15] SCMI Clock rates discovery rework
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com, 
	philip.radford@arm.com, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com, 
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Fri, 8 May 2026 at 17:33, Cristian Marussi <cristian.marussi@arm.com> wrote:
> it was a known limitation, in the SCMI Clock protocol support, the lack of
> dynamic allocation around per-clock rates discovery: fixed size statically
> per-clock rates arrays did not scale and was increasingly a waste of memory
> (see [1]).

[...]

> v3 -->v4
>  - Rebased on v7.1-rc2
>  - Removed unused info.rate_discrete [Geert]
>  - Made dev_dbg() more meaningful by printing tot_rates [Geert]
>  - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()

Thanks for the update!

I believe you still have a possible runtime bisectability issue
between "[PATCH v4 04/15] firmware: arm_scmi: Simplify clock
rates exposed interface" and "[PATCH v4 05/15] clk: scmi: Use new
simplified per-clock rate properties": 04/15 removes the last setter
of scmi_clock_info.rate_discrete, before 05/15 removes the last getter.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
