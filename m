Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9F314A60
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998059; cv=none; b=Pacm5qWpx+4+NyQAqI7iL6WJcW9Z65nZMBPW0AFTX5F8hSiIMQ4n/LHYdo6qQiPbaWnoDQdi7ReYScDdl9dizBBwO4KRYGawzfRJPKWS2apgqE2hWczCF1xUVGsm4ljk9NQnGej5EiSuLpTak7SKKRy81kiY/yJ1iQD4Rmyz/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998059; c=relaxed/simple;
	bh=rOS1aByy753LS5mnApvPktfoG7CiPZT4h5wnRkutiXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n9ps0IyEIllX/DBxcmLUPjGjGWnZIooOL7z4MWDALN6Tq1K0/da14ynQO9Wn91q8bM4Eb4RivQgRkdGPCm7tKkPuVEzIFCAATd6VTNRVSy5r+t8mwF1kKUqqdlUSiiwhib+XnlGLiBwm1WnQqGqAkcsv5czOJ5yBx4G3WdKuekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-93c6d160fbcso2044359241.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 07:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998056; x=1764602856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4cvDO3IT4rDSa55t0HSPzkeqi2UUzrqewWPhJHnY8=;
        b=MkfWftw/2RAeZDwkKA72NNeJvN4JYxVurA/ylbd2IngJP6SE9jiHS5YXP5qPJGQDQv
         AqCEr8xHYyhIZ15Y4CN9Hz3MmqTz3rtTO61L9faTMPjAY8175g9M+ONwnQIAgrB0pvsh
         UN070rcrKCoEtpduYmMX3hlsQ5p9D2jHrCtFxiZ+MIBTWyuD/kTXb/I95sW2BEF4y0D8
         Lf3Yj6eOvXt+OhP5E5kUas3kBdaCqq0U+0o8MYN+iCN5jlZcXcFbVie9ibnTv7NlEROi
         y8mtXAcxQi3e4NsDVZ/xE0kQw/blpnbeE30yOj8/4jbKgvGoPB5KjwsnfNudAf9x2rWY
         oQxw==
X-Forwarded-Encrypted: i=1; AJvYcCVWAbTswjbELgG6AwzR08GIMse3VH2AZDihxrdSwT0mMjkkJ+NqvlZumXALSeBCPBP1pwMQ3tkavlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeX3UpZbW2GdchECCwNRMunDqOi0vfmN+6wc4x0G4zHLMoyG3M
	6b59E7vK1KjFVzjxkrBYqsPRCzveWoskcfT/l1oYq0MJRUT0Vgd9SOlG7tGMft0Eviw=
X-Gm-Gg: ASbGncuRbzeasRKlRQ6127m0ZmzKzOFkqFN9SPemT+i6JOoIn/s7pmzXn/wLZC9kywP
	Dndb31bz85xcF73sLQanjcwccSDyXrTh7ojybXnj6SP3E/JhNP1BEW4pN7/V3P1iK3ZgFyRcY7V
	U+bZ8oaNQwNpKg6Aoq0SvwF9t8ImMAT+arzzR1bX+1idjX40KfQOaamyNFgGfj5dhpTeJuIhpHV
	F5R8zX6pfJeVVA+l+kMlNM4wFRln5mIE47u6vF+Ify6HMsI7/Ew5XTz8l4JPwHG+GG0MqUIE0uY
	yBAYVsTarFs7Ii5UcTiw9eGboqYD0A66sHYzkeVbcF5GeMJDmBTeUyFl0AmPkconBfdP806s0pQ
	cJujO5uAkyT/5d9nVax5z30R/+jmJ2gnhdaUUvghv36Pv/ia9lGOkgFCE/tg/sj2NRghIPb0rMx
	71Cof9rnN+xOBpwfM09x8auVjUcv33GKlMLkUnMO3O0BegyMv2
X-Google-Smtp-Source: AGHT+IHsKm7pH3V9VUgkfa2CFa6u3KS5I8/jtEsmZV+zNo8Dj/LNOJVMcbtYxUXd0PbfWuZIAFz5HA==
X-Received: by 2002:a05:6102:3f14:b0:5db:cc25:dd7a with SMTP id ada2fe7eead31-5e1de48274amr3927409137.28.1763998054417;
        Mon, 24 Nov 2025 07:27:34 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c561c50c6sm5546732241.1.2025.11.24.07.27.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 07:27:33 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93c6d160fbcso2044309241.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 07:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9gHGhTXWXFlzUUSi49LpgrY3BcSlBEB69AXqpeFlMsVn0WGHosvs2W/q+7jh5h+pA3eL8Z36auqY=@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:5dd:896e:7b48 with SMTP id
 ada2fe7eead31-5e1de290b39mr3496222137.14.1763998053400; Mon, 24 Nov 2025
 07:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114194529.3304361-1-chris.brandt@renesas.com>
In-Reply-To: <20251114194529.3304361-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 16:27:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmS5hi4NK1+TN1C1cyQyuJFV3K2CUnCkSw9U-JF1H8yw@mail.gmail.com>
X-Gm-Features: AWmQ_bnWEMaqDzgASqk2zI5T_pySa34CnCYdVyU_jzrAfY9eM-OMGJiM586_jxw
Message-ID: <CAMuHMdWmS5hi4NK1+TN1C1cyQyuJFV3K2CUnCkSw9U-JF1H8yw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Select correct div round macro
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hien Huynh <hien.huynh.px@renesas.com>, 
	Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 20:46, Chris Brandt <chris.brandt@renesas.com> wrote:
> Variable foutvco_rate is an unsigned long, not an unsigned long long.
>
> Cc: stable@kernel.org
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com

> Fixes: dabf72b85f29 ("clk: renesas: rzg2l: Fix FOUTPOSTDIV clk")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
