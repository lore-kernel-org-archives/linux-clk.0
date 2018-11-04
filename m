Return-Path: <SRS0=E5Sm=NP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFE8C32789
	for <linux-clk@archiver.kernel.org>; Sun,  4 Nov 2018 08:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC42D2082E
	for <linux-clk@archiver.kernel.org>; Sun,  4 Nov 2018 08:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="d2C1Wy2o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC42D2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbeKDRXL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 4 Nov 2018 12:23:11 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33084 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729120AbeKDRXL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 4 Nov 2018 12:23:11 -0500
Received: by mail-lf1-f65.google.com with SMTP id i26so4010853lfc.0
        for <linux-clk@vger.kernel.org>; Sun, 04 Nov 2018 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=eMTKKcs8nrMK7AG6cdfsc8CnJlHkuKtAqDwO1+eJZ/c=;
        b=d2C1Wy2ofEyb9BBirnomfMnNPJuLZq6ZhKj7UoJzfG7fo9W+cz/cwtHC2eZjxGU2JS
         +G59mAaDLsLY9ymeEGQ5UebodBn8DhkZF2H0gb2QStiKeuiV1K1K+vK7je7nxmv4sHrx
         1T5EWPVAMy5BeO7oRHF0uDWh4FG1Yo2h5JaZWFVJGHH2e+Pm+U5q+CTQW4GLaaWeTS8N
         skX3d6hBQRi5C/u0QjZ90ET6VnJlfBXi42NzWso+X5PTb6qgJ+MNyqsmY3sgZMC4Ghmg
         8AAUWzaDuZWRZkPIytaRySdFR3zD+61xVZhUmoL1fvk6k+cyvJOUfyW0fkFaq3Vb5UZU
         wuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eMTKKcs8nrMK7AG6cdfsc8CnJlHkuKtAqDwO1+eJZ/c=;
        b=MOmWf5qypTshsYZTTri+lmHnGS+3T9MGkLj2becE3Qy13Cwero+yxg/e89KTKRXhMZ
         ki9IxqkcCz3bn9aoeuDnLOB3olqtSY95wVWnrb1SlDrFLFZVUOq51YsGxxig6y9uC+mw
         zzRGjpfmZ2QUTOZbUVnVgZFHHJo3sD+cWxYl6aLkSwB5oeOq9n7msTyndItxdZIbN6vg
         9hF4LaeW5Z/pKAHqdAKbRGL1Iobw+h8cxJlGyGj8V9+6SZYjGI3WZ8yAZoCvxcn5V9hR
         YuvuQH/YY9i3oh2XLOAAWg6Qur6LmV0gM5Fz8V/OKog5EPkmCOSmwTr797A8J1ISOIZs
         2U4w==
X-Gm-Message-State: AGRZ1gJ9np8X4VTmuYnRsypZinR34892uzb7z4uA63IyEuBIDwNyIs9k
        PHSlsI/G4BPh4tVKXEbmg3bY4G3ZFbI=
X-Google-Smtp-Source: AJdET5cVpD+ueoafrL3KdzVCL3Dv3Upe5MIGZeruWLdODXppnFm9w6d7lYq0Vql0oK1vwdfDzd7eeg==
X-Received: by 2002:a19:8d01:: with SMTP id p1mr9604715lfd.149.1541318944463;
        Sun, 04 Nov 2018 01:09:04 -0700 (PDT)
Received: from [10.0.0.145] ([94.72.11.11])
        by smtp.gmail.com with ESMTPSA id a25sm856375lfk.31.2018.11.04.01.09.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Nov 2018 01:09:03 -0700 (PDT)
Subject: Re: [PATCH] clk: renesas: r8a77970: add RPC clock
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
 <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
Message-ID: <53832889-3c47-cd15-4e85-830b5c2620c2@cogentembedded.com>
Date:   Sun, 4 Nov 2018 11:09:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5a5c65f1-d446-9445-4e2a-579f57f00abf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Oops, the subject should have "clocks", not "clock".
