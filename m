Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147F22B8CB
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053819; cv=none; b=P7DRewVxfvzrND5jiv58Almhl9h++ApvuCIICLT/HxVqPL1gFHdM7Og1HeS1x910uJeRKacREwxEk1r3GrUCa4yygsxqdPLUg3OVJekEnfLGxsaYKkuOjPTQFz35Hjs6x5aebXb0NfNoCL8n4IofZiQhdk5MVz9bKLt4sEK1aDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053819; c=relaxed/simple;
	bh=rFDpMMd/J7LmBoOgvX90w3JvXvtchMw0C13OGNdvG04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0PmTCmMvP3HpBcv6hEVmi5o1KHjg/CkERx7YrguUOc0Az07MFXHcixWsNN2ZSCmzNp0E/5QYz8p4R3Qqj08w7NNA3CJOb0Moy67HgTU2YTsO28p4tLSuw5FV7qm6slz2U2xAdbRjZr3neWoYko88uoQ9UpE2AgKpV88zJbSSCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-932bf9d3deeso2975646241.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053816; x=1761658616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b78/bqYwVh1ldrSw5qZkZyL5FOTBO1IYeO3ztxHSC8M=;
        b=Tnp1dc/Nzzzlpj8YK6xaTGMqzfF2XqOc37rxw3hljz64uU8kUXDN4uUmle1Qfg7sUK
         /Jd0YqIq4Mk45Dju1oMFdaFthV3uXjN4lAz9r2kZnCKPnQsNzRBzDk2IC554+vpsC4P+
         JU0pKfvIFJtv2xHhRSJh13aKOR1JPo/puab5TjAisAP+/I7cCmHudddUS8n7/UhPTBK/
         VGnCOgVBqJdg+IaacvM531I/oBWKFB/Qei/7oqhLMI5x2CSE8HOnQfi79hsHJRRnks5V
         +wfGph6N+mDnliBybdeL7BPMwnlVPwWX/0ijAefzxqzD5YHDASm1ow617b33imdSOPTU
         At1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNDtOiP1qM4QgUKyoCiBMWrL+5m7vnNuandUNlEafhOqGTEAh9KQj+QO1NSFeGvB3TdwLCOgif/M8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcp92Ax/kENWQWRvmgRfuGiZ0Vg8Bn2VS8THXJ/Pm+g6NPYM26
	1rjB6YJjq0AKkL5EBbv/ZA8ut4tnx4JXoi/+8v/OQH7pn5PDXf5NzcMVZLxl5PCP
X-Gm-Gg: ASbGncu0mf8iglU+TjapRz+GPA4cGjAWHOqunGKXmBlTbbVz3dxOgAqrqoXI0t7eV+A
	4Ade4tOQiL2O6pv0auqBdFYMFDZt87UvpbjV/eLTjfVOnSUCCdecwXwxcwj+Ob1l2BVSqxXS+pG
	F7DgRBJarE7fMnQyZrTMEbDjn+qfSeh0M9RHg0UVTT/nOXKGUJ9HJ9rfBppsnb7ixNAEnS1WyYv
	EgdoMEHTo4RKnjuRQdpeRLjpotlO+Yb/MBdOzA4bYRHEPuGNbMJfZ8bssAxW9va0QxFfGk8MjGM
	zfdZJcbIKCLivjUJwlaZWSB5l5eBsz/68XEm0W70tDboIPpb+wgeM4L7C21dDCOw7PcIw5x0D3j
	s5HN7/soYeCPPfL6Ic29EX+gQPWFVpoyYS8v2f5L/W4BbYd34l/jzferhdzqzEtDvFFpLBxjBJ2
	vp2WYoonp73aXs4Viyeu+EnnIDFGJPSE4pbgJDyQ==
X-Google-Smtp-Source: AGHT+IEV6gMMBJm5adZYkFcwTB+8gUTyCh/EPkC9AAkPkwfZ2sRIeh6su94Hm9BLNCcun9Mrvx4wIg==
X-Received: by 2002:a05:6102:dcc:b0:5d6:12fc:76e1 with SMTP id ada2fe7eead31-5d7dd46cfcdmr5894631137.17.1761053816456;
        Tue, 21 Oct 2025 06:36:56 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d96c0bd369sm3536442137.1.2025.10.21.06.36.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:36:55 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-932f654eaaeso98273241.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 06:36:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVy+AMTmsTLIvxN0i1dMipro/vJJ7e96ygxI3d6KnmpoWSTGOPnHlwVOBBRhBdjJudTc8SDpz5IM9s=@vger.kernel.org
X-Received: by 2002:a05:6102:441d:b0:519:534a:6c4f with SMTP id
 ada2fe7eead31-5d7dd5ee60fmr6017748137.33.1761053815204; Tue, 21 Oct 2025
 06:36:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020143107.13974-1-ovidiu.panait.rb@renesas.com> <20251020143107.13974-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251020143107.13974-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:36:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNq-DFG4_i9CN+Rb2RSgO1Sxph7HO7SNhnr0d1=LoW0g@mail.gmail.com>
X-Gm-Features: AS18NWBYsMSpOo4y4kMiKki8g1BkhV5Ulk8TYURDjYYjSArsxY_VVDXQMAlwt_w
Message-ID: <CAMuHMdWNq-DFG4_i9CN+Rb2RSgO1Sxph7HO7SNhnr0d1=LoW0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: r9a09g057: Add clock and reset
 entries for TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: john.madieu.xa@bp.renesas.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Oct 2025 at 16:31, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the TSU0 and TSU1 blocks on the
> Renesas RZ/V2H (R9A09G057) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
