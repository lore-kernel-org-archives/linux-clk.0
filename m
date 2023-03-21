Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD88C6FD20
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 23:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjCUXf1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 19:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjCUXf0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 19:35:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE0E4D291;
        Tue, 21 Mar 2023 16:35:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4692061ED2;
        Tue, 21 Mar 2023 23:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF01C433D2;
        Tue, 21 Mar 2023 23:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679441718;
        bh=la84fR21p6BkrAgYSHC0TlI4voKp0tvsxTcIWMyXByc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fxZoYEY9ikSfQ9HBAPTYX0eEPLJ6X5ZvfIae5OIsik+/Sq51snrbQceb9hDETif4f
         ryJXut/pInboEwqqbejedBA94Q0ZmraZxuHvkeMU+/F7L6IUtUjhA+29LCuUzNExq/
         t5hsDjS5oJL6/nqktIdELca1PWHU+FJjE2zezcHHmhkaBQS0qkyZ94i1cmA711Apxz
         zJQioymcaCXxNcLgniBhwOT0WeNcpxOUvU7uR9VuHuiMlXjhuTkOsiEadT8B/+4qQD
         NOEWljMO4qS5/DTiWXNRRlb05FtPn5UnKFJD7ugo4ucMFwZ2HqEsKhTlxBVx88tEdT
         gGKFCOvEF37Tw==
Message-ID: <0ab905641f5bb8515467b46f4bbb740a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230321111817.71756-3-keguang.zhang@gmail.com>
References: <20230321111817.71756-1-keguang.zhang@gmail.com> <20230321111817.71756-3-keguang.zhang@gmail.com>
Subject: Re: [PATCH v5 2/4] clk: loongson1: Remove the outdated driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Keguang Zhang <keguang.zhang@gmail.com>
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Date:   Tue, 21 Mar 2023 16:35:16 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Keguang Zhang (2023-03-21 04:18:15)
> Remove the outdated driver due to the following aspects.
> - no DT support
> - duplicate code across LS1B and LS1C
> - does not fit into the current clock framework
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---

Applied to clk-next
