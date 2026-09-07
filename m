Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9967478;
	Mon,  7 Sep 2026 01:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788745361; cv=none; b=AhahQJmF9KyKASw3Y5a8NqmIVrx/eb7yJUMjeSQIoWyf4QinOUddQRYhVX49qgat9It5t7dxGNqVEFrWi5U9lpDvFwotz1fVg1JVWcYelKeQwBXOX+gMyPvyM1KHBMn5FiY+3lo27JTZJpsV7Wb9sfHbHBqU8pVweRQypfX6HFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788745361; c=relaxed/simple;
	bh=rcKkLl0+HMemz7y0htxoayTeLNWt4yhwfwIZG+eNesg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhI/6OPgjmXTI51s+/9W5CjCutSfAqUPU42Gfrlenm6jnEBWlpHPy7Jbj/7NbZ3iV1ZvMlbp040bH+ebngDnCE/3OIYP1d536JbgnT421h8zVTFMQseQY4MUXsd24qn4tDHe/p/ddkEJ5ukjM7gpS23iARkTobvuWQrOsQBXNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5f102b56aa5d11f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e72015f5-cc9e-4b78-935d-bf75381495c0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:6d069ef7f174f2f2823559d39252c101,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5f102b56aa5d11f19a56ed5b684f684d-20260907
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 449294600; Mon, 07 Sep 2026 09:42:22 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: sudeep.holla@kernel.org
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn, mturquette@baylibre.com, sboyd@kernel.org
Subject: Re: [PATCH v2 0/5] firmware/clk: arm_scpi hardening (leak, OPP bounds, cpufreq)
Date: Mon, 7 Sep 2026 09:35:00 +0800
Message-ID: <reply-scpi-hardening-v2-thanks.20260907.liuxixin@kylinos.cn>
In-Reply-To: <178852798387.330796.10489318614485340307.b4-ty@b4>
References: <cover.v2.1785200642.git.liuxixin@kylinos.cn> <178852798387.330796.10489318614485340307.b4-ty@b4>
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

Thanks for applying the series.

Thanks,
Xixin Liu

