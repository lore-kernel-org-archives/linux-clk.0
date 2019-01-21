Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7549C2F3A0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91ECE20879
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbfAUOJI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:09:08 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:41186 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbfAUOJF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:09:05 -0500
Received: by mail-vk1-f193.google.com with SMTP id t127so4601676vke.8;
        Mon, 21 Jan 2019 06:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FobRJfOqE4NumE1TVI3eazKWORcIGzod2NnnwrOcLrY=;
        b=PQHN+2I53oNanG2iDVTeDKkAowKNtCNaY42P/lrUmZhZtLnexEdp5OT5Fk4D5aY26U
         eLvvM76HE7h3doAytSsantpDae7CcSnuERZSclAx9xgcC2hV+pPS4nNingh/L2H5c2Ky
         kGgX1+hNFwMozUs4TvU357uybZU/JMSLoPYloAdq6IJU5HGZenR7k1SiHQkzJ7hFVuR/
         yAXK1ineIECm9fPhHg2tzDWSejoIGte/xTnrMg97jdTuN+6Wjsy7U30bX/Xv4qZYfFls
         lJESyjIP/VN86W+rpYX3E8251Sw7Nl4Y0VEb1oGdt6qob/ym28ngrAZq28vGBswce06t
         U5cA==
X-Gm-Message-State: AJcUukeX1KTcMzOBMq/mV6A+ZQ+Q62+Q0qlzscpQIKPHNfbS6d1rtMLa
        LEO022x+OUcgzonju4F1pvWC8z8uDd/SLfKTp/0=
X-Google-Smtp-Source: ALg8bN5RNf9ZkoRsmjWBPGGyT6lzpG5QKJ8+o+wVSyrLST9zvyQeG8nPUQYpqC3+LkMkgiKzJG6vuPQyJjN3M2CQk1Q=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr11816467vkp.40.1548079744615;
 Mon, 21 Jan 2019 06:09:04 -0800 (PST)
MIME-Version: 1.0
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com> <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
In-Reply-To: <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 15:08:51 +0100
Message-ID: <CAMuHMdXowh8Sd7w8KOcUHZgiJwicQLsBTWOAwzOJZT2thitj5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 4, 2018 at 8:49 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Protect the CPG register read-modify-write sequence with a spinlock.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
