Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64D5C4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69F212080D
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 09:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730532AbgKEJTe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 04:19:34 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:57936 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726737AbgKEJTd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 04:19:33 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CRdJK1N31z1qsjm;
        Thu,  5 Nov 2020 10:19:29 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CRdJK0GsQz1qrfj;
        Thu,  5 Nov 2020 10:19:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id sQUnT8RSgdnP; Thu,  5 Nov 2020 10:19:28 +0100 (CET)
X-Auth-Info: rkSLcMeXSjekit1Q5DvtPq8Ky/Q5iiR2fP8AGVpyZbr4x/llLl2dWCyMTSvZSG1x
Received: from igel.home (ppp-46-244-161-230.dynamic.mnet-online.de [46.244.161.230])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  5 Nov 2020 10:19:28 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 83B552C35FC; Thu,  5 Nov 2020 10:19:27 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
References: <cover.1602838910.git.zong.li@sifive.com>
        <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
        <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
        <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
X-Yow:  That's a decision that can only be made between you & SY SPERLING!!
Date:   Thu, 05 Nov 2020 10:19:27 +0100
In-Reply-To: <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
        (Zong Li's message of "Thu, 5 Nov 2020 15:22:10 +0800")
Message-ID: <87a6vw40v4.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Nov 05 2020, Zong Li wrote:

> I tried to add -M and -C option to find renames and copies, but it
> doesn't detect anything here.

-C40 finds a copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c}.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
