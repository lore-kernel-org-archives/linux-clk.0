Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DD47989A;
	Tue,  8 Sep 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857071; cv=none; b=uVwKLTWwseRxEIljNr0P4QusLG1ZOS5MKXUKJoMgmSNOUHASiXHLXjOvZgZ17ZxAEp9ZQWdScwPt4dznHf6+GO1R6GQuR1/YuDkcXMr8xnJKHiZ1BiFREzc7Ylm70gmFybZhYcFr2K2N6MiPQPrRRttjMorzf7CBP3px4hFthDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857071; c=relaxed/simple;
	bh=5V+TaMv9Ogqtc4y+jaL5ELdDROlFp0uCvU+BEhHuR8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b1Oo698tMIUIjXYPG6RCbH6jtbFm+UsVaGk3fXj7s4CaOrBVZLE2mJTzNaBmErna1zvs72z5SzEmShiNF3ZerQlH//QAYKnGRFzeJtzSzhLS0NidbUMZCDX5EdGVOmTC0BkPezGMaIapYkwbTNUkZMnR/1keVSnOjAxp5fta6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7a4254bcab6111f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cb267e7d-0320-435d-9a12-372a838b44c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:bee35b66cdf6ded3c19fc45a24428d0c,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a4254bcab6111f19a56ed5b684f684d-20260908
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1557087419; Tue, 08 Sep 2026 16:44:17 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Michal Simek <michal.simek@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Mike Turquette <mturquette@linaro.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	Kees Cook <kees@kernel.org>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: Re: [PATCH] clk: zynq: return -ETIMEDOUT if the PLL never locks
Date: Tue,  8 Sep 2026 16:44:13 +0800
Message-Id: <20260908084413.1503572-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6eec3c2f-5fa2-4e8c-a9a5-82b01cc0a8dc@amd.com>
References: <20260901125323.1556551-1-gonglinkai@kylinos.cn> <6eec3c2f-5fa2-4e8c-a9a5-82b01cc0a8dc@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 02:58:18PM +0200, Michal Simek wrote:
> BIT(clk->lockbit)
>
> And 10 and 1000 are magic values.
>
> Fix itself is fine but I would prefer to explain more why 1ms upper limit was
> used. I don't think it is going to be a problem and 10-1000us is fine. I just
> want to make sure that it will be clear that this value is not coming from any
> TRM but still at least range is aligned with expectation in HW.

Thanks for the review.

Agreed on both points. v2 will use BIT(), name the poll delay/timeout,
and clarify in the commit message that 1 ms is a software upper bound
for a stuck PLL under spinlock, not a TRM-derived value; lock is still
expected well within that window on Zynq.

Will send v2 shortly.

Thanks,
Linkai
