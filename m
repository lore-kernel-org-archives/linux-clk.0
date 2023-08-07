Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE63FC41513
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 07:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjHGHII (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 03:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjHGHHu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 03:07:50 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E085F172D
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 00:07:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso6732925e87.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Aug 2023 00:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691392064; x=1691996864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cWWnXKOt1mBeIEynylWCqyYZNRdvBS5hxgZ4awLikYQ=;
        b=ZP2rNYEzKbJiw4/twCr06gCfoDpq1kXEI6dvZvET6awgzhG2NFhu6iJh6DPYZOiSd+
         G65bI+0KemUsir2VCkGUiYsUnCrFBCQU7G9OO6XRwMZv+uTUITopgzAEseibWMrusxmw
         0H2daFCmx0/bKK1kZmVFQO8Lse9Ru11dNVj4bIxT5MovDHvOFOCfT40GcZKt8ysiwBGd
         C4UcSOCx5grh0r5U8dS/ebAG6CoGAU42FWq0VRF3cmn6WetA332g7r2eqRbkszi2SMpV
         0VDM5rsXnpc0n3awdyb0FS+ggO6wYAUXnLi/Yszv22vnrJ/YOUa/gjVIiuXIwtdvzlJY
         nOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691392064; x=1691996864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWWnXKOt1mBeIEynylWCqyYZNRdvBS5hxgZ4awLikYQ=;
        b=Eob6HwZJzKY/IgJq3/0bWi0jTatp7w/UYQwBBxzI+5zrrBsXiZmGS8BAhkVxdeIjjB
         26O22ktg/t4F0VH7/mekANT5ulQ9259HP3HOpRlyP0AUD7d5Kw4cZA4ItjDyTA07FWt9
         M/u7HVjiT7EXWXpebDcZr40mJFue1Z9AmRnhzx8T3T4LkJ7b6OjgVsHt3+d/b7xnlpE2
         YVzf7r91g95GY4wagggFLzj4lTWxNfwJYHuggNeddLoXp6HKX8fZ68QSiH/CiZmzDxMa
         svWoXa33lZ3VYTKig1JNUXccOXNjEDnX/V8jf0C+v9SBkGCxs+I3x5wvHdyAlnN1K7RX
         nvVg==
X-Gm-Message-State: AOJu0Ywn3UBMy2/lz9zV5ZoyDjKruNYPnhTrN7b4oSCaukuNr6kZoeJG
        MMWHhnJam4dF1ohhQI5hzsJM8g==
X-Google-Smtp-Source: AGHT+IHqu92CAl5eucjDnqV8FrzoalX0QSA+DPma7ktAhbEBbnPB9ME04dfagA2jYn4ZmDIGK40XTw==
X-Received: by 2002:a05:6512:108b:b0:4fb:8bfd:32e4 with SMTP id j11-20020a056512108b00b004fb8bfd32e4mr5637893lfg.13.1691392063541;
        Mon, 07 Aug 2023 00:07:43 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id u3-20020adfed43000000b0031759e6b43fsm9531115wro.39.2023.08.07.00.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 00:07:42 -0700 (PDT)
Date:   Mon, 7 Aug 2023 09:07:41 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v2 7/9] ice: implement dpll interface to control
 cgu
Message-ID: <ZNCYPVX7p9Fe/lPY@nanopsycho>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-8-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804190454.394062-8-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Aug 04, 2023 at 09:04:52PM CEST, vadim.fedorenko@linux.dev wrote:
>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

[...]


>+/**
>+ * ice_dpll_deinit_worker - deinitialize dpll kworker
>+ * @pf: board private structure
>+ *
>+ * Stop dpll's kworker, release it's resources.
>+ */
>+static void ice_dpll_deinit_worker(struct ice_pf *pf)
>+{
>+	struct ice_dplls *d = &pf->dplls;
>+
>+	kthread_cancel_delayed_work_sync(&d->work);
>+	kthread_destroy_worker(d->kworker);
>+}
>+
>+/**
>+ * ice_dpll_init_worker - Initialize DPLLs periodic worker
>+ * @pf: board private structure
>+ *
>+ * Create and start DPLLs periodic worker.
>+ *
>+ * Context: Shall be called after pf->dplls.lock is initialized and
>+ * ICE_FLAG_DPLL flag is set.
>+ * Return:
>+ * * 0 - success
>+ * * negative - create worker failure
>+ */
>+static int ice_dpll_init_worker(struct ice_pf *pf)
>+{
>+	struct ice_dplls *d = &pf->dplls;
>+	struct kthread_worker *kworker;
>+
>+	ice_dpll_update_state(pf, &d->eec, true);
>+	ice_dpll_update_state(pf, &d->pps, true);
>+	kthread_init_delayed_work(&d->work, ice_dpll_periodic_work);
>+	kworker = kthread_create_worker(0, "ice-dplls-%s",
>+					dev_name(ice_pf_to_dev(pf)));
>+	if (IS_ERR(kworker))
>+		return PTR_ERR(kworker);
>+	d->kworker = kworker;
>+	d->cgu_state_acq_err_num = 0;
>+	kthread_queue_delayed_work(d->kworker, &d->work, 0);
>+
>+	return 0;
>+}
>+

[...]


>+/**
>+ * ice_dpll_deinit - Disable the driver/HW support for dpll subsystem
>+ * the dpll device.
>+ * @pf: board private structure
>+ *
>+ * Handles the cleanup work required after dpll initialization, freeing
>+ * resources and unregistering the dpll, pin and all resources used for
>+ * handling them.
>+ *
>+ * Context: Destroys pf->dplls.lock mutex.
>+ */
>+void ice_dpll_deinit(struct ice_pf *pf)
>+{
>+	bool cgu = ice_is_feature_supported(pf, ICE_F_CGU);
>+
>+	if (!test_bit(ICE_FLAG_DPLL, pf->flags))
>+		return;
>+	clear_bit(ICE_FLAG_DPLL, pf->flags);
>+

Please be symmetric with the init path and move ice_dpll_deinit_worker()
call here.

That would not only lead to nicer code, also, that will assure that the
worker thread can only access initialized object.

And as:
1) worked thread can only access initialized objects
2) dpll callbacks can only be called on initialized and registered objects

You can remove the check for ICE_FLAG_DPLL flag from ice_dpll_cb_lock()
as there would be no longer any possibility when this check could be
evaluated as "true".

Then, as an unexpected side effect (:O), ice_dpll_cb_lock() basically
reduces to just calling mutex_lock(&pf->dplls.lock). So you can remove
the thin wrappers of ice_dpll_cb_lock() and ice_dpll_cb_unlock() and
instead of doing this obfuscation, you can call
mutex_lock(&pf->dplls.lock) and mutex_unlock(&pf->dplls.lock) directly.

That is what I'm trying to explain from the beginning. Is it clear now
or do we need another iteration?

Thanks!


>+	ice_dpll_deinit_pins(pf, cgu);
>+	ice_dpll_deinit_dpll(pf, &pf->dplls.pps, cgu);
>+	ice_dpll_deinit_dpll(pf, &pf->dplls.eec, cgu);
>+	ice_dpll_deinit_info(pf);
>+	if (cgu)
>+		ice_dpll_deinit_worker(pf);
>+	mutex_destroy(&pf->dplls.lock);
>+}
>+
>+/**
>+ * ice_dpll_init - initialize support for dpll subsystem
>+ * @pf: board private structure
>+ *
>+ * Set up the device dplls, register them and pins connected within Linux dpll
>+ * subsystem. Allow userspace to obtain state of DPLL and handling of DPLL
>+ * configuration requests.
>+ *
>+ * Context: Initializes pf->dplls.lock mutex.
>+ */
>+void ice_dpll_init(struct ice_pf *pf)
>+{
>+	bool cgu = ice_is_feature_supported(pf, ICE_F_CGU);
>+	struct ice_dplls *d = &pf->dplls;
>+	int err = 0;
>+
>+	err = ice_dpll_init_info(pf, cgu);
>+	if (err)
>+		goto err_exit;
>+	err = ice_dpll_init_dpll(pf, &pf->dplls.eec, cgu, DPLL_TYPE_EEC);
>+	if (err)
>+		goto deinit_info;
>+	err = ice_dpll_init_dpll(pf, &pf->dplls.pps, cgu, DPLL_TYPE_PPS);
>+	if (err)
>+		goto deinit_eec;
>+	err = ice_dpll_init_pins(pf, cgu);
>+	if (err)
>+		goto deinit_pps;
>+	mutex_init(&d->lock);
>+	set_bit(ICE_FLAG_DPLL, pf->flags);

Why can't you move the flag set to the end of this function and avoid
calling clear_bi on the error path?

If you can't, please fix the clear_bit() position (should be at the
beginning of deinit_pins label section).


>+	if (cgu) {
>+		err = ice_dpll_init_worker(pf);
>+		if (err)
>+			goto deinit_pins;
>+	}
>+
>+	return;
>+
>+deinit_pins:
>+	ice_dpll_deinit_pins(pf, cgu);
>+deinit_pps:
>+	ice_dpll_deinit_dpll(pf, &pf->dplls.pps, cgu);
>+deinit_eec:
>+	ice_dpll_deinit_dpll(pf, &pf->dplls.eec, cgu);
>+deinit_info:
>+	ice_dpll_deinit_info(pf);
>+err_exit:
>+	clear_bit(ICE_FLAG_DPLL, pf->flags);
>+	mutex_destroy(&d->lock);
>+	dev_warn(ice_pf_to_dev(pf), "DPLLs init failure err:%d\n", err);
>+}

[...]


>diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
>index 2e80d5cd9f56..4adc74f1cb1f 100644
>--- a/drivers/net/ethernet/intel/ice/ice_main.c
>+++ b/drivers/net/ethernet/intel/ice/ice_main.c
>@@ -4627,6 +4627,10 @@ static void ice_init_features(struct ice_pf *pf)
> 	if (ice_is_feature_supported(pf, ICE_F_GNSS))
> 		ice_gnss_init(pf);
> 
>+	if (ice_is_feature_supported(pf, ICE_F_CGU) ||
>+	    ice_is_feature_supported(pf, ICE_F_PHY_RCLK))
>+		ice_dpll_init(pf);
>+
> 	/* Note: Flow director init failure is non-fatal to load */
> 	if (ice_init_fdir(pf))
> 		dev_err(dev, "could not initialize flow director\n");
>@@ -4653,6 +4657,9 @@ static void ice_deinit_features(struct ice_pf *pf)
> 		ice_gnss_exit(pf);
> 	if (test_bit(ICE_FLAG_PTP_SUPPORTED, pf->flags))
> 		ice_ptp_release(pf);
>+	if (ice_is_feature_supported(pf, ICE_F_PHY_RCLK) ||
>+	    ice_is_feature_supported(pf, ICE_F_CGU))

As you internally depend on ICE_FLAG_DPLL flag, this check is redundant. 


>+		ice_dpll_deinit(pf);
> }
> 
> static void ice_init_wakeup(struct ice_pf *pf)
>-- 
>2.27.0
>
