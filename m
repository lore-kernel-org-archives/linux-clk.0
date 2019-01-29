Return-Path: <SRS0=lEqg=QF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A26C169C4
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 18:07:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED19E2184D
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 18:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aA0lz5/x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbfA2SHJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 13:07:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35826 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbfA2SHJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jan 2019 13:07:09 -0500
Received: by mail-wr1-f66.google.com with SMTP id 96so23187469wrb.2
        for <linux-clk@vger.kernel.org>; Tue, 29 Jan 2019 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NzDwDEgriwmCgRdcqLB9TL0tXHCXXVwXdPshYo2uub4=;
        b=aA0lz5/x4LFTqvA60ICnNMJoFbk39uJ7CnhkZYJOeb9pQcko04r2z8ek1EemQ/H7N1
         DUy0xRc7jeRdHJ/xh9wTj7kiZJdPNZElsZ+V07PNmqaHMoiEAZWO87U+2K8Bn7EV5FNE
         EuNgYshQBkNbbhTeKx0AOFK14Sx+r4G5w2+vPjpDkom9sVzpOEYuftscHANqhnIZHD1f
         xE8AtWvmRK1TYVbQ703NIGgw2zlj0baGYtivZ1NNsOVe2lQC2bE+f6p5ZsdwaBx9tAXK
         Z1pjWLVPX6Yy1lQ4iKc9hLMDuVYXAKSJEyAnugeho9MU9xZ4hnlFr29Rhmq27UR21i8k
         a3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NzDwDEgriwmCgRdcqLB9TL0tXHCXXVwXdPshYo2uub4=;
        b=GH/04e62XmM2mPVe+ZkM0wPz+m8Om5bL3vzLviNhCyhpcWKJIVuE6a04MSywQsFwW7
         Ry9E7pVKyqePwhDoxpvMWaUq1JJDr9nNRV5Hjg0x9/6rtomdUrZb4bhNhNZbfmyinMRP
         rJb5ckdr8QQMzKfOFmXJBuYCwK4GcVhjblLg435ZRtvhWxHjVtmBD4sCme9+E5Myy38l
         I+5WrCUj0bjvwI02srDl8GAtC4/tOFjpUQcS0JI0IcsN04tmFI05eg2+rJ+Uy9EuieQW
         tim5aQEQ9i07b9u6qTr3sMEOTUG/VygVOWeF4+kjcPlkTFu2WxIVvU6VIKM+GnwAY6Zg
         j8BQ==
X-Gm-Message-State: AJcUukdO+iV9h7QfFhtQScWn1C6n3v9aonGYctfEhx9F2qhNuXx0vt84
        xtdcfeFKMQygVB2J6o+vpeIEVw==
X-Google-Smtp-Source: ALg8bN5xbEoQ1ihFND9bwxaeig6iPfJJ+zuvOJCox2vVkZ+I7GSjseFGt4qud2fkXGXnmTOQMBeqZw==
X-Received: by 2002:a05:6000:108d:: with SMTP id y13mr25818527wrw.135.1548785227162;
        Tue, 29 Jan 2019 10:07:07 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id j33sm192878674wre.91.2019.01.29.10.07.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 29 Jan 2019 10:07:06 -0800 (PST)
Message-ID: <f85275321c93c00494c82a8af19a70c229887944.camel@baylibre.com>
Subject: Re: [PATCH 04/14] clk: meson: move MESON_GATE to clk-regmap.h
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Date:   Tue, 29 Jan 2019 19:07:01 +0100
In-Reply-To: <154878509992.136743.15892625146758066106@swboyd.mtv.corp.google.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
         <20190128180430.28689-5-jbrunet@baylibre.com>
         <154878509992.136743.15892625146758066106@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 2019-01-29 at 10:04 -0800, Stephen Boyd wrote:
> Quoting Jerome Brunet (2019-01-28 10:04:20)
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> 
> And also make clk-regmap.c a module? Having any commit text would be
> good.

Stephen, 

As stated in the cover-letter, this patch (and several others) is meant to be
squashed with patch 14 of this series, keeping commit text of patch 14.

Details are provided in both the cover letter and patch 14

> 


