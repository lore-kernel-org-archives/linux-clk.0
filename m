Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50312C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 16:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiJLQwB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 12:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiJLQwA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 12:52:00 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B0AE0729
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 09:51:57 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a67so15916831edf.12
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/eHg9l9Spros3WG/ZoZz0uKFq6WrSdE+qNQJXriOHqA=;
        b=c/1n3aEQ9AR831fFKEu+GD/Z48ZlJ4p4BzvRu3U8YijRH1RIoa4IqS7Ou0TAkS/Zvy
         mpF9Pze1sLPLi4aQvrr+rp86WQUDyL3oAOfi+Bz5aKZyPzG7Fw/OUuVOg1zUh1ePFTE9
         mD7YN3DeKK93NhqCCvoa1otU0ULGVlkeMZOry2oCHnV1QkZV+l1intUptitH5zxcE6r6
         6v49skDRKGiIZbQFWrPJlmsYkRoCNIW04TBaLC3ti4LxKEBsaP8z1h5xd3JluzNo+tcX
         MpyAOPIKO1WcWkwglAmv6BJAfM5yNeEM6BlpWcOyn7Pcd6Mk18RIpZR3aUeGTz/3L5mF
         3oaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eHg9l9Spros3WG/ZoZz0uKFq6WrSdE+qNQJXriOHqA=;
        b=LVuyCs+F5yjptzHI3RtAEtM/8zqER3uoBEXfdMmgUDQHw3KD5Rbchi5iB30YTSxPVQ
         EvsW1m917xjp05BLxaRzW8VqnuIDRldfXM/NVXN704gCrwHeomravZ1m6wA6wboHgw8B
         zUntog8amfxLNeklZMYUysmDHcwU1Br3XRih/4Xb1fjKkvYoqkwX/rGKevQYNzMk9Crp
         FiWg7Z3edO1ngdZ8+/t9ayas1LxXCztNnxQL4zWjb+mY5FCOm1fFZlegXb6/+QGLwdDt
         DpdM4+o4Gz66c0fXLJJENOpjwTC7b3wfDd80FZ0NXgzP0oI4jAnDURg+6Kz4pMH53yGV
         yzUg==
X-Gm-Message-State: ACrzQf0hv4RgYjk6+yFs9UdlgPEP+IRpHjKHzYJZn5wKd3V7lQQb9R8F
        ZGuhEuybJFE7+TJArO6/U6+fVA==
X-Google-Smtp-Source: AMsMyM5G52U+lKCyotcswU3vFbTXFMyAFRfXefx3vsVFvJjPIBcrqn865PhADCDanoZOofnJnAbtjA==
X-Received: by 2002:a05:6402:430a:b0:459:a049:76da with SMTP id m10-20020a056402430a00b00459a04976damr27455131edc.272.1665593516318;
        Wed, 12 Oct 2022 09:51:56 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id u18-20020a1709061db200b00782fbb7f5f7sm1530624ejh.113.2022.10.12.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:51:55 -0700 (PDT)
Date:   Wed, 12 Oct 2022 18:51:55 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 1/6] dpll: Add DPLL framework base functions
Message-ID: <Y0bwq4YyeWsODPjv@nanopsycho>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-2-vfedorenko@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010011804.23716-2-vfedorenko@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Oct 10, 2022 at 03:17:59AM CEST, vfedorenko@novek.ru wrote:
>From: Vadim Fedorenko <vadfed@fb.com>
>
>DPLL framework is used to represent and configure DPLL devices
>in systems. Each device that has DPLL and can configure sources
>and outputs can use this framework.
>
>Signed-off-by: Vadim Fedorenko <vadfed@fb.com>
>Co-developed-by: Jakub Kicinski <kuba@kernel.org>
>Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>---

[..]

>+enum dpll_genl_status {
>+	DPLL_STATUS_NONE,
>+	DPLL_STATUS_CALIBRATING,
>+	DPLL_STATUS_LOCKED,
>+
>+	__DPLL_STATUS_MAX,
>+};
>+#define DPLL_STATUS_MAX (__DPLL_STATUS_MAX - 1)
>+

[..]

>+
>+/* DPLL lock status provides information of source used to lock the device */
>+enum dpll_genl_lock_status {
>+	DPLL_LOCK_STATUS_UNLOCKED,
>+	DPLL_LOCK_STATUS_EXT_1PPS,
>+	DPLL_LOCK_STATUS_EXT_10MHZ,
>+	DPLL_LOCK_STATUS_SYNCE,
>+	DPLL_LOCK_STATUS_INT_OSCILLATOR,
>+	DPLL_LOCK_STATUS_GNSS,
>+
>+	__DPLL_LOCK_STATUS_MAX,
>+};
>+#define DPLL_LOCK_STATUS_MAX (__DPLL_LOCK_STATUS_MAX - 1)

In addition to what I wrote in the previous reply where I suggested to
have lock status independent on type or source, I think we should merge
"status" and "lock status" to one attr/enum. Or any reason to have these
separate?

