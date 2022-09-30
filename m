Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD0CC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbiI3Uot (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbiI3Uoq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:44:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB60A13F18;
        Fri, 30 Sep 2022 13:44:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D5F5624CC;
        Fri, 30 Sep 2022 20:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B9DC433C1;
        Fri, 30 Sep 2022 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570682;
        bh=5tYw3dudsvyQe0tArizPoUpOk3wLCtp2pClBeVluGCI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nZ97k4ucLrxKfZbUUJgbiF0GhFh1QZ0cAGACZzakWw69B39YSGRR5iMJFRxzRXS2u
         e0WEVlO+rOXXs9tBL/K0imjKaJPRIVLcPasEmq0d55hSmBcIQuQI/aCWtT41Ts4t5m
         urByUdM5UvqUvgaX0Px+GMI/IILSaeoFn8hPEt+42BaLfifBKNGC0CW4znXPeHHfGK
         WUshT6gh7F+hqJlOCkHc9CNXwQD7up6PopNp3foOfgaJu0Ifzqnsob942x7iffa9BQ
         apgWAck3MtNe4G8E85NgOMdM/u560vwAz3SV+mGSCJWOZOBRfnae8+TaG4hZuRZfvp
         IPRmtW6Xa0PUQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-9-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-9-doug@schmorgal.com>
Subject: Re: [PATCH 08/12] clk: mmp: pxa168: fix GPIO clock enable bits
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:44:40 -0700
User-Agent: alot/0.10
Message-Id: <20220930204442.97B9DC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:33)
> According to the datasheet, only bit 0 of APBC_GPIO should be controlled
> for the clock enable. Bit 1 is marked as reserved (always write 0).
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
