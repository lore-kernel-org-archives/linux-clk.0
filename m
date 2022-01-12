Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1391C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jan 2022 20:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357677AbiALUlD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jan 2022 15:41:03 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:54444 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357682AbiALUk6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jan 2022 15:40:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74E8A6173F;
        Wed, 12 Jan 2022 20:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF098C36AE9;
        Wed, 12 Jan 2022 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642020055;
        bh=5kA6B5XXa0Vtj9s858sVvMwlFnSTWQ7WiPBnw4ZOkf0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rzK2cMIlhCNsnf9awyfyBOuoDzUzJbm4kaB8bm4femolKF+3CzukgrIQAVnMJ5xYf
         46JLdSLR7ErX80r0T3HGbutaQwwkfq4oXgCydPI8XrKczTkJzKlCcx1Zv7RMDfm/oc
         aTZ1W+L3OnCOV02KJ7wy4WhiKK7lp1ffocUeFNKx49jf7J6uVRdZyOtC21A5Y5JFVK
         EAEtZAzxDBRJfuQ+eHZokJNHADrypGHD1OSrEKLIuvSDRQ3HPO3sPXfhAWXGgQxI3F
         JDJITKtT9xm7EnTT7mGfs3tcfTiB7WxRoVcj0U/Tdb+4YgSkDSaYJFBAEp+gyZzmwS
         fX4BTrmtKaW2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKfKVtGGsw10RAzowZdGmuu-5ABsnfOWhR-Sxnoymc4QiqvCPA@mail.gmail.com>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com> <CAKfKVtGGsw10RAzowZdGmuu-5ABsnfOWhR-Sxnoymc4QiqvCPA@mail.gmail.com>
Subject: Re: [PATCH v13 0/5] clk: clocking-wizard: Driver updates
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, linux-staging@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        git@xilinx.com, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Date:   Wed, 12 Jan 2022 12:40:53 -0800
User-Agent: alot/0.9.1
Message-Id: <20220112204055.CF098C36AE9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-11-14 21:31:10)
> Hi ,
> Could this patch series be merged if there are not further comments.

I'll merge it after the merge window closes. One comment on the
location. Also, the subject would be better as "move out of staging" and
ideally an Ack from Greg on that patch.
