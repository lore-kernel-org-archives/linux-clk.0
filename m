Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415B1C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 11:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjCALNJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 06:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCALNI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 06:13:08 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B3F17CD9;
        Wed,  1 Mar 2023 03:13:06 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4CF86240016;
        Wed,  1 Mar 2023 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677669185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sJZEoYqQLRPD+xLjYPKC6oXqTgjLrKQArh3n1niOSu0=;
        b=ARaycLaNQg8uRmLugwUn5Oi6H1ZhgtNCM2NH9WlquNnhadWbHY+2+KgG05QzTtAqimqDAW
        O4cuQjL6BSHWT6bxA+kYub/DnTJSy7y/Dlq/IH3a24nubxFFM2J8TzTLsa4VzrARcOeojH
        1HeTObL4Qkj7+2mYNzp7/ZkipPK5NlsZ2rTcPG3Nm2W0+J6GhEbMwxqxyZnnXMZPQbMcC/
        nr4cl2mf+kPsp4mzRDIfzW9mjnxvgbgnU6yFwXuKlZjvrgXcfsH1kGxds8pXwLKAM4ol7k
        mfoDOExG7f7ggVCmPD6QxMIOlnt2Osw3sYfE+Eih28/yhIgfk1yVJ7V4jIw3UQ==
Date:   Wed, 1 Mar 2023 12:13:03 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 2/4] clk: renesas: r9a06g032: drop unused fields
Message-ID: <20230301121303.0e79bb83@xps-13>
In-Reply-To: <20230227183937.377612-3-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
        <20230227183937.377612-3-ralph.siemsen@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ralph,

ralph.siemsen@linaro.org wrote on Mon, 27 Feb 2023 13:39:34 -0500:

> Drop three unused fields from the clock descriptor structure, and update
> the macros for filling such structures accordingly.
>=20
> The values for such fields are kept in the source code, now unused, in
> case they are needed later.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
