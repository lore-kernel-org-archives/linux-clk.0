Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF1BC61DA4
	for <linux-clk@archiver.kernel.org>; Wed, 15 Mar 2023 15:53:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbjCOPxb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjCOPxW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Mar 2023 11:53:22 -0400
Received: from out-38.mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D672876070
        for <linux-clk@vger.kernel.org>; Wed, 15 Mar 2023 08:52:49 -0700 (PDT)
Message-ID: <a406597f-60f4-5602-1f13-6c00cdc98c05@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1678895567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LAZRybupTvQEP0hHnGktZ9GfjVa1Kn4GHkLJyjxmJqc=;
        b=tFSK0itZaddcvsbD3fAZ9iXUM0mQS0REsGD8wAg1x+9tvOgAED3Tiak+5dNwulyIDk6r+b
        vJB3jicZXYqgY4aqwugxCaJtviRADODqZy0M6g3TdD2eSzoBh7Sv3bxekgEheC/CGwIh0M
        AA7w63hptaRkbZZybILr5Y9bvmJGc/s=
Date:   Wed, 15 Mar 2023 15:52:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH RFC v6 6/6] ptp_ocp: implement DPLL ops
Content-Language: en-US
To:     Jiri Pirko <jiri@resnulli.us>, Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-7-vadfed@meta.com> <ZBHliPPS+e5d5JQe@nanopsycho>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZBHliPPS+e5d5JQe@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/03/2023 15:34, Jiri Pirko wrote:
> Sun, Mar 12, 2023 at 03:28:07AM CET, vadfed@meta.com wrote:
> 
> [...]
> 
>> @@ -4226,8 +4377,44 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>
>> 	ptp_ocp_info(bp);
>> 	devlink_register(devlink);
>> -	return 0;
>>
>> +	clkid = pci_get_dsn(pdev);
>> +	bp->dpll = dpll_device_get(clkid, 0, THIS_MODULE);
>> +	if (!bp->dpll) {
> 
> You have to use IS_ERR() here. Same problem in ice.
> 

Yep, fixed, thanks!

