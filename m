Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEDBC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 01:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiLIBTQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 20:19:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLIBTQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 20:19:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 335FB78BA0;
        Thu,  8 Dec 2022 17:19:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F641B826B7;
        Fri,  9 Dec 2022 01:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACF1C433F0;
        Fri,  9 Dec 2022 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670548752;
        bh=Qi8u7xmLeh0dJS4qRXTXkdNlimJ3zVxzH6ish6utoas=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XnkWXJ629iMgst7TWvkZsm1+udf8SqPbUfVOdzfmZDeXBbk5JzH8tG06UcYYzO8pe
         MEedKoXYeiZcrAiCdmDfyD66KXeIp5OPI+uOsH3zVgHlZz7dud7RaXpx8bR2GWmuDG
         BYSH3rfqEkvM59pTnZ+yOIS5rPBtdtZOkRpMMFhuQUQ/3Qd6uwJxa0HUgccJWCpejY
         85nWjdeJn/5ZrGv5yESOy28mfqxXYDL1EP3smsQztzVD1hzq6b7DxqbtOKmJ8nX/nc
         t9T0KXf1kcoy28KcHOPJAHeHyaByokd8NBZ3//a7uvK1/hM0PwhzSzS8FTTSRzXZME
         7PECqWa/bbkSA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221120030257.531153-2-liambeguin@gmail.com>
References: <20221120030257.531153-1-liambeguin@gmail.com> <20221120030257.531153-2-liambeguin@gmail.com>
Subject: Re: [PATCH v1 1/4] clk: lmk04832: declare variables as const when possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
To:     Liam Beguin <liambeguin@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Thu, 08 Dec 2022 17:19:09 -0800
User-Agent: alot/0.10
Message-Id: <20221209011911.EACF1C433F0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liam Beguin (2022-11-19 19:02:54)
> Fix the following warning reported by the kernel test robot.
>=20
>         cppcheck possible warnings: (new ones prefixed by >>, may not rea=
l problems)
>         >> drivers/clk/clk-lmk04832.c:357:15: warning: Variable 'pll2_p' =
can be declared with const [constVariable]
>             unsigned int pll2_p[] =3D {8, 2, 2, 3, 4, 5, 6, 7};
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202203312017.5YW13Jr4-lkp@intel.com/
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---

Applied to clk-next
