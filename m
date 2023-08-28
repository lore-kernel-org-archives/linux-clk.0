Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838BCC83F12
	for <linux-clk@archiver.kernel.org>; Mon, 28 Aug 2023 19:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjH1TmW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Aug 2023 15:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbjH1Tl4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Aug 2023 15:41:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43488129
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 12:41:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D677F644A1
        for <linux-clk@vger.kernel.org>; Mon, 28 Aug 2023 19:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97074C433C7;
        Mon, 28 Aug 2023 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693251713;
        bh=FRkyoN28bA0TvlJ3RY9iFOdJIYYMOxmsjaIcU+xn6HA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z6ykNQHj5v1smymmy8iT87a87m3qn0RUsD5d6MSzm0nvQocIRjlQjx5T/gkjcCnq4
         ebQrqlBLCwhtPUeyi835/CATC7qcAPDZJV4CIeVAQoP6bA8aG23275zbf0c4qB4/kg
         GFm01kwEWoZRq7iP+n1THZK/kDlw1PmVogBxepsSxKtSpio50As0QTGelcex8AbnaA
         /xjeHsLgLk0thp8nOVnIAlZ6sWfORKVj57Bofp7+D45XiRPWzUcNHoLddqgfbOIoMQ
         uB/TO/FSzvVh+FgYSOGioLZjOsc3BfqALSUxdLcUR9leFRBHsB+ejUFC6go3IDgHCU
         mkrkQsKrHXWPg==
Date:   Mon, 28 Aug 2023 12:41:51 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v7 0/9] Create common DPLL configuration API
Message-ID: <20230828124151.37130b34@kernel.org>
In-Reply-To: <20230824213132.827338-1-vadim.fedorenko@linux.dev>
References: <20230824213132.827338-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 24 Aug 2023 22:31:23 +0100 Vadim Fedorenko wrote:
>  41 files changed, 8050 insertions(+), 96 deletions(-)

After some deliberation we decided to play it safe and defer 
DPLL to v6.7, sorry.
-- 
pw-bot: defer
