Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA84AC001DF
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 12:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbjGaMT7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 08:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjGaMTz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 08:19:55 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E18171C
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:19:46 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc63c2e84so49460585e9.3
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1690805985; x=1691410785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XM+dBkL9BOQB5M0QkPLLYoaZfMRgmlrJZ/IVtD0ioO0=;
        b=K/ixDBtHAoED1QTZkzrM0HP35wmxU5en+ia0zc1sDJnLq2BhUN1mjgwFGR3x0mhUTm
         H3OGTNuakXfxocEdqK1GhB3S8ynucvmwby3nWGTgvzmW49oBhpMPPdFAcSMbboxIRnU4
         qKduZksCoD63Qc6ufiHOWoJc41ELb6Vq9XiC1ggxpI9Ch37s/vd9s1KhlnqneJ39yKbE
         xvoRMFv7kumu57kjrYbkZp1tjuXo2Te+/Kf/dZlJ8g7PjBW+cB0Rj0SCLXWinfJmVqSV
         OQMt2XyprtX9qNGZQKMuoaR7LapJai9uasZrHpbx8KCHwCsJpCf1oB9++nilbbY57J6n
         FIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805985; x=1691410785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XM+dBkL9BOQB5M0QkPLLYoaZfMRgmlrJZ/IVtD0ioO0=;
        b=C6Cr1VLI0iuqa21UQSiaZK4vTV5Hgej4CnaORXaONVw+dC3glitBppwtbyy7yS022e
         YFa6kpcRmKZTg4VJZvhCxKmFWZnJ6fKEMYngx5VKkXzhbSdGhSfJq0WYlr4hi0hQIwF1
         c0z+9XyWYowoMJgU0RwgDxyYsFquEJYI+7S+23BzMY8FxMf9BhwwEI4gGebZkpjj03fT
         nfSyZB+PnJsiOqtBj55AtUQLjTom2ZyxGSXiCA9DxZomjmg9sB0jERCXEbcdypQFXMrI
         VWZr3g8bMfofgBo8ryGZOGdsuDSASwkhe6acxCJfBpIAd0lOmJKaAt6S655vcBYv/ZzG
         2yJw==
X-Gm-Message-State: ABy/qLZ7QJ9ngBOxriXNpi1XMCPikc35+GBvcs/+86GQEwARdpnln3A9
        VW/C7hPpOTYG34A/xOxMA8ActQ==
X-Google-Smtp-Source: APBJJlEctlAU59sp6IeHDQnotTpHuuRt9EWdIcJSmwMi77Aq/AtVjK71uRjSDGZv/d1bBLLm+M5qIw==
X-Received: by 2002:a7b:ca53:0:b0:3fb:415a:d07 with SMTP id m19-20020a7bca53000000b003fb415a0d07mr7933564wml.36.1690805984930;
        Mon, 31 Jul 2023 05:19:44 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id x13-20020a05600c21cd00b003fe21c7386esm2247355wmj.45.2023.07.31.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:19:44 -0700 (PDT)
Date:   Mon, 31 Jul 2023 14:19:43 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH 09/11] ice: implement dpll interface to control cgu
Message-ID: <ZMem35OUQiQmB9Vd@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-10-vadim.fedorenko@linux.dev>
 <ZLpuaxMJ+8rWAPwi@nanopsycho>
 <DM6PR11MB46571657F0DF87765DAB32FE9B06A@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB46571657F0DF87765DAB32FE9B06A@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sat, Jul 29, 2023 at 01:03:59AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Friday, July 21, 2023 1:39 PM
>>
>>Thu, Jul 20, 2023 at 11:19:01AM CEST, vadim.fedorenko@linux.dev wrote:
>>>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>

[...]


>>>+static int ice_dpll_cb_lock(struct ice_pf *pf, struct netlink_ext_ack
>>>*extack)
>>>+{
>>>+	int i;
>>>+
>>>+	for (i = 0; i < ICE_DPLL_LOCK_TRIES; i++) {
>>>+		if (!test_bit(ICE_FLAG_DPLL, pf->flags)) {
>>
>>And again, as I already told you, this flag checking is totally
>>pointless. See below my comment to ice_dpll_init()/ice_dpll_deinit().
>>
>
>This is not pointless, will explain below.
>
>>
>>
>
>[...]
>

[...]


>>>+void ice_dpll_deinit(struct ice_pf *pf)
>>>+{
>>>+	bool cgu = ice_is_feature_supported(pf, ICE_F_CGU);
>>>+
>>>+	if (!test_bit(ICE_FLAG_DPLL, pf->flags))
>>>+		return;
>>>+	clear_bit(ICE_FLAG_DPLL, pf->flags);
>>>+
>>>+	ice_dpll_deinit_pins(pf, cgu);
>>>+	ice_dpll_deinit_dpll(pf, &pf->dplls.pps, cgu);
>>>+	ice_dpll_deinit_dpll(pf, &pf->dplls.eec, cgu);
>>>+	ice_dpll_deinit_info(pf);
>>>+	if (cgu)
>>>+		ice_dpll_deinit_worker(pf);
>>
>>Could you please order the ice_dpll_deinit() to be symmetrical to
>>ice_dpll_init()? Then, you can drop ICE_FLAG_DPLL flag entirely, as the
>>ice_dpll_periodic_work() function is the only reason why you need it
>>currently.
>>
>
>Not true.
>The feature flag is common approach in ice. If the feature was successfully

The fact that something is common does not necessarily mean it is
correct. 0 value argument.


>initialized the flag is set. It allows to determine if deinit of the feature
>is required on driver unload.
>
>Right now the check for the flag is not only in kworker but also in each
>callback, if the flag were cleared the data shall be not accessed by callbacks.

Could you please draw me a scenario when this could actually happen?
It is just a matter of ordering. Unregister dpll device/pins before you
cleanup the related resources and you don't need this ridiculous flag.


>I know this is not required, but it helps on loading and unloading the driver,
>thanks to that, spam of pin-get dump is not slowing the driver load/unload.

? Could you plese draw me a scenario how such thing may actually happen?

Thanks!


>
>>
>>>+	mutex_destroy(&pf->dplls.lock);
>>>+}


[...]
