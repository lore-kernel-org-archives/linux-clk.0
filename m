Return-Path: <SRS0=O5DU=NX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8EAC43441
	for <linux-clk@archiver.kernel.org>; Mon, 12 Nov 2018 15:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 284FA20815
	for <linux-clk@archiver.kernel.org>; Mon, 12 Nov 2018 15:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284FA20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbeKMBX2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Nov 2018 20:23:28 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43952 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbeKMBX2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Nov 2018 20:23:28 -0500
Received: by mail-ua1-f67.google.com with SMTP id z11so3159351uaa.10;
        Mon, 12 Nov 2018 07:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Ul/x+mXGZcEj2EUPBhYnoJKnTGRIjuS4mR9rEEUayU=;
        b=K9owIbzGHhKfAv646UkWngwrJYW/F2uMgkpE77/5ZxoLVTKfCMdbu7sy40T9cwFs93
         1WnXHlpVdzQmWpaQ9DQxLKDMbX2zRL1Vnbnywbbyb5pO3NOfrfGdIP8Jc9klOvcKsLSf
         wAx30zMb/4Ag4KmA60YbFdza6qTq+vipVa2l5NOFGHXdeU3k3myFGlqjgh4rpYcHGAQN
         AEwWqM3OclM7fXorXLm47nENS8p///nK6XwJgSciIVmjtcUsIH50DJuZxWqACewnTM1Z
         Ti3G+qs2gFsrj9HgSGjONkBOfObBMXm9JRBdyrlxvgV8zxx1AOQU36BbceDFPCBpAW+O
         1bIw==
X-Gm-Message-State: AGRZ1gJPP3QIhQSYJgaSgzwvJAsYwE9mzR+AAnCLxmn0tuhsMgUFHueL
        Kq26xBQz6nnkCIOVUae4LKNux+C5SXxF4gBCptmpJxx6
X-Google-Smtp-Source: AJdET5eyY6BC3n0F0HfEd29NIfP4mvDHdddJMde0Z6gahPVTmyeTTx8lZVu/oFVLrzPWg7URBqVQ9q7hjjak4BaswQ0=
X-Received: by 2002:ab0:1393:: with SMTP id m19mr587359uae.75.1542036584318;
 Mon, 12 Nov 2018 07:29:44 -0800 (PST)
MIME-Version: 1.0
References: <20181107173558.54481-1-chris.brandt@renesas.com> <20181107173558.54481-2-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Nov 2018 16:29:32 +0100
Message-ID: <CAMuHMdV5=meKvX_D6YSPNdjc1++QFxKRXCVLDxT-VJSBWnGD+w@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r7s9210: Add USB clocks
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 7, 2018 at 6:37 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add USB clocks for RZ/A2
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
