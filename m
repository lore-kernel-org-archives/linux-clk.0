Return-Path: <SRS0=KID9=QW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E1DC43381
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 23:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74E462085A
	for <linux-clk@archiver.kernel.org>; Fri, 15 Feb 2019 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550275159;
	bh=0f65xSjh/o4jnk7SshkR45mM0SLydxgV75Q71pDb/QU=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=PJONnSwXAYeZhd4r/7Bfl51meLJIbZd40IhImgy0d+jlDYvr87d2eAKScZZ5CE/Co
	 9DncuupxRWokdk68DjelibWD3V86qhsz5eeVkNpx6pAq2pdDm/FEButTJtW1wOfGTd
	 dftPk9lRUpYdbpDm+wzi0m0rRsdUEwd+ZUX1/N90=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389765AbfBOX7T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Feb 2019 18:59:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:58576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387546AbfBOX7S (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Feb 2019 18:59:18 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 466BD20842;
        Fri, 15 Feb 2019 23:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550275158;
        bh=0f65xSjh/o4jnk7SshkR45mM0SLydxgV75Q71pDb/QU=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=saNH1fyWJPA169Bg41My8rvnGOiWJ0dsj45/Wr6NhwoM3Qge+c46CcVddZY/NIUMY
         NtiGuKd+J+dteTeo7UwtqgHuv5pZmOzeFXm+0o03kpcmAqPjVvWWhA04L0VSj4E0Y/
         kRlIw7XPYM3iSqWiA/skHA0LTxIPkx1eZ4BOa8UM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
In-Reply-To: <20190208104230.zn4sn7z4idge4gmh@flea>
User-Agent: alot/0.8
Subject: Re: [GIT PULL] Allwinner clock changes for 5.1
Message-ID: <155027515755.115909.2383410991418569831@swboyd.mtv.corp.google.com>
References: <20190208104230.zn4sn7z4idge4gmh@flea>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Fri, 15 Feb 2019 15:59:17 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-02-08 02:42:30)
> Hi Mike, Stephen,
>=20
> Please pull the following PR for the next merge window.
>=20

Thanks. Pulled.
