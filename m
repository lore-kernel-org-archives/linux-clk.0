Return-Path: <SRS0=xlmH=M7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4947AECDE43
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 18:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17AD82087A
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 18:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMVMWELb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17AD82087A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbeJTCPW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 22:15:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:44260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726976AbeJTCPW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Oct 2018 22:15:22 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF9B42087A;
        Fri, 19 Oct 2018 18:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539972492;
        bh=6tq3LVWQ6nMo7VSw02tRTmCTazWjGJjoPaix6mGuISI=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=fMVMWELbwz5YdiP2H/OYgpijk4a+9Iwl6sZPB90s1XI0+SPYRq8XxZ2bh/eE5DVlj
         QeyMzmnbLJ3YgeMkZvS+6wZjVuXR+bFXQx7PNDrsgxmMb37xLmts9ET08vvk6yxyvS
         J+bcpvZorKl3PwQNI4K0DT72B3GNdhtb4s3sYnis=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
        lee.jones@linaro.org, linus.walleij@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
Cc:     mark.rutland@arm.com, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
Message-ID: <153997249215.53599.6652762320741988515@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v3 1/5] mfd: lochnagar: Add initial binding documentation
Date:   Fri, 19 Oct 2018 11:08:12 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2018-10-19 02:49:59)
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> =

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

