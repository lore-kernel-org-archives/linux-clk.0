Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197A7C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 09:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2930619A9
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 09:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCYJWf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:22:35 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:43756 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhCYJWI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 05:22:08 -0400
X-Greylist: delayed 81951 seconds by postgrey-1.27 at vger.kernel.org; Thu, 25 Mar 2021 05:22:08 EDT
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F5fkj66P8z1tqJX;
        Thu, 25 Mar 2021 10:22:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F5fkj546jz1qrxt;
        Thu, 25 Mar 2021 10:22:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id eAQlNd3avmLQ; Thu, 25 Mar 2021 10:22:04 +0100 (CET)
X-Auth-Info: fkWzb57UUyETy92DAG3nhUHu+EMyv1a6iUeWcZrZ7mcxGgnZ+5ev3xxE5CFwkQ3V
Received: from igel.home (ppp-46-244-184-22.dynamic.mnet-online.de [46.244.184.22])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 25 Mar 2021 10:22:04 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 042FD2C324E; Thu, 25 Mar 2021 10:22:03 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
References: <20201209094916.17383-1-zong.li@sifive.com>
        <87v99qyjaz.fsf@igel.home>
        <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
        <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
        <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
        <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
X-Yow:  I'm in LOVE with DON KNOTTS!!
Date:   Thu, 25 Mar 2021 10:22:03 +0100
In-Reply-To: <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
        (Zong Li's message of "Thu, 25 Mar 2021 11:21:35 +0800")
Message-ID: <87a6qrk2pw.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mär 25 2021, Zong Li wrote:

> take a look at this again. Could you also let me know which bootloader
> you used (FSBL or U-boot-SPL)? Thanks.

U-Boot SPL

Please try this image:

http://download.opensuse.org/ports/riscv/tumbleweed/images/openSUSE-Tumbleweed-RISC-V-JeOS-hifiveunleashed.riscv64.raw.xz

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
