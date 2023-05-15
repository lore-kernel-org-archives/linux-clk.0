Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566B1C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 17:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243605AbjEOROc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 13:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243873AbjEOROR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 13:14:17 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0051ADD9B
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 10:12:34 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f4449fa085so43661485e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 10:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1684170753; x=1686762753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XXyT1LTgUSs+PYs2aHi9g7bS+bsT2Sf8immn5YPZM/I=;
        b=QXaaryjz7gwC2qtK8Rxrp/sFwaJKI3ptWp5sNVBMBl1umue/sdP+jMKlVLXkOfc4eV
         kZ3Zjwj8ZFp/OntulHkglOmTXUHDQOyRcKEYmeONsAXlsGIUKCH+Vs+KsmCDZK3Dg7pg
         87jGPcnao+37dXgOl5FQkOwFCAjqtUMSqDwSvZulY34RgZXNlT9kIxd4hZ0aO771Or0x
         6SdXx0F7WPjOrmbqHJrRTNP9aXCd7CdxR8WfMsBF1xaDBR19p2/FC4pmJYfEUZtu5aOZ
         3ahoZ4p6G0195A+jDSrfoprWbUksEKCVnwqTEFBX12B+9nudqTFvSOLVcdq9PkxlPZUl
         6u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684170753; x=1686762753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXyT1LTgUSs+PYs2aHi9g7bS+bsT2Sf8immn5YPZM/I=;
        b=aJG+K1fjsZdLaWqiUN5LeZ26R/Zsw5VcAy9fY+7lQx5HH+cCCI3M0pz4CgcpRc/uX3
         Z8uzK3BL1hOg/a2lWpYKvxQZPkeznUvIyhJsteVWKy9oUMY8gCSOkhYLX1F74uzKoW3q
         p624KjJjErenmClTsCOIKR+D06EbkQ+noBB0Z9TRteM908lQIT/afGzW4qciJ7jQnjNR
         lXXwq5673TmN0G5qooHA8jqn//IsxT80dU41XLV/preOX6UoSchDptNN/EGTW21X8uL+
         eZLxtqKLK4xjaDJlycQplSG6eETihDH2bIzhHDhSgi5gD46Gfcq4pYrp70AlrWROKVKd
         fJrA==
X-Gm-Message-State: AC+VfDxkStzZyrTTRuTq3iL5wYZjnWL0gfkTIRZLIXCN1eyI1FQY6A0A
        v9u4PzREJrYyyt3rYNSq4yADow==
X-Google-Smtp-Source: ACHHUZ4eMhIwBT7w1XF/fJHFKfPz/0uLX5aoUDa0kGf78PzmiGLWIUCUXXJ0QmARz8UDaF7I7TctZw==
X-Received: by 2002:a7b:c8c6:0:b0:3f4:2220:28d5 with SMTP id f6-20020a7bc8c6000000b003f4222028d5mr19288837wml.29.1684170752657;
        Mon, 15 May 2023 10:12:32 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k18-20020a7bc412000000b003f427db0015sm764wmi.38.2023.05.15.10.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 10:12:32 -0700 (PDT)
Date:   Mon, 15 May 2023 19:12:30 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
Message-ID: <ZGJn/tKjzxNYcNKU@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-6-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-6-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Apr 28, 2023 at 02:20:06AM CEST, vadfed@meta.com wrote:

[...]

>+static const enum dpll_lock_status
>+ice_dpll_status[__DPLL_LOCK_STATUS_MAX] = {
>+	[ICE_CGU_STATE_INVALID] = DPLL_LOCK_STATUS_UNSPEC,
>+	[ICE_CGU_STATE_FREERUN] = DPLL_LOCK_STATUS_UNLOCKED,
>+	[ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_CALIBRATING,

This is a bit confusing to me. You are locked, yet you report
calibrating? Wouldn't it be better to have:
DPLL_LOCK_STATUS_LOCKED
DPLL_LOCK_STATUS_LOCKED_HO_ACQ

?


>+	[ICE_CGU_STATE_LOCKED_HO_ACQ] = DPLL_LOCK_STATUS_LOCKED,
>+	[ICE_CGU_STATE_HOLDOVER] = DPLL_LOCK_STATUS_HOLDOVER,
>+};

[...]
