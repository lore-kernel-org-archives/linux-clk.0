Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7735C7618A
	for <linux-clk@archiver.kernel.org>; Mon, 20 Mar 2023 10:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjCTKYj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Mar 2023 06:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjCTKYi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Mar 2023 06:24:38 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677F1A5CF
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 03:24:36 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h17so9781159wrt.8
        for <linux-clk@vger.kernel.org>; Mon, 20 Mar 2023 03:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679307875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+r+Ws9THn6CGGgF4iFUCDGWb6IKHLEjNyMHSQSGlO8=;
        b=nG9TTuPuz+uZOoE6OQ4kAZeXgquf97A2dUACNYxaDnO02llmtPU4pk5B/ZQP1wlcu0
         /BIF/AKRMYPy6EoIOoRrNjp+VwUHQ6Af+hF0vAWgep+GqiEG/r+wbl4GwhmGu81kE7kb
         xzgqjPVgqoLacuzWjjm1LmwGeeuw1LRXA5q7o/EzcHQ0qKcTy1hH5HpnPJxA7Q8zIvBC
         l/29cBygTSzm2yk2PpLr2bfScGQR96IYS61iMGf/jQGFKzWIGHQyjAb/1OAkgxif1Nz3
         SAkJLL9KJ3/J3/gdUq2sxdpfBbHU2PCRF4f7abSjKz7CdaYwuGqjiC5G4TJVSUX+/RFW
         Plkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+r+Ws9THn6CGGgF4iFUCDGWb6IKHLEjNyMHSQSGlO8=;
        b=GWmc2K7N2SrTKg0yxnBLDU/a8kVyK68jvT2wiRQlQmYYWgvNumq+r6zqPx9m4H/Rdk
         7HXzlT25EQDtjYNZCr6dgpIQ7YBXJbU+GiRxguh0Hlb0s40jMWHCjTtEI19FbaIp9s8o
         DbpJl2vNZ9SnU/0CHWruJrwcoi/kFA6cVNVdIkea10t93M/qL1cOXDAYOBqzvt3n0v66
         0HWkDbL4yFZdtYWdoOJZPRi1CFAJP11ae5gucFFPrOC3BjkRaeMuN79IUpXwAMW99Pxw
         9XcedSAAy1yCh1ZGkYNeibotXWM2Yv+pgetbFuf2LAAwQqW1PBNs0MG/mEl+3cuBd7cr
         rhIQ==
X-Gm-Message-State: AO0yUKWSzTKFVL7Z9ZGeY2rtzYa+9ILnOwXvqlfSxx/RIsNnartH9rVr
        bBMKAbzl+Dz681kP/OdBLaSviQ==
X-Google-Smtp-Source: AK7set9f6rQrysSDP3kM2wqFNJh2dj49yepLBpmS2CK1LmemoN2ngd4i7NVxTEb1XHgVZqZ60K0rag==
X-Received: by 2002:adf:f8c2:0:b0:2cf:e6de:c6ab with SMTP id f2-20020adff8c2000000b002cfe6dec6abmr13631837wrq.11.1679307874756;
        Mon, 20 Mar 2023 03:24:34 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f18-20020adff452000000b002c5d3f0f737sm8564095wrp.30.2023.03.20.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 03:24:34 -0700 (PDT)
Date:   Mon, 20 Mar 2023 11:24:33 +0100
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
Message-ID: <ZBg0YTdD5E2xjBP/@nanopsycho>
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


>+static int
>+dpll_msg_add_pins_on_pin(struct sk_buff *msg, struct dpll_pin *pin,
>+			 struct netlink_ext_ack *extack)
>+{
>+	struct dpll_pin_ref *ref = NULL;

Pointless init.

[...]


>+static int
>+dpll_event_device_change(struct sk_buff *msg, struct dpll_device *dpll,
>+			 struct dpll_pin *pin, struct dpll_pin *parent,
>+			 enum dplla attr)
>+{
>+	int ret = dpll_msg_add_dev_handle(msg, dpll);
>+	struct dpll_pin_ref *ref = NULL;

Pointless init.

[...]


>+struct dpll_pin_ops {
>+	int (*frequency_set)(const struct dpll_pin *pin,
>+			     const struct dpll_device *dpll,
>+			     const u32 frequency,
>+			     struct netlink_ext_ack *extack);
>+	int (*frequency_get)(const struct dpll_pin *pin,
>+			     const struct dpll_device *dpll,
>+			     u32 *frequency, struct netlink_ext_ack *extack);
>+	int (*direction_set)(const struct dpll_pin *pin,
>+			     const struct dpll_device *dpll,
>+			     const enum dpll_pin_direction direction,
>+			     struct netlink_ext_ack *extack);
>+	int (*direction_get)(const struct dpll_pin *pin,
>+			     const struct dpll_device *dpll,
>+			     enum dpll_pin_direction *direction,
>+			     struct netlink_ext_ack *extack);


For frequency and direction, why exactly do you need to pass dpll
pointer? For set I can understand you need it to set the same
frequency/direction for all dplls the pin is connected to, but why for
get()?

[...]
