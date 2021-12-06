Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABABC43217
	for <linux-clk@archiver.kernel.org>; Mon,  6 Dec 2021 22:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357389AbhLFWen (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Dec 2021 17:34:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357060AbhLFWej (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 17:34:39 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2766AC0611F7
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 14:31:10 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id t19so24219113oij.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 14:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qq78z0NHjEwA+124YJAfXzlLqwdJ9fvjq8n6HGk0oQs=;
        b=OVuSxC2lcwkdAR8CVsOqRUevq1YzOkLgFN1nKte//59whrLb1o2W87NbMhaGzd6PzN
         zNluYSE8l/tItwU5cvKHCeA1PEnerMzBrpt2mKUg5E1YYu8UfHy2jDmCsztIl5DXrTQS
         uO28qLaECyhzzo6+VMTUJAroUfdf4SOY2i2gQrFWU4CjVNCSXQyYHB8DZXte8p+WC/6o
         EnQp5ICiLysmMisoyZjGewmyNaicyspGQy965EVTboccIxdbUxcGtSvJPR2bYFfKQFob
         2JSYcSwFvAAyeVQOcMqVomiQF60907qFRmeYZ6rFkwZNWmWvggMMg/2HO315MtaAt8uW
         vu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qq78z0NHjEwA+124YJAfXzlLqwdJ9fvjq8n6HGk0oQs=;
        b=JkqNdMTiVEZxr5Wu0c0c52Rjgw683imq3bJcNI/J2F9SOVELwoM8ZX+GvOjMXgvbDo
         cQrp2qcuSHgmYFnIeT8+rsn+TOsrJukyRQ5ckRPMveNMucHVREPeGHLSpBCBeOHJWHC6
         HpUU9Rdbh0x8LiK/AdKTchwM/ykkOY3Bt5uwNZst92DkaKnFgMJ9heAYAUNJZTopQNLB
         wrEpmco8iXWBn/wcSpVZRiOYbUWlL1XjKIpOFopG7TAbg6tUEgc3Zoi2TBfNl9MPsmOa
         6ALtDaiiSN+XeHo1V6o9uee3sPQ64WVlPjkMHnT+1VB/yzW8SVbcQKwY/937//t2HkhH
         9IlA==
X-Gm-Message-State: AOAM532D7Yh35JfV2BNeIv9NCduV+hJEWRbjO95OkGEUmPVcTgvw3PAu
        EQbob4rh6XJF1JamEDkQui7nGw==
X-Google-Smtp-Source: ABdhPJwkJrzUqguY3mZZb6B6HrmKYK8hSC2ot3TTx4x2nA1AUMDIyBsv8+NWJlEv04t1H6fe6JEqow==
X-Received: by 2002:a05:6808:301e:: with SMTP id ay30mr1625744oib.36.1638829869470;
        Mon, 06 Dec 2021 14:31:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm2911815oiw.20.2021.12.06.14.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:31:09 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] A few smd-rpm clock driver cleanups
Date:   Mon,  6 Dec 2021 16:31:00 -0600
Message-Id: <163882985136.2324147.15735697314524211594.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211031020715.21636-1-shawn.guo@linaro.org>
References: <20211031020715.21636-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 31 Oct 2021 10:07:12 +0800, Shawn Guo wrote:
> Here are a few smd-rpm clock driver cleanups found in the code
> inspection.
> 
> Shawn Guo (3):
>   clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
>   clk: qcom: smd-rpm: Drop the use of struct rpm_cc
>   clk: qcom: smd-rpm: Drop binary value handling for buffered clock
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: smd-rpm: Drop MFD qcom-rpm reference
      commit: 00a123e962f7f17163ee7f665f483d3ba25f54a6
[2/3] clk: qcom: smd-rpm: Drop the use of struct rpm_cc
      commit: b406f5e92b3ba6c8fe89f16cb61e60190e45171b
[3/3] clk: qcom: smd-rpm: Drop binary value handling for buffered clock
      commit: b26ab06d0969ed9e901f93390242437ac5802c4d

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
