Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABB3C77B7E
	for <linux-clk@archiver.kernel.org>; Tue,  2 May 2023 13:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234345AbjEBNFs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 May 2023 09:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbjEBNFO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 May 2023 09:05:14 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F58E6599
        for <linux-clk@vger.kernel.org>; Tue,  2 May 2023 06:04:25 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bc040c7b8so4610961a12.2
        for <linux-clk@vger.kernel.org>; Tue, 02 May 2023 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683032663; x=1685624663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zPn3DQlQpedtPkPL/EH5EuLFEEfZD/b+q3i7Sa8iVbg=;
        b=lOvjK2hefDCZO/tGEaNNKxbF4M7a7dVeX+XWKPU51EH7SBuroGbQIYYcnaZZVWwiGS
         pTx5JAzRD8o5aRfLZG2u6O5KsKNenwMVUcit4ik7+1q/d2s+RFnDjZKswFWeYQzsgnup
         y4wQdUcelKcKBmTBeV028EEMyOfm+dBZV/c9QthfHMo81l6DoldKpJRYO9lh5ZP24u25
         2zdhPaACyRQHVIFGv1z87YHrnnWsMGzgnGHduI0oyKhbnDc3uems3BxqGmHvBOpMhsf3
         3AvbPqcPpnZjj6F3AXm84Rd/II14gJUMZrd21KhPj9ZhW3EebcSygOX1Ivmm2sLJr6CC
         bKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683032663; x=1685624663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPn3DQlQpedtPkPL/EH5EuLFEEfZD/b+q3i7Sa8iVbg=;
        b=lJma7kPVix89C6/o8f25DWQdNA56aSYxMBC6TOFx0uY5xDt8gOhN0RmkvjF2Ivj3dr
         MvXVdJKLFpNsOlqzeWwwKypEjmHz9Aq2IxzpxeY3Buvcfdo3gt27KEJ+JEy+sYnsnHx9
         2ln7JJ6DaFNifI+O2K+9Z/AV4ONNaQSMora9Z9nvpFJ6igAhqWC1cU1UrUydH+Ssm+3N
         1nxCh1Ffy9SbcVdnCepDMNoS1EkDMPbArIcTIIK2BXRdGlz4WmUq6dTE5Rnha03259l4
         aoHjNCak+NpnC6DrLnJJtUYFBs2LASnXS2US4dicbaSV0952AebpAq7b0yQNw87eaMMP
         IdWQ==
X-Gm-Message-State: AC+VfDzU/1Koa9/KmOnLe3VrHr5NZW59oy7dEYKkoitrONX0Jwfm9ijP
        7MdtphuOk0ZH7k/pBIMngc5vYg==
X-Google-Smtp-Source: ACHHUZ5Zt5d2uTQsVwUIETP2qMfYH7i1DMzsCi5TVhs2R0gt6/Dy9RzvwXjJXDgMbGtQSmX32sTRtQ==
X-Received: by 2002:aa7:da4e:0:b0:4fa:aee8:235f with SMTP id w14-20020aa7da4e000000b004faaee8235fmr8005088eds.9.1683032663621;
        Tue, 02 May 2023 06:04:23 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id d22-20020aa7d696000000b00504a7deefd6sm13358438edr.7.2023.05.02.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 06:04:22 -0700 (PDT)
Date:   Tue, 2 May 2023 15:04:21 +0200
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
Subject: Re: [RFC PATCH v7 0/8] Create common DPLL configuration API
Message-ID: <ZFEKVWdkDjMMhjQp@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-1-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Apr 28, 2023 at 02:20:01AM CEST, vadfed@meta.com wrote:
>From: Vadim Fedorenko <vadim.fedorenko@linux.dev>

[...]

>Arkadiusz Kubalewski (3):
>  dpll: spec: Add Netlink spec in YAML
>  ice: add admin commands to access cgu configuration
>  ice: implement dpll interface to control cgu
>
>Jiri Pirko (2):
>  netdev: expose DPLL pin handle for netdevice

Arkadiusz, could you please expose pin for netdev in ice as well?


>  mlx5: Implement SyncE support using DPLL infrastructure

[...]
