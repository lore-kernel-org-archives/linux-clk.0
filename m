Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EC8C4332F
	for <linux-clk@archiver.kernel.org>; Sat,  1 Oct 2022 00:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbiJAAdE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 20:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiJAAdD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 20:33:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B76612C6BF;
        Fri, 30 Sep 2022 17:33:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A437A60EF4;
        Sat,  1 Oct 2022 00:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E14C433D6;
        Sat,  1 Oct 2022 00:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664584382;
        bh=id797+X5y/BRF58ZuMl5s16YYkbKq9tYjlT8VPnau3o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=G1uGVEVYoq2MnDdGfuooR+nY10ZSQxHwlB8qEHkIbGXMnyHUMDCtQkPdVaxVbT0cy
         iof5hzCbVTiOgYVM+3ujhzpn2QeGA4LysV/JiBwpfcIisqymYDh5DpArR/LKxN7VzP
         ukl9qao0nwdGfVYFq7nkAE610bvVrBZKVu+LXMXldXGi3EtZXKXLWc3hiC8flbN+G+
         SjQq3xqFEiScfKo4TIs+ShMuqwKNOCNTUdLuR3HVtesbctPM6jaXinOnu6fx4pnHJY
         6NtSQR97zsL6X3SQGSvWrFdCh8g4iuRPnYKHcvmGVUEFgcBeBrvgqCQNoaP7648zin
         Q4x1K0BnLme+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220912183613.22213-2-alexander.helms.jy@renesas.com>
References: <20220912183613.22213-1-alexander.helms.jy@renesas.com> <20220912183613.22213-2-alexander.helms.jy@renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: Renesas versaclock7 device tree bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com,
        alexander.helms.jy@renesas.com, michal.simek@xilinx.com,
        saeed.nowshadi@amd.com, Rob Herring <robh@kernel.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 30 Sep 2022 17:32:59 -0700
User-Agent: alot/0.10
Message-Id: <20221001003301.E6E14C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alex Helms (2022-09-12 11:36:12)
> Renesas Versaclock7 is a family of configurable clock generator ICs
> with fractional and integer dividers. This driver has basic support
> for the RC21008A device, a clock synthesizer with a crystal input and
> 8 outputs. The supports changing the FOD and IOD rates, and each
> output can be gated.
>=20
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
