Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0681BC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C88C521841
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545125860;
	bh=NtEbTZIVa3HtZubsN6gQw/OvUX1eel6J+S3vlFJZdMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=UV5YN4PsCzSEcvUxWZGipFSpX2o5CmZED8ZytpKmgXM8vZ8XqQDnYa3n/Dm3wUj9n
	 9eHRoQRs/kSoi2eFFwQlhdMTbO0OL/0i03GmpwLyTmpqBAUXzc93k1GJyVHDaDCIfR
	 Tyn29K23w7eJjhd4HPaf7Nsj8+z24kpRJnqnC9aw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbeLRJhk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:37:40 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37697 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbeLRJhk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 04:37:40 -0500
Received: by mail-oi1-f194.google.com with SMTP id y23so1444114oia.4;
        Tue, 18 Dec 2018 01:37:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtEbTZIVa3HtZubsN6gQw/OvUX1eel6J+S3vlFJZdMA=;
        b=LpAu0BuFngoULrZFxNYVt5tZ7XRwltDxbt/QpnMJ24cXO5WJIMRKjM5xuURatI7xCm
         cFAcsPEHive/HQYOg24Xpb4nfvV7GmH5AjhzklPaFztCVPOXvHZU6nk2PK/tlOuZZhpg
         h9bfYZpobfYlbSI4LGI0/5A010dlz6BULzrUovU4KMjJWFhEuV3TNXaQb0ZpKia+cLAo
         bnmvatUNC+LoiAKfEqmfPFT/h2p0BiEWwguVSqfJz98jb9RGLxiKs3sGv4ShSZrKZv8X
         Iwuli0nspathq7tajYsNq2L2/Bsr3HWgml1mLg+GYCvszf3loFoWU7ahRMdtla2DoRCw
         1BNA==
X-Gm-Message-State: AA+aEWavyD4OE0Q+224YCNih9SXzdt0eHA7f40umW3GsqYQHI9ehuQpo
        rqgbfFIZHSF1ucPslYrZykgnHb6VFsuWb+l8ZKg=
X-Google-Smtp-Source: AFSGD/UAgt+i+CCX/hSPt2IZPUFnCkHDZdPdmfTJn1PefSS/ZauMF3UUjgctFFr3j5ZFu/KuogslbboVLDWygfW0K44=
X-Received: by 2002:aca:3d42:: with SMTP id k63mr7705258oia.95.1545125859261;
 Tue, 18 Dec 2018 01:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20181218091232.23532-1-josephl@nvidia.com> <20181218091232.23532-12-josephl@nvidia.com>
In-Reply-To: <20181218091232.23532-12-josephl@nvidia.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 18 Dec 2018 10:37:27 +0100
Message-ID: <CAJZ5v0h0n2AXERvXFX_dQWMUw_89ap_LgB6dUK0ThJgZ+unkkQ@mail.gmail.com>
Subject: Re: [PATCH V3 11/20] cpufreq: tegra124: do not handle the CPU rail
To:     josephl@nvidia.com
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 18, 2018 at 10:13 AM Joseph Lo <josephl@nvidia.com> wrote:
>
> The Tegra124 cpufreq driver has no information to handle the Vdd-CPU
> rail. So this driver shouldn't handle for the CPU clock switching from
> DFLL to other PLL clocks. It was designed to work on DFLL clock only,
> which handle the frequency/voltage scaling in the background.
>
> This patch removes the driver dependency of the CPU rail, as well as not
> allow it to be built as a module and remove the removal function. So it
> can keep working on DFLL clock.
>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

I'm assuming that this entire series will go in via arm-soc, so I
won't be picking up the cpufreq patches from it.

Please let me know if that is not what you want.

Thanks,
Rafael
