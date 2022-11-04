Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5BBC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 18:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbiKDSKT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 14:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiKDSKR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 14:10:17 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E252045A20;
        Fri,  4 Nov 2022 11:10:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5C58BCE2DAD;
        Fri,  4 Nov 2022 18:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A664FC433C1;
        Fri,  4 Nov 2022 18:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667585413;
        bh=4i3rTbABUBKm7zPRQ7BoILAAr1dZHMGBMPBm6EZ/bnQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=keeLyl+YtL4w+aTBw3rQzjkQAiV5J4SmtwLNGXAy7vdFyGCugoJOak8BiX79g0prG
         oDdwrbV+yNIk15Wqt6cduiNBoGfV/WfF4XzlwEDKWJEr5yslrrmXAeaC3XsBzW5PN1
         V5ZC0c75Oq+vNrRDNeM72Egkk75II09Rv/MRbNiXGJg4boACSN12SymwAfbFh062gQ
         k1SjRRdb4wbPw/9AaPPiIEzjNkl1Uh+mqdpxaH2BzaKqwE553dBSoVmhcomOQQwwf6
         RnDGUfywauGG1QtA7i6wxOfIzcKLTYTxTZKIKBWZgCZdAw6Kr6liL/zjcj1zICsYSK
         vCwogRcmVjEbQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221103123328.stzhtq5e2jscjdxd@houat>
References: <20221018-clk-range-checks-fixes-v1-0-f3ef80518140@cerno.tech> <20221018-clk-range-checks-fixes-v1-4-f3ef80518140@cerno.tech> <20221026020800.38AC8C433C1@smtp.kernel.org> <20221103123328.stzhtq5e2jscjdxd@houat>
Subject: Re: [PATCH 4/4] clk: Warn if we register a mux without determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk@vger.kernel.org
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 04 Nov 2022 11:10:11 -0700
User-Agent: alot/0.10
Message-Id: <20221104181013.A664FC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-11-03 05:33:28)
> On Tue, Oct 25, 2022 at 07:07:58PM -0700, Stephen Boyd wrote:
> > There is another case which is a leaf clk that is a mux where you only
> > expect clk_set_parent() to be used, and not clk_set_rate(). This use
> > case is odd though, so I'm not sure how much we care.
>=20
> It looks like there's a good number of clocks that do indeed only
> provide get_parent / set_parent. It's hard to tell if it's an oversight
> or a choice.
>=20
> I think we can make that decision explicit by providing a determine_rate
> helper that always returns the current parent and its rate. It shouldn't
> change anything from a CCF behavior point of view, and it makes it clear
> what the behavior is. And if someone wants something else, then they can
> change it to whatever they want.

Ok sounds like a plan.
