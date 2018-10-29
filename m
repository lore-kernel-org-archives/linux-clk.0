Return-Path: <SRS0=SMsi=NJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B1FC2BC61
	for <linux-clk@archiver.kernel.org>; Mon, 29 Oct 2018 08:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89D1E2080A
	for <linux-clk@archiver.kernel.org>; Mon, 29 Oct 2018 08:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="bgtfFerz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89D1E2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbeJ2QyN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Oct 2018 12:54:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34476 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbeJ2QyM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Oct 2018 12:54:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id g8-v6so3939717ljk.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Oct 2018 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ajaYwJF4Ljrrll4IuoXvlD3RjAFhr9gdHOnHhXAu5Zs=;
        b=bgtfFerzqxC6ZUuW/O5tRqis/zoiuS3TRapqRabfRAjRT6CbGF3xgSXW/A9SlH2G4O
         s/JXPY7DoPAYN0uosA05sDINjNfda8s2Nq6OapQWkAyjEuyKBqs10HB7CSvEe14F5iEW
         ZroMXJabEv34xiq5PH9zA7msP+7mqsRx2TqRJCOjq5I6oYTP/WDWWSzIYrjCkIl2ptTz
         UX4P25hpz71nbGq1MgfQfwCnRO64i/GrEXANeX6hTTT/fGunYPdkCMCIb217u0ypIPrm
         SPg9tGHE5M7ql0UsRWXrROLk3cCNHkiWOvY98Iuzbl6d1fjcwl3/ULZmjj0krWyOOi5K
         iQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ajaYwJF4Ljrrll4IuoXvlD3RjAFhr9gdHOnHhXAu5Zs=;
        b=cVW0EIcY3bwUuk2LXBafarj+2oNSl2nmgd/2nqcYUWUZPjhs2OV/UFHi47dtF7ikkK
         5rAYqgDaf/hfdA6cem3xGgQYqGmJkLankOJj1lyQdeR26kWkVj/+5YojE3QwM2zmoYu2
         OLxB2i+tj6JOld51nGXEZpu8+2OILjPmtSnBXMIFBnT5rQc17oZf1DkXBCowxboJFgEO
         cMFW+YGj/xXzzubWm9ckJKkmEkg4gpJtRekBrYNM6CuECpAKZJS7v8hKQC/UqaPMIqHr
         ot442y6LVdoDm0Mxks2NABKFGIUHv/wZr4qxWd8NYDfTwXlOHkEfQKbR6FYI6EqJpPcQ
         zhLQ==
X-Gm-Message-State: AGRZ1gLJJhkerdJrU9jxLiaxTXJcwuljIaoxHClYZqaHmRRpUscYTDGW
        N5X3S3MlP9QxJ+y15/O0IkKV/A==
X-Google-Smtp-Source: AJdET5cKauyhWO1h2ZqTBuRWJK5O+Kd2QrHv5LHiQChZveprNqHnA11mW3b1cYjhThIm2NJUoLJRTQ==
X-Received: by 2002:a2e:215a:: with SMTP id h87-v6mr9407080ljh.102.1540800398714;
        Mon, 29 Oct 2018 01:06:38 -0700 (PDT)
Received: from [192.168.0.126] ([31.173.80.69])
        by smtp.gmail.com with ESMTPSA id c22sm2922682lfd.88.2018.10.29.01.06.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Oct 2018 01:06:37 -0700 (PDT)
Subject: Re: [PATCH] clk: boston: fix possible memory leak in
 clk_boston_setup()
To:     Yi Wang <wang.yi59@zte.com.cn>, paul.burton@mips.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhong.weidong@zte.com.cn
References: <1540800277-24524-1-git-send-email-wang.yi59@zte.com.cn>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5484fe07-5909-dc67-5de6-72e878060a54@cogentembedded.com>
Date:   Mon, 29 Oct 2018 11:06:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1540800277-24524-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello!

On 10/29/2018 11:04 AM, Yi Wang wrote:

> 'onecell' is malloced in clk_boston_setup(), but not be freed

    Is not freed.

> before leaving from the error handling cases.
> 
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
[...]

MBR, Sergei

