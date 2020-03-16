Return-Path: <SRS0=Lb92=5B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FD1C18E5B
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 18:27:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE59B20719
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584383276;
	bh=1X0RWpWGXgWjM59m17N7HN5PeVRY8yHe1mAvSdyPZQw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=NuItrPtHPxMlYwnm1kcPLrOAMkS16pmn7F67g8hOOcIsV+xIo4xUGUbOelP6Sfpae
	 WsBVSAYY2weYLXk4n0oka2+Zeafx5OSmt/stQV+mD/XbDRF0Q/BY3PfmseGKYXMBrd
	 CvJABAgXtinv0iNGMpTwpqQfF1kwE40QYMWF8TtI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732314AbgCPS14 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Mar 2020 14:27:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:57178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731967AbgCPS14 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Mar 2020 14:27:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2067206C0;
        Mon, 16 Mar 2020 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584383275;
        bh=1X0RWpWGXgWjM59m17N7HN5PeVRY8yHe1mAvSdyPZQw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Z+RIJZkR3Lun08KSd7Q+ocCxvwpEuKWytRxk9quUXtEzieQ1U8ArGpFaJPU2u31cl
         Xw/ScsYkKv75OnKN4O0C2hoOxyE+FgCfbcVJQZAMRLU55N3900lAUM87j1B47gNC4G
         dMjUtYAQ1LuWoMiZyO/38Mfa2PQbSQY8YMKH0mYM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200316002239.GK29269@dragon>
References: <20200224121322.GI27688@dragon> <158352907905.174340.14348638942004736998@swboyd.mtv.corp.google.com> <20200316002239.GK29269@dragon>
Subject: Re: [GIT PULL] i.MX clock fixes for 5.6, round 2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Mon, 16 Mar 2020 11:27:54 -0700
Message-ID: <158438327489.88485.18004315671422121263@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-03-15 17:22:40)
> On Fri, Mar 06, 2020 at 01:11:19PM -0800, Stephen Boyd wrote:
> > Quoting Shawn Guo (2020-02-24 04:13:23)
> > > The following changes since commit 5eb40257047fb11085d582b7b9ccd0bffe=
900726:
> > >=20
> > >   clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git ta=
gs/imx-clk-fixes-5.6-2
> > >=20
> > > for you to fetch changes up to 6fb9006abe37e44afaed4f2a5fd3a247a815bb=
8d:
> > >=20
> > >   clk: imx8mp: Correct the enet_qos parent clock (2020-02-24 15:38:03=
 +0800)
> > >=20
> > > ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
