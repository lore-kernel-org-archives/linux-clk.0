Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6FDC48BE5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 21:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFD59611CE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 21:18:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFVVUx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jun 2021 17:20:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229612AbhFVVUx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jun 2021 17:20:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19A7F6108E;
        Tue, 22 Jun 2021 21:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624396717;
        bh=s4eP0sE5Qu2Xhbw+hPX36Im+b6jb+jMLn+dvkaEMNS4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jBCW61U5Cg2SK080qr8k4oKjLbQyAVeAMKeh/EamQxYNzYMygzfklRbAPl2jWhb/A
         +ijbatAKM9uuxXdirH57GnG1oefiBraXai+fbNWBjHKBLFVn/FGZ1D+uM7wU1P/tRs
         qutrGfB4vuuJjbHx6M+pdEoDDOGmudCVIEacIcwXykLTn8YBdJufsLCWfEgyon9ZDz
         laS5wfFz3XpA5ok/HBHAO85iBw/HPXKwBawNLTi8PXjafoAdgxi3uUGluREUgeCYKb
         2ky7VsRXwpNTnYX2tupACofG6eH2tpsC4okYA2CwNj6uywyrKct/4lJg+yeKQ0Kggy
         5llLl4wVhx21Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210528045743.16537-2-lokeshvutla@ti.com>
References: <20210528045743.16537-1-lokeshvutla@ti.com> <20210528045743.16537-2-lokeshvutla@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ehrpwm: Add support for AM64 specific compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        ssantosh@kernel.org, Vignesh R <vigneshr@ti.com>,
        linux-clk@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh+dt@kernel.org>, mturquette@baylibre.com
Date:   Tue, 22 Jun 2021 14:18:35 -0700
Message-ID: <162439671590.1026800.16643758786556827204@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lokesh Vutla (2021-05-27 21:57:42)
> Introduce AM64 specific compatible for epwm time-base sub-module clock.
>=20
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---

Applied to clk-next
