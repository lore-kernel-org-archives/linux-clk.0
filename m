Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907E0C43334
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jun 2022 15:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiFUPam (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jun 2022 11:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241313AbiFUPal (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jun 2022 11:30:41 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C041FA70
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 08:30:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id f8so12844058plo.9
        for <linux-clk@vger.kernel.org>; Tue, 21 Jun 2022 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OO6V8vJtdU31DJMzJLPQj0Yl71jJW7+6gQMWZVWS8Mc=;
        b=nqcFAYWrGd92KqHBlKPXcKcM8irlULNVyqN5HcgDOqEOyuDetESQ6HQnJfQ7ArM60W
         LKEIsfSwqnv5O4X2OewKcbMgAdbpwJ2p8F+5x4O4addUm4j50ifw9fl2Iovb0tRTRCG9
         +Y6Fdy8xIyilG0atYtk5uNO9NAWO5Pa/CD88gBySQOYf39IZKg414pUblCLijZFCysHY
         Poodql/NPx2PjIRTpR8qCxZRBtYSghSAzrBDSKeC+UVq7l4QOUMjyUs7qcFHd0ry/ybG
         LafCMTBAE8Ld5OcvwXmryD9Xkek57etzKeCF3jKpUA1AQv5ZZjxZ3+PMwDPxlih5IQN6
         NCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OO6V8vJtdU31DJMzJLPQj0Yl71jJW7+6gQMWZVWS8Mc=;
        b=iGeUhDtF1lk/H+aD8utRBl1CwZ17++IaHRKlurqOKP7tQt/OKJeU8UfSuCqVV6Vr2e
         VsKSuCOmXYBYbFiU+LNWiTdBvVbp9W5UMVQqhjBFgFF7AZB8fm3eYmnAnvr6DV+Nt9s8
         317+kKCxe2LgSu1d7Qcd+OQ5W9JdsNZsvaahllU+a1a4lz9Vtrubzae6syGvvSZBsxUN
         z5++UPppmvfdKulvaZ8e8D3eap/uN8M1Xof+u0g9Fi2yXI+TQ2k6rLnv7IYaFk9A5ccj
         7mmodDkt4XpjkkniafrAesudtzb+2HQ1iqQ6aU/mt2Kn+2g5v4sMZspVdkIwi0WejU4k
         0VsQ==
X-Gm-Message-State: AJIora/9FynlygjbfuKTVtw1LSu4OLXd2XB3vG4ctk6dj0CIxmgGOshq
        bcvrgPPA0S8bf4JfuB07Sdg=
X-Google-Smtp-Source: AGRyM1uUx1Y+V7DuAp4dUVEr+8l63DfRog3R8F5oHWMg+Au/ou8ILaOvnQlw04lWQ6+mRMrhgFs99w==
X-Received: by 2002:a17:90a:450c:b0:1ea:a6b8:7601 with SMTP id u12-20020a17090a450c00b001eaa6b87601mr44205159pjg.205.1655825440165;
        Tue, 21 Jun 2022 08:30:40 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902edc300b0015e8d4eb27esm10883690plk.200.2022.06.21.08.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 08:30:38 -0700 (PDT)
Message-ID: <144582e3-7acd-3231-0ef3-003b87ce19e4@gmail.com>
Date:   Tue, 21 Jun 2022 08:30:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Content-Language: en-US
To:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Guillaume GARDET <guillaume.gardet@arm.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20220428065743.94967-1-iivanov@suse.de>
 <20220526113616.aqpzj4ojseeropjz@suse>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220526113616.aqpzj4ojseeropjz@suse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 5/26/2022 4:36 AM, Ivan T. Ivanov wrote:
> On 04-28 09:57, Ivan T. Ivanov wrote:
>> Date: Thu, 28 Apr 2022 09:57:40 +0300
>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>> To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
>>   <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
>> Cc: Maxime Ripard <maxime@cerno.tech>, Dave Stevenson
>>   <dave.stevenson@raspberrypi.com>, Guillaume GARDET
>>   <guillaume.gardet@arm.com>, bcm-kernel-feedback-list@broadcom.com,
>>   linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
>>   linux-arm-kernel@lists.infradead.org, "Ivan T. Ivanov" <iivanov@suse.de>
>> Subject: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
>> Message-Id: <20220428065743.94967-1-iivanov@suse.de>
>>
>> Add missing clock required by RPiVid video decoder and provide more
>> reliable and accurate source for HDMI pixel and video encoder clocks.
>>
> 
> Hi Stephen, Michael. What is the plan for this series of patches?

Ping?
-- 
Florian
