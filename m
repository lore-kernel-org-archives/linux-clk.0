Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0032C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 03:22:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95A320B80
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 03:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590549729;
	bh=s5AebhNv/fPiQf8H+bfjKhgpA0L+7vopYyWrgXREc6E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=Mv25Sz3FAjri9fZTR8YjHZYCx6YVgNFuyWEyIv3U2pjEhyUbgsCJJPEgGJuztKiu9
	 9fHiD7tVQRVf5XtaXBuzp2V8znzxUnxWwQgECDN8UHtvqUUzfigB/Z2RIDyCHx4Uod
	 cSY69wn/k7pmWTk+SQwVPjb2E4nFpVcA8bOLd0vs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgE0DWJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 May 2020 23:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DWI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 May 2020 23:22:08 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87E4F20899;
        Wed, 27 May 2020 03:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590549728;
        bh=s5AebhNv/fPiQf8H+bfjKhgpA0L+7vopYyWrgXREc6E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xWJ4CBd9kqaTGDZiwWSamKLHHekIrHClNJvFxkxs74v+HTuWi8LS8E+u0rGklHHKF
         myywATth3Ipr8LdP591NPlptlNJ6Lbn+Z9HrkYn7k1lEyDWVOU2tEIajw0FwApJpar
         RHvJO2qNfzoSFjbILDTY4KvZY4/KWcKAMqqIx23Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1588508289-10140-2-git-send-email-claudiu.beznea@microchip.com>
References: <1588508289-10140-1-git-send-email-claudiu.beznea@microchip.com> <1588508289-10140-2-git-send-email-claudiu.beznea@microchip.com>
Subject: Re: [PATCH 2/2] clk: at91: pmc: decrement node's refcount
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
Date:   Tue, 26 May 2020 20:22:07 -0700
Message-ID: <159054972792.88029.18036666635801379426@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2020-05-03 05:18:09)
> of_find_matching_node() increment node's refcount. Call
> of_node_put() to decrement it after it was used.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---

Applied to clk-next
