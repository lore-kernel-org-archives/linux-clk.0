Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1047CC0015E
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 15:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbjHOPS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 11:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237957AbjHOPSh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 11:18:37 -0400
Received: from out-2.mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350E119A3
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 08:18:22 -0700 (PDT)
Message-ID: <d5c30de7-df89-18dd-3ad8-a5d99c1e7108@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692112700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5jkRrsW9ZohDgZxdapSfROnd5WC/t+pIz3Z7RYOCEpk=;
        b=c5FEo+pNIRIQR7Ia0XE3msfztl33UetjSbeMLnJyhUSRhDUCP2kxoRpHGyDdwiMOcjW43J
        qoHzwqxkoMhZFA8/CC1eUtKOuhQ/885vlEtdkrFqcVDLMYBer7/m3NNBBM1aFld7cbsGE7
        w8ziAMKjx3NN87XuwGAI6Vrfj8zshdw=
Date:   Tue, 15 Aug 2023 16:18:16 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 4/9] dpll: netlink: Add DPLL framework base
 functions
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
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
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230811200340.577359-5-vadim.fedorenko@linux.dev>
 <20230814202441.349586b4@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230814202441.349586b4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/08/2023 04:24, Jakub Kicinski wrote:
> On Fri, 11 Aug 2023 21:03:35 +0100 Vadim Fedorenko wrote:
>> +	xa_for_each(&pin->dpll_refs, i, ref) {
>> +		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>> +		struct dpll_device *dpll = ref->dpll;
>> +
>> +		if (!ops->frequency_set)
>> +			return -EOPNOTSUPP;
>> +		ret = ops->frequency_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
>> +					 dpll, dpll_priv(dpll), freq, extack);
>> +		if (ret)
>> +			return ret;
>> +		__dpll_pin_change_ntf(pin);
>> +	}
> 
> only one freq is reported in get, AFAICT, so why send a notification
> after each ref is updated?

The pin can be technically connected to several DPLLs and app may watch
for the specific DPLL messages only. We would like to inform all users 
on any DPLL which has this pin connected to.
