Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084A2C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 21:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A21FD20851
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544735414;
	bh=qaIA7B9cepXm520YuNU11xGyNyq4Yw8wUPR2nrz3eLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iiAZ9ayMKuCjIPBkCjfHLMicG/HgUkHQ0Ssifmq0fXEBNaf3sFPc3OT9YWqPNdi88
	 9C18l6/KkUs5sIALyXjPB/o+k9dY9ptDLMrH65ARof/lfN0aRdsJszj2wr96hZvhPh
	 sClYMSzNZZOMyCkcAVMLsGaiCBJvHTrU+yV1ddrI=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A21FD20851
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbeLMVKO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 16:10:14 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41736 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbeLMVKN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 16:10:13 -0500
Received: by mail-ed1-f67.google.com with SMTP id z28so3219041edi.8;
        Thu, 13 Dec 2018 13:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oQ8s1FPAb+RRxalNQebUosYIbKp6FpOTseE9KRC3QRU=;
        b=fORiY8A+KkwPXlC4rrpRgRAqhJ/Tu77z9+Yb69Y0Xuy4nP6UTh2filJ8EMMVb+eUpM
         DsTh9iQfVQqh2U+gNMoSO5QKaJiZqyLvPG51Rz641CNnWE3IFXTqTHL58FL5OH3Gsuz9
         4a5eLuzwGKtnmYLXtuJ3gJsEo+YB/m/pEQzOLRmlFyMRozlMPbvpp7ncSDm87hi+Gjes
         YlAm8P6QWeEIbCZ3SbLvvLscYU0HfPZW27UvxqYZR7ubIsIbtXRePvJIbzhP+2R7Qlj3
         lLWVsFkmZwkmm6aXswsf9Hk5rhYujBEzx4D2Qr7zdRSgfBOoMA8ub+8drY2BLDzCd5T1
         XZhA==
X-Gm-Message-State: AA+aEWZ+V5Pnr0bHVAArmw3dgok2pLmb6XmNEt8cCQCLWOhAw3dQiGTg
        fgCGHck5OdQc73K5i32LYnOnxtwFhfg=
X-Google-Smtp-Source: AFSGD/WKXaQ7HXjCzZr8hUzZwK2DeJxdlz9wtnNWVSxQ4G0lO2w9c2PsB3VAHapv8lVPWQnQn/BhqQ==
X-Received: by 2002:a17:906:4b19:: with SMTP id y25-v6mr541561eju.89.1544735411556;
        Thu, 13 Dec 2018 13:10:11 -0800 (PST)
Received: from kozik-lap ([178.38.170.116])
        by smtp.googlemail.com with ESMTPSA id f35sm927344edd.80.2018.12.13.13.10.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Dec 2018 13:10:10 -0800 (PST)
Date:   Thu, 13 Dec 2018 22:10:09 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 4/5] arm64: dts: exynos: add imem clock
Message-ID: <20181213211009.GA5444@kozik-lap>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275@eucas1p1.samsung.com>
 <20181204165248.17572-5-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204165248.17572-5-k.konieczny@partner.samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 04, 2018 at 05:52:47PM +0100, Kamil Konieczny wrote:
> Add description for imem clock in the Samsung Exynos5433. The users can use
> compatibility "samsung,exynos5433-cmu-imem".

Thanks, applied but the commit message above is not matching contents at all.
You did not add the description. Mentioning some users and compatibility
also seems unrelated. Instead:
1. You added DT node for IMEM clock controller on Exynos5433.
2. Because it is necessary for SSS to work (beside obvious reasons: for
   DTS completeness and allowing to gate them when not used).
Also, please use SoC name in commit title (for example at the end) to
differentiate from Exynos7 or any other future SoCs.

Best regards,
Krzysztof

