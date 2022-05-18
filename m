Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F4AC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 18:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241465AbiERSdT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 14:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241447AbiERSdS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 14:33:18 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67CDF15BACC
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 11:33:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CE451CE21B8
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 18:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112E7C385A9;
        Wed, 18 May 2022 18:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652898794;
        bh=jWmD+uVdh2XryKF4PVV8vwve/TzV6+tHXQpDRZeDE6M=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ToKtzZ+AHv6BCT/RTlLtJOiRY2fTEKk3Yin0I4iIHZLSoARj2Z315NrCE3oPaAlMz
         g1E6VYisjLvro3W2EmbOZqp0XByRvy8t1JAhv1z9ISR7If78Bp9Q4gjWyRFVWQw8qj
         4wHZk+JKxrADyr2ohAte9TsKA/3EOBw4hqHUEX42PxC0EGpNZI6dzGh4o1EtcFgXaL
         zvzNuuYtju4DSzYi43Ri318o/exA1uVUe0l8ZSBa0Yy3E8rirmKNkv08A1aRvUZPEa
         j+df70NssRhUdIN3P39Y6MrN5FNkmQuHaUHfjoAw9Lj3prgQywokCPeyablVMGMpTT
         Hsxx/Ggoxo5Dw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220517133556.6934-1-phil.edworthy@renesas.com>
References: <20220517133556.6934-1-phil.edworthy@renesas.com>
Subject: Re: [RFC] coccinelle: Add test for unnecessary check before calling clk_disable_unprepare()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, cocci@inria.fr
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Phil Edworthy <phil.edworthy@renesas.com>
Date:   Wed, 18 May 2022 11:33:12 -0700
User-Agent: alot/0.10
Message-Id: <20220518183314.112E7C385A9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Edworthy (2022-05-17 06:35:56)
> The clk_disable_unprepare() function only calls clk_disable() and
> clk_unprepare(). Both of these functions already check the clk ptr
> passed in using the IS_ERR_OR_NULL macro. Many drivers already omit
> any checks on the clk ptr, so it is safe to assume this is true for
> all call sites.

Skipping the check for NULL makes sense to me because a NULL clk pointer
is still a valid clk. I'm not so sure about IS_ERR() though. Do the
various implementations of clk_disable() and clk_unprepare() check for
IS_ERR() there?
