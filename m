Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B74FBC04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 14:10:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86C062084E
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 14:10:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSDWB71C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfEOOKR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 10:10:17 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40334 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfEOOKR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 10:10:17 -0400
Received: by mail-io1-f65.google.com with SMTP id s20so2318338ioj.7;
        Wed, 15 May 2019 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:newsgroups:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bJKKiXfZHHaE5DlOGJdlOVX5mGDL68zBtWY0bhW/6uA=;
        b=MSDWB71CYoxyiah01bf1F5zqjU1MoQmhDvYYLbYgiz8yjIfmtvchCk/Ik5QAOkL6ca
         IteQJ5g98GBQoEDJjlfSBLCGCsKhkiItE1VylU+ueXbvFHkm5qPHd0Hv66kQ8pE9J33v
         BxDiKiPvJXa/g8vCAoI5swKl5YZoRrsN5gHZzyLdDySnxWEmrMXXMLgDdf7Nxm8Lqg/W
         66GtetVRpm0gpUdb9ByHQaFFkLGrwW0Fv6WK/ZnuRa/2KqyrCVg5Jt8K5MpPPsOFt51J
         ViUlwqK/90ZM78Xz0W2YnrLLKQ4Ard1I8aMS5eTvYCM7TcuAsuumLR183xkjPsowwm2U
         +Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:newsgroups:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bJKKiXfZHHaE5DlOGJdlOVX5mGDL68zBtWY0bhW/6uA=;
        b=VzuiL5VYxjRMpsso6PDayX697TENZ4JU61v5pzEglCFRWNGIgXDvL6dT+9Fe1J6I3v
         1s4uzES8GBa4PqRVmn0UNjlLA3XB/YXHsFG1VjEd0UazOysUD6/vIKhDIX8Hy6GSX5Te
         j74V7af//TmexiNIIwsM9kJcgSVZpzEZoyDiGvDjqHmFOMwApgggx9rtG4A3+7xZOHKi
         Re+MRWe3aEFJRzCM/6eB/jMOoCOg3azQFH24JkgC6qZWSLAGnAo83cS0WN4R65dhaAgK
         Obu1nqpYw++j+ofxUtic633CPJ1nvIfKN8UtAgef3EqlUvwQ/pgmEHnJrsBE+9s+jKVN
         bsgw==
X-Gm-Message-State: APjAAAWICjXvL/wyyl6Phs34TWumHlWAoghUg0ZXerXtKTWKzv/s1U1i
        WlQzodHmXUpOdCNCQzobyfQ=
X-Google-Smtp-Source: APXvYqwcZEQnqPFobfTT9ooD47mXfVeRMSKzq+Qe9T+bm955ynqqx8GiA4Zf3Wzi25ls/NCO/XGe9g==
X-Received: by 2002:a5d:851a:: with SMTP id q26mr9307591ion.246.1557929416470;
        Wed, 15 May 2019 07:10:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id z18sm697958ioi.33.2019.05.15.07.10.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 07:10:15 -0700 (PDT)
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
Newsgroups: gmane.linux.ports.arm.kernel,gmane.linux.ports.tegra,gmane.linux.drivers.devicetree,gmane.linux.kernel.clk
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <630d7218-3f5f-88bc-1ba4-065a6200265e@gmail.com>
Date:   Wed, 15 May 2019 17:09:34 +0300
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

> +int tegra_emc_dt_parse_pdata(struct platform_device *pdev,
> +			     struct emc_table **tables,
> +			     struct emc_table **derated_tables,
> +			     int *num_entries);
There is no definition for this function. Again, please clean up the
code properly.

-- 
Dmitry
