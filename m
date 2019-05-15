Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1ACC04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 15:26:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABE3B20873
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 15:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQ5b5R0c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfEOP0y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 11:26:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42047 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfEOP0x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 11:26:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id 188so151052ljf.9;
        Wed, 15 May 2019 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6cBL5aTouL63mlEBJPFj1RGOe1dEBWdZshtStEgjyl4=;
        b=gQ5b5R0cTyTWOhDTjkP9WO0SWdB1A53z3VCrlhsLBS0+PRh7ovvr7QE8jfIgbzMWIg
         XpS+7U2Z5d2Xh3UxCBnJ/QDrt9ec6JQtiWybb37FBDCxIQJswkqHxWln2/z/mQYEVdLF
         /B+UTIlz+mu5uVm7uD+KHp5GDQz5N27xHw6Ty+QAjcR+zhoPcIwJY+PVEAX60Yjgu0hM
         JK9Ez/wN4v/uqTQqB2qI2lBMrJV5LRXqDo4JMvgCROiLJT3R5aXOmuasJLVFB480uW8L
         SThd3R3Ti+TrxWDvdiRGRZL0WD9EFHWExxoFcZn9i/nXMguyXnRvknWFKmuo9/H1Ktoa
         bTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6cBL5aTouL63mlEBJPFj1RGOe1dEBWdZshtStEgjyl4=;
        b=tutVH4U0hrVSjgS7P2hbxmx394yL3mJXYLOIpQp74wVfAM+WArQqTw2990Ok0wa7f8
         wAirAfDuwhU6TUdaz0zyGHC5qMoeTSVrVwHGA/qoL8iy2haKith0dpNCma0AGTfNE+rU
         0WJyw4OzIC9e/+39nSbm2A10RUTw53vWHC8DrDEH/ZfsWUd/uHKgJOpOoj9fc94FTuy6
         GYuLAdRWWPFAmClO0OCmnQiLbVyMSji+0qPxTwdbqJEeuxXwhy2yKQ7XLmd718EzPD/P
         oKC13oGBLKUfDu+GfCN2/9MT0niKefpeAyKNSvycT9o+K6tHAUTdPnjF/PP6dHXqMvUg
         lm+w==
X-Gm-Message-State: APjAAAUW0MFKK9BY7xtoyD7AhT8FMUrmM/TOk0mONvgj16ibKouGWZ//
        eKE/ejv46BCC2tuSI88l+30=
X-Google-Smtp-Source: APXvYqx1eXNFS/yKESjwI/+dMTt/Mzw77h/fGs13ul8A07QCq74RGyhn5/lFO1hjsM3brXCAP4ghWQ==
X-Received: by 2002:a2e:8644:: with SMTP id i4mr7583980ljj.0.1557934011892;
        Wed, 15 May 2019 08:26:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id k81sm399103ljb.77.2019.05.15.08.26.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 08:26:51 -0700 (PDT)
Subject: Re: [PATCH V3 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6a42ff62-44fe-c420-7645-d57ecc1defaa@gmail.com>
Date:   Wed, 15 May 2019 18:26:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510084719.18902-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

10.05.2019 11:47, Joseph Lo пишет:
> This patch adds the required APIs and variables for the EMC scaling
> sequence code on Tegra210.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---

> +
> +void do_clock_change(struct tegra_emc *emc, u32 clksrc)
> +{
> +	int err;
> +
> +	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
> +	emc_readl(emc, EMC_INTSTATUS);
> +
> +	tegra210_clk_emc_update_setting(clksrc);
> +
> +	err = wait_for_update(emc, EMC_INTSTATUS,
> +			      EMC_INTSTATUS_CLKCHANGE_COMPLETE, true, REG_EMC);
> +	if (err) {
> +		pr_err("%s: clock change completion error: %d", __func__, err);
> +		WARN_ON(1);
> +	}

Ether WARN(err, ...) or dev_warn, or just dev_err.

-- 
Dmitry
