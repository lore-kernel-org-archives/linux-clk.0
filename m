Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C068C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 21:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbiJCVYi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 17:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiJCVWc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 17:22:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700DA1AD89;
        Mon,  3 Oct 2022 14:13:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C34260109;
        Mon,  3 Oct 2022 21:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CBB1C433D6;
        Mon,  3 Oct 2022 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664831614;
        bh=pnq0BaudZyE1ZHxTQZ750T5B67Ec7e9t5He2lFafMcA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pd8zZNscdLlS2ClcQX4kihUyKO9nhPkWked48xr6jfJ7drq1I+7ya4OV45jaqsrkR
         mtD6ZwvWWfO4azJyzLaAUAzUYhrey2xoz/TdQLT7wdkfohrKJqX/zHmvFtlCOhSAcW
         /bGF+REjjjMo+czhAZrnMGfSd3hakzpZqVmIKYEvl/IRWwau9a/X4XteMgqoP8D+F+
         SxWud7q+sh54HEJWdM5vGmXjj+Z+Mqu0z6rqC5dQpX17nJOb36ip5RYKqa3pwlTlpn
         aWmlZGlF7zgWvtqqA4BSB8Yjq2LAAR3buz8KVkttDwNBRkEl+Cos8eI/n3iELP3zei
         RcG3fqoCo4dOA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408130617.14963-1-hanyihao@vivo.com>
References: <20220408130617.14963-1-hanyihao@vivo.com>
Subject: Re: [PATCH] clk: clk-xgene: simplify if-if to if-else
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Yihao Han <hanyihao@vivo.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 03 Oct 2022 14:13:32 -0700
User-Agent: alot/0.10
Message-Id: <20221003211334.5CBB1C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yihao Han (2022-04-08 06:06:09)
> Replace `if (!pclk->param.csr_reg)` with `else` for simplification
> and add curly brackets according to the kernel coding style:
>=20
> "Do not unnecessarily use braces where a single statement will do."
>=20
> ...
>=20
> "This does not apply if only one branch of a conditional statement is
> a single statement; in the latter case use braces in both branches"
>=20
> Please refer to:
> https://www.kernel.org/doc/html/v5.17-rc8/process/coding-style.html
>=20
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---

Applied to clk-next
