Return-Path: <SRS0=PWff=RB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C54C43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 18:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51893217F9
	for <linux-clk@archiver.kernel.org>; Tue, 26 Feb 2019 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551205098;
	bh=bFLXljzs2qAylOC1A8tQ7CTZcoU6o67PgXbdazTu9uI=;
	h=To:References:Cc:Subject:From:In-Reply-To:Date:List-ID:From;
	b=pkDmrmMF8rRgZnFLBSIhfwjgoclfkeXc/1BmftCFDzc5cPDmgO24Mm0WxRRp7jaE5
	 ttbGd0Srx4crX2YP5Flp1art2hm/8NZKd2iJFXojQlt4bvravCSbe88otCqSlplv/Z
	 WQvt487KQgS8QvhgHClSQDSMjDcCq1jvxnsF6So0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbfBZSSR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Feb 2019 13:18:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:52176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728736AbfBZSSR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Feb 2019 13:18:17 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 018EB217F5;
        Tue, 26 Feb 2019 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551205097;
        bh=bFLXljzs2qAylOC1A8tQ7CTZcoU6o67PgXbdazTu9uI=;
        h=To:References:Cc:Subject:From:In-Reply-To:Date:From;
        b=s4UKrbE7YvarmlFrjpcAMX83XIBwsz7PvW3mliL0XOlnJcULTTfeUdpx3ZNS+ZqQu
         d9DJAqjNCd5hBZqpop0MzQmsRr2ig+7cYrVcxavLIYCH63f7rrmDT/NPOMzWrrlHk6
         GeJh4QD/F+0Xka8gJPlxUbgH9Vi0CPFGo8WqbLv4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Seiya Wang <seiya.wang@mediatek.com>
References: <20190225065112.3400-1-seiya.wang@mediatek.com> <20190225065112.3400-2-seiya.wang@mediatek.com>
Message-ID: <155120509627.260864.5936412356126577519@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: correct cpu clock name for MT8173 SoC
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190225065112.3400-2-seiya.wang@mediatek.com>
Date:   Tue, 26 Feb 2019 10:18:16 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Seiya Wang (2019-02-24 22:51:12)
> diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings=
/clock/mt8173-clk.h
> index 8aea623dd518..76e4e5b65353 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -194,7 +194,8 @@
>  #define CLK_INFRA_PMICWRAP             11
>  #define CLK_INFRA_CLK_13M              12
>  #define CLK_INFRA_CA53SEL               13
> -#define CLK_INFRA_CA57SEL               14
> +#define CLK_INFRA_CA57SEL               14 /* Deprecated. Don't use it. =
*/
> +#define CLK_INFRA_CA72SEL               14

Also, please send a followup patch to remove the deprecated define later
when the dts file is fixed up.

