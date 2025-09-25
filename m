Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4212510A1E;
	Thu, 25 Sep 2025 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758786932; cv=none; b=A0WiTdNVHZpsYQCKEpeTxTGtIPhvAd72KjeHAwIVjVJ6xQO2o+WyLDfOS0Wp6IbLWYr/EdmxSSSvzpOuZGcYzsWkZMJoi3F76yzjhdVeiEqOIvgvS91udSTf0h5n+4EyzRpUL7aaRFfQV/bcE12ugVw8I4hI6W3AKvPl+ayPnXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758786932; c=relaxed/simple;
	bh=KZSpW5WibJYJiM3luN+GARqCU01+Gmc6MgRNSf9Ixpc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=myAeYPpkxWx/KxRE+lFnlNsShx2YI5WE2BG+KoqZSspzEI35a5RKxsOI52iXcKVS0Y0nvRNkHS23R5AS04DtWXhVTu4nCqoxc9wAG67qAZtJkX3NCxag3ARpOjWHL3cdKwmY/KK0cEvP6Wqev+g6wMcJ4dSTbZRR5T6/KKwNSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cF2wqmEu; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cF2wqmEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758786931; x=1790322931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KZSpW5WibJYJiM3luN+GARqCU01+Gmc6MgRNSf9Ixpc=;
  b=cF2wqmEu94dczNWNgO0lH93JtUIqYkbEo/s7PfcIzzfgPMWJ4/yrqai7
   2kFY347Pnzs8YGaQVza6F1AbMAJejP2SwYcccCbapVgbGw7avwfwufZdr
   HsmOC2qPpAZgCrucjOKkMZlzEml6spKXQ0h/CM2//TGKfnYD4e0uamqP7
   L0NKoCCM4xKZHO49+S6U3egSFTx9USSpiHw4ygYFzVFo8iIX0zsuSDpz/
   TlXLjc/cp4OgC6XtlOTQXHF9Nht3Egx22uw2Iuh/gdqSpWAPNggHZknyG
   bCGsDL3yhD4RugZLxUnFkGVsKKW1Nmz9/PxsGDkoPqsz2jgpFz0Z9XEo9
   w==;
X-CSE-ConnectionGUID: fGMKqrFESeeS1FymqtpKqA==
X-CSE-MsgGUID: RY+ZcpCrSgu4aWC2XP+3/w==
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="46968124"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Sep 2025 00:55:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 25 Sep 2025 00:55:04 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 25 Sep 2025 00:55:03 -0700
Date: Thu, 25 Sep 2025 07:55:02 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@tuxon.dev>, <luka.perkov@sartura.hr>,
	<benjamin.ryzman@canonical.com>
Subject: Re: [PATCH] clk: lan966x: remove unused dt-bindings include
Message-ID: <20250925075502.bb3yfk5y44mcdsw5@DEN-DL-M70577>
References: <20250924202810.1641883-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250924202810.1641883-1-robert.marko@sartura.hr>

> In preparation for LAN969x support, all instances referring to defines in
> the LAN966x specific header were dropped, so its safe to drop its inclusion
> in the driver.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

LGTM, but maybe next time, add a ref [1] to the preparation commit you mention.

[1] https://lore.kernel.org/linux-clk/20240916-lan969x-clock-v1-3-0e150336074d@microchip.com/

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
