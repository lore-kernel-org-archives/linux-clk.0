Return-Path: <SRS0=y/Yu=2D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C3DC43603
	for <linux-clk@archiver.kernel.org>; Fri, 13 Dec 2019 03:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70642227BF
	for <linux-clk@archiver.kernel.org>; Fri, 13 Dec 2019 03:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576206052;
	bh=jE+LTMyoJh2M2a4nIMPu40B/WipswxFrLQnWV9tHD3Y=;
	h=In-Reply-To:References:Subject:To:From:Cc:Date:List-ID:From;
	b=Dx1dH/qrVJSCCEifRwLxhipQdGmRz/MrhpkRGNSQSxbWpbdqvsmsA1GTZXlX3V3sM
	 rK93nr1Exbf0PHZ+/AxSSXWVEdhWviv29czKZDEkuK45R8W8fSKlS2uWZjfgarlIsV
	 lKtojwq5plUjrCl+k7CmqeZC07G1Y5ho0lIkDTJU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731864AbfLMDAw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Dec 2019 22:00:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:40730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731496AbfLMDAv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 12 Dec 2019 22:00:51 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AD292253D;
        Fri, 13 Dec 2019 03:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576206051;
        bh=jE+LTMyoJh2M2a4nIMPu40B/WipswxFrLQnWV9tHD3Y=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=ImnwF3Xgr5UP21cuKpCbNWSth6vJ1jt85UsYSC84YPi3M2dOGGBPFkiNgGWfb1Lp0
         eNVXfbXMwbC6Owthq+AgCKyxz5aHdnDTH7qwJPedGrDdPzMJ3fnweT/Q1JhPaGh3MV
         +Tj5ATUg4MgFZiQepKqeGLWEllmE4neXFhyknSzs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191212125447.GL15858@dragon>
References: <20191212125447.GL15858@dragon>
Subject: Re: [GIT PULL] i.MX clock fixes for 5.5
To:     Shawn Guo <shawnguo@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 19:00:50 -0800
Message-Id: <20191213030051.7AD292253D@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-12-12 04:54:48)
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/i=
mx-clk-fixes-5.5
>=20
> for you to fetch changes up to c3a5fd15ed0c1494435e4e35fbee734ae46b5073:
>=20
>   clk: imx: pll14xx: fix clk_pll14xx_wait_lock (2019-12-11 15:07:06 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.

