Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6367DC4708E
	for <linux-clk@archiver.kernel.org>; Thu,  8 Dec 2022 02:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiLHCab (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Dec 2022 21:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLHCa3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Dec 2022 21:30:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F34E248C5
        for <linux-clk@vger.kernel.org>; Wed,  7 Dec 2022 18:30:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A239061D22
        for <linux-clk@vger.kernel.org>; Thu,  8 Dec 2022 02:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DE3C433C1;
        Thu,  8 Dec 2022 02:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670466628;
        bh=3xQ0lkn2+YV2QyUx7lye6MGaPWjdYXHpG7k1lU1CvWc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Sf7h9PUAhj+QBBJSvPyCR3yEpds5inZHWn9o2d0mbLIBx9Bj3iywHlfhSyf11y1MT
         r5LPnzhmYug7fUayKVjlugfRuOA1JBL3AhqpULjiOuTcPmU9/IF3q/nB+zE9hQcTu2
         822hUdZmF3J8M5zonPeCLnnpDdmgnU8RTttTMWQtlWD6sEjoA0iDfQF9fnh7bCroZQ
         Mgt9WUNX/CxlRuk/iv41H5wrR80A4Wv86Ja1klrc0wVK3kBP0lys30T1l8CdpkSm6T
         dzQsmULOQ/clcOuoTN48TI+FSyoKqmAI3Je4A6MG5/nxOF5d3KTadDHPT9cAWAK052
         W+TfZBEsTqaLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221125093433.382072-1-claudiu.beznea@microchip.com>
References: <20221125093433.382072-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] Microchip clock fixes for 6.1 #2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        conor.dooley@microchip.com, linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com
Date:   Wed, 07 Dec 2022 18:30:25 -0800
User-Agent: alot/0.10
Message-Id: <20221208023028.00DE3C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2022-11-25 01:34:33)
> Hi, Stephen,
>=20
> I've added one more fix for Polarfire clocks. Please pull in case it
> is not too late.

It's too late. Pulled into clk-next.
