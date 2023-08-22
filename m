Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CA3EE4996
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 16:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbjHVQzA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 12:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjHVQzA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 12:55:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF934128
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 09:54:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EACC658A6
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 16:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4254CC433C8;
        Tue, 22 Aug 2023 16:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692723297;
        bh=UoOkKIMbPfEd0c+D0Uln/kWgFO+YI518rHnvKJm0rLE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FSW1H/InJ2afLXXYL2DTIbtdyEMvsvlV33F1+8nwiy+mPTMnZSkf5rQYOZPUIYgOJ
         KbKOR9QK5OXYgCCadIlZbHfa/ilQRbg/ewWQfBVzWcB2MlDaMnL5adQu1yRdy4ihx8
         rlyJhCqIqCnTRnUEZeSz7bllPFA5aIhZ3PFtO2sptLM9MoISuNOt6+ezpkEUAB2Wg5
         kWoGVIS0paAl0jwTiQreTve7v0Ywb5dKFSmCEJ4ZLHHSuSxqrbDDE7lHiJtOSNcnCB
         U/eNEsQZ5JYTPI5+/bhjZfm+eg+niNopnoEmKhnTdwoA9qDiXEBt6b4l4lP84Nkx+h
         W3lYaCXNI72Bw==
Date:   Tue, 22 Aug 2023 09:54:56 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next v4 2/9] dpll: spec: Add Netlink spec in YAML
Message-ID: <20230822095456.0a08b008@kernel.org>
In-Reply-To: <DM6PR11MB4657E60D5A092E9FC05BC9EF9B1EA@DM6PR11MB4657.namprd11.prod.outlook.com>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
        <20230811200340.577359-3-vadim.fedorenko@linux.dev>
        <20230814194336.55642f34@kernel.org>
        <DM6PR11MB4657AD95547A14234941F9399B1AA@DM6PR11MB4657.namprd11.prod.outlook.com>
        <20230817163640.2ad33a4b@kernel.org>
        <ZN8ccoE8X5J6yysk@nanopsycho>
        <DM6PR11MB4657E60D5A092E9FC05BC9EF9B1EA@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 21 Aug 2023 10:15:41 +0000 Kubalewski, Arkadiusz wrote:
> I prepared some POC's and it seems most convenient way to do the
> split was to add new argument as proposed on the previous mail.
> After all the spec generated diff for uAPI header like this:
> 
> --- a/include/uapi/linux/dpll.h
> +++ b/include/uapi/linux/dpll.h
> @@ -148,7 +148,17 @@ enum dpll_a {
>         DPLL_A_LOCK_STATUS,
>         DPLL_A_TEMP,
>         DPLL_A_TYPE,
> -       DPLL_A_PIN_ID,
> +
> +       __DPLL_A_MAX,
> +       DPLL_A_MAX = (__DPLL_A_MAX - 1)
> +};
> +
> +enum dpll_a_pin {
> +       DPLL_A_PIN_ID = 1,
> +       DPLL_A_PIN_PARENT_ID,
> +       DPLL_A_PIN_MODULE_NAME,
> +       DPLL_A_PIN_PAD,
> +       DPLL_A_PIN_CLOCK_ID,
>         DPLL_A_PIN_BOARD_LABEL,
>         DPLL_A_PIN_PANEL_LABEL,
>         DPLL_A_PIN_PACKAGE_LABEL,
> @@ -164,8 +174,8 @@ enum dpll_a {
>         DPLL_A_PIN_PARENT_DEVICE,
>         DPLL_A_PIN_PARENT_PIN,
> 
> -       __DPLL_A_MAX,
> -       DPLL_A_MAX = (__DPLL_A_MAX - 1)
> +       __DPLL_A_PIN_MAX,
> +       DPLL_A_PIN_MAX = (__DPLL_A_PIN_MAX - 1)
>  };
> 
> So we have additional attribute for targeting either a pin or device
> DPLL_A_PIN_PARENT_ID (u32) - which would be enclosed in the nests as
> previously:
> - DPLL_A_PIN_PARENT_DEVICE (if parent is a device)
> - DPLL_A_PIN_PARENT_PIN (if parent is a pin)
> 
> 
> I will adapt the docs and send this to Vadim's repo for review today,
> if that is ok for us.

LGTM!
