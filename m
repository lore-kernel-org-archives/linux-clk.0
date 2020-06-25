Return-Path: <SRS0=6ucw=AG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A0CC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C6EA20857
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593045967;
	bh=OUxXBFoghacMANUGTE7ZG9CeSufUCQvHlJDK1Yo+EJA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=GXwuXAe6wLQZUbTXBYu/YBbeH6JOXgc9fUq90gcF+hvRaZvDan9NnleYR/7vZyB0B
	 Qn/QD9ik2ahIhJgCbAV5Er9weTUJ1fgNbkEDG6wO2xB5OaMziHpwWmMms729QEbmEx
	 GJ17srShU2IuQ9Y+RZr+Q7u8saSGnqNLwdCFdbxw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388543AbgFYAqH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Jun 2020 20:46:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729175AbgFYAqG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Jun 2020 20:46:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5833207E8;
        Thu, 25 Jun 2020 00:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593045966;
        bh=OUxXBFoghacMANUGTE7ZG9CeSufUCQvHlJDK1Yo+EJA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oYFQ3lMGqoNbaCLc5QTotVZFrL4vtTg0ehMZnp+/sFuuD5eSkXAARlcQi3Thz7g1d
         xdsYyPdWaR5TFE5jilGiMEDhlXK/wL3pXRJtRAKL3tI2D6qbazQ1Db8dsNKWbCv/jj
         skm92CRyFl2C4lBiWJlmkFr7GKS4PbuatBO5I2Mo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ae8bd505d8851f6646e244cd76b6b289346973c8.1592210452.git-series.maxime@cerno.tech>
References: <cover.98f979c2af2337c57217016d21d7c68e1ac2ce8a.1592210452.git-series.maxime@cerno.tech> <ae8bd505d8851f6646e244cd76b6b289346973c8.1592210452.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v5 25/27] clk: bcm2835: Allow custom CCF flags for the PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Wed, 24 Jun 2020 17:46:05 -0700
Message-ID: <159304596533.62212.5983688856832285825@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-15 01:41:05)
> While some clock types allow for each clock to specify its own custom
> flags, the PLLs can't. We will need this for the PLLB, so let's add it.
>=20
> Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
