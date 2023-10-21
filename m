Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7954C001E0
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 16:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjJUQEI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 12:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbjJUQEH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 12:04:07 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707F71A4;
        Sat, 21 Oct 2023 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=3FGReTuXmhH3y0Fc5mTzj3aGtkA7sokBoPAvsIr0GEM=; b=1D
        eSB+WzW72SYwgSE77QCV0XXPXOrogjtuWs9Vb8MCjeyBkFMRPQHeyVbeZp0w4i0nqEECNqnZmCSDw
        nMtBu7qiGy8Qg+n7dOxWWeNLT4CHvf6zhQcIAgHh5V9TRwE+HGjt1iqoU5wkVPmqvgFDRW1s+l7er
        +vdp06j1j9m9df8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1quES5-002toP-8y; Sat, 21 Oct 2023 18:03:49 +0200
Date:   Sat, 21 Oct 2023 18:03:49 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <94ab3de4-8687-4bc9-a1eb-18a37d7944cd@lunn.ch>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
 <CANiq72kjJu=P=19kqq1+5uPpfdS=N4Ucv2okbcWFJVnvR+Hkug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kjJu=P=19kqq1+5uPpfdS=N4Ucv2okbcWFJVnvR+Hkug@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Oct 21, 2023 at 03:41:54PM +0200, Miguel Ojeda wrote:
> On Fri, Oct 20, 2023 at 8:33 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > But I think if people want to do experiments, the tool is there.
> 
> Yeah. If the Arm maintainers are OK adding it, I think we should also
> put it in (next cycle perhaps) -- the sooner we have it in-tree, the
> more testing it will hopefully get over time, and we can eventually
> ask the CIs to add a run with it if they have the resources.

As i said elsewhere, endiannes is interesting for networking.

Maybe at the netdev conference next month, how to handle endiannes can
be part of the presentation? I'm guessing, but is it part of the type
system? So long as a type is marked as 'cpu endian', little endian, or
big endian, the compiler will take care of adding the needed swaps?

    Andrew
