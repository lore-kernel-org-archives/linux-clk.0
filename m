Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634A03AD52E;
	Fri, 10 Apr 2026 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809335; cv=none; b=NaYH10ERWOiBv/K5qb3ePqAGiKpvgvgVR+64f9Ta1gdgPgk03ftqpN5oNo5d67c5ynJW9qQkZHdbSUNIYABSaQcYhOEwVSDWDxlpVBKQynwUi3uCo7zDU9aPwamFOsjSMSjv0e5h4PvWy1j/ll6azJ5FsCq8UrcbdJ5FmGO3A8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809335; c=relaxed/simple;
	bh=ZWzkrA/bwLbRCPvX3RFVkYa5zw99jrqSYsIl6QbfexA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LgBPCOAGUQMk+GPpXb7uOTxRqwfeqO0PBoUkxZk1xuN4XtAVQwyvbsODbmVpWH0VEYZOQ5LcuH2eF454lqCd9+3VVM4XQSfOdW/9PFpNBZ/0LJP0FyFPM81AfkiuWTd5NfvAQVz8bwe1ZMACWDVEMfsLHvltMOyvEgWILBt8LsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=XgEU51QU; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="XgEU51QU"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A8JcIfA2678929, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775809178; bh=JS0s+sMh5+ewy1DfxEghosKaPfurtyPM6ofxGjjJm6o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=XgEU51QUMR6TsTTKF7a9IJAwy7WTY0F3TSeg8RaxLuuGc0jEAT8BQOEtsut7KQWS0
	 CTzhpI22ofswvzrziqtxepXd1N6+W/R4fUZv+BxkKFaxRgc0eXCztjmygPAd0L5Cfe
	 tkzgfGO2DwHQyk3W0Tmc9+81in6UDRdEHBhuUzzXezZNzvvDo20svbwSNY2/HcuHh3
	 v7MKKcl++XNSYnt5VXfNOakEDQwnY+pEy3l1268wuyBVzAiWcK8TtlVXozZ5sNg8/y
	 TK+lxJUTtFmnTdK5XJVQsKajlYAEccfnd1XbCMp1fw76OhchjOk8vYEo5gS7OjEU8v
	 8xLZR7kyEeV4Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A8JcIfA2678929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 16:19:38 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 16:19:38 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 10 Apr 2026 16:19:37 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <bmasney@redhat.com>
CC: <afaerber@suse.com>, <conor+dt@kernel.org>, <cy.huang@realtek.com>,
        <cylee12@realtek.com>, <devicetree@vger.kernel.org>,
        <eleanor.lin@realtek.com>, <james.tai@realtek.com>,
        <jyanchou@realtek.com>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-realtek-soc@lists.infradead.org>, <mturquette@baylibre.com>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>, <sboyd@kernel.org>,
        <stanley_chang@realtek.com>
Subject: Re: [PATCH v6 05/10] clk: realtek: Add support for gate clock
Date: Fri, 10 Apr 2026 16:19:37 +0800
Message-ID: <20260410081937.2859395-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ac_RcGSpVBpt3S7C@redhat.com>
References: <ac_RcGSpVBpt3S7C@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi Brian,

> Hi Cheng-Yu,
> 
> On Thu, Apr 02, 2026 at 03:39:52PM +0800, Yu-Chun Lin wrote:
> > From: Cheng-Yu Lee <cylee12@realtek.com>
> > 
> > Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> > disable_unused for standard regmap gate clocks.
>
> disable_unused is not implemented below.
>

Will remove it from commit message.

> > 
> > Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> > 
> > Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > Changes in v6:
> > - Add the headers used in c file to follow the "Include What You Use" principle.
> > ---
> >  drivers/clk/realtek/Makefile          |  2 +
> >  drivers/clk/realtek/clk-regmap-gate.c | 69 +++++++++++++++++++++++++++
> >  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
> >  3 files changed, 136 insertions(+)
> >  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
> >  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
> > 
> > diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> > index a89ad77993e9..74375f8127ac 100644
> > --- a/drivers/clk/realtek/Makefile
> > +++ b/drivers/clk/realtek/Makefile
> > @@ -2,5 +2,7 @@
> >  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
> >  
> >  clk-rtk-y += common.o
> > +
> >  clk-rtk-y += clk-pll.o
> > +clk-rtk-y += clk-regmap-gate.o
> >  clk-rtk-y += freq_table.o
> > diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> > new file mode 100644
> > index 000000000000..8738d6c6f8dd
> > --- /dev/null
> > +++ b/drivers/clk/realtek/clk-regmap-gate.c
> > @@ -0,0 +1,69 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2017 Realtek Semiconductor Corporation
> > + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> > + */
> > +
> > +#include <linux/regmap.h>
> > +#include <linux/bits.h>
> > +#include "clk-regmap-gate.h"
> > +#include <linux/clk-provider.h>
>
> linux/clk-provider.h needs to be included before clk-regmap-gate.h.
>

Ack.

> Also Sashiko reports that linux/export.h should also be included.
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com
> 
> Brian

Ack.

Best Regards,
Yu-Chun.
