Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD6AC74A5B
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 13:54:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjCPNyU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 09:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjCPNx6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 09:53:58 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57121B951E
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 06:53:49 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso1195948wms.4
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678974827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJUkcR5TLj/pckcV8NLJv4p0N2ALJ8mExf2txWHqrmk=;
        b=wWYYJ+ypcPdJWK8mFMkmqjjTg/4tNQcs0l/VDlsiczG9njmrsHE+8e2lHla18Brgd9
         KH7eoUQG5yA5+ddWujlQEuiA1U+UbeBjJOkWb92cpyhwyt2nLoXbIItaXQ6DkpA1riAH
         71uscclX9xlwsyG59l3cAyXvVnDJKd06TT5lHUfP1WVX/V+Ef9nIpmMHoMNzkAdGgE1u
         e+IFUWiMCBhjNJ1fSBWMBn6CykaHsiGAGNrxX8P+bYwLu/vUSURlzV4k3EArtB4VIthU
         nPGwF6G/A684ROdz1Dk1ew3/Ic1YeDs5ZvIkmCtlpdOYPsKxd7/0xJubMZ+QGvzMcpWd
         FuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJUkcR5TLj/pckcV8NLJv4p0N2ALJ8mExf2txWHqrmk=;
        b=ajZmfRW3GYFBr1HDZ/f34AfGj5IV7GcrKW0bawKhUbIZUTSnWkSx9JqCunfEffPC2v
         pa1KsisXtMs1QewmIHDZHjZBzKgNvrk4rW7n/e+NVlCQJkszGoo/P0jGAWMBHrAGjfs1
         pRPqXQA4X2LnQHiZGn+KIgGU9y+s5x6jymqV9/qL1d8kaR2aQeLImah7Q9C1Q7EK8dNj
         EhoOFWyevwvqDyjQS+Pyw4zx7slEeZHBtLMfQkfhmRu/dmQ/ZzGeYPdYT2HhjMwL6Bp6
         ajO6m+ao88oyc9PsrXSd43RFpyST9p82fiuTRfyVZ4teiVcCtlAiBILfG45n8FIbhHhA
         95MA==
X-Gm-Message-State: AO0yUKUXBJM59WZoxyCShxt7GSbluG38Qc1YEotNJJuGb5n2kY1ERPac
        CaFVuAPEELr/GrhPINUmfryzyA==
X-Google-Smtp-Source: AK7set+rqXMflrFeUbInvbGJbf4bdkNqSmGD9Ehmghl2MY/AZ9NJO7HEaQFrvUB9p731GmxgmKdHZg==
X-Received: by 2002:a05:600c:35ce:b0:3e2:1368:e3a0 with SMTP id r14-20020a05600c35ce00b003e21368e3a0mr22297978wmq.18.1678974827774;
        Thu, 16 Mar 2023 06:53:47 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003ed2eb5c2dcsm5370341wmq.43.2023.03.16.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:53:47 -0700 (PDT)
Date:   Thu, 16 Mar 2023 14:53:46 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZBMfat0x+nNRtDqV@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:03AM CET, vadfed@meta.com wrote:

[...]


>+	int (*state_on_pin_get)(const struct dpll_pin *pin,
>+				const struct dpll_pin *parent_pin,
>+				enum dpll_pin_state *state,
>+				struct netlink_ext_ack *extack);
>+	int (*state_on_dpll_get)(const struct dpll_pin *pin,
>+				 const struct dpll_device *dpll,
>+				 enum dpll_pin_state *state,
>+				 struct netlink_ext_ack *extack);

Could this be rather called "state_on_device_get" or perhaps even better
just "state_get" (in sync with "prio_set/get") ?

This "od dpll" is a bit confusing, there is no such object.
We have "device" and "pin".


>+	int (*state_on_pin_set)(const struct dpll_pin *pin,
>+				const struct dpll_pin *parent_pin,
>+				const enum dpll_pin_state state,
>+				struct netlink_ext_ack *extack);
>+	int (*state_on_dpll_set)(const struct dpll_pin *pin,
>+				 const struct dpll_device *dpll,
>+				 const enum dpll_pin_state state,
>+				 struct netlink_ext_ack *extack);

[...]
