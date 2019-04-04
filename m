Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF82C4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 09:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51CE320693
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 09:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2+NZdv+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387636AbfDDJUW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 05:20:22 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33907 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387423AbfDDJRj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 05:17:39 -0400
Received: by mail-lf1-f65.google.com with SMTP id y18so1278383lfe.1;
        Thu, 04 Apr 2019 02:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pt7bDW7Pd+FsGQCRCReCr6XjGTgHePJB8Lq3kYQNsEM=;
        b=J2+NZdv+TlQmfNNfyWvEhQtoQbady34B5ox5vJamly3RiBPAO7gWWenhXcNLTtlw0k
         pPkrXf/zxJWc+4KZcMKwE4yNfm+iJ6ZBc/FeUknzQEwXsKTHWkbGNM68iT8apbubuN93
         pbk2YXsvx/jIadycwywmGJlg03IEgWzYDmmpZxbvMfHpTBuw70cMnA+Kxr6nwIfTHgeq
         7TZ05FfdmOp6+ee7VJwjKa8IR9cbulN5VFv0BrjO5K8EEGSdBiWqVujTLCjieJUSZhPB
         tLVLoMb4z91dd1l4zCe/aYKWc9yn+JfIV3c/kWrRU1dFfuUHfsjuApOtLdQARZyR3X24
         8pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pt7bDW7Pd+FsGQCRCReCr6XjGTgHePJB8Lq3kYQNsEM=;
        b=Jk9ZZfDWsXm4GFg9DD2gi4nX/ZepPxnlE2ejHDrPCBbw6j+SMnhRdy7/t40NY697Rj
         gjr/nhdU//NIxIIiS7h4OLeJypih1xdDVm75yJB53XSE/dAEhFvuCPLB9o8U8O79YH3W
         2/QXqHm1rF3m3UF/bF19/hURPgykW5Bre1gGB9BxrDot93aqQO28nUVYwPyGfMPT4R5e
         9PyFz6I8y1yCcUBQZmoiGEFUDBWKrmRdRKbLFsRB6A7imEa43n7g/B3bSGCz0jFzHgH8
         29D7+d+GpiZw0Fo3VDT0ctlLT+CVod7IKhBdVxT7vASBOmb13WRVlHtg8ALYDoNhEtSA
         SkVw==
X-Gm-Message-State: APjAAAX7CGyH147ol7V6QA/pAXag8iyDC08nef296+zAjuUlErqOyVRM
        6iGHF8+PKmaq/+7RkD9zhQ2sd1FV
X-Google-Smtp-Source: APXvYqwbMXd8ylusCELOgYNEDRhueq7FYEq4V1PFnt38IMj9Fum5LvYDKpU8/EudPJYyxtIxREzdKg==
X-Received: by 2002:ac2:4554:: with SMTP id j20mr2771778lfm.112.1554369457061;
        Thu, 04 Apr 2019 02:17:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id k15sm3860372lji.2.2019.04.04.02.17.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Apr 2019 02:17:36 -0700 (PDT)
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20190325074523.26456-1-josephl@nvidia.com>
 <20190325074523.26456-2-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6bd34a19-26e0-6bdd-ce89-4a30d35e9823@gmail.com>
Date:   Thu, 4 Apr 2019 12:17:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190325074523.26456-2-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

25.03.2019 10:45, Joseph Lo пишет:
> Add the binding document for the external memory controller (EMC) which
> communicates with external LPDDR4 devices. It includes the bindings of
> the EMC node and the EMC table of different rates.
> 
> To support high rates for LPDDR4, the EMC table must be trained before
> it can be used for runtime clock switching. It has been done by firmware
> and merged to the table that Linux kernel uses. For backward
> compatibility with the devices that had been launched on the market, like
> Shield and Jetson platforms, the bindings in the EMC table should remain
> the same. So the firmware can recognize them and merge the trained EMC
> table for the kernel.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  .../nvidia,tegra210-emc.txt                   | 605 ++++++++++++++++++
>  1 file changed, 605 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> new file mode 100644
> index 000000000000..1f6b6df6d37b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> @@ -0,0 +1,605 @@
> +NVIDIA Tegra210 SoC EMC (external memory controller)
> +====================================================
> +
> +Required properties :
> +- compatible : should be "nvidia,tegra21-emc", "nvidia,tegra210-emc".
> +- reg : physical base address and length of the controller's registers.
> +- clocks : phandles of the possible source clocks
> +- clock-names : names of the possible source clocks
> +- #address-cells : should be 1
> +- #size-cells : should be 0
> +- nvidia,memory-controller : phandle of the memory controller.
> +- nvidia,use-ram-code : boolean, indicates whether we should use RAM_CODE in
> +		        the register to find matching emc-table nodes
> +

The "interrupts" property is missing. You could use the CLK handshake event to wait for the clock rate change completion instead of polling the register if you didn't rely on the downstream binding, see T20 driver for the example. BTW, I'm wondering if you're going to push other downstream bindings to upstream.. apparently EMC won't be the only binding that that could diverge from the upstream and then it's not obvious whether the locked-down variant of T210 is supportable by upstream at all.
