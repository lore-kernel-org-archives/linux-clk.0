Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB5FC7EE2F
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 18:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbjFLS3U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 14:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236137AbjFLS3D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 14:29:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7934E1FC4
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 11:28:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFB5062CD0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 18:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17770C433EF;
        Mon, 12 Jun 2023 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686594456;
        bh=lGfvXTvmJfHUfLj4QKKADQEsmrPoVf8lHmlMuSvr4P8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iNrlRpDtku8XDf03FJ11gx37u0NDUkW1DJ+gbGkYZ1/20+rYcAsNIXgBtmfdEoC4G
         kVAlKmunEbStC7Llc9UwzawEFEDOXrOEf2Jr2+9QQJVocLP20k+xVj3bF4GzAAs7ry
         gnJBfjVJWzkKEhSTr5RiOtbvWEgPMjyi6HCX7ECtfHqOpDjT5XDXRZTl8XpiFSzXiM
         BPAevuKjc+RlVy0vEaTLMkAj+jzUeyzp/uP1Yf/xdtIrDnxLTsoS6HQsb3ztw19Gjs
         RyTSP6Wteykd/0tFvPI8dfU1qitmj4Dbqk1sIgKb8iMR4VmbEM6KtG8BIEIrbQRPLc
         LAzN1zPRWuDow==
Message-ID: <059857a715fa74bc898e49d6d9a1dc2d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230609210605.GA17740@jernej-laptop>
References: <20230609210605.GA17740@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.5
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
To:     Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date:   Mon, 12 Jun 2023 11:27:33 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2023-06-09 14:06:05)
> Hi!
>=20
> Please pull following clock changes for 6.5.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.5-1
>=20
> for you to fetch changes up to ca1170b69968233b34d26432245eddf7d265186b:
>=20
>   clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux (2023-05-18 23:0=
7:09 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
