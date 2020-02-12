Return-Path: <SRS0=CruU=4A=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04090C2BA83
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 17:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8E59206D7
	for <linux-clk@archiver.kernel.org>; Wed, 12 Feb 2020 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581527170;
	bh=sieMuaXvkCN45E7atxS9RyI0PoF5ma3kVN+ou27Wuc0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=YiX1bbi8qgWqugfjbNVQgbtMAh5Y4Bv/pD9o51Rv+lMQyBsDZt2AzEZXlZQ7FEpgn
	 /1FVxTjPdC5/WWWn1sj6MRquuu+cnl55bct4Xr8tkPu+0CAIYbpc+u0SYKG70E7ImL
	 uMg02RdForP0LR5m889j8xB9CaXveh+H7xTcg3nE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgBLRGK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Feb 2020 12:06:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:55752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727054AbgBLRGK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 12:06:10 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEB1120658;
        Wed, 12 Feb 2020 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581527169;
        bh=sieMuaXvkCN45E7atxS9RyI0PoF5ma3kVN+ou27Wuc0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Jy6dN6rt0ftG2OUvuzlew0cOSLS7B2KdqEu97Ik7K5a6qjKCP6/zAb7MmvVY9lyv9
         UIJSUgTZUlfyihRHqaynLCZkrHwvamGeFN0AFaDvDSF7n6kHeAVUzBJZKYPfVObhbE
         5AIfh9GL5kKeoOVkQiuszbmKF/oWbULO3pyel22Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200212100047.18642-1-geert+renesas@glider.be>
References: <20200212100047.18642-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ARC: Replace <linux/clk-provider.h> by <linux/of_clk.h>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-snps-arc@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Vineet Gupta <vgupta@synopsys.com>
Date:   Wed, 12 Feb 2020 09:06:08 -0800
Message-ID: <158152716893.121156.17153312552420472005@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2020-02-12 02:00:47)
> The ARC platform code is not a clock provider, and just needs to call
> of_clk_init().
>=20
> Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
