Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31D3E1723
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 02:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747657; cv=none; b=CkUrikhOPn5YaYH1R3ddjG1FmkvuOVrpUsCBAtnVJ7J0VzW8JI7gs1X8gZWlVh9cKAC0z/KlEYDheu3b7/IOUcDIQotsrVSxqtmOdHuXy3Gr1SoL6PNrzMOmGjjsaTErjYgeT9t8B10gLby5yVF7drSUQP3W5lLdZVbU2lxN+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747657; c=relaxed/simple;
	bh=iuwBsBljlJsGfE85nL+6pQCW7IlPR0GAC9bJL81Gnl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aiiFtD2MHBihnosvFJN4yVDdutqolluHDSIIalKAUosJSSGTh0WMmFDXwmDf13xi6RPNs+kMy8VsJxj7EimEM90PmJcUWLQJEuxLMCun7gE+RWDNTDlrWjODW/NzWbGYnz6s8Fi04z0OAf9aXV6BseX8FOwwktgSLqYh12HFvUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bdaffe52aa6211f19a56ed5b684f684d-20260907
X-CID-CACHE: Type:Local,Time:202609071019+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:bd2cf915-2a8a-4423-8dc7-9839c1d61848,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:838c336ffe5aa4a1c76c980d8db66494,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898,TC:nil,Content:0|15|50
	|99,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bdaffe52aa6211f19a56ed5b684f684d-20260907
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1772503598; Mon, 07 Sep 2026 10:20:49 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Peng Fan <peng.fan@nxp.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Date: Mon,  7 Sep 2026 10:20:46 +0800
Message-Id: <20260907022046.1055639-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <apfcGMg4aDLU5lBO@shlinux89>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn> <apfcGMg4aDLU5lBO@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 02, 2026 at 04:17:54PM +0800, Peng Fan wrote:
> Do you meet any issues or just code inspection?

Just code inspection. Compile tested only, I do not have i.MX93
hardware.

wait_ready() already returns the timeout, but enable() drops it and
always returns 0. The clk core then treats the clock as enabled while
the slice is still busy. That is why the error should be propagated
even without a field report.

I will send a v2 with a clearer commit message, as Abel asked.

Thanks,
Linkai
