Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458CCC4332B
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:25:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F280464E84
	for <linux-clk@archiver.kernel.org>; Wed,  3 Mar 2021 04:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352806AbhCCEPy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Mar 2021 23:15:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:59428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2360942AbhCBXIU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Mar 2021 18:08:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EE5B64F2C;
        Tue,  2 Mar 2021 23:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614726451;
        bh=BERs5+nWLGWtZeXXlST+aHvroH1cPR1tvq5CIw51nMc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FpD/UYXOk3L757YtN8QFSyP0tmpYOo5ufZWcaq68JAdpw/SvbrlFQzEO6kThj/DjG
         qknGKR5xbqjO6G7zfoEreHhtYqNqRgcX/MHlTBXY9hdgD9c5CiP/kFAB2KUDOQ33XR
         dnRPMLxc7E9pBjgV5ZAESRb/+aPjLDqZ2f8qpzqqy5U/fbRCcvFstRc/4wpSUYUds6
         SjYowLp+JQEOtEx+ak3c2gM89HfX3Utl2nNgVjUNlGMpe5hGRQhpyZLaxjhu50sFTu
         tovFMwh9tZXieXJDV0RyhoFjtDlrSrodSVOG396vveEnvv545OvIJ62vzxIFVY8JLN
         xacf5hTH8aEQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAKfKVtH1rSc4d8MMZCegMNG8shNxgXfu6qTd9WxuaGGFMEJ6CA@mail.gmail.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com> <20210218092804.6c78c99c@xps13> <161369785558.1254594.14662342386099652001@swboyd.mtv.corp.google.com> <CAKfKVtH1rSc4d8MMZCegMNG8shNxgXfu6qTd9WxuaGGFMEJ6CA@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] dt-bindings: add documentation of xilinx clocking wizard
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Tue, 02 Mar 2021 15:07:29 -0800
Message-ID: <161472644984.1478170.5535993198933302108@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2021-02-24 06:10:08)
> On Fri, Feb 19, 2021 at 6:54 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > > > +
> > > > +  xlnx,speed-grade:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    enum: [1, 2, 3]
> > > > +    description:
> > > > +      Speed grade of the device.
> > >
> > > A bit of explanation of what this describes would be welcome.
> > >
> > > Don't forget that binding are not tied to any driver implementation,
> > > these are supposed to be hardware description properties.
> >
> > Would opp tables work for this?
> This is the parameter is for speed of the fabric.

Ok. Yes or no? Is it configuring the speed of the fabric? Sounds like
assigned-clock-rates or assigned-interconnect-bandwidth or something
like that.
