Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15594C77B73
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 21:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjEDVV2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 17:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjEDVV1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 17:21:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1F61386D
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 14:21:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECFA66120E
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 21:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F21C433D2;
        Thu,  4 May 2023 21:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683235285;
        bh=jpSH+u+S0sJbu8VeFrwjvjt3yEARbb7MqiqpyQEzo/c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=axyRJJ5DG2ZmQnBv7WNlCyJgIGdg50EUyrJyFGkxkHEuslHIaLodH66LDWQ8L0Gvl
         QSg0gcmUdbIsI4hWIZoJlKEPdQzd4LdAfrTjD0/ovcE3FcOEk4vc6XxasU2qGKgSX5
         p2nsLQBf78fxpoqXIFGYWxoF/URy4drHcV7bqrKqRtAJ1SmKloi+UELL8VuypMsB+T
         QrN54MHPzcIpzfrkj2OMmvt4+18MS/3MYp0BDoxY0A98WCkxj2+HfVIcmy/dn1k2k6
         DI6bAq60rugYZ9XU5Yk28ovkt+WYmve3eyo9aqJGctYhUvjHUIqSjYWPbVE1Ou51Hc
         CmlNz8Oms5gYQ==
Date:   Thu, 4 May 2023 14:21:23 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        <poros@redhat.com>, <mschmidt@redhat.com>,
        <netdev@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v7 2/8] dpll: Add DPLL framework base functions
Message-ID: <20230504142123.5fdb4e96@kernel.org>
In-Reply-To: <20230428002009.2948020-3-vadfed@meta.com>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 27 Apr 2023 17:20:03 -0700 Vadim Fedorenko wrote:
> +/**
> + * struct dpll_pin - structure for a dpll pin
> + * @idx:		unique idx given by alloc on global pin's XA
> + * @dev_driver_id:	id given by dev driver
> + * @clock_id:		clock_id of creator
> + * @module:		module of creator
> + * @dpll_refs:		hold referencees to dplls that pin is registered with
> + * @pin_refs:		hold references to pins that pin is registered with
> + * @prop:		properties given by registerer
> + * @rclk_dev_name:	holds name of device when pin can recover clock from it
> + * @refcount:		refcount
> + **/
> +struct dpll_pin {
> +	u32 id;
> +	u32 pin_idx;
> +	u64 clock_id;
> +	struct module *module;
> +	struct xarray dpll_refs;
> +	struct xarray parent_refs;
> +	struct dpll_pin_properties prop;
> +	char *rclk_dev_name;
> +	refcount_t refcount;
> +};

The kdoc for structures is quite out of date, please run
./scripts/kernel-doc -none $DPLL_FILES

> +/**
> + * dpll_device_notify - notify on dpll device change
> + * @dpll: dpll device pointer
> + * @attr: changed attribute
> + *
> + * Broadcast event to the netlink multicast registered listeners.
> + *
> + * Return:
> + * * 0 - success
> + * * negative - error
> + */

Let's move the kdoc to the implementation. I believe that's 
the preferred kernel coding style.
