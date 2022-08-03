Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5724C19F28
	for <linux-clk@archiver.kernel.org>; Wed,  3 Aug 2022 15:21:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbiHCPV4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Aug 2022 11:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237975AbiHCPVz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Aug 2022 11:21:55 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3695FDB
        for <linux-clk@vger.kernel.org>; Wed,  3 Aug 2022 08:21:54 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id c139so16750633pfc.2
        for <linux-clk@vger.kernel.org>; Wed, 03 Aug 2022 08:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6kFVTMABIBVizXQc3wXzEInC/HU3ORY+wYhC85vpaF4=;
        b=LG077KjqrabiAVdKcTlGnpAfC2Kl7mLDqSXmCDcVylAvmX5+Edam2mw8Q+3551EOEv
         G3MTV1/olWeokHdMl8wty3n6/zjid7WQLSZLAF0YpYNT8+9lSJsInmQMymXugaFvziIC
         MAxS2NJekbmmjsc3AUqr4vxRKyLKpbiL6lkrWjlZG2nnQe4lrcjchIWOstlMZTCR/QEt
         zGx/rsAVW10wLSUfT8cUIZo/9LKW2jHVKDSFrug+Ffo/k3+VmMbN4fVzF2skhbg5hIit
         qP0N2FRALThxoTXvS64o6n5AMwN6NUaVP1Fw4bih64aYsQBWWhrzXFN59vE5fQp+FjSn
         kWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6kFVTMABIBVizXQc3wXzEInC/HU3ORY+wYhC85vpaF4=;
        b=1clU4adoeAETbJRsTBk96cmDcMsGCLzKWC6jYmFzezbtVGw0GD2FPGAPIUjxbv170Y
         n/loc/CUWUjiFvjynEZ7TlypKC9xyd/DCWfJ4OcuqONp6Z+J/0gPTAlop1lhN+WqLeyM
         KFCOC5MFTZkVoSQb3mV/lQHQYzH3LPzAlPEXgiojxurWiZbgGb8E+PgoPGfCoBJszf/4
         tAHYaXzy7e3e8pMkNpE5VXs3xTful4vlRiMMgfAigem9KZkYCOxqF7/jumMwr1iaRalk
         YzirHE09KPara7eScOQPVn29UJ0xnXJAn0TH0lsoEtGNnevc+pympHXwvGpegKRaQrkM
         2ATQ==
X-Gm-Message-State: ACgBeo3v3b8gnC+yJUg/crArLpEdCjIuihjIM51pq8x4b9lZBDzY7tvs
        4th6eXO4XVTpnJRS83jIotls+Q==
X-Google-Smtp-Source: AA6agR5AogMYxoa8fOgzRsSP2Yn/QI6dXGaHEKNEMfjOsPTGZHkCFec4ln/5MYXo9J4tcbsNVXWMcA==
X-Received: by 2002:a63:5616:0:b0:41b:fb43:d04c with SMTP id k22-20020a635616000000b0041bfb43d04cmr12689971pgb.508.1659540113832;
        Wed, 03 Aug 2022 08:21:53 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902780e00b0016bfafffa0esm2095888pll.227.2022.08.03.08.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 08:21:53 -0700 (PDT)
Date:   Wed, 3 Aug 2022 08:21:51 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>, Aya Levin <ayal@nvidia.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/3] dpll: add netlink events
Message-ID: <20220803082151.14c32a57@hermes.local>
In-Reply-To: <20220626192444.29321-3-vfedorenko@novek.ru>
References: <20220626192444.29321-1-vfedorenko@novek.ru>
        <20220626192444.29321-3-vfedorenko@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 26 Jun 2022 22:24:43 +0300
Vadim Fedorenko <vfedorenko@novek.ru> wrote:

> +
> +static cb_t event_cb[] = {
> +	[DPLL_EVENT_DEVICE_CREATE]	= dpll_event_device_create,
> +	[DPLL_EVENT_DEVICE_DELETE]	= dpll_event_device_delete,
> +	[DPLL_EVENT_STATUS_LOCKED]	= dpll_event_status,
> +	[DPLL_EVENT_STATUS_UNLOCKED]	= dpll_event_status,
> +	[DPLL_EVENT_SOURCE_CHANGE]	= dpll_event_source_change,
> +	[DPLL_EVENT_OUTPUT_CHANGE]	= dpll_event_output_change,
> +};

Function tables in kernel should always be const for added security
