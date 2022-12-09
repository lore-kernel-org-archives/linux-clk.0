Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4EFC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 01:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiLIBT0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 20:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLIBTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 20:19:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32628941AD;
        Thu,  8 Dec 2022 17:19:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ED321B826CE;
        Fri,  9 Dec 2022 01:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44E7C433EF;
        Fri,  9 Dec 2022 01:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670548762;
        bh=+9GqnRNxTvxJIL0cmWQzkvNTSnGGBqWkGVHaHUh65M4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HgTPrCBJnuwkDipDSfW+1uKy8IjJvMUtXaJ0gdIbO1DsFKPewC650otzFh3GqYQCc
         55huWoWlfVjDBlHDGfR/rqs/jAoygP5WejydQmGpNmOoH4FgvnccN9XG1d9b+y0AW4
         uNbfmiG0Jhvr7+qCUW1fesHrHxNdikiri2VfIewd4dBupVCc6lrtHzE98xNgL6pkAc
         szumgwWR7FGjsHKBuu0PYg5/d4UsjUTt0J4a2ORMx/W9iaip7HexxaU2VFPKVr/zLa
         hcsgVcYEVQwhzkHOj/USJ7hcZ9VUN7aOmqxzK2lKWFsou7HqRShphn4X2E1gbU/izR
         wG5V7nvGRZcRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221120030257.531153-3-liambeguin@gmail.com>
References: <20221120030257.531153-1-liambeguin@gmail.com> <20221120030257.531153-3-liambeguin@gmail.com>
Subject: Re: [PATCH v1 2/4] clk: lmk04832: drop unnecessary semicolons
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Liam Beguin <liambeguin@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 08 Dec 2022 17:19:20 -0800
User-Agent: alot/0.10
Message-Id: <20221209011922.A44E7C433EF@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liam Beguin (2022-11-19 19:02:55)
> Semicolons on the closing brace of a function definition are
> unnecessary, remove them.
>=20
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---

Applied to clk-next
