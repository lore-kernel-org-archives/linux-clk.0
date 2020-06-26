Return-Path: <SRS0=uDsh=AH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63796C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 18:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3616E2088E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jun 2020 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593197905;
	bh=TGfEfT04MJtyB6NlAmXR6ddfNHAjn2Jz58o9zj04LPQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=NkPh8OR1wSrkYhTggKVmJOktTMXXGwT/8xiYvtyt0WHH0Ds5DMWsb/L9Ip32LoAxK
	 qjbTBdRQT6Erm+cWDs5rrEM1Q3m+JluvOyK95NEMOpXBbqMniGRWmuztcrxlWQGNRc
	 72sy4SGSPoKDw0JJHz1yGID7ONFepMSQV2duhR5A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgFZS6Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jun 2020 14:58:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:47734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgFZS6Y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Jun 2020 14:58:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E773420836;
        Fri, 26 Jun 2020 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593197904;
        bh=TGfEfT04MJtyB6NlAmXR6ddfNHAjn2Jz58o9zj04LPQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ffs/k8uGO0BMvavrGsn0anevAbhJNpMoR2Vm+8dfTKQs5l6oKwb37H1G6dOdrmfN7
         rS7KMQbj8CAHv2cA0Qj4yl1/R3+uLRHOc/J0q86BEEN1iuJ127CG95QeJNkm/+AY6V
         N+SDwLsXjRVXPux87TG2wwV6B6SNjtTCwwdascvE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200626112513.90816-1-maxime@cerno.tech>
References: <20200626112513.90816-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: bcm: dvp: Add missing module informations
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date:   Fri, 26 Jun 2020 11:58:23 -0700
Message-ID: <159319790323.62212.8326522252296969810@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-06-26 04:25:13)
> The driver for the DVP controller in the BCM2711 was missing the MODULE_*
> macros resulting in a modpost warning at compilation.
>=20
> Fixes: 1bc95972715a ("clk: bcm: Add BCM2711 DVP driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
