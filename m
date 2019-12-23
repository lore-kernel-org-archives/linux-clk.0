Return-Path: <SRS0=2Ll0=2N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A70C2D0C0
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 09:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32B1920715
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 09:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehWw+Qb0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfLWJ2Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Dec 2019 04:28:16 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:54340 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfLWJ2Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Dec 2019 04:28:16 -0500
Received: by mail-pj1-f66.google.com with SMTP id kx11so3080075pjb.4
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2019 01:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AOFNFIsozFfxjq6127H/6BsOTsIbANd+XoDzwFLWdOQ=;
        b=ehWw+Qb0ysSQjSpaG6jR/oetIWFhqqrj4rqpgMpcDAccEhBNeRuvgFFF9EVm06adlt
         sUKWl1/TesyJxyYeSs2kIg9ZnDRblnSgIwObGi0PeZG0otMErq0rp8A1tln8iSqCKOvD
         AM+OiifrH1N0WGl5tisq+zfQ0cyzZqsndlFjnuUZRz797jQOXD/fLsGwqELrTXA3Gtlc
         fJKriLAK57vIM/cjIA2ZKggI7ATc81/LywGmzVBMaMHSwcmBrfsTx7NL+pwWnoH+am74
         Skc6sVMPALbPWJAo0zbJ8KpjAvyQqvmVu0F3YOXxOHMA+ZFFC+vsyaPn13aKPLcORDjd
         8Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AOFNFIsozFfxjq6127H/6BsOTsIbANd+XoDzwFLWdOQ=;
        b=U1VLWlS0neECbn4FZKEd5SQpUfir0bW8CtPDNQWXa2ez56tm3XvfWzlqDNamRRJ3hH
         H+kjTDPdBnNJylmjfY0MRmcS6tclcu8IZIH4fDbGNBx+z1iL5Lf2QPaAO3G7kIuxJC6Y
         pycfyZKCA1r52y4uFqxOdscGx8xDEnbIFf3tD6QwRK5oQ66UJoJhYCfGWG5iaP2bMVdY
         KwG1lx9r3/0ddKtJzhEv8/IxZaWfPbhwTahsdOuYSPwZlDuMIgNwPQ9LiEsLX3Kqa8nt
         gWCNqv4qCuwHG6Ljg3Jrvd8QfOaJxEL0TAAb0dBQjZnwOMVWdjJmHjlqpZH4wwB74vUl
         jK0w==
X-Gm-Message-State: APjAAAXb9cg9x6PpyzYYexnFkgcKFcT9MDdNr77bYWOP1b1UT7FvvId6
        ZAviamw1v8RPEySMnZTT5YsOhg==
X-Google-Smtp-Source: APXvYqxCDKFjNl+1GYw2Ly/MwVGgYmKlVYySVzzID14C0cBuvJC6F6h4dHND0ns8tQjmQB1pRC/UmA==
X-Received: by 2002:a17:90a:1785:: with SMTP id q5mr33436490pja.143.1577093295836;
        Mon, 23 Dec 2019 01:28:15 -0800 (PST)
Received: from localhost ([122.171.234.168])
        by smtp.gmail.com with ESMTPSA id s21sm18379622pji.25.2019.12.23.01.28.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 01:28:15 -0800 (PST)
Date:   Mon, 23 Dec 2019 14:58:13 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH] clk: ux500: Initialize DSI clocks before registering
Message-ID: <20191223092813.37c3ngkstym5sbfy@vireshk-i7>
References: <20191222202928.14142-1-linus.walleij@linaro.org>
 <CACRpkdaE1T6yt4u5uO+SZB18KjrVp2_4Qd9gr_aN0v5GTJ2VGw@mail.gmail.com>
 <CAPDyKFrYZ3UHAaBdkO9+R+19hEp4yecgdxP=OzWD=VRJ1G4bEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrYZ3UHAaBdkO9+R+19hEp4yecgdxP=OzWD=VRJ1G4bEw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-12-19, 10:16, Ulf Hansson wrote:
> That said, maybe the suggested "Boot constraint framework" [1], that
> has been worked on by Viresh, is the proper solution for this.

The Boot constraint stuff may get replaced by this series from
Saravana, which is already queued by Greg now.. It should fix this
issue I believe.

https://lore.kernel.org/lkml/20190904211126.47518-1-saravanak@google.com/

-- 
viresh
