Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883F9C77B7C
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 14:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbjEKO5F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 10:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238652AbjEKO4v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 10:56:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018AD106C2
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 07:56:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1798764EA4
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 14:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAFAC433EF;
        Thu, 11 May 2023 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683816934;
        bh=TWVGAxdHC0hEH9C5Zgy4ygLuKrZWu81JJ74/YHgVR/k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UJo4LBA/AyV+tsgQfyOtA5TItg8VVAfeGU147YVCYktv7zP3scUD4pdlG3RrSpyOu
         l4kzUWwucf6OgfJ4VCBZS2Kd0yQKlwLwUBesVPZpgktWhlytQXYe4n/TGBgue8kcr7
         j00zitPSAyvxzEGxdGTAY5vbcVzUI1EthNmkstuMvxlqp+sBm7qTVliE8R3/ZnKl5T
         BIgKgUnuUeQTReoioNroLla9Ofa1/YLxSYwP++n+61x75W5dyrdTQyyZlYRDp8p72Z
         GgHO8+bBXLct6fQntES+MB/xrpqzM9TbXKItw0W1R6UnuOtnRxnMNfwNWMLmoGxTHl
         yehTU+ByqseiQ==
Date:   Thu, 11 May 2023 07:55:32 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [RFC PATCH v7 1/8] dpll: spec: Add Netlink spec in YAML
Message-ID: <20230511075532.6de7381c@kernel.org>
In-Reply-To: <ZFygo47TtTdb8IQa@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-2-vadfed@meta.com>
        <ZFOe1sMFtAOwSXuO@nanopsycho>
        <20230504142451.4828bbb5@kernel.org>
        <ZFTap8tIHWdbzGwp@nanopsycho>
        <MN2PR11MB4664357BAEC609040CF480C69B749@MN2PR11MB4664.namprd11.prod.outlook.com>
        <ZFygo47TtTdb8IQa@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 11 May 2023 10:00:35 +0200 Jiri Pirko wrote:
>> It seems the name and type is needed. Without type generation scripts fails.
>> For now fixed with having only name/type on subset attributes.  
> 
> Okay. Jakub, any idea why "type" is needed here?

I don't remember.
