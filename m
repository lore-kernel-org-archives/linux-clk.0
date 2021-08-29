Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5761EC432BE
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3549D608FB
	for <linux-clk@archiver.kernel.org>; Sun, 29 Aug 2021 04:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhH2Eao (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Aug 2021 00:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhH2Ean (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 29 Aug 2021 00:30:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49107608FE;
        Sun, 29 Aug 2021 04:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630211392;
        bh=DkX9sFrlqAck352eaAFHzXnWe0PHp9urePf2BPxD1cM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rXT1vjhFw/gV2yA8KWQYSz1FlC+1+jsRiItCV/Kgn4vTbTatuOka9ozJFkZ+DsqFP
         9wsQdNdahSgl+plSAVnfoqteAqW0Eu+CkXLf9GGtz25XR02rB8dT3PySHFLy4vYA6P
         LpKOhBWBgp3GK652Yl1gkFKlFosB6L3CdbF70GquNtojjN2bDNSQ2Y838mOVcIFe5u
         yzBV9zzzmyNe6bmzCmsbqurvD8Zl3Vgn2Q9V2V9ISmXRihU4HXfCMtlWwqVvrp4DhT
         vmr6XxgVUNg1zewa5N7BfewfwWjrofXiUbfzxQ4OwZC2JmUv+pz5ZEqXl+8bMqxuDp
         8DViNB5AlKVow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210826141721.495067-1-aford173@gmail.com>
References: <20210826141721.495067-1-aford173@gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-usb2-clock-sel: Fix kernel NULL pointer dereference
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     geert+renesas@glider.be, mturquette@baylibre.com,
        Adam Ford <aford173@gmail.com>
To:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org
Date:   Sat, 28 Aug 2021 21:29:51 -0700
Message-ID: <163021139108.2676726.18239689614088630503@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Adam Ford (2021-08-26 07:17:21)
> The probe was manually passing NULL instead of dev to devm_clk_hw_registe=
r.
> This caused a Unable to handle kernel NULL pointer dereference error.
> Fix this by passing 'dev'.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
>=20
> diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/rene=
sas/rcar-usb2-clock-sel.c
> index 9fb79bd79435..684d8937965e 100644
> --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c

Applied to clk-fixes
