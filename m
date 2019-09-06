Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F133C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06337214DE
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567790877;
	bh=aLRmPl43ZbLFE5HkFDGotmTtNfpnGumo9iTQkZUEWHA=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=fYmMqIJO5XBcKavpvkohrzsnx2xrJg8TXHc2+nFMMgOOuakdj9tlFK+k1qWl7fqFR
	 Q/DkzRaxbk4MSfnWewzALfe5ub+VYRC4cD8Zt7dRBxavinMrz1rl1QFvfzL+5gJG4F
	 GTfP0qh+dK2DY4POqvmGThic3bvEATNHwdlBBSEY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388626AbfIFR14 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:27:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731974AbfIFR14 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:27:56 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0146020838;
        Fri,  6 Sep 2019 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567790876;
        bh=aLRmPl43ZbLFE5HkFDGotmTtNfpnGumo9iTQkZUEWHA=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=NXeAVOXDmbDAR6b8gVPBLnnahqfeZNg6ihO6nSKugJCoA53yiqFcfp+s+i98IaPGi
         FQuPIhtsTzbFZDerXuHHCUXk/+NUCuy+VNGEpNE59Ms9FXLGFAECSNE2elu0DUAkwG
         geVPM/by/joxsfKwQGQgNW8B+DkbdVN48mt/wzSI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190813085714.8079-1-nishkadg.linux@gmail.com>
References: <20190813085714.8079-1-nishkadg.linux@gmail.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, vireshk@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] clk: spear: Make structure i2s_sclk_masks constant
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:27:55 -0700
Message-Id: <20190906172756.0146020838@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Nishka Dasgupta (2019-08-13 01:57:14)
> Static structure i2s_sclk_masks, having type aux_clk_masks, is only used
> when it is passed as the sixth argument to function clk_register_aux().
> However, clk_register_aux() is defined with its sixth argument as const.
> Hence i2s_sclk_masks is not modified by clk_register_aux, which is also
> the only usage of the former. Therefore make i2s_sclk_masks constant as
> it is never modified.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Applied to clk-next

