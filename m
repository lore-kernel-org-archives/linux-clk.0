Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0220BC001DB
	for <linux-clk@archiver.kernel.org>; Thu, 10 Aug 2023 06:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjHJGnM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 02:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjHJGnL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 02:43:11 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3693AEA
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 23:43:04 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe45481edfso5235665e9.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691649783; x=1692254583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yut2Z+a14yxMcDEXkZzdFPLfRVZ9Qb94p4k3EOO68Sk=;
        b=1jfPBNHE0y4mAOO5VPnZKKKbCc0i2D7mzRSFE7xLau88UAVMFTX/eIuLcqpU9qIQqF
         nTnGkB+J9fE04oWwgeY69dzIzbrmF5HkVCJfbjUZYUxWqtVAeGP/n/32olVrS/Kq9gP0
         AdyrPcVcNQKU7lmrCLa6Q/x6Q3yOqy5Q/MuD0TDr8+p44PerbSjSQCyClZSUb61+HMwx
         05UzRyUzxOz48sQV74+3TaRKFSxhTkC4j6c7aYvU5iK1WLq8pWDPehJlpEXtCwNaSitv
         zCuNUMe+m53dt2TPiqkgm7G1h+L+qYGH7c+p+gc5KfR+yJdkbVBMsdUgF81bOGfrXvAa
         imJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649783; x=1692254583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yut2Z+a14yxMcDEXkZzdFPLfRVZ9Qb94p4k3EOO68Sk=;
        b=QlfyqK0ftENvMBtE5ZgqYN+R1OjT/eDFJ4mQrVlyRJRMVLi3UWzaFdOKQSW5kb5Jg3
         hluAIIM30uFlL2GX1eEF8F1ynevhRW6qUrY61bXyVNAeWlCW96OSlvfPRG1C+/SPTGiu
         okKdJAq6ziVwJ9iXbHLbEa2fmPg28vNejyt3C+e9+rszS1TK4CvhuSbvriPeOs9KTa8s
         t2gUllOIF+AGuEIi/yfh6OhkZRzF+G7/0HqoYCitFEWpmHdD4OM3ZtIWZJIbCJxnPt+Z
         YHINTaotKQvHAYPNIQJktMRxVCQ4dwdrgpVHJx1tZySEh90PFxMxa3igfCH8gteVznyQ
         kpEw==
X-Gm-Message-State: AOJu0YyEeX5I7vQsiO+Hr021BhwNG6dHjhjb1ZDfFGnFvxLWhMuESrRJ
        63NRPz2qhvrIuIOpimkMOwCyUQ==
X-Google-Smtp-Source: AGHT+IEb+I3lyZINCDfzufoiEQMlOzN4F9fGAh7xM3gOhb0li7sIX6eV0rOgKMK5X7Ymolf57qXmPA==
X-Received: by 2002:a05:600c:4fd5:b0:3fe:4d66:2d4b with SMTP id o21-20020a05600c4fd500b003fe4d662d4bmr1096237wmq.28.1691649782577;
        Wed, 09 Aug 2023 23:43:02 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b0031801aa34e2sm1066784wrv.9.2023.08.09.23.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:43:01 -0700 (PDT)
Date:   Thu, 10 Aug 2023 08:43:00 +0200
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
Subject: Re: [PATCH net-next v3 7/9] ice: implement dpll interface to control
 cgu
Message-ID: <ZNSG9GwGhND0YsBr@nanopsycho>
References: <20230809214027.556192-1-vadim.fedorenko@linux.dev>
 <20230809214027.556192-8-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809214027.556192-8-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Aug 09, 2023 at 11:40:25PM CEST, vadim.fedorenko@linux.dev wrote:
>From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

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
>+	if (cgu)
>+		ice_dpll_deinit_worker(pf);
>+	clear_bit(ICE_FLAG_DPLL, pf->flags);

Clearing the flag after deinit worker somehow implicates that it needs
to be set until here. That is not true.

Please rather use test_and_clear_bit() instead of test_bit() which would
takes care of the clear alongside with the check.

With or without that.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>

[...]
