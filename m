Return-Path: <SRS0=Sirx=S5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF493C43218
	for <linux-clk@archiver.kernel.org>; Sat, 27 Apr 2019 03:32:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EE2920693
	for <linux-clk@archiver.kernel.org>; Sat, 27 Apr 2019 03:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mB2sHGEP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfD0DcX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Apr 2019 23:32:23 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:53740 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfD0DcW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Apr 2019 23:32:22 -0400
Received: by mail-it1-f194.google.com with SMTP id z4so8945233itc.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2019 20:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=peuEUDy334xbKJ6inCuEX4kMUbZlT8X6mHTrFHvvEpw=;
        b=mB2sHGEPUZXOXgBS3XCnV2O2AknvimY8DOXe8ACDOLXwCKkSQ1CXpRS7w15dwlXhQt
         WF6GKQVvZCaPXUl412S/0YfpkL+qME2qv7RrjqmcJR2IkdNlEy41GFU3lWx4oeuBaSq0
         joNd1fKd09sdwsZUlAyb3foHXYpHds/rXbkgCScLKa0Cxme+qsZLytqeMCn+siMx0zdu
         zoRcLCHN8qaXqgefi3U3DYkqGRT8LUyaQxyUueOjyPngFT9kuefvUjs8M0qnq9tqQiDj
         BBsE9HG8pqhSDOFs6q2JB0E75Sujw7i6Go6oP+MEQXgNV2dpWHwMjkFMCosW7+Cdxa+J
         yNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=peuEUDy334xbKJ6inCuEX4kMUbZlT8X6mHTrFHvvEpw=;
        b=jAocINp2SiI6VDstgk6K5iuuSARoo95luIKBKqdQz5O5XlwZ3l/uv6JjPTlC7VCn24
         2GjjtIfOhkVFdBGuonUCYZAillvUJCn7tHQ1fRG9UlmFBfx4Pe6cceOY9OWB4wOnEU0j
         ANGgLJtv5L94C0WzZieig0ZaL0VeuAf71oYPvUCjX4MRMATXJDgOJz/yMqUIo7et8er3
         tuzOU0j8SWnuG/SnYkvW71K7TRL9zAQE766IiE1GcpdcOAmWUzyV7M53BVznXo+Cn8/m
         FCI1VgfAO86PeddCEwek+9B2q4KcBJE/Xo+P8Izux9HsT8SA86/Yvv9tQkQd2tgg82gM
         n7GQ==
X-Gm-Message-State: APjAAAURsVD7sgJEmkXhaOoRkCELpfc96Fs2zzPaBSvB/FwNMmM154kJ
        OpAV+5DaRdINeksuAFhPNpwG5A==
X-Google-Smtp-Source: APXvYqz5BHffkPjHHo9K9gSW556UBs5Ka/SnjM6zZHQh0LlH4qehKLLtRv8o9ntt7XZ7dTsIOqpOLw==
X-Received: by 2002:a02:b819:: with SMTP id o25mr34991411jam.69.1556335942118;
        Fri, 26 Apr 2019 20:32:22 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id b15sm9788878ios.25.2019.04.26.20.32.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2019 20:32:21 -0700 (PDT)
Date:   Fri, 26 Apr 2019 20:32:20 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Stephen Boyd <sboyd@kernel.org>
cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Paul Walmsley <paul@pwsan.com>,
        Wesley Terpstra <wesley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Megan Wachs <megan@sifive.com>
Subject: Re: [PATCH v3 1/3] clk: analogbits: add Wide-Range PLL library
In-Reply-To: <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.9999.1904262031510.10713@viisi.sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com> <155632691100.168659.14460051101205812433@swboyd.mtv.corp.google.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 26 Apr 2019, Stephen Boyd wrote:

> Quoting Paul Walmsley (2019-04-11 01:27:32)
> > Add common library code for the Analog Bits Wide-Range PLL (WRPLL) IP
> > block, as implemented in TSMC CLN28HPC.
> 
> I haven't deeply reviewed at all, but I already get two problems when
> compile testing these patches. I can fix them up if nothing else needs
> fixing.
> 
> drivers/clk/analogbits/wrpll-cln28hpc.c:165 __wrpll_calc_divq() warn: should 'target_rate << divq' be a 64 bit type?
> drivers/clk/sifive/fu540-prci.c:214:16: error: return expression in void function

Hmm, that's odd.  I will definitely take a look and repost.

- Paul
