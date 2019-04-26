Return-Path: <SRS0=YBHQ=S4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416AFC43219
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 17:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0AA5F2077B
	for <linux-clk@archiver.kernel.org>; Fri, 26 Apr 2019 17:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556300295;
	bh=xrx6Hb7u+cFL3KummYd0jInHrQruQL8RZmc+hw7fb6g=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=sAJFUCyBHMpZi9yvihoAZQ/FhA8AOBdaFMaeDfkQFJ22xgihdLaaGOHR05IvRTK2I
	 9SAARgCsDuhwvVxFvpvzEJkSKv7MZ5fipfrDdkpVsORDge8Zx5W51IS8pfIqtAl2Fq
	 9tu4bJiv33WwkLBpmqpLRCYVfQxu2GiYyHoHYazU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfDZRiO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Apr 2019 13:38:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54094 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfDZRiO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Apr 2019 13:38:14 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9688A206C1;
        Fri, 26 Apr 2019 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556300293;
        bh=xrx6Hb7u+cFL3KummYd0jInHrQruQL8RZmc+hw7fb6g=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=IedxOUdlGWQ+BuXXRrcYxS7b73fV5gdBra6S/LpqAzvhelrKvQSBU0MskAb7PvDgw
         eB4/EFEGMppO5uuXePpdnnaAf/9CKsQGGjQLoZqzhZcIahLYmuVbiVCi7WqNMa+bkw
         jldrsQtqUbG+YGTyYbheGeg+HdFWHQx5OTpFe/UQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190426024858.GA7980@dragon>
References: <20190422062314.1354-1-shawnguo@kernel.org> <155620706990.15276.27062523051743240@swboyd.mtv.corp.google.com> <20190426024858.GA7980@dragon>
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL 1/3] i.MX common clock changes for 5.2
To:     Shawn Guo <shawnguo@kernel.org>
Message-ID: <155630029285.15276.1691856569509984235@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 26 Apr 2019 10:38:12 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-04-25 19:49:00)
> On Thu, Apr 25, 2019 at 08:44:29AM -0700, Stephen Boyd wrote:
> > Quoting Shawn Guo (2019-04-21 23:23:12)
> > > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69ddd=
aa231b:
> > >=20
> > >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git ta=
gs/clk-imx-5.2
> > >=20
> > > for you to fetch changes up to 48a15bb42df85d30e13281642a12fd27221668=
fa:
> > >=20
> > >   clk: imx: Remove unused imx_get_clk_hw_fixed (2019-03-26 16:49:49 +=
0800)
> > >=20
> > > ----------------------------------------------------------------
> >=20
> > Pulled into clk-next, but next time please merge your branches together
> > and send one pull request. Unless the code you're sending is for wildly
> > different imx clk drivers I expect to see one PR or one PR and a
> > followup PR later on.
>=20
> Stephen,
>=20
> Just make sure I understand your request correctly - it's good enough
> for me to use just one single branch to collect all i.MX clock patches,
> or multiple branches are better and I just need to merge them into one
> (and one PR) before sending to you?
>=20

I'd go with one branch unless you need to do something more complicated.
That's what the "wildly different" part is about above.

