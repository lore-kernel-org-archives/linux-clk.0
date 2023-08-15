Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB1EC04A6A
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 02:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234358AbjHOCwQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 22:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234362AbjHOCwK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 22:52:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52403173B
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 19:52:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7AC6628A4
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 02:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6ACC433C7;
        Tue, 15 Aug 2023 02:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692067928;
        bh=fBlx8M6J3Snxii8KHE1eW/jzAOIKz2CzUVfAHu/9/ts=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t9iFMyLeDP4MDfepY6USEo/x0FM5GK6yxCkWbKdBAvf4yGPHnUdXuty3oeoBY6nCO
         gaqRJKCsFELr+kJXMxHSpTsiTtkn56mBUQRNJj9LlqTi+HxmZH/in0ov3TEKvLjhTw
         GDst/Gkh6SjKTYywrDBpWmhGkV6tEzt81VLSp9oP6NrThOdE1Ridb6joIbqhh8DZIw
         zrgO4k7Zf3V2H7dra8xvR5GHi9NTqdoAzMLvd95YDNxSfxMdgo8FKI3XiYQzR5tsPl
         jGx72s2nHXW65snF5+WR0YruT4iHxzgHPRiCprjz/qOdi8ftKLqaBPm7D1FKEGN9LG
         gPuLAJ8/QCCCA==
Date:   Mon, 14 Aug 2023 19:52:06 -0700
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
        intel-wired-lan@lists.osuosl.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v4 1/9] dpll: documentation on DPLL subsystem
 interface
Message-ID: <20230814195206.1d3ac1e0@kernel.org>
In-Reply-To: <20230811200340.577359-2-vadim.fedorenko@linux.dev>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
        <20230811200340.577359-2-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 11 Aug 2023 21:03:32 +0100 Vadim Fedorenko wrote:
> +the callback operation. Neverthelessi, there are few required to be

Neverthelessi
