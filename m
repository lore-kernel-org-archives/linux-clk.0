Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AEDC282C5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FD6A20870
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 19:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="aQv4da3E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbfAVTzs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jan 2019 14:55:48 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39213 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbfAVTzs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Jan 2019 14:55:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id t9-v6so21763841ljh.6
        for <linux-clk@vger.kernel.org>; Tue, 22 Jan 2019 11:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=XgwnDIPBvJmLbDnG6zy3YEuKi9ydmhO3m5l3zDCQRO8=;
        b=aQv4da3Ee/Psuu+1+FwpeVkC38kr4n59FQEuP/3gWYcKBtGfOKfKpP5i1Q/1Dvqfgc
         Ky/WdsFcmIjzEb7p+dfnUymtZvkHDYZY099UhgRiCFUsr85LkG+VIwUQB48A8cl7X7V8
         VEAbbJpEzgj1ni6ZnPMIHNmT2yRra2LSv3JZ84xxSMuN2S0Dtaph2EioHnvZj52DkqAN
         S3H5WdihEYN5iNmFwqs2/t+GiH18SX/zgh11wYRxvt/ha6TYH19WlpFFd8awTKVAcfbI
         sazluHfwj8XN3HvBOlQyDI11lNlgrB7QHKMVe9i81poIhyNo9YkbYt7zf636jJnfjHU3
         T5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=XgwnDIPBvJmLbDnG6zy3YEuKi9ydmhO3m5l3zDCQRO8=;
        b=t5cGzCGQoB5J3BrTCjZXuT61iBDkjlSuyJNqKTUoXBQKIKngElIOcYoZWHMOBiYR+1
         buKT43cUfb7sZxOE3fhQWfltKObRv2bLPy2nREaqtLlI1C4jl5q7TdpnzdpUpByjceOc
         YCGweZoT3CWPi8P8K12yH9fz60Dd6HMvN+W6bVyxFYxLPcwp/GbBKSDepdT+8R7mYBb2
         OFegYl8O1TdNm2dvulfcX9+8mCU3YtoMnq5MYWXRRz5ozSBRMXoJyNAY0HZziAFpmzfY
         bEpZJjHDBlh0EciaDy14nFVf6EoQwnzrsJV82KqBZhRYydc7RZnmbWamSlJlYJjOT9tp
         7dDA==
X-Gm-Message-State: AJcUukfFdY/fpbTBjkn/8+qaAGXpmGXUWIyORngJkwGCxR3IKwp2wnSb
        zQ/Ks/qNS5n4Vjxsaz6VMaTzpC1HJzI=
X-Google-Smtp-Source: ALg8bN4MD1U1f9Q/DqBtjEdj4HB7jBvg8FRjc1HyjxxR88okpbyDd2i8x/+VCjTfTWOeRhoUHvX6zg==
X-Received: by 2002:a2e:89d7:: with SMTP id c23-v6mr23418847ljk.0.1548186945611;
        Tue, 22 Jan 2019 11:55:45 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.82.69])
        by smtp.gmail.com with ESMTPSA id y81-v6sm152624lje.30.2019.01.22.11.55.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jan 2019 11:55:44 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3 0/4] Renesas R8A77980 CPG/MSSR RPC clock support
To:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
Date:   Tue, 22 Jan 2019 22:55:44 +0300
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
