Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2D0C28D13
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 00:00:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbiHWAAB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 20:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiHWAAA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 20:00:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87CF54F646
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 17:00:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2434360909
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 00:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C37FC433C1;
        Mon, 22 Aug 2022 23:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661212799;
        bh=TAC6H0PX+3/zzBmBpFvyj0Bw+o2EWF1aUAIWlyEdsFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FjLMYiY/sS+Qu5wsgqlO0yhX6Qu4ACETU+rT4v3QNmaCx9KDMYWlqYxSB4H+KtWDb
         xSwgRNRH47ijDIduOQNclMdjeEoEz9lS1Ns+SIFOILs3BLVEPF78aD1BJ9z+OmkgxR
         BZCh+mQdn2uhomgvnI5+VmX5ZakALzLgj+xs6egbuGumZv5gVgHRAZt3Jsgt7rqLkm
         dYT1X8FiP2d1mydLN2/KFXM0qLswgULEXXe5tQqJWwEJ12dIBwQOTfGSCDEM72RTOq
         fZRwUPeokhOFMVx+pD2Dp2OCy4C4YarHE5r5X+7B0/td3jIoo6ZmYQTKEsLNW56jJd
         cutScY3JDFKBw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
References: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v2] clk: zynqmp: Check the return type  zynqmp_pm_query_data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@xilinx.com, shubhrajyoti.datta@xilinx.com,
        michal.simek@xilinx.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 22 Aug 2022 16:59:57 -0700
User-Agent: alot/0.10
Message-Id: <20220822235959.7C37FC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2022-04-06 02:22:11)
> Check the return type of zynqmp_pm_query_data(qdata, ret_payload);
>=20
> Addresses-Coverity: Event check_return
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
