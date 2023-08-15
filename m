Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7BDC04FDF
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 03:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbjHODbr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 23:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234601AbjHOD3b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 23:29:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3935E19A3
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 20:24:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB3A661383
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D622C433C7;
        Tue, 15 Aug 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692069883;
        bh=3FRPby38WxMTq6IfBU0Tvs25oJJdKuU9MSll+th2OsE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CohmaaG5iOklaCdHt91LUExlKpLVTVneSHhbdnXV20JXzqFrpqlDFmV2mcXlqi/zy
         0xrSDKaT+EGvXM4vwCw771XsxmZn7pRw7Tl1WTmb/KVsTBM5W7zXZr8NOVy5pNT5gQ
         eVv2srZ6/3YDU9VH1CZVh2LL3xn/ve/cl7yXOZCacsolZsnXnZFy9XJKky1jK4E6b3
         WdaqHv/eX0lL/oxtfLyFb32sCE8v4p0riDP8+UWgwM9BTWCJ5JmcvQs7pUDITYXA0F
         +0QkZKoC6sEPWH073OgEtVWZKzpkEV/meZf8ei7i9M+TaAyYJ4wqtycQWrEd4nCHZc
         j9Bw7B/xcRTYw==
Date:   Mon, 14 Aug 2023 20:24:41 -0700
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
Subject: Re: [PATCH net-next v4 4/9] dpll: netlink: Add DPLL framework base
 functions
Message-ID: <20230814202441.349586b4@kernel.org>
In-Reply-To: <20230811200340.577359-5-vadim.fedorenko@linux.dev>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
        <20230811200340.577359-5-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 11 Aug 2023 21:03:35 +0100 Vadim Fedorenko wrote:
> +	xa_for_each(&pin->dpll_refs, i, ref) {
> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
> +		struct dpll_device *dpll = ref->dpll;
> +
> +		if (!ops->frequency_set)
> +			return -EOPNOTSUPP;
> +		ret = ops->frequency_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
> +					 dpll, dpll_priv(dpll), freq, extack);
> +		if (ret)
> +			return ret;
> +		__dpll_pin_change_ntf(pin);
> +	}

only one freq is reported in get, AFAICT, so why send a notification
after each ref is updated?
