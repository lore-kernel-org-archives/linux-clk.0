Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14C5C38142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 13:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjAaNAt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 08:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbjAaNAs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 08:00:48 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DAB4B4A8
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 05:00:46 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id m2so40881047ejb.8
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 05:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvFGhirlXijtNOZVXfXDAiOxlAZVhk9ncPe0r93An+w=;
        b=Tu2JOFcQvjdgRhZzYClkhIk3kfhn6/JsUfo3HbKO+prLqsIKjO0dcLV0VGsKHdAB8p
         lqk4GLSowY4ZANhK9Qt57j5AwXrzY3+79Y1+wjIsaAuVRpf7zJexCfBNy11m05+i+pVb
         o/APigiZgcXPqAIK+NzssJ1nAgJDgTVTD/zghDBA4sW0sohttmQ3DoxkAkhRLz0QYK/M
         REqqf9NbclZd68vOGZ7wdYMK73eQjvNvJ5Fa5zlS5jAl3Z2SAqNsj3K54Tv6jOF/oZvx
         D9X+T6kageEGDM9/qBMpSRzroHDBmjd+CmHKdi3HJC2a8ofjktoOZ66zElytxTfRMruJ
         cw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvFGhirlXijtNOZVXfXDAiOxlAZVhk9ncPe0r93An+w=;
        b=dm6O7YLhsaYPuPYU/CtWmByk0hdok8meEroQ2jD+f1sXC0mteQYnIe0BF6FVV3reYp
         XwLNyHaH6HLDE9R0bbwxqNoDhMqX/1CEN1vr7mgHe31spggYI9/9q+WmpBn+GFIyA1LD
         tJG8RAZF4VlklPCi5X+yjKa3FEpe3utzyY6WlTOBw27PW9hyfIdfdDM1M00UJDvqHP+L
         01NzSvGWsRKtvdK3dqU+Aqgdul5QCAdm8XY97vF0MxsZdfv7e8QHSa420Qvg1qMNp+Cz
         s4K37ezzp71IN/+NpDAGvNf7dz2UQlpPovojR4I7xuXR30eDOzUN07jY5DFrfZ1bGmKf
         XwXg==
X-Gm-Message-State: AO0yUKXoTYd8sA2zysmTTxVQpNFc6c/OAWNNNk7TrUzRSAlclBCPnE1k
        oBYac/4d2FlymA2EDp/kMZi2XQ==
X-Google-Smtp-Source: AK7set+2jAUBWn4UhnZwVWL0Tg3XiQE+OJZtklAkgdgU97jL0HMMp2Uob2oie+addp+Olc4LFy+/2w==
X-Received: by 2002:a17:907:7b9c:b0:886:7eae:26c4 with SMTP id ne28-20020a1709077b9c00b008867eae26c4mr12260121ejc.5.1675170045157;
        Tue, 31 Jan 2023 05:00:45 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id n23-20020a1709065e1700b0088b93bfa782sm1434211eju.176.2023.01.31.05.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 05:00:44 -0800 (PST)
Date:   Tue, 31 Jan 2023 14:00:42 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [RFC PATCH v5 4/4] ice: implement dpll interface to control cgu
Message-ID: <Y9kQ+uWAYZHhqtW2@nanopsycho>
References: <20230117180051.2983639-1-vadfed@meta.com>
 <20230117180051.2983639-5-vadfed@meta.com>
 <Y8lZl+U0Bll4BAKE@nanopsycho>
 <DM6PR11MB46570EA36A31F636BFA14EC19BCC9@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB46570EA36A31F636BFA14EC19BCC9@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Jan 27, 2023 at 07:13:20PM CET, arkadiusz.kubalewski@intel.com wrote:
>
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Thursday, January 19, 2023 3:54 PM
>>
>>Tue, Jan 17, 2023 at 07:00:51PM CET, vadfed@meta.com wrote:
>>>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

[...]


>>>+/**
>>>+ * ice_dpll_periodic_work - DPLLs periodic worker
>>>+ * @work: pointer to kthread_work structure
>>>+ *
>>>+ * DPLLs periodic worker is responsible for polling state of dpll.
>>>+ */
>>>+static void ice_dpll_periodic_work(struct kthread_work *work)
>>>+{
>>>+	struct ice_dplls *d = container_of(work, struct ice_dplls,
>>>work.work);
>>>+	struct ice_pf *pf = container_of(d, struct ice_pf, dplls);
>>>+	struct ice_dpll *de = &pf->dplls.eec;
>>>+	struct ice_dpll *dp = &pf->dplls.pps;
>>>+	int ret = 0;
>>>+
>>>+	if (!test_bit(ICE_FLAG_DPLL, pf->flags))
>>
>>Why do you need to check the flag there, this would should not be
>>ever scheduled in case the flag was not set.
>>
>
>It's here rather for stopping the worker, It shall no longer reschedule and
>bail out.

How that can happen?



>
>>
>>>+		return;
>>>+	mutex_lock(&d->lock);
>>>+	ret = ice_dpll_update_state(&pf->hw, de);
>>>+	if (!ret)
>>>+		ret = ice_dpll_update_state(&pf->hw, dp);
>>>+	if (ret) {
>>>+		d->cgu_state_acq_err_num++;
>>>+		/* stop rescheduling this worker */
>>>+		if (d->cgu_state_acq_err_num >
>>>+		    CGU_STATE_ACQ_ERR_THRESHOLD) {
>>>+			dev_err(ice_pf_to_dev(pf),
>>>+				"EEC/PPS DPLLs periodic work disabled\n");
>>>+			return;
>>>+		}
>>>+	}
>>>+	mutex_unlock(&d->lock);
>>>+	ice_dpll_notify_changes(de);
>>>+	ice_dpll_notify_changes(dp);
>>>+
>>>+	/* Run twice a second or reschedule if update failed */
>>>+	kthread_queue_delayed_work(d->kworker, &d->work,
>>>+				   ret ? msecs_to_jiffies(10) :
>>>+				   msecs_to_jiffies(500));
>>>+}

[...]


>>>+/**
>>>+ * ice_dpll_rclk_find_dplls - find the device-wide DPLLs by clock_id
>>>+ * @pf: board private structure
>>>+ *
>>>+ * Return:
>>>+ * * 0 - success
>>>+ * * negative - init failure
>>>+ */
>>>+static int ice_dpll_rclk_find_dplls(struct ice_pf *pf)
>>>+{
>>>+	u64 clock_id = 0;
>>>+
>>>+	ice_generate_clock_id(pf, &clock_id);
>>>+	pf->dplls.eec.dpll = dpll_device_get_by_clock_id(clock_id,
>>
>>I have to say I'm a bit lost in this code. Why exactly do you need this
>>here? Looks like the pointer was set in ice_dpll_init_dpll().
>>
>>Or, is that in case of a different PF instantiating the DPLL instances?
>
>Yes it is, different PF is attaching recovered clock pins with this.
>
>>If yes, I'm pretty sure what it is wrong. What is the PF which did
>>instanticate those unbinds? You have to share the dpll instance,
>>refcount it.
>>
>
>It will break, as in our case only one designated PF controls the dpll.

You need to fix this then.


>
>>Btw, you have a problem during init as well, as the order matters. What
>>if the other function probes only after executing this? You got -EFAULT
>>here and bail out.
>>
>
>We don't expect such use case, altough I see your point, will try to fix it.

What? You have to be kidding me, correct? User obviously should have
free will to use sysfs to bind/unbind the PCI devices in any order he
pleases.


>
>>In mlx5, I also share one dpll instance between 2 PFs. What I do is I
>>create mlx5-dpll instance which is refcounted, created by first probed
>>PF and removed by the last one. In mlx5 case, the PFs are equal, nobody
>>is an owner of the dpll. In your case, I think it is different. So
>>probably better to implement the logic in driver then in the dpll core.
>>
>
>For this NIC only one PF will control the dpll, so there is a designated owner.
>Here owner must not only initialize a dpll but also register its pin,
>so the other PFs could register additional pins. Basically it means
>for ice that we can only rely on some postponed rclk initialization for
>a case of unordered PF initialization. Seems doable.

My point is, you should have one DPLL instance shared for muptiple PFs.
Then, you have pin struct and dpll struct to use in pin_register and you
can avoid this odd description magic which is based obviously on broken
model you have.


>
>>Then you don't need dpll_device_get_by_clock_id at all. If you decide to
>>implement that in dpll core, I believe that there should be some
>>functions like:
>>dpll = dpll_device_get(ops, clock_id, ...)  - to create/get reference
>>dpll_device_put(dpll)                       - to put reference/destroy
>
>Sure, we can rename "dpll_device_get_by_clock_id" to "dpll_device_get" (as
>it is only function currently exported for such behavior), and add
>"dpll_device_put", with ref counts as suggested.
>
>>
>>First caller of dpll_device_get() actually makes dpll to instantiate the
>>device.
>>
>
>Maybe I am missing something.. do you suggest that "dpll_device_get" would
>allocate dpll device and do ref count, and then dpll_device_register(..) call

No need for separate register, is it? just have one dpll_device_get()
function allocate-register/getref for you. Why do you need anything else?


>would assign all the arguments that are available only in the owner instance?
>Or i got it wrong?

[...]

