Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0241E5B64;
	Mon,  8 Dec 2025 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183039; cv=none; b=AzfWGzC6jOTq3rJpg9MNyc8yAdsJkV/PCIpiKwYFgBt6vQEkcK1bdII7akIegWERtCLCAPVPjsSGNUvG9Zp1JzYWpbb3UNKWxc6ohTgm9R8h1l4NStuLTUZxkips8hXkKdmPQPCpjt78NhwFzVKs+a5ERk8s3J7wZY6cdCNEuFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183039; c=relaxed/simple;
	bh=NdNjl2J3ccjOB4thV/GwKN54UVAGgl5HoTusbEEyoqE=;
	h=Date:From:To:Cc:Subject:References:Mime-Version:Message-ID:
	 Content-Type; b=acnIWWeArXNCZrDSg/P0wSA66qE6PYjnSyF306R8Wd4Jqs2DyXwPNx5/hYLRHYfFHbP0H0kMKFTqH6jfbj/aZHozY1jmfcIhR5KasxtcYlxQeXOZpSoxHm5fv9wu2Q71dHdgSsGtXje3S4bt2gpEEEeNWAr7Z1MnqJpBcxoWfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 152a965cd41111f0a38c85956e01ac42-20251208
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2692fd42-fe22-4279-8625-deb34b406d11,IP:0,UR
	L:0,TC:0,Content:45,EDM:0,RT:7,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:52
X-CID-META: VersionHash:a9d874c,CLOUDID:1d7404d33f2ebdc1b22701ddd9fee437,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|83|102|855|898,TC:nil,Content:3|15
	|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 152a965cd41111f0a38c85956e01ac42-20251208
X-User: chenchangcheng@kylinos.cn
Received: from ccc-pc [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 851344871; Mon, 08 Dec 2025 16:37:08 +0800
Date: Mon, 8 Dec 2025 16:37:07 +0800
From: "chenchangcheng@kylinos.cn" <chenchangcheng@kylinos.cn>
To: chenchangcheng <chenchangcheng@kylinos.cn>, 
	mturquette <mturquette@baylibre.com>, 
	sboyd <sboyd@kernel.org>
Cc: bmasney <bmasney@redhat.com>, 
	bhelgaas <bhelgaas@google.com>, 
	linux-clk <linux-clk@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] clk: microchip: core: fix pointer being initialized twice.
References: <20251208032644.25620-1-chenchangcheng@kylinos.cn>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <202512081637045405901@kylinos.cn>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64

CgpTb3JyeSwgdGhlcmUgaXMgbm8gbmVlZCB0byByZXBseSB0byB0aGlzIHJlcGFpcgoKCgotLS0t
LS0tLS0tLS0tLQpDaGVuIENoYW5nY2hlbmcKY2hlbmNoYW5nY2hlbmdAa3lsaW5vcy5jbgoKCgoK
Cj5maXggc3BhcnNlIHdhcm5pbmdzOiAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pCj4+PiBkcml2
ZXJzL2Nsay9taWNyb2NoaXAvY2xrLWNvcmUuYzo5MTU6MTA6IHNwYXJzZTogc3BhcnNlOiBJbml0
aWFsaXplciBlbnRyeSBkZWZpbmVkIHR3aWNlCj4/PyBkcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xr
LWNvcmUuYzo5MTk6MTA6IHNwYXJzZTo/PyBhbHNvIGRlZmluZWQgaGVyZQo+Cj5SZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj5DbG9zZXM6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTExMjIyMTE1LnV2SHJQOTVBLWxrcEBpbnRl
bC5jb20vCj5GaXhlczogZTlmMDM5YzA4Y2RjICgiY2xrOiBtaWNyb2NoaXA6IGNvcmU6IGNvbnZl
cnQgZnJvbSByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSIpCj5TaWduZWQtb2ZmLWJ5
OiBDaGVuIENoYW5nY2hlbmcgPGNoZW5jaGFuZ2NoZW5nQGt5bGlub3MuY24+Cj4tLS0KPiBkcml2
ZXJzL2Nsay9taWNyb2NoaXAvY2xrLWNvcmUuYyB8IDEgLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCj4KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xrLWNvcmUu
YyBiL2RyaXZlcnMvY2xrL21pY3JvY2hpcC9jbGstY29yZS5jCj5pbmRleCBiMzQzNDhkNDkxZjMu
LjIwZjI1ZDJkYjA1ZCAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvY2xrL21pY3JvY2hpcC9jbGstY29y
ZS5jCj4rKysgYi9kcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xrLWNvcmUuYwo+QEAgLTkxNiw3ICs5
MTYsNiBAQCBjb25zdCBzdHJ1Y3QgY2xrX29wcyBwaWMzMl9zY2xrX29wcyA9IHsKPiAJLnNldF9y
YXRlCT0gc2Nsa19zZXRfcmF0ZSwKPiAJLnJlY2FsY19yYXRlCT0gc2Nsa19nZXRfcmF0ZSwKPiAJ
LmluaXQJCT0gc2Nsa19pbml0LAo+LQkuZGV0ZXJtaW5lX3JhdGUgPSBfX2Nsa19tdXhfZGV0ZXJt
aW5lX3JhdGUsCj4gfTsKPiAKPiAvKiBzY2xrIHdpdGggbm8gc2xldyBhbmQgbm8gcG9zdC1kaXZp
ZGVyICovCj4KPmJhc2UtY29tbWl0OiBjYzNlZTRiYTU3Yjc2ZGVlZmI1MmFlZTVmNTdhNDZkYzA3
YmRhOWY3Cj5wcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDZjYzVhMGVjMGRiNDc1NmNiOTVjNWQ2N2Ez
ZDI3YTU3Mjg4ZmRhYTcKPi0tIAo+Mi4yNS4xCgoK

