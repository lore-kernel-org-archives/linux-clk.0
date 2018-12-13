Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A264C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 10:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49455208E7
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544698194;
	bh=KfThjzzExAxPJ8Efasm9oMAf36zII4AZuo9FWhrjAG8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=iDK0QptX/dlFJkSFpi1ujM30X9oDyABKLBxBeY8x0GgGmtZI1kn5k7MqHCdJ3z+b+
	 HZ4g6f4Y5OxHFkyNO92ZnAtpiZMDRfLmE6zXxcigoeD0+TTL9uqPppThslz5IxWDuF
	 tj1LhMbsjy2ZZzMe5RYeyvu7+EQSlqJpr81XvZTo=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49455208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbeLMKtx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 05:49:53 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35560 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbeLMKtx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 05:49:53 -0500
Received: by mail-oi1-f193.google.com with SMTP id v6so1273489oif.2;
        Thu, 13 Dec 2018 02:49:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KfThjzzExAxPJ8Efasm9oMAf36zII4AZuo9FWhrjAG8=;
        b=SGpFqw3UDzoLYcW14hwhxkOqo4ovEz6vrLN0v45zYblJapj9FoRyBDuysSAIB2Z6OA
         2nNsJbUszvWtc9Qr7P7JH/651Y6cIxWW5P9x3vmiDrJeVy7RcH7zhDxgpZgDSxHDXhUk
         Ma9Vocw6YEBC5cFkbQSjmqpxNq0DBO4eitUhw2o3/YrcRMVjw+Lpmxn9Cwl2JnVvuEjB
         pam/LZs1/5iSR43WBnhdi7rseLVfdA7J7ooKaYGrkKzz8k5/vzXgynbmV1nYjYlKXqa2
         Etq3xPDy+tkgC5ND0JR62SI1yt2yC9sO/B20SYhx1Djt4KKh8BH5cMljx2SHUPmEosUc
         TiHA==
X-Gm-Message-State: AA+aEWYPuSAejNYXXXsH1wZ1wXvJSOdhvaPvnk2jH0QI1sJ3sdm2cbrB
        1Wggw9gsp80i0YzKl7fQe5X44qfKaVHmA/fgIzA=
X-Google-Smtp-Source: AFSGD/XWQp2Ugee3yUoeTKs3fpTVNw+E/X9JsPd2mCw71dqI0reQgLwWAWeJeWbDXbAi9IyKMrJemmEkV/htHz1iixI=
X-Received: by 2002:aca:b642:: with SMTP id g63mr2429127oif.195.1544698192914;
 Thu, 13 Dec 2018 02:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20181213093438.29621-1-josephl@nvidia.com> <20181213093438.29621-13-josephl@nvidia.com>
In-Reply-To: <20181213093438.29621-13-josephl@nvidia.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 13 Dec 2018 11:49:41 +0100
Message-ID: <CAJZ5v0jVFGe6UXsqFEwRL58jAaAp-_FHrkjYkLwtSkSLLOKetg@mail.gmail.com>
Subject: Re: [PATCH V2 12/21] cpufreq: tegra124: do not handle the CPU rail
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

On Thu, Dec 13, 2018 at 10:35 AM Joseph Lo <josephl@nvidia.com> wrote:
>
> The Tegra124 cpufreq driver has no information to handle the Vdd-CPU
> rail. So this driver shouldn't handle for the CPU clock switching from
> DFLL to other PLL clocks. It was designed to work on DFLL clock only,
> which handle the frequency/voltage scaling in the background.
>
> This patch removes the driver dependency of the CPU rail, as well as not
> allow it to be built as a module and remove the removal function. So it
> can keep working on DFLL clock.

I assume this entire series to go in via arm-soc, so I won't be
picking up cpufreq changes from it.

Thanks,
Rafael
