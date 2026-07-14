Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68503EB80E;
	Tue, 14 Jul 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013578; cv=none; b=mKL9EJWUT9y/1qMNLva+YLDT+biaWxPxVKZbpA1TNqvwOmsCHe/m3wL44UgU6/0VSaq/OgKENaRgxXzg5DLDIlOjGKUC7bjxKp9/R52gKhTcHAyIROKzAWDCu6ejTEA34PnlonA2b8/p49ATx4nxt5iOCTkV6jb1e8dKzoQKjL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013578; c=relaxed/simple;
	bh=p/TEO0OIYlbcYKEXbLHusL+X1EsNhSvu1zw+o/Ctp/w=;
	h=From:Subject:To:Date:Message-ID:References:MIME-Version:
	 Content-Type; b=FjP3qx75/meTCh7T9LrAQCzagDN4JL/oU7cRWSTxxG5eFSTtomMUARkZtnLmzNAS/GbHqPeAHjNeT0TntPrNjB0oLH2jEwGz+y5KIv7ss0hsJ2nvPTkDTpqhhIbgzFYmZjoT5JkFe7d/V0wtqBIcWBxSXPbPMXUSEZoCB6KUz/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5b2026887f5411f1aa26b74ffac11d73-20260714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2c42bc6a-3a81-431c-9687-4d56bf30ffd6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:0c3943e35388e9b76129b35f2210a003,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|83|102|136|865|898,TC:0,Content:0|14|
	51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: 872AF74022BD0154919CDFBCF3D7E3D0
X-UUID: 5b2026887f5411f1aa26b74ffac11d73-20260714
Received: from node2 [(10.44.16.64)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1910696087; Tue, 14 Jul 2026 15:19:30 +0800
Received: from node2 (localhost [127.0.0.1])
	by node2 (NSMail) with SMTP id 946B36C0357B1;
	Tue, 14 Jul 2026 15:19:30 +0800 (CST)
Received: by node2 (NSMail, from userid 10001)
	id 6C0766C0357B1; Tue, 14 Jul 2026 15:19:30 +0800 (CST)
From: =?UTF-8?B?5pmP6b6Z6b6Z?= <yanlonglong@kylinos.cn>
Subject: =?UTF-8?B?5Zue5aSNOiBbUEFUQ0hdIGNsay94ODY6IHBtY19hdG9tOiBhZGQga2FzcHJpbnRmIHJldHVybiB2YWx1ZSBjaGVjaw==?=
To: =?UTF-8?B?bXR1cnF1ZXR0ZQ==?= <mturquette@baylibre.com>,
	=?UTF-8?B?c2JveWQ=?= <sboyd@kernel.org>,
	=?UTF-8?B?Ym1hc25leQ==?= <bmasney@redhat.com>,
	=?UTF-8?B?bGludXgtY2xr?= <linux-clk@vger.kernel.org>,
	=?UTF-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
	=?UTF-8?B?bG9uZ2xvbmcgeWFu?= <yanlonglong@kylinos.cn>
Date: Tue, 14 Jul 2026 15:19:30 +0800
X-Mailer: NSMAIL 8.2
Message-ID: <2pl6caky6wwl-2plc0gvp3192@nsmail8.2--kylin--1>
References: 20260714065133.487-1-yanlonglong@kylinos.cn
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Tue, 14 Jul 2026 15:19:30 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=nsmail-2sehhjxg31g8-2seldx9c2mft
X-ns-mid: webmail-6a55e302-2qfwaesm
X-ope-from: <yanlonglong@kylinos.cn>
X-receipt: 0

This message is in MIME format.

--nsmail-2sehhjxg31g8-2seldx9c2mft
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6TWljcm9zb2Z0IFlhSGVpO2ZvbnQt
c2l6ZToxNHB4O2NvbG9yOiMwMDAwMDA7IiBjbGFzcz0ibF9ub2RlX2hhc19j
b2xvciI+PHA+U29ycnksIHRoZXJlJ3MgYW5vdGhlciBpc3N1ZSB3aXRoIHRo
ZSBwYXRjaCBwcm9jZXNzaW5nOyBkaXNjYXJkIGl0LjwvcD4KPHA+Jm5ic3A7
PC9wPgo8ZGl2IGlkPSJzaWduYXR1cmVUb3AiPjwvZGl2Pgo8ZGl2IGlkPSJj
czJjX3JlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDAuNWVtOyBwYWRkaW5nLWxl
ZnQ6IDAuNWVtOyBib3JkZXItbGVmdDogMXB4IHNvbGlkICNjYWNhY2E7IC13
ZWJraXQtdXNlci1tb2RpZnk6IHJlYWQtb25seTsgLW1vei11c2VyLW1vZGlm
eTogcmVhZC1vbmx5OyAtbXMtdXNlci1tb2RpZnk6IHJlYWQtb25seTsgLW8t
dXNlci1tb2RpZnk6IHJlYWQtb25seTsiPjxicj48YnI+PGJyPgo8ZGl2IHN0
eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiAjZjhmOGY4OyBwYWRkaW5nOiA4cHgg
MTBweDsgZm9udC1mYW1pbHk6IE1pY3Jvc29mdCBZYUhlaTsgZm9udC1zaXpl
OiAxNHB4OyBjb2xvcjogIzAwMDsiPjxzdHJvbmc+5Li7Jm5ic3A7Jm5ic3A7
Jm5ic3A76aKY77yaPC9zdHJvbmc+PHNwYW4gaWQ9ImNzMmNfc3ViamVjdCI+
W1BBVENIXSBjbGsveDg2OiBwbWNfYXRvbTogYWRkIGthc3ByaW50ZiByZXR1
cm4gdmFsdWUgY2hlY2s8L3NwYW4+IDxicj48c3Ryb25nPuaXpSZuYnNwOyZu
YnNwOyZuYnNwO+acn++8mjwvc3Ryb25nPjxzcGFuIGlkPSJjczJjX2RhdGUi
PjIwMjblubQwN+aciDE05pelMTQ6NTE8L3NwYW4+IDxicj48c3Ryb25nPuWP
keS7tuS6uu+8mjwvc3Ryb25nPjxzcGFuIGlkPSJjczJjX2Zyb20iPmxvbmds
b25nIHlhbjwvc3Bhbj4gPGJyPjxzdHJvbmc+5pS25Lu25Lq677yaPC9zdHJv
bmc+PHNwYW4gaWQ9ImNzMmNfdG8iIHN0eWxlPSJ3b3JkLWJyZWFrOiBicmVh
ay1hbGw7Ij5tdHVycXVldHRlLHNib3lkLGJtYXNuZXksbGludXgtY2xrLGxp
bnV4LWtlcm5lbCxsb25nbG9uZyB5YW48L3NwYW4+PC9kaXY+Cjxicj4KPGRp
diBpZD0iY3MyY19jb250ZW50Ij5UaGUga2FzcHJpbnRmKCkgZnVuY3Rpb24g
cmV0dXJucyBOVUxMIG9uIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUsIGJ1
dCB0aGUgY29kZSBpbiBwbHRfY2xrX3JlZ2lzdGVyKCkgd2FzIG5vdCBjaGVj
a2luZyB0aGlzIHJldHVybiB2YWx1ZS4gSWYga2FzcHJpbnRmIGZhaWxzLCBp
bml0Lm5hbWUgd291bGQgYmUgTlVMTCBhbmQgY291bGQgY2F1c2UgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIHdoZW4gY2xrZGV2X2h3X2NyZWF0ZSgpIHVz
ZXMgaXQuIEFkZCBwcm9wZXIgZXJyb3IgY2hlY2tpbmcgZm9yIHRoZSBrYXNw
cmludGYoKSByZXR1cm4gdmFsdWUgYW5kIHJldHVybiBFUlJfUFRSKC1FTk9N
RU0pIG9uIGZhaWx1cmUuIEZpeGVzOiAxMTQxZDlkMDgxODQgKCJjbGs6IHg4
NjogQWRkIEF0b20gUE1DIHBsYXRmb3JtIGNsb2NrcyIpIFNpZ25lZC1vZmYt
Ynk6IGxvbmdsb25nIHlhbiAmbHQ7eWFubG9uZ2xvbmdAa3lsaW5vcy5jbiZn
dDsgLS0tIGRyaXZlcnMvY2xrL3g4Ni9jbGstcG1jLWF0b20uYyB8IDMgKysr
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykgZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL3g4Ni9jbGstcG1jLWF0b20uYyBiL2RyaXZlcnMvY2xr
L3g4Ni9jbGstcG1jLWF0b20uYyBpbmRleCA5OTI5MWJhNjVkYTcuLjA4Yzgz
ZTBhYmM0MSAxMDA2NDQgLS0tIGEvZHJpdmVycy9jbGsveDg2L2Nsay1wbWMt
YXRvbS5jICsrKyBiL2RyaXZlcnMvY2xrL3g4Ni9jbGstcG1jLWF0b20uYyBA
QCAtMTYwLDYgKzE2MCw5IEBAIHN0YXRpYyBzdHJ1Y3QgY2xrX3BsdCAqcGx0
X2Nsa19yZWdpc3RlcihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBp
bnQgaWQsIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOyBpbml0Lm5hbWUgPSBr
YXNwcmludGYoR0ZQX0tFUk5FTCwgIiVzXyVkIiwgUExUX0NMS19OQU1FX0JB
U0UsIGlkKTsgKyBpZiAoIWluaXQubmFtZSkgKyByZXR1cm4gRVJSX1BUUigt
RU5PTUVNKTsgKyBpbml0Lm9wcyA9ICZhbXA7cGx0X2Nsa19vcHM7IGluaXQu
ZmxhZ3MgPSAwOyBpbml0LnBhcmVudF9uYW1lcyA9IHBhcmVudF9uYW1lczsg
LS0gMi40My4wICZsdDsveWFubG9uZ2xvbmdAa3lsaW5vcy5jbiZndDs8L2Rp
dj4KPC9kaXY+CjxwPiZuYnNwOzwvcD4KPHA+Jm5ic3A7PC9wPgo8ZGl2IGlk
PSJzaWduYXR1cmVCb20iPgo8ZGl2Pgo8cD4mbmJzcDs8L3A+Cjxicj4KPHAg
c3R5bGU9ImNvbG9yOiAjMDAwOyBmb250LXNpemU6IDE2cHg7Ij4tLS08L3A+
CjxkaXYgaWQ9ImNzMmNfbWFpbF9zaWdhdHVyZSIgc3R5bGU9ImNvbG9yOiAj
MDAwOyBmb250LXNpemU6IDE2cHg7IGZvbnQtZmFtaWx5OiBNaWNyb3NvZnQg
WWFIZWk7Ij48L2Rpdj4KPHA+Jm5ic3A7PC9wPgo8L2Rpdj4KPC9kaXY+Cjxk
aXYgY2xhc3M9ImNhbl9kcmFnIiBzdHlsZT0iLXdlYmtpdC1hcHAtcmVnaW9u
OiBkcmFnOyI+Jm5ic3A7PC9kaXY+CjxkaXYgY2xhc3M9Imx4LXdhdGVybWFy
ayIgc3R5bGU9InBvc2l0aW9uOiBmaXhlZDsgaW5zZXQ6IDBweDsgei1pbmRl
eDogOTk5OTk7IHBvaW50ZXItZXZlbnRzOiBub25lOyBiYWNrZ3JvdW5kOiB1
cmwoJ2Jsb2I6aHR0cHM6Ly9tYWlsLmt5bGlub3MuY24vNzkyMmZlNDEtYjBk
Yy00MThiLTgzYmEtZDE2N2M3YTE1ZjM3JykgcmVwZWF0OyI+Jm5ic3A7PC9k
aXY+PC9kaXY+

--nsmail-2sehhjxg31g8-2seldx9c2mft--
