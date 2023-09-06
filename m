Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74035EB8FA5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Sep 2023 08:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbjIFIho (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Sep 2023 04:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjIFIhl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Sep 2023 04:37:41 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E62E46
        for <linux-clk@vger.kernel.org>; Wed,  6 Sep 2023 01:37:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401da71b83cso32563095e9.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Sep 2023 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1693989454; x=1694594254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pLvxqkVcGrj0lGKXFta0h+15ddHO134yyI3SPEEzAKg=;
        b=R5VMhODl9rRQwWpXjU/CKq3PcnrZcYb85/PTd9zRH+WiMVSWE1VSxB7sG/KXqxH5IA
         JchoUIXgoGxEKov7u1fK8i46eh1/+nVtVytXoHBMqnWBgXlSLBg0jvlu7aMhiNXUxu7o
         BTnNlwbw3cIX/lH8lNnpfRulMPoh1+KxTjaE5+E/hcnAyZZvKEp9DzoKxoFk5kMNWM3o
         0qn2JbblY8PXWVm6ICPqCmwe8jH2bTS2hpIweq5X13BTaiDaUEmNfAOgoIiPszzmaQnt
         NHTmtJmlbFTkP4ozmXByj7DpAbMFQa4COJVvb7ID9pqaapOllUdzJ0MvHikLXsF/d1FY
         SSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693989454; x=1694594254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLvxqkVcGrj0lGKXFta0h+15ddHO134yyI3SPEEzAKg=;
        b=dtyq5v8U3nMg3HOPCG9Z2CnfFCy0VUc/PQI5G0Ifpl5tq6L+CdKM9eM7CzMx0GGgFe
         DZPmmwuz1+55fJlhEPj2BbY8K8lKXZZ8SlI5SRha9PJCK3z/JgPGtABWGxK1Bn/9uzFm
         qTDtsemDJoBS1/suBnfLk3q0Dmx4N5S8eZE4edRgMM+zO/6HSCx47Cp5rZzOs2JdbPTW
         Trq876YW6ZLS7EL/sT3pHuk3az/AE9GB4s5wS67zVvEIOFZsLgzMb+fwMyKKwBBS3ZtJ
         FCWIO8BnSDT7ViSmTt1RcaoyPX24hh0OIRSGsS8XxknaVDaRHlisCFzWxyKruuz14mOk
         UR9A==
X-Gm-Message-State: AOJu0YwHNgkyNyCHYZx2WXQdzhGMkzAB4134DI32IWb0ViiGTBOZ2Vot
        Vph8W3mAz73zYAzQPXW++7vY3A==
X-Google-Smtp-Source: AGHT+IGgBixjKxuTBBYWuFq762q1URHhmlYUZ9/8lQFX9qon/QhhHDr/qErp5oYLmkehX7+4VS+HJA==
X-Received: by 2002:adf:ed88:0:b0:31a:e3ad:f30e with SMTP id c8-20020adfed88000000b0031ae3adf30emr1759759wro.68.1693989453796;
        Wed, 06 Sep 2023 01:37:33 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id s16-20020adfecd0000000b0030ada01ca78sm19753926wro.10.2023.09.06.01.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 01:37:33 -0700 (PDT)
Date:   Wed, 6 Sep 2023 10:37:31 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     kuba@kernel.org, jonathan.lemon@gmail.com, pabeni@redhat.com,
        vadim.fedorenko@linux.dev, linux-arm-kernel@lists.infradead.org,
        poros@redhat.com, mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, bvanassche@acm.org,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next 0/4] dpll: add phase offset and phase adjust
Message-ID: <ZPg6Sz6pgLnmQcpe@nanopsycho>
References: <20230905232610.1403647-1-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905232610.1403647-1-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Sep 06, 2023 at 01:26:06AM CEST, arkadiusz.kubalewski@intel.com wrote:
>This RFC is to start discussion over extending dpll interface
>with possibility to:
>- read a phase offset between signals on pin and dpll,
>- adjust a phase of pin's signal.

1) RFC patches should be marked as such
2) I suggest to postpone this after the first dpll patchset is merged

>
>The RFC is based on latest version of dpll interface submitted for
>net-next [1].
>
>[1] https://lore.kernel.org/netdev/20230824213132.827338-1-vadim.fedorenko@linux.dev/
>
>Arkadiusz Kubalewski (4):
>  dpll: docs: add support for pin signal phase offset/adjust
>  dpll: spec: add support for pin-dpll signal phase offset/adjust
>  dpll: netlink/core: add support for pin-dpll signal phase
>    offset/adjust
>  ice: dpll: implement phase related callbacks
>
> Documentation/driver-api/dpll.rst         |  53 ++++-
> Documentation/netlink/specs/dpll.yaml     |  33 +++-
> drivers/dpll/dpll_netlink.c               |  99 +++++++++-
> drivers/dpll/dpll_nl.c                    |   8 +-
> drivers/dpll/dpll_nl.h                    |   2 +-
> drivers/net/ethernet/intel/ice/ice_dpll.c | 224 +++++++++++++++++++++-
> drivers/net/ethernet/intel/ice/ice_dpll.h |  10 +-
> include/linux/dpll.h                      |  18 ++
> include/uapi/linux/dpll.h                 |   8 +-
> 9 files changed, 443 insertions(+), 12 deletions(-)
>
>-- 
>2.38.1
>
