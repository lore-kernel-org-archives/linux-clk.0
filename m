Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A23C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 17:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbiBVRcT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 12:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234305AbiBVRcR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 12:32:17 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B06511D7AE
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 09:31:51 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id u5so16243243ple.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W4Qdp9RKlfatWzVW07h+KuMMKcTDv5/X9KOx1Qu5jug=;
        b=o8+LxWPPaiiyLTfD63rrXccV6KlGgTsrezbZ7wbS7M1+Z2k7qQjofphYlX/kP4GZWD
         1BJbNTddqqCYKkQENfeuV30PMnzv2Fp7bqUsubI/qYUV72RCWPC7ZOpcjsa7ZCbzPBX5
         JIKhlVVyXzaNE9NZdXEqzJtJjEiEgpbMabG4/jyFG1Kc2vIskqb2weFhgoCx6mBgUZ5v
         Jhg0eqxPSHyxtOfaNaSMHpwLRk+LVhJ8cpZOyvz/24GeeZPjO61rtkzKIsp3BC3Pxcx9
         Cr7FuNs3e5OvCN7SGEvtZRrxdaszGu/jXtv9DJVtvbnWgjrwXNSPid09JCeeuCKvi9Kk
         IQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W4Qdp9RKlfatWzVW07h+KuMMKcTDv5/X9KOx1Qu5jug=;
        b=1hBmHnoOKteVY5FGgwerTXUbnMv/KDp6Gh4r9ym9r2KmxAhSUZ+e33uJ48V6F9zwrl
         EynZyyZdJVBYE6vDYrwncHGV2qSCZPIRunJYZmkZzQPEvo8oOQD/Kxtg/w/xEN/oMX3a
         iQoOxNsgqhABMNTScuydh+6Zfs6qiPQe7RuBxyOokMj9+VOeVdvj1cyZ9ak6LKlLJSxT
         6C+AEG62U3L43eNrsYss0/kbfl281N9dI6mcNeRl7xHn52/Laxj5Ytlv5reB9gXjgMUH
         MC7mZ3xL6wVq9MBv4zN7fJg1y9jTkF7kICrj6HjvLXeRm0rk6wRWERYoWdUY4wCEMzU6
         P6qw==
X-Gm-Message-State: AOAM533W6cgRquPuhd3OO9raeEAIUrrrI5lvOHtp2EW9qg6fKr8Ihl5t
        SOCVosiIrX895fZJpqeC+vw=
X-Google-Smtp-Source: ABdhPJxjfZ1ins9X3Tg+26F8cFNr8S+WKeFK9+R5BeWZOqcywDBcs1oXSK1JyTwx9kkbRl55TWarmA==
X-Received: by 2002:a17:90a:bd89:b0:1bc:66ed:8aed with SMTP id z9-20020a17090abd8900b001bc66ed8aedmr5271884pjr.96.1645551110527;
        Tue, 22 Feb 2022 09:31:50 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id k15sm3454955pff.36.2022.02.22.09.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 09:31:49 -0800 (PST)
Message-ID: <bf8d1b5d-bf75-b0ab-e4c6-9e4509b6d37c@gmail.com>
Date:   Tue, 22 Feb 2022 09:31:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] clk: bcm2835: Remove unused variable
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20220222140732.253819-1-maxime@cerno.tech>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220222140732.253819-1-maxime@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2/22/2022 6:07 AM, Maxime Ripard wrote:
> Since commit 8ca011ef4af4 ("clk: bcm-2835: Remove rounding up the
> dividers"), the rem variable is still set but no longer used. Remove it.
> 
> Fixes: 8ca011ef4af4 ("clk: bcm-2835: Remove rounding up the dividers")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
