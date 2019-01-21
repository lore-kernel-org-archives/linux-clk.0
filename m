Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DC0C316AF
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 18:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C42F21726
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 18:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="dT6WD5jV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfAUStK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 13:49:10 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43248 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbfAUStJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 13:49:09 -0500
Received: by mail-lj1-f194.google.com with SMTP id q2-v6so18401223lji.10
        for <linux-clk@vger.kernel.org>; Mon, 21 Jan 2019 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/mbe/kYXtGbxH5uz/MVTsH8N9qQqJTlIz+IrKDBo9s=;
        b=dT6WD5jVgOd2WjhQx4l5trq9tgbyhtqpVOiFvzo0mAYoCiiYJ5d7HNU0x3HthETXW4
         ys1aaCeL2vJ6fPbZR2X0mQVAwUwIyDdbkrt7qXt+GnXRd5y6yH+y2SbBdo7E43WAen2L
         RyMAZE/mlDB1y4kVXGUbxz7IBIcoKDMFHpzDPTRTo1vIfY7gY6s4tj0hmwdV6IazVl/K
         fl3CNj5fgB4L1w2M2YvqPWXeHE0QwiOYZHYILTvK4ggumt+eq+U6xZLDqSBAz/o/GVq3
         cT2RtT3j5D+cL64yXPKKO9jThBPvFItVQzJ2LNpMH+gjatmNf5wL9pqmUWQJAHodeH12
         gq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c/mbe/kYXtGbxH5uz/MVTsH8N9qQqJTlIz+IrKDBo9s=;
        b=LALMxsWjU4sIvH8lTTvYF0tYuKDkCPawUpIuJVoS9Lxj9iSzPchkSY4XxS3Frk90Ai
         Piw0eJ5ZE7xVVVt+1pB1opqkBFWSNtzeSbrGI/uGFrmRCq1/HEjtxCktDKIcovol1FMx
         bb0hsia7yENrvR6AxhMyQKN6VAM/ixCWeng0bUFUb2O7ST8SzfgqPJg8JY59msNB1Bsm
         mnSArLNINERpoXOYt0BNmDL4VTFR2zAiQRmoRGpJjvXxZIGg0cwGLaNVpwkp75TzjYB9
         XAvYKwBHI2JZnx8MZCtZTxSR8ydxNsVwLqBLvS3QWormv7goQ7kRQ4D3zAIYiBKYPlNC
         +q9w==
X-Gm-Message-State: AJcUukdPA3eDuqB/b38Am5uRO8YxI3AeChuRbLoGzVMOnvBt0xw+hwCE
        t0BhZ6yqf8fHYTkrHyJnIwFmY1Y6ceo=
X-Google-Smtp-Source: ALg8bN7Eq4zSy1nyNMshvcqLlyG2/4+FtmKolf8FT8JmCKnezT+8TrlN2Fzmsoa9Dv0Rooq/LQ3F5w==
X-Received: by 2002:a2e:9dcb:: with SMTP id x11-v6mr20012085ljj.158.1548096547463;
        Mon, 21 Jan 2019 10:49:07 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.215])
        by smtp.gmail.com with ESMTPSA id g24sm2389259lfh.33.2019.01.21.10.49.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 10:49:06 -0800 (PST)
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
 <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
 <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <54c236a3-aaa3-c8b5-786c-941a36deff6b@cogentembedded.com>
Date:   Mon, 21 Jan 2019 21:49:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/14/2018 06:33 PM, Simon Horman wrote:
> On Tue, Dec 04, 2018 at 10:49:44PM +0300, Sergei Shtylyov wrote:
>> Protect the CPG register read-modify-write sequence with a spinlock.
> 
> Spinlocks are expensive, I think an explanation of why this is
> necessary would be worthwhile.

   The driver using a spinlock to protect the hardware registers is such a 
common scenario, I didn't think it was worth a special explanation. :-)

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
