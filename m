Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04D2D7DFE
	for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2026 02:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747605; cv=none; b=Vc64lVXjkiCJ3paZcOKVEVLcpzidi+39y1iMnWee5qgJyWJC7oqXNPzDyx+QLWRb3F9BHYjo1W+U1mKMQr/gnH2kIVIe2CAmRajSTqzudcLbAxpx6qGoT99R73moW8K3znxuq9//1kJrTfdHcIy+HQyexlp2O2vFPfRZqQ868zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747605; c=relaxed/simple;
	bh=DvD0kKjiCVfGXIFWBg5Oc55bb1/uOL62mXSy7cvIIF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eTzEAN0u6ictiZw95IQ+nheHur9SvDs2AeIdosQ6DnlN4t354s/TuMBYRQGUhZMvYDIAZsshlafN6jv0AF+003ERPIrOnv5JJY6thaYwwr082SGDrY346EwhB6MuYr59kD9BC767h4U9/rSkFneyBX3B4CC716RvKvhfWh0OYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9e59ecc0aa6211f19a56ed5b684f684d-20260907
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:fa0a8b24-49e6-44aa-b5f9-391d169aa26b,IP:0,U
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
X-UUID: 9e59ecc0aa6211f19a56ed5b684f684d-20260907
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 444343499; Mon, 07 Sep 2026 10:19:56 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Date: Mon,  7 Sep 2026 10:19:52 +0800
Message-Id: <20260907021952.1042938-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <vfm4yvruim675ev4s6jj2bkyg7zjoifpbdsk5ipvrvpoqvr7yy@c5voyam4vceh>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn> <vfm4yvruim675ev4s6jj2bkyg7zjoifpbdsk5ipvrvpoqvr7yy@c5voyam4vceh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 21, 2026 at 02:49:58PM +0300, Abel Vesa wrote:
> Ok, so you are describing what it does, not why you are doing it.
>
> Please make the commit message a bit more clear about why this change is
> needed.

You are right. I will send a v2 that explains why: enable() currently
hides the timeout from the clk core, so consumers keep going while the
slice is still busy.

Thanks,
Linkai
