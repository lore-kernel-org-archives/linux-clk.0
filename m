Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91225DB12
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540175; cv=none; b=jya5oANcBghuDPhz2lML73hHMmbyWg35qmdAyGGG67Emu/S93rCkDk3gxvQObPDy91QlTRt4Ag7+F3ulmU2dmbtnwAkn+/pPMauJa/0T4N8ffzl5mYt+o82ImlStiZV87Yz8oVKUSEY/3YfroWloZIG18hv4kgzRcT568jVp0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540175; c=relaxed/simple;
	bh=R+J7A/D/BT85jecefZhkauMnlhpiEuEVanyMh9GP9MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W0YyMiCBNiWvvnMHxfc2SeUDWP0DJrMBEQLkK7FWuWDVc1/OLP15j8NhTiNSbCe6qjW+sS53e/ce9abWY+e/kQpxm1rXdW5jIvMGYRT5i/gh4Ik6kG75oLtgP8xd2c1M8/q/CgtRs4zWhgPmdVUV1mLMAxajUX6WBaewdBRhqjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-54aa5f70513so297520e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540172; x=1759144972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeKLvvwALsTHiuzXo30Jgo5xAk/wTxebBE1AyiMQQmw=;
        b=sTed3eILeU015G9vKuof6GnrVG7OQDpTtm1kp8XhWjlfp2LwnhYvGveF7kZRZVh77v
         DofAVIvZijNZFlzdNpKdqA9cgyauZvtFhij60wQblXSqnTdkcAQDgsN4rw23PBVqSyUf
         7YTHZkI9AixuzjDZzDl+muSDMZjBiQxNwTE/keAQGnnkJgIrgtj5sn8Gy8mjt94QpAoK
         RPnaTSppAiMBrK0ZoM1YLyPawQzK3oxbMWmxl9i9XbGzs+uerEuO9xkyWJL/3Y2Dl1jA
         eBqF0EwJIg0vhZjaS5SJjFhRUnF8yjMefCa0BRgFrnS/EywFLtORTAK/NED/DOjHE9Jk
         cozw==
X-Forwarded-Encrypted: i=1; AJvYcCW2qH9fxe20RKUWSVwpvYEaeFeK4Qb+ZWQ5yp5R1CdF8t6BK2TxKTpGM3JsDFcohMxK/aLWUMhdgzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5jn4mQ7vggKxwiNaQpg6KliFSmFA9rRKQ+J+sRNUbDObxFUf3
	PCfEpwr6yzmNKXXjm828iS0ThrVRZsiWoxgTSgkHJAavtV1L63TYTfpD9NFFJcHY
X-Gm-Gg: ASbGncuwYmOSdOOSsrhabTyzSFz5k++9lk12XNFEFhLwzilfz75MHNBCgXH9/w/EvyR
	GJUEyn9DbuOxlQg5P+XBSkLXHFThirHC7PRjdlrlIugYjbhaXQGv6mFGZqnUBKf19XGV6YBBHor
	7+hjT43IaNrhnm0kom0r3Dma9CaIloCxjpDgli/4vuio5ErZ+92qU/W8CxmtzTkG9tfNgl3Lcrm
	4T2vFmHXL9ZqQ/NN1YWSDpVma8uhKe7/XUoWfHeAMZS7WVF5z6qTnca2WRwgWKbUEyZZL/2QV3x
	mwOOEdHAe4X9Fcl0IiJqSdBIZSCi0yjFUQmvbCCIVwIcGhacIWhKoy5N/Kuz+aqrDb/AqpIO52l
	4r2HfGfhn2XvOUKq2R6huMMSo/bgDeI2SWWEZmBONM5wUHh72GMwAIgVXfwES
X-Google-Smtp-Source: AGHT+IGme3IoEFKqxtYiPd9Hw2uH1gEYXh+Ew0sp4UpW+zQ15xtWAibOzoIvEtyy1L6uucKmd8Tsgw==
X-Received: by 2002:a05:6122:2001:b0:54a:a251:ad57 with SMTP id 71dfb90a1353d-54aa251e6d8mr990335e0c.16.1758540172395;
        Mon, 22 Sep 2025 04:22:52 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bbc96ccacsm370695e0c.3.2025.09.22.04.22.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:22:52 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5997f407c85so635191137.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 04:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6ax0h6ofqRkC2yHCzYN9nenaMw/kE1ecdXD+1cvVegfL4N7zSHnN32r6zbv6O/JdJPWASt3DCDJk=@vger.kernel.org
X-Received: by 2002:a05:6102:44d6:20b0:58c:aceb:1e3a with SMTP id
 ada2fe7eead31-58cacfa662bmr2899131137.11.1758540171927; Mon, 22 Sep 2025
 04:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
In-Reply-To: <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:22:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
X-Gm-Features: AS18NWCcJxRGFKqDDP8RObyysXU-qowur5BL23YHV7cqfVEWdGx3y3-RI54QevU
Message-ID: <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 19 Sept 2025 at 01:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> Thank you for sharing this, but it seems this is not the case for R-Car
> Gen4. I found out that V4H and V4M has additional "synchronized" and
> "asynchronized" reset types according to SRCRn_FSRCHRKRAn attachment to
> the V4H RM. The PCIe resets are "asynchronized". This extra readl()
> added in this patch is turning all the resets into "synchronized" and
> therefore makes them behave as expected.

Interesting...

So e.g. MSIOF has synchronized resets, while I2C has not, although
both are connected to the peripheral AXI bus...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
