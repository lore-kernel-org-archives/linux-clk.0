Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5A1C004D5
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BA53215E4
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="KO6QKFrE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BA53215E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbeI0RsH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 13:48:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42647 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbeI0RsH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 13:48:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id y71-v6so2020876lje.9
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 04:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VroWYwCsAplQaFET11YLP7vgfd083wyjDwL6h6ftWzk=;
        b=KO6QKFrEZQNVhpHN3DMsoZK9e+oJXR9Yy1sxUCgrun4JmyuIOCc+/BUtiW/M2XkBse
         jCjPiCq+voPmfuyoi08H9ULMThuIfc4VVqq8M2GRVLPD5p6xzQVLTXprv99oKm4gHBAE
         aR1Z6HjB2GTL+nPGIj4hlLW2k6MM/Zg2FJStk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VroWYwCsAplQaFET11YLP7vgfd083wyjDwL6h6ftWzk=;
        b=F5nrhlnPp7FrPaT/2KL3VhBGZnsTyHrw7rHG/XFj9FWUeJAo8Ss6AQD09ywhuSR8xB
         PFjljLCgi4ZgiQ/EMgzH0Vt5Fkc+qCE3PlWR0FTtMuLWbzVhj12k4ZU+KaKl93/cV5gu
         8OSAQQ4L4kTjaV1dgNVIgrZ45hGfAuPZSFbTa3GjFwHqZKG5ti6lro1rsNszsYWDje6J
         fMYsIjp/RvfBdt626Ks6usjXWLyiFDclOWQYtx0OWNHt080Uqlogj+NW0fdY0ThXIG0V
         qvxKSD4sR8W3pcDBa9MscbPXYBxis31EzPGHIq6dv7xACrAEoJnBWS1i7kYl9tmXijLG
         w97g==
X-Gm-Message-State: ABuFfogLshNRg+TyAPRQCbh40W8aR8mwoSTF6C8qlzyo14kuz9F8e8ff
        EDZU4ClN4/Q2JVqEe7uEjxCx2w==
X-Google-Smtp-Source: ACcGV61FWyuDy21nMMLtassh7SedE91JTvhjNROYSQzG46wVrLlc0v4e8430Sp5YB43xWgLAdFpfSQ==
X-Received: by 2002:a2e:360c:: with SMTP id d12-v6mr7488886lja.92.1538047815599;
        Thu, 27 Sep 2018 04:30:15 -0700 (PDT)
Received: from [172.16.11.40] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g11-v6sm379245ljk.45.2018.09.27.04.30.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 04:30:14 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] devres: provide devm_kstrdup_const()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Kees Cook <keescook@chromium.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        vivek.gautam@codeaurora.org, Robin Murphy <robin.murphy@arm.com>,
        Joe Perches <joe@perches.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Michal Hocko <mhocko@suse.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, guro@fb.com,
        Huang Ying <ying.huang@intel.com>,
        =?UTF-8?Q?Bj=c3=b6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
References: <20180924101150.23349-1-brgl@bgdev.pl>
 <20180924101150.23349-4-brgl@bgdev.pl>
 <CAGXu5j+GGbRyQDU=TKKXb9EbRSczEJYqjTaDSsmeBeQn3Qdu_g@mail.gmail.com>
 <9ad301dc-47ef-cd7d-699d-e51716d1703f@rasmusvillemoes.dk>
 <CAMuHMdWi0TQfu093po9-TniiLa2=T1E1c5R0S0tr85F==GcaGw@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <c9d0cf98-628d-f2c2-016c-c13d5bdb76c7@rasmusvillemoes.dk>
Date:   Thu, 27 Sep 2018 13:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWi0TQfu093po9-TniiLa2=T1E1c5R0S0tr85F==GcaGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927113013.nAjmzPsOchzHDrThTOBgeTj07S47W4rA71YcPhJWQME@z>

On 2018-09-27 13:01, Geert Uytterhoeven wrote:
> Hi Rasmus,
> 
> On Thu, Sep 27, 2018 at 12:55 PM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>> On 2018-09-27 01:13, Kees Cook wrote:
>>
>> Just drop devm_kfree_const and teach devm_kfree to ignore
>> is_kernel_rodata(). That avoids the 50-100 bytes of overhead for adding
>> yet another EXPORT_SYMBOL and makes it easier to port drivers to
>> devm_kstrdup_const (and avoids the bugs Kees is worried about). devm
>> managed resources are almost never freed explicitly, so that single
>> extra comparison in devm_kfree shouldn't matter for performance.
> 
> I guess we can also teach kfree() to ignore is_kernel_rodata(), and
> drop kfree_const()?

In principle, yes, but the difference is that kfree() is called a lot
more frequently, and on normal code paths, whereas devm_kfree is more
often (though not always) called on error paths.

The goal of _const variants of strdup is to save some memory, so one
place to start is to reduce the .text overhead of that feature. And it
avoids introducing subtle bugs if some devm_kfree() call is missed
during conversion to devm_kstrdup_const().

Rasmus

