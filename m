Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBDFC10F1D
	for <linux-clk@archiver.kernel.org>; Tue, 13 Dec 2022 13:26:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbiLMN0n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235561AbiLMN0L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Dec 2022 08:26:11 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B381929B;
        Tue, 13 Dec 2022 05:26:07 -0800 (PST)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1CDCD4000D;
        Tue, 13 Dec 2022 13:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670937966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ptn99nrD4v3klaGJEwH70YOa9kqBhrT21rwC1IJ3I5M=;
        b=fC86YTmraXzpAWpYnghfIlyd9ldk0MuUxj689+lidRbhCRGV03RItgGNMSr436DsTzrfXp
        +ENWEAcaAUUozVey87aiBU89ODW1a3de/ZW+bwgHXEhsrnyUQ1zvGTDXYu0qcW2YZgbjrv
        WWG4yppYnSkjGZGEtNe7FY2ns1t6Ft6YT6j9WOYrYBefD7u+nEdA6ZU/TfOJyBVjDqYmfr
        xAPqW92Wvl0pL/h0hNPGU4YgNM7XtkZQiebpK+fuEf+wgRC96u0x4mf8WxNRLt9IcoPhSc
        g0pfTg7nCSi4fTluR05qUrz0FhpoQP+YNZQTII8vZR8VI8oBFxSv85MNj+rpHg==
Date:   Tue, 13 Dec 2022 14:26:03 +0100
From:   Herve Codina <herve.codina@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 0/9] Add the Renesas USBF controller support
Message-ID: <20221213142603.596bd90d@bootlin.com>
In-Reply-To: <CAL_JsqLjD=DbKJRrmn2GmbAwmVyE=gVcz-fZfNJ_xAup6GReSA@mail.gmail.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
        <CAL_JsqJiZU=sHVPc92nDNoqUjm7FUb=u0izGYa+irkUW1XmA_w@mail.gmail.com>
        <20221208092439.6170cf5e@bootlin.com>
        <CAL_JsqLjD=DbKJRrmn2GmbAwmVyE=gVcz-fZfNJ_xAup6GReSA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob, Geert,

On Thu, 8 Dec 2022 14:44:31 -0600
Rob Herring <robh+dt@kernel.org> wrote:

[...]
>=20
> Oh right. That's in place of course to avoid probe ordering issues...
>=20
[...]
>=20
> I agree with Geert that this shouldn't be needed.
>=20

In the v4 series, I am going to fully remove the 'depends-on'
property.

Thanks for the review.
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
