Return-Path: <SRS0=1mk2=2X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EEFC2D0DC
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 14:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C1EC20848
	for <linux-clk@archiver.kernel.org>; Thu,  2 Jan 2020 14:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sDKG3CAr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbgABOUK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Jan 2020 09:20:10 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:41838 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728288AbgABOUK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Jan 2020 09:20:10 -0500
Received: by mail-lj1-f177.google.com with SMTP id h23so40854495ljc.8
        for <linux-clk@vger.kernel.org>; Thu, 02 Jan 2020 06:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RgxG+WmZ1WulJSZKFmn0GNk9wca283ZDDHJbDWkCXBs=;
        b=sDKG3CAr49Lqwejj9r7xOCApnVYxgS1JsN93u3QI5Dhg8aQCOOL6Tzp7KmJOTfYsjw
         P7davwQqzvdp+M3E77xiytvRJS7VHu0sVUhbx3sKMUgOYIik+F9itj0hXreKYPpxQ633
         Zw2JYKibD5GBio4MVyM9mIFeco3F9s1iyOYE2NGzs3H3rSqlEf/MnkeyqpJW7wVUWnpE
         h2cHrWrz/qiYMqAaPA/Dxjl3ZmMXZGKhLwbrQv9ySC7qEqSp57i6pelQXVTY8O5vOnjM
         EOe4EH5pth0xsYKkloqGVEgCA2vnuHu71Nv/zaXl2vspMP3xKJmEnu2fdfps3aTC9fOo
         ldnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RgxG+WmZ1WulJSZKFmn0GNk9wca283ZDDHJbDWkCXBs=;
        b=MostSdjdICTTOT2VF0pDUW1UyqNduNj+LPfukVzaJKZ4qSeZrUw5xHVO6JIB7Xub6S
         77fGVxh8T58UpLh5IxfNv/UjbUbdFmV7gtm//A8GODoBevzVrP7hJYjoxnwrW2A6JuYo
         MAfg2pO7+VlJy5/2fx/6gRi/zteJWIntZpNSDfkCpu2pD/nlyYWMtfK0ANUi6TqBn8L6
         7UW2jKTIp76rLUpz5Ur4aPoxnXkdZaxYIgefrow9Jhc60Mp1CxG4Bz6umm4r9mPg3tug
         4xUqNPVg02xaIcPqF2Y+pyo07Sc4ZLPOa7fg5PEzdLyJqGLMCg57mkoPkhB7rYg8mq6a
         AkIQ==
X-Gm-Message-State: APjAAAXmCkLOenxV17wLrR3acEhbpUnK0Hphneu3z4rXPdnvx/D5s5Ij
        m1cwrirxximju4w/YOwlFbl48uqElK1V2ALcWAfZpw==
X-Google-Smtp-Source: APXvYqwmrH3NQVHj2vMFsF6xJ/oaPPkG86Qdq73ajiZhdPBisjnvtfLCzb0rqlCLqfMAlfcETG0cKPgYtV/VrfS+EhM=
X-Received: by 2002:a2e:858b:: with SMTP id b11mr43951372lji.135.1577974807599;
 Thu, 02 Jan 2020 06:20:07 -0800 (PST)
MIME-Version: 1.0
References: <029dab5a-22f5-c4e9-0797-54cdba0f3539@roeck-us.net>
 <5869f050-7b3f-b950-bfb6-5601d2b30fbd@roeck-us.net> <20200102073058.662A9215A4@mail.kernel.org>
 <63d158e4-14ce-279f-1e77-eb50cb07b465@roeck-us.net>
In-Reply-To: <63d158e4-14ce-279f-1e77-eb50cb07b465@roeck-us.net>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 2 Jan 2020 19:49:56 +0530
Message-ID: <CA+G9fYsDEQwdE559dqDBe5bq5_fcAs0QYvYx0LNYMBEn+ij2Ew@mail.gmail.com>
Subject: Re: Clock related crashes in v5.4.y-queue
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Guenter

On Thu, 2 Jan 2020 at 19:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/1/20 11:30 PM, Stephen Boyd wrote:
> > (Happy New Year!)
> >
> > Quoting Guenter Roeck (2020-01-01 19:41:40)
> >> On 1/1/20 6:44 PM, Guenter Roeck wrote:
> >>> Hi,
> >>>
> >>> I see a number of crashes in the latest v5.4.y-queue; please see below
> >>> for details. The problem bisects to commit 54a311c5d3988d ("clk: Fix memory
> >>> leak in clk_unregister()").

Please share steps to reproduce this crash.

- Naresh
