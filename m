Return-Path: <SRS0=khTx=SO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAECCC10F0E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 07:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9393B2082E
	for <linux-clk@archiver.kernel.org>; Fri, 12 Apr 2019 07:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfDLHPn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Apr 2019 03:15:43 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45429 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbfDLHPn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Apr 2019 03:15:43 -0400
Received: by mail-ed1-f67.google.com with SMTP id o26so7374940edv.12
        for <linux-clk@vger.kernel.org>; Fri, 12 Apr 2019 00:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=13wQ/vIEQV4DmOqwYRy34cBX+EyJikzd0euuned94A0=;
        b=m+y+0TozpbCllnBMNE8UH+oRWlYS6xO1rJbqfMlb0O1eNtoHuOTebgYjXyZqMWaBw+
         wq3R5BtmnQCosACjDJ89pGL8BZ5vVsmCXDAFtoftJVKtTGHD2OrQ6eJ7W7V/XMeHDUiR
         pm/arVkPn/F4SHJHM/m/Q/4BdXQrVWOBy1ZTEO0OXjQ8YFdJOrWO7nc8z6jZEFqUd20I
         LOP5o0tqIT+ux7A9ZbJZu+r1W4agLfP0KXrN+Nhy86Fc5iVzLUceboMY5xjNsqjKfPiT
         +puwIG8MOqZjuxtxh/cP8Ldyv2qZ6cQ/fIQSFHRhFX92cCv2ldc0Bt+2doHfjXUD7oNc
         tlKQ==
X-Gm-Message-State: APjAAAURIRDt7qno16oe997/ddh366aPifweET9d68BGBtYwkh9iTfEk
        Up0DE660l/PAL11RTV//UcdzVw==
X-Google-Smtp-Source: APXvYqzK/6fuXxE6062s4/zCLdjxlM/5d+nmRe3+teiJn9SHzjGZIeRDGp7rsK/mthyg0CEJe7SFRA==
X-Received: by 2002:a17:906:b202:: with SMTP id p2mr30002206ejz.266.1555053341419;
        Fri, 12 Apr 2019 00:15:41 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id g6sm11725674edp.4.2019.04.12.00.15.40
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Apr 2019 00:15:40 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: pmc_atom: Drop __initconst on dmi table
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     kbuild-all@01.org, kbuild test robot <lkp@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <201904111738.Ncw2Vf01%lkp@intel.com>
 <20190411172807.57796-1-sboyd@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4c95e469-c5fc-f043-8d54-f85ac812493b@redhat.com>
Date:   Fri, 12 Apr 2019 09:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411172807.57796-1-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 11-04-19 19:28, Stephen Boyd wrote:
> It's used by probe and that isn't an init function. Drop this so that we
> don't get a section mismatch.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: David Müller <dave.mueller@gmx.ch>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Fixes: 7c2e07130090 ("clk: x86: Add system specific quirk to mark clocks as critical")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Thank you for fixing this, I agree that this is the correct fix:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/pmc_atom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
> index eaec2d306481..c7039f52ad51 100644
> --- a/drivers/platform/x86/pmc_atom.c
> +++ b/drivers/platform/x86/pmc_atom.c
> @@ -396,7 +396,7 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
>    * Some systems need one or more of their pmc_plt_clks to be
>    * marked as critical.
>    */
> -static const struct dmi_system_id critclk_systems[] __initconst = {
> +static const struct dmi_system_id critclk_systems[] = {
>   	{
>   		.ident = "MPL CEC1x",
>   		.matches = {
> 
