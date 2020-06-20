Return-Path: <SRS0=kEw8=AB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BBEC433E0
	for <linux-clk@archiver.kernel.org>; Sat, 20 Jun 2020 00:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42526221EC
	for <linux-clk@archiver.kernel.org>; Sat, 20 Jun 2020 00:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592611222;
	bh=619+Wt+vDRk64Ku14T9Siv1alCzBunMBcYsA7lo5HXw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:List-ID:From;
	b=guZF/oAbD+qy3byZ14iDxtTdvrS3unTEqpp5tby5khtCEHYgamXhRixqDW3ga3we1
	 fwlCeC9p4RWs+8A+X1gcNt5kbFZuGiJV2Yf/r/e+spgi88AW+0VH/EkT6W1qHGzOE3
	 /v3qVdnN3XAtLCNcvlp1Ur8hx/GCNAX1YenNo8HE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgFTAAV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Jun 2020 20:00:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:34916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728949AbgFTAAV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jun 2020 20:00:21 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17F93206D7;
        Sat, 20 Jun 2020 00:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592611220;
        bh=619+Wt+vDRk64Ku14T9Siv1alCzBunMBcYsA7lo5HXw=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=Fco8Iq1m3csA/NlUxjibipKJo/3I2id/mpiACADkRzt5vBSL9HsnYpJk/7/aqE5Q6
         /i4HgLF26WQn/5K0rPygvQ3JBAXT/MZFNL5z0YsA1c44BbAQo7B3P8Cx/RnGkyOB5i
         7IQEGOd6mjCIDlPWHE0UJ7eP2031Hv6NbUvDypIQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200610140858.207329-1-noltari@gmail.com>
References: <20200609113049.4035426-1-noltari@gmail.com> <20200610140858.207329-1-noltari@gmail.com>
Subject: Re: [PATCH v2 0/2] clk: bcm63xx-gate: add BCM6318 support
From:   Stephen Boyd <sboyd@kernel.org>
To:     noltari@gmail.com
Cc:     bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        f.fainelli@gmail.com, f4bug@amsat.org, jonas.gorski@gmail.com,
        julia.lawall@lip6.fr, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkp@intel.com, mturquette@baylibre.com, robh+dt@kernel.org
Date:   Fri, 19 Jun 2020 17:00:19 -0700
Message-ID: <159261121936.62212.219486512557338832@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Add support for the gated clock controllers found on the BCM6318.
>=20
> =C3=81lvaro Fern=C3=A1ndez Rojas (2):
>   dt-bindings: clock: bcm63xx: add 6318 gated clock bindings
>   clk: bcm63xx-gate: add BCM6318 support
>=20
>  .../bindings/clock/brcm,bcm63xx-clocks.txt    |  2 +
>  drivers/clk/bcm/clk-bcm63xx-gate.c            | 44 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>=20

Sorry please don't send these in reply to the original patch series. I
have a hard time finding new patch series in my 'thread summary' view.
