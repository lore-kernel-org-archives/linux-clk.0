Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E768BC04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:43:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD4E92081C
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 19:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ENTubIVV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD4E92081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbeLDTn6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 14:43:58 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40066 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbeLDTn6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 14:43:58 -0500
Received: by mail-lj1-f194.google.com with SMTP id n18-v6so16068572lji.7
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 11:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=XgwnDIPBvJmLbDnG6zy3YEuKi9ydmhO3m5l3zDCQRO8=;
        b=ENTubIVVeN8J5CcAR1i2NWYd5LEHQ58FgURlmUfE/I4Xgn/4zb7E8TyLGJ4RESlaQE
         ih2fTTNxygZyvDqXlnCsbCg/TFwSU8bDZZyIKJQR7qzcUgjtx7Rb8xhcrCQ+dIrJfGgZ
         nKt/3cgnFxO8mh0fQ866wY9xPvbDbYWvaR+7UdKw3k8n37fQKRUVZHhS6uXWKeGZLlR+
         NMw+yniDHt4YI3VbTyHySZXB0LAiNu0CfjEZRj7uDeGiCEGn/OHed9QHlmSqsmrrcWyl
         C6RVNg6HXRr5OJo9ZEgDlCStBDOqpxAo31uZ4BRl4YBw+AE5snhH2ZhXQnPQlSWpHw5e
         xmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=XgwnDIPBvJmLbDnG6zy3YEuKi9ydmhO3m5l3zDCQRO8=;
        b=Pna4xiHevKmesBeoqTdUMLTDUe9iBlnyBHp5wjT9KEsKJ2hr6+lYHJIPuYoIenGdvT
         GXjX47/d0s/69CIt/8V1QtVPSJGFaI+E6yrCRzQXO0fVHDH7eYmtuuQkb5cdbydpMzOL
         C7GVVZ5fmL9MaXSu0w4ppgKCqWlTo+UUoa/0F7zEY6Iwffv3aVi0Kup/BZvSQogf6ZG9
         88HW3ll1WkG1JbyYPqNYr+1NOl0MK8UuWq/Th47dvQcyLBLvmJdCFczY/1ujW81JrQiw
         XiHNac/qNAQjsr6E/fb98vHPOhXbxtigRZ23rW49KNliQLiW5pkfaiHIXBRsxva5i1Vr
         Py5Q==
X-Gm-Message-State: AA+aEWZsndLofd6pxBo5U6VzPJirLVHxRTqvxYHWFTsD7GI1aFSq+F2D
        0+By2UNzEDTUALbdFjDIkTRZ5o2YG38=
X-Google-Smtp-Source: AFSGD/We+DaNJdzE1fJITwM0itWg7J+kim2bDVKO2nhJvKTaN9oYbSUybN1Rtzew4xC+YjH/CSpNfg==
X-Received: by 2002:a2e:9d17:: with SMTP id t23-v6mr13647877lji.57.1543952635557;
        Tue, 04 Dec 2018 11:43:55 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.250])
        by smtp.gmail.com with ESMTPSA id d5sm3132522lfi.65.2018.12.04.11.43.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 11:43:54 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/4] Renesas R8A77980 CPG/MSSR RPC clock support
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
Date:   Tue, 4 Dec 2018 22:43:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello!

Here's the set of 4 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo. We're adding support for the R8A77980 CPG/MSSR RPC clocks...

[1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
[2/4] clk: renesas: rcar-gen3-cpg: add spinlock
[3/4] clk: renesas: rcar-gen3-cpg: add RPC clocks
[4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks

MBR, Sergei
