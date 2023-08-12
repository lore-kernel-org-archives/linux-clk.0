Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B2CC41513
	for <linux-clk@archiver.kernel.org>; Sat, 12 Aug 2023 06:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjHLGTu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Aug 2023 02:19:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjHLGTu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Aug 2023 02:19:50 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4FA1FE6
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 23:19:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c1d03e124so339591966b.2
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 23:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691821187; x=1692425987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TjmLF1rO5TorvHBy4pxrBOw1UIR+s/EKu3iHtx+Nh50=;
        b=P+eORdmHrfUq0eOC5J81tYaBqXZES0VMhvt28KeKlsdwVdQpvsQD5ws3OtjN61fsgW
         LVoGtSoX3FefyuQTIaB8zYNKuSxbNG7Kj9xVwmjUNjHhDFvIEpmCafNB8KvndOfaHzFh
         6HOAOEQ/SJPuUqYcxHwe08SPbR8UNlIIZAEqiZj9YHsM1LzV6oYVfpwyJcb7x6BH49np
         jP1vDVspTKKs8a75LKKcYQbm7izz/USlZJCDuZi0tdgAVHZlT8TGB4+gRbN9bw7qmYMW
         u29Een9xQ3Xiq2P5NnCv95RmRDSHakE1P9iAWWH2Zb9z7WLal0BcUGtiHHfqqri66zI5
         uQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691821187; x=1692425987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjmLF1rO5TorvHBy4pxrBOw1UIR+s/EKu3iHtx+Nh50=;
        b=JOUFyAdCy35ccowyhc09XEiRJmuCq7mNcKJVpSIkjMKLes7oTwi7dmc+p+4MFNx6ME
         8JrWLgWfxlYNZo8yCYLwp5xGzPdKOdoJMQc8t1DMruK2/nxr/b4XkxSCerG6q5XF2db2
         jU0EYNOfmPCKaw6s8aIVdmbhgDO2TaDJGp6LHSus+5U8R163vWdbypWMNC0U6WeM1ysu
         DV3LkYD3Jl6QrxhKM12A/LOlYkjRQ6sDiom3pZXhGx0A5ckmR8ob6KqBsnLqnCJuq91v
         yKjYgyk+K3RBLLwo/GZl21JFpmPbE6L2x2dIpnS1eNBmKl6KG+wP3t8q/PErqkV6h5Gz
         9LSQ==
X-Gm-Message-State: AOJu0Yyb99oJVjqmgKk87w6LsOxo5evGR7h6v50iRxqXQXVl9ywrW5ej
        AkecY/I11fH+wzCpgPAJiPnN9g==
X-Google-Smtp-Source: AGHT+IEPlIXz5uM26zKwi4mc++wqqZbRXc7W1xYTx2DsLMBRS7DeeCnK6XHSPYqBnlnaUBHaDTo/VQ==
X-Received: by 2002:a17:907:7859:b0:994:4e9c:30c6 with SMTP id lb25-20020a170907785900b009944e9c30c6mr3096190ejc.57.1691821186721;
        Fri, 11 Aug 2023 23:19:46 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id g18-20020a1709067c5200b0099316c56db9sm3059967ejp.127.2023.08.11.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 23:19:46 -0700 (PDT)
Date:   Sat, 12 Aug 2023 08:19:45 +0200
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
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v4 7/9] ice: implement dpll interface to control
 cgu
Message-ID: <ZNckgQzRO6uSvnaV@nanopsycho>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230811200340.577359-8-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811200340.577359-8-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Aug 11, 2023 at 10:03:38PM CEST, vadim.fedorenko@linux.dev wrote:

[...]


>@@ -4690,6 +4694,8 @@ static void ice_deinit_features(struct ice_pf *pf)
> 		ice_gnss_exit(pf);
> 	if (test_bit(ICE_FLAG_PTP_SUPPORTED, pf->flags))
> 		ice_ptp_release(pf);
>+	if (test_bit(ICE_FLAG_DPLL, pf->flags))

This is a duplicate test as you test it as a first thing in
ice_dpll_deinit(). But nevermind this nit, let's have v4 merged
if possible.


>+		ice_dpll_deinit(pf);
> }
> 
> static void ice_init_wakeup(struct ice_pf *pf)
>-- 
>2.27.0
>
