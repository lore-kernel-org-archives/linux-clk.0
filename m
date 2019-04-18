Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20342C282DD
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC3182087F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 21:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555624572;
	bh=epH2LHW6BavA6UjsMY9EXAtv+uj9R4pUx0s0D/pDHo8=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=bu0HymtminSEdUTKgXPeKMvNwzpxbpGUaJm0qiRc8+BvdiZ2h3iof1w/R5RDXdrvY
	 1cC0kM92wxyQEeGcGMExAqhvJWnBu2n9QSbhCagVgV2xLaFtlWa/n5RGRzl8TJaUI6
	 CEyXS/ZVjnegTklE0RNapxXJk7VTW/1vP+Y/+Jzk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfDRV4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 17:56:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfDRV4G (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 17:56:06 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C0A320693;
        Thu, 18 Apr 2019 21:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555624565;
        bh=epH2LHW6BavA6UjsMY9EXAtv+uj9R4pUx0s0D/pDHo8=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=XJEZln7wi0dhVC1UarwDpP+1Z9XK+ojv1ELTdh71ETNdqpULIYSMKEfQCxHjDkKkk
         KVr1tWwQJpHlJZuZnrmfFHOCzeMgosUlwhN2HXQKTkPzOjlitI8M4Ygs4guy36hE76
         tdfC9hhdeNK2NTpgKvAZxEwyAGvdnVRWVQ0sJFqE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACPK8Xc5vA6M06QgXMAm9angZMdobxNOqFMNwzq30_GQNaBT9A@mail.gmail.com>
References: <1554229504-5661-1-git-send-email-eajames@linux.ibm.com> <1554229504-5661-5-git-send-email-eajames@linux.ibm.com> <CACPK8Xc5vA6M06QgXMAm9angZMdobxNOqFMNwzq30_GQNaBT9A@mail.gmail.com>
Cc:     linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, mchehab@kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/5] clk: Aspeed: Setup video engine clocking
To:     Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>
Message-ID: <155562456441.15276.6879645599643373488@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 18 Apr 2019 14:56:04 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joel Stanley (2019-04-10 19:50:16)
> On Tue, 2 Apr 2019 at 18:25, Eddie James <eajames@linux.ibm.com> wrote:
> >
> > Add eclk mux and clock divider table. Also change the video engine reset
> > to the correct clock; it was previously on the video capture but needs
> > to be on the video engine clock.
> >
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20
> Stephen, Eddie and I have worked together on this change and I am
> happy with it now.
>=20

Thanks! Applied to clk-next.

