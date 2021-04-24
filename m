Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13580C433ED
	for <linux-clk@archiver.kernel.org>; Sat, 24 Apr 2021 08:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D94FD6023E
	for <linux-clk@archiver.kernel.org>; Sat, 24 Apr 2021 08:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhDXICj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Apr 2021 04:02:39 -0400
Received: from cable.insite.cz ([84.242.75.189]:56199 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232588AbhDXICU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 24 Apr 2021 04:02:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 9F7A0A1A3D401
        for <linux-clk@vger.kernel.org>; Sat, 24 Apr 2021 10:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619251256; bh=rPcGrUHWPjFu5gtWmJlh+qk7xsvB9oYfFEM1nAaI330=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=hI01q4t+9QCqa10LIqoDichAs1jfPiFtuMdM7rJbr+Qmd2cBMB2/e0gPbLEBvIQf6
         qHesSqto0BGJihkCtqttIT9u497TsBHJ1VpsXqsn3rneC4y5xzdEwJCl3LryslLZi7
         S3f7rgZcpfjmu5juH1ZoGgmCYT5mWkytn5amF/RE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j18QHMWAzkLC for <linux-clk@vger.kernel.org>;
        Sat, 24 Apr 2021 10:00:51 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 44CD3A1A3D400
        for <linux-clk@vger.kernel.org>; Sat, 24 Apr 2021 10:00:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619251251; bh=rPcGrUHWPjFu5gtWmJlh+qk7xsvB9oYfFEM1nAaI330=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=loW1gxz6egSWH4T9mmrkZPDlgV/ezyKxiSbF+YCsVONolCAHOgjWvlEcsfucxCLu/
         MTFl+AYeDfvluMkZd65pP7C1S239/ONbeUBDMRN9yK8t8Hx6hyg0c5c/vXVoFvebV7
         uk3BbTVDspTF4ZgLYpcQ7X80VOaQE3VvpRjfOjaY=
Subject: Re: Recommended method for changing clk params dynamically from user
 space?
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-clk@vger.kernel.org
References: <fceb112b-2241-5f67-2b29-3dda161f7c48@ivitera.com>
Message-ID: <e07b3b45-2500-4a0e-4874-3bc1ebe75918@ivitera.com>
Date:   Sat, 24 Apr 2021 10:00:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <fceb112b-2241-5f67-2b29-3dda161f7c48@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dne 23. 04. 21 v 9:38 Pavel Hofman napsal(a):
> Hi, I would like to add some missing features to clk-si5341.c that I
> need for my project. From user-space I need to tune delays at each
> output (the driver does not control corresponding registers yet) and
> fine-tune frequency while the clock is running (likely the nom/denom
> values).
> 
> IIUC all driver parameters are currently configured via DT. Please what
> is the recommended method/best practice for changing clk params
> dynamically from user space? SysFS, configFS? I would like to have the
> patches accepted upstream eventually.
> 

From what I have read sysfs seems the most suitable option. But I am
surprised I could not find any driver-specific sysfs code in the clk
drivers. Theoretically I could fine-tune the device via I2C directly
from userspace but that feels wrong. Plus others could potentially
benefit from the features added to the clk driver. Please any suggestions?

Thanks a lot,

Pavel.
