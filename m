Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1718EB64DD
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 08:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjHGINU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 04:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjHGINU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 04:13:20 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE830171A
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 01:13:18 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31765792c7cso3705847f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 07 Aug 2023 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691395997; x=1692000797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLKodO4Y3hcUtlogMUbubeG9uU0/WvWNo//bCg4tNY0=;
        b=tzJVjpGeQZRB+HyRUl/cxeBbmjjpAOY6w8Cwclu6Fxy6+mCDgYJvAdKt2BwUENwXy3
         VxlMxFRi8Fv6Gzia94jeZsxwZtBoMJxLUWI2xrrgEGpXCh+l/5wmWiOir4WO+JPVjj7Q
         6r8foa4HRp6deN+LK62yvKBuq6zKywhh2F0F5m5PsHX48OMs2yD56iSftOrzJQCTlPSi
         9hvRdtTMOY6f4wvBrIR7uV+aaYpuVk9YMN0HYrcaE2+vu4NThj698t4i6/Sj2fp1YL5s
         1QUOYgH0VGAeqjI/P01Vb6MdwCN2KvkPu8gwN5le43YKVHTVtDwrtybT7bCMMOM1sFI7
         oF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691395997; x=1692000797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLKodO4Y3hcUtlogMUbubeG9uU0/WvWNo//bCg4tNY0=;
        b=QqF6N9I3QsPNxGgGcANqe9IGWkCshQe9Uj0D0Ae6b5AeO2CQMFDMLE2XYxJsAa0Amc
         ydEcZ/rjrxwpdnqu0Y1chLrNhzRJoVCoEXSQLcVIJ1xEJ5a6b63nHbXhudbPPOIlRVMM
         Q+7AcA+ZuyvyjLMYnjtS7PfQUY8KD1vGE9IOIFrc6grdi5BmL87F8mELxL6Rd4l4zr/t
         HyYqOp7nafsg6QaCTBBnLAApBgr/7P7JkEIOE8OaNf6dF6WyLQpDjqeKpYOlAA9V9GzP
         nJa0Ix066zSdg+iiBlGTrqRPGP0H34O+CWeKczDNzWvOgZT3vGOu6pRQMYEs3HfywyLx
         buxQ==
X-Gm-Message-State: AOJu0YwYoNgKoRzu/Tlu+WE7B7ACw2IXwF8NvqlGGZkvE1OK3V6imb0/
        ukPMncl9bL6pis2fwDFFKjd3lg==
X-Google-Smtp-Source: AGHT+IEh/NmRuU56UfaanfHAex34soIf/oqYQk+L702Ab/SKUXoKFvsY3POfIQesJkVPB9pf6BWhiw==
X-Received: by 2002:a5d:4f02:0:b0:317:3d78:c313 with SMTP id c2-20020a5d4f02000000b003173d78c313mr5749499wru.60.1691395997351;
        Mon, 07 Aug 2023 01:13:17 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id s9-20020adfecc9000000b0031416362e23sm9782645wro.3.2023.08.07.01.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 01:13:16 -0700 (PDT)
Date:   Mon, 7 Aug 2023 10:13:15 +0200
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
Subject: Re: [PATCH net-next v2 3/9] dpll: core: Add DPLL framework base
 functions
Message-ID: <ZNCnm9tPN1npIGUM@nanopsycho>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-4-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804190454.394062-4-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Aug 04, 2023 at 09:04:48PM CEST, vadim.fedorenko@linux.dev wrote:
>DPLL framework is used to represent and configure DPLL devices
>in systems. Each device that has DPLL and can configure inputs
>and outputs can use this framework.
>
>Implement core framework functions for further interactions
>with device drivers implementing dpll subsystem, as well as for
>interactions of DPLL netlink framework part with the subsystem
>itself.
>
>Co-developed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Milena Olech <milena.olech@intel.com>
>Co-developed-by: Michal Michalik <michal.michalik@intel.com>
>Signed-off-by: Michal Michalik <michal.michalik@intel.com>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Thanks!

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
