Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2496CEE49A5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Aug 2023 02:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjHWCV1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 22:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjHWCV0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 22:21:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1601185
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 19:21:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8643D63119
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 02:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2924BC433C7;
        Wed, 23 Aug 2023 02:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692757283;
        bh=OmMA2cNYi5uqKLHPnfTToPfIm8rFnARJwjZuYF8l5O0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S8vOctK3xYd212kYXplu2O1YDGiuTVzX9xYC1oDbF2J/lEwXexfsXjw/SDEtO0pZo
         LLu1T+tb+HC02BQjjW9V+B/hcC81C4+jE68+nBKHSnvFFnEtg/psgz44XtQsPpq+Fa
         OaCYXa+XrK1DYXNVKdauB8oOAxEu9PZeyP8iK2iwi5sQZ6YMVokD+5jiHlQOTmayM/
         Obthv8xeDzHKvchuYZMU6Tql0k6Ez4iPbBF+jhqA6SE5VYNdu0ULOHhg8j6r6jHQjQ
         CFE16sC24RsTfxCl+nbemFt1koF53LF/4EW4wshk/haqajHu+BjXxcUb80VttDmSuo
         JhZ+RuZVjjnZQ==
Date:   Tue, 22 Aug 2023 19:21:22 -0700
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
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v5 2/9] dpll: spec: Add Netlink spec in YAML
Message-ID: <20230822192122.00f40f0b@kernel.org>
In-Reply-To: <20230822230037.809114-3-vadim.fedorenko@linux.dev>
References: <20230822230037.809114-1-vadim.fedorenko@linux.dev>
        <20230822230037.809114-3-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 23 Aug 2023 00:00:30 +0100 Vadim Fedorenko wrote:
> +      -
> +        name: dpll-caps
> +        type: u32

Why is this one called dpll-caps (it's in the pin space)?
"doc:" could help clarify the rationale?

Also enum: pin-caps ?
