Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com [212.61.153.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34D3AB286;
	Thu,  9 Apr 2026 09:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.61.153.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775726949; cv=none; b=JsT6CH5AEzn/l3KpQ7je7Sz3b66Dh5GKs9WHV1rhg8h0IUy/jVDeYBOTboe7EFaAyMvEfs7Vej8pPVxPJXHKYpqjneV+9sPnK5S0dd4F7gfhrixunVMFBAj62ozeA+iDD3nnGJm33qcOIZKAs6Bwse6grOh2FDm/W9tg6o9ILMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775726949; c=relaxed/simple;
	bh=qMabHelRPCuOMLmiUlPC7oy4lz0QK1Ulkxk47nbfzYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JL9ht0Hl/nYLv5iG9kCemWDRJoDOSiCv1DGVnTIIhORz0WZVOqvhDMpTqO+pQjRMjcC5fOMO2IF1p9HgouQ4kk44g827cMQeg/OB1eMt9UiZsBb2Tk3zhy1b0ticn4R7rOvnEV6d62wH3i1difQXH3N4Vc3A00KlB9u8nC9qslc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; arc=none smtp.client-ip=212.61.153.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Received: from EXCOP01.bk.prodrive.nl (10.1.0.22) by EXCOP02.bk.prodrive.nl
 (10.1.0.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 9 Apr
 2026 11:29:03 +0200
Received: from lnxdevrm02.bk.prodrive.nl (10.1.1.121) by
 EXCOP01.bk.prodrive.nl (10.1.0.22) with Microsoft SMTP Server id 15.2.1748.39
 via Frontend Transport; Thu, 9 Apr 2026 11:29:03 +0200
Received: from paugeu by lnxdevrm02.bk.prodrive.nl with local (Exim 4.96)
	(envelope-from <paul.geurts@prodrive-technologies.com>)
	id 1wAlh9-00GNSA-2r;
	Thu, 09 Apr 2026 11:29:03 +0200
From: Paul Geurts <paul.geurts@prodrive-technologies.com>
To: <peng.fan@nxp.com>
CC: <abelvesa@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <shawnguo@kernel.org>, <linux-clk@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <martijn.de.gouw@prodrive-technologies.com>,
	<paul.geurts@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Date: Thu, 9 Apr 2026 11:29:03 +0200
Message-ID: <20260409092903.3903393-1-paul.geurts@prodrive-technologies.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <addMdwvnDkCMJxhx@shlinux89>
References: <addMdwvnDkCMJxhx@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

> On Wed, Apr 08, 2026 at 12:13:13PM +0200, Paul Geurts wrote:
> >The i.MX8MM clock driver is implemented as module_platform_driver();,
> >which makes it initialize in device_initcall(). This means that all
> >drivers referencing the clock driver nodes in the device tree are
> >deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >
> >Explicitly initialize the clock driver in arch_initcall(), to make sure
> >the clock driver is ready when the rest of the drivers are probed.
> 
> Let's keep as it is, changing to arch_initcall() is not allowed.

Why is it not allowed? This is an arch driver, so I think it should be
initialized in arch? I don't think the initcall system was intended to
initialize everything in late_initcall, which is effectively what this
problem is causing.

> 
> Thanks,
> Peng

Thanks!
Paul
