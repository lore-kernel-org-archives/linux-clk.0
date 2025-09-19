Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062252E7162
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758270225; cv=none; b=jfmMJzNKPQMjCOR/dnx6R3RswbhvTNvtjevk/VBaUA6kIPZkNnN+cQXsGBaS2kLMNFCH9J5398L0wLHfZT5ACkRDLTlxOCtFDjYqN9K6o8u7Nw4PDVvpQLTwt/kwckAa0c8bruaoKX6yPbVa6iJpELC07LOwMtLntdLdSjdwUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758270225; c=relaxed/simple;
	bh=7XGnGKvoNg5AjPkeoVXXXH/13xWfCqH89BhK/sv5qFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOqNhEAVdwjGqZlD03aY84iNbRupPz79Sznh3ybUU3ZxbmwZyYHJoyRTKYo1P5MrVJuhp8tCHAJmaI7JK7Gx2vqgfKzInfbCw9fn+6rcsAAWHSUim/Vy6LvJe9RDbfFrZNOpEnhIWuJ4NRs6z+fa+YbU4mJGB0K8oBdrbgRxXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewA8+KLc; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewA8+KLc"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so105141f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758270222; x=1758875022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2qmh1oF2ZpeQFMjFAEk6/CZB5TW11CPjyGCveazKTo=;
        b=ewA8+KLcacvWK3ptSNFFwgoD83oj3C+IcUU0UHPl7qnwGhUQMK+gWYd2XnPW5AEzXt
         XuL1WhKL8Xd1fuRi1EbY87UEZem/vrYLyLYhDdwVxRJwErLGFudLyp94P084gbY4tJkT
         Xh1mPlYdxD1JYg8+DGxv4Sy7fFOSH7EAeTq0E3Wv4pJKQd25g8oglWiPYUEjQvjVN0/+
         4laV16tQiplY6TeyoecR5RaeRQXKTFLPT13E1lVvph21RYP8cm0uMKLlQwLuoQShnm75
         hhr6PRvU0391a3rcKhcWqTKgg+INNpF7apgUoO3t8kQLTvYdTZ0QHAZeSHQCHIupo5Ul
         cnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270222; x=1758875022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2qmh1oF2ZpeQFMjFAEk6/CZB5TW11CPjyGCveazKTo=;
        b=nE7sXusKLzXpsj0WN7X0vfMeWrnlEuQb0/NDGaOnviHq0L3wrvMSYYNLqpDjW4s9cW
         jN3bmDx+swgX1dGob44yGZ29CPkje7RalNa6tMG875TTsMY4P3XWhth5UbytVbsKDD2S
         16ycVahqnQQ9Sd7Vi6MLQoB+ve+U+BPg7BZ7wWLbbF5pPHNvLhrj8AxhCIBBsNoErZdb
         0w+pjd11qLNmOR4piA/LvPfqAXCj4fc6T9/8W5blT4x+TFEmrnHdZTXUVjq6HZ97xRuV
         YOf1Tll+0rpH9Hdo07olC+QtpzRFtBbdV48s3BumvlYX+QD5Q4F6buuaK+FAzBvOevNx
         5eNQ==
X-Gm-Message-State: AOJu0YwvtN7q0JSESyt3mndL30299/Mem8PNNqVuYyxFy1ogrDftSk8O
	zcqDMYnBOI/XBzbp830Gy5NTkkPrMhX5dlkWMNhxmVulVB3UGBfzERoxhp6tSz21oae67D3Tafe
	twV056a03Wg7xzwzWiMXcZVt2YvVHnFaAfg==
X-Gm-Gg: ASbGncsSDvUexhC95p5ni41xnJvyqvG6wTGTcFCcM1GuTFd1WyYQ3BY02dQJ8SBY9Nr
	6VOZ1HnF8MYeqANNFkY96GTJoiZy8kvJ4r1vGckKc+um781B5+Fox9oSfQKRF0VC7L8/37HRc1G
	YyXoFACsqcCxZ4msvmOvfDKpdKgxxEpVornWWEjbd+XaBgRmq/TnyR428/bRTtgcBcy13/S+jNN
	RigS0tp
X-Google-Smtp-Source: AGHT+IGm5MKN1J/V9mgZ6eULjmirfe/RDwIztEONkzpPnPIt4WbNaHdqepIQ+Zy9XpUmGIPijhUZpnRR0x1x2w5OYpw=
X-Received: by 2002:a05:6000:1862:b0:3ed:a43d:e8c4 with SMTP id
 ffacd0b85a97d-3ee7ccf6148mr1392722f8f.6.1758270222293; Fri, 19 Sep 2025
 01:23:42 -0700 (PDT)
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
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 19 Sep 2025 09:23:16 +0100
X-Gm-Features: AS18NWAfcrcIXLiPjw-n2LKhXN05uaVghDk4JKPLmORvE6F8g6pzNVnIF9UcvSw
Message-ID: <CA+V-a8tK-LYxPaZu=o7Zdfb64Fijuhsfy23bi__fawzH=zCnsQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Sep 19, 2025 at 12:16=E2=80=AFAM Marek Vasut <marek.vasut@mailbox.o=
rg> wrote:
>
> On 9/18/25 5:05 PM, Lad, Prabhakar wrote:
>
> Hello Prabhakar,
>
> >>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/re=
nesas/renesas-cpg-mssr.c
> >>>> index 65dfaceea71f..7b52e8235984 100644
> >>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controlle=
r_dev *rcdev,
> >>>>
> >>>>           /* Reset module */
> >>>>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >>>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> >>> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> >>> to read the reset register `7` times and confirm [0] (as mentioned in
> >>> the HW manual). So after reading do we want to confirm the bit is
> >>> set/clear?
> >> This is interesting, I wonder if the readback is something more common
> >> to this reset controller.
> >>
> >> Why 7 times ? Is this documented in one of the HW manuals ? Are those
> >> public and can you share a link to them , with the specific chapter or
> >> page I should read about this 7 times read requirement ?
> >>
> > Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> > Module Reset Control Register Operation:
> >
> > 1. To secure processing after release from a module reset, dummy read
> > the same register at least seven times except RTC
> > and LCDC after writing to initiate release from the module reset, and
> > only then proceed with the subsequent processing.
> > For RTC, dummy read the same register at least 300 times and for LCDC,
> > at least 100 times.
> >
> > 2. When module is reset once and released again, make sure that the
> > target bit of module reset control register is set to 1 by
> > reading the register before releasing from a module reset. Then
> > release from a module reset
>
> Thank you for sharing this, but it seems this is not the case for R-Car
> Gen4. I found out that V4H and V4M has additional "synchronized" and
> "asynchronized" reset types according to SRCRn_FSRCHRKRAn attachment to
> the V4H RM. The PCIe resets are "asynchronized". This extra readl()
> added in this patch is turning all the resets into "synchronized" and
> therefore makes them behave as expected.
>
I see, thank you for sharing it.

Cheers,
Prabhakar
