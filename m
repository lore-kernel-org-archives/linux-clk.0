Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4F1EB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 13:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjGTNrO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 09:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjGTNrO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 09:47:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4098198D
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 06:47:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso1301802e87.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1689860831; x=1690465631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVQGxFKlfgvd3VgDJEnXjzUdWaSsAReBgjpvdov+jhs=;
        b=21MChUUGBb0WwryxfPLpZgpJWbB5rRG7GM6BFwLBKbhLAD7Yu8Pi2gEenpI6yP8FiM
         6LiA/doc/BnYRhiqqygMNee6nID2+hu+F3Vt0yWQKku0yEe17hKzHHGftDYmD+IogYIQ
         4T4Dsv7lSS0M1pPUk5IGDXQ7K7c7S573zyIoJFAT9j+Hx7WBwM1Mri77RZS7R2pr55Vb
         tPgL1fMzGO6zMBwB2zF8PVwXNah1GD+xoBamrnCWppOLAmNs185bSaopRTU7G7dOZGrX
         mgVsFvvW5OyF+OMEkOumh6vU3H36DmS8ENoSPavNHOSWlOmOmnCrllP44vKncirB+dWh
         kHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860831; x=1690465631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVQGxFKlfgvd3VgDJEnXjzUdWaSsAReBgjpvdov+jhs=;
        b=Nyp7iD/Cf5n45n7BIFDizqT/PjDG7CWDJtLz+ngvZUncHQ6i6CpNlk2qtUXheV3mwr
         fyeDom47k48TgUagimYp9mrGHA9UWC6CIcQ3bm7lWz23HvykjMbe5jdrUctoj0RVyaYi
         2KyHLA/IOi7ZCgrzUywRzTT5MUIwsXtVPE/k9xA7hQH8oAL3pOWj20JBOsqMTXy5AKcq
         dBDo843TffogAE12KpdtczFqpQLag5qUSYVWTV6bPhaVuZqeVCSQTcLZwEnodCTpF0MO
         m8NDnUlJ4vOX/h3nGZlVN5HYjs6bM8jWuL6WS2ngKwpCKjOU2ap7fwOqmRwkcDgfXcVe
         THWw==
X-Gm-Message-State: ABy/qLZhvBPUFq9GMB9z9iBGSpFj/Wo6mMm28gPfuxr4I8oIvibOVINZ
        FPvshtik41cbLOmliP1aLs5H2Q==
X-Google-Smtp-Source: APBJJlEEZek5KRIa6bcSu2bM4KceJ2zX4pqJrmYY6RzzI6w3lkw/D+goyhKA17ZLHUk+OgVUe4/qBQ==
X-Received: by 2002:a2e:9416:0:b0:2b6:d495:9467 with SMTP id i22-20020a2e9416000000b002b6d4959467mr1887156ljh.6.1689860830793;
        Thu, 20 Jul 2023 06:47:10 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709063fd000b009894b476310sm717794ejj.163.2023.07.20.06.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 06:47:10 -0700 (PDT)
Date:   Thu, 20 Jul 2023 15:47:09 +0200
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
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH net-next 03/11] dpll: documentation on DPLL subsystem
 interface
Message-ID: <ZLk63Uj8a9053BVa@nanopsycho>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-4-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720091903.297066-4-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, Jul 20, 2023 at 11:18:55AM CEST, vadim.fedorenko@linux.dev wrote:
>Add documentation explaining common netlink interface to configure DPLL
>devices and monitoring events. Common way to implement DPLL device in
>a driver is also covered.
>
>Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>---
>RFC v9->v0:
>- fix muxed get-pin command respond example
>- fix typos
>- describe DPLL_MODE_FREERUN

Yet, there is no mention of "freerun" mode at all :/ Could you please
add it as you state here?
