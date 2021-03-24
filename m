Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D42DC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 10:37:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B812619FB
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 10:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233676AbhCXKgv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 06:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbhCXKgU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 06:36:20 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C56C061763;
        Wed, 24 Mar 2021 03:36:20 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F54Qk6Ntjz1s9R5;
        Wed, 24 Mar 2021 11:36:14 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F54Qk4zn7z1qsjk;
        Wed, 24 Mar 2021 11:36:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id SqtMt3mJbtmw; Wed, 24 Mar 2021 11:36:13 +0100 (CET)
X-Auth-Info: olVaPxE3Iz+q50j6MfKSb11oZHIp3MyPaMLQ4Rr+sMkFhhkkUaAnHCx5VE8VTEsd
Received: from igel.home (ppp-46-244-174-113.dynamic.mnet-online.de [46.244.174.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 24 Mar 2021 11:36:13 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id 4C29D2C3716; Wed, 24 Mar 2021 11:36:13 +0100 (CET)
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
        <87lfaj7cki.fsf@igel.home>
X-Yow:  I just forgot my whole philosophy of life!!!
Date:   Wed, 24 Mar 2021 11:36:13 +0100
In-Reply-To: <87lfaj7cki.fsf@igel.home> (Andreas Schwab's message of "Fri, 19
        Mar 2021 09:49:33 +0100")
Message-ID: <871rc4on36.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Were you able to reproduce the problem?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
