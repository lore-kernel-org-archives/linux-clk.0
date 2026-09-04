Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDEB4334AD;
	Fri,  4 Sep 2026 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513200; cv=none; b=N5Kp15fqY+25SspuHOvO25tiEehCQ50867EHbXaCq2xXBGpp2jjDlSmIKQk0/A0vvsArmF1NKmL1F/vRj73aa0PaZ36EAqrM+s2GZB2MR7qEdP7ASpQqvIptWd7E0rsG+ZY5i2FDwVX3Uw05hzwrpM4vijB/Pwc93364VjCwqhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513200; c=relaxed/simple;
	bh=QucwaclOjyYHopgW8/mLC1xI5HcNHu4T0BXjt5NsW50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XrIkKCt3b7GGwbhoYFYMbZrsQMYYOJQ+J93tn+q6gqDGusYZXE25L9OdeX2p7wFkp8sg4s4gReGpVN0J8LGGOuCOP3mKCXdW+WvXFvHF+k5I4lGPROcmhb2otmczhxVkotjnP3j4uL9jBVTvG+g1FyKU/Mvof9bn3MAA3WHePqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d88b31dea84011f19a56ed5b684f684d-20260904
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:cfa902b0-1f0a-4bf3-8060-1d9ab420d2fe,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:6472706a6be62be334e54d3a4e77b7ad,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d88b31dea84011f19a56ed5b684f684d-20260904
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1127481883; Fri, 04 Sep 2026 17:13:08 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: sudeep.holla@kernel.org
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn, mturquette@baylibre.com, sboyd@kernel.org
Subject: Re: [PATCH v2 5/5] clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq
Date: Fri, 4 Sep 2026 15:55:00 +0800
Message-ID: <reply-scpi-hardening-v2-ping.20260904.liuxixin@kylinos.cn>
In-Reply-To: <20260728-cuddly-alpaca-of-serenity-c0c824@sudeepholla>
References: <cover.v2.1785200642.git.liuxixin@kylinos.cn> <fb51cfbfbb41.v2.1785200642.git.liuxixin@kylinos.cn> <20260728-cuddly-alpaca-of-serenity-c0c824@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: patches/scripts/send-local.py

Hi Sudeep,

Just a gentle ping on this v2 series from 2026-07-28.
Dropping the 5/5 cleanup on apply is fine with me.
Could you please apply the rest when you have a chance?

Thanks,
Xixin Liu

