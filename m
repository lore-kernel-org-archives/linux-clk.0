Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5E7C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 10:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiJLKod (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 06:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiJLKoc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 06:44:32 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2DFB516C
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 03:44:30 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id 13so37127031ejn.3
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 03:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcyLVkAX4C2bQHqyPJ/6XHXt/goPwBl/28hWztrqBv0=;
        b=TKT2y3gv+qWGG/MJK1wMNgFVTIagv0sWHP213Hy3PFFRoHMY4AZQF0/xkzPStK4HOe
         rARX+CTlYPua1GrCYpekAgsM5QnoYu/8T3HVwUpoqYBgkOx0UVvK8Of3VnFDlxl8l40H
         z5DX1DEQseNHiFJu8GIxLrIOdXsUozcyUPGomdWcaDtZyj+AeRXSGDLzPMztk8d4jqxt
         OB90ek0hkt11zl21l/PC13EWYcZKrTv7kiZOfJhnSKl17BHaSmXm1jM9b+oaXT0s3BDD
         5y3t5wcoXCwYGk6MTJu89wfgf+vWmd+yIGkpWAXWh+umTqRhygGpCY2oiqtcjHr4V870
         nssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcyLVkAX4C2bQHqyPJ/6XHXt/goPwBl/28hWztrqBv0=;
        b=yB5YXrZWWiT8EqZ7zvc4KiBLvTzWlaVvoRxvd7NhKfj19z+mXFdoSMTTmdeyAntfap
         eKVz02/nqGzydgdw4/27HJYu7fggz8hXg83gtjLJP4HBMHqVJ9D3322opbQukKi8Ov/K
         k+D7gHNr33jmndS1lfuDgQB0JZ1j+pEsEaoHq86EojvI+sGHKt9vNKM/lb2w5acCehnt
         t1x8JLABNfZofsqCScgwJE0Kz2aNAuVH1GoTBzIQ8KBSx2ZxHIq+YePOctuSYwGEa3VV
         mRsrznIauVB7jR9rqquVUCC8H4LnfO8c/OrHijjujNL49FzseQDrbFnRKreQoq10tE/y
         nUiQ==
X-Gm-Message-State: ACrzQf0Z1kiz7cQ3JxxEamJtCzuwr5G92JtViVnOFrJRW/7GO9QoI3w/
        TfgxD60JsSdwFIa1YxmdKY9YeQ==
X-Google-Smtp-Source: AMsMyM6Hp1pU50Y68qeyPx4K85LDY/OK4+Joj7THjBkSSu9oWVUliaNZjcL3QdHUDllKxE2qKPnhuA==
X-Received: by 2002:a17:907:1b1e:b0:783:8e33:2d1c with SMTP id mp30-20020a1709071b1e00b007838e332d1cmr21916987ejc.304.1665571469032;
        Wed, 12 Oct 2022 03:44:29 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709064bc600b0073bdf71995dsm1028050ejv.139.2022.10.12.03.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:44:28 -0700 (PDT)
Date:   Wed, 12 Oct 2022 12:44:27 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 1/6] dpll: Add DPLL framework base functions
Message-ID: <Y0aai5vJ9qswTihI@nanopsycho>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-2-vfedorenko@novek.ru>
 <Y0PjULbYQf1WbI9w@nanopsycho>
 <24d1d750-7fd0-44e2-318c-62f6a4a23ea5@novek.ru>
 <Y0UqFml6tEdFt0rj@nanopsycho>
 <576aaccb-991e-ea77-e27a-b9f640c49292@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576aaccb-991e-ea77-e27a-b9f640c49292@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, Oct 11, 2022 at 11:23:38PM CEST, vfedorenko@novek.ru wrote:
>On 11.10.2022 09:32, Jiri Pirko wrote:
>> Mon, Oct 10, 2022 at 09:54:26PM CEST, vfedorenko@novek.ru wrote:
>> > On 10.10.2022 10:18, Jiri Pirko wrote:
>> > > Mon, Oct 10, 2022 at 03:17:59AM CEST, vfedorenko@novek.ru wrote:
>> > > > From: Vadim Fedorenko <vadfed@fb.com>
>> > > > 
>> > > > DPLL framework is used to represent and configure DPLL devices
>> > > > in systems. Each device that has DPLL and can configure sources
>> > > > and outputs can use this framework.
>> > > > 
>> > > > Signed-off-by: Vadim Fedorenko <vadfed@fb.com>
>> > > > Co-developed-by: Jakub Kicinski <kuba@kernel.org>
>> > > > Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>> > > > ---
>

[...]


>> > > > +static int dpll_pre_doit(const struct genl_ops *ops, struct sk_buff *skb,
>> > > > +						 struct genl_info *info)
>> > > > +{
>> > > > +	struct dpll_device *dpll_id = NULL, *dpll_name = NULL;
>> > > > +
>> > > > +	if (!info->attrs[DPLLA_DEVICE_ID] &&
>> > > > +	    !info->attrs[DPLLA_DEVICE_NAME])
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (info->attrs[DPLLA_DEVICE_ID]) {
>> > > > +		u32 id = nla_get_u32(info->attrs[DPLLA_DEVICE_ID]);
>> > > > +
>> > > > +		dpll_id = dpll_device_get_by_id(id);
>> > > > +		if (!dpll_id)
>> > > > +			return -ENODEV;
>> > > > +		info->user_ptr[0] = dpll_id;
>> > > 
>> > > struct dpll_device *dpll should be stored here.
>> > > 
>> > > 
>> > > > +	}
>> > > > +	if (info->attrs[DPLLA_DEVICE_NAME]) {
>> > > 
>> > > You define new API, have one clear handle for devices. Either name or
>> > > ID. Having both is messy.
>> > > 
>> > That was added after the discussion with Jakub and Arkadiusz where we agreed
>> > that the device could be referenced either by index or by name. The example
>> > is that userspace app can easily find specific DPLL device if it knows the
>> > name provided by a driver of that specific device. Without searching through
>> > sysfs to find index value. Later commands could be executed using index once
>> > it's known through CMD_GET_DEVICE/ATTR_DEVICE_NAME.
>> 
>> What exacly is the name? What is the semantics? How the name is
>> generated in case of multiple instances of the same driver. What happens
>> if two drivers use the same name? Is the name predictable (in sense of
>> "stable over reboots")?
>> 
>
>The way we were thinking about name is that driver can provide it's own name
>based on the hardware values, like MAC address or any other unique
>identifier, or the subsystem will use 'dpll%d' template to create the device.
>In the first case names can be predictable and stable over reboots at the
>same time.

Well, I don't think it is in general good idea to allow the drivers such
flexibility in strings directly passed to userspace. From past
experience, it usually end up with mess which is very hard to control.
Therefore, I believe that the driver should pass info in struct of well
defined fields. Like for example THIS_MODULE, and dpll.c can get the
name by module_name()


[...]
