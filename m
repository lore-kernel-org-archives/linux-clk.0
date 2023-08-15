Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BBAEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 03:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbjHODbo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Aug 2023 23:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234590AbjHOD32 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Aug 2023 23:29:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A09BB3
        for <linux-clk@vger.kernel.org>; Mon, 14 Aug 2023 20:23:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DF7160ABC
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 03:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18B7C433C8;
        Tue, 15 Aug 2023 03:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692069783;
        bh=3+FTO5tYbyi0mvftVJwDIuqYnqD2lynJbuJhWEOFv1I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DDjT8cCx82/67tu2egRePi9MaFGJvhbGmQdECqvo3CMYdryzy5u1IkjR1YOVlL9c3
         YyBOTPAFUmedSEl0lngnxJeQjXUg0N3pu9DdN/2PL1jRsrY4X7rmiLOAKJ6SEWhovx
         wh5zpVLlWqMTw7ydONqAUZVo/Rt24gXumrstNuqDv/w6mycYXkjKSDgTrN70shfk8L
         G4wqRmevtZvHMTdTSXhKPmpvGYlR6kAsG7GXGEczOIT/Rlzfk5L/kFVzOj9Rev7iCm
         o5N5AfLFEYsmCJm9KK/OywOrhC+6eiL08ImPk0dTLXJ38Haicc4dMoCf93o0lRx5Hs
         MRRNk9E5qw7Eg==
Date:   Mon, 14 Aug 2023 20:23:01 -0700
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
Message-ID: <20230814202301.13768f0d@kernel.org>
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
> +static int
> +dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
> +		  struct netlink_ext_ack *extack)
> +{
> +	u64 freq = nla_get_u64(a);
> +	struct dpll_pin_ref *ref;
> +	unsigned long i;
> +	int ret;
> +
> +	if (!dpll_pin_is_freq_supported(pin, freq)) {
> +		NL_SET_ERR_MSG_FMT(extack, "not supported freq:%llu", freq);
> +		return -EINVAL;
> +	}

NL_SET_ERR_MSG_ATTR(extack, a, "frequency not supported by the device")
