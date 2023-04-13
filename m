Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76725C77B61
	for <linux-clk@archiver.kernel.org>; Thu, 13 Apr 2023 20:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbjDMUao (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Apr 2023 16:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjDMUaj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2023 16:30:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707819EC9
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 13:30:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95EF764194
        for <linux-clk@vger.kernel.org>; Thu, 13 Apr 2023 20:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5657C433D2;
        Thu, 13 Apr 2023 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681417831;
        bh=bg+hAEA2n+1q6v4jx67ZsDXo3OnMp+lvwcU+AlhJdtA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kfMw3HbgtYtgiAi9cLh8d6cVRTlz0gqfknHXtCfRr01yIDYdLBwRK7RtLVUO0xIBl
         o06rv7j7YDcoEKPQ0ROOpRFjaPPpFynb9+1qkKECRPY6c2EX9JJf0rWC1JDZ+PS7Rz
         0IaZnelyHOwjaeNOeuphF/UOwPUw5oM5irjiC3yCXq0olddvwU0zkyWm3PzwYTkjNk
         RDlDt8fhnth4SwV9LM6+ESBoYux7lXR7zV9ROjjRChLGm0gsT7VswruLASvX5z6dot
         lvZ6R8ZRr2coeqxW0zz2Y5EB/N4x132I3J6DUYsuWRJ8cMH1m8hiiVk5nxPVwfRf7v
         WbaiFMKzRsOUA==
Message-ID: <2203d5cc9350486e234198d8fff01641.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170e812b-01ad-2a5f-51fe-3d63f988ad68@gmail.com>
References: <af85927b-0da3-3495-2ed4-64bda91cd239@gmail.com> <7b16c4d703dc00efd6e1b4062b5fd6d7.sboyd@kernel.org> <170e812b-01ad-2a5f-51fe-3d63f988ad68@gmail.com>
Subject: Re: [PATCH] clk: mux: let clk_mux_val_to_index return U8_MAX in the error case
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 13 Apr 2023 13:30:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiner Kallweit (2023-04-13 12:27:27)
> On 13.04.2023 21:10, Stephen Boyd wrote:
> > Quoting Heiner Kallweit (2023-04-11 23:19:04)
> >> Currently this function may return a negative errno, but almost no
> >> user checks for the error case. Only imx_clk_gpr_mux_get_parent()
> >> does, but mentions in a comment that they'd prefer a dummy value.
> >> Other users cast the negative errno to u8 instead, what may result
> >> in unwanted results.
> >> Let's deal with this by returning u8 and U8_MAX in the error case.
> >> Then clk_core_get_parent_by_index() can detect that the index is
> >> out of range.
> >=20
> > Is this causing problems for you?
>=20
> I'm not directly impacted. I came across this when working on a driver
> with the following scenario:
>=20
> I have a clock muxer where I want to exclude one of the mux parents
> by using clk_mux.table. If by chance the boot loader used this mux
> parent, then clk_mux_val_to_index() would return an errno.
> Also within clk core the return value isn't checked in
> clk_mux_get_parent().
>=20

Ok. I'd rather go with a total rewrite of the get_parent clk_op[1] and fix
this at the same time.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=3D=
clk-parent-rewrite
