Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39DDC43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 01:47:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 893D2206C3
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 01:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ULsUBTXj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfECBrd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 May 2019 21:47:33 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46872 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfECBrd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 May 2019 21:47:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id j11so2033451pff.13
        for <linux-clk@vger.kernel.org>; Thu, 02 May 2019 18:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4zOgl5hUi+wW+VlTGj/XzvLKsxEjhINNU+5luXRd9xQ=;
        b=ULsUBTXjRbj5EOctsV2t62xIXVP/NhVpoMxfzRLlbRbb4FXiQ2eWnRZ0N4M0f9blUt
         L0IDu77/oFUbW6McD4H3/Dbj4nkwTanirtHuvWsCsdej3G6GAQGmcJsWvdydkCo5hzMO
         oIpxdEGJ2v6OtSga3QEc9pPp+pIEk/IsLD0Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4zOgl5hUi+wW+VlTGj/XzvLKsxEjhINNU+5luXRd9xQ=;
        b=sm/boqz3bLNe6sR/qSPIVF+TrbvKJ1yJZPapawe4HWpbm/3JK5d0LuxHgV8xBZiXsp
         z+Ami0wf70egRGi3//UpOtaI3jESW/NmlrSZk6CLImiwkTbD5Kq+847wLhagfkbTNUqy
         Doa4SrNdAjmD99aAba7pBZyPqx2jTLMMayR7O+MEs2KfogiCqF5eJMv+sSnilHgQP5g4
         h+2yiKFOuoWbq2Wqlwr/Y7sz66nWaeF6fst5q6YFo1cMIXIhW3tTQFNXCd7kUdxHUilN
         nT/affYBhcXQObbFQ5/oEsLSN8BMYLyJ/xrH7ZOnvMMX+Gc94W61l+yWDDKNwzbV7Xl1
         UkAw==
X-Gm-Message-State: APjAAAXR4fvutFojX2uDAjqYCcJtFaTFtSDY4/hTDxm7DQyVvZ6cWL7V
        yYPGmX2PvJ3FkWO/DXMgCPcgcA==
X-Google-Smtp-Source: APXvYqy08lM1CX7sM6E0+uCipR1m5Zg8/wz83oIkMafw9BZMVFGn/x0dPgZm/GonPzhY9Yao4KNqkQ==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr7401785pgk.43.1556848052256;
        Thu, 02 May 2019 18:47:32 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id a17sm517916pff.82.2019.05.02.18.47.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 18:47:31 -0700 (PDT)
Subject: Re: [PATCH 3/3] MIPS: BMIPS: add clock controller nodes
To:     Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kevin Cernekee <cernekee@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-4-jonas.gorski@gmail.com>
From:   Florian Fainelli <florian.fainelli@broadcom.com>
Openpgp: preference=signencrypt
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 mQENBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAG0MEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPokB
 xAQQAQIArgUCW382iBcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFrZXktdXNh
 Z2UtbWFza0BwZ3AuY29tjjAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2RpbmdAcGdw
 LmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29tLmNvbQUb
 AwAAAAMWAgEFHgEAAAAEFQgJCgAKCRCBMbXEKbxmoFYGB/9qN5VL6f/88+qtDaDhUKvwBgF8
 koryGCH/gw6FBW5h5hwW0m6946WnsBnqKnZ8OYr8qsCgeJewCh0BEN9rIg8SC5oU7WdcmNg5
 KTv4/V1CmBo6dQaSHA8yQoeHsrw0gQ9HK4EYjhAU60RYXxX7/LFAy0rJMLf0qGKdWW2f5EkN
 dS5GwWOrTp477WL2g+R0khhP57qpejxlMN+Mtvin52UjbAcr1PAx8Zt2rXpFIZsXVWADpZDd
 qIb6PZPdcP/lD1v5it4sTN7D27FgjvbvAgj/D3NmyOjIUsbN9ZDJDfgv431RsJ9LOd6ySaNr
 yuje7L0dbiYrcOi3CN6S+zE1UJsLuQENBFPAG8EBCACsa+9aKnvtPjGAnO1mn1hHKUBxVML2
 C3HQaDp5iT8Q8A0ab1OS4akj75P8iXYfZOMVA0Lt65taiFtiPT7pOZ/yc/5WbKhsPE9dwysr
 vHjHL2gP4q5vZV/RJduwzx8v9KrMZsVZlKbvcvUvgZmjG9gjPSLssTFhJfa7lhUtowFof0fA
 q3Zy+vsy5OtEe1xs5kiahdPb2DZSegXW7DFg15GFlj+VG9WSRjSUOKk+4PCDdKl8cy0LJs+r
 W4CzBB2ARsfNGwRfAJHU4Xeki4a3gje1ISEf+TVxqqLQGWqNsZQ6SS7jjELaB/VlTbrsUEGR
 1XfIn/sqeskSeQwJiFLeQgj3ABEBAAGJAkEEGAECASsFAlPAG8IFGwwAAADAXSAEGQEIAAYF
 AlPAG8EACgkQk2AGqJgvD1UNFQgAlpN5/qGxQARKeUYOkL7KYvZFl3MAnH2VeNTiGFoVzKHO
 e7LIwmp3eZ6GYvGyoNG8cOKrIPvXDYGdzzfwxVnDSnAE92dv+H05yanSUv/2HBIZa/LhrPmV
 hXKgD27XhQjOHRg0a7qOvSKx38skBsderAnBZazfLw9OukSnrxXqW/5pe3mBHTeUkQC8hHUD
 Cngkn95nnLXaBAhKnRfzFqX1iGENYRH3Zgtis7ZvodzZLfWUC6nN8LDyWZmw/U9HPUaYX8qY
 MP0n039vwh6GFZCqsFCMyOfYrZeS83vkecAwcoVh8dlHdke0rnZk/VytXtMe1u2uc9dUOr68
 7hA+Z0L5IQAKCRCBMbXEKbxmoLoHCACXeRGHuijOmOkbyOk7x6fkIG1OXcb46kokr2ptDLN0
 Ky4nQrWp7XBk9ls/9j5W2apKCcTEHONK2312uMUEryWI9BlqWnawyVL1LtyxLLpwwsXVq5m5
 sBkSqma2ldqBu2BHXZg6jntF5vzcXkqG3DCJZ2hOldFPH+czRwe2OOsiY42E/w7NUyaN6b8H
 rw1j77+q3QXldOw/bON361EusWHdbhcRwu3WWFiY2ZslH+Xr69VtYAoMC1xtDxIvZ96ps9ZX
 pUPJUqHJr8QSrTG1/zioQH7j/4iMJ07MMPeQNkmj4kGQOdTcsFfDhYLDdCE5dj5WeE6fYRxE
 Q3up0ArDSP1L
Message-ID: <3fb6cf9b-1c07-e897-c9dd-71cd94db9a17@broadcom.com>
Date:   Thu, 2 May 2019 18:47:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-4-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 5/2/2019 5:26 AM, Jonas Gorski wrote:
> Now that we have a driver for the clock controller, add nodes to allow
> devices to make use of it.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
