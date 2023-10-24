Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0581C07545
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 03:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjJXDYa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 23:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjJXDY2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 23:24:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF32310C9;
        Mon, 23 Oct 2023 20:24:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C45AC433C7;
        Tue, 24 Oct 2023 03:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698117865;
        bh=ydn4AI+g4wOX9e9EfDRyQt4SRY5yLc9OX9A8VSufVxU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=D7PfUwtGSgN2vdR7TbnqLHlH7JjazNqP+EsErO5H6OMILjGy5CV/VOaYCAQ79I+Ad
         XhkWbfh+qlrLXryNTe8//WGlWT9N/ASW5+ROa5cnVRi/LcLrHWQk0AaiPu/I+IC9Dd
         Zh5dt4Yf1vL31l41LM0yWwZVcwoZpr/YyNI0aehO2gBHekz85QlYKwSF2BMh+fzGk/
         TEB05ZeKDwTQCrOgn6FCCTqCNHI/0qsoQ3bN1CgUA/eFIH92gwq+EhBULegmJKc90S
         GGr3AjuGoYtemQqXZXNZ82vksu6bIDTJCik8zuW8c9OfoX3/e9xwSr+JFL3XXWoVVP
         vGsLWASwwI/Jg==
Message-ID: <8f1a5b099165f0451e4a032940e0242d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230913115211.11512-1-zhifeng.tang@unisoc.com>
References: <20230913115211.11512-1-zhifeng.tang@unisoc.com>
Subject: Re: [PATCH V2] clk: sprd: Composite driver support offset config
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhifeng Tang <zhifeng.tang23@gmail.com>,
        Wenming Wu <wenming.wu@unisoc.com>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Zhifeng Tang <zhifeng.tang@unisoc.com>
Date:   Mon, 23 Oct 2023 20:24:22 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Zhifeng Tang (2023-09-13 04:52:11)
> The composite interface support the offset configuration,
> which is used to support mux and div in different registers.
> Because some sprd projects, the divider has different
> addresses from mux for one composite clk.
>=20
> Signed-off-by: Zhifeng Tang <zhifeng.tang@unisoc.com>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>
> ---

Applied to clk-next
