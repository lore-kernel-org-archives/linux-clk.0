Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA70FC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 07:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiJKHaG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Oct 2022 03:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJKHaF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Oct 2022 03:30:05 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4150017E29
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 00:30:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j7so20204692wrr.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65DZPGeOMiG51jD3mC3VwJN9blhX58ex8VFolpch4hE=;
        b=eJznDTW89xs0tH9NNiWgz4BRsc58OVzipL7hFrU2DWFuSi4xUmlEIubFxEkAnb6fpA
         9HnTByyhgdw5KAkZDkxRQmL0EFB9mlzNR29wsekOYm3Jb5fahYBMqaRD3aafym63fnlg
         hDKqmyBMaLvlr10OJR+8Z6N9SEaowHUcW2UDFsPT0LqNnqY7HzO0pUclyY83YeezW7df
         99fpdOqvLp3+yCsZ0y6sTut7k/OzZrYtnvX7ZTSLpB0Z7z0P8GcRDQrQXuJGETOSr3ih
         pVfBqNJ112LKYpGPoOeFyUQksOnlONlT1kJ9Ymrj2olY1mVHca9VDa848izmOZRDp5Ks
         dk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65DZPGeOMiG51jD3mC3VwJN9blhX58ex8VFolpch4hE=;
        b=Wo3YrPtb78d3N7lXpjXOhX1jWA80qqgC7LkCJ4EJluviSBl2G8QIVSJktkkwh/COFc
         t36ZKhyOiD77GAw6laH/Ia6PU2LHboRrMAYTobb3yya+ao1bLf7Nl8bvecXp7tudczQB
         AQoBlxEEzSqyiWASOSeytdxBNJ1oxvCWb1Y3tMMTD0fmEIY+53g1vwCxk3SFUU1n3FJ9
         GG9NdNvEKkH/uxjBfRAt8XApvUFJPRhu1/2nC65BKb1hSWyXebHLuRisVeuzRW48d5QO
         KHHUq/PLuEnOzoDXdBIZhWk6kyVvuAmw2Xsm9ZJaSckHglpAtryOTy2kSOxhVOaszeJc
         UFqg==
X-Gm-Message-State: ACrzQf3wHl1WeKftizSTj+mhk8OvCmJ1aaeye8tHxugRcp9fOTGVqjgY
        07SiLagKv3NQ6phQoc2nmcyWyA==
X-Google-Smtp-Source: AMsMyM5bYwuhdM8NeI853wEqPN4PbunSgXieDpWhbciwvzZgeMyrXn6mpiGDzciyWyQsNzyubdhvXw==
X-Received: by 2002:a5d:6da2:0:b0:22e:4244:953a with SMTP id u2-20020a5d6da2000000b0022e4244953amr13449578wrs.225.1665473402497;
        Tue, 11 Oct 2022 00:30:02 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id l10-20020adfe9ca000000b002286670bafasm10535297wrn.48.2022.10.11.00.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 00:30:01 -0700 (PDT)
Date:   Tue, 11 Oct 2022 09:30:00 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 6/6] ptp_ocp: implement DPLL ops
Message-ID: <Y0UbeHfxJvBUc2N/@nanopsycho>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-7-vfedorenko@novek.ru>
 <Y0Q9Xcf92OpWPJGW@nanopsycho>
 <a8631728-a76a-41b3-0f88-413c3d7a1b2e@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8631728-a76a-41b3-0f88-413c3d7a1b2e@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Oct 10, 2022 at 10:14:20PM CEST, vfedorenko@novek.ru wrote:
>On 10.10.2022 16:42, Jiri Pirko wrote:
>> Mon, Oct 10, 2022 at 03:18:04AM CEST, vfedorenko@novek.ru wrote:
>> > From: Vadim Fedorenko <vadfed@fb.com>

[..]


>> 
>> This hunk should not be here.
>> I commented this on the previous version. Btw, this is not the only
>> thing that I previously commented and you ignored. It is annoying to be
>> honest. Could you please include the requested changes in next patchset
>> version or comment why you are not do including them. Ignoring is never
>> good :/
>> 
>Sorry for that. This version of patchset was issued to add visibility to the
>work done by Arkadiusz and to provide documentation (or at least part of it).
>I will definitely address the comments in the next spin.

NP, thanks!
