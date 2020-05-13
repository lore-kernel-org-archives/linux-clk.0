Return-Path: <SRS0=ZViX=63=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1259C2D0F6
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 03:16:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 809C3207BC
	for <linux-clk@archiver.kernel.org>; Wed, 13 May 2020 03:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589339774;
	bh=TaG0vS5dNMz8Etjtf9+VwXVgTfZ7tYsvcXDt9cqX02A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=SxhGX5yZEknFhJIP9x+aGS7uHD5Ks3GLzrFLddgsJ5dAe4fknICnw2MsKMBadHqoP
	 QsC5SN1SFElXQgH0VZLqbXOjNoJEaY9tpiJAZ+EEsIq9wAzkxFPqL8qc4rjL5lhBv3
	 rV75xvoc1z0lWGQnMMNHZGi1NeW1qr+nS/+A8ug4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgEMDQO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 May 2020 23:16:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMDQO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 23:16:14 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B63E220714;
        Wed, 13 May 2020 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589339773;
        bh=TaG0vS5dNMz8Etjtf9+VwXVgTfZ7tYsvcXDt9cqX02A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B8Zi4y+zlBwjI2XcJPX3M3q8QDZFthkStUO/nWrTbSxMrmxR254UG2DZIbiAoL2JV
         q2XeF3oOP+mKhbKGkVWdg8cuvcpT3frk1PEyopw2nmSGdO2Ggds+1CoU5L3N8RMRYR
         jflVuBL7+RrujUbM1LJcakTKD6i3hMm094kQaTdY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200424124725.9895-1-t-kristo@ti.com>
References: <20200424124725.9895-1-t-kristo@ti.com>
Subject: Re: [PATCH 1/1] clk: ti: clkctrl: Fix Bad of_node_put within clkctrl_get_name
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 12 May 2020 20:16:12 -0700
Message-ID: <158933977295.215346.11971491814949812164@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2020-04-24 05:47:25)
> clkctrl_get_name incorrectly calls of_node_put when it is not really
> doing of_node_get. This causes a boot time warning later on:
>=20
> [    0.000000] OF: ERROR: Bad of_node_put() on /ocp/interconnect@4a000000=
/segmen
> t@0/target-module@5000/cm_core_aon@0/ipu-cm@500/ipu1-clkctrl@20
>=20
> Fix by dropping the of_node_put from the function.
>=20
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 6c3090520554 ("clk: ti: clkctrl: Fix hidden dependency to node nam=
e")
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-fixes
