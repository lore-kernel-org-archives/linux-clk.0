Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3888DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbiAYWa3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbiAYWa3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:30:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B924C06173B;
        Tue, 25 Jan 2022 14:30:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 032CFB81B81;
        Tue, 25 Jan 2022 22:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A649EC340E0;
        Tue, 25 Jan 2022 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149826;
        bh=JmgnFlqxT+A8N6fMZ8lD/WkRhhJwblckXXGdxbrO7Wc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=O8024Q62egGgjvyWXi1/YjtPOSo1FpuwnA2uTcpvARY2RkZWVddRj9BNsBJ3RH2UP
         CSf46xBtcygWlzf5jaBL6HKpzWCVC4yHxTc+KvV+jtxSdV/OZj8G6yDyu4u+gwnqn4
         Ua+oZPRyBzOLRdmS1PbfM3VjHd3Cr9m1mqFTpBvAFJ/sh/2yMQZariNIpNy7/Z0zsn
         amlIcnYNTBMK+u5tP9GCHS8Mjn7BQgQGRG0ozuyesWzcxJSZ2GFlZ1R++ybgPsWOIK
         JIj3TedCILhHU21jg+gTMPChfdwyZcaFeMNPtiZ9K5lW8YrfQh2deVOSHLql0xUTp/
         76bckUskgA6Ow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-9-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-9-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 8/9] clk: cs2000-cp: freeze config during register fiddling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:30:25 -0800
User-Agent: alot/0.10
Message-Id: <20220125223026.A649EC340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:35)
> Make sure to freeze the configuration of the chip during the programming
> of 32-bit registers. This avoids the processing of invalid intermediate
> states.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---

Applied to clk-next
