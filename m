Return-Path: <SRS0=/mgL=SV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F1CC282DF
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:08:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB67C217F9
	for <linux-clk@archiver.kernel.org>; Fri, 19 Apr 2019 20:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555704537;
	bh=0YyHVu4Lu0tqvQMfGyIttHTGuTquYwrv7wHPvujtUlU=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=JUiBymtUm7tahhQZRcutyUQSFFwa6lzFkeIJcVguIOhjJGINZIdksADxXEZP98rVf
	 aKIDZDBnz372toKj21scREa6KczlPAfuR4CT6PhyOtvSimMX5S/eAfRAnazCJKFgNF
	 xP7YqrSTtTHTSvbmugnPk82slVr6pWrTdopHjszI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfDSUI5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Apr 2019 16:08:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:35212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727205AbfDSUI5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Apr 2019 16:08:57 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 773412171F;
        Fri, 19 Apr 2019 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555704536;
        bh=0YyHVu4Lu0tqvQMfGyIttHTGuTquYwrv7wHPvujtUlU=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=mq933jxcCtjK8Ptzb061grgMsL5+kakuJHMg4EEz1jvJldpcRY3cjAeL4IlhJIRSn
         1OpED1W6Uw30lMWQwqAhGrMrpNVxG1bwhpdRHlgEwwwWXRCyNZvG1StHyAI8eoJP5Q
         JTmrCLt9YlEZ3IL6eXrMcq/5/YfDMW6IxTpSUrZ0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190419111927.j3ggz2oke6msty5g@flea>
References: <20190419111927.j3ggz2oke6msty5g@flea>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] Allwinner clock fixes for 5.1
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Message-ID: <155570453560.15276.11373060420462021008@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Fri, 19 Apr 2019 13:08:55 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-04-19 04:19:27)
> Hi Mike, Stephen,
>=20
> Please pull the following fixes for the current release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa23=
1b:
>=20
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/cl=
k-fixes-for-5.1
>=20
> for you to fetch changes up to 1054e4dd1cbbb7bf5cc836832648f9972134ef67:
>=20
>   clk: sunxi-ng: nkmp: Explain why zero width check is needed (2019-04-04=
 09:32:32 +0200)

Thanks. Pulled into clk-next. Maybe we can improve GENMASK macro to make
a compilation error when the input is 0 or negative?

