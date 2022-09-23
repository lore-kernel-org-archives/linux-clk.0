Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B88C6FA82
	for <linux-clk@archiver.kernel.org>; Fri, 23 Sep 2022 13:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiIWNu6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Sep 2022 09:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiIWNu5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Sep 2022 09:50:57 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DD413EAE6;
        Fri, 23 Sep 2022 06:50:49 -0700 (PDT)
Received: from notapiano (unknown [71.190.76.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nfraprado)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3955A660223B;
        Fri, 23 Sep 2022 14:50:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1663941048;
        bh=J5DirfViUkwJD4ekJAf61ocSdPfp0ombx6YicS66mw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ahfHXptDSB4fesh8jybOFGEXFDdo4EEmrAZ88hrafm8c8DRucM5LdE/oH+U6uLajI
         IkRyMWc9hDqaTxtK01VbB5GFtUaoq/iYetdTE7/8LP/6Nu44atKnMcJR4zOwygRJ29
         ZpXiEszq99nmiw+jPEqpGfHlWFjswBtYjYAa2Y9/Hmn00Cx+VeipSc5mRp8rcsOCD8
         i5o38J0VODWjUTeahco/9crjEyn4Dim57TaGJx9LpFzFLU2H9wLMlU6R80JDKvAwZN
         gtDlR0PqbExSurVMQxyukbBs714zpGuIITvuGKsIpf17lnjBbLzoH/dCNVpJVPrpXv
         Ebs9pz6HYTdRQ==
Date:   Fri, 23 Sep 2022 09:50:41 -0400
From:   =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado 
        <nfraprado@collabora.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, zhangqing@rock-chips.com,
        finley.xiao@rock-chips.com, shawn.lin@rock-chips.com,
        zhengxing@rock-chips.com, jeffy.chen@rock-chips.com,
        andy.yan@rock-chips.com, eric@engestrom.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: rockchip: change
 SPDX-License-Identifier
Message-ID: <20220923134927.imjqakww37ctjvdr@notapiano>
References: <20c6a502-2ff5-bdb1-fb4f-0741f3a2c19c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20c6a502-2ff5-bdb1-fb4f-0741f3a2c19c@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 20, 2022 at 12:25:07AM +0200, Johan Jonker wrote:
> Change SPDX-License-Identifier to (GPL-2.0+ OR MIT)
> for Rockchip clock bindings.
> 
> Cc: Heiko Stübner <heiko@sntech.de>
> Cc: Elaine Zhang <zhangqing@rock-chips.com>
> Cc: Xing Zheng <zhengxing@rock-chips.com>
> Cc: Jeffy Chen <jeffy.chen@rock-chips.com>
> Cc: Finley Xiao <finley.xiao@rock-chips.com>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Cc: Eric Engestrom <eric@engestrom.ch>
> Cc: Mylène Josserand <mylene.josserand@collabora.com>
> Cc: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Request for copyright holder approval.
> Rockchip recently replied on other clock-patches to dual-license the
> binding.

Acked-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
