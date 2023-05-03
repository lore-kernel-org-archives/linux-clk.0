Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72457C7EE22
	for <linux-clk@archiver.kernel.org>; Wed,  3 May 2023 08:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjECIJb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 May 2023 04:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjECIJa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 May 2023 04:09:30 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4CB4C3D
        for <linux-clk@vger.kernel.org>; Wed,  3 May 2023 01:09:03 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f6c285d92so936491766b.3
        for <linux-clk@vger.kernel.org>; Wed, 03 May 2023 01:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683101342; x=1685693342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jFzfNEO9N0rAd0IFSTlhL/1/k8fjRgZbN+iRGB6LEKU=;
        b=lKN7VlvPrYcsCywJxCAEmjv2pVo5SdKgxV9kxVicMrTQ+TkD4FDlZpTaeSZSqVziBk
         L0apNiNKvoZFNrq7aqkxz5aT4W7OnzkBcggtyrDaTxzqSjsh/R75GM9SDtHnuCiYDeLf
         cLQiVyAbzhSyZYHrpTKOl0ADkvr+d0UL+N/lrs16ZIAdEQdNpsqP0RApBXY3Sr4yNI+l
         Fw8HiwNCb9WmNyw4WDcyoQt7lO/el8ozB6ZqltT/LFA/MdCq6ZNmX9dPTUKKw4imF3PX
         AclElk8u7kwnWmfsJMhW+lbKTgZt2KYQcfIiBzK+rn+W3bguMqU/iqCX9BXDSQzqMW57
         LmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101342; x=1685693342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFzfNEO9N0rAd0IFSTlhL/1/k8fjRgZbN+iRGB6LEKU=;
        b=IhJybnpag+dfbg2m3nT3nJ6WNQnw+cqrfJO8mhrDWOFeF/dgT6rL1X0KY/h05J7j73
         UuorCu8LKP22Z2dDY2BsCXAKSAsGVvMJpq9Ss3yptDjLZVLe00mGpCN+q2nDkbea0Ejv
         /bXICjEIbuFCRjncBi8GwDOFeYcKVVSkX74eP5Wgp4RPo0X+eudUuU9EBqeYbWRE7ESV
         CnR1iJGIPFPJ/K9Z5FRtFord8gFiPj6utQ+0WE6bYFVwlpORUxCfN/KgXEwll76WXgK7
         CoBzc8Zmqggfr0EAyNvhYznMGe7zmt4/HuU8hh7lY39qFeJ1fYkXoEW1GUkHdS6FFJ2P
         zPyA==
X-Gm-Message-State: AC+VfDwrQqY2NoAmGrZdrIibs4PLGvwkkIM4e9xF6jmAO5I4VBPkT3yO
        c5SPudPDjFc3ruJ87ItP4wyzvCDR5CmSP8ket+0=
X-Google-Smtp-Source: ACHHUZ5n2wZ9MUJaRcjAEgAzJu51k/4LrzZRMOXMfsvy1FLjJyPTF9duZadCiXNMd/IA+v5s4ajGZQ==
X-Received: by 2002:a17:907:9288:b0:953:3e29:f35c with SMTP id bw8-20020a170907928800b009533e29f35cmr2175425ejc.45.1683101341714;
        Wed, 03 May 2023 01:09:01 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id bo2-20020a0564020b2200b0050bc6983041sm416801edb.96.2023.05.03.01.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:09:01 -0700 (PDT)
Date:   Wed, 3 May 2023 10:09:00 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 2/8] dpll: Add DPLL framework base functions
Message-ID: <ZFIWnDjVQ1YrHBRg@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Apr 28, 2023 at 02:20:03AM CEST, vadfed@meta.com wrote:
>From: Vadim Fedorenko <vadim.fedorenko@linux.dev>

[...]


>+static struct dpll_pin *
>+dpll_pin_alloc(u64 clock_id, u8 pin_idx, struct module *module,
>+	       const struct dpll_pin_properties *prop)
>+{
>+	struct dpll_pin *pin;
>+	int ret, fs_size;
>+
>+	pin = kzalloc(sizeof(*pin), GFP_KERNEL);
>+	if (!pin)
>+		return ERR_PTR(-ENOMEM);
>+	pin->pin_idx = pin_idx;
>+	pin->clock_id = clock_id;
>+	pin->module = module;
>+	refcount_set(&pin->refcount, 1);
>+	if (WARN_ON(!prop->label)) {

Why exactly label has to be mandatory? In mlx5, I have no use for it.
Please make it optional. IIRC, I asked for this in the last review
as well.


>+		ret = -EINVAL;
>+		goto err;
>+	}
>+	pin->prop.label = kstrdup(prop->label, GFP_KERNEL);

Labels should be static const string. Do you see a usecase when you need
to dup it? If not, remove this please.



>+	if (!pin->prop.label) {
>+		ret = -ENOMEM;
>+		goto err;
>+	}


[...]
