Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78A9C32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 21:50:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbiHSVui (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 17:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiHSVuh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:50:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46180B5E52
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B1B78B82968
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479E9C433D7;
        Fri, 19 Aug 2022 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660945833;
        bh=sp4r3pDjizjc/cz2ZyZUCXnQCLJXtyhvnDMzHGxheqk=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=cBZ3cvHH0uZafx0TuHG4lBbEBRp3f7Aln00thTNT5cmpIKFXfpuWHqDOg/aHfhcJ4
         i5AmMPYICHfq1WajiagjbcJXG8NpU+uFFxwi8D7Mh49aBH2FI3YsOjqiCsCaogmnZV
         fkU3/6oGh5yTmkn8XVPMoKTiQap2DYHvUs2n/tF+9cGuTNdMIkxtSdQ+pRQnJMCl/4
         wO3XUKojSjFjn1gP+0S+QT4rOJDOlQxcAcTJ5EQB1x+0zRWMQJVCMDE/Dci6NPXGrc
         gj2xVb8CvkujGSj62Jxzr5dj3iq8RtFQ5Bxhk1usITwM7yqYl2TnpjSpCTVnGBTZmA
         FwL2xdcrXkssA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220708084900.311684-1-windhl@126.com>
References: <20220708084900.311684-1-windhl@126.com>
Subject: Re: [PATCH] clk: berlin: Add of_node_put() for of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     linux-clk@vger.kernel.org, mturquette@baylibre.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:50:31 -0700
User-Agent: alot/0.10
Message-Id: <20220819215033.479E9C433D7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-07-08 01:49:00)
> In berlin2_clock_setup() and berlin2q_clock_setup(), we need to
> call of_node_put() for the reference returned by of_get_parent()
> which has increased the refcount. We should call *_put() in fail
> path or when it is not used anymore.
>=20
> Fixes: 26b3b6b959b2 ("clk: berlin: prepare simple-mfd conversion")
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
