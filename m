Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BA3EE49AD
	for <linux-clk@archiver.kernel.org>; Wed, 23 Aug 2023 02:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjHWCL6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 22:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjHWCL5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 22:11:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CD2E4A
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 19:11:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8E85861275
        for <linux-clk@vger.kernel.org>; Wed, 23 Aug 2023 02:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F2FC433C8;
        Wed, 23 Aug 2023 02:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692756704;
        bh=bOWWtdMrF6LJFfQBK2OyDOfqMh/CaDEbXH4MQR6WIx8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G/strxObU3F+RipWOvkJ6xnnffkARZQjH0Z3vyUGjNETnFW6R07oUa7NDJSn1yNXK
         ZmscwhsPWeU/cwMl8VWfAHOsnRWnf+IKuw5RhHg5vCBzfL0IrA2p9Y9xy/WfGM+WXm
         k+qtph6ry3KA87EExFLcNihAo1uKmOBnsY9rkeO3M/EHt4DhG/ScQZeK7GC2NOUbqN
         Bi7CWDmv567jULq25ZYlNnHPLqG981FISRLvN5BGNM/2FpBZXRD7PONfr8bkmBcyXQ
         gJyOiRLOptSsD6C4yBtttIrsw1dHaBzyVTtzBHVMGe3q0qEu1W+rUcuW6WxpSoabfA
         9nnHUqipQXyEw==
Date:   Tue, 22 Aug 2023 19:11:43 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@nvidia.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v5 5/9] netdev: expose DPLL pin handle for
 netdevice
Message-ID: <20230822191143.119c3d72@kernel.org>
In-Reply-To: <20230822230037.809114-6-vadim.fedorenko@linux.dev>
References: <20230822230037.809114-1-vadim.fedorenko@linux.dev>
        <20230822230037.809114-6-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 23 Aug 2023 00:00:33 +0100 Vadim Fedorenko wrote:
> static int
>  dpll_msg_add_mode(struct sk_buff *msg, struct dpll_device *dpll,
> @@ -340,6 +352,7 @@ dpll_cmd_pin_get_one(struct sk_buff *msg, struct dpll_pin *pin,
>  
>  	ref = dpll_xa_ref_dpll_first(&pin->dpll_refs);
>  	ASSERT_NOT_NULL(ref);
> +
>  	ret = dpll_msg_add_pin_handle(msg, pin);
>  	if (ret)
>  		return ret;

Chunk out of place

> diff --git a/include/linux/dpll.h b/include/linux/dpll.h
> index 2202310c10cd..9b612038b538 100644
> --- a/include/linux/dpll.h
> +++ b/include/linux/dpll.h
> @@ -101,6 +101,26 @@ struct dpll_pin_properties {
>  	struct dpll_pin_frequency *freq_supported;
>  };
>  
> +#if IS_ENABLED(CONFIG_DPLL)
> +
> +size_t dpll_msg_pin_handle_size(struct dpll_pin *pin);
> +
> +int dpll_msg_add_pin_handle(struct sk_buff *msg, struct dpll_pin *pin);
> +
> +#else
> +
> +static inline size_t dpll_msg_pin_handle_size(struct dpll_pin *pin)
> +{
> +	return 0;
> +}
> +
> +static inline int dpll_msg_add_pin_handle(struct sk_buff *msg, struct dpll_pin *pin)
> +{
> +	return 0;
> +}
> +
> +#endif

The only empty line between #if and #endif that's needed is the one
between the two static inline helpers

>  struct dpll_device *
>  dpll_device_get(u64 clock_id, u32 dev_driver_id, struct module *module);
>  
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 0896aaa91dd7..36a872774173 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -34,6 +34,7 @@
>  #include <linux/rculist.h>
>  #include <linux/workqueue.h>
>  #include <linux/dynamic_queue_limits.h>
> +#include <linux/dpll.h>

Please no includes in netdevice.h, it's included in way too many places.

All you need is a forward declaration of struct dpll_pin, AFAICT.

> diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
> index ce3117df9cec..2e7df321f345 100644
> --- a/include/uapi/linux/if_link.h
> +++ b/include/uapi/linux/if_link.h
> @@ -377,6 +377,8 @@ enum {
>  	IFLA_GSO_IPV4_MAX_SIZE,
>  	IFLA_GRO_IPV4_MAX_SIZE,
>  
> +	IFLA_DPLL_PIN,
> +

No empty lines, no idea who started this trend but let's stop it.

>  	__IFLA_MAX
>  };
