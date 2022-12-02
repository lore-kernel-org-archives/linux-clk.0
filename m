Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8F6C4321E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 12:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbiLBMsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 07:48:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232971AbiLBMsg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 07:48:36 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378139E46B
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 04:48:35 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id gu23so11274421ejb.10
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 04:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AT0KbpDr/o1zMwkliKr6eks9jc+exErBv7eT8T8pj78=;
        b=skePfRc3JK5U9CKJh6ersO7UP25S5G4SHdxxFzsJKpzlVQ6hGv2q5VOYiRx7WmnXpn
         BNQauBNM0e46G/mWjMEC4+iipBqfouArZ9uQn3UrTbUkmPlwP435V8kiNz/mwxgycyxN
         +m4zeDDo3DJcdntArFveir7heK1/rPbaGLWbLqD6rebzjagzRvUbNM7JEZ4ym/6EywKF
         KMksm8dbbhmDqTTSz5ACVsUV2c3gk9dgmrRyhicQFUDqUqAzTrWl4V1t56gSOz6EDaar
         g+RUMMS89wnVhdrX3R4LkkYLWAm4Kq2Z1ocbt9kO4n7i0CeeEV6iwCb3VKeguH1SbKbT
         e9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT0KbpDr/o1zMwkliKr6eks9jc+exErBv7eT8T8pj78=;
        b=OYSlNIGwJ5yzA1bFUzLNKt/lFT6PJRNrUqE4iCJrXSxDy7tJ8Q+DvqLwHKBWu7JoAe
         MAMMH1Oia/NqlWmH0QYap5qfQ4mlpdrjKFGc4N6YAO1VF9wI/OsuCqL9Ti3wgngk2mCi
         sP7a+0WFSgymy9m9Wo5WETlF5fp/MJ+sx994C+k0aoWXKmjLiG9w1LUs3BBenPXsHeh7
         Tq9RsjeEqbrYhhOKjKdwPuDuNzheisbgvy8hPa8pFgxdgujKpuc7VqZ56YsFzXY5BAow
         4dXwsYB54+xF58Q2Ca8rmwEny+UzAyWxnOKfPtTfl+YFHPJtAA7sSq9SKVTxNIYsT4hY
         96TA==
X-Gm-Message-State: ANoB5pl4qZusRCuh5OoQex7fr/D1jN+f7c8zqoqUcU4vnUGCVDCsobSR
        zUihHN6/Z1utD5892w08HHG9oQ==
X-Google-Smtp-Source: AA0mqf7jWlSapASGV7QpFArGzZKGyztzyAmsT17+Oylni66HWxNUNyk9jUexCfpd8FjM1Nw6MdfrUg==
X-Received: by 2002:a17:906:1ecf:b0:7ad:902c:d1d6 with SMTP id m15-20020a1709061ecf00b007ad902cd1d6mr47737298ejj.143.1669985313640;
        Fri, 02 Dec 2022 04:48:33 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id ky1-20020a170907778100b0072a881b21d8sm2959163ejc.119.2022.12.02.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 04:48:32 -0800 (PST)
Date:   Fri, 2 Dec 2022 13:48:31 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vfedorenko@novek.ru>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Vadim Fedorenko <vadfed@fb.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v4 4/4] ptp_ocp: implement DPLL ops
Message-ID: <Y4n0H9BbzaX5pCpQ@nanopsycho>
References: <20221129213724.10119-1-vfedorenko@novek.ru>
 <20221129213724.10119-5-vfedorenko@novek.ru>
 <Y4dPaHx1kT3A80n/@nanopsycho>
 <DM6PR11MB4657D9753412AD9DEE7FAB7D9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657D9753412AD9DEE7FAB7D9B179@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Dec 02, 2022 at 12:27:32PM CET, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Wednesday, November 30, 2022 1:41 PM
>>
>>Tue, Nov 29, 2022 at 10:37:24PM CET, vfedorenko@novek.ru wrote:
>>>From: Vadim Fedorenko <vadfed@fb.com>

[...]


>>>+static int ptp_ocp_dpll_get_attr(struct dpll_device *dpll, struct
>>dpll_attr *attr)
>>>+{
>>>+	struct ptp_ocp *bp = (struct ptp_ocp *)dpll_priv(dpll);
>>>+	int sync;
>>>+
>>>+	sync = ioread32(&bp->reg->status) & OCP_STATUS_IN_SYNC;
>>>+	dpll_attr_lock_status_set(attr, sync ? DPLL_LOCK_STATUS_LOCKED :
>>DPLL_LOCK_STATUS_UNLOCKED);
>>
>>get,set,confuse. This attr thing sucks, sorry :/
>
>Once again, I feel obligated to add some explanations :)
>
>getter is ops called by dpll subsystem, it requires data, so here value shall
>be set for the caller, right?
>Also have explained the reason why this attr struct and functions are done this
>way in the response to cover letter concerns.

Okay, I will react there.


>
>>
>>
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int ptp_ocp_dpll_pin_get_attr(struct dpll_device *dpll, struct
>>dpll_pin *pin,
>>>+				     struct dpll_pin_attr *attr)
>>>+{
>>>+	dpll_pin_attr_type_set(attr, DPLL_PIN_TYPE_EXT);
>>
>>This is exactly what I was talking about in the cover letter. This is
>>const, should be put into static struct and passed to
>>dpll_device_alloc().
>
>Actually this type or some other parameters might change in the run-time,

No. This should not change.
If the pin is SyncE port, it's that for all lifetime of pin. It cannot
turn to be a EXT/SMA connector all of the sudden. This should be
definitelly fixed, it's a device topology.

Can you explain the exact scenario when the change of personality of pin
can happen? Perhaps I'm missing something.



>depends on the device, it is up to the driver how it will handle any getter,
>if driver knows it won't change it could also have some static member and copy
>the data with: dpll_pin_attr_copy(...);
>
>>
>>
>>>+	return 0;
>>>+}
>>>+
>>>+static struct dpll_device_ops dpll_ops = {
>>>+	.get	= ptp_ocp_dpll_get_attr,
>>>+};
>>>+
>>>+static struct dpll_pin_ops dpll_pin_ops = {
>>>+	.get	= ptp_ocp_dpll_pin_get_attr,
>>>+};
>>>+
>>> static int
>>> ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>> {
>>>+	const u8 dpll_cookie[DPLL_COOKIE_LEN] = { "OCP" };
>>>+	char pin_desc[PIN_DESC_LEN];
>>> 	struct devlink *devlink;
>>>+	struct dpll_pin *pin;
>>> 	struct ptp_ocp *bp;
>>>-	int err;
>>>+	int err, i;
>>>
>>> 	devlink = devlink_alloc(&ptp_ocp_devlink_ops, sizeof(*bp), &pdev-
>>>dev);
>>> 	if (!devlink) {
>>>@@ -4230,6 +4263,20 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct
>>pci_device_id *id)
>>>
>>> 	ptp_ocp_info(bp);
>>> 	devlink_register(devlink);
>>>+
>>>+	bp->dpll = dpll_device_alloc(&dpll_ops, DPLL_TYPE_PPS, dpll_cookie,
>>pdev->bus->number, bp, &pdev->dev);
>>>+	if (!bp->dpll) {
>>>+		dev_err(&pdev->dev, "dpll_device_alloc failed\n");
>>>+		goto out;
>>>+	}
>>>+	dpll_device_register(bp->dpll);
>>
>>You still have the 2 step init process. I believe it would be better to
>>just have dpll_device_create/destroy() to do it in one shot.
>
>For me either is ok, but due to pins alloc/register as explained below I would
>leave it as it is.

Please don't, it has no value. Just adds unnecesary code. Have it nice
and simple.


>
>>
>>
>>>+
>>>+	for (i = 0; i < 4; i++) {
>>>+		snprintf(pin_desc, PIN_DESC_LEN, "sma%d", i + 1);
>>>+		pin = dpll_pin_alloc(pin_desc, PIN_DESC_LEN);
>>>+		dpll_pin_register(bp->dpll, pin, &dpll_pin_ops, bp);
>>
>>Same here, no point of having 2 step init.
>
>The alloc of a pin is not required if the pin already exist and would be just
>registered with another dpll.

Please don't. Have a pin created on a single DPLL. Why you make things
compitated here? I don't follow.


>Once we decide to entirely drop shared pins idea this could be probably done,
>although other kernel code usually use this twostep approach?

No, it does not. It's is used whatever fits on the individual usecase.


>
>>
>>
>>>+	}
>>>+
>>> 	return 0;
>>
>>
>>Btw, did you consider having dpll instance here as and auxdev? It would
>>be suitable I believe. It is quite simple to do it. See following patch
>>as an example:
>
>I haven't think about it, definetly gonna take a look to see if there any
>benefits in ice.

Please do. The proper separation and bus/device modelling is at least
one of the benefits. The other one is that all dpll drivers would
happily live in drivers/dpll/ side by side.



>
>Thanks,
>Arkadiusz
>
>>
>>commit bd02fd76d1909637c95e8ef13e7fd1e748af910d
>>Author: Jiri Pirko <jiri@nvidia.com>
>>Date:   Mon Jul 25 10:29:17 2022 +0200
>>
>>    mlxsw: core_linecards: Introduce per line card auxiliary device
>>
>>
>>
>>
>>>
>>> out:
>>>@@ -4247,6 +4294,8 @@ ptp_ocp_remove(struct pci_dev *pdev)
>>> 	struct ptp_ocp *bp = pci_get_drvdata(pdev);
>>> 	struct devlink *devlink = priv_to_devlink(bp);
>>>
>>>+	dpll_device_unregister(bp->dpll);
>>>+	dpll_device_free(bp->dpll);
>>> 	devlink_unregister(devlink);
>>> 	ptp_ocp_detach(bp);
>>> 	pci_disable_device(pdev);
>>>--
>>>2.27.0
>>>
