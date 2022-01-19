Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33293C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jan 2022 17:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356446AbiASRdt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jan 2022 12:33:49 -0500
Received: from eu-shark1.inbox.eu ([195.216.236.81]:48972 "EHLO
        eu-shark1.inbox.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356457AbiASRdt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jan 2022 12:33:49 -0500
X-Greylist: delayed 531 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jan 2022 12:33:49 EST
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
        by eu-shark1-out.inbox.eu (Postfix) with ESMTP id 406A66C0074E;
        Wed, 19 Jan 2022 19:24:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
        t=1642613096; bh=2ocrVwEK3JEDTeF+8QmkZiiLdEIYKrfKfVhvZh/P5Bc=;
        h=Date:From:To:Subject:Message-ID:Content-Type:X-ESPOL:from:date;
        b=iG9Mrn8jaNLyYkkloMjcgyRooNJHUfzwGUFruqm1KK9GrPLhq1DuM4mSAN5dDEm19
         /A6ImwfYycZHU9+r7F6O+XYj47+/aBmZDylNE5F+dXj9qIyPB3TzNdtdwR59qrDyDC
         tg56gvrYKSpAI1xZj5DYPDppRJStIIZ0ZWwH8FYQ=
Received: from localhost (localhost [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 3298A6C0074B;
        Wed, 19 Jan 2022 19:24:56 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
        by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
        with ESMTP id G1qKrkS23hMb; Wed, 19 Jan 2022 19:24:55 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
        by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 752616C0074A;
        Wed, 19 Jan 2022 19:24:55 +0200 (EET)
Date:   Wed, 19 Jan 2022 20:24:49 +0300
From:   Boris Lysov <arzamas-16@mail.ee>
To:     linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Looking for help with mt6577 clock driver
Message-ID: <20220119202449.02a8b421@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: OK
X-ESPOL: 885ml41QGzuilFygRWXfBgUrzVlEXvGWher6j11F/g/3MCuNeEoFVBSznnAFPnHC3iM=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello!

I'm developing a mainline kernel for mt6577 which is a dual-core Cortex-A9
SoC for smartphones/tablets.

I'm stuck at the clock driver which looks hard to implement for such an old
platform using mainline codebase from Mediatek. I do see common patterns li=
ke
using various subsystems for clock management (apmixed, pericfg, mmsys) but
what I'm failing to understand is how are clocks related to each other (for
example muxed ones) and what exactly drives each clock.=20

Analyzing Mediatek downstream kernel code [1][2] didn't help me much becaus=
e it
works in a "write some magic values to fire everything up because why not?"=
 [3]
way. Right now my approaches are dumping and analyzing hardware registers w=
hile
the device runs downstream kernel [4], and just a plain guesswork which I
think is rather unreliable.=20

=46rom =C2=A73.3 of [5] I understand that LKML is not a helpdesk but I still =
would
like to ask for any tips regarding writing a good clock driver, especially =
how
to determine how are clocks related to each other. Can someone from Mediatek
explain the PLL/clock/mux subsystem on mt6577 please?

Thanks.

[1] ALPS.JB.MP.V1.19_MBK77_TB_JB source code package (kernel v3.4.x)
[2] https://www.acer.com/ac/en/US/content/support-product/4817?b=3D1 in the
"Documents (2)" section.=20
[3] mediatek/platform/mt6577/kernel/core/mt_clock_manager.c from [1] or [2]
[4]
https://github.com/arzam16/mt6577_kernel_Acer_B1_A71/commit/5a447eceda71723=
715af9cc215a67241efc83b3d
[5] http://vger.kernel.org/lkml/
