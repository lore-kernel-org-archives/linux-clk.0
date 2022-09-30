Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06169C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 19:36:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbiI3Tgr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 15:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiI3TgV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 15:36:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC39B5B;
        Fri, 30 Sep 2022 12:35:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A5336248B;
        Fri, 30 Sep 2022 19:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7CFC433C1;
        Fri, 30 Sep 2022 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664566546;
        bh=uEXyapb0XYYTD+6FmQtFH3wQwjKpwaogYOeODksXiFQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NG/8akH565hcGpLmjPhSRJQdKM+hkOKng7KwBbsY5RVdf+Jct3Dy7icQ05kF+hJqE
         yqR5BWz6R+wLz/VLkbEK/nDVnpCl5bhzEWMK12bkjr49pZRcwZwKvIK3S2Hxz/Pdhd
         AY/TWV57C4hafZXNSKu00LvqAGsnzV9xDJXFZvE6+exHgXKz91qdayG2xLhYT524N2
         yLUOPd6emAmMSWQo647izXI4gPBeEjBltxpjAJlo/AkILub6ilX612sv4Hq85z0Nwx
         POyMZNfFjlzTuz+XLWvTvEoCSSMw8TAO1n5EUqc7Opz+JYfu9nWXv1vidD9nR7ZWcs
         ZpZ8E+lg1RuvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220909152421.278662-3-gengcixi@gmail.com>
References: <20220909152421.278662-1-gengcixi@gmail.com> <20220909152421.278662-3-gengcixi@gmail.com>
Subject: Re: [RESEND][PATCH V8 2/2] clk: sprd: Add clocks support for UMS512
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
To:     Cixi Geng <gengcixi@gmail.com>, baolin.wang@linux.alibaba.com,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, orsonzhai@gmail.com, robh+dt@kernel.org,
        zhang.lyra@gmail.com
Date:   Fri, 30 Sep 2022 12:35:44 -0700
User-Agent: alot/0.10
Message-Id: <20220930193546.CF7CFC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Cixi Geng (2022-09-09 08:24:21)
> From: Cixi Geng <cixi.geng1@unisoc.com>
>=20
> Add the list of clocks for the Unisoc UMS512, along with clock
> initialization.
>=20
> Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
> ---

Applied to clk-next
