Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8191AC43219
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 19:36:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A13F720878
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 19:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556221019;
	bh=oCzuwAezvdwaAYAyPL0LoEZ4TntSYL4uxcT9alJwd34=;
	h=In-Reply-To:References:Cc:From:Subject:To:Date:List-ID:From;
	b=EtjxKlvW6q1AHRMy2m4a1o6TAgiWqCJj93Skoa82HkxMWCQkbgS4VoyoNLfxYW2MP
	 0FZURp64WqUw4hyQ4euDMuT1ZxH27RUgiIviXWfFKojDHTm28khdh9JM354HonpgFT
	 KxezpPSoF+WBVMlTg5L303ciYREnUnMY06/rOweM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfDYTg7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 15:36:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:33512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfDYTg6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 15:36:58 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F1052077C;
        Thu, 25 Apr 2019 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556221018;
        bh=oCzuwAezvdwaAYAyPL0LoEZ4TntSYL4uxcT9alJwd34=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=lVd4pCnkAZxUbWSk4EnD2SSCazQosqIQfT3fn19+IZzo3xYnADj/KrCYqSJY5JKu1
         vJW1/7IJxeS2VrlZwX4OYYHJBVdH/RX0ZEMsiN2i35wwL/G/Dl97GKq+YBpzZM3yUN
         igCmiomQCqHtH8+PKizvv0epXzKn+mPcnFh32mxM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190402125056.21509-2-alexandre.belloni@bootlin.com>
References: <20190402125056.21509-1-alexandre.belloni@bootlin.com> <20190402125056.21509-2-alexandre.belloni@bootlin.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/7] clk: at91: allow configuring peripheral PCR layout
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Message-ID: <155622101740.15276.5464098774807053726@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date:   Thu, 25 Apr 2019 12:36:57 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alexandre Belloni (2019-04-02 05:50:50)
> The PCR register actually changed layout for each SoC. By chance, this
> didn't have impact on sama5d[2-4] support but since sama5d3, PID is seven
> bits wide and sama5d4 and sama5d2 don't have DIV.
>=20
> For the DT backward compatibility, keep the layout as is.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next

