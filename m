Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DEDC0015E
	for <linux-clk@archiver.kernel.org>; Tue,  1 Aug 2023 13:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjHANXg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Aug 2023 09:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjHANXf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Aug 2023 09:23:35 -0400
Received: from out-105.mta0.migadu.com (out-105.mta0.migadu.com [91.218.175.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45F71982
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 06:23:34 -0700 (PDT)
Message-ID: <4f2e91c7-e2e8-6b3a-fc14-8f44503fb6be@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1690896209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NBW3OZNb/cLDZnirr+w27tj54Ks2k4ls9Y5vjfjj6bw=;
        b=OIxsK8VkfjPpTCrj/CQl8MJRPM+qMAMj5bitylG9vPg2KP/SAyaMkSNj31dM1k06aAXZoN
        +ymhn4Fp9EyLMTyERo1f2CDtYlJ7xSKPoBg43doL48MpriKySFZH+46JXCqjMWZ/9dKARA
        YEQB0+gbdh3LLlGJ7n5e8ERY1bv5vVE=
Date:   Tue, 1 Aug 2023 14:23:26 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 07/11] netdev: expose DPLL pin handle for
 netdevice
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>, Jiri Pirko <jiri@nvidia.com>
Cc:     Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-8-vadim.fedorenko@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230720091903.297066-8-vadim.fedorenko@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/07/2023 10:18, Vadim Fedorenko wrote:
> From: Jiri Pirko <jiri@nvidia.com>
> 
> In case netdevice represents a SyncE port, the user needs to understand
> the connection between netdevice and associated DPLL pin. There might me
> multiple netdevices pointing to the same pin, in case of VF/SF
> implementation.
> 
> Add a IFLA Netlink attribute to nest the DPLL pin handle, similar to
> how it is implemented for devlink port. Add a struct dpll_pin pointer
> to netdev and protect access to it by RTNL. Expose netdev_dpll_pin_set()
> and netdev_dpll_pin_clear() helpers to the drivers so they can set/clear
> the DPLL pin relationship to netdev.
> 
> Note that during the lifetime of struct dpll_pin the pin handle does not
> change. Therefore it is save to access it lockless. It is drivers
> responsibility to call netdev_dpll_pin_clear() before dpll_pin_put().
> 
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> ---
> RFC v9->v0:
> - rearrange function definition according to usage
> v8->v9:
> - net_device->dpll_pin is only valid if IS_ENABLED(CONFIG_DPLL) fix the
>    code in net/core/rtnetlink.c to respect that.
> - move dpll_msg_add_pin_handle to "dpll: netlink" patch + export the
>    function with this patch
> 
>   drivers/dpll/dpll_netlink.c  | 19 ++++++++++++++++---
>   include/linux/dpll.h         | 20 ++++++++++++++++++++
>   include/linux/netdevice.h    | 20 ++++++++++++++++++++
>   include/uapi/linux/if_link.h |  2 ++
>   net/core/dev.c               | 22 ++++++++++++++++++++++
>   net/core/rtnetlink.c         | 35 +++++++++++++++++++++++++++++++++++
>   6 files changed, 115 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
> index c44dda78737d..e4a9bd767b92 100644
> --- a/drivers/dpll/dpll_netlink.c
> +++ b/drivers/dpll/dpll_netlink.c
> @@ -37,6 +37,18 @@ dpll_msg_add_dev_handle(struct sk_buff *msg, struct dpll_device *dpll)
>   	return 0;
>   }
>   
> +/**
> + * dpll_msg_pin_handle_size - get size of pin handle attribute for given pin
> + * @pin: pin pointer
> + *
> + * Return: byte size of pin handle attribute for given pin.
> + */
> +size_t dpll_msg_pin_handle_size(struct dpll_pin *pin)
> +{
> +	return pin ? nla_total_size(4) : 0; /* DPLL_A_PIN_ID */
> +}
> +EXPORT_SYMBOL_GPL(dpll_msg_pin_handle_size);
> +
>   /**
>    * dpll_msg_add_pin_handle - attach pin handle attribute to a given message
>    * @msg: pointer to sk_buff message to attach a pin handle
> @@ -54,6 +66,7 @@ int dpll_msg_add_pin_handle(struct sk_buff *msg, struct dpll_pin *pin)
>   		return -EMSGSIZE;
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(dpll_msg_add_pin_handle);

Jiri, could you please remind me what is the reason to export this 
function? Because I cannot
any usage of this function in drivers.


[....]
