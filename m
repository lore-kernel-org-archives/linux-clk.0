Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3281EE49AB
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 21:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjHVVRX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 17:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHVVRW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 17:17:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448E0CD5
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 14:17:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6E0262203
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 21:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365EAC433C8;
        Tue, 22 Aug 2023 21:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692739040;
        bh=IwOhZFHHbzfAkKpUjZTcnN5vr8ff2bs/fWa1bgZMSeI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e4i6pVt9Hf1SGnALKuuYRA5g0CDlLnQrjuS6j70ROuCUxqdNGDuVqS3zhTuHlDoiN
         qOhLG2Qf48AgEzxAQoYJVtGoq6ted5+qITA4vb/icmzYOSWKQjKVWrZGJUcgRLarUK
         1OVOreqHd9dfdappj90RstxV1fORfT7DjEEVuiG0dAPMPNgbp+IZm79ZI3LilRGL6l
         lGa2TU0Phro16q6wQdQVS+/RsnmE9SPXsnmqClSrG2jeg6lTAb6jz4+t61h2IcPvjI
         IWmg2REqQ4mdqlXBOEtMa7RQXX/LYM51Tu/mF5UanaC+4DEVKTE8pQm1Gv5d+UO5Ty
         MVk4wsy8tjPpg==
Message-ID: <28665fbba30488378c82fe74a5b50c0b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230808125341.4073115-1-ruanjinjie@huawei.com>
References: <20230808125341.4073115-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] clk: cdce925: Remove redundant of_match_ptr()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ruanjinjie@huawei.com
To:     Michael Turquette <mturquette@baylibre.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>, linux-clk@vger.kernel.org
Date:   Tue, 22 Aug 2023 14:17:17 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ruan Jinjie (2023-08-08 05:53:41)
> The driver depends on CONFIG_OF, it is not necessary to use
> of_match_ptr() here.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---

Applied to clk-next
