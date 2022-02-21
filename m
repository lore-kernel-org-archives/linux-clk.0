Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585F5C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 14:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377637AbiBUOYm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 09:24:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbiBUOYm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 09:24:42 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BA61EC70;
        Mon, 21 Feb 2022 06:24:18 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 6F63720010;
        Mon, 21 Feb 2022 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1645453457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YMyn0XaFhroP4AizT39Pp4+gHgYE96LeomWKdKQE/Tg=;
        b=fYUPQmGJiuUTfRALCw2Pn3asdMYOxLMbVzAQKay8a6dv7V/o/Kb+Pb72RM3830xuKgLKSK
        negigQedvYaA6Cj2yDAdzr6YzwdUMagGLt4VQZtizlFuXddkR1IrTz50+lv5TnJ0zLZxVt
        FbaKBBZYjhZOLU/C+f+7YBD1ZhYss/qQ6AGoVOv8Nkq7ttt/6V0xKri3LcvYQCe7axGmMz
        mu7tD8PtpJFqygCc805Y1uNFKFIgNDR4kNCAScGxvrh40ptYKNNB2dL9+CBGONOgZDECbT
        2FlfnRxIOXvXnO+D78vaxthM3o6rfpN9sIRkSSqELktjg9tStaI7I/vejNF1cw==
Date:   Mon, 21 Feb 2022 15:24:13 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dmaengine@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Laetitia MARIOTTINI <laetitia.mariottini@se.com>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/8] dt-bindings: dma: Introduce RZN1 DMA compatible
Message-ID: <20220221152413.4d395fea@xps13>
In-Reply-To: <1645410969.367667.2041542.nullmailer@robh.at.kernel.org>
References: <20220218181226.431098-1-miquel.raynal@bootlin.com>
        <20220218181226.431098-3-miquel.raynal@bootlin.com>
        <1645410969.367667.2041542.nullmailer@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

robh@kernel.org wrote on Sun, 20 Feb 2022 20:36:09 -0600:

> On Fri, 18 Feb 2022 19:12:20 +0100, Miquel Raynal wrote:
> > Just like for the NAND controller that is also on this SoC, let's
> > provide a SoC generic and a more specific couple of compatibles.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../devicetree/bindings/dma/snps,dma-spear1340.yaml       | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >  =20
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):

Copy-paste error. Now fixed. Soon the v2.

Thanks,
Miqu=C3=A8l
