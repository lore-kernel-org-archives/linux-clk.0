Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:36137 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731598AbeGTOd6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Jul 2018 10:33:58 -0400
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co,
        thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk
Subject: tegra clock updates and fixes
Date: Fri, 20 Jul 2018 14:45:24 +0100
Message-Id: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi, this is a set of clock updates and fixes we did when developing
the tegra20/tegra30 auto support. The audio change is due to using
the tegra in clock-slave mode (this hasn't been done before)

We have also implemented the clock reset status callback as it is
used by some of the driver work we did.


