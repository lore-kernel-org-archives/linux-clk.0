Return-Path: <SRS0=o4d4=OB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA692C04EBB
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7134C20645
	for <linux-clk@archiver.kernel.org>; Thu, 22 Nov 2018 18:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="AY6wLTcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7134C20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbeKWFSN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 00:18:13 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37378 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729400AbeKWFSN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 00:18:13 -0500
Received: by mail-lj1-f195.google.com with SMTP id e5-v6so8721533lja.4
        for <linux-clk@vger.kernel.org>; Thu, 22 Nov 2018 10:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=V07pLkQM5iKysed9WcGD7nXPTQ4ys4j1fuoExhui2e4=;
        b=AY6wLTcdsfHGVEZ2pUFmkvgX56cIvr8Da0zPxZew0hyPCCCuF3/bXBoUq5Lvo+P2ki
         Xxq8R2CmrD5dH5Wqbw+xIERpQE10EJFCCiyl6dlFFeaKzaCOHBA26eHKZOxKXHBC8UhC
         o8s9ei9JkEk1ynEjFOwrGvKYQSif4jHyXRYpvniytGFxa6CaPuy8z2dGG00iLhiBhrhw
         QmDSoCUlQVrffINCC5bINrzfCdzO4hRiuBmA1LdDjuO6ps4ibGmtfb1huxxx/x1FE2z3
         VH9egmgKsVnhwTq4De6PxC+ISb2A480c21I+x5xv/QsZfOxtg3nslAnM6WfR1IdFtuGq
         FX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=V07pLkQM5iKysed9WcGD7nXPTQ4ys4j1fuoExhui2e4=;
        b=loPtmwcw2c6ONliUtzpX7gK1onZlfYlaEgdjViN5oaTiRQeoTBQ6czz7sAyQDoK1na
         q3c/M1jG8HteywkS04alcxQGXoYcfLH1tKT7rQCAIeYQz+FdZvQIIugOenCt/hA1PS3h
         vwMzKkQiFf58LyLQUOr1K+QSl1JYYk8DZQDZwP6/HSkcuBVjc4kAznX5GGHsR13zFfZV
         hTbnHO8r0acYPpQOGz0F4WPXrTun9tVxWr+roWAFWOPW2qhNPbnZOp/Ar8W+4hW8eNqK
         FixnLTKmMbcoBhL4T7LBhaunLkvQ4yV+W6ealLBlOC73zqBQJTt7vn62RPN6d8pN28Nw
         o89w==
X-Gm-Message-State: AGRZ1gIy9ADOqrKxz5vVAD3kLq1qoKdCmaMSed/4zriRD9P8kSi9ZqGm
        gdhfnNcovH5SHtK4Ou64aDybbAGpVwk=
X-Google-Smtp-Source: AFSGD/UqV7q5b/BE+qPufflMFZLvXH34uGi2QehGnKHLOEz/SgAUv0G9aq3iNByehk6A2v1112HaOQ==
X-Received: by 2002:a2e:3218:: with SMTP id y24-v6mr8453555ljy.157.1542911855829;
        Thu, 22 Nov 2018 10:37:35 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.85.10])
        by smtp.gmail.com with ESMTPSA id u79-v6sm2480352lje.36.2018.11.22.10.37.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Nov 2018 10:37:35 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/4] Renesas R8A77980 CPG/MSSR RPC clock support
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <c79d3733-437a-55dc-d946-99521b79ec20@cogentembedded.com>
Date:   Thu, 22 Nov 2018 21:37:33 +0300
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
'renesas-drivers.git' repo. We're adding support for the RPC clocks...

[1/4] clk: renesas: rcar-gen3-cpg: factor out cpg_reg_modify()
[2/4] clk: renesas: rcar-gen3-cpg: add RPC clock
[3/4] clk: renesas: rcar-gen3-cpg: add RPCD2 clock
[4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks

MBR, Sergei
