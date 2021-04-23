Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF38C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 07:48:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0FC9613DE
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 07:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241227AbhDWHtV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Apr 2021 03:49:21 -0400
Received: from cable.insite.cz ([84.242.75.189]:44845 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241226AbhDWHtU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Apr 2021 03:49:20 -0400
X-Greylist: delayed 590 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Apr 2021 03:49:20 EDT
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 96E2CA1A3D401
        for <linux-clk@vger.kernel.org>; Fri, 23 Apr 2021 09:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619163533; bh=URCcunjhNq7N1EF2LEyZ/5UKyZRZDRiN52G+nvkkQKM=;
        h=To:From:Subject:Date:From;
        b=jdr72yftGi9QxY7NdosaecO3ryzY8pBgkD8ZEXIXt28n2AlF8Qbj0vAsnSuwTphuO
         KfSAd7EbHkw99+iOfjOe2QtdSNKocSNnGrp+EUa92M/2v6JX2bd6gg5R95OwRDYYuF
         WExny4oNpqe48yQ7umqFi+eFKYodgmlIV5om4NVE=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bRWatDRGG4Oy for <linux-clk@vger.kernel.org>;
        Fri, 23 Apr 2021 09:38:48 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 2E8D3A1A3D400
        for <linux-clk@vger.kernel.org>; Fri, 23 Apr 2021 09:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1619163528; bh=URCcunjhNq7N1EF2LEyZ/5UKyZRZDRiN52G+nvkkQKM=;
        h=To:From:Subject:Date:From;
        b=by8xptjYzdZA1N1Gnp68B0KKs+EK9KOLhnlNIzT16c1mXckJXUk8HBenawC03x+ju
         CDhcqqYvrfj3GbTPnzIbLaQKYCv+w5FVMurQK6qkbX5ZjYplKinh3rb3ksSTJie3MU
         3uYmmJDXHLYWi5j92zDxr+XMCQO7jijlMrsuxIJg=
To:     linux-clk@vger.kernel.org
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Recommended method for changing clk params dynamically from user
 space?
Message-ID: <fceb112b-2241-5f67-2b29-3dda161f7c48@ivitera.com>
Date:   Fri, 23 Apr 2021 09:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi, I would like to add some missing features to clk-si5341.c that I
need for my project. From user-space I need to tune delays at each
output (the driver does not control corresponding registers yet) and
fine-tune frequency while the clock is running (likely the nom/denom
values).

IIUC all driver parameters are currently configured via DT. Please what
is the recommended method/best practice for changing clk params
dynamically from user space? SysFS, configFS? I would like to have the
patches accepted upstream eventually.

Thank you very much.

Best regards,

Pavel.

