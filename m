Return-Path: <SRS0=6ucw=AG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F53AC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D49402078D
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jun 2020 00:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593045934;
	bh=UVIHxB2kQq7VMv5F7DuS8QacS9agH5AxTK6Agza3Z1A=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=N6n5lprRkot0PSLjjo5ciDnjG4dIh0o9yy67dQQYd/3RfNVIytRVTZa/VjEozFOjX
	 YU9ueH2B5rBukh4HnFt7XKItGGX3Oa8tt62+PBzYMJKTfE3ll/BFLC49N1+0LTevoF
	 EvwAg2y9rinIKgBvsZKzZ1kU/pxlOsEI3XjEh86I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389488AbgFYApe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Jun 2020 20:45:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:59372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388776AbgFYApe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Jun 2020 20:45:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9835B207DD;
        Thu, 25 Jun 2020 00:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593045933;
        bh=UVIHxB2kQq7VMv5F7DuS8QacS9agH5AxTK6Agza3Z1A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KbtTG9iXsGOPyFT+eHyxvsu9m3OnOefknwSvGbj/i/5d9z4zVyQZEmNOAMTaXkhzJ
         08VxavAixsuUlQtwV8FggoGFeFzWueqD0XFb1OwBX55ypGJSWqF51axoNh6ZKewI44
         84/ngU53yB/Lks+LY9CG3oK2gli/g4yVM9hu3wSE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4d8dbe4aaae98b3d3812ad7c3dba53d645cadbaf.1592210452.git-series.maxime@cerno.tech>
References: <cover.98f979c2af2337c57217016d21d7c68e1ac2ce8a.1592210452.git-series.maxime@cerno.tech> <4d8dbe4aaae98b3d3812ad7c3dba53d645cadbaf.1592210452.git-series.maxime@cerno.tech>
Subject: Re: [PATCH v5 19/27] clk: bcm: rpi: Add DT provider for the clocks
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
Date:   Wed, 24 Jun 2020 17:45:32 -0700
Message-ID: <159304593293.62212.12371883147156783922@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-15 01:40:59)
> For the upcoming registration of the clocks provided by the firmware, make
> sure it's exposed to the device tree providers.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Acked-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
