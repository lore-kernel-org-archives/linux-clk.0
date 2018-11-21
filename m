Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAABC43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 09:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56FAD2146F
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 09:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mih/Kt7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56FAD2146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbeKUTeE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 14:34:04 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42688 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbeKUTeE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 14:34:04 -0500
Received: by mail-pl1-f195.google.com with SMTP id x21-v6so4552347pln.9
        for <linux-clk@vger.kernel.org>; Wed, 21 Nov 2018 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:to:from:in-reply-to:cc
         :references:message-id:user-agent:subject:date;
        bh=cn2lF0gcvQR+FONqyJl9n6t4LCo6bGltvXw6TDhEVk0=;
        b=mih/Kt7KIhqH375rhgTGlRfhgIpqIRajJ8jJwWIfMZeBsKYz2l99cL4bMMzwVP2U9g
         17YMLQohoWo5vmtDVSYfvAYDq4ten8xMohJZXCMgxSj/jPrGM0zu+++uCPVwS17husGY
         rxxEZVNmz7eUEth+FO+RB8FLBlfYH79j+iagI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:to:from
         :in-reply-to:cc:references:message-id:user-agent:subject:date;
        bh=cn2lF0gcvQR+FONqyJl9n6t4LCo6bGltvXw6TDhEVk0=;
        b=GE2M0RSMIpMo4DOIkaLkrrZ4pEpK7JJHkv4fIPor+6dxZCsvWczXblUmdbn7unlf8A
         5wQdvL2r0hpUCZ0JiX1rTQkPHbHXVqAblusOY2GgRR1jyIpG36KDuVv5Y+RnzklD4Skz
         7PBaHMTxrx4YRDgByZ67b98WMz7N4+j2H9JGg6BAysf1GgPtfUaRirsl5WszbziZIPFO
         CfGt5Eck4oIMVb+7DpWb389Li96Hq8qRmxIFU2VNYrVMlXKkD8Ca72xnmgKCu1wmBlPt
         NsD4LJjqGHoiAHkIwwSaDylzwOV8NIWqbU1R4YzUybrPIJEEsMDtAnxBOczFVCfzrIX7
         D5Ww==
X-Gm-Message-State: AA+aEWbflOODWFw9PfUGCZWNpL7nJybU+TqLSZ7wnSxObS+IGwA7JJ1K
        cdL+7k/2VG2tq8At9qi/Pn3pHg==
X-Google-Smtp-Source: AFSGD/VmDy/zL5F+8wV5aiicGtHlA3+VkGGanxVWPEeO/tPP3Pp1AiccSHBy25IYZXRtOU72AXTXHA==
X-Received: by 2002:a63:1321:: with SMTP id i33mr5260427pgl.380.1542790824960;
        Wed, 21 Nov 2018 01:00:24 -0800 (PST)
Received: from localhost ([2620:15c:202:1:fed3:9637:a13a:6c15])
        by smtp.gmail.com with ESMTPSA id p62-v6sm53418272pfp.111.2018.11.21.01.00.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Nov 2018 01:00:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20181105194011.43770-3-swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20181105194011.43770-1-swboyd@chromium.org>
 <20181105194011.43770-3-swboyd@chromium.org>
Message-ID: <154279082358.88331.12065362627893713159@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 2/2] clk: qcom: Support 'protected-clocks' property
Date:   Wed, 21 Nov 2018 01:00:23 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2018-11-05 11:40:11)
> Certain firmware configurations "protect" clks and cause the entire
> system to reboot when a non-secure OS such as Linux tries to read or
> write protected clk registers. But other firmware configurations allow
> reading or writing the same registers, and they may actually require
> that the OS use the otherwise locked down clks. Support the
> 'protected-clocks' property by never registering these protected clks
> with the common clk framework. This way, when firmware is protecting
> these clks we won't have the chance to ever read or write these
> registers and take down the entire system.
> =

> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied to clk-next

