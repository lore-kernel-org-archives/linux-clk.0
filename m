Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AFBC001B0
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 21:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjHGVZf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 17:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjHGVZe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 17:25:34 -0400
Received: from out-76.mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFA6E74
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 14:25:33 -0700 (PDT)
Message-ID: <a7e2f7e1-e36a-2c79-46c3-874550d24575@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1691443530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4ru8zGvKg03gqB6GmVvzBu1vOdq2JxR2kLEcmblTX14=;
        b=cuh5B+hMwOeMx7QNFVS1Me32+fiKBNFaaYoRhBeAHBOYKtgOJC0wx/L9rZ7pnd6JWuZsj1
        l8isGq0u03fpSg0CFrSArp3QKInSqeDCSI921ACrN8z0D+4BEti6jYm36NMr6RMffkeg3c
        SZGEAgFggLraPSp2D0F2sqTGJlg0f3g=
Date:   Mon, 7 Aug 2023 22:25:25 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 2/9] dpll: spec: Add Netlink spec in YAML
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Jakub Kicinski <kuba@kernel.org>,
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
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-3-vadim.fedorenko@linux.dev>
 <ZNCjwfn8MBnx4k6a@nanopsycho>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZNCjwfn8MBnx4k6a@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/08/2023 08:56, Jiri Pirko wrote:
> Fri, Aug 04, 2023 at 09:04:47PM CEST, vadim.fedorenko@linux.dev wrote:
>> Add a protocol spec for DPLL.
>> Add code generated from the spec.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> Signed-off-by: Michal Michalik <michal.michalik@intel.com>
>> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>> ---
> 
> Hmm, running tools/net/ynl/ynl-regen.sh generates following diff:
> diff --git a/drivers/dpll/dpll_nl.c b/drivers/dpll/dpll_nl.c
> index ff3f55f0ca94..638e21a9a06d 100644
> --- a/drivers/dpll/dpll_nl.c
> +++ b/drivers/dpll/dpll_nl.c
> @@ -17,7 +17,6 @@ const struct nla_policy dpll_pin_parent_device_nl_policy[DPLL_A_PIN_STATE + 1] =
>   	[DPLL_A_PIN_PRIO] = { .type = NLA_U32, },
>   	[DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U8, 1, 3),
>   };
> -
>   const struct nla_policy dpll_pin_parent_pin_nl_policy[DPLL_A_PIN_STATE + 1] = {
>   	[DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U8, 1, 3),
>   	[DPLL_A_PIN_ID] = { .type = NLA_U32, },
> diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
> index f659fabb1041..18d4fda484e8 100644
> --- a/include/uapi/linux/dpll.h
> +++ b/include/uapi/linux/dpll.h
> @@ -163,7 +163,6 @@ enum dpll_a {
>   	DPLL_A_PIN_PARENT_DEVICE,
>   	DPLL_A_PIN_PARENT_PIN,
>   
> -	/* private: */
>   	__DPLL_A_MAX,
>   	DPLL_A_MAX = (__DPLL_A_MAX - 1)
>   };
> @@ -182,7 +181,6 @@ enum dpll_cmd {
>   	DPLL_CMD_PIN_DELETE_NTF,
>   	DPLL_CMD_PIN_CHANGE_NTF,
>   
> -	/* private: */
>   	__DPLL_CMD_MAX,
>   	DPLL_CMD_MAX = (__DPLL_CMD_MAX - 1)
>   };
> 
> Do you base this patchset on top of recent net-next? If not, please do
> rebase.
> 

Well, in my case after rebasing on latest net-next I got just part of 
your diff:

diff --git a/drivers/dpll/dpll_nl.c b/drivers/dpll/dpll_nl.c
index ff3f55f0ca94..638e21a9a06d 100644
--- a/drivers/dpll/dpll_nl.c
+++ b/drivers/dpll/dpll_nl.c
@@ -17,7 +17,6 @@ const struct nla_policy 
dpll_pin_parent_device_nl_policy[DPLL_A_PIN_STATE + 1] =
         [DPLL_A_PIN_PRIO] = { .type = NLA_U32, },
         [DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U8, 1, 3),
  };
-
  const struct nla_policy dpll_pin_parent_pin_nl_policy[DPLL_A_PIN_STATE 
+ 1] = {
         [DPLL_A_PIN_STATE] = NLA_POLICY_RANGE(NLA_U8, 1, 3),
         [DPLL_A_PIN_ID] = { .type = NLA_U32, },


The "/* private: */" comment was added to the generator after Simon's
comment. But I'll include this part into the next version.

> 
> Other than this, looks fine to me.
> 
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Thanks!
