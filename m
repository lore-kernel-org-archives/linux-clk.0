Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FBAC433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADCF561184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDHA1L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:27:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHA1L (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:27:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADBFE610FB;
        Thu,  8 Apr 2021 00:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841620;
        bh=rTaMy3196vIzUw52lY7eKIK7zms3raSX4c1v+G+4nmk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kuAdFLZQDz7UOj9jlHXeTeDEVlvsA5JUIliirsR4i7xC/o9HtA/LMcDPkeqB2XIAO
         jdqaafpSpqQNDMCs+/0f+57I1g5bFu7PSQwXWicBpH87NANo0aV+2IhqPqSVp1OB5j
         M1aSGEG4IWXnnLXOd9E/4NRX0sJbHiv+FctiUfsbLQjw9BgL63vwt18/S+mwKgfkyS
         8s/sCcfE52c89bv9pBmYPW0aIrzd8mqzDfOShEkWJn4VQcg1NDXkimjROImPtuk++b
         66MFtAb5vfXTy4KRITI+jO8A2riZOX/nD0HjUAqgNpiUUdYKOXT0QqpYudWhRQ8iPa
         cOgKCcv1mToQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322061754.1065367-3-punit1.agrawal@toshiba.co.jp>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp> <20210322061754.1065367-3-punit1.agrawal@toshiba.co.jp>
Subject: Re: [PATCH v2 2/2] clk: zynqmp: Drop dependency on ARCH_ZYNQMP
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        michal.simek@xilinx.com
Date:   Wed, 07 Apr 2021 17:26:59 -0700
Message-ID: <161784161937.3790633.13788714088868174566@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Punit Agrawal (2021-03-21 23:17:54)
> The clock driver depends on ZYNQMP_FIRMWARE which in turn depends on
> ARCH_ZYNQMP. Simplify the Kconfig by dropping the redundant dependency
> on ARCH_ZYNQMP as it'll be applied transitively via ZYNQMP_FIRMWARE.
>=20
> Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---

Applied to clk-next
