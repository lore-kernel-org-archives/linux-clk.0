Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DF3C7EE43
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 07:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbjFJHco (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjFJHcm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 03:32:42 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB1F30F1
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 00:32:41 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-977e83d536fso369661366b.3
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1686382360; x=1688974360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l7M0YngHom5+WNuAaqS8ORg1O1Fioma4l8vDyZ5uMCE=;
        b=FD2ljasmKR4FCNVKlrbvbiFQif9C0mf2yzEBy4Qx3/P9vPzkYiPKpRpLusAqq+LHU7
         WwEwp25JWtWMjVCKxCuTx0YY3fuyrcT2TpwayU1x39KF3SCY/fcG2yn991d4FPSgfhla
         r0KE1RndWSboXnv9iOkGlNuoupLmUH2YEGQmtcZGgLTcODd51dqFJM+aIHbP7c2tgf71
         QGppQ21EIY9jI+eGnPzKAJaT7WZ3veTnSShuNlv/p4ciM6sXWwP8AVd0XK2uW1zlWrVD
         fcLnhGqEwqo4wbPZy2gc35QP+i9fF+Jg8QnKyIoDm39/3JVCx0GpfJ/G8E4PGnuB3/uE
         7LpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686382360; x=1688974360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7M0YngHom5+WNuAaqS8ORg1O1Fioma4l8vDyZ5uMCE=;
        b=KGDeaXSm1HwKP01NE5BqEgjtTAehkwqhUZY3/CuXOaWyqtSXnEV+LhZ7uaYEIi0M12
         XkbqLFc23cLHAUW8Yhdl/Aya1ovp6kFcmXUuN4bMt+WP6aaqjcSlx4bD04UsynCPF1qB
         ualMieSOBhIyxORS7n89BUAbI++ciyrEecpl/BDKgZGyW2/bLlMaihX52rsBwC+NgZlZ
         qF0bdLWwZUhGAoQxtDyMW76ZROI3HqKd79J6Hz9cNRLNVdq6CuKfjYgWXLOAfDTdqZMV
         XdilIezA7q69WYC9KXSIX71qcod0aLXJkGnnkVxZK+i7LTxxzGC4G5VtfslRsKSpRYAS
         PUAA==
X-Gm-Message-State: AC+VfDxkRkZnVcD/7LgRZyrBOBqbjk4m163NNX7YTW8WhR3lCK1qnZGn
        HwcnI3jPxv+BgztHwVZ/DEB8lA==
X-Google-Smtp-Source: ACHHUZ6TNnOo+D3MGLaaLLt1WOqYeiIrCCME57vcIFwab6WYjt9d7cZidy6pJt20xNgdAB/dJoH9Sg==
X-Received: by 2002:a17:907:7212:b0:978:8a30:aaf with SMTP id dr18-20020a170907721200b009788a300aafmr3607778ejc.64.1686382359799;
        Sat, 10 Jun 2023 00:32:39 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id f10-20020a170906824a00b00971433ed5fesm2223482ejx.184.2023.06.10.00.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 00:32:39 -0700 (PDT)
Date:   Sat, 10 Jun 2023 09:32:38 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     kuba@kernel.org, vadfed@meta.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, vadfed@fb.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, saeedm@nvidia.com, leon@kernel.org,
        richardcochran@gmail.com, sj@kernel.org, javierm@redhat.com,
        ricardo.canuelo@collabora.com, mst@redhat.com, tzimmermann@suse.de,
        michal.michalik@intel.com, gregkh@linuxfoundation.org,
        jacek.lawrynowicz@linux.intel.com, airlied@redhat.com,
        ogabbay@kernel.org, arnd@arndb.de, nipun.gupta@amd.com,
        axboe@kernel.dk, linux@zary.sk, masahiroy@kernel.org,
        benjamin.tissoires@redhat.com, geert+renesas@glider.be,
        milena.olech@intel.com, kuniyu@amazon.com, liuhangbin@gmail.com,
        hkallweit1@gmail.com, andy.ren@getcruise.com, razor@blackwall.org,
        idosch@nvidia.com, lucien.xin@gmail.com, nicolas.dichtel@6wind.com,
        phil@nwl.cc, claudiajkang@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org,
        vadim.fedorenko@linux.dev
Subject: Re: [RFC PATCH v8 05/10] dpll: api header: Add DPLL framework base
 functions
Message-ID: <ZIQnFqRBhmv3+SF8@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
 <20230609121853.3607724-6-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609121853.3607724-6-arkadiusz.kubalewski@intel.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Jun 09, 2023 at 02:18:48PM CEST, arkadiusz.kubalewski@intel.com wrote:
>From: Vadim Fedorenko <vadim.fedorenko@linux.dev>

[...]

>+struct dpll_device_ops {
>+	int (*mode_get)(const struct dpll_device *dpll, void *dpll_priv,
>+			enum dpll_mode *mode, struct netlink_ext_ack *extack);
>+	int (*mode_set)(const struct dpll_device *dpll, void *dpll_priv,
>+			const enum dpll_mode mode,
>+			struct netlink_ext_ack *extack);
>+	bool (*mode_supported)(const struct dpll_device *dpll, void *dpll_priv,
>+			       const enum dpll_mode mode,
>+			       struct netlink_ext_ack *extack);
>+	int (*source_pin_idx_get)(const struct dpll_device *dpll,
>+				  void *dpll_priv,
>+				  u32 *pin_idx,
>+				  struct netlink_ext_ack *extack);

I'm pretty sure I wrote this to the last patchset version as well.
You call this op from anywhere, it's a leftover, please remove it.
In ptp_ocp remove it as well and implement the state_on_dpll pin op
instead. I'm pretty sure no one tested ptp_ocp with this patchset
version otherwise this would show-up :/

[...]
