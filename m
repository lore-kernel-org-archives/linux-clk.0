Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BF2C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiAYWaU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbiAYWaU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:30:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A308C06173B;
        Tue, 25 Jan 2022 14:30:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE12D6185A;
        Tue, 25 Jan 2022 22:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BDFC340E0;
        Tue, 25 Jan 2022 22:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149818;
        bh=TkaQDVwLsvjITz+VYxyXLK66+i23A05rZvv73wH94h4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rbmMkOxtLF1GUL7nFYliXh0Vk0BW6waitKFIP5Ya03HZ6be3M+aTkUzfBkP0kKmyC
         Ku8JHWMdXrX41DaTFVjP7Rl0JfTy7y2t7LOANmvoRnZDHOwEvfbKO+rnGRTSyjaKRq
         ODqNFuBqHAcp9IshO6wmJGSUhhxTdTfzeOsOkC2BXdIKH6IHsnCB1CDbZsIXY8KhMJ
         4HFBjRdPLIPor135/8vxQMdnIPk+tBeBjMcPx6LI2gbHqcQsnIYjMtQ2FDPvEMyvSM
         bOfvFiG2szXwApkVkDWDTMp9qmWovGSFTF0H+krbT8eNTRILPDcEqZNlDDXRgQHaRq
         v1LFdE2D1clqQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-8-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-8-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 7/9] clk: cs2000-cp: make clock skip setting configurable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:30:16 -0800
User-Agent: alot/0.10
Message-Id: <20220125223018.25BDFC340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:34)
> The clock skip function of this chip is not necessarily desirable in
> all hardware appliances. This patch makes the feature configurable
> through a device-tree property.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---

Applied to clk-next
