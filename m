Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C48FC4363D
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3F272388B
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600802651;
	bh=PJ/4iefFRuXhQeA0JC77TmOv3xq0oTelHXU57U159cI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=0P0zW+7o18XHESbRA9eDIp5EJ/9aVgM7vPXVSCY4uo/fJRv8a9mKrnvNR0drVosHe
	 S3honrlwQglAoxxAsN/D+8cC8nu2YzjhtJctCB+H4OFocT2uwgT99nb2VSslndyLmh
	 Pmo8gJCXY/KhdT4ydlpKhW62iDohKxZ4myXz78F4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVTYL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 15:24:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:34982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVTYL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:24:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EA8423787;
        Tue, 22 Sep 2020 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600802651;
        bh=PJ/4iefFRuXhQeA0JC77TmOv3xq0oTelHXU57U159cI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BlMVvSzaNynA5B3RTQ+IYAFpQGNaYLv1Fc309MiaB1bYOQvL7kFZiD7f0b6Ryaz1W
         t4wvMWtpqrQhMwNa5DVmQL4X69kaNzGnC3LppVFVkYAGEB8cLwB1LHVxrnoBlazz1n
         Wf8Sq07Fg1ac5xCZ/A5s+zMTMuLaVfuJrW+UOJAs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200922090221.GA17284@dragon>
References: <20200922090221.GA17284@dragon>
Subject: Re: [GIT PULL] i.MX clock change for 5.10
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 22 Sep 2020 12:24:09 -0700
Message-ID: <160080264981.310579.17613616967144660880@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-09-22 02:02:22)
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.10
>=20
> for you to fetch changes up to 805837740d0142c38ab94b2269ca28da3890ae68:
>=20
>   clk: imx: imx21: Remove clock driver (2020-09-22 14:09:19 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
