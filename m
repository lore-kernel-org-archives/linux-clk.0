Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4DCC001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 21:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235879AbjHHVNW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 17:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbjHHVNG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 17:13:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B36920246
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 13:03:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F3F262C06
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 20:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918EEC433C7;
        Tue,  8 Aug 2023 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691525009;
        bh=XieZPduHjyDSjvr/8gZ88ZdbCP4k+VL3yfyNd86jhhw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dNjflAS3B1mZjhgu4XYMPMrOknEEnqRQ4UnDUtmF/wdZkTf9wwfnvuB025/6ZCMel
         3MO9DSNyp3jMcES/AJwS2n6lxQiS66Rstw0RZalS34IIkFvpOcd+R0AL29usX7IkyI
         H+tKnwu0tcbrs0c/2n3u0aGS9F15ZEiH0arFKVnqTBE7nSlx8t1aIJdCgW+JpoF6WG
         dgNA3g1eIEaVHlaxYaItysPNSn31LkY9UeqnNtrtLkKDUheCfrraKEN0gpW2DDXcwR
         kwuqmYFMLnjW4HuSL63sL9Pz4EvfOZGLaNkTjlookm6FW6SDTGD9X/QEP4SB1iKdR7
         6z8zDBRKM7wSw==
Date:   Tue, 8 Aug 2023 13:03:27 -0700
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
        Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH net-next v2 2/9] dpll: spec: Add Netlink spec in YAML
Message-ID: <20230808130327.5638d15b@kernel.org>
In-Reply-To: <a7e2f7e1-e36a-2c79-46c3-874550d24575@linux.dev>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
        <20230804190454.394062-3-vadim.fedorenko@linux.dev>
        <ZNCjwfn8MBnx4k6a@nanopsycho>
        <a7e2f7e1-e36a-2c79-46c3-874550d24575@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 7 Aug 2023 22:25:25 +0100 Vadim Fedorenko wrote:
> Well, in my case after rebasing on latest net-next I got just part of 
> your diff:
> 
> diff --git a/drivers/dpll/dpll_nl.c b/drivers/dpll/dpll_nl.c
> index ff3f55f0ca94..638e21a9a06d 100644
> --- a/drivers/dpll/dpll_nl.c
> +++ b/drivers/dpll/dpll_nl.c
> @@ -17,7 +17,6 @@ const struct nla_policy 
> dpll_pin_parent_device_nl_policy[DPLL_A_PIN_STATE + 1] =
>          [DPLL_A_PIN_PRIO] = { .type = NLA_U32, },
>          [DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U8, 1, 3),
>   };
> -

Uh, missing cw.nl() somewhere. Will add.

>   const struct nla_policy dpll_pin_parent_pin_nl_policy[DPLL_A_PIN_STATE 
> + 1] = {
>          [DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U8, 1, 3),
>          [DPLL_A_PIN_ID] = { .type = NLA_U32, },
> 
> 
> The "/* private: */" comment was added to the generator after Simon's
> comment. But I'll include this part into the next version.

We only added private for enum masks, I'll send a patch for nlattrs.
