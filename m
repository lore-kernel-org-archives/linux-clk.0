Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D36D2EEE75
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 02:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353402; cv=none; b=IKhASMfgbP83BB4wxZhnxwTKjyX0cJnZAcqDPPkA26xgqPfy+R2M7O0+MbTVWHPpn1gOVtkQIULfaw4+/ygkTL3/r5SKwsMyPDVNxuxMfziai0Eq23T/ibh5QRl+m/c+nnU0c2oMaF6+8nYLODG+YP6FHOdjuKrSXWVbKcKTQ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353402; c=relaxed/simple;
	bh=X7iBjgij1tNj8YyBy2KBS1H7EtvzZTk6NnGz0OxyKvE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H/S6hbgTkvr+qP7bSG6BUtNsBllt26IVcZJFK64v8hOoFjNNC3G4qP0WG+8d9w06/EBtZ/FX19EkfInzP5r1jBHb/bkexO4P3B5xk5crY8YE1r+zVF/IXqqIsnQ1ovcg0Tt6l1i+iOhOL5WEd5/6hD/lGXVzmMLdeQ4R4/Tdhwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 16c378d4afe511f19a56ed5b684f684d-20260914
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:f308b0ce-1964-4386-98a5-bc3e10e8cde7,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:dd9dd3b31e111997af85a3272a620225,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 16c378d4afe511f19a56ed5b684f684d-20260914
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 544137918; Mon, 14 Sep 2026 10:36:28 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Frank Li <Frank.Li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	gonglinkai@kylinos.cn
Subject: Re: [PATCH v2] clk: imx: composite-93: return timeout from gate enable
Date: Mon, 14 Sep 2026 10:36:26 +0800
Message-Id: <20260914023626.1296412-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aqLRCHFEbyUnSCEG@SMW015318>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn> <20260907022214.1076402-1-gonglinkai@kylinos.cn> <aqLRCHFEbyUnSCEG@SMW015318>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 10, 2026 at 10:47:20AM -0500, Frank Li wrote:
> Don't post to v1's thread.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Noted, thanks. I will send later versions as a new thread.

Thanks,
Linkai
