Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C75C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Mar 2022 18:46:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbiCISrm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Mar 2022 13:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiCISri (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2022 13:47:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98081A39C1
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 10:46:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8CECAB82342
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 18:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E2CC340F4;
        Wed,  9 Mar 2022 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646851597;
        bh=1RHq1IUy+vLBHuFQY/5TO7p5E+kfprnBUUDje6ecNwE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=WNlDYlLAKysiFy+XcEN6c55c2UK4lB5VHRseEYerUGwEGoYfGgkCJL46kvQecRgKq
         G4aDdKaQCl8mC6oyKZnrKUddc7oMub9dM8QywdlHoZT+s/Gz61pokDQEkJEQoVr9a2
         c9+fKWkfguo9MidPYStsGWWXIRCmc0BMMb/7aXmHodRUUQHKQSyfh6WRHOymnUfRtM
         uOBxIo/AoBWaDyUIZnVyYd/94YALUgNTgGaRSREf+krs34dQf53KvCq63cOUios8uX
         8iPXTxGv61epK831k/nHvfRL2bPEcUjxZaUu+uRE7Qr25icvfTFgbKenkhuEs52Xdp
         q4knxurJHPzaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220308101714.164163-1-ping.bai@nxp.com>
References: <20220308101714.164163-1-ping.bai@nxp.com>
Subject: Re: [PATCH] clk: imx: Mark the snvs clock as critical by default
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org
To:     Jacky Bai <ping.bai@nxp.com>, abel.vesa@nxp.com,
        mturquette@baylibre.com, shawnguo@kernel.org
Date:   Wed, 09 Mar 2022 10:46:35 -0800
User-Agent: alot/0.10
Message-Id: <20220309184637.31E2CC340F4@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jacky Bai (2022-03-08 02:17:14)
> The SNVS moudule is not used only by the linux, it may also used
> by other SW component is secure world. No sense to gate it
> by linux, so mark it as critical clock.

Does it make sense to even populate it in the kernel then? Presumably
nobody is going to use it.
