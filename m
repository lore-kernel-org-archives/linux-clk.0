Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C9DC43334
	for <linux-clk@archiver.kernel.org>; Tue, 19 Jul 2022 07:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbiGSHD0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Jul 2022 03:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbiGSHDZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jul 2022 03:03:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DC63191C
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 00:03:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 75A81B819AD
        for <linux-clk@vger.kernel.org>; Tue, 19 Jul 2022 07:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D53C341E3;
        Tue, 19 Jul 2022 07:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658214202;
        bh=SqaO2ohBSxE/RaWcGL2xyZQaJxKZRPf9Fsx9NbDuM/A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FB7Z05WHvboiu340chE+P4NlUZfJMcA2MnvRHQb2H7KlnjYnC+wqbFnRSaA3la3jQ
         Ck1S//8crfw0SjO0ssG3jLwGF22vcs7NHlLsvHgxWOjd/D2YrJRJYxhrCK1Nm5IrTN
         vDAo37f6EuIWDXgL6pO6+qdl5vwJVc2KpT+nAC0uXPEeSt9d8lr0jDvz+LHUqDQ8PX
         DFJWLvDE0We3+JB1gr5+62VvwndguKA9CwyOAtmnrYxH1CGpNh3MoSt2xhaoKhrldB
         dS04Ph1++jJDUK6Tdnnr4v638xprfIxx6foA2RKNgPMoPPnW7t2EaQg5apVk+lmSAD
         4mIdqATa6xaew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220712100605.898385-1-claudiu.beznea@microchip.com>
References: <20220712100605.898385-1-claudiu.beznea@microchip.com>
Subject: Re: [GIT PULL] AT91 clk fixes for v5.19
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        mturquette@baylibre.com
Date:   Tue, 19 Jul 2022 00:03:19 -0700
User-Agent: alot/0.10
Message-Id: <20220719070321.D3D53C341E3@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2022-07-12 03:06:05)
> Hi, Stephen, Michael,
>=20
> In case it is not too late, please pull these 2 fixes for 5.19.
> They are necessary for proper working of:
> - new features enabled on LAN966 SoCs that uses clock gating support
>   in clk-lan966x driver
> - proper balance of reference counter embedded in struct device_node
>   objects that is incremented by of_get_parent()

This second one doesn't seem to be fixing anything critical. I think we
can wait on it. The first patch is presumably important though? I'll
cherry-pick it to clk-fixes and push it out and up in a few days.
