Return-Path: <SRS0=d2gX=2G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C477CC2D0C3
	for <linux-clk@archiver.kernel.org>; Mon, 16 Dec 2019 18:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C60D21582
	for <linux-clk@archiver.kernel.org>; Mon, 16 Dec 2019 18:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="dZKk5Aqv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfLPSrd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Dec 2019 13:47:33 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43891 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728339AbfLPSrb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 13:47:31 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so7921892ljm.10
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 10:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZzVqpm7vISxN2XVUCXGY2m/2XgAiTT0hZi9cW/dInYQ=;
        b=dZKk5AqvtPHFii8jZi+8J/lePw5/aQn7GaI4xJEsfiKeEXKxrjqY7SsMgUzuGBuAnJ
         lhHmUXQNOUmAKADBgGGctmtIDE3s/1+6pcASqF2hFgTu8mD30bn9yMBCo9ZTLNOxljHx
         QYDm+2L84AhvHNfnxjn+ViFTqrOeIfMOVPu7Prn88zScJX9hR2BR2hWtwKdwQrdLAV2Q
         eMvufEfsfkYQJhyt6Ah6X7ItvTdP8KnIZaJQ0bHcOQ1ywCsoMJ4rdxsO8mFO1zOkOPES
         nuI7/rn3Hlv7CyP/TU81LEOUpC8Pqo6udw7BvliaHjOa/FSQLmOs+87UyF19Vsk+bk65
         Mi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZzVqpm7vISxN2XVUCXGY2m/2XgAiTT0hZi9cW/dInYQ=;
        b=XwcipWt8Pm+nHhm0lJr36MjOoRVm9b5APJD+U0JD99XYMVxEJ3n9StbF636TgMH2lK
         ESfjEAcdtZYpmaNnHZw5fRi4D/0aLmp/GIaYrYbq0fNjTGL3aIRKk1MVz9cmKcO0E48y
         RTvCgd47ILrUmPTans9L7O1Y2XweGp62E8PTRrOdu1sVY+gEX7v/+3Fkt32DT6lBqBv9
         ecAPBxQ30OL39n6aafAcT2w/agaChF0n0Z60R1ANENayWNdULqLJtlm4ddJQY7G3GxBl
         mB+lz8p8Pl47W2kYou7MQFdKsVax4XzpirUCOWa9iSr/4q6KD3+HF4fJ3exCsxUwIZkP
         g59g==
X-Gm-Message-State: APjAAAWNpxif+AW9mtA4D4QU6BVcC/nOeqUOHnKkUwKGev0ZLPLv9Gzn
        XrmDireXd5SneEAcWKUOvt+AFrfL2+c=
X-Google-Smtp-Source: APXvYqwA7Ysm4UNtu9E+akNwfRxfaN3bIefRHQCWigpiGZVf0Q7o0UssOPcmwHdK6c+oVuOA9w9V3Q==
X-Received: by 2002:a2e:3a12:: with SMTP id h18mr379963lja.81.1576522049068;
        Mon, 16 Dec 2019 10:47:29 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:48df:e424:ff05:dd96:8970:d4c9])
        by smtp.gmail.com with ESMTPSA id g27sm9427223lfj.49.2019.12.16.10.47.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2019 10:47:28 -0800 (PST)
Subject: Re: [PATCH v2 1/6] spi: Add SPIBSC driver
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <20191206134202.18784-2-chris.brandt@renesas.com>
 <37c13497-d20f-583f-72d7-1e3c8a241990@cogentembedded.com>
 <TYXPR01MB1568ED4D40CEC399E64F6A2B8A550@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <7386b38f-2f52-39cb-3887-e97b024ec563@cogentembedded.com>
 <2e3211c6-59e8-3057-66a2-29b89a353b8a@cogentembedded.com>
 <TY1PR01MB1562F30F0B58465A6988F29C8A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <a9b051ac-da70-37bb-bb82-540f0f161b25@cogentembedded.com>
Date:   Mon, 16 Dec 2019 21:47:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <TY1PR01MB1562F30F0B58465A6988F29C8A540@TY1PR01MB1562.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/13/2019 11:43 PM, Chris Brandt wrote:

>>    The patch isn't applicable as well, and the behaviour is the same as in
>> 5.2.-rc6 based
>> kernel --deleted file is back after remounting, sync or not...
> 
> Do the basic R/W operations works?
> 
> Here is the first test I do on my platforms. After I passed this, everything
> else seems to worked pretty good (writing large files).
> 
> $ flash_eraseall -j /dev/mtd4
> $ mount -t jffs2 /dev/mtdblock4 /mnt
> $ echo "hello" > /mnt/hello.txt
> $ sync

   This works but the created file doesn't survive a remount.
 
> If the Flash was recognized at boot, then we know that the ID command (0x9F)
> at least worked. Meaning read commands were at least working (which is the
> difficult one for this HW...writing is easier)

   BTW, during boot I'm seeing with thsi driver:

spi spi0.0: setup: ignoring unsupported mode bits 800                           
spi-nor spi0.0: Failed to parse optional parameter table: ff81                  

   (The 2nd message is also seen with my drivers).

> Chris

MBR, Sergei
